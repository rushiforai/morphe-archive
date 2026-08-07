.class public final Ll/iny;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public A:I

.field public B:I

.field public C:I

.field public D:I

.field public E:I

.field public F:I

.field public G:I

.field public H:I

.field public I:J

.field public J:J

.field public K:J

.field public a:J

.field public b:J

.field public c:J

.field public d:J

.field public e:J

.field public f:J

.field public g:J

.field public h:J

.field public i:J

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:J

.field public r:Z

.field public s:Z

.field public t:I

.field public u:I

.field private v:I

.field private w:I

.field private x:J

.field private y:J

.field public z:I


# direct methods
.method public constructor <init>(J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/iny;->H:I

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, v0, v1}, Ll/iny;->e(JJ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private varargs f([Ljava/lang/Object;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "("

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :goto_0
    array-length v1, p1

    .line 12
    if-ge v0, v1, :cond_1

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string v1, ","

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    :cond_0
    aget-object v1, p1, v0

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string p1, ")"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method


# virtual methods
.method public a()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/iny;->g:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/iny;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 48

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Ll/iny;->d:J

    .line 4
    .line 5
    iget-wide v3, v0, Ll/iny;->I:J

    .line 6
    .line 7
    sub-long/2addr v1, v3

    .line 8
    iget-wide v3, v0, Ll/iny;->e:J

    .line 9
    .line 10
    iget-wide v5, v0, Ll/iny;->J:J

    .line 11
    .line 12
    sub-long/2addr v3, v5

    .line 13
    iget-wide v5, v0, Ll/iny;->f:J

    .line 14
    .line 15
    iget-wide v7, v0, Ll/iny;->K:J

    .line 16
    .line 17
    sub-long/2addr v5, v7

    .line 18
    iget v7, v0, Ll/iny;->n:I

    .line 19
    .line 20
    iget v8, v0, Ll/iny;->o:I

    .line 21
    .line 22
    sub-int/2addr v7, v8

    .line 23
    int-to-long v7, v7

    .line 24
    iget v9, v0, Ll/iny;->t:I

    .line 25
    .line 26
    iget v10, v0, Ll/iny;->v:I

    .line 27
    .line 28
    sub-int/2addr v9, v10

    .line 29
    iget v10, v0, Ll/iny;->u:I

    .line 30
    .line 31
    iget v11, v0, Ll/iny;->w:I

    .line 32
    .line 33
    sub-int/2addr v10, v11

    .line 34
    iget v11, v0, Ll/iny;->B:I

    .line 35
    .line 36
    if-eqz v11, :cond_0

    .line 37
    .line 38
    iget v13, v0, Ll/iny;->A:I

    .line 39
    .line 40
    div-int/2addr v13, v11

    .line 41
    iget v14, v0, Ll/iny;->j:I

    .line 42
    .line 43
    div-int/2addr v14, v11

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 v13, 0x0

    .line 46
    const/4 v14, 0x0

    .line 47
    :goto_0
    iget v11, v0, Ll/iny;->C:I

    .line 48
    .line 49
    if-eqz v11, :cond_1

    .line 50
    .line 51
    move/from16 v16, v13

    .line 52
    .line 53
    iget-wide v12, v0, Ll/iny;->c:J

    .line 54
    .line 55
    move-wide/from16 v17, v1

    .line 56
    .line 57
    int-to-long v1, v11

    .line 58
    div-long/2addr v12, v1

    .line 59
    long-to-int v1, v12

    .line 60
    goto :goto_1

    .line 61
    :cond_1
    move-wide/from16 v17, v1

    .line 62
    .line 63
    move/from16 v16, v13

    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    :goto_1
    iget v2, v0, Ll/iny;->E:I

    .line 67
    .line 68
    if-eqz v2, :cond_2

    .line 69
    .line 70
    iget v11, v0, Ll/iny;->D:I

    .line 71
    .line 72
    div-int/2addr v11, v2

    .line 73
    goto :goto_2

    .line 74
    :cond_2
    const/4 v11, 0x0

    .line 75
    :goto_2
    const-wide/16 v19, 0x101

    .line 76
    .line 77
    iget-wide v12, v0, Ll/iny;->y:J

    .line 78
    .line 79
    cmp-long v2, v19, v12

    .line 80
    .line 81
    if-nez v2, :cond_5

    .line 82
    .line 83
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 84
    .line 85
    .line 86
    move-result-wide v19

    .line 87
    const-wide/16 v21, 0x0

    .line 88
    .line 89
    iget-wide v12, v0, Ll/iny;->x:J

    .line 90
    .line 91
    sub-long v19, v19, v12

    .line 92
    .line 93
    cmp-long v2, v19, v21

    .line 94
    .line 95
    if-lez v2, :cond_6

    .line 96
    .line 97
    cmp-long v2, v5, v21

    .line 98
    .line 99
    if-lez v2, :cond_3

    .line 100
    .line 101
    div-long v23, v5, v19

    .line 102
    .line 103
    const-wide/16 v25, 0x8

    .line 104
    .line 105
    mul-long v12, v23, v25

    .line 106
    .line 107
    iput-wide v12, v0, Ll/iny;->a:J

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :cond_3
    const-wide/16 v25, 0x8

    .line 111
    .line 112
    :goto_3
    cmp-long v2, v3, v21

    .line 113
    .line 114
    if-lez v2, :cond_4

    .line 115
    .line 116
    div-long v12, v3, v19

    .line 117
    .line 118
    mul-long v12, v12, v25

    .line 119
    .line 120
    iput-wide v12, v0, Ll/iny;->b:J

    .line 121
    .line 122
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 123
    .line 124
    .line 125
    move-result-wide v12

    .line 126
    iput-wide v12, v0, Ll/iny;->x:J

    .line 127
    .line 128
    goto :goto_4

    .line 129
    :cond_5
    const-wide/16 v21, 0x0

    .line 130
    .line 131
    :cond_6
    :goto_4
    iget-wide v12, v0, Ll/iny;->a:J

    .line 132
    .line 133
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 134
    .line 135
    .line 136
    move-result-object v23

    .line 137
    iget-wide v12, v0, Ll/iny;->b:J

    .line 138
    .line 139
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 140
    .line 141
    .line 142
    move-result-object v24

    .line 143
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 144
    .line 145
    .line 146
    move-result-object v25

    .line 147
    cmp-long v1, v17, v21

    .line 148
    .line 149
    if-lez v1, :cond_7

    .line 150
    .line 151
    move-wide/from16 v1, v17

    .line 152
    .line 153
    goto :goto_5

    .line 154
    :cond_7
    move-wide/from16 v1, v21

    .line 155
    .line 156
    :goto_5
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 157
    .line 158
    .line 159
    move-result-object v26

    .line 160
    cmp-long v1, v3, v21

    .line 161
    .line 162
    if-lez v1, :cond_8

    .line 163
    .line 164
    goto :goto_6

    .line 165
    :cond_8
    move-wide/from16 v3, v21

    .line 166
    .line 167
    :goto_6
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 168
    .line 169
    .line 170
    move-result-object v27

    .line 171
    cmp-long v1, v5, v21

    .line 172
    .line 173
    if-lez v1, :cond_9

    .line 174
    .line 175
    goto :goto_7

    .line 176
    :cond_9
    move-wide/from16 v5, v21

    .line 177
    .line 178
    :goto_7
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 179
    .line 180
    .line 181
    move-result-object v28

    .line 182
    iget-wide v1, v0, Ll/iny;->g:J

    .line 183
    .line 184
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 185
    .line 186
    .line 187
    move-result-object v29

    .line 188
    iget-boolean v1, v0, Ll/iny;->s:Z

    .line 189
    .line 190
    if-eqz v1, :cond_a

    .line 191
    .line 192
    move-wide/from16 v1, v21

    .line 193
    .line 194
    goto :goto_8

    .line 195
    :cond_a
    iget-wide v1, v0, Ll/iny;->h:J

    .line 196
    .line 197
    :goto_8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 198
    .line 199
    .line 200
    move-result-object v30

    .line 201
    iget-boolean v1, v0, Ll/iny;->s:Z

    .line 202
    .line 203
    if-eqz v1, :cond_b

    .line 204
    .line 205
    move-wide/from16 v1, v21

    .line 206
    .line 207
    goto :goto_9

    .line 208
    :cond_b
    iget-wide v1, v0, Ll/iny;->i:J

    .line 209
    .line 210
    :goto_9
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 211
    .line 212
    .line 213
    move-result-object v31

    .line 214
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 215
    .line 216
    .line 217
    move-result-object v32

    .line 218
    iget v1, v0, Ll/iny;->k:I

    .line 219
    .line 220
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 221
    .line 222
    .line 223
    move-result-object v33

    .line 224
    iget v1, v0, Ll/iny;->l:I

    .line 225
    .line 226
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 227
    .line 228
    .line 229
    move-result-object v34

    .line 230
    iget v1, v0, Ll/iny;->m:I

    .line 231
    .line 232
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 233
    .line 234
    .line 235
    move-result-object v35

    .line 236
    cmp-long v1, v7, v21

    .line 237
    .line 238
    if-lez v1, :cond_c

    .line 239
    .line 240
    goto :goto_a

    .line 241
    :cond_c
    move-wide/from16 v7, v21

    .line 242
    .line 243
    :goto_a
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 244
    .line 245
    .line 246
    move-result-object v36

    .line 247
    iget v1, v0, Ll/iny;->p:I

    .line 248
    .line 249
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 250
    .line 251
    .line 252
    move-result-object v37

    .line 253
    iget-wide v1, v0, Ll/iny;->q:J

    .line 254
    .line 255
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 256
    .line 257
    .line 258
    move-result-object v38

    .line 259
    iget-boolean v1, v0, Ll/iny;->r:Z

    .line 260
    .line 261
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 262
    .line 263
    .line 264
    move-result-object v39

    .line 265
    iget-boolean v1, v0, Ll/iny;->s:Z

    .line 266
    .line 267
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 268
    .line 269
    .line 270
    move-result-object v40

    .line 271
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 272
    .line 273
    .line 274
    move-result-object v41

    .line 275
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 276
    .line 277
    .line 278
    move-result-object v42

    .line 279
    iget v1, v0, Ll/iny;->z:I

    .line 280
    .line 281
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 282
    .line 283
    .line 284
    move-result-object v43

    .line 285
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 286
    .line 287
    .line 288
    move-result-object v44

    .line 289
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 290
    .line 291
    .line 292
    move-result-object v45

    .line 293
    iget v1, v0, Ll/iny;->F:I

    .line 294
    .line 295
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 296
    .line 297
    .line 298
    move-result-object v46

    .line 299
    iget v1, v0, Ll/iny;->G:I

    .line 300
    .line 301
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 302
    .line 303
    .line 304
    move-result-object v47

    .line 305
    filled-new-array/range {v23 .. v47}, [Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v1

    .line 309
    invoke-direct {v0, v1}, Ll/iny;->f([Ljava/lang/Object;)Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    move-wide/from16 v2, v21

    .line 314
    .line 315
    iput-wide v2, v0, Ll/iny;->a:J

    .line 316
    .line 317
    iput-wide v2, v0, Ll/iny;->b:J

    .line 318
    .line 319
    iput-wide v2, v0, Ll/iny;->h:J

    .line 320
    .line 321
    iput-wide v2, v0, Ll/iny;->i:J

    .line 322
    .line 323
    iget-wide v2, v0, Ll/iny;->d:J

    .line 324
    .line 325
    iput-wide v2, v0, Ll/iny;->I:J

    .line 326
    .line 327
    iget-wide v2, v0, Ll/iny;->e:J

    .line 328
    .line 329
    iput-wide v2, v0, Ll/iny;->J:J

    .line 330
    .line 331
    iget-wide v2, v0, Ll/iny;->f:J

    .line 332
    .line 333
    iput-wide v2, v0, Ll/iny;->K:J

    .line 334
    .line 335
    iget v2, v0, Ll/iny;->n:I

    .line 336
    .line 337
    iput v2, v0, Ll/iny;->o:I

    .line 338
    .line 339
    iget v2, v0, Ll/iny;->t:I

    .line 340
    .line 341
    iput v2, v0, Ll/iny;->v:I

    .line 342
    .line 343
    iget v2, v0, Ll/iny;->u:I

    .line 344
    .line 345
    iput v2, v0, Ll/iny;->w:I

    .line 346
    .line 347
    const/4 v15, 0x0

    .line 348
    iput v15, v0, Ll/iny;->A:I

    .line 349
    .line 350
    iput v15, v0, Ll/iny;->j:I

    .line 351
    .line 352
    iput v15, v0, Ll/iny;->z:I

    .line 353
    .line 354
    const-wide/16 v2, 0x0

    .line 355
    .line 356
    iput-wide v2, v0, Ll/iny;->c:J

    .line 357
    .line 358
    iput v15, v0, Ll/iny;->C:I

    .line 359
    .line 360
    iput v15, v0, Ll/iny;->B:I

    .line 361
    .line 362
    iput-wide v2, v0, Ll/iny;->q:J

    .line 363
    .line 364
    iput v15, v0, Ll/iny;->p:I

    .line 365
    .line 366
    iput v15, v0, Ll/iny;->l:I

    .line 367
    .line 368
    iput v15, v0, Ll/iny;->F:I

    .line 369
    .line 370
    iput v15, v0, Ll/iny;->G:I

    .line 371
    .line 372
    return-object v1
.end method

.method public d()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/iny;->y:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public e(JJ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/iny;->i()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Ll/iny;->x:J

    .line 9
    .line 10
    iput-wide p1, p0, Ll/iny;->g:J

    .line 11
    .line 12
    iput-wide p3, p0, Ll/iny;->y:J

    .line 13
    .line 14
    return-void
.end method

.method public g(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/iny;->r:Z

    .line 2
    .line 3
    return-void
.end method

.method public h(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/iny;->s:Z

    .line 2
    .line 3
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/iny;->a:J

    .line 4
    .line 5
    iput-wide v0, p0, Ll/iny;->b:J

    .line 6
    .line 7
    iput-wide v0, p0, Ll/iny;->c:J

    .line 8
    .line 9
    iput-wide v0, p0, Ll/iny;->d:J

    .line 10
    .line 11
    iput-wide v0, p0, Ll/iny;->e:J

    .line 12
    .line 13
    iput-wide v0, p0, Ll/iny;->f:J

    .line 14
    .line 15
    iput-wide v0, p0, Ll/iny;->g:J

    .line 16
    .line 17
    iput-wide v0, p0, Ll/iny;->h:J

    .line 18
    .line 19
    iput-wide v0, p0, Ll/iny;->i:J

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Ll/iny;->s:Z

    .line 23
    .line 24
    iput-boolean v0, p0, Ll/iny;->r:Z

    .line 25
    .line 26
    iput v0, p0, Ll/iny;->j:I

    .line 27
    .line 28
    iput v0, p0, Ll/iny;->k:I

    .line 29
    .line 30
    iput v0, p0, Ll/iny;->o:I

    .line 31
    .line 32
    iput v0, p0, Ll/iny;->t:I

    .line 33
    .line 34
    iput v0, p0, Ll/iny;->u:I

    .line 35
    .line 36
    iput v0, p0, Ll/iny;->B:I

    .line 37
    .line 38
    iput v0, p0, Ll/iny;->C:I

    .line 39
    .line 40
    iput v0, p0, Ll/iny;->z:I

    .line 41
    .line 42
    iput v0, p0, Ll/iny;->A:I

    .line 43
    .line 44
    iput v0, p0, Ll/iny;->D:I

    .line 45
    .line 46
    iput v0, p0, Ll/iny;->E:I

    .line 47
    .line 48
    iput v0, p0, Ll/iny;->F:I

    .line 49
    .line 50
    iput v0, p0, Ll/iny;->G:I

    .line 51
    .line 52
    return-void
.end method

.method public j(II)V
    .locals 0

    .line 1
    iput p2, p0, Ll/iny;->k:I

    .line 2
    .line 3
    return-void
.end method

.method public k(IIII)V
    .locals 0

    .line 1
    int-to-long p1, p1

    .line 2
    iput-wide p1, p0, Ll/iny;->b:J

    .line 3
    .line 4
    int-to-long p1, p3

    .line 5
    iput-wide p1, p0, Ll/iny;->h:J

    .line 6
    .line 7
    int-to-long p1, p4

    .line 8
    iput-wide p1, p0, Ll/iny;->i:J

    .line 9
    .line 10
    return-void
.end method
