.class public Ll/ey6;
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

.method public static a(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 1

    .line 1
    invoke-static {p0}, Ll/ey6;->c(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/bsj0;->E(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 8
    .line 9
    .line 10
    :cond_0
    return-object p0
.end method

.method public static b(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/ey6;->c(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static c(Ljava/lang/Throwable;)Z
    .locals 6

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$ServerException;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    move-object v3, p0

    .line 13
    check-cast v3, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 14
    .line 15
    invoke-static {v3}, Ll/ey6;->f(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_2

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    instance-of p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 38
    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->aj:I

    .line 43
    .line 44
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 45
    .line 46
    .line 47
    :goto_0
    return v2

    .line 48
    :cond_2
    if-eqz v0, :cond_3

    .line 49
    .line 50
    move-object v3, p0

    .line 51
    check-cast v3, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 52
    .line 53
    invoke-static {v3}, Ll/ey6;->d(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-eqz v3, :cond_3

    .line 58
    .line 59
    sget p0, Lcom/p1/mobile/putong/common/R$string;->V0:I

    .line 60
    .line 61
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 62
    .line 63
    .line 64
    return v2

    .line 65
    :cond_3
    if-eqz v0, :cond_4

    .line 66
    .line 67
    move-object v3, p0

    .line 68
    check-cast v3, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 69
    .line 70
    invoke-static {v3}, Ll/ey6;->g(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eqz v3, :cond_4

    .line 75
    .line 76
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Zi:I

    .line 77
    .line 78
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 79
    .line 80
    .line 81
    return v2

    .line 82
    :cond_4
    if-eqz v0, :cond_5

    .line 83
    .line 84
    move-object v3, p0

    .line 85
    check-cast v3, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 86
    .line 87
    invoke-static {v3}, Ll/ey6;->l(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    if-eqz v3, :cond_5

    .line 92
    .line 93
    sget p0, Lcom/p1/mobile/putong/core/R$string;->mp:I

    .line 94
    .line 95
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 96
    .line 97
    .line 98
    return v2

    .line 99
    :cond_5
    if-eqz v0, :cond_d

    .line 100
    .line 101
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isIdCardAuthing()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_6

    .line 108
    .line 109
    const-string v0, "\u8ba4\u8bc1\u4fe1\u606f\u5ba1\u6838\u4e2d\uff0c\u5ba1\u6838\u7ed3\u679c\u5c06\u901a\u8fc7\u63a2\u63a2\u5c0f\u52a9\u624b\u53d1\u9001\u7ed9\u60a8\uff0c\u8bf7\u8010\u5fc3\u7b49\u5f85\u3002"

    .line 110
    .line 111
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_6
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 115
    .line 116
    const v1, 0x9dcf

    .line 117
    .line 118
    .line 119
    const v3, 0x9d8b

    .line 120
    .line 121
    .line 122
    const v4, 0x9d8a

    .line 123
    .line 124
    .line 125
    if-eq v0, v4, :cond_7

    .line 126
    .line 127
    if-eq v0, v3, :cond_7

    .line 128
    .line 129
    const v5, 0x9d8c

    .line 130
    .line 131
    .line 132
    if-eq v0, v5, :cond_7

    .line 133
    .line 134
    const v5, 0x9d8d

    .line 135
    .line 136
    .line 137
    if-eq v0, v5, :cond_7

    .line 138
    .line 139
    if-ne v0, v1, :cond_c

    .line 140
    .line 141
    :cond_7
    iget-boolean v5, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->hasHandle:Z

    .line 142
    .line 143
    if-nez v5, :cond_8

    .line 144
    .line 145
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 146
    .line 147
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 148
    .line 149
    invoke-virtual {v5, v0}, Lcom/p1/mobile/putong/core/api/e;->T8(I)V

    .line 150
    .line 151
    .line 152
    :cond_8
    if-ne v0, v1, :cond_9

    .line 153
    .line 154
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 155
    .line 156
    iget-boolean v1, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->hasHandle:Z

    .line 157
    .line 158
    if-nez v1, :cond_b

    .line 159
    .line 160
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-nez v1, :cond_b

    .line 165
    .line 166
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_9
    if-ne v0, v3, :cond_a

    .line 171
    .line 172
    iget-boolean v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->hasHandle:Z

    .line 173
    .line 174
    if-nez v0, :cond_b

    .line 175
    .line 176
    sget v0, Lcom/p1/mobile/putong/core/R$string;->u1:I

    .line 177
    .line 178
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 179
    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_a
    if-ne v0, v4, :cond_b

    .line 183
    .line 184
    iget-boolean v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->hasHandle:Z

    .line 185
    .line 186
    if-nez v0, :cond_b

    .line 187
    .line 188
    sget v0, Lcom/p1/mobile/putong/core/R$string;->A1:I

    .line 189
    .line 190
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 191
    .line 192
    .line 193
    :cond_b
    :goto_1
    iput-boolean v2, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->hasHandle:Z

    .line 194
    .line 195
    :cond_c
    return v2

    .line 196
    :cond_d
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 197
    .line 198
    if-eqz v0, :cond_10

    .line 199
    .line 200
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 201
    .line 202
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 203
    .line 204
    const v3, 0x9ca3

    .line 205
    .line 206
    .line 207
    if-ne v0, v3, :cond_e

    .line 208
    .line 209
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Ma:I

    .line 210
    .line 211
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 212
    .line 213
    .line 214
    return v2

    .line 215
    :cond_e
    const v2, 0x9c69

    .line 216
    .line 217
    .line 218
    if-ne v0, v2, :cond_f

    .line 219
    .line 220
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E()Z

    .line 229
    .line 230
    .line 231
    move-result p0

    .line 232
    if-eqz p0, :cond_10

    .line 233
    .line 234
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 235
    .line 236
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 237
    .line 238
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/api/e;->T8(I)V

    .line 239
    .line 240
    .line 241
    return v1

    .line 242
    :cond_f
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->subCode:I

    .line 243
    .line 244
    const v0, 0xab7d

    .line 245
    .line 246
    .line 247
    if-ne p0, v0, :cond_10

    .line 248
    .line 249
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 250
    .line 251
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 252
    .line 253
    invoke-virtual {p0}, Ll/m27;->V3()Lrx/c;

    .line 254
    .line 255
    .line 256
    :cond_10
    return v1
.end method

.method public static d(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d6d

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public static e(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Ll/ey6;->f(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p0}, Ll/ey6;->g(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public static f(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d8e

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public static g(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d8f

    .line 4
    .line 5
    .line 6
    if-eq p0, v0, :cond_1

    .line 7
    .line 8
    const v0, 0x9d90

    .line 9
    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public static h(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d89

    .line 4
    .line 5
    .line 6
    if-eq p0, v0, :cond_1

    .line 7
    .line 8
    const v0, 0x9d8a

    .line 9
    .line 10
    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    const v0, 0x9d8b

    .line 14
    .line 15
    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const v0, 0x9d8c

    .line 19
    .line 20
    .line 21
    if-eq p0, v0, :cond_1

    .line 22
    .line 23
    const v0, 0x9dcf

    .line 24
    .line 25
    .line 26
    if-eq p0, v0, :cond_1

    .line 27
    .line 28
    const v0, 0x9d8d

    .line 29
    .line 30
    .line 31
    if-ne p0, v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public static i(I)Z
    .locals 1

    .line 1
    const v0, 0x9c69

    .line 2
    .line 3
    .line 4
    if-ne v0, p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public static j(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d79

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public static k(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d86

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public static l(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d88

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method
