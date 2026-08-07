.class Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->A2(JZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Z

.field final synthetic c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;JZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 2
    .line 3
    iput-wide p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->a:J

    .line 4
    .line 5
    iput-boolean p4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    move v2, v1

    .line 5
    :goto_0
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 6
    .line 7
    iget v4, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 8
    .line 9
    const/4 v5, -0x1

    .line 10
    if-ge v2, v4, :cond_1

    .line 11
    .line 12
    iget-wide v6, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->a:J

    .line 13
    .line 14
    iget-object v8, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t:[J

    .line 15
    .line 16
    aget-wide v9, v8, v2

    .line 17
    .line 18
    cmp-long v6, v6, v9

    .line 19
    .line 20
    if-nez v6, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v2, v5

    .line 27
    :goto_1
    const-string v6, ", ind="

    .line 28
    .line 29
    const-string v7, "close: "

    .line 30
    .line 31
    const-string v8, "mergeFilter"

    .line 32
    .line 33
    if-eq v2, v5, :cond_a

    .line 34
    .line 35
    if-gt v4, v1, :cond_2

    .line 36
    .line 37
    goto/16 :goto_3

    .line 38
    .line 39
    :cond_2
    invoke-static {v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const/4 v4, 0x0

    .line 44
    if-ne v3, v2, :cond_3

    .line 45
    .line 46
    if-eq v2, v5, :cond_3

    .line 47
    .line 48
    if-eqz v2, :cond_3

    .line 49
    .line 50
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 51
    .line 52
    iget-object v9, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 53
    .line 54
    aget v10, v9, v2

    .line 55
    .line 56
    aput v10, v9, v4

    .line 57
    .line 58
    iget-object v9, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 59
    .line 60
    aget v10, v9, v2

    .line 61
    .line 62
    aput v10, v9, v4

    .line 63
    .line 64
    iget-object v9, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 65
    .line 66
    aget v10, v9, v2

    .line 67
    .line 68
    aput v10, v9, v4

    .line 69
    .line 70
    iget-object v9, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 71
    .line 72
    aget v10, v9, v2

    .line 73
    .line 74
    aput v10, v9, v4

    .line 75
    .line 76
    iget-object v9, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->i:[I

    .line 77
    .line 78
    aget v10, v9, v2

    .line 79
    .line 80
    aput v10, v9, v4

    .line 81
    .line 82
    invoke-static {v3, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 83
    .line 84
    .line 85
    :cond_3
    iget-boolean v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->b:Z

    .line 86
    .line 87
    const-string v9, ", svn="

    .line 88
    .line 89
    const-string v10, ", fsi="

    .line 90
    .line 91
    if-eqz v3, :cond_9

    .line 92
    .line 93
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 94
    .line 95
    iget-object v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 96
    .line 97
    aget-object v3, v3, v2

    .line 98
    .line 99
    const/4 v11, 0x0

    .line 100
    if-eqz v3, :cond_4

    .line 101
    .line 102
    invoke-virtual {v3}, Ll/qnw;->destroy()V

    .line 103
    .line 104
    .line 105
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 106
    .line 107
    iget-object v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 108
    .line 109
    aput-object v11, v3, v2

    .line 110
    .line 111
    :cond_4
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 112
    .line 113
    iget-object v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->l:[Landroid/graphics/Bitmap;

    .line 114
    .line 115
    aget-object v3, v3, v2

    .line 116
    .line 117
    if-eqz v3, :cond_5

    .line 118
    .line 119
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    .line 120
    .line 121
    .line 122
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 123
    .line 124
    iget-object v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->l:[Landroid/graphics/Bitmap;

    .line 125
    .line 126
    aput-object v11, v3, v2

    .line 127
    .line 128
    :cond_5
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 129
    .line 130
    iget-object v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 131
    .line 132
    aget-object v3, v3, v2

    .line 133
    .line 134
    if-eqz v3, :cond_6

    .line 135
    .line 136
    invoke-virtual {v3}, Landroid/graphics/SurfaceTexture;->release()V

    .line 137
    .line 138
    .line 139
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 140
    .line 141
    iget-object v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 142
    .line 143
    aput-object v11, v3, v2

    .line 144
    .line 145
    :cond_6
    move v3, v2

    .line 146
    :goto_2
    iget-object v12, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 147
    .line 148
    iget v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 149
    .line 150
    add-int/lit8 v14, v13, -0x1

    .line 151
    .line 152
    if-ge v3, v14, :cond_8

    .line 153
    .line 154
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o:[Z

    .line 155
    .line 156
    add-int/lit8 v14, v3, 0x1

    .line 157
    .line 158
    aget-boolean v15, v13, v14

    .line 159
    .line 160
    aput-boolean v15, v13, v3

    .line 161
    .line 162
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 163
    .line 164
    aget v15, v13, v14

    .line 165
    .line 166
    aput v15, v13, v3

    .line 167
    .line 168
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 169
    .line 170
    aget v15, v13, v14

    .line 171
    .line 172
    aput v15, v13, v3

    .line 173
    .line 174
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 175
    .line 176
    aget v15, v13, v14

    .line 177
    .line 178
    aput v15, v13, v3

    .line 179
    .line 180
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 181
    .line 182
    aget v15, v13, v14

    .line 183
    .line 184
    aput v15, v13, v3

    .line 185
    .line 186
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->i:[I

    .line 187
    .line 188
    aget v15, v13, v14

    .line 189
    .line 190
    aput v15, v13, v3

    .line 191
    .line 192
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 193
    .line 194
    aget v15, v13, v14

    .line 195
    .line 196
    aput v15, v13, v3

    .line 197
    .line 198
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 199
    .line 200
    aget v15, v13, v14

    .line 201
    .line 202
    aput v15, v13, v3

    .line 203
    .line 204
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 205
    .line 206
    aget v15, v13, v14

    .line 207
    .line 208
    aput v15, v13, v3

    .line 209
    .line 210
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->s:[I

    .line 211
    .line 212
    aget v15, v13, v14

    .line 213
    .line 214
    aput v15, v13, v3

    .line 215
    .line 216
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t:[J

    .line 217
    .line 218
    aget-wide v15, v13, v14

    .line 219
    .line 220
    aput-wide v15, v13, v3

    .line 221
    .line 222
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 223
    .line 224
    aget-object v15, v13, v14

    .line 225
    .line 226
    aput-object v15, v13, v3

    .line 227
    .line 228
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m:[I

    .line 229
    .line 230
    aget v15, v13, v14

    .line 231
    .line 232
    aput v15, v13, v3

    .line 233
    .line 234
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->l:[Landroid/graphics/Bitmap;

    .line 235
    .line 236
    aget-object v15, v13, v14

    .line 237
    .line 238
    aput-object v15, v13, v3

    .line 239
    .line 240
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->j:[I

    .line 241
    .line 242
    aget v15, v13, v14

    .line 243
    .line 244
    aput v15, v13, v3

    .line 245
    .line 246
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 247
    .line 248
    aget-object v15, v13, v14

    .line 249
    .line 250
    aput-object v15, v13, v3

    .line 251
    .line 252
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->u:[Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 253
    .line 254
    aget-object v15, v13, v14

    .line 255
    .line 256
    aput-object v15, v13, v3

    .line 257
    .line 258
    iget-object v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->v:[I

    .line 259
    .line 260
    aget v15, v13, v14

    .line 261
    .line 262
    aput v15, v13, v3

    .line 263
    .line 264
    invoke-static {v12}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 265
    .line 266
    .line 267
    move-result v3

    .line 268
    if-le v3, v2, :cond_7

    .line 269
    .line 270
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 271
    .line 272
    invoke-static {v3, v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Z1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 273
    .line 274
    .line 275
    :cond_7
    move v3, v14

    .line 276
    goto/16 :goto_2

    .line 277
    .line 278
    :cond_8
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o:[Z

    .line 279
    .line 280
    add-int/lit8 v14, v13, -0x1

    .line 281
    .line 282
    aput-boolean v4, v3, v14

    .line 283
    .line 284
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 285
    .line 286
    add-int/lit8 v14, v13, -0x1

    .line 287
    .line 288
    aput v5, v3, v14

    .line 289
    .line 290
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 291
    .line 292
    add-int/lit8 v14, v13, -0x1

    .line 293
    .line 294
    aput v5, v3, v14

    .line 295
    .line 296
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 297
    .line 298
    add-int/lit8 v14, v13, -0x1

    .line 299
    .line 300
    aput v5, v3, v14

    .line 301
    .line 302
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 303
    .line 304
    add-int/lit8 v14, v13, -0x1

    .line 305
    .line 306
    aput v5, v3, v14

    .line 307
    .line 308
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->i:[I

    .line 309
    .line 310
    add-int/lit8 v14, v13, -0x1

    .line 311
    .line 312
    aput v4, v3, v14

    .line 313
    .line 314
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 315
    .line 316
    add-int/lit8 v14, v13, -0x1

    .line 317
    .line 318
    aput v5, v3, v14

    .line 319
    .line 320
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 321
    .line 322
    add-int/lit8 v14, v13, -0x1

    .line 323
    .line 324
    aput v5, v3, v14

    .line 325
    .line 326
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 327
    .line 328
    add-int/lit8 v14, v13, -0x1

    .line 329
    .line 330
    aput v4, v3, v14

    .line 331
    .line 332
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->s:[I

    .line 333
    .line 334
    add-int/lit8 v14, v13, -0x1

    .line 335
    .line 336
    aput v1, v3, v14

    .line 337
    .line 338
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t:[J

    .line 339
    .line 340
    add-int/lit8 v14, v13, -0x1

    .line 341
    .line 342
    const-wide/16 v15, -0x1

    .line 343
    .line 344
    aput-wide v15, v3, v14

    .line 345
    .line 346
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 347
    .line 348
    add-int/lit8 v14, v13, -0x1

    .line 349
    .line 350
    aput-object v11, v3, v14

    .line 351
    .line 352
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m:[I

    .line 353
    .line 354
    add-int/lit8 v14, v13, -0x1

    .line 355
    .line 356
    aput v5, v3, v14

    .line 357
    .line 358
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->l:[Landroid/graphics/Bitmap;

    .line 359
    .line 360
    add-int/lit8 v14, v13, -0x1

    .line 361
    .line 362
    aput-object v11, v3, v14

    .line 363
    .line 364
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->j:[I

    .line 365
    .line 366
    add-int/lit8 v14, v13, -0x1

    .line 367
    .line 368
    aput v5, v3, v14

    .line 369
    .line 370
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 371
    .line 372
    add-int/lit8 v5, v13, -0x1

    .line 373
    .line 374
    aput-object v11, v3, v5

    .line 375
    .line 376
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->u:[Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 377
    .line 378
    add-int/lit8 v5, v13, -0x1

    .line 379
    .line 380
    aput-object v11, v3, v5

    .line 381
    .line 382
    iget-object v3, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->v:[I

    .line 383
    .line 384
    add-int/lit8 v5, v13, -0x1

    .line 385
    .line 386
    aput v4, v3, v5

    .line 387
    .line 388
    sub-int/2addr v13, v1

    .line 389
    iput v13, v12, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 390
    .line 391
    new-instance v1, Ljava/lang/StringBuilder;

    .line 392
    .line 393
    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 394
    .line 395
    .line 396
    iget-wide v11, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->a:J

    .line 397
    .line 398
    invoke-virtual {v1, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 399
    .line 400
    .line 401
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 402
    .line 403
    .line 404
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 405
    .line 406
    invoke-static {v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 407
    .line 408
    .line 409
    move-result v3

    .line 410
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 411
    .line 412
    .line 413
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 417
    .line 418
    iget v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 419
    .line 420
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 421
    .line 422
    .line 423
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 424
    .line 425
    .line 426
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 427
    .line 428
    .line 429
    const-string v2, "s0Pos["

    .line 430
    .line 431
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    .line 433
    .line 434
    iget-object v2, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 435
    .line 436
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 437
    .line 438
    aget v2, v2, v4

    .line 439
    .line 440
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    const-string v2, ","

    .line 444
    .line 445
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    .line 447
    .line 448
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 449
    .line 450
    iget-object v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 451
    .line 452
    aget v3, v3, v4

    .line 453
    .line 454
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 455
    .line 456
    .line 457
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 458
    .line 459
    .line 460
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 461
    .line 462
    iget-object v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 463
    .line 464
    aget v3, v3, v4

    .line 465
    .line 466
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 467
    .line 468
    .line 469
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 470
    .line 471
    .line 472
    iget-object v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 473
    .line 474
    iget-object v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 475
    .line 476
    aget v0, v0, v4

    .line 477
    .line 478
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 479
    .line 480
    .line 481
    const-string v0, "]"

    .line 482
    .line 483
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 484
    .line 485
    .line 486
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v0

    .line 490
    invoke-static {v8, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    .line 492
    .line 493
    return-void

    .line 494
    :cond_9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 495
    .line 496
    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 497
    .line 498
    .line 499
    iget-wide v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->a:J

    .line 500
    .line 501
    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 502
    .line 503
    .line 504
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 505
    .line 506
    .line 507
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 508
    .line 509
    invoke-static {v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 510
    .line 511
    .line 512
    move-result v3

    .line 513
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 514
    .line 515
    .line 516
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 517
    .line 518
    .line 519
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 520
    .line 521
    iget v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 522
    .line 523
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 524
    .line 525
    .line 526
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 527
    .line 528
    .line 529
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 530
    .line 531
    .line 532
    const-string v3, ", viewTexture="

    .line 533
    .line 534
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 535
    .line 536
    .line 537
    iget-object v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 538
    .line 539
    iget-object v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m:[I

    .line 540
    .line 541
    aget v0, v0, v2

    .line 542
    .line 543
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 544
    .line 545
    .line 546
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 547
    .line 548
    .line 549
    move-result-object v0

    .line 550
    invoke-static {v8, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 551
    .line 552
    .line 553
    return-void

    .line 554
    :cond_a
    :goto_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 555
    .line 556
    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 557
    .line 558
    .line 559
    iget-wide v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->a:J

    .line 560
    .line 561
    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 562
    .line 563
    .line 564
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 565
    .line 566
    .line 567
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 568
    .line 569
    .line 570
    const-string v2, ",svn:"

    .line 571
    .line 572
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 573
    .line 574
    .line 575
    iget-object v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 576
    .line 577
    iget v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 578
    .line 579
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 580
    .line 581
    .line 582
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 583
    .line 584
    .line 585
    move-result-object v0

    .line 586
    invoke-static {v8, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 587
    .line 588
    .line 589
    return-void
.end method
