.class public Lcom/momo/mcamera/mask/BigEyeFilter;
.super Ll/jt2;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;
    }
.end annotation


# static fields
.field public static final UNIFORM_CENTER_LEFT:Ljava/lang/String; = "centerLeft"

.field public static final UNIFORM_CENTER_RIGHT:Ljava/lang/String; = "centerRight"

.field public static final UNIFORM_RADIUS_LEFT:Ljava/lang/String; = "radiusLeft"

.field public static final UNIFORM_RADIUS_RIGHT:Ljava/lang/String; = "radiusRight"

.field public static final UNIFORM_SCALE:Ljava/lang/String; = "scale"

.field public static final UNIFORM_TEXTURE_SIZE:Ljava/lang/String; = "textureSize"


# instance fields
.field public centerLeft:[F

.field public centerRight:[F

.field private eyesProgram:Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;

.field public handleCenterLeft:I

.field public handleCenterRight:I

.field public handleRadiuRight:I

.field public handleRadiusLeft:I

.field public handleScale:I

.field public handleTextureSize:I

.field private mEyeScale:F

.field private mMmcvInfo:Ll/omw;

.field public radiusLeft:F

.field public radiusRight:F

.field private scale:F

.field public textureSize:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->handleTextureSize:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->handleCenterLeft:I

    .line 8
    .line 9
    iput v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->handleCenterRight:I

    .line 10
    .line 11
    iput v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->handleRadiusLeft:I

    .line 12
    .line 13
    iput v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->handleRadiuRight:I

    .line 14
    .line 15
    iput v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->handleScale:I

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    new-array v1, v0, [F

    .line 19
    .line 20
    iput-object v1, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->textureSize:[F

    .line 21
    .line 22
    new-array v1, v0, [F

    .line 23
    .line 24
    iput-object v1, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->centerLeft:[F

    .line 25
    .line 26
    new-array v0, v0, [F

    .line 27
    .line 28
    iput-object v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->centerRight:[F

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->radiusLeft:F

    .line 32
    .line 33
    iput v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->radiusRight:F

    .line 34
    .line 35
    iput v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->scale:F

    .line 36
    .line 37
    iput v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mEyeScale:F

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    iput-object v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 41
    .line 42
    new-instance v0, Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    invoke-direct {v0, p0, v1, v1}, Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;-><init>(Lcom/momo/mcamera/mask/BigEyeFilter;II)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->eyesProgram:Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;

    .line 49
    .line 50
    const/4 p0, 0x4

    .line 51
    invoke-virtual {v0, p0}, Lcom/momo/mcamera/mask/GLProgram;->setDrawType(I)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/mask/BigEyeFilter;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->scale:F

    .line 2
    .line 3
    return p0
.end method

.method private drawEyes()V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/omw;->n()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_4

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    move v1, v0

    .line 13
    :goto_0
    iget-object v2, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/omw;->n()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-ge v1, v2, :cond_4

    .line 20
    .line 21
    iget-object v2, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 22
    .line 23
    invoke-virtual {v2, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    if-eqz v2, :cond_3

    .line 28
    .line 29
    iget-object v2, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 30
    .line 31
    invoke-virtual {v2, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Ll/nuf;->r()[F

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    if-nez v2, :cond_0

    .line 40
    .line 41
    goto/16 :goto_3

    .line 42
    .line 43
    :cond_0
    iget-object v2, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 44
    .line 45
    iget v3, v2, Ll/omw;->b:I

    .line 46
    .line 47
    const/16 v4, 0x5a

    .line 48
    .line 49
    if-eq v3, v4, :cond_2

    .line 50
    .line 51
    const/16 v4, 0x10e

    .line 52
    .line 53
    if-ne v3, v4, :cond_1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    invoke-virtual {v2}, Ll/omw;->m()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    goto :goto_2

    .line 61
    :cond_2
    :goto_1
    invoke-virtual {v2}, Ll/omw;->t()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    :goto_2
    new-instance v3, Landroid/graphics/PointF;

    .line 66
    .line 67
    iget-object v4, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 68
    .line 69
    invoke-virtual {v4, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-virtual {v4}, Ll/nuf;->r()[F

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    const/16 v5, 0x27

    .line 78
    .line 79
    aget v4, v4, v5

    .line 80
    .line 81
    iget-object v5, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 82
    .line 83
    invoke-virtual {v5, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    invoke-virtual {v5}, Ll/nuf;->r()[F

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    const/16 v6, 0x8f

    .line 92
    .line 93
    aget v5, v5, v6

    .line 94
    .line 95
    invoke-direct {v3, v4, v5}, Landroid/graphics/PointF;-><init>(FF)V

    .line 96
    .line 97
    .line 98
    new-instance v4, Landroid/graphics/PointF;

    .line 99
    .line 100
    iget-object v5, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 101
    .line 102
    invoke-virtual {v5, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    invoke-virtual {v5}, Ll/nuf;->r()[F

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    const/16 v6, 0x2d

    .line 111
    .line 112
    aget v5, v5, v6

    .line 113
    .line 114
    iget-object v6, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 115
    .line 116
    invoke-virtual {v6, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 117
    .line 118
    .line 119
    move-result-object v6

    .line 120
    invoke-virtual {v6}, Ll/nuf;->r()[F

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    const/16 v7, 0x95

    .line 125
    .line 126
    aget v6, v6, v7

    .line 127
    .line 128
    invoke-direct {v4, v5, v6}, Landroid/graphics/PointF;-><init>(FF)V

    .line 129
    .line 130
    .line 131
    iget-object v5, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->centerLeft:[F

    .line 132
    .line 133
    iget v6, v3, Landroid/graphics/PointF;->x:F

    .line 134
    .line 135
    iget v7, v4, Landroid/graphics/PointF;->x:F

    .line 136
    .line 137
    add-float/2addr v6, v7

    .line 138
    const/high16 v7, 0x40000000    # 2.0f

    .line 139
    .line 140
    div-float/2addr v6, v7

    .line 141
    aput v6, v5, v0

    .line 142
    .line 143
    int-to-float v2, v2

    .line 144
    const/high16 v6, 0x3f800000    # 1.0f

    .line 145
    .line 146
    mul-float/2addr v2, v6

    .line 147
    iget v8, v3, Landroid/graphics/PointF;->y:F

    .line 148
    .line 149
    iget v9, v4, Landroid/graphics/PointF;->y:F

    .line 150
    .line 151
    add-float/2addr v8, v9

    .line 152
    div-float/2addr v8, v7

    .line 153
    sub-float v8, v2, v8

    .line 154
    .line 155
    const/4 v9, 0x1

    .line 156
    aput v8, v5, v9

    .line 157
    .line 158
    new-instance v5, Landroid/graphics/PointF;

    .line 159
    .line 160
    iget-object v8, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 161
    .line 162
    invoke-virtual {v8, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 163
    .line 164
    .line 165
    move-result-object v8

    .line 166
    invoke-virtual {v8}, Ll/nuf;->r()[F

    .line 167
    .line 168
    .line 169
    move-result-object v8

    .line 170
    const/16 v10, 0x33

    .line 171
    .line 172
    aget v8, v8, v10

    .line 173
    .line 174
    iget-object v10, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 175
    .line 176
    invoke-virtual {v10, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 177
    .line 178
    .line 179
    move-result-object v10

    .line 180
    invoke-virtual {v10}, Ll/nuf;->r()[F

    .line 181
    .line 182
    .line 183
    move-result-object v10

    .line 184
    const/16 v11, 0x9b

    .line 185
    .line 186
    aget v10, v10, v11

    .line 187
    .line 188
    invoke-direct {v5, v8, v10}, Landroid/graphics/PointF;-><init>(FF)V

    .line 189
    .line 190
    .line 191
    new-instance v8, Landroid/graphics/PointF;

    .line 192
    .line 193
    iget-object v10, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 194
    .line 195
    invoke-virtual {v10, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 196
    .line 197
    .line 198
    move-result-object v10

    .line 199
    invoke-virtual {v10}, Ll/nuf;->r()[F

    .line 200
    .line 201
    .line 202
    move-result-object v10

    .line 203
    const/16 v11, 0x39

    .line 204
    .line 205
    aget v10, v10, v11

    .line 206
    .line 207
    iget-object v11, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 208
    .line 209
    invoke-virtual {v11, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 210
    .line 211
    .line 212
    move-result-object v11

    .line 213
    invoke-virtual {v11}, Ll/nuf;->r()[F

    .line 214
    .line 215
    .line 216
    move-result-object v11

    .line 217
    const/16 v12, 0xa1

    .line 218
    .line 219
    aget v11, v11, v12

    .line 220
    .line 221
    invoke-direct {v8, v10, v11}, Landroid/graphics/PointF;-><init>(FF)V

    .line 222
    .line 223
    .line 224
    iget-object v10, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->centerRight:[F

    .line 225
    .line 226
    iget v11, v5, Landroid/graphics/PointF;->x:F

    .line 227
    .line 228
    iget v12, v8, Landroid/graphics/PointF;->x:F

    .line 229
    .line 230
    add-float/2addr v11, v12

    .line 231
    div-float/2addr v11, v7

    .line 232
    aput v11, v10, v0

    .line 233
    .line 234
    iget v11, v5, Landroid/graphics/PointF;->y:F

    .line 235
    .line 236
    iget v12, v8, Landroid/graphics/PointF;->y:F

    .line 237
    .line 238
    add-float/2addr v11, v12

    .line 239
    div-float/2addr v11, v7

    .line 240
    sub-float/2addr v2, v11

    .line 241
    aput v2, v10, v9

    .line 242
    .line 243
    iget v2, v3, Landroid/graphics/PointF;->x:F

    .line 244
    .line 245
    iget v7, v4, Landroid/graphics/PointF;->x:F

    .line 246
    .line 247
    sub-float v10, v2, v7

    .line 248
    .line 249
    sub-float/2addr v2, v7

    .line 250
    mul-float/2addr v10, v2

    .line 251
    iget v2, v3, Landroid/graphics/PointF;->y:F

    .line 252
    .line 253
    iget v3, v4, Landroid/graphics/PointF;->y:F

    .line 254
    .line 255
    sub-float v4, v2, v3

    .line 256
    .line 257
    sub-float/2addr v2, v3

    .line 258
    mul-float/2addr v4, v2

    .line 259
    add-float/2addr v10, v4

    .line 260
    float-to-double v2, v10

    .line 261
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 262
    .line 263
    .line 264
    move-result-wide v2

    .line 265
    iget v4, v5, Landroid/graphics/PointF;->x:F

    .line 266
    .line 267
    iget v7, v8, Landroid/graphics/PointF;->x:F

    .line 268
    .line 269
    sub-float v10, v4, v7

    .line 270
    .line 271
    sub-float/2addr v4, v7

    .line 272
    mul-float/2addr v10, v4

    .line 273
    iget v4, v5, Landroid/graphics/PointF;->y:F

    .line 274
    .line 275
    iget v5, v8, Landroid/graphics/PointF;->y:F

    .line 276
    .line 277
    sub-float v7, v4, v5

    .line 278
    .line 279
    sub-float/2addr v4, v5

    .line 280
    mul-float/2addr v7, v4

    .line 281
    add-float/2addr v10, v7

    .line 282
    float-to-double v4, v10

    .line 283
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 284
    .line 285
    .line 286
    move-result-wide v4

    .line 287
    add-double/2addr v4, v2

    .line 288
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 289
    .line 290
    div-double/2addr v4, v2

    .line 291
    iget-object v2, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 292
    .line 293
    invoke-virtual {v2, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    invoke-virtual {v2}, Ll/nuf;->c()[F

    .line 298
    .line 299
    .line 300
    move-result-object v2

    .line 301
    aget v2, v2, v9

    .line 302
    .line 303
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 304
    .line 305
    .line 306
    move-result v2

    .line 307
    const/high16 v3, 0x42700000    # 60.0f

    .line 308
    .line 309
    div-float/2addr v2, v3

    .line 310
    invoke-static {v2, v6}, Ljava/lang/Math;->min(FF)F

    .line 311
    .line 312
    .line 313
    move-result v2

    .line 314
    sub-float/2addr v6, v2

    .line 315
    iget v2, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mEyeScale:F

    .line 316
    .line 317
    float-to-double v2, v2

    .line 318
    const-wide v7, 0x3fc999999999999aL    # 0.2

    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    mul-double/2addr v2, v7

    .line 324
    float-to-double v6, v6

    .line 325
    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    .line 326
    .line 327
    sub-double/2addr v6, v8

    .line 328
    invoke-static {v6, v7}, Ljava/lang/Math;->exp(D)D

    .line 329
    .line 330
    .line 331
    move-result-wide v6

    .line 332
    mul-double/2addr v2, v6

    .line 333
    double-to-float v2, v2

    .line 334
    iput v2, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->scale:F

    .line 335
    .line 336
    const-wide v2, 0x3fe999999999999aL    # 0.8

    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    mul-double/2addr v4, v2

    .line 342
    double-to-float v2, v4

    .line 343
    iput v2, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->radiusLeft:F

    .line 344
    .line 345
    iput v2, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->radiusRight:F

    .line 346
    .line 347
    iget v2, p0, Ll/wej;->texture_in:I

    .line 348
    .line 349
    filled-new-array {v2}, [I

    .line 350
    .line 351
    .line 352
    move-result-object v2

    .line 353
    iget-object v3, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 354
    .line 355
    invoke-virtual {v3, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 356
    .line 357
    .line 358
    move-result-object v3

    .line 359
    invoke-virtual {v3}, Ll/nuf;->r()[F

    .line 360
    .line 361
    .line 362
    move-result-object v3

    .line 363
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 364
    .line 365
    .line 366
    move-result v4

    .line 367
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 368
    .line 369
    .line 370
    move-result v5

    .line 371
    const/4 v6, 0x0

    .line 372
    invoke-static {v3, v4, v5, v6}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getFaceTriangulation([FII[F)[[F

    .line 373
    .line 374
    .line 375
    move-result-object v3

    .line 376
    iget-object v4, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->eyesProgram:Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;

    .line 377
    .line 378
    invoke-virtual {v4, v3, v2}, Lcom/momo/mcamera/mask/GLProgram;->drawFrame([[F[I)V

    .line 379
    .line 380
    .line 381
    :cond_3
    :goto_3
    add-int/lit8 v1, v1, 0x1

    .line 382
    .line 383
    goto/16 :goto_0

    .line 384
    .line 385
    :cond_4
    return-void
.end method


# virtual methods
.method public drawSub()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->drawSub()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/mcamera/mask/BigEyeFilter;->drawEyes()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->eyesProgram:Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/momo/mcamera/mask/GLProgram;->setRenderSize(II)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-super {p0, p1, p2, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setEyeScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mEyeScale:F

    .line 2
    .line 3
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    :try_start_0
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iput-object p1, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->mMmcvInfo:Ll/omw;

    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method
