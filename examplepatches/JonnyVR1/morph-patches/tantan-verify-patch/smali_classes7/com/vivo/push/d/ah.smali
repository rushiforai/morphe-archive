.class final Lcom/vivo/push/d/ah;
.super Lcom/vivo/push/l;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/vivo/push/o;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/vivo/push/l;-><init>(Lcom/vivo/push/o;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Lcom/vivo/push/o;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/vivo/push/l;->a:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "SendCommandTask "

    .line 4
    .line 5
    const-string v2, "SendCommandTask"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p1, " ; mContext is Null"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {v2, p0}, Lcom/vivo/push/util/p;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    if-nez p1, :cond_1

    .line 31
    .line 32
    const-string p0, "SendCommandTask pushCommand is Null"

    .line 33
    .line 34
    invoke-static {v2, p0}, Lcom/vivo/push/util/p;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    invoke-static {v0}, Lcom/vivo/push/util/t;->a(Landroid/content/Context;)Lcom/vivo/push/model/b;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1}, Lcom/vivo/push/o;->b()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    const/16 v4, 0x7d9

    .line 47
    .line 48
    if-eq v3, v4, :cond_5

    .line 49
    .line 50
    const/16 v4, 0x7db

    .line 51
    .line 52
    if-eq v3, v4, :cond_4

    .line 53
    .line 54
    packed-switch v3, :pswitch_data_0

    .line 55
    .line 56
    .line 57
    goto/16 :goto_1

    .line 58
    .line 59
    :pswitch_0
    if-eqz v0, :cond_3

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/vivo/push/model/b;->c()Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_2

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    move-object v3, p1

    .line 69
    check-cast v3, Lcom/vivo/push/b/c;

    .line 70
    .line 71
    invoke-static {v3}, Lcom/vivo/push/util/s;->a(Lcom/vivo/push/b/c;)I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    if-eqz v4, :cond_6

    .line 76
    .line 77
    invoke-static {}, Lcom/vivo/push/e;->a()Lcom/vivo/push/e;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {v3}, Lcom/vivo/push/b/c;->h()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0, p1, v4}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_3
    :goto_0
    invoke-static {}, Lcom/vivo/push/e;->a()Lcom/vivo/push/e;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    move-object v4, p1

    .line 94
    check-cast v4, Lcom/vivo/push/b/c;

    .line 95
    .line 96
    invoke-virtual {v4}, Lcom/vivo/push/b/c;->h()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    const/16 v5, 0x3ed

    .line 101
    .line 102
    invoke-virtual {v3, v4, v5}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_4
    iget-object v3, p0, Lcom/vivo/push/l;->a:Landroid/content/Context;

    .line 107
    .line 108
    invoke-static {v3}, Lcom/vivo/push/cache/ClientConfigManagerImpl;->getInstance(Landroid/content/Context;)Lcom/vivo/push/cache/ClientConfigManagerImpl;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    move-object v4, p1

    .line 113
    check-cast v4, Lcom/vivo/push/b/w;

    .line 114
    .line 115
    invoke-virtual {v4}, Lcom/vivo/push/b/w;->d()I

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    invoke-virtual {v3, v4}, Lcom/vivo/push/cache/ClientConfigManagerImpl;->isDebug(I)Z

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    invoke-static {v3}, Lcom/vivo/push/util/p;->a(Z)V

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_5
    iget-object v3, p0, Lcom/vivo/push/l;->a:Landroid/content/Context;

    .line 128
    .line 129
    invoke-static {v3}, Lcom/vivo/push/cache/ClientConfigManagerImpl;->getInstance(Landroid/content/Context;)Lcom/vivo/push/cache/ClientConfigManagerImpl;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-virtual {v3}, Lcom/vivo/push/cache/ClientConfigManagerImpl;->isDebug()Z

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    invoke-static {v3}, Lcom/vivo/push/util/p;->a(Z)V

    .line 138
    .line 139
    .line 140
    invoke-static {}, Lcom/vivo/push/util/p;->a()Z

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    if-eqz v3, :cond_6

    .line 145
    .line 146
    invoke-static {}, Lcom/vivo/push/e;->a()Lcom/vivo/push/e;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    invoke-virtual {v3}, Lcom/vivo/push/e;->i()V

    .line 151
    .line 152
    .line 153
    new-instance v3, Lcom/vivo/push/util/b;

    .line 154
    .line 155
    invoke-direct {v3}, Lcom/vivo/push/util/b;-><init>()V

    .line 156
    .line 157
    .line 158
    iget-object v4, p0, Lcom/vivo/push/l;->a:Landroid/content/Context;

    .line 159
    .line 160
    const-string v5, "com.vivo.push_preferences.hybridapptoken_v1"

    .line 161
    .line 162
    invoke-virtual {v3, v4, v5}, Lcom/vivo/push/util/b;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v3}, Lcom/vivo/push/util/b;->a()V

    .line 166
    .line 167
    .line 168
    new-instance v3, Lcom/vivo/push/util/b;

    .line 169
    .line 170
    invoke-direct {v3}, Lcom/vivo/push/util/b;-><init>()V

    .line 171
    .line 172
    .line 173
    iget-object v4, p0, Lcom/vivo/push/l;->a:Landroid/content/Context;

    .line 174
    .line 175
    const-string v5, "com.vivo.push_preferences.appconfig_v1"

    .line 176
    .line 177
    invoke-virtual {v3, v4, v5}, Lcom/vivo/push/util/b;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v3}, Lcom/vivo/push/util/b;->a()V

    .line 181
    .line 182
    .line 183
    invoke-static {}, Lcom/vivo/push/e;->a()Lcom/vivo/push/e;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    invoke-virtual {v3}, Lcom/vivo/push/e;->e()Z

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    if-nez v3, :cond_6

    .line 192
    .line 193
    iget-object v3, p0, Lcom/vivo/push/l;->a:Landroid/content/Context;

    .line 194
    .line 195
    invoke-static {v3}, Lcom/vivo/push/cache/ClientConfigManagerImpl;->getInstance(Landroid/content/Context;)Lcom/vivo/push/cache/ClientConfigManagerImpl;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    invoke-virtual {v3}, Lcom/vivo/push/cache/ClientConfigManagerImpl;->clearPush()V

    .line 200
    .line 201
    .line 202
    :cond_6
    :goto_1
    if-nez v0, :cond_7

    .line 203
    .line 204
    new-instance p0, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    const-string p1, " ; pushPkgInfo is Null"

    .line 213
    .line 214
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    invoke-static {v2, p0}, Lcom/vivo/push/util/p;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    .line 223
    .line 224
    return-void

    .line 225
    :cond_7
    invoke-virtual {v0}, Lcom/vivo/push/model/b;->a()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    invoke-virtual {v0}, Lcom/vivo/push/model/b;->c()Z

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    if-eqz v0, :cond_8

    .line 234
    .line 235
    :try_start_0
    invoke-static {}, Lcom/vivo/push/e;->a()Lcom/vivo/push/e;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    check-cast p1, Lcom/vivo/push/b/c;

    .line 240
    .line 241
    invoke-virtual {p1}, Lcom/vivo/push/b/c;->h()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    const/16 v4, 0x3ec

    .line 246
    .line 247
    invoke-virtual {v0, p1, v4}, Lcom/vivo/push/e;->a(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 248
    .line 249
    .line 250
    goto :goto_2

    .line 251
    :catch_0
    move-exception p1

    .line 252
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 253
    .line 254
    .line 255
    :goto_2
    new-instance p1, Lcom/vivo/push/b/e;

    .line 256
    .line 257
    invoke-direct {p1}, Lcom/vivo/push/b/e;-><init>()V

    .line 258
    .line 259
    .line 260
    new-instance v0, Ljava/lang/StringBuilder;

    .line 261
    .line 262
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    const-string v1, " ; pkgName is InBlackList "

    .line 269
    .line 270
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    invoke-static {v2, v0}, Lcom/vivo/push/util/p;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    .line 279
    .line 280
    :cond_8
    iget-object p0, p0, Lcom/vivo/push/l;->a:Landroid/content/Context;

    .line 281
    .line 282
    invoke-static {p0, v3, p1}, Lcom/vivo/push/a/a;->a(Landroid/content/Context;Ljava/lang/String;Lcom/vivo/push/o;)V

    .line 283
    .line 284
    .line 285
    return-void

    .line 286
    nop

    .line 287
    :pswitch_data_0
    .packed-switch 0x7d2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
