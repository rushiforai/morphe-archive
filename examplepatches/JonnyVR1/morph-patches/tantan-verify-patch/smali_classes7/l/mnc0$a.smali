.class Ll/mnc0$a;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mnc0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field private final a:I

.field final synthetic b:Ll/mnc0;


# direct methods
.method public constructor <init>(Ll/mnc0;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mnc0$a;->b:Ll/mnc0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Ll/mnc0$a;->a:I

    .line 7
    .line 8
    return-void
.end method

.method private a(I)V
    .locals 1

    .line 1
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput p1, v0, Landroid/os/Message;->what:I

    .line 6
    .line 7
    iget p1, p0, Ll/mnc0$a;->a:I

    .line 8
    .line 9
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 10
    .line 11
    iget-object p0, p0, Ll/mnc0$a;->b:Ll/mnc0;

    .line 12
    .line 13
    invoke-static {p0}, Ll/mnc0;->a(Ll/mnc0;)Landroid/os/Handler;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public run()V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const/16 v0, -0x13

    .line 4
    .line 5
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/mnc0;->t()Landroid/media/AudioRecord;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iget-object v0, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 15
    .line 16
    const/4 v3, 0x2

    .line 17
    const/4 v4, 0x0

    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    invoke-static {v0}, Ll/mnc0;->a(Ll/mnc0;)Landroid/os/Handler;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_14

    .line 25
    .line 26
    iget-object v0, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 27
    .line 28
    invoke-static {v0, v4}, Ll/mnc0;->c(Ll/mnc0;Z)Z

    .line 29
    .line 30
    .line 31
    invoke-direct {v1, v3}, Ll/mnc0$a;->a(I)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-static {v0}, Ll/mnc0;->i(Ll/mnc0;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-object v5, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 40
    .line 41
    invoke-static {v5}, Ll/mnc0;->i(Ll/mnc0;)I

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    const/16 v6, 0x20

    .line 46
    .line 47
    const/4 v7, 0x1

    .line 48
    invoke-static {v0, v7, v5, v6}, Lcom/uraroji/garage/android/lame/SimpleLame;->a(IIII)V

    .line 49
    .line 50
    .line 51
    iget-object v0, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 52
    .line 53
    invoke-static {v0}, Ll/mnc0;->j(Ll/mnc0;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    new-array v0, v0, [S

    .line 58
    .line 59
    iget-object v5, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 60
    .line 61
    invoke-static {v5}, Ll/mnc0;->j(Ll/mnc0;)I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    mul-int/2addr v5, v3

    .line 66
    int-to-double v5, v5

    .line 67
    const-wide/high16 v8, 0x3ff4000000000000L    # 1.25

    .line 68
    .line 69
    mul-double/2addr v5, v8

    .line 70
    const-wide v8, 0x40bc200000000000L    # 7200.0

    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    add-double/2addr v5, v8

    .line 76
    double-to-int v3, v5

    .line 77
    new-array v3, v3, [B

    .line 78
    .line 79
    const/4 v5, 0x3

    .line 80
    :try_start_0
    iget-object v6, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 81
    .line 82
    invoke-static {v6}, Ll/mnc0;->k(Ll/mnc0;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    invoke-static {v6}, Ll/rki;->b(Ljava/lang/String;)Ljava/io/File;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    new-instance v8, Ljava/io/FileOutputStream;

    .line 91
    .line 92
    iget-object v9, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 93
    .line 94
    invoke-static {v9}, Ll/mnc0;->l(Ll/mnc0;)Z

    .line 95
    .line 96
    .line 97
    move-result v9

    .line 98
    invoke-direct {v8, v6, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 99
    .line 100
    .line 101
    iget-object v5, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 102
    .line 103
    invoke-static {v5, v4}, Ll/mnc0;->c(Ll/mnc0;Z)Z

    .line 104
    .line 105
    .line 106
    :try_start_1
    invoke-virtual {v2}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 107
    .line 108
    .line 109
    const/4 v5, 0x0

    .line 110
    :try_start_2
    iget-object v6, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 111
    .line 112
    invoke-static {v6}, Ll/mnc0;->a(Ll/mnc0;)Landroid/os/Handler;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    if-eqz v6, :cond_1

    .line 117
    .line 118
    invoke-direct {v1, v4}, Ll/mnc0$a;->a(I)V

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :catchall_0
    move-exception v0

    .line 123
    move-object v6, v5

    .line 124
    goto/16 :goto_d

    .line 125
    .line 126
    :cond_1
    :goto_0
    iget-object v6, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 127
    .line 128
    invoke-static {v6}, Ll/mnc0;->m(Ll/mnc0;)Z

    .line 129
    .line 130
    .line 131
    move-result v6

    .line 132
    if-eqz v6, :cond_2

    .line 133
    .line 134
    iget-object v6, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 135
    .line 136
    invoke-static {v6}, Ll/mnc0;->i(Ll/mnc0;)I

    .line 137
    .line 138
    .line 139
    move-result v6

    .line 140
    invoke-static {v6}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->newInstance(I)Lcom/tantanapp/media/ttagc/TTAgcProcessor;

    .line 141
    .line 142
    .line 143
    move-result-object v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 144
    :try_start_3
    iget-object v9, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 145
    .line 146
    invoke-static {v9, v6}, Ll/mnc0;->n(Ll/mnc0;Lcom/tantanapp/media/ttagc/TTAgcProcessor;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v6}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->init()I

    .line 150
    .line 151
    .line 152
    iget-object v9, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 153
    .line 154
    invoke-static {v9}, Ll/mnc0;->i(Ll/mnc0;)I

    .line 155
    .line 156
    .line 157
    move-result v9

    .line 158
    invoke-static {v9}, Lcom/tantanapp/media/ttns/TTNsProcessor;->newInstance(I)Lcom/tantanapp/media/ttns/TTNsProcessor;

    .line 159
    .line 160
    .line 161
    move-result-object v5

    .line 162
    iget-object v9, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 163
    .line 164
    invoke-static {v9, v5}, Ll/mnc0;->o(Ll/mnc0;Lcom/tantanapp/media/ttns/TTNsProcessor;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v5}, Lcom/tantanapp/media/ttns/TTNsProcessor;->init()I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 168
    .line 169
    .line 170
    move-object v9, v6

    .line 171
    move-object v6, v5

    .line 172
    move-object v5, v9

    .line 173
    move v9, v4

    .line 174
    :goto_1
    move v10, v7

    .line 175
    goto :goto_2

    .line 176
    :catchall_1
    move-exception v0

    .line 177
    move-object/from16 v16, v6

    .line 178
    .line 179
    move-object v6, v5

    .line 180
    move-object/from16 v5, v16

    .line 181
    .line 182
    goto/16 :goto_d

    .line 183
    .line 184
    :cond_2
    move v9, v4

    .line 185
    move-object v6, v5

    .line 186
    goto :goto_1

    .line 187
    :goto_2
    :try_start_4
    iget-object v11, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 188
    .line 189
    invoke-static {v11}, Ll/mnc0;->p(Ll/mnc0;)Z

    .line 190
    .line 191
    .line 192
    move-result v11

    .line 193
    if-nez v11, :cond_c

    .line 194
    .line 195
    iget-object v11, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 196
    .line 197
    invoke-static {v11}, Ll/mnc0;->j(Ll/mnc0;)I

    .line 198
    .line 199
    .line 200
    move-result v11

    .line 201
    invoke-virtual {v2, v0, v4, v11}, Landroid/media/AudioRecord;->read([SII)I

    .line 202
    .line 203
    .line 204
    move-result v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 205
    iget-object v14, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 206
    .line 207
    const/4 v15, 0x5

    .line 208
    if-lez v11, :cond_b

    .line 209
    .line 210
    :try_start_5
    invoke-static {v14}, Ll/mnc0;->m(Ll/mnc0;)Z

    .line 211
    .line 212
    .line 213
    move-result v10

    .line 214
    if-eqz v10, :cond_3

    .line 215
    .line 216
    iget-object v10, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 217
    .line 218
    invoke-static {v10, v0, v5}, Ll/mnc0;->b(Ll/mnc0;[SLcom/tantanapp/media/ttagc/TTAgcProcessor;)[S

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    iget-object v10, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 223
    .line 224
    invoke-static {v10, v0, v6}, Ll/mnc0;->d(Ll/mnc0;[SLcom/tantanapp/media/ttns/TTNsProcessor;)[S

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    goto :goto_3

    .line 229
    :catchall_2
    move-exception v0

    .line 230
    goto/16 :goto_d

    .line 231
    .line 232
    :cond_3
    :goto_3
    if-nez v9, :cond_4

    .line 233
    .line 234
    move v10, v4

    .line 235
    move v9, v7

    .line 236
    goto :goto_2

    .line 237
    :cond_4
    iget-object v10, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 238
    .line 239
    invoke-static {v10, v0}, Ll/mnc0;->g(Ll/mnc0;[S)D

    .line 240
    .line 241
    .line 242
    move-result-wide v12

    .line 243
    double-to-int v12, v12

    .line 244
    invoke-static {v10, v12}, Ll/mnc0;->f(Ll/mnc0;I)I

    .line 245
    .line 246
    .line 247
    iget-object v10, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 248
    .line 249
    invoke-static {v10}, Ll/mnc0;->e(Ll/mnc0;)I

    .line 250
    .line 251
    .line 252
    move-result v10

    .line 253
    if-lez v10, :cond_5

    .line 254
    .line 255
    iget-object v10, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 256
    .line 257
    invoke-static {v10}, Ll/mnc0;->e(Ll/mnc0;)I

    .line 258
    .line 259
    .line 260
    move-result v10

    .line 261
    const/16 v12, 0x61a8

    .line 262
    .line 263
    if-ge v10, v12, :cond_5

    .line 264
    .line 265
    iget-object v10, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 266
    .line 267
    invoke-static {v10, v7}, Ll/mnc0;->h(Ll/mnc0;Z)Z

    .line 268
    .line 269
    .line 270
    goto :goto_4

    .line 271
    :cond_5
    iget-object v10, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 272
    .line 273
    invoke-static {v10, v4}, Ll/mnc0;->h(Ll/mnc0;Z)Z

    .line 274
    .line 275
    .line 276
    :goto_4
    if-gez v11, :cond_8

    .line 277
    .line 278
    iget-object v0, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 279
    .line 280
    invoke-static {v0}, Ll/mnc0;->a(Ll/mnc0;)Landroid/os/Handler;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    if-eqz v0, :cond_6

    .line 285
    .line 286
    invoke-direct {v1, v15}, Ll/mnc0$a;->a(I)V

    .line 287
    .line 288
    .line 289
    :cond_6
    :goto_5
    move v10, v4

    .line 290
    :cond_7
    :goto_6
    move v0, v7

    .line 291
    goto :goto_8

    .line 292
    :cond_8
    invoke-static {v0, v0, v11, v3}, Lcom/uraroji/garage/android/lame/SimpleLame;->encode([S[SI[B)I

    .line 293
    .line 294
    .line 295
    move-result v10

    .line 296
    if-gez v10, :cond_9

    .line 297
    .line 298
    iget-object v0, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 299
    .line 300
    invoke-static {v0}, Ll/mnc0;->a(Ll/mnc0;)Landroid/os/Handler;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    if-eqz v0, :cond_6

    .line 305
    .line 306
    const/4 v0, 0x6

    .line 307
    invoke-direct {v1, v0}, Ll/mnc0$a;->a(I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 308
    .line 309
    .line 310
    goto :goto_5

    .line 311
    :cond_9
    if-eqz v10, :cond_a

    .line 312
    .line 313
    :try_start_6
    invoke-virtual {v8, v3, v4, v10}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 314
    .line 315
    .line 316
    goto :goto_7

    .line 317
    :catch_0
    :try_start_7
    iget-object v0, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 318
    .line 319
    invoke-static {v0}, Ll/mnc0;->a(Ll/mnc0;)Landroid/os/Handler;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    if-eqz v0, :cond_6

    .line 324
    .line 325
    const/4 v0, 0x7

    .line 326
    invoke-direct {v1, v0}, Ll/mnc0$a;->a(I)V

    .line 327
    .line 328
    .line 329
    goto :goto_5

    .line 330
    :cond_a
    :goto_7
    move v10, v4

    .line 331
    goto/16 :goto_2

    .line 332
    .line 333
    :cond_b
    invoke-static {v14}, Ll/mnc0;->a(Ll/mnc0;)Landroid/os/Handler;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    if-eqz v0, :cond_7

    .line 338
    .line 339
    invoke-direct {v1, v15}, Ll/mnc0$a;->a(I)V

    .line 340
    .line 341
    .line 342
    goto :goto_6

    .line 343
    :cond_c
    move v0, v4

    .line 344
    :goto_8
    invoke-static {v3}, Lcom/uraroji/garage/android/lame/SimpleLame;->flush([B)I

    .line 345
    .line 346
    .line 347
    move-result v9

    .line 348
    if-gez v9, :cond_d

    .line 349
    .line 350
    iget-object v11, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 351
    .line 352
    invoke-static {v11}, Ll/mnc0;->a(Ll/mnc0;)Landroid/os/Handler;

    .line 353
    .line 354
    .line 355
    move-result-object v11

    .line 356
    if-eqz v11, :cond_d

    .line 357
    .line 358
    const/4 v11, 0x6

    .line 359
    invoke-direct {v1, v11}, Ll/mnc0$a;->a(I)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 360
    .line 361
    .line 362
    :cond_d
    if-eqz v9, :cond_e

    .line 363
    .line 364
    :try_start_8
    invoke-virtual {v8, v3, v4, v9}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 365
    .line 366
    .line 367
    goto :goto_9

    .line 368
    :catch_1
    :try_start_9
    iget-object v3, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 369
    .line 370
    invoke-static {v3}, Ll/mnc0;->a(Ll/mnc0;)Landroid/os/Handler;

    .line 371
    .line 372
    .line 373
    move-result-object v3

    .line 374
    if-eqz v3, :cond_e

    .line 375
    .line 376
    const/4 v3, 0x7

    .line 377
    invoke-direct {v1, v3}, Ll/mnc0$a;->a(I)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 378
    .line 379
    .line 380
    :cond_e
    :goto_9
    :try_start_a
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_2
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 381
    .line 382
    .line 383
    goto :goto_a

    .line 384
    :catch_2
    :try_start_b
    iget-object v3, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 385
    .line 386
    invoke-static {v3}, Ll/mnc0;->a(Ll/mnc0;)Landroid/os/Handler;

    .line 387
    .line 388
    .line 389
    move-result-object v3

    .line 390
    if-eqz v3, :cond_f

    .line 391
    .line 392
    const/16 v3, 0x8

    .line 393
    .line 394
    invoke-direct {v1, v3}, Ll/mnc0$a;->a(I)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 395
    .line 396
    .line 397
    :cond_f
    :goto_a
    :try_start_c
    iget-object v3, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 398
    .line 399
    invoke-static {v3}, Ll/mnc0;->m(Ll/mnc0;)Z

    .line 400
    .line 401
    .line 402
    move-result v3

    .line 403
    if-eqz v3, :cond_11

    .line 404
    .line 405
    if-eqz v5, :cond_10

    .line 406
    .line 407
    invoke-virtual {v5}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->free()V

    .line 408
    .line 409
    .line 410
    goto :goto_b

    .line 411
    :catchall_3
    move-exception v0

    .line 412
    goto :goto_e

    .line 413
    :cond_10
    :goto_b
    if-eqz v6, :cond_11

    .line 414
    .line 415
    invoke-virtual {v6}, Lcom/tantanapp/media/ttns/TTNsProcessor;->free()V

    .line 416
    .line 417
    .line 418
    :cond_11
    invoke-virtual {v2}, Landroid/media/AudioRecord;->getState()I

    .line 419
    .line 420
    .line 421
    move-result v3

    .line 422
    if-ne v3, v7, :cond_12

    .line 423
    .line 424
    invoke-virtual {v2}, Landroid/media/AudioRecord;->stop()V

    .line 425
    .line 426
    .line 427
    invoke-virtual {v2}, Landroid/media/AudioRecord;->release()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 428
    .line 429
    .line 430
    :cond_12
    invoke-static {}, Lcom/uraroji/garage/android/lame/SimpleLame;->close()V

    .line 431
    .line 432
    .line 433
    iget-object v2, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 434
    .line 435
    invoke-static {v2, v4}, Ll/mnc0;->c(Ll/mnc0;Z)Z

    .line 436
    .line 437
    .line 438
    iget-object v2, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 439
    .line 440
    invoke-static {v2}, Ll/mnc0;->a(Ll/mnc0;)Landroid/os/Handler;

    .line 441
    .line 442
    .line 443
    move-result-object v2

    .line 444
    if-eqz v2, :cond_14

    .line 445
    .line 446
    if-eqz v10, :cond_13

    .line 447
    .line 448
    if-nez v0, :cond_14

    .line 449
    .line 450
    const/16 v0, 0x9

    .line 451
    .line 452
    invoke-direct {v1, v0}, Ll/mnc0$a;->a(I)V

    .line 453
    .line 454
    .line 455
    goto :goto_c

    .line 456
    :cond_13
    invoke-direct {v1, v7}, Ll/mnc0$a;->a(I)V

    .line 457
    .line 458
    .line 459
    :cond_14
    :goto_c
    return-void

    .line 460
    :goto_d
    :try_start_d
    iget-object v3, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 461
    .line 462
    invoke-static {v3}, Ll/mnc0;->m(Ll/mnc0;)Z

    .line 463
    .line 464
    .line 465
    move-result v3

    .line 466
    if-eqz v3, :cond_16

    .line 467
    .line 468
    if-eqz v5, :cond_15

    .line 469
    .line 470
    invoke-virtual {v5}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->free()V

    .line 471
    .line 472
    .line 473
    :cond_15
    if-eqz v6, :cond_16

    .line 474
    .line 475
    invoke-virtual {v6}, Lcom/tantanapp/media/ttns/TTNsProcessor;->free()V

    .line 476
    .line 477
    .line 478
    :cond_16
    invoke-virtual {v2}, Landroid/media/AudioRecord;->getState()I

    .line 479
    .line 480
    .line 481
    move-result v3

    .line 482
    if-ne v3, v7, :cond_17

    .line 483
    .line 484
    invoke-virtual {v2}, Landroid/media/AudioRecord;->stop()V

    .line 485
    .line 486
    .line 487
    invoke-virtual {v2}, Landroid/media/AudioRecord;->release()V

    .line 488
    .line 489
    .line 490
    :cond_17
    throw v0

    .line 491
    :catch_3
    iget-object v0, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 492
    .line 493
    invoke-static {v0}, Ll/mnc0;->a(Ll/mnc0;)Landroid/os/Handler;

    .line 494
    .line 495
    .line 496
    move-result-object v0

    .line 497
    if-eqz v0, :cond_18

    .line 498
    .line 499
    const/4 v0, 0x4

    .line 500
    invoke-direct {v1, v0}, Ll/mnc0$a;->a(I)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .line 501
    .line 502
    .line 503
    :cond_18
    invoke-static {}, Lcom/uraroji/garage/android/lame/SimpleLame;->close()V

    .line 504
    .line 505
    .line 506
    iget-object v0, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 507
    .line 508
    invoke-static {v0, v4}, Ll/mnc0;->c(Ll/mnc0;Z)Z

    .line 509
    .line 510
    .line 511
    return-void

    .line 512
    :goto_e
    invoke-static {}, Lcom/uraroji/garage/android/lame/SimpleLame;->close()V

    .line 513
    .line 514
    .line 515
    iget-object v1, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 516
    .line 517
    invoke-static {v1, v4}, Ll/mnc0;->c(Ll/mnc0;Z)Z

    .line 518
    .line 519
    .line 520
    throw v0

    .line 521
    :catchall_4
    move-exception v0

    .line 522
    goto :goto_f

    .line 523
    :catch_4
    :try_start_e
    iget-object v0, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 524
    .line 525
    invoke-static {v0}, Ll/mnc0;->a(Ll/mnc0;)Landroid/os/Handler;

    .line 526
    .line 527
    .line 528
    move-result-object v0

    .line 529
    if-eqz v0, :cond_19

    .line 530
    .line 531
    invoke-direct {v1, v5}, Ll/mnc0$a;->a(I)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    .line 532
    .line 533
    .line 534
    :cond_19
    iget-object v0, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 535
    .line 536
    invoke-static {v0, v4}, Ll/mnc0;->c(Ll/mnc0;Z)Z

    .line 537
    .line 538
    .line 539
    return-void

    .line 540
    :catch_5
    :try_start_f
    iget-object v0, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 541
    .line 542
    invoke-static {v0}, Ll/mnc0;->a(Ll/mnc0;)Landroid/os/Handler;

    .line 543
    .line 544
    .line 545
    move-result-object v0

    .line 546
    if-eqz v0, :cond_1a

    .line 547
    .line 548
    invoke-direct {v1, v5}, Ll/mnc0$a;->a(I)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    .line 549
    .line 550
    .line 551
    :cond_1a
    iget-object v0, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 552
    .line 553
    invoke-static {v0, v4}, Ll/mnc0;->c(Ll/mnc0;Z)Z

    .line 554
    .line 555
    .line 556
    return-void

    .line 557
    :goto_f
    iget-object v1, v1, Ll/mnc0$a;->b:Ll/mnc0;

    .line 558
    .line 559
    invoke-static {v1, v4}, Ll/mnc0;->c(Ll/mnc0;Z)Z

    .line 560
    .line 561
    .line 562
    throw v0
.end method
