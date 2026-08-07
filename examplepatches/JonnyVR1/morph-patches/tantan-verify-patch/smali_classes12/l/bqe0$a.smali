.class Ll/bqe0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/bqe0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/bqe0;


# direct methods
.method public constructor <init>(Ll/bqe0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 10

    .line 1
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0xd

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    const/4 v3, 0x3

    .line 11
    const/4 v4, 0x0

    .line 12
    const/4 v5, 0x1

    .line 13
    if-eq v0, v5, :cond_c

    .line 14
    .line 15
    const/16 v6, 0x12

    .line 16
    .line 17
    if-eq v0, v6, :cond_a

    .line 18
    .line 19
    if-eq v0, v3, :cond_5

    .line 20
    .line 21
    const/4 v1, 0x4

    .line 22
    if-eq v0, v1, :cond_0

    .line 23
    .line 24
    goto/16 :goto_2

    .line 25
    .line 26
    :cond_0
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 27
    .line 28
    if-eqz v0, :cond_11

    .line 29
    .line 30
    array-length v1, v0

    .line 31
    if-ge v1, v3, :cond_1

    .line 32
    .line 33
    goto/16 :goto_2

    .line 34
    .line 35
    :cond_1
    aget v0, v0, v4

    .line 36
    .line 37
    float-to-double v0, v0

    .line 38
    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    double-to-float v0, v0

    .line 43
    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 44
    .line 45
    aget v1, v1, v5

    .line 46
    .line 47
    float-to-double v6, v1

    .line 48
    invoke-static {v6, v7}, Ljava/lang/Math;->toDegrees(D)D

    .line 49
    .line 50
    .line 51
    move-result-wide v6

    .line 52
    double-to-float v1, v6

    .line 53
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 54
    .line 55
    aget p1, p1, v2

    .line 56
    .line 57
    float-to-double v2, p1

    .line 58
    invoke-static {v2, v3}, Ljava/lang/Math;->toDegrees(D)D

    .line 59
    .line 60
    .line 61
    move-result-wide v2

    .line 62
    double-to-float p1, v2

    .line 63
    iget-object v2, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 64
    .line 65
    invoke-virtual {v2, v0, v1, p1}, Ll/bqe0;->x(FFF)D

    .line 66
    .line 67
    .line 68
    move-result-wide v0

    .line 69
    invoke-static {v2, v0, v1}, Ll/bqe0;->e(Ll/bqe0;D)D

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 73
    .line 74
    invoke-static {p1}, Ll/bqe0;->i(Ll/bqe0;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    const-wide/high16 v0, 0x4024000000000000L    # 10.0

    .line 79
    .line 80
    if-ne p1, v5, :cond_3

    .line 81
    .line 82
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 83
    .line 84
    invoke-static {p1}, Ll/bqe0;->b(Ll/bqe0;)D

    .line 85
    .line 86
    .line 87
    move-result-wide v2

    .line 88
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 89
    .line 90
    invoke-static {p1}, Ll/bqe0;->k(Ll/bqe0;)D

    .line 91
    .line 92
    .line 93
    move-result-wide v6

    .line 94
    cmpl-double p1, v2, v6

    .line 95
    .line 96
    iget-object v2, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 97
    .line 98
    if-ltz p1, :cond_2

    .line 99
    .line 100
    invoke-static {v2}, Ll/bqe0;->b(Ll/bqe0;)D

    .line 101
    .line 102
    .line 103
    move-result-wide v3

    .line 104
    invoke-static {v2, v3, v4}, Ll/bqe0;->l(Ll/bqe0;D)D

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_2
    invoke-static {v2}, Ll/bqe0;->b(Ll/bqe0;)D

    .line 109
    .line 110
    .line 111
    move-result-wide v2

    .line 112
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 113
    .line 114
    invoke-static {p1}, Ll/bqe0;->k(Ll/bqe0;)D

    .line 115
    .line 116
    .line 117
    move-result-wide v6

    .line 118
    sub-double/2addr v2, v6

    .line 119
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    .line 120
    .line 121
    .line 122
    move-result-wide v2

    .line 123
    cmpl-double p1, v2, v0

    .line 124
    .line 125
    if-lez p1, :cond_3

    .line 126
    .line 127
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 128
    .line 129
    invoke-static {p1}, Ll/bqe0;->b(Ll/bqe0;)D

    .line 130
    .line 131
    .line 132
    move-result-wide v2

    .line 133
    invoke-static {p1, v2, v3}, Ll/bqe0;->m(Ll/bqe0;D)D

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 137
    .line 138
    invoke-static {p1, v4}, Ll/bqe0;->j(Ll/bqe0;Z)Z

    .line 139
    .line 140
    .line 141
    :try_start_0
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 142
    .line 143
    invoke-static {p1}, Ll/bqe0;->a(Ll/bqe0;)Lorg/json/JSONObject;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    const/16 v2, 0x9

    .line 148
    .line 149
    new-array v2, v2, [B

    .line 150
    .line 151
    fill-array-data v2, :array_0

    .line 152
    .line 153
    .line 154
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    iget-object v3, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 159
    .line 160
    invoke-static {v3}, Ll/bqe0;->b(Ll/bqe0;)D

    .line 161
    .line 162
    .line 163
    move-result-wide v3

    .line 164
    iget-object v6, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 165
    .line 166
    invoke-static {v6}, Ll/bqe0;->k(Ll/bqe0;)D

    .line 167
    .line 168
    .line 169
    move-result-wide v6

    .line 170
    sub-double/2addr v3, v6

    .line 171
    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    .line 172
    .line 173
    .line 174
    move-result-wide v3

    .line 175
    invoke-virtual {p1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    .line 177
    .line 178
    :catch_0
    :cond_3
    :goto_0
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 179
    .line 180
    invoke-static {p1}, Ll/bqe0;->i(Ll/bqe0;)Z

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    if-nez p1, :cond_11

    .line 185
    .line 186
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 187
    .line 188
    invoke-static {p1}, Ll/bqe0;->b(Ll/bqe0;)D

    .line 189
    .line 190
    .line 191
    move-result-wide v2

    .line 192
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 193
    .line 194
    invoke-static {p1}, Ll/bqe0;->k(Ll/bqe0;)D

    .line 195
    .line 196
    .line 197
    move-result-wide v6

    .line 198
    cmpg-double p1, v2, v6

    .line 199
    .line 200
    iget-object v2, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 201
    .line 202
    if-gtz p1, :cond_4

    .line 203
    .line 204
    invoke-static {v2}, Ll/bqe0;->b(Ll/bqe0;)D

    .line 205
    .line 206
    .line 207
    move-result-wide p0

    .line 208
    invoke-static {v2, p0, p1}, Ll/bqe0;->l(Ll/bqe0;D)D

    .line 209
    .line 210
    .line 211
    goto/16 :goto_2

    .line 212
    .line 213
    :cond_4
    invoke-static {v2}, Ll/bqe0;->b(Ll/bqe0;)D

    .line 214
    .line 215
    .line 216
    move-result-wide v2

    .line 217
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 218
    .line 219
    invoke-static {p1}, Ll/bqe0;->k(Ll/bqe0;)D

    .line 220
    .line 221
    .line 222
    move-result-wide v6

    .line 223
    sub-double/2addr v2, v6

    .line 224
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    .line 225
    .line 226
    .line 227
    move-result-wide v2

    .line 228
    cmpl-double p1, v2, v0

    .line 229
    .line 230
    if-lez p1, :cond_11

    .line 231
    .line 232
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 233
    .line 234
    invoke-static {p1}, Ll/bqe0;->b(Ll/bqe0;)D

    .line 235
    .line 236
    .line 237
    move-result-wide v0

    .line 238
    invoke-static {p1, v0, v1}, Ll/bqe0;->m(Ll/bqe0;D)D

    .line 239
    .line 240
    .line 241
    iget-object p0, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 242
    .line 243
    invoke-static {p0, v5}, Ll/bqe0;->j(Ll/bqe0;Z)Z

    .line 244
    .line 245
    .line 246
    goto/16 :goto_2

    .line 247
    .line 248
    :cond_5
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 249
    .line 250
    if-eqz p1, :cond_11

    .line 251
    .line 252
    array-length v0, p1

    .line 253
    if-ge v0, v3, :cond_6

    .line 254
    .line 255
    goto/16 :goto_2

    .line 256
    .line 257
    :cond_6
    iget-object v0, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 258
    .line 259
    aget v1, p1, v4

    .line 260
    .line 261
    aget v3, p1, v5

    .line 262
    .line 263
    aget p1, p1, v2

    .line 264
    .line 265
    invoke-virtual {v0, v1, v3, p1}, Ll/bqe0;->x(FFF)D

    .line 266
    .line 267
    .line 268
    move-result-wide v1

    .line 269
    invoke-static {v0, v1, v2}, Ll/bqe0;->v(Ll/bqe0;D)D

    .line 270
    .line 271
    .line 272
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 273
    .line 274
    invoke-static {p1}, Ll/bqe0;->c(Ll/bqe0;)Z

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    .line 279
    .line 280
    if-ne p1, v5, :cond_8

    .line 281
    .line 282
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 283
    .line 284
    invoke-static {p1}, Ll/bqe0;->u(Ll/bqe0;)D

    .line 285
    .line 286
    .line 287
    move-result-wide v2

    .line 288
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 289
    .line 290
    invoke-static {p1}, Ll/bqe0;->f(Ll/bqe0;)D

    .line 291
    .line 292
    .line 293
    move-result-wide v6

    .line 294
    cmpl-double p1, v2, v6

    .line 295
    .line 296
    if-ltz p1, :cond_7

    .line 297
    .line 298
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 299
    .line 300
    invoke-static {p1}, Ll/bqe0;->u(Ll/bqe0;)D

    .line 301
    .line 302
    .line 303
    move-result-wide v2

    .line 304
    invoke-static {p1, v2, v3}, Ll/bqe0;->g(Ll/bqe0;D)D

    .line 305
    .line 306
    .line 307
    :cond_7
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 308
    .line 309
    invoke-static {p1}, Ll/bqe0;->u(Ll/bqe0;)D

    .line 310
    .line 311
    .line 312
    move-result-wide v2

    .line 313
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 314
    .line 315
    invoke-static {p1}, Ll/bqe0;->f(Ll/bqe0;)D

    .line 316
    .line 317
    .line 318
    move-result-wide v6

    .line 319
    sub-double/2addr v2, v6

    .line 320
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    .line 321
    .line 322
    .line 323
    move-result-wide v2

    .line 324
    cmpl-double p1, v2, v0

    .line 325
    .line 326
    if-lez p1, :cond_8

    .line 327
    .line 328
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 329
    .line 330
    invoke-static {p1}, Ll/bqe0;->u(Ll/bqe0;)D

    .line 331
    .line 332
    .line 333
    move-result-wide v2

    .line 334
    invoke-static {p1, v2, v3}, Ll/bqe0;->h(Ll/bqe0;D)D

    .line 335
    .line 336
    .line 337
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 338
    .line 339
    invoke-static {p1, v4}, Ll/bqe0;->d(Ll/bqe0;Z)Z

    .line 340
    .line 341
    .line 342
    :try_start_1
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 343
    .line 344
    invoke-static {p1}, Ll/bqe0;->a(Ll/bqe0;)Lorg/json/JSONObject;

    .line 345
    .line 346
    .line 347
    move-result-object p1

    .line 348
    const/16 v2, 0xb

    .line 349
    .line 350
    new-array v2, v2, [B

    .line 351
    .line 352
    fill-array-data v2, :array_1

    .line 353
    .line 354
    .line 355
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object v2

    .line 359
    iget-object v3, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 360
    .line 361
    invoke-static {v3}, Ll/bqe0;->u(Ll/bqe0;)D

    .line 362
    .line 363
    .line 364
    move-result-wide v3

    .line 365
    iget-object v6, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 366
    .line 367
    invoke-static {v6}, Ll/bqe0;->f(Ll/bqe0;)D

    .line 368
    .line 369
    .line 370
    move-result-wide v6

    .line 371
    sub-double/2addr v3, v6

    .line 372
    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    .line 373
    .line 374
    .line 375
    move-result-wide v3

    .line 376
    invoke-virtual {p1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 377
    .line 378
    .line 379
    :catch_1
    :cond_8
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 380
    .line 381
    invoke-static {p1}, Ll/bqe0;->c(Ll/bqe0;)Z

    .line 382
    .line 383
    .line 384
    move-result p1

    .line 385
    if-nez p1, :cond_11

    .line 386
    .line 387
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 388
    .line 389
    invoke-static {p1}, Ll/bqe0;->u(Ll/bqe0;)D

    .line 390
    .line 391
    .line 392
    move-result-wide v2

    .line 393
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 394
    .line 395
    invoke-static {p1}, Ll/bqe0;->f(Ll/bqe0;)D

    .line 396
    .line 397
    .line 398
    move-result-wide v6

    .line 399
    cmpg-double p1, v2, v6

    .line 400
    .line 401
    if-gtz p1, :cond_9

    .line 402
    .line 403
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 404
    .line 405
    invoke-static {p1}, Ll/bqe0;->u(Ll/bqe0;)D

    .line 406
    .line 407
    .line 408
    move-result-wide v2

    .line 409
    invoke-static {p1, v2, v3}, Ll/bqe0;->g(Ll/bqe0;D)D

    .line 410
    .line 411
    .line 412
    :cond_9
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 413
    .line 414
    invoke-static {p1}, Ll/bqe0;->u(Ll/bqe0;)D

    .line 415
    .line 416
    .line 417
    move-result-wide v2

    .line 418
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 419
    .line 420
    invoke-static {p1}, Ll/bqe0;->f(Ll/bqe0;)D

    .line 421
    .line 422
    .line 423
    move-result-wide v6

    .line 424
    sub-double/2addr v2, v6

    .line 425
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    .line 426
    .line 427
    .line 428
    move-result-wide v2

    .line 429
    cmpl-double p1, v2, v0

    .line 430
    .line 431
    if-lez p1, :cond_11

    .line 432
    .line 433
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 434
    .line 435
    invoke-static {p1}, Ll/bqe0;->u(Ll/bqe0;)D

    .line 436
    .line 437
    .line 438
    move-result-wide v0

    .line 439
    invoke-static {p1, v0, v1}, Ll/bqe0;->h(Ll/bqe0;D)D

    .line 440
    .line 441
    .line 442
    iget-object p0, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 443
    .line 444
    invoke-static {p0, v5}, Ll/bqe0;->d(Ll/bqe0;Z)Z

    .line 445
    .line 446
    .line 447
    goto/16 :goto_2

    .line 448
    .line 449
    :cond_a
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 450
    .line 451
    if-eqz p1, :cond_11

    .line 452
    .line 453
    array-length v0, p1

    .line 454
    if-ge v0, v5, :cond_b

    .line 455
    .line 456
    goto/16 :goto_2

    .line 457
    .line 458
    :cond_b
    aget p1, p1, v4

    .line 459
    .line 460
    :try_start_2
    iget-object p0, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 461
    .line 462
    invoke-static {p0}, Ll/bqe0;->a(Ll/bqe0;)Lorg/json/JSONObject;

    .line 463
    .line 464
    .line 465
    move-result-object p0

    .line 466
    new-array v0, v1, [B

    .line 467
    .line 468
    fill-array-data v0, :array_2

    .line 469
    .line 470
    .line 471
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    float-to-double v1, p1

    .line 476
    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_3

    .line 477
    .line 478
    .line 479
    return-void

    .line 480
    :cond_c
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 481
    .line 482
    if-eqz p1, :cond_11

    .line 483
    .line 484
    array-length v0, p1

    .line 485
    if-ge v0, v3, :cond_d

    .line 486
    .line 487
    goto/16 :goto_2

    .line 488
    .line 489
    :cond_d
    iget-object v0, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 490
    .line 491
    aget v3, p1, v4

    .line 492
    .line 493
    aget v6, p1, v5

    .line 494
    .line 495
    aget p1, p1, v2

    .line 496
    .line 497
    invoke-virtual {v0, v3, v6, p1}, Ll/bqe0;->x(FFF)D

    .line 498
    .line 499
    .line 500
    move-result-wide v2

    .line 501
    invoke-static {v0, v2, v3}, Ll/bqe0;->o(Ll/bqe0;D)D

    .line 502
    .line 503
    .line 504
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 505
    .line 506
    invoke-static {p1}, Ll/bqe0;->p(Ll/bqe0;)Z

    .line 507
    .line 508
    .line 509
    move-result p1

    .line 510
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 511
    .line 512
    if-ne p1, v5, :cond_f

    .line 513
    .line 514
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 515
    .line 516
    invoke-static {p1}, Ll/bqe0;->n(Ll/bqe0;)D

    .line 517
    .line 518
    .line 519
    move-result-wide v6

    .line 520
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 521
    .line 522
    invoke-static {p1}, Ll/bqe0;->r(Ll/bqe0;)D

    .line 523
    .line 524
    .line 525
    move-result-wide v8

    .line 526
    cmpl-double p1, v6, v8

    .line 527
    .line 528
    iget-object v0, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 529
    .line 530
    if-ltz p1, :cond_e

    .line 531
    .line 532
    invoke-static {v0}, Ll/bqe0;->n(Ll/bqe0;)D

    .line 533
    .line 534
    .line 535
    move-result-wide v6

    .line 536
    invoke-static {v0, v6, v7}, Ll/bqe0;->s(Ll/bqe0;D)D

    .line 537
    .line 538
    .line 539
    goto :goto_1

    .line 540
    :cond_e
    invoke-static {v0}, Ll/bqe0;->n(Ll/bqe0;)D

    .line 541
    .line 542
    .line 543
    move-result-wide v6

    .line 544
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 545
    .line 546
    invoke-static {p1}, Ll/bqe0;->r(Ll/bqe0;)D

    .line 547
    .line 548
    .line 549
    move-result-wide v8

    .line 550
    sub-double/2addr v6, v8

    .line 551
    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    .line 552
    .line 553
    .line 554
    move-result-wide v6

    .line 555
    cmpl-double p1, v6, v2

    .line 556
    .line 557
    if-lez p1, :cond_f

    .line 558
    .line 559
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 560
    .line 561
    invoke-static {p1}, Ll/bqe0;->n(Ll/bqe0;)D

    .line 562
    .line 563
    .line 564
    move-result-wide v6

    .line 565
    invoke-static {p1, v6, v7}, Ll/bqe0;->t(Ll/bqe0;D)D

    .line 566
    .line 567
    .line 568
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 569
    .line 570
    invoke-static {p1, v4}, Ll/bqe0;->q(Ll/bqe0;Z)Z

    .line 571
    .line 572
    .line 573
    :try_start_3
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 574
    .line 575
    invoke-static {p1}, Ll/bqe0;->a(Ll/bqe0;)Lorg/json/JSONObject;

    .line 576
    .line 577
    .line 578
    move-result-object p1

    .line 579
    new-array v0, v1, [B

    .line 580
    .line 581
    fill-array-data v0, :array_3

    .line 582
    .line 583
    .line 584
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 585
    .line 586
    .line 587
    move-result-object v0

    .line 588
    iget-object v1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 589
    .line 590
    invoke-static {v1}, Ll/bqe0;->n(Ll/bqe0;)D

    .line 591
    .line 592
    .line 593
    move-result-wide v6

    .line 594
    iget-object v1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 595
    .line 596
    invoke-static {v1}, Ll/bqe0;->r(Ll/bqe0;)D

    .line 597
    .line 598
    .line 599
    move-result-wide v8

    .line 600
    sub-double/2addr v6, v8

    .line 601
    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    .line 602
    .line 603
    .line 604
    move-result-wide v6

    .line 605
    invoke-virtual {p1, v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    .line 606
    .line 607
    .line 608
    :catch_2
    :cond_f
    :goto_1
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 609
    .line 610
    invoke-static {p1}, Ll/bqe0;->p(Ll/bqe0;)Z

    .line 611
    .line 612
    .line 613
    move-result p1

    .line 614
    if-nez p1, :cond_11

    .line 615
    .line 616
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 617
    .line 618
    invoke-static {p1}, Ll/bqe0;->n(Ll/bqe0;)D

    .line 619
    .line 620
    .line 621
    move-result-wide v0

    .line 622
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 623
    .line 624
    invoke-static {p1}, Ll/bqe0;->r(Ll/bqe0;)D

    .line 625
    .line 626
    .line 627
    move-result-wide v6

    .line 628
    cmpg-double p1, v0, v6

    .line 629
    .line 630
    iget-object v0, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 631
    .line 632
    if-gtz p1, :cond_10

    .line 633
    .line 634
    invoke-static {v0}, Ll/bqe0;->n(Ll/bqe0;)D

    .line 635
    .line 636
    .line 637
    move-result-wide p0

    .line 638
    invoke-static {v0, p0, p1}, Ll/bqe0;->s(Ll/bqe0;D)D

    .line 639
    .line 640
    .line 641
    goto :goto_2

    .line 642
    :cond_10
    invoke-static {v0}, Ll/bqe0;->n(Ll/bqe0;)D

    .line 643
    .line 644
    .line 645
    move-result-wide v0

    .line 646
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 647
    .line 648
    invoke-static {p1}, Ll/bqe0;->r(Ll/bqe0;)D

    .line 649
    .line 650
    .line 651
    move-result-wide v6

    .line 652
    sub-double/2addr v0, v6

    .line 653
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    .line 654
    .line 655
    .line 656
    move-result-wide v0

    .line 657
    cmpl-double p1, v0, v2

    .line 658
    .line 659
    if-lez p1, :cond_11

    .line 660
    .line 661
    iget-object p1, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 662
    .line 663
    invoke-static {p1}, Ll/bqe0;->n(Ll/bqe0;)D

    .line 664
    .line 665
    .line 666
    move-result-wide v0

    .line 667
    invoke-static {p1, v0, v1}, Ll/bqe0;->t(Ll/bqe0;D)D

    .line 668
    .line 669
    .line 670
    iget-object p0, p0, Ll/bqe0$a;->a:Ll/bqe0;

    .line 671
    .line 672
    invoke-static {p0, v5}, Ll/bqe0;->q(Ll/bqe0;Z)Z

    .line 673
    .line 674
    .line 675
    :catch_3
    :cond_11
    :goto_2
    return-void

    .line 676
    nop

    .line 677
    :array_0
    .array-data 1
        0x57t
        0x1ft
        0x43t
        0x58t
        0x12t
        0x5t
        0x5ft
        0x16t
        0x54t
    .end array-data

    .line 678
    .line 679
    .line 680
    .line 681
    .line 682
    .line 683
    .line 684
    .line 685
    .line 686
    nop

    .line 687
    :array_1
    .array-data 1
        0x5ft
        0x14t
        0x58t
        0x52t
        0xft
        0x12t
        0x51t
        0x12t
        0x58t
        0x58t
        0xft
    .end array-data

    .line 688
    .line 689
    .line 690
    .line 691
    .line 692
    .line 693
    .line 694
    .line 695
    .line 696
    .line 697
    :array_2
    .array-data 1
        0x43t
        0x12t
        0x54t
        0x47t
        0x3et
        0x2t
        0x55t
        0x12t
        0x54t
        0x54t
        0x15t
        0x9t
        0x42t
    .end array-data

    .line 698
    .line 699
    .line 700
    .line 701
    .line 702
    .line 703
    .line 704
    .line 705
    .line 706
    .line 707
    .line 708
    nop

    .line 709
    :array_3
    .array-data 1
        0x51t
        0x5t
        0x52t
        0x52t
        0xdt
        0x3t
        0x42t
        0x9t
        0x5ct
        0x52t
        0x15t
        0x3t
        0x42t
    .end array-data
.end method
