.class public Ll/nsh0;
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

.method public static varargs a(Ljava/lang/String;[Ljava/lang/String;)Ll/nyv;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    array-length v1, p1

    .line 7
    const/4 v2, 0x0

    .line 8
    :goto_0
    if-ge v2, v1, :cond_0

    .line 9
    .line 10
    aget-object v3, p1, v2

    .line 11
    .line 12
    invoke-static {v3}, Ll/nsh0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    add-int/lit8 v2, v2, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance p1, Ll/nyv;

    .line 23
    .line 24
    invoke-direct {p1}, Ll/nyv;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p0, p1, Ll/nyv;->b:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iput-object p0, p1, Ll/nyv;->c:Ljava/lang/String;

    .line 34
    .line 35
    return-object p1
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "["

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p0, "]"

    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :cond_0
    return-object p0
.end method

.method public static c(Landroid/app/Application;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static d(Landroid/app/Application;Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;Ll/x4m;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/osh0$a;->y()Ll/osh0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Ll/nsh0;->c(Landroid/app/Application;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v3, "liveTrace"

    .line 23
    .line 24
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v4, "cache"

    .line 31
    .line 32
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ll/osh0$a;->z(Ljava/lang/String;)Ll/osh0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {p0}, Ll/nsh0;->c(Landroid/app/Application;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p0, "report"

    .line 65
    .line 66
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v0, p0}, Ll/osh0$a;->H(Ljava/lang/String;)Ll/osh0$a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    sget-object v1, Ll/qv5;->C:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v1, "/v2/live/realtime/logs"

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p0, v0}, Ll/osh0$a;->J(Ljava/lang/String;)Ll/osh0$a;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    const-string v0, "/live/realtime/client-monitor/logs"

    .line 101
    .line 102
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {p0, v0}, Ll/osh0$a;->I(Ljava/lang/String;)Ll/osh0$a;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    const/16 v0, 0x2bc

    .line 111
    .line 112
    invoke-virtual {p0, v0}, Ll/osh0$a;->L(I)Ll/osh0$a;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    if-eqz p1, :cond_0

    .line 117
    .line 118
    iget v0, p1, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->logWriteWindowTime:I

    .line 119
    .line 120
    if-lez v0, :cond_0

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_0
    const/16 v0, 0x3c

    .line 124
    .line 125
    :goto_0
    invoke-virtual {p0, v0}, Ll/osh0$a;->O(I)Ll/osh0$a;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    if-eqz p1, :cond_1

    .line 130
    .line 131
    iget v0, p1, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->unitIntervalMaxRow:I

    .line 132
    .line 133
    if-lez v0, :cond_1

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_1
    const/16 v0, 0x1f4

    .line 137
    .line 138
    :goto_1
    invoke-virtual {p0, v0}, Ll/osh0$a;->N(I)Ll/osh0$a;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    if-eqz p1, :cond_2

    .line 143
    .line 144
    iget v0, p1, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->logFileMaxSize:I

    .line 145
    .line 146
    if-lez v0, :cond_2

    .line 147
    .line 148
    int-to-long v0, v0

    .line 149
    const-wide/16 v2, 0x400

    .line 150
    .line 151
    mul-long/2addr v0, v2

    .line 152
    goto :goto_2

    .line 153
    :cond_2
    const-wide/32 v0, 0x32000

    .line 154
    .line 155
    .line 156
    :goto_2
    invoke-virtual {p0, v0, v1}, Ll/osh0$a;->M(J)Ll/osh0$a;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    const/4 v0, 0x0

    .line 161
    invoke-virtual {p0, v0}, Ll/osh0$a;->A(Z)Ll/osh0$a;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    const/4 v1, 0x1

    .line 166
    if-eqz p1, :cond_3

    .line 167
    .line 168
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->openPkLog:Z

    .line 169
    .line 170
    if-eqz v2, :cond_3

    .line 171
    .line 172
    move v2, v1

    .line 173
    goto :goto_3

    .line 174
    :cond_3
    move v2, v0

    .line 175
    :goto_3
    invoke-virtual {p0, v2}, Ll/osh0$a;->F(Z)Ll/osh0$a;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    if-eqz p1, :cond_4

    .line 180
    .line 181
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->openMutliCallLog:Z

    .line 182
    .line 183
    if-eqz v2, :cond_4

    .line 184
    .line 185
    move v2, v1

    .line 186
    goto :goto_4

    .line 187
    :cond_4
    move v2, v0

    .line 188
    :goto_4
    invoke-virtual {p0, v2}, Ll/osh0$a;->D(Z)Ll/osh0$a;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    if-eqz p1, :cond_5

    .line 193
    .line 194
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->delExpireLogEnable:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$ExpireLogEnable;

    .line 195
    .line 196
    iget-boolean v2, v2, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$ExpireLogEnable;->on:Z

    .line 197
    .line 198
    if-eqz v2, :cond_5

    .line 199
    .line 200
    move v0, v1

    .line 201
    :cond_5
    invoke-virtual {p0, v0}, Ll/osh0$a;->B(Z)Ll/osh0$a;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    if-eqz p1, :cond_6

    .line 206
    .line 207
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->delExpireLogEnable:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$ExpireLogEnable;

    .line 208
    .line 209
    iget v0, v0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$ExpireLogEnable;->expireTime:I

    .line 210
    .line 211
    goto :goto_5

    .line 212
    :cond_6
    const/4 v0, 0x7

    .line 213
    :goto_5
    invoke-virtual {p0, v0}, Ll/osh0$a;->C(I)Ll/osh0$a;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    new-instance v0, Ll/hzv;

    .line 218
    .line 219
    invoke-direct {v0}, Ll/hzv;-><init>()V

    .line 220
    .line 221
    .line 222
    invoke-virtual {p0, v0}, Ll/osh0$a;->w(Ll/a1j0;)Ll/osh0$a;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    new-instance v0, Ll/e9j;

    .line 227
    .line 228
    invoke-direct {v0}, Ll/e9j;-><init>()V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0, v0}, Ll/osh0$a;->w(Ll/a1j0;)Ll/osh0$a;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    new-instance v0, Ll/xyv;

    .line 236
    .line 237
    invoke-direct {v0}, Ll/xyv;-><init>()V

    .line 238
    .line 239
    .line 240
    invoke-virtual {p0, v0}, Ll/osh0$a;->v(Ll/z0j0;)Ll/osh0$a;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    invoke-virtual {p0, p2}, Ll/osh0$a;->K(Ll/x4m;)Ll/osh0$a;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    iget-boolean p2, p1, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->liveLogOn:Z

    .line 249
    .line 250
    invoke-virtual {p0, p2}, Ll/osh0$a;->E(Z)Ll/osh0$a;

    .line 251
    .line 252
    .line 253
    move-result-object p0

    .line 254
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->quickChatLogOn:Z

    .line 255
    .line 256
    invoke-virtual {p0, p1}, Ll/osh0$a;->G(Z)Ll/osh0$a;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    invoke-virtual {p0}, Ll/osh0$a;->x()Ll/osh0;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    invoke-static {p0}, Ll/nsh0;->e(Ll/osh0;)V

    .line 265
    .line 266
    .line 267
    return-void
.end method

.method public static e(Ll/osh0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/msh0;->i(Ll/osh0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static varargs f(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p0, p1}, Ll/nsh0;->a(Ljava/lang/String;[Ljava/lang/String;)Ll/nyv;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Ll/msh0;->m(Ll/nyv;)V

    .line 13
    .line 14
    .line 15
    array-length v0, p1

    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    aget-object p1, p1, v0

    .line 20
    .line 21
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public static varargs g(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p0, p1}, Ll/nsh0;->a(Ljava/lang/String;[Ljava/lang/String;)Ll/nyv;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Ll/msh0;->n(Ll/nyv;)V

    .line 13
    .line 14
    .line 15
    array-length v0, p1

    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    aget-object p1, p1, v0

    .line 20
    .line 21
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public static h()V
    .locals 0

    .line 1
    invoke-static {}, Ll/msh0;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static i()V
    .locals 0

    .line 1
    invoke-static {}, Ll/msh0;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static j(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {p0}, Ll/nsh0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Ll/nyv;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/nyv;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, v0, Ll/nyv;->b:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p0, v0, Ll/nyv;->c:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Ll/msh0;->q(Ll/nyv;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public static varargs k(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p0, p1}, Ll/nsh0;->a(Ljava/lang/String;[Ljava/lang/String;)Ll/nyv;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Ll/msh0;->q(Ll/nyv;)V

    .line 13
    .line 14
    .line 15
    array-length v0, p1

    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    aget-object p1, p1, v0

    .line 20
    .line 21
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public static l(Ljava/lang/String;Ljava/lang/IllegalAccessException;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/io/StringWriter;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/io/PrintWriter;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Ll/nsh0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance p1, Ll/nyv;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {p1, v1}, Ll/nyv;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iput-object p0, p1, Ll/nyv;->c:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p1}, Ll/msh0;->q(Ll/nyv;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
