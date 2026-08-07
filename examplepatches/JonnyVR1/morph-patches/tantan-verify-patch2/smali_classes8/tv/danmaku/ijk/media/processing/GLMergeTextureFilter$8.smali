.class Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z2(JIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:I

.field final synthetic c:I

.field final synthetic d:I

.field final synthetic e:I

.field final synthetic f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;JIIII)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 2
    .line 3
    iput-wide p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->a:J

    .line 4
    .line 5
    iput p4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->b:I

    .line 6
    .line 7
    iput p5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->c:I

    .line 8
    .line 9
    iput p6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->d:I

    .line 10
    .line 11
    iput p7, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->e:I

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v2, 0x1

    .line 4
    :goto_0
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 5
    .line 6
    iget v4, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 7
    .line 8
    const/4 v5, -0x1

    .line 9
    if-ge v2, v4, :cond_1

    .line 10
    .line 11
    iget-wide v6, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->a:J

    .line 12
    .line 13
    iget-object v8, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t:[J

    .line 14
    .line 15
    aget-wide v9, v8, v2

    .line 16
    .line 17
    cmp-long v6, v6, v9

    .line 18
    .line 19
    if-nez v6, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    move v2, v5

    .line 26
    :goto_1
    const-string v6, ", ind="

    .line 27
    .line 28
    const-string v7, "],fsi:"

    .line 29
    .line 30
    const-string v8, "Pos["

    .line 31
    .line 32
    const-string v9, ", s"

    .line 33
    .line 34
    const-string v10, "], O:"

    .line 35
    .line 36
    const-string v11, ", size["

    .line 37
    .line 38
    const-string v12, "----size: "

    .line 39
    .line 40
    const/16 v13, 0x9

    .line 41
    .line 42
    const-string v14, ", svn:"

    .line 43
    .line 44
    const-string v15, "mergeFilter"

    .line 45
    .line 46
    const/16 v16, 0x1

    .line 47
    .line 48
    const-string v1, ","

    .line 49
    .line 50
    if-ne v2, v5, :cond_3

    .line 51
    .line 52
    if-ge v4, v13, :cond_2

    .line 53
    .line 54
    iget-object v5, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 55
    .line 56
    iget v13, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->b:I

    .line 57
    .line 58
    aput v13, v5, v4

    .line 59
    .line 60
    iget-object v5, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 61
    .line 62
    iget v13, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->c:I

    .line 63
    .line 64
    aput v13, v5, v4

    .line 65
    .line 66
    iget-object v5, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 67
    .line 68
    iget v13, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->d:I

    .line 69
    .line 70
    aput v13, v5, v4

    .line 71
    .line 72
    iget-object v5, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t:[J

    .line 73
    .line 74
    move/from16 v17, v4

    .line 75
    .line 76
    move-object v13, v5

    .line 77
    iget-wide v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->a:J

    .line 78
    .line 79
    aput-wide v4, v13, v17

    .line 80
    .line 81
    add-int/lit8 v4, v17, 0x1

    .line 82
    .line 83
    iput v4, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 84
    .line 85
    new-instance v3, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {v3, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-wide v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->a:J

    .line 91
    .line 92
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 99
    .line 100
    iget-object v5, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 101
    .line 102
    iget v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 103
    .line 104
    add-int/lit8 v4, v4, -0x1

    .line 105
    .line 106
    aget v4, v5, v4

    .line 107
    .line 108
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 115
    .line 116
    iget-object v5, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 117
    .line 118
    iget v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 119
    .line 120
    add-int/lit8 v4, v4, -0x1

    .line 121
    .line 122
    aget v4, v5, v4

    .line 123
    .line 124
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 131
    .line 132
    iget-object v5, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->s:[I

    .line 133
    .line 134
    iget v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 135
    .line 136
    add-int/lit8 v4, v4, -0x1

    .line 137
    .line 138
    aget v4, v5, v4

    .line 139
    .line 140
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 147
    .line 148
    iget v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 149
    .line 150
    add-int/lit8 v4, v4, -0x1

    .line 151
    .line 152
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 159
    .line 160
    iget-object v5, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 161
    .line 162
    iget v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 163
    .line 164
    add-int/lit8 v4, v4, -0x1

    .line 165
    .line 166
    aget v4, v5, v4

    .line 167
    .line 168
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 175
    .line 176
    iget-object v5, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 177
    .line 178
    iget v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 179
    .line 180
    add-int/lit8 v4, v4, -0x1

    .line 181
    .line 182
    aget v4, v5, v4

    .line 183
    .line 184
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 191
    .line 192
    iget-object v5, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 193
    .line 194
    iget v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 195
    .line 196
    add-int/lit8 v4, v4, -0x1

    .line 197
    .line 198
    aget v4, v5, v4

    .line 199
    .line 200
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    iget-object v1, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 207
    .line 208
    iget-object v4, v1, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 209
    .line 210
    iget v1, v1, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 211
    .line 212
    add-int/lit8 v1, v1, -0x1

    .line 213
    .line 214
    aget v1, v4, v1

    .line 215
    .line 216
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    iget-object v1, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 223
    .line 224
    invoke-static {v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    iget-object v1, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 235
    .line 236
    iget v1, v1, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 237
    .line 238
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    const-string v1, "type"

    .line 248
    .line 249
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    iget-object v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 253
    .line 254
    iget-object v1, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 255
    .line 256
    iget v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 257
    .line 258
    add-int/lit8 v0, v0, -0x1

    .line 259
    .line 260
    aget v0, v1, v0

    .line 261
    .line 262
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-static {v15, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    .line 271
    .line 272
    return-void

    .line 273
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 274
    .line 275
    const-string v2, "----size: svn["

    .line 276
    .line 277
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    iget-object v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 281
    .line 282
    iget v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 283
    .line 284
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    const-string v0, "] over max=9!!!!"

    .line 288
    .line 289
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    invoke-static {v15, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    .line 298
    .line 299
    return-void

    .line 300
    :cond_3
    iget-object v4, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 301
    .line 302
    aget v4, v4, v2

    .line 303
    .line 304
    iget v5, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->b:I

    .line 305
    .line 306
    if-ne v4, v5, :cond_4

    .line 307
    .line 308
    iget-object v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 309
    .line 310
    aget v3, v3, v2

    .line 311
    .line 312
    iget v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->c:I

    .line 313
    .line 314
    if-eq v3, v4, :cond_8

    .line 315
    .line 316
    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    .line 317
    .line 318
    const-string v4, "----size[changed]: ID["

    .line 319
    .line 320
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    iget-wide v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->a:J

    .line 324
    .line 325
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    const-string v4, "], size["

    .line 329
    .line 330
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 334
    .line 335
    iget-object v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 336
    .line 337
    aget v4, v4, v2

    .line 338
    .line 339
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 346
    .line 347
    iget-object v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 348
    .line 349
    aget v4, v4, v2

    .line 350
    .line 351
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    const-string v4, "]--->["

    .line 355
    .line 356
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    iget v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->b:I

    .line 360
    .line 361
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    iget v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->c:I

    .line 368
    .line 369
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    const-string v4, "], fsi:"

    .line 373
    .line 374
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 375
    .line 376
    .line 377
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 378
    .line 379
    invoke-static {v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 380
    .line 381
    .line 382
    move-result v4

    .line 383
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    .line 388
    .line 389
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 390
    .line 391
    iget v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 392
    .line 393
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 394
    .line 395
    .line 396
    const-string v4, ",ind="

    .line 397
    .line 398
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    .line 400
    .line 401
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 402
    .line 403
    .line 404
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 405
    .line 406
    .line 407
    move-result-object v3

    .line 408
    invoke-static {v15, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    .line 410
    .line 411
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 412
    .line 413
    iget-object v4, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 414
    .line 415
    iget v5, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->b:I

    .line 416
    .line 417
    aput v5, v4, v2

    .line 418
    .line 419
    iget-object v4, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 420
    .line 421
    iget v5, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->c:I

    .line 422
    .line 423
    aput v5, v4, v2

    .line 424
    .line 425
    iget-object v4, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 426
    .line 427
    iget v5, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->d:I

    .line 428
    .line 429
    aput v5, v4, v2

    .line 430
    .line 431
    const/4 v4, 0x2

    .line 432
    const/4 v13, 0x0

    .line 433
    if-eq v5, v4, :cond_7

    .line 434
    .line 435
    const/4 v4, 0x3

    .line 436
    if-eq v5, v4, :cond_7

    .line 437
    .line 438
    const/16 v4, 0x8

    .line 439
    .line 440
    if-eq v5, v4, :cond_7

    .line 441
    .line 442
    const/16 v4, 0x9

    .line 443
    .line 444
    if-ne v5, v4, :cond_5

    .line 445
    .line 446
    goto :goto_2

    .line 447
    :cond_5
    iget v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->e:I

    .line 448
    .line 449
    move/from16 v5, v16

    .line 450
    .line 451
    if-ne v4, v5, :cond_6

    .line 452
    .line 453
    const/16 v4, 0x28

    .line 454
    .line 455
    invoke-static {v3, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 456
    .line 457
    .line 458
    goto :goto_3

    .line 459
    :cond_6
    invoke-static {v3, v13}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 460
    .line 461
    .line 462
    goto :goto_3

    .line 463
    :cond_7
    :goto_2
    invoke-static {v3, v13}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 464
    .line 465
    .line 466
    :cond_8
    :goto_3
    new-instance v3, Ljava/lang/StringBuilder;

    .line 467
    .line 468
    invoke-direct {v3, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 469
    .line 470
    .line 471
    iget-wide v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->a:J

    .line 472
    .line 473
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 474
    .line 475
    .line 476
    const-string v4, ", len="

    .line 477
    .line 478
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 479
    .line 480
    .line 481
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 482
    .line 483
    invoke-static {v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->c2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 484
    .line 485
    .line 486
    move-result v4

    .line 487
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 488
    .line 489
    .line 490
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 491
    .line 492
    .line 493
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 494
    .line 495
    iget-object v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 496
    .line 497
    aget v4, v4, v2

    .line 498
    .line 499
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 500
    .line 501
    .line 502
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 503
    .line 504
    .line 505
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 506
    .line 507
    iget-object v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 508
    .line 509
    aget v4, v4, v2

    .line 510
    .line 511
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 512
    .line 513
    .line 514
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 515
    .line 516
    .line 517
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 518
    .line 519
    iget-object v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->s:[I

    .line 520
    .line 521
    aget v4, v4, v2

    .line 522
    .line 523
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 524
    .line 525
    .line 526
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 527
    .line 528
    .line 529
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 530
    .line 531
    .line 532
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 533
    .line 534
    .line 535
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 536
    .line 537
    iget-object v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 538
    .line 539
    aget v4, v4, v2

    .line 540
    .line 541
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 542
    .line 543
    .line 544
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 545
    .line 546
    .line 547
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 548
    .line 549
    iget-object v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 550
    .line 551
    aget v4, v4, v2

    .line 552
    .line 553
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 554
    .line 555
    .line 556
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 557
    .line 558
    .line 559
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 560
    .line 561
    iget-object v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 562
    .line 563
    aget v4, v4, v2

    .line 564
    .line 565
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 566
    .line 567
    .line 568
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    .line 570
    .line 571
    iget-object v1, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 572
    .line 573
    iget-object v1, v1, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 574
    .line 575
    aget v1, v1, v2

    .line 576
    .line 577
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 578
    .line 579
    .line 580
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 581
    .line 582
    .line 583
    iget-object v1, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 584
    .line 585
    invoke-static {v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 586
    .line 587
    .line 588
    move-result v1

    .line 589
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 590
    .line 591
    .line 592
    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 593
    .line 594
    .line 595
    iget-object v1, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 596
    .line 597
    iget v1, v1, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 598
    .line 599
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 600
    .line 601
    .line 602
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 603
    .line 604
    .line 605
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 606
    .line 607
    .line 608
    const-string v1, ", type="

    .line 609
    .line 610
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 611
    .line 612
    .line 613
    iget-object v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;->f:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 614
    .line 615
    iget-object v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 616
    .line 617
    aget v0, v0, v2

    .line 618
    .line 619
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 620
    .line 621
    .line 622
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 623
    .line 624
    .line 625
    move-result-object v0

    .line 626
    invoke-static {v15, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 627
    .line 628
    .line 629
    return-void
.end method
