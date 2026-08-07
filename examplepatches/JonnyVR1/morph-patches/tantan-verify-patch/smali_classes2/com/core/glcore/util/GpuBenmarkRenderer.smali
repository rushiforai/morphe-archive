.class public Lcom/core/glcore/util/GpuBenmarkRenderer;
.super Lcom/core/glcore/util/GLRenderer;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "TestRenderer"

.field private static final fragmentShader:Ljava/lang/String; = "precision mediump float;         \nuniform vec4 uColor;             \nvoid main(){                     \n   gl_FragColor = uColor;        \n}"

.field private static final verticesShader:Ljava/lang/String; = "attribute vec2 vPosition;            \nvoid main(){                         \n   gl_Position = vec4(vPosition,0,1);\n}"


# instance fields
.field private gpuRenderListener:Lcom/core/glcore/util/GpuRenderListener;

.field private program:I

.field private uColor:I

.field private vPosition:I

.field private verticals:[F

.field private vertices:Ljava/nio/FloatBuffer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/core/glcore/util/GLRenderer;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x3840

    .line 5
    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    iput-object v0, p0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 9
    .line 10
    return-void
.end method

.method private getVertices()Ljava/nio/FloatBuffer;
    .locals 27

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    move v3, v2

    .line 6
    :goto_0
    const/16 v4, 0xb4

    .line 7
    .line 8
    if-ge v2, v4, :cond_1

    .line 9
    .line 10
    int-to-double v4, v2

    .line 11
    const-wide v6, 0x400921fb54442d18L    # Math.PI

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    mul-double/2addr v4, v6

    .line 17
    const-wide v8, 0x4066800000000000L    # 180.0

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    div-double/2addr v4, v8

    .line 23
    move v10, v1

    .line 24
    :goto_1
    const/16 v11, 0x168

    .line 25
    .line 26
    if-ge v10, v11, :cond_0

    .line 27
    .line 28
    int-to-double v11, v10

    .line 29
    mul-double/2addr v11, v6

    .line 30
    div-double/2addr v11, v8

    .line 31
    iget-object v13, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 32
    .line 33
    add-int/lit8 v14, v3, 0x1

    .line 34
    .line 35
    const-wide v15, 0x3fc41b2f769cf0e0L    # 0.15707963267948966

    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    add-double v17, v4, v15

    .line 41
    .line 42
    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->sin(D)D

    .line 43
    .line 44
    .line 45
    move-result-wide v19

    .line 46
    const-wide/high16 v21, 0x3ff0000000000000L    # 1.0

    .line 47
    .line 48
    mul-double v19, v19, v21

    .line 49
    .line 50
    add-double/2addr v15, v11

    .line 51
    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->cos(D)D

    .line 52
    .line 53
    .line 54
    move-result-wide v23

    .line 55
    mul-double v19, v19, v23

    .line 56
    .line 57
    const-wide/16 v23, 0x0

    .line 58
    .line 59
    add-double v6, v23, v19

    .line 60
    .line 61
    double-to-float v6, v6

    .line 62
    aput v6, v13, v3

    .line 63
    .line 64
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 65
    .line 66
    add-int/lit8 v7, v3, 0x2

    .line 67
    .line 68
    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->cos(D)D

    .line 69
    .line 70
    .line 71
    move-result-wide v19

    .line 72
    mul-double v19, v19, v21

    .line 73
    .line 74
    add-double v8, v23, v19

    .line 75
    .line 76
    double-to-float v8, v8

    .line 77
    aput v8, v6, v14

    .line 78
    .line 79
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 80
    .line 81
    add-int/lit8 v8, v3, 0x3

    .line 82
    .line 83
    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->sin(D)D

    .line 84
    .line 85
    .line 86
    move-result-wide v13

    .line 87
    mul-double v13, v13, v21

    .line 88
    .line 89
    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->sin(D)D

    .line 90
    .line 91
    .line 92
    move-result-wide v19

    .line 93
    mul-double v13, v13, v19

    .line 94
    .line 95
    const-wide/high16 v19, -0x4010000000000000L    # -1.0

    .line 96
    .line 97
    add-double v13, v19, v13

    .line 98
    .line 99
    double-to-float v9, v13

    .line 100
    aput v9, v6, v7

    .line 101
    .line 102
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 103
    .line 104
    add-int/lit8 v7, v3, 0x4

    .line 105
    .line 106
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 107
    .line 108
    .line 109
    move-result-wide v13

    .line 110
    mul-double v13, v13, v21

    .line 111
    .line 112
    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    .line 113
    .line 114
    .line 115
    move-result-wide v25

    .line 116
    mul-double v13, v13, v25

    .line 117
    .line 118
    add-double v13, v23, v13

    .line 119
    .line 120
    double-to-float v9, v13

    .line 121
    aput v9, v6, v8

    .line 122
    .line 123
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 124
    .line 125
    add-int/lit8 v8, v3, 0x5

    .line 126
    .line 127
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 128
    .line 129
    .line 130
    move-result-wide v13

    .line 131
    mul-double v13, v13, v21

    .line 132
    .line 133
    add-double v13, v23, v13

    .line 134
    .line 135
    double-to-float v9, v13

    .line 136
    aput v9, v6, v7

    .line 137
    .line 138
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 139
    .line 140
    add-int/lit8 v7, v3, 0x6

    .line 141
    .line 142
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 143
    .line 144
    .line 145
    move-result-wide v13

    .line 146
    mul-double v13, v13, v21

    .line 147
    .line 148
    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    .line 149
    .line 150
    .line 151
    move-result-wide v25

    .line 152
    mul-double v13, v13, v25

    .line 153
    .line 154
    add-double v13, v19, v13

    .line 155
    .line 156
    double-to-float v9, v13

    .line 157
    aput v9, v6, v8

    .line 158
    .line 159
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 160
    .line 161
    add-int/lit8 v8, v3, 0x7

    .line 162
    .line 163
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 164
    .line 165
    .line 166
    move-result-wide v13

    .line 167
    mul-double v13, v13, v21

    .line 168
    .line 169
    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->cos(D)D

    .line 170
    .line 171
    .line 172
    move-result-wide v25

    .line 173
    mul-double v13, v13, v25

    .line 174
    .line 175
    add-double v13, v23, v13

    .line 176
    .line 177
    double-to-float v9, v13

    .line 178
    aput v9, v6, v7

    .line 179
    .line 180
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 181
    .line 182
    add-int/lit8 v7, v3, 0x8

    .line 183
    .line 184
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 185
    .line 186
    .line 187
    move-result-wide v13

    .line 188
    mul-double v13, v13, v21

    .line 189
    .line 190
    add-double v13, v23, v13

    .line 191
    .line 192
    double-to-float v9, v13

    .line 193
    aput v9, v6, v8

    .line 194
    .line 195
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 196
    .line 197
    add-int/lit8 v8, v3, 0x9

    .line 198
    .line 199
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 200
    .line 201
    .line 202
    move-result-wide v13

    .line 203
    mul-double v13, v13, v21

    .line 204
    .line 205
    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->sin(D)D

    .line 206
    .line 207
    .line 208
    move-result-wide v25

    .line 209
    mul-double v13, v13, v25

    .line 210
    .line 211
    add-double v13, v19, v13

    .line 212
    .line 213
    double-to-float v9, v13

    .line 214
    aput v9, v6, v7

    .line 215
    .line 216
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 217
    .line 218
    add-int/lit8 v7, v3, 0xa

    .line 219
    .line 220
    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->sin(D)D

    .line 221
    .line 222
    .line 223
    move-result-wide v13

    .line 224
    mul-double v13, v13, v21

    .line 225
    .line 226
    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->cos(D)D

    .line 227
    .line 228
    .line 229
    move-result-wide v25

    .line 230
    mul-double v13, v13, v25

    .line 231
    .line 232
    add-double v13, v23, v13

    .line 233
    .line 234
    double-to-float v9, v13

    .line 235
    aput v9, v6, v8

    .line 236
    .line 237
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 238
    .line 239
    add-int/lit8 v8, v3, 0xb

    .line 240
    .line 241
    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->cos(D)D

    .line 242
    .line 243
    .line 244
    move-result-wide v13

    .line 245
    mul-double v13, v13, v21

    .line 246
    .line 247
    add-double v13, v23, v13

    .line 248
    .line 249
    double-to-float v9, v13

    .line 250
    aput v9, v6, v7

    .line 251
    .line 252
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 253
    .line 254
    add-int/lit8 v7, v3, 0xc

    .line 255
    .line 256
    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->sin(D)D

    .line 257
    .line 258
    .line 259
    move-result-wide v13

    .line 260
    mul-double v13, v13, v21

    .line 261
    .line 262
    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->sin(D)D

    .line 263
    .line 264
    .line 265
    move-result-wide v15

    .line 266
    mul-double/2addr v13, v15

    .line 267
    add-double v13, v19, v13

    .line 268
    .line 269
    double-to-float v9, v13

    .line 270
    aput v9, v6, v8

    .line 271
    .line 272
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 273
    .line 274
    add-int/lit8 v8, v3, 0xd

    .line 275
    .line 276
    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->sin(D)D

    .line 277
    .line 278
    .line 279
    move-result-wide v13

    .line 280
    mul-double v13, v13, v21

    .line 281
    .line 282
    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    .line 283
    .line 284
    .line 285
    move-result-wide v15

    .line 286
    mul-double/2addr v13, v15

    .line 287
    add-double v13, v23, v13

    .line 288
    .line 289
    double-to-float v9, v13

    .line 290
    aput v9, v6, v7

    .line 291
    .line 292
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 293
    .line 294
    add-int/lit8 v7, v3, 0xe

    .line 295
    .line 296
    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->cos(D)D

    .line 297
    .line 298
    .line 299
    move-result-wide v13

    .line 300
    mul-double v13, v13, v21

    .line 301
    .line 302
    add-double v13, v23, v13

    .line 303
    .line 304
    double-to-float v9, v13

    .line 305
    aput v9, v6, v8

    .line 306
    .line 307
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 308
    .line 309
    add-int/lit8 v8, v3, 0xf

    .line 310
    .line 311
    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->sin(D)D

    .line 312
    .line 313
    .line 314
    move-result-wide v13

    .line 315
    mul-double v13, v13, v21

    .line 316
    .line 317
    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    .line 318
    .line 319
    .line 320
    move-result-wide v15

    .line 321
    mul-double/2addr v13, v15

    .line 322
    add-double v13, v19, v13

    .line 323
    .line 324
    double-to-float v9, v13

    .line 325
    aput v9, v6, v7

    .line 326
    .line 327
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 328
    .line 329
    add-int/lit8 v7, v3, 0x10

    .line 330
    .line 331
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 332
    .line 333
    .line 334
    move-result-wide v13

    .line 335
    mul-double v13, v13, v21

    .line 336
    .line 337
    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    .line 338
    .line 339
    .line 340
    move-result-wide v15

    .line 341
    mul-double/2addr v13, v15

    .line 342
    add-double v13, v23, v13

    .line 343
    .line 344
    double-to-float v9, v13

    .line 345
    aput v9, v6, v8

    .line 346
    .line 347
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 348
    .line 349
    add-int/lit8 v8, v3, 0x11

    .line 350
    .line 351
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 352
    .line 353
    .line 354
    move-result-wide v13

    .line 355
    mul-double v13, v13, v21

    .line 356
    .line 357
    add-double v13, v23, v13

    .line 358
    .line 359
    double-to-float v9, v13

    .line 360
    aput v9, v6, v7

    .line 361
    .line 362
    iget-object v6, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 363
    .line 364
    add-int/lit8 v3, v3, 0x12

    .line 365
    .line 366
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 367
    .line 368
    .line 369
    move-result-wide v13

    .line 370
    mul-double v21, v21, v13

    .line 371
    .line 372
    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    .line 373
    .line 374
    .line 375
    move-result-wide v11

    .line 376
    mul-double v21, v21, v11

    .line 377
    .line 378
    add-double v11, v19, v21

    .line 379
    .line 380
    double-to-float v7, v11

    .line 381
    aput v7, v6, v8

    .line 382
    .line 383
    add-int/lit8 v10, v10, 0x9

    .line 384
    .line 385
    const-wide v6, 0x400921fb54442d18L    # Math.PI

    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    const-wide v8, 0x4066800000000000L    # 180.0

    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    goto/16 :goto_1

    .line 396
    .line 397
    :cond_0
    add-int/lit8 v2, v2, 0x9

    .line 398
    .line 399
    goto/16 :goto_0

    .line 400
    .line 401
    :cond_1
    iget-object v2, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 402
    .line 403
    array-length v2, v2

    .line 404
    mul-int/lit8 v2, v2, 0x4

    .line 405
    .line 406
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 407
    .line 408
    .line 409
    move-result-object v2

    .line 410
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 411
    .line 412
    .line 413
    move-result-object v3

    .line 414
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 415
    .line 416
    .line 417
    move-result-object v2

    .line 418
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 419
    .line 420
    .line 421
    move-result-object v2

    .line 422
    iget-object v3, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->verticals:[F

    .line 423
    .line 424
    invoke-virtual {v2, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 425
    .line 426
    .line 427
    move-result-object v2

    .line 428
    iput-object v2, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->vertices:Ljava/nio/FloatBuffer;

    .line 429
    .line 430
    invoke-virtual {v2, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 431
    .line 432
    .line 433
    iget-object v0, v0, Lcom/core/glcore/util/GpuBenmarkRenderer;->vertices:Ljava/nio/FloatBuffer;

    .line 434
    .line 435
    return-object v0
.end method


# virtual methods
.method public onCreated()V
    .locals 2

    .line 1
    const-string v0, "attribute vec2 vPosition;            \nvoid main(){                         \n   gl_Position = vec4(vPosition,0,1);\n}"

    .line 2
    .line 3
    const-string v1, "precision mediump float;         \nuniform vec4 uColor;             \nvoid main(){                     \n   gl_FragColor = uColor;        \n}"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/core/glcore/util/ShaderUtil;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/core/glcore/util/GpuBenmarkRenderer;->program:I

    .line 10
    .line 11
    const-string v1, "vPosition"

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lcom/core/glcore/util/GpuBenmarkRenderer;->vPosition:I

    .line 18
    .line 19
    iget v0, p0, Lcom/core/glcore/util/GpuBenmarkRenderer;->program:I

    .line 20
    .line 21
    const-string v1, "uColor"

    .line 22
    .line 23
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Lcom/core/glcore/util/GpuBenmarkRenderer;->uColor:I

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/core/glcore/util/GpuBenmarkRenderer;->getVertices()Ljava/nio/FloatBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/core/glcore/util/GpuBenmarkRenderer;->vertices:Ljava/nio/FloatBuffer;

    .line 34
    .line 35
    return-void
.end method

.method public onDestroy()V
    .locals 0

    return-void
.end method

.method public onDrawFrame(Lcom/core/glcore/util/GLSurface;)V
    .locals 12

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    long-to-double v0, v0

    .line 6
    const/high16 p1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {p1, v2, v2, p1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 10
    .line 11
    .line 12
    const/16 v3, 0x4100

    .line 13
    .line 14
    invoke-static {v3}, Landroid/opengl/GLES20;->glClear(I)V

    .line 15
    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    move v4, v3

    .line 19
    :goto_0
    const/16 v5, 0x5dc

    .line 20
    .line 21
    if-ge v4, v5, :cond_0

    .line 22
    .line 23
    iget v5, p0, Lcom/core/glcore/util/GpuBenmarkRenderer;->program:I

    .line 24
    .line 25
    invoke-static {v5}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 26
    .line 27
    .line 28
    iget v6, p0, Lcom/core/glcore/util/GpuBenmarkRenderer;->vPosition:I

    .line 29
    .line 30
    const/16 v10, 0xc

    .line 31
    .line 32
    iget-object v11, p0, Lcom/core/glcore/util/GpuBenmarkRenderer;->vertices:Ljava/nio/FloatBuffer;

    .line 33
    .line 34
    const/4 v7, 0x3

    .line 35
    const/16 v8, 0x1406

    .line 36
    .line 37
    const/4 v9, 0x0

    .line 38
    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 39
    .line 40
    .line 41
    iget v5, p0, Lcom/core/glcore/util/GpuBenmarkRenderer;->vPosition:I

    .line 42
    .line 43
    invoke-static {v5}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 44
    .line 45
    .line 46
    iget v5, p0, Lcom/core/glcore/util/GpuBenmarkRenderer;->uColor:I

    .line 47
    .line 48
    invoke-static {v5, v2, p1, v2, p1}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 49
    .line 50
    .line 51
    const/4 v5, 0x4

    .line 52
    const/16 v6, 0x12c0

    .line 53
    .line 54
    invoke-static {v5, v3, v6}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 55
    .line 56
    .line 57
    add-int/lit8 v4, v4, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 61
    .line 62
    .line 63
    move-result-wide v2

    .line 64
    long-to-double v2, v2

    .line 65
    sub-double/2addr v2, v0

    .line 66
    iget-object p0, p0, Lcom/core/glcore/util/GpuBenmarkRenderer;->gpuRenderListener:Lcom/core/glcore/util/GpuRenderListener;

    .line 67
    .line 68
    invoke-interface {p0, v2, v3}, Lcom/core/glcore/util/GpuRenderListener;->getRenderTime(D)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public onUpdate()V
    .locals 0

    return-void
.end method

.method public setGpuRenderListener(Lcom/core/glcore/util/GpuRenderListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/util/GpuBenmarkRenderer;->gpuRenderListener:Lcom/core/glcore/util/GpuRenderListener;

    .line 2
    .line 3
    return-void
.end method
