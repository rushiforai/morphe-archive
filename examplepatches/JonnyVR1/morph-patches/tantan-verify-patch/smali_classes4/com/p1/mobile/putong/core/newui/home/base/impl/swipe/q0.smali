.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;->y(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic q(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/tkh0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/tkh0;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic r(Ljava/lang/String;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 6
    .line 7
    invoke-virtual {v1, p0}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 12
    .line 13
    const-string v3, "local_long_time_no_see"

    .line 14
    .line 15
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    filled-new-array {v1, v2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 33
    .line 34
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->dh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Ll/uxj0;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_5

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 12
    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/16 v0, 0x2c

    .line 27
    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    invoke-static {}, Ll/gra;->F2()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    invoke-static {}, Ll/gra;->n3()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const-string v1, "long_time_no_see"

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/b240;->T4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p1, p0, v2, v1}, Ll/pdi;->b0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    invoke-static {}, Ll/gra;->j2()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_1

    .line 66
    .line 67
    invoke-static {}, Ll/wgx;->A()Ll/wgx;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/b240;->T4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p1, v0, p0, v2, v1}, Ll/wgx;->L(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 88
    .line 89
    invoke-virtual {p1}, Ll/b240;->T4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {p1, p0, v0}, Ll/pci;->K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;I)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 104
    .line 105
    invoke-virtual {p1}, Ll/b240;->T4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 110
    .line 111
    invoke-virtual {v1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 116
    .line 117
    filled-new-array {v1}, [Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-static {}, Ll/gra;->S1()Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    const/4 v3, 0x0

    .line 130
    if-nez v2, :cond_4

    .line 131
    .line 132
    invoke-static {}, Ll/gra;->j2()Z

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    if-eqz v2, :cond_3

    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_3
    move-object v2, v3

    .line 140
    goto :goto_1

    .line 141
    :cond_4
    :goto_0
    const-string v2, "tmp_from_home_swipe"

    .line 142
    .line 143
    :goto_1
    invoke-static {p1, v1, v0, v3, v2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->q2()Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    new-instance v0, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 154
    .line 155
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Frag;->w4(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 159
    .line 160
    .line 161
    :cond_5
    return-void
.end method

.method public static synthetic t(Ljava/lang/String;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic u(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;Lcom/p1/mobile/putong/core/data/Conversation;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;->x(Lcom/p1/mobile/putong/core/data/Conversation;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->meetAgain:Z

    .line 8
    .line 9
    return p0
.end method

.method public final B(Ljava/lang/String;)V
    .locals 0

    .line 1
    new-instance p0, Ll/skh0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/skh0;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;->w(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;->A(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public w(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0$a;->a:[I

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_2

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->disableUndo:Z

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 34
    .line 35
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 42
    .line 43
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/d;->i()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Q8(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ILcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 53
    .line 54
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 57
    .line 58
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 59
    .line 60
    invoke-virtual {v2}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a()Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->u8(Lcom/p1/mobile/putong/data/User;Z)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    new-instance v2, Ll/nkh0;

    .line 73
    .line 74
    invoke-direct {v2, p0, p1}, Ll/nkh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1, v2}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Ll/okh0;

    .line 86
    .line 87
    invoke-direct {v1, p1}, Ll/okh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 88
    .line 89
    .line 90
    new-instance v2, Ll/pkh0;

    .line 91
    .line 92
    invoke-direct {v2}, Ll/pkh0;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;->z(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 103
    .line 104
    .line 105
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 106
    .line 107
    return-object p0

    .line 108
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 109
    .line 110
    return-object p0
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/core/data/Conversation;)Ll/uxj0;
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 30
    .line 31
    const-string v1, "liked"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 52
    .line 53
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->swipedTime:D

    .line 54
    .line 55
    double-to-long v2, v2

    .line 56
    invoke-virtual {v0, v1, v2, v3}, Ll/n46;->p(Ljava/lang/String;J)V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 62
    .line 63
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->autoSendMessage:Z

    .line 64
    .line 65
    if-nez v0, :cond_1

    .line 66
    .line 67
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;->B(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 73
    .line 74
    return-object p0
.end method

.method public final synthetic y(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Ll/uxj0;)Lrx/c;
    .locals 1

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 16
    .line 17
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v0, Ll/qkh0;

    .line 31
    .line 32
    invoke-direct {v0, p2}, Ll/qkh0;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance p2, Ll/rkh0;

    .line 40
    .line 41
    invoke-direct {p2, p0}, Ll/rkh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public final z(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 7

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ik4;->g()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "moments_user_id"

    .line 8
    .line 9
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string p0, "card_name"

    .line 14
    .line 15
    const-string v0, "normal_card"

    .line 16
    .line 17
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 24
    .line 25
    if-ne p0, v0, :cond_0

    .line 26
    .line 27
    const-string p0, "like"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string p0, "dislike"

    .line 31
    .line 32
    :goto_0
    const-string v0, "direction"

    .line 33
    .line 34
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const-string p0, "card_order"

    .line 39
    .line 40
    const-string v0, ""

    .line 41
    .line 42
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    const/4 p0, 0x1

    .line 47
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v0, "is_show_longtimenosee_tag"

    .line 52
    .line 53
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "swipe_directions"

    .line 64
    .line 65
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    filled-new-array/range {v1 .. v6}, [Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const-string p1, "e_card"

    .line 74
    .line 75
    const-string v0, "p_suggest_users_home_view"

    .line 76
    .line 77
    invoke-static {p1, v0, p0}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method
