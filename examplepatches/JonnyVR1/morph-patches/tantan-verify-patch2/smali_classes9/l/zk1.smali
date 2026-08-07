.class public Ll/zk1;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(I)Ll/xk1;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->a8()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ll/zk1;->c(I)Ll/xk1$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/xk1$a;->u()Ll/xk1;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-static {}, Ll/xra;->w()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-static {p0}, Ll/zk1;->f(I)Ll/xk1$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ll/xk1$a;->u()Ll/xk1;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_1
    invoke-static {p0}, Ll/zk1;->c(I)Ll/xk1$a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/xk1$a;->u()Ll/xk1;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :cond_2
    invoke-static {p0}, Ll/zk1;->d(I)Ll/xk1$a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Ll/xk1$a;->u()Ll/xk1;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method

.method public static b()I
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->a8()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x6

    .line 10
    const/16 v2, 0x9

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Ll/xra;->q()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    return v2

    .line 21
    :cond_0
    return v1

    .line 22
    :cond_1
    invoke-static {}, Ll/xra;->w()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    return v2

    .line 29
    :cond_2
    return v1
.end method

.method public static c(I)Ll/xk1$a;
    .locals 12

    .line 1
    new-instance v0, Ll/xk1$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xk1$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sget v1, Ll/kbc0;->v1:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/xk1$a;->x(I)Ll/xk1$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    sget v1, Ll/kbc0;->s1:I

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget v1, Ll/kbc0;->q1:I

    .line 18
    .line 19
    :goto_0
    invoke-virtual {v0, v1}, Ll/xk1$a;->A(I)Ll/xk1$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Ll/uqb0;->R:Ll/s5m;

    .line 24
    .line 25
    invoke-interface {v1}, Ll/s5m;->c()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {v0, v1}, Ll/xk1$a;->w(Z)Ll/xk1$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/gsd;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/gsd;-><init>(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/xk1$a;->H(Ll/pp70;)Ll/xk1$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const/4 v1, 0x0

    .line 43
    const/4 v2, 0x1

    .line 44
    if-lez p0, :cond_1

    .line 45
    .line 46
    move v3, v2

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    move v3, v1

    .line 49
    :goto_1
    invoke-virtual {v0, v3}, Ll/xk1$a;->C(Z)Ll/xk1$a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    if-lez p0, :cond_2

    .line 54
    .line 55
    move v3, v2

    .line 56
    goto :goto_2

    .line 57
    :cond_2
    move v3, v1

    .line 58
    :goto_2
    invoke-virtual {v0, v3}, Ll/xk1$a;->B(Z)Ll/xk1$a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    if-nez p0, :cond_3

    .line 63
    .line 64
    const-string v3, "\u5c01\u9762"

    .line 65
    .line 66
    goto :goto_3

    .line 67
    :cond_3
    const/4 v3, 0x0

    .line 68
    :goto_3
    invoke-virtual {v0, v3}, Ll/xk1$a;->L(Ljava/lang/String;)Ll/xk1$a;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v3, Lcom/p1/mobile/putong/core/ui/profile/photo/b;

    .line 73
    .line 74
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/ui/profile/photo/b;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v3}, Ll/xk1$a;->z(Lcom/p1/mobile/putong/core/ui/profile/photo/a;)Ll/xk1$a;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    if-lez p0, :cond_4

    .line 82
    .line 83
    move v3, v2

    .line 84
    goto :goto_4

    .line 85
    :cond_4
    move v3, v1

    .line 86
    :goto_4
    invoke-virtual {v0, v3}, Ll/xk1$a;->y(Z)Ll/xk1$a;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0, v2}, Ll/xk1$a;->E(Z)Ll/xk1$a;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    sget-object v3, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;->AVATAR:Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 95
    .line 96
    invoke-virtual {v0, v3}, Ll/xk1$a;->M(Lcom/p1/mobile/putong/core/view/AvatarUpdateType;)Ll/xk1$a;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const-string v10, "\u6211\u7684\u53a8\u827a"

    .line 101
    .line 102
    const-string v11, "\u4efb\u610f\u751f\u6d3b\u7167"

    .line 103
    .line 104
    const-string v3, "\u771f\u5b9e\u7684\u6b63\u9762\u7167"

    .line 105
    .line 106
    const-string v4, "\u6237\u5916\u7167"

    .line 107
    .line 108
    const-string v5, "\u5168\u8eab\u7167"

    .line 109
    .line 110
    const-string v6, "\u5174\u8da3\u7231\u597d"

    .line 111
    .line 112
    const-string v7, "\u6211\u7684\u624d\u827a"

    .line 113
    .line 114
    const-string v8, "\u6211\u7684\u5ba0\u7269"

    .line 115
    .line 116
    const-string v9, "\u6e38\u620f\u6218\u7ee9"

    .line 117
    .line 118
    filled-new-array/range {v3 .. v11}, [Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    check-cast v3, Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v0, v3}, Ll/xk1$a;->K(Ljava/lang/String;)Ll/xk1$a;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    sget v3, Ll/kbc0;->y1:I

    .line 137
    .line 138
    invoke-virtual {v0, v3}, Ll/xk1$a;->J(I)Ll/xk1$a;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    const/4 v3, 0x6

    .line 143
    if-ge p0, v3, :cond_5

    .line 144
    .line 145
    move v3, v2

    .line 146
    goto :goto_5

    .line 147
    :cond_5
    move v3, v1

    .line 148
    :goto_5
    invoke-virtual {v0, v3}, Ll/xk1$a;->F(Z)Ll/xk1$a;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    if-eq p0, v2, :cond_6

    .line 153
    .line 154
    const/4 v3, 0x2

    .line 155
    if-ne p0, v3, :cond_7

    .line 156
    .line 157
    :cond_6
    move v1, v2

    .line 158
    :cond_7
    invoke-virtual {v0, v1}, Ll/xk1$a;->v(Z)Ll/xk1$a;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    return-object p0
.end method

.method public static d(I)Ll/xk1$a;
    .locals 10

    .line 1
    new-instance v0, Ll/xk1$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xk1$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sget v1, Ll/kbc0;->v1:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/xk1$a;->x(I)Ll/xk1$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/kbc0;->t:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/xk1$a;->A(I)Ll/xk1$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Ll/uqb0;->R:Ll/s5m;

    .line 19
    .line 20
    invoke-interface {v1}, Ll/s5m;->c()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Ll/xk1$a;->w(Z)Ll/xk1$a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/gsd;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/gsd;-><init>(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/xk1$a;->H(Ll/pp70;)Ll/xk1$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {v0, v1}, Ll/xk1$a;->C(Z)Ll/xk1$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0, v1}, Ll/xk1$a;->B(Z)Ll/xk1$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-nez p0, :cond_0

    .line 47
    .line 48
    const-string v2, "\u5c01\u9762"

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    const/4 v2, 0x0

    .line 52
    :goto_0
    invoke-virtual {v0, v2}, Ll/xk1$a;->L(Ljava/lang/String;)Ll/xk1$a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v2, Lcom/p1/mobile/putong/core/ui/profile/photo/c;

    .line 57
    .line 58
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/ui/profile/photo/c;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v2}, Ll/xk1$a;->z(Lcom/p1/mobile/putong/core/ui/profile/photo/a;)Ll/xk1$a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const/4 v2, 0x1

    .line 66
    invoke-virtual {v0, v2}, Ll/xk1$a;->y(Z)Ll/xk1$a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0, v1}, Ll/xk1$a;->E(Z)Ll/xk1$a;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    sget-object v3, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;->AVATAR:Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 75
    .line 76
    invoke-virtual {v0, v3}, Ll/xk1$a;->M(Lcom/p1/mobile/putong/core/view/AvatarUpdateType;)Ll/xk1$a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-string v7, "\u6700\u7231\u7684\u7f8e\u98df"

    .line 81
    .line 82
    const-string v8, "\u6211\u7684\u6709\u8da3\u89c6\u9891"

    .line 83
    .line 84
    const-string v3, "\u771f\u5b9e\u7684\u6b63\u9762\u7167"

    .line 85
    .line 86
    const-string v4, "\u6700\u597d\u770b\u7684\u65c5\u884c\u7167"

    .line 87
    .line 88
    const-string v5, "\u72ec\u4e00\u65e0\u4e8c\u7684\u624d\u827a"

    .line 89
    .line 90
    const-string v6, "\u6211\u7684\u5ba0\u7269\u6216\u751f\u6d3b\u7167"

    .line 91
    .line 92
    filled-new-array/range {v3 .. v8}, [Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    check-cast v3, Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v0, v3}, Ll/xk1$a;->K(Ljava/lang/String;)Ll/xk1$a;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 111
    .line 112
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 113
    .line 114
    invoke-virtual {v3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    if-eqz v3, :cond_1

    .line 123
    .line 124
    sget v3, Ll/kbc0;->b0:I

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_1
    sget v3, Ll/kbc0;->e0:I

    .line 128
    .line 129
    :goto_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    sget v3, Ll/kbc0;->f0:I

    .line 134
    .line 135
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    sget v3, Ll/kbc0;->i0:I

    .line 140
    .line 141
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 142
    .line 143
    .line 144
    move-result-object v6

    .line 145
    sget v3, Ll/kbc0;->d0:I

    .line 146
    .line 147
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 148
    .line 149
    .line 150
    move-result-object v7

    .line 151
    sget v3, Ll/kbc0;->c0:I

    .line 152
    .line 153
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 154
    .line 155
    .line 156
    move-result-object v8

    .line 157
    sget v3, Ll/kbc0;->h0:I

    .line 158
    .line 159
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 160
    .line 161
    .line 162
    move-result-object v9

    .line 163
    filled-new-array/range {v4 .. v9}, [Ljava/lang/Integer;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    check-cast p0, Ljava/lang/Integer;

    .line 176
    .line 177
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 178
    .line 179
    .line 180
    move-result p0

    .line 181
    invoke-virtual {v0, p0}, Ll/xk1$a;->J(I)Ll/xk1$a;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-virtual {p0, v2}, Ll/xk1$a;->F(Z)Ll/xk1$a;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-virtual {p0, v1}, Ll/xk1$a;->v(Z)Ll/xk1$a;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    return-object p0
.end method

.method public static e(I)Ll/xk1$a;
    .locals 12

    .line 1
    new-instance v0, Ll/xk1$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xk1$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sget v1, Ll/kbc0;->v1:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/xk1$a;->x(I)Ll/xk1$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/kbc0;->t:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/xk1$a;->A(I)Ll/xk1$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Ll/uqb0;->R:Ll/s5m;

    .line 19
    .line 20
    invoke-interface {v1}, Ll/s5m;->c()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Ll/xk1$a;->w(Z)Ll/xk1$a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/gsd;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/gsd;-><init>(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/xk1$a;->H(Ll/pp70;)Ll/xk1$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {v0, v1}, Ll/xk1$a;->C(Z)Ll/xk1$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0, v1}, Ll/xk1$a;->B(Z)Ll/xk1$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-nez p0, :cond_0

    .line 47
    .line 48
    const-string v2, "\u5c01\u9762"

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    const/4 v2, 0x0

    .line 52
    :goto_0
    invoke-virtual {v0, v2}, Ll/xk1$a;->L(Ljava/lang/String;)Ll/xk1$a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v2, Lcom/p1/mobile/putong/core/ui/profile/photo/d;

    .line 57
    .line 58
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/ui/profile/photo/d;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v2}, Ll/xk1$a;->z(Lcom/p1/mobile/putong/core/ui/profile/photo/a;)Ll/xk1$a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {}, Ll/xra;->q()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_2

    .line 70
    .line 71
    if-lez p0, :cond_1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    move v2, v1

    .line 75
    goto :goto_2

    .line 76
    :cond_2
    :goto_1
    const/4 v2, 0x1

    .line 77
    :goto_2
    invoke-virtual {v0, v2}, Ll/xk1$a;->y(Z)Ll/xk1$a;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {}, Ll/xra;->q()Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    invoke-virtual {v0, v2}, Ll/xk1$a;->E(Z)Ll/xk1$a;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sget-object v2, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;->AVATAR:Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Ll/xk1$a;->M(Lcom/p1/mobile/putong/core/view/AvatarUpdateType;)Ll/xk1$a;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-static {}, Ll/xra;->q()Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eqz v2, :cond_3

    .line 100
    .line 101
    const-string v2, "\u6211\u7684\u6709\u8da3\u7167\u7247"

    .line 102
    .line 103
    :goto_3
    move-object v8, v2

    .line 104
    goto :goto_4

    .line 105
    :cond_3
    const-string v2, "\u6211\u7684\u6709\u8da3\u89c6\u9891"

    .line 106
    .line 107
    goto :goto_3

    .line 108
    :goto_4
    const/4 v10, 0x0

    .line 109
    const/4 v11, 0x0

    .line 110
    const-string v3, "\u771f\u5b9e\u7684\u6b63\u9762\u7167"

    .line 111
    .line 112
    const-string v4, "\u6700\u597d\u770b\u7684\u65c5\u884c\u7167"

    .line 113
    .line 114
    const-string v5, "\u72ec\u4e00\u65e0\u4e8c\u7684\u624d\u827a"

    .line 115
    .line 116
    const-string v6, "\u6211\u7684\u5ba0\u7269\u6216\u751f\u6d3b\u7167"

    .line 117
    .line 118
    const-string v7, "\u6700\u7231\u7684\u7f8e\u98df"

    .line 119
    .line 120
    const/4 v9, 0x0

    .line 121
    filled-new-array/range {v3 .. v11}, [Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    check-cast v2, Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {v0, v2}, Ll/xk1$a;->K(Ljava/lang/String;)Ll/xk1$a;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 140
    .line 141
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 142
    .line 143
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    if-eqz v2, :cond_4

    .line 152
    .line 153
    sget v2, Ll/kbc0;->b0:I

    .line 154
    .line 155
    goto :goto_5

    .line 156
    :cond_4
    sget v2, Ll/kbc0;->e0:I

    .line 157
    .line 158
    :goto_5
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    sget v2, Ll/kbc0;->f0:I

    .line 163
    .line 164
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    sget v2, Ll/kbc0;->i0:I

    .line 169
    .line 170
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 171
    .line 172
    .line 173
    move-result-object v5

    .line 174
    sget v2, Ll/kbc0;->d0:I

    .line 175
    .line 176
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 177
    .line 178
    .line 179
    move-result-object v6

    .line 180
    sget v2, Ll/kbc0;->c0:I

    .line 181
    .line 182
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 183
    .line 184
    .line 185
    move-result-object v7

    .line 186
    sget v2, Ll/kbc0;->h0:I

    .line 187
    .line 188
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 189
    .line 190
    .line 191
    move-result-object v8

    .line 192
    sget v2, Ll/kbc0;->y1:I

    .line 193
    .line 194
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 195
    .line 196
    .line 197
    move-result-object v9

    .line 198
    sget v2, Ll/kbc0;->y1:I

    .line 199
    .line 200
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 201
    .line 202
    .line 203
    move-result-object v10

    .line 204
    sget v2, Ll/kbc0;->y1:I

    .line 205
    .line 206
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 207
    .line 208
    .line 209
    move-result-object v11

    .line 210
    filled-new-array/range {v3 .. v11}, [Ljava/lang/Integer;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    check-cast p0, Ljava/lang/Integer;

    .line 223
    .line 224
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 225
    .line 226
    .line 227
    move-result p0

    .line 228
    invoke-virtual {v0, p0}, Ll/xk1$a;->J(I)Ll/xk1$a;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    invoke-virtual {p0, v1}, Ll/xk1$a;->F(Z)Ll/xk1$a;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    invoke-virtual {p0, v1}, Ll/xk1$a;->v(Z)Ll/xk1$a;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    return-object p0
.end method

.method public static f(I)Ll/xk1$a;
    .locals 10

    .line 1
    invoke-static {p0}, Ll/zk1;->c(I)Ll/xk1$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/xk1$a;->G(Z)Ll/xk1$a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v1, Ll/kbc0;->A:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/xk1$a;->x(I)Ll/xk1$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Lcom/p1/mobile/putong/core/ui/profile/photo/e;

    .line 17
    .line 18
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/e;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/xk1$a;->z(Lcom/p1/mobile/putong/core/ui/profile/photo/a;)Ll/xk1$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    const-string v1, "\u9996\u56fe"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v1, 0x0

    .line 31
    :goto_0
    invoke-virtual {v0, v1}, Ll/xk1$a;->L(Ljava/lang/String;)Ll/xk1$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {v0, v1}, Ll/xk1$a;->A(I)Ll/xk1$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget v1, Ll/kbc0;->C:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/xk1$a;->I(I)Ll/xk1$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget v1, Ll/kbc0;->B:I

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ll/xk1$a;->D(I)Ll/xk1$a;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v8, "\u6211\u7684\u53a8\u827a"

    .line 53
    .line 54
    const-string v9, "\u4efb\u610f\u751f\u6d3b\u7167"

    .line 55
    .line 56
    const-string v1, "\u771f\u5b9e\u7684\u6b63\u9762\u7167"

    .line 57
    .line 58
    const-string v2, "\u6237\u5916\u7167"

    .line 59
    .line 60
    const-string v3, "\u5168\u8eab\u7167"

    .line 61
    .line 62
    const-string v4, "\u5174\u8da3\u7231\u597d"

    .line 63
    .line 64
    const-string v5, "\u6211\u7684\u624d\u827a"

    .line 65
    .line 66
    const-string v6, "\u6211\u7684\u5ba0\u7269"

    .line 67
    .line 68
    const-string v7, "\u6e38\u620f\u6218\u7ee9"

    .line 69
    .line 70
    filled-new-array/range {v1 .. v9}, [Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    check-cast p0, Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, p0}, Ll/xk1$a;->K(Ljava/lang/String;)Ll/xk1$a;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    sget v0, Ll/kbc0;->w:I

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Ll/xk1$a;->J(I)Ll/xk1$a;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0
.end method
