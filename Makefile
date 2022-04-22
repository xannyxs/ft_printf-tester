# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: xvoorvaa <xvoorvaa@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2021/09/15 18:01:23 by xvoorvaa      #+#    #+#                  #
#    Updated: 2022/04/22 16:11:42 by xander        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME			=	test
CC				=	gcc
CFLAGS			=	-Wall -Wextra -Werror

OBJ_DIR			=	OBJ
FT_PRINTF_A		=	../libftprintf.a

FILES			=	test.c

SHELL			:=	/bin/bash
HEADERS			:=	-I ../INC
OBJS			:=	$(FILES:.c=.o)

PINK = \x1b[35;01m
BLUE = \x1b[34;01m
YELLOW = \x1b[33;01m
GREEN = \x1b[32;01m
RED = \x1b[31;01m
WHITE = \x1b[31;37m
RESET = \x1b[0m

START			=	"\n$(BLUE)---\nStarting...!\n---\n$(RESET)"
MESSAGE			=	"$(BLUE)---\nCompiling done! Run $(NAME)\n---\n$(RESET)"
COMP_MESSAGE	=	"$(GREEN)Building C object... $(RESET)%-33.33s\r\n"
REM_MESSAGE		=	"$(RED)Removing files...$(RESET)"

all:	$(NAME)

%.o: %.c
	@$(CC) -c $^ -o $@ $(CFLAGS) $(HEADERS)

$(FT_PRINTF_A):
	$(MAKE) -C ..

$(NAME): $(OBJS) $(FT_PRINTF_A)
	@$(CC) $(OBJS) -o $(NAME) $(FT_PRINTF_A)
	@printf $(MESSAGE)

clean:
	@printf $(REM_MESSAGE)
	@rm -rf $(OBJS)


fclean:		clean
	@rm -f $(NAME)
	@rm -rf $(NAME).dSYM

re:			fclean all

.PHONY:		all clean fclean re
