.class public Ll/gui0;
.super Ll/cui0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cui0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/sfh0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gui0;->h(Ll/sfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    check-cast p1, Ll/sfh0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gui0;->i(Ll/sfh0$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h(Ll/sfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 9

    .line 1
    iget-object v0, p1, Ll/sfh0$a;->c:Ll/ik4;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v4

    .line 7
    iget-object v0, p1, Ll/sfh0$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    move v3, v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    move v3, v0

    .line 18
    :goto_0
    new-instance v5, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p1, Ll/sfh0$a;->a:Ll/tel;

    .line 24
    .line 25
    iget-boolean v0, v0, Ll/tel;->g:Z

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    sget-object v0, Ll/tel;->I:Ljava/lang/String;

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    sget-object v0, Ll/tel;->J:Ljava/lang/String;

    .line 33
    .line 34
    :goto_1
    const-string v6, "sourcepage"

    .line 35
    .line 36
    invoke-interface {v5, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    iget-boolean v0, p1, Ll/sfh0$a;->e:Z

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    sget-object v0, Ll/tel;->K:Ljava/lang/String;

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_2
    sget-object v0, Ll/tel;->L:Ljava/lang/String;

    .line 47
    .line 48
    :goto_2
    const-string v6, "actiontype"

    .line 49
    .line 50
    invoke-interface {v5, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    iget-object v0, p1, Ll/sfh0$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 54
    .line 55
    if-ne v0, v1, :cond_3

    .line 56
    .line 57
    const-string v0, "superlike"

    .line 58
    .line 59
    goto :goto_3

    .line 60
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 61
    .line 62
    if-ne v0, v1, :cond_4

    .line 63
    .line 64
    const-string v0, "like"

    .line 65
    .line 66
    goto :goto_3

    .line 67
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 68
    .line 69
    if-ne v0, v1, :cond_5

    .line 70
    .line 71
    const-string v0, "dislike"

    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_5
    const-string v0, ""

    .line 75
    .line 76
    :goto_3
    iget-object v1, p1, Ll/sfh0$a;->c:Ll/ik4;

    .line 77
    .line 78
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_6

    .line 83
    .line 84
    iget-object v1, p1, Ll/sfh0$a;->c:Ll/ik4;

    .line 85
    .line 86
    invoke-virtual {v1}, Ll/ik4;->b()Ll/ik4$a;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-eqz v1, :cond_6

    .line 95
    .line 96
    iget-object v1, p1, Ll/sfh0$a;->c:Ll/ik4;

    .line 97
    .line 98
    invoke-virtual {v1}, Ll/ik4;->b()Ll/ik4$a;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iget-object v1, v1, Ll/ik4$a;->a:Lrx/subjects/a;

    .line 103
    .line 104
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-eqz v1, :cond_6

    .line 109
    .line 110
    iget-object v1, p1, Ll/sfh0$a;->c:Ll/ik4;

    .line 111
    .line 112
    invoke-virtual {v1}, Ll/ik4;->b()Ll/ik4$a;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    iget-object v1, v1, Ll/ik4$a;->a:Lrx/subjects/a;

    .line 117
    .line 118
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    check-cast v1, Ljava/lang/Boolean;

    .line 123
    .line 124
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    xor-int/2addr v2, v1

    .line 129
    :cond_6
    iget-boolean v1, p1, Ll/sfh0$a;->e:Z

    .line 130
    .line 131
    if-eqz v1, :cond_7

    .line 132
    .line 133
    sget-object v1, Ll/tel;->K:Ljava/lang/String;

    .line 134
    .line 135
    goto :goto_4

    .line 136
    :cond_7
    sget-object v1, Ll/tel;->L:Ljava/lang/String;

    .line 137
    .line 138
    :goto_4
    invoke-static {v6, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    const-string v6, "actionname"

    .line 143
    .line 144
    invoke-static {v6, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    const-string v6, "IsWhiteBlock"

    .line 149
    .line 150
    invoke-static {v6, v2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-static {}, Ll/eui0;->b()Ll/sfj0$a;

    .line 155
    .line 156
    .line 157
    move-result-object v6

    .line 158
    filled-new-array {v1, v0, v2, v6}, [Ll/sfj0$a;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    const-string v1, "e_swipeaction"

    .line 163
    .line 164
    const-string v2, "p_activity_momentcard_view"

    .line 165
    .line 166
    invoke-static {v1, v2, v0}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0, p1}, Ll/cui0;->g(Ll/sfh0$a;)Z

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    iget-boolean v6, p1, Ll/sfh0$a;->e:Z

    .line 174
    .line 175
    iget-object v0, p1, Ll/sfh0$a;->a:Ll/tel;

    .line 176
    .line 177
    iget-boolean v7, v0, Ll/tel;->g:Z

    .line 178
    .line 179
    move-object v1, p0

    .line 180
    move-object v8, p1

    .line 181
    invoke-virtual/range {v1 .. v8}, Ll/cui0;->f(ZZLcom/p1/mobile/putong/data/User;Ljava/util/Map;ZZLl/sfh0$a;)V

    .line 182
    .line 183
    .line 184
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 185
    .line 186
    return-object p0
.end method

.method public i(Ll/sfh0$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
