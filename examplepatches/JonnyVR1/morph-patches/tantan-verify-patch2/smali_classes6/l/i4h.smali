.class public Ll/i4h;
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

.method public static synthetic a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/i4h;->k(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/orb0;->I()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {p0}, Ll/i4h;->k(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static c(I)Ljava/lang/String;
    .locals 1

    .line 1
    const v0, 0x9c7c

    .line 2
    .line 3
    .line 4
    if-eq p0, v0, :cond_2

    .line 5
    .line 6
    const v0, 0x9c7f

    .line 7
    .line 8
    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    const v0, 0x9c9b

    .line 12
    .line 13
    .line 14
    if-eq p0, v0, :cond_0

    .line 15
    .line 16
    packed-switch p0, :pswitch_data_0

    .line 17
    .line 18
    .line 19
    packed-switch p0, :pswitch_data_1

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    goto :goto_0

    .line 24
    :pswitch_0
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->W:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :pswitch_1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->R:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :pswitch_2
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->b0:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :pswitch_3
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->X:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :pswitch_4
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->a0:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :pswitch_5
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->Y:I

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :pswitch_6
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->i3:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :pswitch_7
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->c0:I

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :pswitch_8
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->Z:I

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :pswitch_9
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->a5:I

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :pswitch_a
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->V:I

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :pswitch_b
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->b5:I

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    :pswitch_c
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->S:I

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->Q:I

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->l5:I

    .line 67
    .line 68
    :goto_0
    if-nez p0, :cond_3

    .line 69
    .line 70
    const/4 p0, 0x0

    .line 71
    return-object p0

    .line 72
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0

    .line 83
    :pswitch_data_0
    .packed-switch 0x9c47
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch

    .line 84
    .line 85
    .line 86
    .line 87
    :pswitch_data_1
    .packed-switch 0x9c52
        :pswitch_2
        :pswitch_1
        :pswitch_c
        :pswitch_0
    .end packed-switch
.end method

.method public static d(Ljava/lang/Throwable;)Z
    .locals 4

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    goto/16 :goto_1

    .line 7
    .line 8
    :cond_0
    instance-of v0, p0, Ljava/io/IOException;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->U:I

    .line 13
    .line 14
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 15
    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 20
    .line 21
    if-eqz v0, :cond_4

    .line 22
    .line 23
    move-object v0, p0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 25
    .line 26
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 27
    .line 28
    const v2, 0x9c40

    .line 29
    .line 30
    .line 31
    if-ne v0, v2, :cond_2

    .line 32
    .line 33
    invoke-static {p0}, Ll/i4h;->k(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    goto/16 :goto_1

    .line 37
    .line 38
    :cond_2
    invoke-static {v0}, Ll/i4h;->c(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-nez v0, :cond_3

    .line 43
    .line 44
    invoke-static {p0}, Ll/i4h;->l(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p0}, Ll/i4h;->k(Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    goto/16 :goto_1

    .line 51
    .line 52
    :cond_3
    invoke-static {v0, v1}, Ll/o1j0;->k(Ljava/lang/String;Z)V

    .line 53
    .line 54
    .line 55
    goto/16 :goto_1

    .line 56
    .line 57
    :cond_4
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 58
    .line 59
    if-eqz v0, :cond_5

    .line 60
    .line 61
    move-object v0, p0

    .line 62
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 63
    .line 64
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 65
    .line 66
    invoke-static {v0, p0}, Ll/i4h;->f(ILjava/lang/Throwable;)V

    .line 67
    .line 68
    .line 69
    goto/16 :goto_1

    .line 70
    .line 71
    :cond_5
    instance-of v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$PlatformNotFoundException;

    .line 72
    .line 73
    if-eqz v0, :cond_6

    .line 74
    .line 75
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->X4:I

    .line 76
    .line 77
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 78
    .line 79
    .line 80
    goto/16 :goto_1

    .line 81
    .line 82
    :cond_6
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 83
    .line 84
    if-eqz v0, :cond_7

    .line 85
    .line 86
    move-object v2, p0

    .line 87
    check-cast v2, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 88
    .line 89
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isBlocked()Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_7

    .line 94
    .line 95
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->r4:I

    .line 96
    .line 97
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 98
    .line 99
    .line 100
    goto/16 :goto_1

    .line 101
    .line 102
    :cond_7
    const/4 v2, 0x0

    .line 103
    if-eqz v0, :cond_14

    .line 104
    .line 105
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 106
    .line 107
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 108
    .line 109
    const v3, 0x9d95

    .line 110
    .line 111
    .line 112
    if-ne v0, v3, :cond_8

    .line 113
    .line 114
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->T2:I

    .line 115
    .line 116
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 117
    .line 118
    .line 119
    goto/16 :goto_1

    .line 120
    .line 121
    :cond_8
    const v3, 0x9d94

    .line 122
    .line 123
    .line 124
    if-ne v0, v3, :cond_9

    .line 125
    .line 126
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->S2:I

    .line 127
    .line 128
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 129
    .line 130
    .line 131
    goto/16 :goto_1

    .line 132
    .line 133
    :cond_9
    const v3, 0xa046

    .line 134
    .line 135
    .line 136
    if-ne v0, v3, :cond_a

    .line 137
    .line 138
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q:I

    .line 139
    .line 140
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 141
    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_a
    const v3, 0x9d73

    .line 145
    .line 146
    .line 147
    if-ne v0, v3, :cond_b

    .line 148
    .line 149
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->N0:I

    .line 150
    .line 151
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 152
    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_b
    invoke-static {v0}, Ll/jre0;->a(I)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_c

    .line 160
    .line 161
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->V0:I

    .line 162
    .line 163
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 164
    .line 165
    .line 166
    goto :goto_1

    .line 167
    :cond_c
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 168
    .line 169
    invoke-static {v0}, Ll/jre0;->b(I)Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-eqz v0, :cond_d

    .line 174
    .line 175
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->l0:I

    .line 176
    .line 177
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 178
    .line 179
    .line 180
    goto :goto_1

    .line 181
    :cond_d
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 182
    .line 183
    const/16 v0, 0x193

    .line 184
    .line 185
    if-eq p0, v0, :cond_13

    .line 186
    .line 187
    const v0, 0x9d7a

    .line 188
    .line 189
    .line 190
    if-ne p0, v0, :cond_e

    .line 191
    .line 192
    goto :goto_0

    .line 193
    :cond_e
    const v0, 0x9d85

    .line 194
    .line 195
    .line 196
    if-ne p0, v0, :cond_f

    .line 197
    .line 198
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->W2:I

    .line 199
    .line 200
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 201
    .line 202
    .line 203
    goto :goto_1

    .line 204
    :cond_f
    const v0, 0x9da8

    .line 205
    .line 206
    .line 207
    if-ne p0, v0, :cond_10

    .line 208
    .line 209
    const-string p0, "\u65e0\u6cd5\u521b\u5efa\u6b64\u8bdd\u9898"

    .line 210
    .line 211
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    goto :goto_1

    .line 215
    :cond_10
    const v0, 0x9da9

    .line 216
    .line 217
    .line 218
    if-ne p0, v0, :cond_11

    .line 219
    .line 220
    const-string p0, "\u4eca\u65e5\u521b\u5efa\u8bdd\u9898\u6570\u5df2\u8fbe\u4e0a\u9650"

    .line 221
    .line 222
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    goto :goto_1

    .line 226
    :cond_11
    const v0, 0x9dac

    .line 227
    .line 228
    .line 229
    if-ne p0, v0, :cond_12

    .line 230
    .line 231
    const-string p0, "\u8f6c\u53d1\u5931\u8d25"

    .line 232
    .line 233
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    goto :goto_1

    .line 237
    :cond_12
    return v2

    .line 238
    :cond_13
    :goto_0
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->b1:I

    .line 239
    .line 240
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 241
    .line 242
    .line 243
    :goto_1
    return v1

    .line 244
    :cond_14
    return v2
.end method

.method public static e(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move-object v0, p0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 13
    .line 14
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 15
    .line 16
    const v1, 0x9dae

    .line 17
    .line 18
    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    :try_start_0
    invoke-static {p0}, Ll/i4h;->d(Ljava/lang/Throwable;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    instance-of p0, p0, Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;

    .line 29
    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->r3:I

    .line 33
    .line 34
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->I3:I

    .line 39
    .line 40
    invoke-static {p0}, Ll/o1j0;->w(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    :cond_2
    :goto_0
    return-void

    .line 44
    :catch_0
    move-exception p0

    .line 45
    invoke-static {p0}, Ll/i4h;->l(Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->I3:I

    .line 49
    .line 50
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static f(ILjava/lang/Throwable;)V
    .locals 2

    .line 1
    const v0, 0x9c6a

    .line 2
    .line 3
    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->R4:I

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const v0, 0x9c69

    .line 13
    .line 14
    .line 15
    if-ne p0, v0, :cond_2

    .line 16
    .line 17
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-static {}, Ll/orb0;->I()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-static {}, Ll/vqb0;->a()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0}, Ll/mrb0;->M(Ljava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance v0, Ll/g4h;

    .line 40
    .line 41
    invoke-direct {v0, p1}, Ll/g4h;-><init>(Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    new-instance v1, Ll/h4h;

    .line 45
    .line 46
    invoke-direct {v1, p1}, Ll/h4h;-><init>(Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    const v0, 0xa410

    .line 58
    .line 59
    .line 60
    if-ne p0, v0, :cond_3

    .line 61
    .line 62
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->V2:I

    .line 63
    .line 64
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    const v0, 0x9ca3

    .line 69
    .line 70
    .line 71
    if-ne p0, v0, :cond_4

    .line 72
    .line 73
    const-string p0, "\u60a8\u8f93\u5165\u7684\u5185\u5bb9\u8fdd\u89c4\uff0c\u8bf7\u4fee\u6539"

    .line 74
    .line 75
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    if-nez p0, :cond_5

    .line 84
    .line 85
    invoke-static {p1}, Ll/i4h;->l(Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    invoke-static {p1}, Ll/i4h;->k(Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_5
    const/4 p1, 0x1

    .line 93
    invoke-static {p0, p1}, Ll/o1j0;->k(Ljava/lang/String;Z)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public static g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/i4h;->j(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static h(Ljava/lang/Throwable;Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/i4h;->d(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string p0, "\u5173\u6ce8\u5931\u8d25"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p0, "\u53d6\u6d88\u5173\u6ce8\u5931\u8d25"

    .line 13
    .line 14
    :goto_0
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public static i(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/i4h;->d(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u8f6c\u53d1\u5931\u8d25"

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static j(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-static {p0}, Ll/i4h;->d(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/i4h;->k(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return-void

    .line 14
    :goto_0
    invoke-static {v0}, Ll/i4h;->l(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p0}, Ll/i4h;->k(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static k(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->d0:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static l(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/16 v0, 0x32

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
