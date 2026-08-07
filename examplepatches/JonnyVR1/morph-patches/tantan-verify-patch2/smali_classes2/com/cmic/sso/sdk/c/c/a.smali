.class public Lcom/cmic/sso/sdk/c/c/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Lcom/cmic/sso/sdk/c/c/a;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Lcom/cmic/sso/sdk/c/c/a;
    .locals 2

    .line 455
    sget-object v0, Lcom/cmic/sso/sdk/c/c/a;->a:Lcom/cmic/sso/sdk/c/c/a;

    if-nez v0, :cond_1

    .line 456
    const-class v0, Lcom/cmic/sso/sdk/c/c/a;

    monitor-enter v0

    .line 457
    :try_start_0
    sget-object v1, Lcom/cmic/sso/sdk/c/c/a;->a:Lcom/cmic/sso/sdk/c/c/a;

    if-nez v1, :cond_0

    .line 458
    new-instance v1, Lcom/cmic/sso/sdk/c/c/a;

    invoke-direct {v1}, Lcom/cmic/sso/sdk/c/c/a;-><init>()V

    sput-object v1, Lcom/cmic/sso/sdk/c/c/a;->a:Lcom/cmic/sso/sdk/c/c/a;

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    .line 459
    :cond_0
    :goto_0
    monitor-exit v0

    goto :goto_2

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 460
    :cond_1
    :goto_2
    sget-object v0, Lcom/cmic/sso/sdk/c/c/a;->a:Lcom/cmic/sso/sdk/c/c/a;

    return-object v0
.end method

.method private a(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/c/d;Lcom/cmic/sso/sdk/a;)V
    .locals 3

    .line 477
    new-instance v0, Lcom/cmic/sso/sdk/c/a/d;

    invoke-direct {v0}, Lcom/cmic/sso/sdk/c/a/d;-><init>()V

    .line 478
    new-instance v1, Lcom/cmic/sso/sdk/c/a/c;

    invoke-direct {v1}, Lcom/cmic/sso/sdk/c/a/c;-><init>()V

    .line 479
    new-instance v2, Lcom/cmic/sso/sdk/c/a/a;

    invoke-direct {v2}, Lcom/cmic/sso/sdk/c/a/a;-><init>()V

    .line 480
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/c/a/d;->a(Lcom/cmic/sso/sdk/c/a/b;)V

    .line 481
    invoke-virtual {v1, v2}, Lcom/cmic/sso/sdk/c/a/c;->a(Lcom/cmic/sso/sdk/c/a/b;)V

    .line 482
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-virtual {p1, v1, v2}, Lcom/cmic/sso/sdk/c/c/c;->a(J)V

    .line 483
    new-instance v1, Lcom/cmic/sso/sdk/c/c/a$1;

    invoke-direct {v1, p0, p3, p2, p1}, Lcom/cmic/sso/sdk/c/c/a$1;-><init>(Lcom/cmic/sso/sdk/c/c/a;Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/c/c/d;Lcom/cmic/sso/sdk/c/c/c;)V

    invoke-virtual {v0, p1, v1, p3}, Lcom/cmic/sso/sdk/c/a/d;->a(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/d/c;Lcom/cmic/sso/sdk/a;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/c/c/d;)V
    .locals 15

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const-string v1, "networktype"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/a;->c(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    new-instance v2, Lcom/cmic/sso/sdk/c/b/h;

    .line 10
    .line 11
    invoke-direct {v2}, Lcom/cmic/sso/sdk/c/b/h;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v3, "1.0"

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Lcom/cmic/sso/sdk/c/b/a;->b(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string v3, "quick_login_android_9.5.5.3"

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Lcom/cmic/sso/sdk/c/b/a;->c(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v3, "appid"

    .line 25
    .line 26
    invoke-virtual {v0, v3}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v2, v3}, Lcom/cmic/sso/sdk/c/b/a;->d(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string v3, "operatortype"

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v2, v3}, Lcom/cmic/sso/sdk/c/b/a;->e(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    new-instance v3, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v4, ""

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v2, v3}, Lcom/cmic/sso/sdk/c/b/a;->f(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lcom/cmic/sso/sdk/e/m;->a()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v2, v3}, Lcom/cmic/sso/sdk/c/b/a;->g(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-static {}, Lcom/cmic/sso/sdk/e/m;->b()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v2, v3}, Lcom/cmic/sso/sdk/c/b/a;->h(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-static {}, Lcom/cmic/sso/sdk/e/m;->c()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {v2, v3}, Lcom/cmic/sso/sdk/c/b/a;->i(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    const-string v3, "0"

    .line 84
    .line 85
    invoke-virtual {v2, v3}, Lcom/cmic/sso/sdk/c/b/a;->j(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    const-string v5, "3.0"

    .line 89
    .line 90
    invoke-virtual {v2, v5}, Lcom/cmic/sso/sdk/c/b/a;->k(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-static {}, Lcom/cmic/sso/sdk/e/q;->b()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    invoke-virtual {v2, v6}, Lcom/cmic/sso/sdk/c/b/a;->l(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-static {}, Lcom/cmic/sso/sdk/e/o;->a()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    invoke-virtual {v2, v6}, Lcom/cmic/sso/sdk/c/b/a;->m(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    const-string v6, "apppackage"

    .line 108
    .line 109
    invoke-virtual {v0, v6}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v6

    .line 113
    invoke-virtual {v2, v6}, Lcom/cmic/sso/sdk/c/b/a;->o(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    const-string v6, "appsign"

    .line 117
    .line 118
    invoke-virtual {v0, v6}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    invoke-virtual {v2, v6}, Lcom/cmic/sso/sdk/c/b/a;->p(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    const-string v6, "AID"

    .line 126
    .line 127
    invoke-static {v6, v4}, Lcom/cmic/sso/sdk/e/k;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    invoke-virtual {v2, v4}, Lcom/cmic/sso/sdk/c/b/h;->a(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    const-string v4, "logintype"

    .line 135
    .line 136
    invoke-virtual {v0, v4}, Lcom/cmic/sso/sdk/a;->c(Ljava/lang/String;)I

    .line 137
    .line 138
    .line 139
    move-result v6

    .line 140
    const/4 v7, 0x1

    .line 141
    const/4 v8, 0x0

    .line 142
    const/4 v9, 0x3

    .line 143
    if-eq v6, v9, :cond_2

    .line 144
    .line 145
    const-string v6, "isRisk"

    .line 146
    .line 147
    invoke-virtual {v0, v6, v8}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Z)Z

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    if-eqz v6, :cond_0

    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_0
    const-string v6, "userCapaid"

    .line 155
    .line 156
    invoke-virtual {v0, v6}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v6

    .line 160
    invoke-virtual {v2, v6}, Lcom/cmic/sso/sdk/c/b/h;->x(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0, v4}, Lcom/cmic/sso/sdk/a;->c(Ljava/lang/String;)I

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    if-ne v4, v7, :cond_1

    .line 168
    .line 169
    const-string v4, "200"

    .line 170
    .line 171
    invoke-virtual {v2, v4}, Lcom/cmic/sso/sdk/c/b/h;->x(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_1
    const-string v4, "50"

    .line 176
    .line 177
    invoke-virtual {v2, v4}, Lcom/cmic/sso/sdk/c/b/h;->x(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    :goto_0
    const-string v4, "authz"

    .line 181
    .line 182
    invoke-virtual {v2, v4}, Lcom/cmic/sso/sdk/c/b/a;->s(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_2
    :goto_1
    const-string v4, "pre"

    .line 187
    .line 188
    invoke-virtual {v2, v4}, Lcom/cmic/sso/sdk/c/b/a;->s(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    :goto_2
    const-string v4, "scripAndTokenForHttps"

    .line 192
    .line 193
    invoke-static {v0, v4}, Lcom/cmic/sso/sdk/e/q;->a(Lcom/cmic/sso/sdk/a;Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v0}, Lcom/cmic/sso/sdk/a;->b()Lcom/cmic/sso/sdk/a/a;

    .line 197
    .line 198
    .line 199
    move-result-object v4

    .line 200
    const-string v6, "isCacheScrip"

    .line 201
    .line 202
    invoke-virtual {v0, v6, v8}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Z)Z

    .line 203
    .line 204
    .line 205
    move-result v6

    .line 206
    const-string v10, "defendEOF"

    .line 207
    .line 208
    const-string v11, "traceId"

    .line 209
    .line 210
    const-string v12, "POST"

    .line 211
    .line 212
    const-string v13, "/unisdk/rs/scripAndTokenForHttps"

    .line 213
    .line 214
    const-string v14, "https://"

    .line 215
    .line 216
    if-nez v6, :cond_6

    .line 217
    .line 218
    const-string v6, "isGotScrip"

    .line 219
    .line 220
    invoke-virtual {v0, v6, v8}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Z)Z

    .line 221
    .line 222
    .line 223
    move-result v6

    .line 224
    if-eqz v6, :cond_3

    .line 225
    .line 226
    goto/16 :goto_4

    .line 227
    .line 228
    :cond_3
    new-instance v3, Lcom/cmic/sso/sdk/c/b/e;

    .line 229
    .line 230
    invoke-direct {v3}, Lcom/cmic/sso/sdk/c/b/e;-><init>()V

    .line 231
    .line 232
    .line 233
    sget-object v6, Lcom/cmic/sso/sdk/b$a;->a:Ljava/lang/String;

    .line 234
    .line 235
    invoke-virtual {v0, v6}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;)[B

    .line 236
    .line 237
    .line 238
    move-result-object v6

    .line 239
    invoke-virtual {v3, v6}, Lcom/cmic/sso/sdk/c/b/e;->a([B)V

    .line 240
    .line 241
    .line 242
    sget-object v6, Lcom/cmic/sso/sdk/b$a;->b:Ljava/lang/String;

    .line 243
    .line 244
    invoke-virtual {v0, v6}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;)[B

    .line 245
    .line 246
    .line 247
    move-result-object v6

    .line 248
    invoke-virtual {v3, v6}, Lcom/cmic/sso/sdk/c/b/e;->b([B)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v3, v2}, Lcom/cmic/sso/sdk/c/b/e;->a(Lcom/cmic/sso/sdk/c/b/a;)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {v3, v8}, Lcom/cmic/sso/sdk/c/b/e;->a(Z)V

    .line 255
    .line 256
    .line 257
    const-string v2, "isCloseIpv4"

    .line 258
    .line 259
    invoke-virtual {v4}, Lcom/cmic/sso/sdk/a/a;->h()Z

    .line 260
    .line 261
    .line 262
    move-result v6

    .line 263
    invoke-virtual {v0, v2, v6}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Z)V

    .line 264
    .line 265
    .line 266
    const-string v2, "isCloseIpv6"

    .line 267
    .line 268
    invoke-virtual {v4}, Lcom/cmic/sso/sdk/a/a;->i()Z

    .line 269
    .line 270
    .line 271
    move-result v6

    .line 272
    invoke-virtual {v0, v2, v6}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Z)V

    .line 273
    .line 274
    .line 275
    new-instance v2, Ljava/lang/StringBuilder;

    .line 276
    .line 277
    invoke-direct {v2, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v4}, Lcom/cmic/sso/sdk/a/a;->b()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v4

    .line 284
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v2

    .line 294
    const-string v4, "use2048PublicKey"

    .line 295
    .line 296
    invoke-virtual {v0, v4, v8}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Z)Z

    .line 297
    .line 298
    .line 299
    move-result v4

    .line 300
    if-eqz v4, :cond_4

    .line 301
    .line 302
    const-string v4, "BaseRequest"

    .line 303
    .line 304
    const-string v6, "\u4f7f\u75282\u5bf9\u5e94\u7684\u7f16\u7801"

    .line 305
    .line 306
    invoke-static {v4, v6}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    const-string v4, "2"

    .line 310
    .line 311
    invoke-virtual {v3, v4}, Lcom/cmic/sso/sdk/c/b/e;->b(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    invoke-static {}, Lcom/cmic/sso/sdk/e/i;->a()Lcom/cmic/sso/sdk/e/i;

    .line 315
    .line 316
    .line 317
    move-result-object v4

    .line 318
    sget-object v6, Lcom/cmic/sso/sdk/b$a;->a:Ljava/lang/String;

    .line 319
    .line 320
    invoke-virtual {v0, v6}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;)[B

    .line 321
    .line 322
    .line 323
    move-result-object v6

    .line 324
    invoke-virtual {v4, v6}, Lcom/cmic/sso/sdk/e/i;->b([B)Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v4

    .line 328
    goto :goto_3

    .line 329
    :cond_4
    invoke-static {}, Lcom/cmic/sso/sdk/e/i;->a()Lcom/cmic/sso/sdk/e/i;

    .line 330
    .line 331
    .line 332
    move-result-object v4

    .line 333
    sget-object v6, Lcom/cmic/sso/sdk/b$a;->a:Ljava/lang/String;

    .line 334
    .line 335
    invoke-virtual {v0, v6}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;)[B

    .line 336
    .line 337
    .line 338
    move-result-object v6

    .line 339
    invoke-virtual {v4, v6}, Lcom/cmic/sso/sdk/e/i;->a([B)Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object v4

    .line 343
    :goto_3
    invoke-virtual {v3, v4}, Lcom/cmic/sso/sdk/c/b/e;->c(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    new-instance v4, Lcom/cmic/sso/sdk/c/c/b;

    .line 347
    .line 348
    invoke-virtual {v0, v11}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object v6

    .line 352
    invoke-direct {v4, v2, v3, v12, v6}, Lcom/cmic/sso/sdk/c/c/b;-><init>(Ljava/lang/String;Lcom/cmic/sso/sdk/c/b/e;Ljava/lang/String;Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    const-string v2, "1"

    .line 356
    .line 357
    invoke-virtual {v4, v10, v2}, Lcom/cmic/sso/sdk/c/c/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    const-string v2, "doNetworkSwitch"

    .line 361
    .line 362
    if-ne v1, v9, :cond_5

    .line 363
    .line 364
    invoke-virtual {v4, v7}, Lcom/cmic/sso/sdk/c/c/c;->a(Z)V

    .line 365
    .line 366
    .line 367
    invoke-virtual {v0, v2, v7}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Z)V

    .line 368
    .line 369
    .line 370
    goto :goto_5

    .line 371
    :cond_5
    invoke-virtual {v4, v8}, Lcom/cmic/sso/sdk/c/c/c;->a(Z)V

    .line 372
    .line 373
    .line 374
    invoke-virtual {v0, v2, v8}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Z)V

    .line 375
    .line 376
    .line 377
    goto :goto_5

    .line 378
    :cond_6
    :goto_4
    const-string v1, "phonescrip"

    .line 379
    .line 380
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object v1

    .line 384
    invoke-virtual {v2, v1}, Lcom/cmic/sso/sdk/c/b/h;->w(Ljava/lang/String;)V

    .line 385
    .line 386
    .line 387
    const-string v1, "appkey"

    .line 388
    .line 389
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object v1

    .line 393
    invoke-virtual {v2, v1}, Lcom/cmic/sso/sdk/c/b/g;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object v1

    .line 397
    invoke-virtual {v2, v1}, Lcom/cmic/sso/sdk/c/b/a;->n(Ljava/lang/String;)V

    .line 398
    .line 399
    .line 400
    new-instance v1, Ljava/lang/StringBuilder;

    .line 401
    .line 402
    invoke-direct {v1, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 403
    .line 404
    .line 405
    invoke-virtual {v4}, Lcom/cmic/sso/sdk/a/a;->a()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v4

    .line 409
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 410
    .line 411
    .line 412
    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 413
    .line 414
    .line 415
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object v1

    .line 419
    new-instance v4, Lcom/cmic/sso/sdk/c/c/c;

    .line 420
    .line 421
    invoke-virtual {v0, v11}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object v6

    .line 425
    invoke-direct {v4, v1, v2, v12, v6}, Lcom/cmic/sso/sdk/c/c/c;-><init>(Ljava/lang/String;Lcom/cmic/sso/sdk/c/b/g;Ljava/lang/String;Ljava/lang/String;)V

    .line 426
    .line 427
    .line 428
    invoke-virtual {v4, v10, v3}, Lcom/cmic/sso/sdk/c/c/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 429
    .line 430
    .line 431
    :goto_5
    const-string v1, "interfaceVersion"

    .line 432
    .line 433
    invoke-virtual {v4, v1, v5}, Lcom/cmic/sso/sdk/c/c/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 434
    .line 435
    .line 436
    move-object/from16 v1, p2

    .line 437
    .line 438
    invoke-direct {p0, v4, v1, v0}, Lcom/cmic/sso/sdk/c/c/a;->a(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/c/d;Lcom/cmic/sso/sdk/a;)V

    .line 439
    .line 440
    .line 441
    return-void
.end method

.method public a(Lorg/json/JSONObject;Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/c/c/d;)V
    .locals 5

    .line 461
    new-instance v0, Lcom/cmic/sso/sdk/c/b/f;

    invoke-direct {v0}, Lcom/cmic/sso/sdk/c/b/f;-><init>()V

    .line 462
    new-instance v1, Lcom/cmic/sso/sdk/c/b/f$a;

    invoke-direct {v1}, Lcom/cmic/sso/sdk/c/b/f$a;-><init>()V

    .line 463
    new-instance v2, Lcom/cmic/sso/sdk/c/b/f$b;

    invoke-direct {v2}, Lcom/cmic/sso/sdk/c/b/f$b;-><init>()V

    .line 464
    invoke-static {}, Lcom/cmic/sso/sdk/e/q;->b()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/cmic/sso/sdk/c/b/f$b;->e(Ljava/lang/String;)V

    .line 465
    invoke-static {}, Lcom/cmic/sso/sdk/e/o;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/cmic/sso/sdk/c/b/f$b;->f(Ljava/lang/String;)V

    .line 466
    const-string v3, "2.0"

    invoke-virtual {v2, v3}, Lcom/cmic/sso/sdk/c/b/f$b;->b(Ljava/lang/String;)V

    .line 467
    const-string v3, "appid"

    const-string v4, ""

    invoke-virtual {p2, v3, v4}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/cmic/sso/sdk/c/b/f$b;->c(Ljava/lang/String;)V

    .line 468
    invoke-virtual {v2, v4}, Lcom/cmic/sso/sdk/c/b/g;->v(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/cmic/sso/sdk/c/b/f$b;->d(Ljava/lang/String;)V

    .line 469
    invoke-virtual {v1, p1}, Lcom/cmic/sso/sdk/c/b/f$a;->a(Lorg/json/JSONObject;)V

    .line 470
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/c/b/f;->a(Lcom/cmic/sso/sdk/c/b/f$a;)V

    .line 471
    invoke-virtual {v0, v2}, Lcom/cmic/sso/sdk/c/b/f;->a(Lcom/cmic/sso/sdk/c/b/f$b;)V

    .line 472
    invoke-virtual {p2}, Lcom/cmic/sso/sdk/a;->b()Lcom/cmic/sso/sdk/a/a;

    move-result-object p1

    .line 473
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/cmic/sso/sdk/a/a;->d()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/log/logReport"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 474
    new-instance v1, Lcom/cmic/sso/sdk/c/c/c;

    const-string v2, "traceId"

    .line 475
    invoke-virtual {p2, v2}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "POST"

    invoke-direct {v1, p1, v0, v3, v2}, Lcom/cmic/sso/sdk/c/c/c;-><init>(Ljava/lang/String;Lcom/cmic/sso/sdk/c/b/g;Ljava/lang/String;Ljava/lang/String;)V

    .line 476
    invoke-direct {p0, v1, p3, p2}, Lcom/cmic/sso/sdk/c/c/a;->a(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/c/d;Lcom/cmic/sso/sdk/a;)V

    return-void
.end method

.method public a(ZLcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/c/c/d;)V
    .locals 4

    .line 442
    new-instance v0, Lcom/cmic/sso/sdk/c/b/b;

    invoke-direct {v0}, Lcom/cmic/sso/sdk/c/b/b;-><init>()V

    .line 443
    const-string v1, "1.0"

    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/c/b/b;->b(Ljava/lang/String;)V

    .line 444
    const-string v1, "Android"

    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/c/b/b;->c(Ljava/lang/String;)V

    .line 445
    const-string v1, "AID"

    const-string v2, ""

    invoke-static {v1, v2}, Lcom/cmic/sso/sdk/e/k;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/c/b/b;->d(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 446
    const-string p1, "1"

    goto :goto_0

    :cond_0
    const-string p1, "0"

    :goto_0
    invoke-virtual {v0, p1}, Lcom/cmic/sso/sdk/c/b/b;->e(Ljava/lang/String;)V

    .line 447
    const-string p1, "quick_login_android_9.5.5.3"

    invoke-virtual {v0, p1}, Lcom/cmic/sso/sdk/c/b/b;->f(Ljava/lang/String;)V

    .line 448
    const-string p1, "appid"

    invoke-virtual {p2, p1}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/cmic/sso/sdk/c/b/b;->g(Ljava/lang/String;)V

    .line 449
    const-string p1, "iYm0HAnkxQtpvN44"

    invoke-virtual {v0, p1}, Lcom/cmic/sso/sdk/c/b/g;->v(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/cmic/sso/sdk/c/b/b;->h(Ljava/lang/String;)V

    .line 450
    invoke-virtual {p2}, Lcom/cmic/sso/sdk/a;->b()Lcom/cmic/sso/sdk/a/a;

    move-result-object p1

    .line 451
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/cmic/sso/sdk/a/a;->c()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/client/uniConfig"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 452
    new-instance v1, Lcom/cmic/sso/sdk/c/c/c;

    const-string v2, "traceId"

    .line 453
    invoke-virtual {p2, v2}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "POST"

    invoke-direct {v1, p1, v0, v3, v2}, Lcom/cmic/sso/sdk/c/c/c;-><init>(Ljava/lang/String;Lcom/cmic/sso/sdk/c/b/g;Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    invoke-direct {p0, v1, p3, p2}, Lcom/cmic/sso/sdk/c/c/a;->a(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/c/d;Lcom/cmic/sso/sdk/a;)V

    return-void
.end method
