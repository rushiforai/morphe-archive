.class public Ll/d0r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/r7;


# static fields
.field private static volatile e:Ll/d0r0;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Ll/fmb0;

.field private c:Z

.field private d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/xiaomi/mipush/sdk/d;",
            "Ll/r7;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/d0r0;->c:Z

    .line 6
    .line 7
    new-instance v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/d0r0;->d:Ljava/util/Map;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Ll/d0r0;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static c(Landroid/content/Context;)Ll/d0r0;
    .locals 2

    .line 1
    sget-object v0, Ll/d0r0;->e:Ll/d0r0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/d0r0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/d0r0;->e:Ll/d0r0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/d0r0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/d0r0;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/d0r0;->e:Ll/d0r0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_2
    sget-object p0, Ll/d0r0;->e:Ll/d0r0;

    .line 27
    .line 28
    return-object p0
.end method

.method private d()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 2
    .line 3
    if-eqz v0, :cond_c

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/fmb0;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "ASSEMBLE_PUSH : "

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, " HW user switch : "

    .line 16
    .line 17
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 21
    .line 22
    invoke-virtual {v2}, Ll/fmb0;->d()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v2, " HW online switch : "

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v2, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 35
    .line 36
    sget-object v3, Lcom/xiaomi/mipush/sdk/d;->a:Lcom/xiaomi/mipush/sdk/d;

    .line 37
    .line 38
    invoke-static {v2, v3}, Ll/n1r0;->g(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v2, " HW isSupport : "

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 51
    .line 52
    invoke-static {v2}, Ll/f3r0;->c(Landroid/content/Context;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    iget-object v0, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/fmb0;->d()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    iget-object v0, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 79
    .line 80
    sget-object v2, Lcom/xiaomi/mipush/sdk/d;->a:Lcom/xiaomi/mipush/sdk/d;

    .line 81
    .line 82
    invoke-static {v0, v2}, Ll/n1r0;->g(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    iget-object v0, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 89
    .line 90
    invoke-static {v0}, Ll/f3r0;->c(Landroid/content/Context;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_2

    .line 95
    .line 96
    invoke-virtual {p0, v2}, Ll/d0r0;->h(Lcom/xiaomi/mipush/sdk/d;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_1

    .line 101
    .line 102
    iget-object v0, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 103
    .line 104
    invoke-static {v0, v2}, Ll/v5r0;->a(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Ll/r7;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p0, v2, v0}, Ll/d0r0;->f(Lcom/xiaomi/mipush/sdk/d;Ll/r7;)V

    .line 109
    .line 110
    .line 111
    :cond_1
    const-string v0, "hw manager add to list"

    .line 112
    .line 113
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_2
    sget-object v0, Lcom/xiaomi/mipush/sdk/d;->a:Lcom/xiaomi/mipush/sdk/d;

    .line 118
    .line 119
    invoke-virtual {p0, v0}, Ll/d0r0;->h(Lcom/xiaomi/mipush/sdk/d;)Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_3

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Ll/d0r0;->b(Lcom/xiaomi/mipush/sdk/d;)Ll/r7;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    if-eqz v2, :cond_3

    .line 130
    .line 131
    invoke-virtual {p0, v0}, Ll/d0r0;->e(Lcom/xiaomi/mipush/sdk/d;)V

    .line 132
    .line 133
    .line 134
    invoke-interface {v2}, Ll/r7;->unregister()V

    .line 135
    .line 136
    .line 137
    :cond_3
    :goto_0
    iget-object v0, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 138
    .line 139
    invoke-virtual {v0}, Ll/fmb0;->b()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_4

    .line 144
    .line 145
    new-instance v0, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    const-string v2, " FCM user switch : "

    .line 148
    .line 149
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    iget-object v2, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 153
    .line 154
    invoke-virtual {v2}, Ll/fmb0;->b()Z

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string v2, " FCM online switch : "

    .line 162
    .line 163
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    iget-object v2, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 167
    .line 168
    sget-object v3, Lcom/xiaomi/mipush/sdk/d;->b:Lcom/xiaomi/mipush/sdk/d;

    .line 169
    .line 170
    invoke-static {v2, v3}, Ll/n1r0;->g(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Z

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    const-string v2, " FCM isSupport : "

    .line 178
    .line 179
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    iget-object v2, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 183
    .line 184
    invoke-static {v2}, Ll/f3r0;->d(Landroid/content/Context;)Z

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    :cond_4
    iget-object v0, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 203
    .line 204
    invoke-virtual {v0}, Ll/fmb0;->b()Z

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-eqz v0, :cond_6

    .line 209
    .line 210
    iget-object v0, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 211
    .line 212
    sget-object v2, Lcom/xiaomi/mipush/sdk/d;->b:Lcom/xiaomi/mipush/sdk/d;

    .line 213
    .line 214
    invoke-static {v0, v2}, Ll/n1r0;->g(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    if-eqz v0, :cond_6

    .line 219
    .line 220
    iget-object v0, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 221
    .line 222
    invoke-static {v0}, Ll/f3r0;->d(Landroid/content/Context;)Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-eqz v0, :cond_6

    .line 227
    .line 228
    invoke-virtual {p0, v2}, Ll/d0r0;->h(Lcom/xiaomi/mipush/sdk/d;)Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-nez v0, :cond_5

    .line 233
    .line 234
    iget-object v0, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 235
    .line 236
    invoke-static {v0, v2}, Ll/v5r0;->a(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Ll/r7;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-virtual {p0, v2, v0}, Ll/d0r0;->f(Lcom/xiaomi/mipush/sdk/d;Ll/r7;)V

    .line 241
    .line 242
    .line 243
    :cond_5
    const-string v0, "fcm manager add to list"

    .line 244
    .line 245
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    goto :goto_1

    .line 249
    :cond_6
    sget-object v0, Lcom/xiaomi/mipush/sdk/d;->b:Lcom/xiaomi/mipush/sdk/d;

    .line 250
    .line 251
    invoke-virtual {p0, v0}, Ll/d0r0;->h(Lcom/xiaomi/mipush/sdk/d;)Z

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    if-eqz v2, :cond_7

    .line 256
    .line 257
    invoke-virtual {p0, v0}, Ll/d0r0;->b(Lcom/xiaomi/mipush/sdk/d;)Ll/r7;

    .line 258
    .line 259
    .line 260
    move-result-object v2

    .line 261
    if-eqz v2, :cond_7

    .line 262
    .line 263
    invoke-virtual {p0, v0}, Ll/d0r0;->e(Lcom/xiaomi/mipush/sdk/d;)V

    .line 264
    .line 265
    .line 266
    invoke-interface {v2}, Ll/r7;->unregister()V

    .line 267
    .line 268
    .line 269
    :cond_7
    :goto_1
    iget-object v0, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 270
    .line 271
    invoke-virtual {v0}, Ll/fmb0;->a()Z

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    if-eqz v0, :cond_8

    .line 276
    .line 277
    new-instance v0, Ljava/lang/StringBuilder;

    .line 278
    .line 279
    const-string v2, " COS user switch : "

    .line 280
    .line 281
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    iget-object v2, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 285
    .line 286
    invoke-virtual {v2}, Ll/fmb0;->a()Z

    .line 287
    .line 288
    .line 289
    move-result v2

    .line 290
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    const-string v2, " COS online switch : "

    .line 294
    .line 295
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    iget-object v2, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 299
    .line 300
    sget-object v3, Lcom/xiaomi/mipush/sdk/d;->c:Lcom/xiaomi/mipush/sdk/d;

    .line 301
    .line 302
    invoke-static {v2, v3}, Ll/n1r0;->g(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Z

    .line 303
    .line 304
    .line 305
    move-result v2

    .line 306
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    const-string v2, " COS isSupport : "

    .line 310
    .line 311
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    iget-object v2, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 315
    .line 316
    invoke-static {v2}, Ll/f3r0;->e(Landroid/content/Context;)Z

    .line 317
    .line 318
    .line 319
    move-result v2

    .line 320
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    :cond_8
    iget-object v0, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 335
    .line 336
    invoke-virtual {v0}, Ll/fmb0;->a()Z

    .line 337
    .line 338
    .line 339
    move-result v0

    .line 340
    if-eqz v0, :cond_9

    .line 341
    .line 342
    iget-object v0, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 343
    .line 344
    sget-object v1, Lcom/xiaomi/mipush/sdk/d;->c:Lcom/xiaomi/mipush/sdk/d;

    .line 345
    .line 346
    invoke-static {v0, v1}, Ll/n1r0;->g(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Z

    .line 347
    .line 348
    .line 349
    move-result v0

    .line 350
    if-eqz v0, :cond_9

    .line 351
    .line 352
    iget-object v0, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 353
    .line 354
    invoke-static {v0}, Ll/f3r0;->e(Landroid/content/Context;)Z

    .line 355
    .line 356
    .line 357
    move-result v0

    .line 358
    if-eqz v0, :cond_9

    .line 359
    .line 360
    iget-object v0, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 361
    .line 362
    invoke-static {v0, v1}, Ll/v5r0;->a(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Ll/r7;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    invoke-virtual {p0, v1, v0}, Ll/d0r0;->f(Lcom/xiaomi/mipush/sdk/d;Ll/r7;)V

    .line 367
    .line 368
    .line 369
    goto :goto_2

    .line 370
    :cond_9
    sget-object v0, Lcom/xiaomi/mipush/sdk/d;->c:Lcom/xiaomi/mipush/sdk/d;

    .line 371
    .line 372
    invoke-virtual {p0, v0}, Ll/d0r0;->h(Lcom/xiaomi/mipush/sdk/d;)Z

    .line 373
    .line 374
    .line 375
    move-result v1

    .line 376
    if-eqz v1, :cond_a

    .line 377
    .line 378
    invoke-virtual {p0, v0}, Ll/d0r0;->b(Lcom/xiaomi/mipush/sdk/d;)Ll/r7;

    .line 379
    .line 380
    .line 381
    move-result-object v1

    .line 382
    if-eqz v1, :cond_a

    .line 383
    .line 384
    invoke-virtual {p0, v0}, Ll/d0r0;->e(Lcom/xiaomi/mipush/sdk/d;)V

    .line 385
    .line 386
    .line 387
    invoke-interface {v1}, Ll/r7;->unregister()V

    .line 388
    .line 389
    .line 390
    :cond_a
    :goto_2
    iget-object v0, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 391
    .line 392
    invoke-virtual {v0}, Ll/fmb0;->c()Z

    .line 393
    .line 394
    .line 395
    move-result v0

    .line 396
    if-eqz v0, :cond_b

    .line 397
    .line 398
    iget-object v0, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 399
    .line 400
    sget-object v1, Lcom/xiaomi/mipush/sdk/d;->d:Lcom/xiaomi/mipush/sdk/d;

    .line 401
    .line 402
    invoke-static {v0, v1}, Ll/n1r0;->g(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Z

    .line 403
    .line 404
    .line 405
    move-result v0

    .line 406
    if-eqz v0, :cond_b

    .line 407
    .line 408
    iget-object v0, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 409
    .line 410
    invoke-static {v0}, Ll/f3r0;->f(Landroid/content/Context;)Z

    .line 411
    .line 412
    .line 413
    move-result v0

    .line 414
    if-eqz v0, :cond_b

    .line 415
    .line 416
    iget-object v0, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 417
    .line 418
    invoke-static {v0, v1}, Ll/v5r0;->a(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Ll/r7;

    .line 419
    .line 420
    .line 421
    move-result-object v0

    .line 422
    invoke-virtual {p0, v1, v0}, Ll/d0r0;->f(Lcom/xiaomi/mipush/sdk/d;Ll/r7;)V

    .line 423
    .line 424
    .line 425
    return-void

    .line 426
    :cond_b
    sget-object v0, Lcom/xiaomi/mipush/sdk/d;->d:Lcom/xiaomi/mipush/sdk/d;

    .line 427
    .line 428
    invoke-virtual {p0, v0}, Ll/d0r0;->h(Lcom/xiaomi/mipush/sdk/d;)Z

    .line 429
    .line 430
    .line 431
    move-result v1

    .line 432
    if-eqz v1, :cond_c

    .line 433
    .line 434
    invoke-virtual {p0, v0}, Ll/d0r0;->b(Lcom/xiaomi/mipush/sdk/d;)Ll/r7;

    .line 435
    .line 436
    .line 437
    move-result-object v1

    .line 438
    if-eqz v1, :cond_c

    .line 439
    .line 440
    invoke-virtual {p0, v0}, Ll/d0r0;->e(Lcom/xiaomi/mipush/sdk/d;)V

    .line 441
    .line 442
    .line 443
    invoke-interface {v1}, Ll/r7;->unregister()V

    .line 444
    .line 445
    .line 446
    :cond_c
    return-void
.end method

.method public static synthetic i(Ll/d0r0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/d0r0;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic j(Ll/d0r0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/d0r0;->c:Z

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public b(Lcom/xiaomi/mipush/sdk/d;)Ll/r7;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d0r0;->d:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/r7;

    .line 8
    .line 9
    return-object p0
.end method

.method public e(Lcom/xiaomi/mipush/sdk/d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d0r0;->d:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Lcom/xiaomi/mipush/sdk/d;Ll/r7;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/d0r0;->d:Ljava/util/Map;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/d0r0;->d:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/d0r0;->d:Ljava/util/Map;

    .line 17
    .line 18
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public g(Ll/fmb0;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 2
    .line 3
    iget-object p1, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v0, Lcom/xiaomi/push/gk;->ao:Lcom/xiaomi/push/gk;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/xiaomi/push/gk;->a()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/push/service/ah;->a(IZ)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput-boolean p1, p0, Ll/d0r0;->c:Z

    .line 21
    .line 22
    iget-object p1, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/fmb0;->d()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/fmb0;->b()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/fmb0;->a()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/fmb0;->c()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    return-void

    .line 56
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 57
    .line 58
    invoke-static {p1}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance v0, Ll/d0r0$a;

    .line 63
    .line 64
    const/16 v1, 0x65

    .line 65
    .line 66
    const-string v2, "assemblePush"

    .line 67
    .line 68
    invoke-direct {v0, p0, v1, v2}, Ll/d0r0$a;-><init>(Ll/d0r0;ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v0}, Lcom/xiaomi/push/service/ah;->a(Lcom/xiaomi/push/service/ah$a;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public h(Lcom/xiaomi/mipush/sdk/d;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d0r0;->d:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public k(Lcom/xiaomi/mipush/sdk/d;)Z
    .locals 2

    .line 1
    sget-object v0, Ll/d0r0$b;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eq p1, v0, :cond_4

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    if-eq p1, v0, :cond_3

    .line 15
    .line 16
    const/4 v0, 0x3

    .line 17
    if-eq p1, v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x4

    .line 20
    if-eq p1, v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p1, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/fmb0;->a()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    :cond_1
    iget-object p0, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 32
    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/fmb0;->c()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_2
    return v1

    .line 41
    :cond_3
    iget-object p0, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 42
    .line 43
    if-eqz p0, :cond_5

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/fmb0;->b()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0

    .line 50
    :cond_4
    iget-object p0, p0, Ll/d0r0;->b:Ll/fmb0;

    .line 51
    .line 52
    if-eqz p0, :cond_5

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/fmb0;->d()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0

    .line 59
    :cond_5
    :goto_0
    return v1
.end method

.method public register()V
    .locals 2

    .line 1
    const-string v0, "ASSEMBLE_PUSH : assemble push register"

    .line 2
    .line 3
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/d0r0;->d:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-gtz v0, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Ll/d0r0;->d()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/d0r0;->d:Ljava/util/Map;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-lez v0, :cond_3

    .line 24
    .line 25
    iget-object v0, p0, Ll/d0r0;->d:Ljava/util/Map;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ll/r7;

    .line 46
    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    invoke-interface {v1}, Ll/r7;->register()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    iget-object p0, p0, Ll/d0r0;->a:Landroid/content/Context;

    .line 54
    .line 55
    invoke-static {p0}, Ll/n1r0;->f(Landroid/content/Context;)V

    .line 56
    .line 57
    .line 58
    :cond_3
    return-void
.end method

.method public unregister()V
    .locals 2

    .line 1
    const-string v0, "ASSEMBLE_PUSH : assemble push unregister"

    .line 2
    .line 3
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/d0r0;->d:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ll/r7;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-interface {v1}, Ll/r7;->unregister()V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    iget-object p0, p0, Ll/d0r0;->d:Ljava/util/Map;

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 37
    .line 38
    .line 39
    return-void
.end method
