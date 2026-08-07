.class Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y2(JIIIII)V
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

.field final synthetic f:I

.field final synthetic g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;JIIIII)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 2
    .line 3
    iput-wide p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->a:J

    .line 4
    .line 5
    iput p4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->b:I

    .line 6
    .line 7
    iput p5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->c:I

    .line 8
    .line 9
    iput p6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->d:I

    .line 10
    .line 11
    iput p7, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->e:I

    .line 12
    .line 13
    iput p8, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->f:I

    .line 14
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 1
    const/4 v0, 0x1

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 4
    .line 5
    iget v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 6
    .line 7
    const/4 v4, -0x1

    .line 8
    if-ge v1, v3, :cond_1

    .line 9
    .line 10
    iget-wide v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->a:J

    .line 11
    .line 12
    iget-object v7, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t:[J

    .line 13
    .line 14
    aget-wide v8, v7, v1

    .line 15
    .line 16
    cmp-long v5, v5, v8

    .line 17
    .line 18
    if-nez v5, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move v1, v4

    .line 25
    :goto_1
    iget-wide v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->a:J

    .line 26
    .line 27
    const-wide/16 v7, 0x0

    .line 28
    .line 29
    cmp-long v7, v5, v7

    .line 30
    .line 31
    const-string v8, "mergeFilter"

    .line 32
    .line 33
    const/4 v9, 0x0

    .line 34
    if-nez v7, :cond_3

    .line 35
    .line 36
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 41
    .line 42
    if-nez v2, :cond_2

    .line 43
    .line 44
    iget-object v2, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o:[Z

    .line 45
    .line 46
    aput-boolean v0, v2, v9

    .line 47
    .line 48
    iget-object v2, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 49
    .line 50
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->b:I

    .line 51
    .line 52
    aput v5, v2, v9

    .line 53
    .line 54
    iget-object v2, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 55
    .line 56
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->c:I

    .line 57
    .line 58
    aput v5, v2, v9

    .line 59
    .line 60
    iget-object v2, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 61
    .line 62
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->d:I

    .line 63
    .line 64
    aput v5, v2, v9

    .line 65
    .line 66
    iget-object v2, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 67
    .line 68
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->e:I

    .line 69
    .line 70
    aput v5, v2, v9

    .line 71
    .line 72
    iget-object v2, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->i:[I

    .line 73
    .line 74
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->f:I

    .line 75
    .line 76
    aput v5, v2, v9

    .line 77
    .line 78
    iget-object v2, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t:[J

    .line 79
    .line 80
    iget-wide v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->a:J

    .line 81
    .line 82
    aput-wide v5, v2, v9

    .line 83
    .line 84
    goto/16 :goto_2

    .line 85
    .line 86
    :cond_2
    iget-object v2, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 87
    .line 88
    invoke-static {v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->b:I

    .line 93
    .line 94
    aput v5, v2, v3

    .line 95
    .line 96
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 97
    .line 98
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 99
    .line 100
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->c:I

    .line 105
    .line 106
    aput v5, v3, v2

    .line 107
    .line 108
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 109
    .line 110
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 111
    .line 112
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->d:I

    .line 117
    .line 118
    aput v5, v3, v2

    .line 119
    .line 120
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 121
    .line 122
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 123
    .line 124
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->e:I

    .line 129
    .line 130
    aput v5, v3, v2

    .line 131
    .line 132
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 133
    .line 134
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->i:[I

    .line 135
    .line 136
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->f:I

    .line 141
    .line 142
    aput v5, v3, v2

    .line 143
    .line 144
    goto/16 :goto_2

    .line 145
    .line 146
    :cond_3
    const/16 v7, 0x9

    .line 147
    .line 148
    if-ne v1, v4, :cond_5

    .line 149
    .line 150
    if-ge v3, v7, :cond_4

    .line 151
    .line 152
    iget-object v7, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 153
    .line 154
    iget v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->b:I

    .line 155
    .line 156
    aput v9, v7, v3

    .line 157
    .line 158
    iget-object v7, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 159
    .line 160
    iget v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->c:I

    .line 161
    .line 162
    aput v9, v7, v3

    .line 163
    .line 164
    iget-object v7, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 165
    .line 166
    iget v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->d:I

    .line 167
    .line 168
    aput v9, v7, v3

    .line 169
    .line 170
    iget-object v7, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 171
    .line 172
    iget v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->e:I

    .line 173
    .line 174
    aput v9, v7, v3

    .line 175
    .line 176
    iget-object v7, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->i:[I

    .line 177
    .line 178
    iget v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->f:I

    .line 179
    .line 180
    aput v9, v7, v3

    .line 181
    .line 182
    iget-object v7, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t:[J

    .line 183
    .line 184
    aput-wide v5, v7, v3

    .line 185
    .line 186
    iget-object v5, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o:[Z

    .line 187
    .line 188
    aput-boolean v0, v5, v3

    .line 189
    .line 190
    add-int/2addr v3, v0

    .line 191
    iput v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 192
    .line 193
    goto/16 :goto_2

    .line 194
    .line 195
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    const-string v1, "----pos: svn["

    .line 198
    .line 199
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 203
    .line 204
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 205
    .line 206
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    const-string p0, "] over max=9!!!!"

    .line 210
    .line 211
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-static {v8, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    :cond_5
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    if-eqz v2, :cond_6

    .line 227
    .line 228
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 229
    .line 230
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 231
    .line 232
    .line 233
    move-result v2

    .line 234
    if-ne v2, v1, :cond_6

    .line 235
    .line 236
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 237
    .line 238
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 239
    .line 240
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->b:I

    .line 241
    .line 242
    aput v5, v3, v9

    .line 243
    .line 244
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 245
    .line 246
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->c:I

    .line 247
    .line 248
    aput v5, v3, v9

    .line 249
    .line 250
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 251
    .line 252
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->d:I

    .line 253
    .line 254
    aput v5, v3, v9

    .line 255
    .line 256
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 257
    .line 258
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->e:I

    .line 259
    .line 260
    aput v5, v3, v9

    .line 261
    .line 262
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->i:[I

    .line 263
    .line 264
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->f:I

    .line 265
    .line 266
    aput v5, v3, v9

    .line 267
    .line 268
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o:[Z

    .line 269
    .line 270
    aput-boolean v0, v2, v1

    .line 271
    .line 272
    goto/16 :goto_2

    .line 273
    .line 274
    :cond_6
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 275
    .line 276
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 277
    .line 278
    aget v3, v3, v1

    .line 279
    .line 280
    const/4 v5, 0x3

    .line 281
    if-eq v3, v5, :cond_7

    .line 282
    .line 283
    if-ne v3, v7, :cond_9

    .line 284
    .line 285
    :cond_7
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o:[Z

    .line 286
    .line 287
    aget-boolean v3, v3, v1

    .line 288
    .line 289
    if-eqz v3, :cond_9

    .line 290
    .line 291
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 292
    .line 293
    aget v5, v3, v1

    .line 294
    .line 295
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->b:I

    .line 296
    .line 297
    if-ne v5, v6, :cond_8

    .line 298
    .line 299
    iget-object v7, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 300
    .line 301
    aget v7, v7, v1

    .line 302
    .line 303
    iget v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->c:I

    .line 304
    .line 305
    if-ne v7, v9, :cond_8

    .line 306
    .line 307
    iget-object v7, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 308
    .line 309
    aget v7, v7, v1

    .line 310
    .line 311
    iget v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->d:I

    .line 312
    .line 313
    if-ne v7, v9, :cond_8

    .line 314
    .line 315
    iget-object v7, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 316
    .line 317
    aget v7, v7, v1

    .line 318
    .line 319
    iget v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->e:I

    .line 320
    .line 321
    if-eq v7, v9, :cond_9

    .line 322
    .line 323
    :cond_8
    if-eq v5, v4, :cond_9

    .line 324
    .line 325
    iget-object v5, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 326
    .line 327
    aget v7, v5, v1

    .line 328
    .line 329
    if-lez v7, :cond_9

    .line 330
    .line 331
    iget-object v7, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 332
    .line 333
    aget v9, v7, v1

    .line 334
    .line 335
    if-lez v9, :cond_9

    .line 336
    .line 337
    aput v6, v3, v1

    .line 338
    .line 339
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 340
    .line 341
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->c:I

    .line 342
    .line 343
    aput v6, v3, v1

    .line 344
    .line 345
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 346
    .line 347
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->d:I

    .line 348
    .line 349
    aput v6, v3, v1

    .line 350
    .line 351
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 352
    .line 353
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->e:I

    .line 354
    .line 355
    aput v6, v3, v1

    .line 356
    .line 357
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 358
    .line 359
    aget-object v2, v2, v1

    .line 360
    .line 361
    if-eqz v2, :cond_9

    .line 362
    .line 363
    aget v3, v7, v1

    .line 364
    .line 365
    aget v5, v5, v1

    .line 366
    .line 367
    const/4 v6, 0x2

    .line 368
    invoke-virtual {v2, v3, v5, v6}, Ll/qnw;->setDisplayMode(III)V

    .line 369
    .line 370
    .line 371
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 372
    .line 373
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 374
    .line 375
    aget-object v3, v3, v1

    .line 376
    .line 377
    iget-object v5, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 378
    .line 379
    aget v5, v5, v1

    .line 380
    .line 381
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 382
    .line 383
    aget v2, v2, v1

    .line 384
    .line 385
    invoke-virtual {v3, v5, v2}, Ll/qnw;->setRenderSize(II)V

    .line 386
    .line 387
    .line 388
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 389
    .line 390
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 391
    .line 392
    aget-object v3, v3, v1

    .line 393
    .line 394
    iget-object v5, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m:[I

    .line 395
    .line 396
    aget v5, v5, v1

    .line 397
    .line 398
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 399
    .line 400
    aget-object v2, v2, v1

    .line 401
    .line 402
    invoke-virtual {v3, v5, v2}, Ll/qnw;->loadTexture(ILandroid/graphics/SurfaceTexture;)V

    .line 403
    .line 404
    .line 405
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 406
    .line 407
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 408
    .line 409
    aget-object v2, v2, v1

    .line 410
    .line 411
    invoke-virtual {v2}, Ll/qnw;->drawFrame()V

    .line 412
    .line 413
    .line 414
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 415
    .line 416
    .line 417
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 418
    .line 419
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->j:[I

    .line 420
    .line 421
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 422
    .line 423
    aget-object v2, v2, v1

    .line 424
    .line 425
    invoke-virtual {v2}, Ll/gfj;->getTextOutID()I

    .line 426
    .line 427
    .line 428
    move-result v2

    .line 429
    aput v2, v3, v1

    .line 430
    .line 431
    :cond_9
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 432
    .line 433
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 434
    .line 435
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->b:I

    .line 436
    .line 437
    aput v5, v3, v1

    .line 438
    .line 439
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 440
    .line 441
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->c:I

    .line 442
    .line 443
    aput v5, v3, v1

    .line 444
    .line 445
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 446
    .line 447
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->d:I

    .line 448
    .line 449
    aput v5, v3, v1

    .line 450
    .line 451
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 452
    .line 453
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->e:I

    .line 454
    .line 455
    aput v5, v3, v1

    .line 456
    .line 457
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->i:[I

    .line 458
    .line 459
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->f:I

    .line 460
    .line 461
    aput v5, v3, v1

    .line 462
    .line 463
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o:[Z

    .line 464
    .line 465
    aput-boolean v0, v2, v1

    .line 466
    .line 467
    :goto_2
    iget-wide v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->a:J

    .line 468
    .line 469
    const-string v5, ", svn:"

    .line 470
    .line 471
    const-string v6, "],fsi:"

    .line 472
    .line 473
    const-string v7, "Pos["

    .line 474
    .line 475
    const-string v9, ", s"

    .line 476
    .line 477
    const-string v10, "----pos: "

    .line 478
    .line 479
    const-string v11, ","

    .line 480
    .line 481
    if-ne v1, v4, :cond_a

    .line 482
    .line 483
    new-instance v4, Ljava/lang/StringBuilder;

    .line 484
    .line 485
    invoke-direct {v4, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 486
    .line 487
    .line 488
    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 489
    .line 490
    .line 491
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 492
    .line 493
    .line 494
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 495
    .line 496
    iget v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 497
    .line 498
    sub-int/2addr v2, v0

    .line 499
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 500
    .line 501
    .line 502
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 503
    .line 504
    .line 505
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 506
    .line 507
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 508
    .line 509
    iget v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 510
    .line 511
    sub-int/2addr v2, v0

    .line 512
    aget v2, v3, v2

    .line 513
    .line 514
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 515
    .line 516
    .line 517
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 518
    .line 519
    .line 520
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 521
    .line 522
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 523
    .line 524
    iget v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 525
    .line 526
    sub-int/2addr v2, v0

    .line 527
    aget v2, v3, v2

    .line 528
    .line 529
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 530
    .line 531
    .line 532
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 533
    .line 534
    .line 535
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 536
    .line 537
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 538
    .line 539
    iget v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 540
    .line 541
    sub-int/2addr v2, v0

    .line 542
    aget v2, v3, v2

    .line 543
    .line 544
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 545
    .line 546
    .line 547
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 548
    .line 549
    .line 550
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 551
    .line 552
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 553
    .line 554
    iget v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 555
    .line 556
    sub-int/2addr v2, v0

    .line 557
    aget v0, v3, v2

    .line 558
    .line 559
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 560
    .line 561
    .line 562
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 563
    .line 564
    .line 565
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 566
    .line 567
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 568
    .line 569
    .line 570
    move-result v0

    .line 571
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 572
    .line 573
    .line 574
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 575
    .line 576
    .line 577
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 578
    .line 579
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 580
    .line 581
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 582
    .line 583
    .line 584
    const-string p0, ", ind="

    .line 585
    .line 586
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 587
    .line 588
    .line 589
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 590
    .line 591
    .line 592
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 593
    .line 594
    .line 595
    move-result-object p0

    .line 596
    invoke-static {v8, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 597
    .line 598
    .line 599
    return-void

    .line 600
    :cond_a
    new-instance v0, Ljava/lang/StringBuilder;

    .line 601
    .line 602
    invoke-direct {v0, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 603
    .line 604
    .line 605
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 606
    .line 607
    .line 608
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 609
    .line 610
    .line 611
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 612
    .line 613
    .line 614
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 615
    .line 616
    .line 617
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 618
    .line 619
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 620
    .line 621
    aget v2, v2, v1

    .line 622
    .line 623
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 624
    .line 625
    .line 626
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 627
    .line 628
    .line 629
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 630
    .line 631
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 632
    .line 633
    aget v2, v2, v1

    .line 634
    .line 635
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 636
    .line 637
    .line 638
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 639
    .line 640
    .line 641
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 642
    .line 643
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 644
    .line 645
    aget v2, v2, v1

    .line 646
    .line 647
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 648
    .line 649
    .line 650
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 651
    .line 652
    .line 653
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 654
    .line 655
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 656
    .line 657
    aget v1, v2, v1

    .line 658
    .line 659
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 660
    .line 661
    .line 662
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 663
    .line 664
    .line 665
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 666
    .line 667
    invoke-static {v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 668
    .line 669
    .line 670
    move-result v1

    .line 671
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 672
    .line 673
    .line 674
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 675
    .line 676
    .line 677
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 678
    .line 679
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 680
    .line 681
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 682
    .line 683
    .line 684
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 685
    .line 686
    .line 687
    move-result-object p0

    .line 688
    invoke-static {v8, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 689
    .line 690
    .line 691
    return-void
.end method
