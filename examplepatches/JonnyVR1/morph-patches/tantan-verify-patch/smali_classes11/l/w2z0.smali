.class public final Ll/w2z0;
.super Ll/o3z0;
.source "SourceFile"


# instance fields
.field public final f:Ll/b6z0;

.field public final g:Lcom/google/android/gms/internal/ads/zzgaa;

.field public final h:Ll/mfv0;


# direct methods
.method public constructor <init>(Ll/t2u0;[IILl/b6z0;JJJIIFFLjava/util/List;Ll/mfv0;)V
    .locals 0

    .line 1
    const/4 p3, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Ll/o3z0;-><init>(Ll/t2u0;[II)V

    .line 3
    .line 4
    .line 5
    iput-object p4, p0, Ll/w2z0;->f:Ll/b6z0;

    .line 6
    .line 7
    invoke-static {p15}, Lcom/google/android/gms/internal/ads/zzgaa;->zzj(Ljava/util/Collection;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/w2z0;->g:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 12
    .line 13
    move-object/from16 p1, p16

    .line 14
    .line 15
    iput-object p1, p0, Ll/w2z0;->h:Ll/mfv0;

    .line 16
    .line 17
    return-void
.end method

.method public static bridge synthetic a([Ll/m5z0;)Lcom/google/android/gms/internal/ads/zzgaa;
    .locals 23

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    const/4 v5, 0x2

    .line 11
    const/4 v6, 0x1

    .line 12
    if-ge v2, v5, :cond_1

    .line 13
    .line 14
    aget-object v5, p0, v2

    .line 15
    .line 16
    if-eqz v5, :cond_0

    .line 17
    .line 18
    iget-object v5, v5, Ll/m5z0;->b:[I

    .line 19
    .line 20
    array-length v5, v5

    .line 21
    if-le v5, v6, :cond_0

    .line 22
    .line 23
    new-instance v5, Ll/mqw0;

    .line 24
    .line 25
    invoke-direct {v5}, Ll/mqw0;-><init>()V

    .line 26
    .line 27
    .line 28
    new-instance v6, Ll/u2z0;

    .line 29
    .line 30
    invoke-direct {v6, v3, v4, v3, v4}, Ll/u2z0;-><init>(JJ)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v5, v6}, Ll/mqw0;->g(Ljava/lang/Object;)Ll/mqw0;

    .line 34
    .line 35
    .line 36
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_0
    const/4 v3, 0x0

    .line 41
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    new-array v2, v5, [[J

    .line 48
    .line 49
    move v7, v1

    .line 50
    :goto_2
    const-wide/16 v8, -0x1

    .line 51
    .line 52
    if-ge v7, v5, :cond_5

    .line 53
    .line 54
    aget-object v10, p0, v7

    .line 55
    .line 56
    if-nez v10, :cond_2

    .line 57
    .line 58
    new-array v8, v1, [J

    .line 59
    .line 60
    aput-object v8, v2, v7

    .line 61
    .line 62
    goto :goto_4

    .line 63
    :cond_2
    iget-object v11, v10, Ll/m5z0;->b:[I

    .line 64
    .line 65
    array-length v11, v11

    .line 66
    new-array v11, v11, [J

    .line 67
    .line 68
    aput-object v11, v2, v7

    .line 69
    .line 70
    move v11, v1

    .line 71
    :goto_3
    iget-object v12, v10, Ll/m5z0;->b:[I

    .line 72
    .line 73
    array-length v13, v12

    .line 74
    if-ge v11, v13, :cond_4

    .line 75
    .line 76
    iget-object v13, v10, Ll/m5z0;->a:Ll/t2u0;

    .line 77
    .line 78
    aget v12, v12, v11

    .line 79
    .line 80
    invoke-virtual {v13, v12}, Ll/t2u0;->b(I)Ll/sqr0;

    .line 81
    .line 82
    .line 83
    move-result-object v12

    .line 84
    iget v12, v12, Ll/sqr0;->h:I

    .line 85
    .line 86
    int-to-long v12, v12

    .line 87
    aget-object v14, v2, v7

    .line 88
    .line 89
    cmp-long v15, v12, v8

    .line 90
    .line 91
    if-nez v15, :cond_3

    .line 92
    .line 93
    move-wide v12, v3

    .line 94
    :cond_3
    aput-wide v12, v14, v11

    .line 95
    .line 96
    add-int/lit8 v11, v11, 0x1

    .line 97
    .line 98
    goto :goto_3

    .line 99
    :cond_4
    aget-object v8, v2, v7

    .line 100
    .line 101
    invoke-static {v8}, Ljava/util/Arrays;->sort([J)V

    .line 102
    .line 103
    .line 104
    :goto_4
    add-int/lit8 v7, v7, 0x1

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_5
    new-array v7, v5, [I

    .line 108
    .line 109
    new-array v10, v5, [J

    .line 110
    .line 111
    move v11, v1

    .line 112
    :goto_5
    if-ge v11, v5, :cond_7

    .line 113
    .line 114
    aget-object v12, v2, v11

    .line 115
    .line 116
    array-length v13, v12

    .line 117
    if-nez v13, :cond_6

    .line 118
    .line 119
    move-wide v13, v3

    .line 120
    goto :goto_6

    .line 121
    :cond_6
    aget-wide v13, v12, v1

    .line 122
    .line 123
    :goto_6
    aput-wide v13, v10, v11

    .line 124
    .line 125
    add-int/lit8 v11, v11, 0x1

    .line 126
    .line 127
    goto :goto_5

    .line 128
    :cond_7
    invoke-static {v0, v10}, Ll/w2z0;->b(Ljava/util/List;[J)V

    .line 129
    .line 130
    .line 131
    invoke-static {}, Lcom/google/android/gms/internal/ads/c3;->zzc()Lcom/google/android/gms/internal/ads/c3;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    invoke-static {v3}, Ll/nsw0;->b(Ljava/util/Comparator;)Ll/lsw0;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    invoke-virtual {v3, v5}, Ll/lsw0;->b(I)Ll/ksw0;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    invoke-virtual {v3}, Ll/ksw0;->c()Ll/xrw0;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    move v4, v1

    .line 148
    :goto_7
    if-ge v4, v5, :cond_d

    .line 149
    .line 150
    aget-object v11, v2, v4

    .line 151
    .line 152
    array-length v11, v11

    .line 153
    if-gt v11, v6, :cond_9

    .line 154
    .line 155
    move v15, v1

    .line 156
    move-object/from16 v18, v2

    .line 157
    .line 158
    :cond_8
    move/from16 v19, v6

    .line 159
    .line 160
    goto :goto_c

    .line 161
    :cond_9
    new-array v12, v11, [D

    .line 162
    .line 163
    move v13, v1

    .line 164
    :goto_8
    aget-object v14, v2, v4

    .line 165
    .line 166
    array-length v15, v14

    .line 167
    const-wide/16 v16, 0x0

    .line 168
    .line 169
    if-ge v13, v15, :cond_b

    .line 170
    .line 171
    move v15, v1

    .line 172
    move-object/from16 v18, v2

    .line 173
    .line 174
    aget-wide v1, v14, v13

    .line 175
    .line 176
    cmp-long v14, v1, v8

    .line 177
    .line 178
    if-nez v14, :cond_a

    .line 179
    .line 180
    goto :goto_9

    .line 181
    :cond_a
    long-to-double v1, v1

    .line 182
    invoke-static {v1, v2}, Ljava/lang/Math;->log(D)D

    .line 183
    .line 184
    .line 185
    move-result-wide v16

    .line 186
    :goto_9
    aput-wide v16, v12, v13

    .line 187
    .line 188
    add-int/lit8 v13, v13, 0x1

    .line 189
    .line 190
    move v1, v15

    .line 191
    move-object/from16 v2, v18

    .line 192
    .line 193
    goto :goto_8

    .line 194
    :cond_b
    move v15, v1

    .line 195
    move-object/from16 v18, v2

    .line 196
    .line 197
    add-int/lit8 v11, v11, -0x1

    .line 198
    .line 199
    aget-wide v1, v12, v11

    .line 200
    .line 201
    aget-wide v13, v12, v15

    .line 202
    .line 203
    sub-double/2addr v1, v13

    .line 204
    move v13, v15

    .line 205
    :goto_a
    if-ge v13, v11, :cond_8

    .line 206
    .line 207
    aget-wide v19, v12, v13

    .line 208
    .line 209
    add-int/lit8 v13, v13, 0x1

    .line 210
    .line 211
    aget-wide v21, v12, v13

    .line 212
    .line 213
    add-double v19, v19, v21

    .line 214
    .line 215
    cmpl-double v14, v1, v16

    .line 216
    .line 217
    if-nez v14, :cond_c

    .line 218
    .line 219
    const-wide/high16 v19, 0x3ff0000000000000L    # 1.0

    .line 220
    .line 221
    goto :goto_b

    .line 222
    :cond_c
    const-wide/high16 v21, 0x3fe0000000000000L    # 0.5

    .line 223
    .line 224
    mul-double v19, v19, v21

    .line 225
    .line 226
    aget-wide v21, v12, v15

    .line 227
    .line 228
    sub-double v19, v19, v21

    .line 229
    .line 230
    div-double v19, v19, v1

    .line 231
    .line 232
    :goto_b
    invoke-static/range {v19 .. v20}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 233
    .line 234
    .line 235
    move-result-object v14

    .line 236
    move/from16 v19, v6

    .line 237
    .line 238
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 239
    .line 240
    .line 241
    move-result-object v6

    .line 242
    invoke-interface {v3, v14, v6}, Ll/esw0;->zzq(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move/from16 v6, v19

    .line 246
    .line 247
    goto :goto_a

    .line 248
    :goto_c
    add-int/lit8 v4, v4, 0x1

    .line 249
    .line 250
    move v1, v15

    .line 251
    move-object/from16 v2, v18

    .line 252
    .line 253
    move/from16 v6, v19

    .line 254
    .line 255
    goto :goto_7

    .line 256
    :cond_d
    move v15, v1

    .line 257
    move-object/from16 v18, v2

    .line 258
    .line 259
    move/from16 v19, v6

    .line 260
    .line 261
    invoke-interface {v3}, Ll/esw0;->zzr()Ljava/util/Collection;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    invoke-static {v1}, Lcom/google/android/gms/internal/ads/zzgaa;->zzj(Ljava/util/Collection;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    move v2, v15

    .line 270
    :goto_d
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->size()I

    .line 271
    .line 272
    .line 273
    move-result v3

    .line 274
    if-ge v2, v3, :cond_e

    .line 275
    .line 276
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    move-result-object v3

    .line 280
    check-cast v3, Ljava/lang/Integer;

    .line 281
    .line 282
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 283
    .line 284
    .line 285
    move-result v3

    .line 286
    aget v4, v7, v3

    .line 287
    .line 288
    add-int/lit8 v4, v4, 0x1

    .line 289
    .line 290
    aput v4, v7, v3

    .line 291
    .line 292
    aget-object v6, v18, v3

    .line 293
    .line 294
    aget-wide v8, v6, v4

    .line 295
    .line 296
    aput-wide v8, v10, v3

    .line 297
    .line 298
    invoke-static {v0, v10}, Ll/w2z0;->b(Ljava/util/List;[J)V

    .line 299
    .line 300
    .line 301
    add-int/lit8 v2, v2, 0x1

    .line 302
    .line 303
    goto :goto_d

    .line 304
    :cond_e
    move v1, v15

    .line 305
    :goto_e
    if-ge v1, v5, :cond_10

    .line 306
    .line 307
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object v2

    .line 311
    if-eqz v2, :cond_f

    .line 312
    .line 313
    aget-wide v2, v10, v1

    .line 314
    .line 315
    add-long/2addr v2, v2

    .line 316
    aput-wide v2, v10, v1

    .line 317
    .line 318
    :cond_f
    add-int/lit8 v1, v1, 0x1

    .line 319
    .line 320
    goto :goto_e

    .line 321
    :cond_10
    invoke-static {v0, v10}, Ll/w2z0;->b(Ljava/util/List;[J)V

    .line 322
    .line 323
    .line 324
    new-instance v1, Ll/mqw0;

    .line 325
    .line 326
    invoke-direct {v1}, Ll/mqw0;-><init>()V

    .line 327
    .line 328
    .line 329
    :goto_f
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 330
    .line 331
    .line 332
    move-result v2

    .line 333
    if-ge v15, v2, :cond_12

    .line 334
    .line 335
    invoke-interface {v0, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object v2

    .line 339
    check-cast v2, Ll/mqw0;

    .line 340
    .line 341
    if-nez v2, :cond_11

    .line 342
    .line 343
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 344
    .line 345
    .line 346
    move-result-object v2

    .line 347
    goto :goto_10

    .line 348
    :cond_11
    invoke-virtual {v2}, Ll/mqw0;->j()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 349
    .line 350
    .line 351
    move-result-object v2

    .line 352
    :goto_10
    invoke-virtual {v1, v2}, Ll/mqw0;->g(Ljava/lang/Object;)Ll/mqw0;

    .line 353
    .line 354
    .line 355
    add-int/lit8 v15, v15, 0x1

    .line 356
    .line 357
    goto :goto_f

    .line 358
    :cond_12
    invoke-virtual {v1}, Ll/mqw0;->j()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    return-object v0
.end method

.method public static b(Ljava/util/List;[J)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    const-wide/16 v1, 0x0

    .line 3
    .line 4
    move v3, v0

    .line 5
    :goto_0
    const/4 v4, 0x2

    .line 6
    if-ge v3, v4, :cond_0

    .line 7
    .line 8
    aget-wide v4, p1, v3

    .line 9
    .line 10
    add-long/2addr v1, v4

    .line 11
    add-int/lit8 v3, v3, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-ge v0, v3, :cond_2

    .line 19
    .line 20
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Ll/mqw0;

    .line 25
    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    new-instance v4, Ll/u2z0;

    .line 29
    .line 30
    aget-wide v5, p1, v0

    .line 31
    .line 32
    invoke-direct {v4, v1, v2, v5, v6}, Ll/u2z0;-><init>(JJ)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3, v4}, Ll/mqw0;->g(Ljava/lang/Object;)Ll/mqw0;

    .line 36
    .line 37
    .line 38
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    return-void
.end method
