.class public Landroidx/constraintlayout/solver/widgets/h;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:[Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v0, v0, [Z

    .line 3
    .line 4
    sput-object v0, Landroidx/constraintlayout/solver/widgets/h;->a:[Z

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(ILandroidx/constraintlayout/solver/widgets/ConstraintWidget;)V
    .locals 16

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->H0()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 19
    .line 20
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    iget-object v4, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 25
    .line 26
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    const/16 v5, 0x8

    .line 31
    .line 32
    and-int/lit8 v6, p0, 0x8

    .line 33
    .line 34
    const/4 v7, 0x0

    .line 35
    const/4 v8, 0x1

    .line 36
    if-ne v6, v5, :cond_0

    .line 37
    .line 38
    move v6, v8

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    move v6, v7

    .line 41
    :goto_0
    iget-object v9, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 42
    .line 43
    aget-object v9, v9, v7

    .line 44
    .line 45
    sget-object v10, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 46
    .line 47
    if-ne v9, v10, :cond_1

    .line 48
    .line 49
    invoke-static {v0, v7}, Landroidx/constraintlayout/solver/widgets/h;->d(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)Z

    .line 50
    .line 51
    .line 52
    move-result v9

    .line 53
    if-eqz v9, :cond_1

    .line 54
    .line 55
    move v9, v8

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    move v9, v7

    .line 58
    :goto_1
    iget v11, v1, Landroidx/constraintlayout/solver/widgets/i;->i:I

    .line 59
    .line 60
    const/4 v12, 0x3

    .line 61
    const/4 v13, 0x4

    .line 62
    const/4 v14, 0x0

    .line 63
    const/4 v15, -0x1

    .line 64
    move/from16 p0, v7

    .line 65
    .line 66
    const/4 v7, 0x2

    .line 67
    if-eq v11, v13, :cond_13

    .line 68
    .line 69
    iget v11, v3, Landroidx/constraintlayout/solver/widgets/i;->i:I

    .line 70
    .line 71
    if-eq v11, v13, :cond_13

    .line 72
    .line 73
    iget-object v11, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 74
    .line 75
    aget-object v11, v11, p0

    .line 76
    .line 77
    sget-object v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 78
    .line 79
    if-eq v11, v13, :cond_b

    .line 80
    .line 81
    if-eqz v9, :cond_2

    .line 82
    .line 83
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    .line 84
    .line 85
    .line 86
    move-result v11

    .line 87
    if-ne v11, v5, :cond_2

    .line 88
    .line 89
    goto/16 :goto_2

    .line 90
    .line 91
    :cond_2
    if-eqz v9, :cond_13

    .line 92
    .line 93
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 94
    .line 95
    .line 96
    move-result v9

    .line 97
    invoke-virtual {v1, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v3, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 101
    .line 102
    .line 103
    iget-object v11, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 104
    .line 105
    iget-object v11, v11, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 106
    .line 107
    if-nez v11, :cond_4

    .line 108
    .line 109
    iget-object v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 110
    .line 111
    iget-object v13, v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 112
    .line 113
    if-nez v13, :cond_4

    .line 114
    .line 115
    if-eqz v6, :cond_3

    .line 116
    .line 117
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 118
    .line 119
    .line 120
    move-result-object v9

    .line 121
    invoke-virtual {v3, v1, v8, v9}, Landroidx/constraintlayout/solver/widgets/i;->j(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 122
    .line 123
    .line 124
    goto/16 :goto_3

    .line 125
    .line 126
    :cond_3
    invoke-virtual {v3, v1, v9}, Landroidx/constraintlayout/solver/widgets/i;->i(Landroidx/constraintlayout/solver/widgets/i;I)V

    .line 127
    .line 128
    .line 129
    goto/16 :goto_3

    .line 130
    .line 131
    :cond_4
    if-eqz v11, :cond_6

    .line 132
    .line 133
    iget-object v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 134
    .line 135
    iget-object v13, v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 136
    .line 137
    if-nez v13, :cond_6

    .line 138
    .line 139
    if-eqz v6, :cond_5

    .line 140
    .line 141
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 142
    .line 143
    .line 144
    move-result-object v9

    .line 145
    invoke-virtual {v3, v1, v8, v9}, Landroidx/constraintlayout/solver/widgets/i;->j(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 146
    .line 147
    .line 148
    goto/16 :goto_3

    .line 149
    .line 150
    :cond_5
    invoke-virtual {v3, v1, v9}, Landroidx/constraintlayout/solver/widgets/i;->i(Landroidx/constraintlayout/solver/widgets/i;I)V

    .line 151
    .line 152
    .line 153
    goto/16 :goto_3

    .line 154
    .line 155
    :cond_6
    if-nez v11, :cond_8

    .line 156
    .line 157
    iget-object v13, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 158
    .line 159
    iget-object v13, v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 160
    .line 161
    if-eqz v13, :cond_8

    .line 162
    .line 163
    if-eqz v6, :cond_7

    .line 164
    .line 165
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 166
    .line 167
    .line 168
    move-result-object v9

    .line 169
    invoke-virtual {v1, v3, v15, v9}, Landroidx/constraintlayout/solver/widgets/i;->j(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 170
    .line 171
    .line 172
    goto/16 :goto_3

    .line 173
    .line 174
    :cond_7
    neg-int v9, v9

    .line 175
    invoke-virtual {v1, v3, v9}, Landroidx/constraintlayout/solver/widgets/i;->i(Landroidx/constraintlayout/solver/widgets/i;I)V

    .line 176
    .line 177
    .line 178
    goto/16 :goto_3

    .line 179
    .line 180
    :cond_8
    if-eqz v11, :cond_13

    .line 181
    .line 182
    iget-object v11, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 183
    .line 184
    iget-object v11, v11, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 185
    .line 186
    if-eqz v11, :cond_13

    .line 187
    .line 188
    if-eqz v6, :cond_9

    .line 189
    .line 190
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 191
    .line 192
    .line 193
    move-result-object v11

    .line 194
    invoke-virtual {v11, v1}, Ll/s3d0;->a(Ll/s3d0;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 198
    .line 199
    .line 200
    move-result-object v11

    .line 201
    invoke-virtual {v11, v3}, Ll/s3d0;->a(Ll/s3d0;)V

    .line 202
    .line 203
    .line 204
    :cond_9
    iget v11, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 205
    .line 206
    cmpl-float v11, v11, v14

    .line 207
    .line 208
    if-nez v11, :cond_a

    .line 209
    .line 210
    invoke-virtual {v1, v12}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v3, v12}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v1, v3, v14}, Landroidx/constraintlayout/solver/widgets/i;->n(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {v3, v1, v14}, Landroidx/constraintlayout/solver/widgets/i;->n(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 220
    .line 221
    .line 222
    goto/16 :goto_3

    .line 223
    .line 224
    :cond_a
    invoke-virtual {v1, v7}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {v3, v7}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 228
    .line 229
    .line 230
    neg-int v11, v9

    .line 231
    int-to-float v11, v11

    .line 232
    invoke-virtual {v1, v3, v11}, Landroidx/constraintlayout/solver/widgets/i;->n(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 233
    .line 234
    .line 235
    int-to-float v11, v9

    .line 236
    invoke-virtual {v3, v1, v11}, Landroidx/constraintlayout/solver/widgets/i;->n(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v0, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 240
    .line 241
    .line 242
    goto/16 :goto_3

    .line 243
    .line 244
    :cond_b
    :goto_2
    iget-object v9, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 245
    .line 246
    iget-object v9, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 247
    .line 248
    if-nez v9, :cond_d

    .line 249
    .line 250
    iget-object v11, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 251
    .line 252
    iget-object v11, v11, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 253
    .line 254
    if-nez v11, :cond_d

    .line 255
    .line 256
    invoke-virtual {v1, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v3, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 260
    .line 261
    .line 262
    if-eqz v6, :cond_c

    .line 263
    .line 264
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 265
    .line 266
    .line 267
    move-result-object v9

    .line 268
    invoke-virtual {v3, v1, v8, v9}, Landroidx/constraintlayout/solver/widgets/i;->j(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 269
    .line 270
    .line 271
    goto/16 :goto_3

    .line 272
    .line 273
    :cond_c
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 274
    .line 275
    .line 276
    move-result v9

    .line 277
    invoke-virtual {v3, v1, v9}, Landroidx/constraintlayout/solver/widgets/i;->i(Landroidx/constraintlayout/solver/widgets/i;I)V

    .line 278
    .line 279
    .line 280
    goto/16 :goto_3

    .line 281
    .line 282
    :cond_d
    if-eqz v9, :cond_f

    .line 283
    .line 284
    iget-object v11, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 285
    .line 286
    iget-object v11, v11, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 287
    .line 288
    if-nez v11, :cond_f

    .line 289
    .line 290
    invoke-virtual {v1, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {v3, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 294
    .line 295
    .line 296
    if-eqz v6, :cond_e

    .line 297
    .line 298
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 299
    .line 300
    .line 301
    move-result-object v9

    .line 302
    invoke-virtual {v3, v1, v8, v9}, Landroidx/constraintlayout/solver/widgets/i;->j(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 303
    .line 304
    .line 305
    goto/16 :goto_3

    .line 306
    .line 307
    :cond_e
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 308
    .line 309
    .line 310
    move-result v9

    .line 311
    invoke-virtual {v3, v1, v9}, Landroidx/constraintlayout/solver/widgets/i;->i(Landroidx/constraintlayout/solver/widgets/i;I)V

    .line 312
    .line 313
    .line 314
    goto :goto_3

    .line 315
    :cond_f
    if-nez v9, :cond_11

    .line 316
    .line 317
    iget-object v11, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 318
    .line 319
    iget-object v11, v11, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 320
    .line 321
    if-eqz v11, :cond_11

    .line 322
    .line 323
    invoke-virtual {v1, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {v3, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 330
    .line 331
    .line 332
    move-result v9

    .line 333
    neg-int v9, v9

    .line 334
    invoke-virtual {v1, v3, v9}, Landroidx/constraintlayout/solver/widgets/i;->i(Landroidx/constraintlayout/solver/widgets/i;I)V

    .line 335
    .line 336
    .line 337
    if-eqz v6, :cond_10

    .line 338
    .line 339
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 340
    .line 341
    .line 342
    move-result-object v9

    .line 343
    invoke-virtual {v1, v3, v15, v9}, Landroidx/constraintlayout/solver/widgets/i;->j(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 344
    .line 345
    .line 346
    goto :goto_3

    .line 347
    :cond_10
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 348
    .line 349
    .line 350
    move-result v9

    .line 351
    neg-int v9, v9

    .line 352
    invoke-virtual {v1, v3, v9}, Landroidx/constraintlayout/solver/widgets/i;->i(Landroidx/constraintlayout/solver/widgets/i;I)V

    .line 353
    .line 354
    .line 355
    goto :goto_3

    .line 356
    :cond_11
    if-eqz v9, :cond_13

    .line 357
    .line 358
    iget-object v9, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 359
    .line 360
    iget-object v9, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 361
    .line 362
    if-eqz v9, :cond_13

    .line 363
    .line 364
    invoke-virtual {v1, v7}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 365
    .line 366
    .line 367
    invoke-virtual {v3, v7}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 368
    .line 369
    .line 370
    if-eqz v6, :cond_12

    .line 371
    .line 372
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 373
    .line 374
    .line 375
    move-result-object v9

    .line 376
    invoke-virtual {v9, v1}, Ll/s3d0;->a(Ll/s3d0;)V

    .line 377
    .line 378
    .line 379
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 380
    .line 381
    .line 382
    move-result-object v9

    .line 383
    invoke-virtual {v9, v3}, Ll/s3d0;->a(Ll/s3d0;)V

    .line 384
    .line 385
    .line 386
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 387
    .line 388
    .line 389
    move-result-object v9

    .line 390
    invoke-virtual {v1, v3, v15, v9}, Landroidx/constraintlayout/solver/widgets/i;->o(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 391
    .line 392
    .line 393
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 394
    .line 395
    .line 396
    move-result-object v9

    .line 397
    invoke-virtual {v3, v1, v8, v9}, Landroidx/constraintlayout/solver/widgets/i;->o(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 398
    .line 399
    .line 400
    goto :goto_3

    .line 401
    :cond_12
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 402
    .line 403
    .line 404
    move-result v9

    .line 405
    neg-int v9, v9

    .line 406
    int-to-float v9, v9

    .line 407
    invoke-virtual {v1, v3, v9}, Landroidx/constraintlayout/solver/widgets/i;->n(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 408
    .line 409
    .line 410
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 411
    .line 412
    .line 413
    move-result v9

    .line 414
    int-to-float v9, v9

    .line 415
    invoke-virtual {v3, v1, v9}, Landroidx/constraintlayout/solver/widgets/i;->n(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 416
    .line 417
    .line 418
    :cond_13
    :goto_3
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 419
    .line 420
    aget-object v1, v1, v8

    .line 421
    .line 422
    if-ne v1, v10, :cond_14

    .line 423
    .line 424
    invoke-static {v0, v8}, Landroidx/constraintlayout/solver/widgets/h;->d(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)Z

    .line 425
    .line 426
    .line 427
    move-result v1

    .line 428
    if-eqz v1, :cond_14

    .line 429
    .line 430
    move v1, v8

    .line 431
    goto :goto_4

    .line 432
    :cond_14
    move/from16 v1, p0

    .line 433
    .line 434
    :goto_4
    iget v3, v2, Landroidx/constraintlayout/solver/widgets/i;->i:I

    .line 435
    .line 436
    const/4 v9, 0x4

    .line 437
    if-eq v3, v9, :cond_26

    .line 438
    .line 439
    iget v3, v4, Landroidx/constraintlayout/solver/widgets/i;->i:I

    .line 440
    .line 441
    if-eq v3, v9, :cond_26

    .line 442
    .line 443
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 444
    .line 445
    aget-object v3, v3, v8

    .line 446
    .line 447
    sget-object v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 448
    .line 449
    if-eq v3, v9, :cond_1e

    .line 450
    .line 451
    if-eqz v1, :cond_15

    .line 452
    .line 453
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    .line 454
    .line 455
    .line 456
    move-result v3

    .line 457
    if-ne v3, v5, :cond_15

    .line 458
    .line 459
    goto/16 :goto_5

    .line 460
    .line 461
    :cond_15
    if-eqz v1, :cond_26

    .line 462
    .line 463
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 464
    .line 465
    .line 466
    move-result v1

    .line 467
    invoke-virtual {v2, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 468
    .line 469
    .line 470
    invoke-virtual {v4, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 471
    .line 472
    .line 473
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 474
    .line 475
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 476
    .line 477
    if-nez v3, :cond_17

    .line 478
    .line 479
    iget-object v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 480
    .line 481
    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 482
    .line 483
    if-nez v5, :cond_17

    .line 484
    .line 485
    if-eqz v6, :cond_16

    .line 486
    .line 487
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    invoke-virtual {v4, v2, v8, v0}, Landroidx/constraintlayout/solver/widgets/i;->j(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 492
    .line 493
    .line 494
    return-void

    .line 495
    :cond_16
    invoke-virtual {v4, v2, v1}, Landroidx/constraintlayout/solver/widgets/i;->i(Landroidx/constraintlayout/solver/widgets/i;I)V

    .line 496
    .line 497
    .line 498
    return-void

    .line 499
    :cond_17
    if-eqz v3, :cond_19

    .line 500
    .line 501
    iget-object v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 502
    .line 503
    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 504
    .line 505
    if-nez v5, :cond_19

    .line 506
    .line 507
    if-eqz v6, :cond_18

    .line 508
    .line 509
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 510
    .line 511
    .line 512
    move-result-object v0

    .line 513
    invoke-virtual {v4, v2, v8, v0}, Landroidx/constraintlayout/solver/widgets/i;->j(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 514
    .line 515
    .line 516
    return-void

    .line 517
    :cond_18
    invoke-virtual {v4, v2, v1}, Landroidx/constraintlayout/solver/widgets/i;->i(Landroidx/constraintlayout/solver/widgets/i;I)V

    .line 518
    .line 519
    .line 520
    return-void

    .line 521
    :cond_19
    if-nez v3, :cond_1b

    .line 522
    .line 523
    iget-object v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 524
    .line 525
    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 526
    .line 527
    if-eqz v5, :cond_1b

    .line 528
    .line 529
    if-eqz v6, :cond_1a

    .line 530
    .line 531
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 532
    .line 533
    .line 534
    move-result-object v0

    .line 535
    invoke-virtual {v2, v4, v15, v0}, Landroidx/constraintlayout/solver/widgets/i;->j(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 536
    .line 537
    .line 538
    return-void

    .line 539
    :cond_1a
    neg-int v0, v1

    .line 540
    invoke-virtual {v2, v4, v0}, Landroidx/constraintlayout/solver/widgets/i;->i(Landroidx/constraintlayout/solver/widgets/i;I)V

    .line 541
    .line 542
    .line 543
    return-void

    .line 544
    :cond_1b
    if-eqz v3, :cond_26

    .line 545
    .line 546
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 547
    .line 548
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 549
    .line 550
    if-eqz v3, :cond_26

    .line 551
    .line 552
    if-eqz v6, :cond_1c

    .line 553
    .line 554
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 555
    .line 556
    .line 557
    move-result-object v3

    .line 558
    invoke-virtual {v3, v2}, Ll/s3d0;->a(Ll/s3d0;)V

    .line 559
    .line 560
    .line 561
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 562
    .line 563
    .line 564
    move-result-object v3

    .line 565
    invoke-virtual {v3, v4}, Ll/s3d0;->a(Ll/s3d0;)V

    .line 566
    .line 567
    .line 568
    :cond_1c
    iget v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 569
    .line 570
    cmpl-float v3, v3, v14

    .line 571
    .line 572
    if-nez v3, :cond_1d

    .line 573
    .line 574
    invoke-virtual {v2, v12}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 575
    .line 576
    .line 577
    invoke-virtual {v4, v12}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 578
    .line 579
    .line 580
    invoke-virtual {v2, v4, v14}, Landroidx/constraintlayout/solver/widgets/i;->n(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 581
    .line 582
    .line 583
    invoke-virtual {v4, v2, v14}, Landroidx/constraintlayout/solver/widgets/i;->n(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 584
    .line 585
    .line 586
    return-void

    .line 587
    :cond_1d
    invoke-virtual {v2, v7}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 588
    .line 589
    .line 590
    invoke-virtual {v4, v7}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 591
    .line 592
    .line 593
    neg-int v3, v1

    .line 594
    int-to-float v3, v3

    .line 595
    invoke-virtual {v2, v4, v3}, Landroidx/constraintlayout/solver/widgets/i;->n(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 596
    .line 597
    .line 598
    int-to-float v3, v1

    .line 599
    invoke-virtual {v4, v2, v3}, Landroidx/constraintlayout/solver/widgets/i;->n(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 600
    .line 601
    .line 602
    invoke-virtual {v0, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 603
    .line 604
    .line 605
    iget v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 606
    .line 607
    if-lez v1, :cond_26

    .line 608
    .line 609
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 610
    .line 611
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 612
    .line 613
    .line 614
    move-result-object v1

    .line 615
    iget v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 616
    .line 617
    invoke-virtual {v1, v8, v2, v0}, Landroidx/constraintlayout/solver/widgets/i;->h(ILandroidx/constraintlayout/solver/widgets/i;I)V

    .line 618
    .line 619
    .line 620
    return-void

    .line 621
    :cond_1e
    :goto_5
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 622
    .line 623
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 624
    .line 625
    if-nez v1, :cond_20

    .line 626
    .line 627
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 628
    .line 629
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 630
    .line 631
    if-nez v3, :cond_20

    .line 632
    .line 633
    invoke-virtual {v2, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 634
    .line 635
    .line 636
    invoke-virtual {v4, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 637
    .line 638
    .line 639
    if-eqz v6, :cond_1f

    .line 640
    .line 641
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 642
    .line 643
    .line 644
    move-result-object v1

    .line 645
    invoke-virtual {v4, v2, v8, v1}, Landroidx/constraintlayout/solver/widgets/i;->j(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 646
    .line 647
    .line 648
    goto :goto_6

    .line 649
    :cond_1f
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 650
    .line 651
    .line 652
    move-result v1

    .line 653
    invoke-virtual {v4, v2, v1}, Landroidx/constraintlayout/solver/widgets/i;->i(Landroidx/constraintlayout/solver/widgets/i;I)V

    .line 654
    .line 655
    .line 656
    :goto_6
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 657
    .line 658
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 659
    .line 660
    if-eqz v3, :cond_26

    .line 661
    .line 662
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 663
    .line 664
    .line 665
    move-result-object v1

    .line 666
    invoke-virtual {v1, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 667
    .line 668
    .line 669
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 670
    .line 671
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 672
    .line 673
    .line 674
    move-result-object v1

    .line 675
    iget v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 676
    .line 677
    neg-int v0, v0

    .line 678
    invoke-virtual {v2, v8, v1, v0}, Landroidx/constraintlayout/solver/widgets/i;->h(ILandroidx/constraintlayout/solver/widgets/i;I)V

    .line 679
    .line 680
    .line 681
    return-void

    .line 682
    :cond_20
    if-eqz v1, :cond_22

    .line 683
    .line 684
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 685
    .line 686
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 687
    .line 688
    if-nez v3, :cond_22

    .line 689
    .line 690
    invoke-virtual {v2, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 691
    .line 692
    .line 693
    invoke-virtual {v4, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 694
    .line 695
    .line 696
    if-eqz v6, :cond_21

    .line 697
    .line 698
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 699
    .line 700
    .line 701
    move-result-object v1

    .line 702
    invoke-virtual {v4, v2, v8, v1}, Landroidx/constraintlayout/solver/widgets/i;->j(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 703
    .line 704
    .line 705
    goto :goto_7

    .line 706
    :cond_21
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 707
    .line 708
    .line 709
    move-result v1

    .line 710
    invoke-virtual {v4, v2, v1}, Landroidx/constraintlayout/solver/widgets/i;->i(Landroidx/constraintlayout/solver/widgets/i;I)V

    .line 711
    .line 712
    .line 713
    :goto_7
    iget v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 714
    .line 715
    if-lez v1, :cond_26

    .line 716
    .line 717
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 718
    .line 719
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 720
    .line 721
    .line 722
    move-result-object v1

    .line 723
    iget v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 724
    .line 725
    invoke-virtual {v1, v8, v2, v0}, Landroidx/constraintlayout/solver/widgets/i;->h(ILandroidx/constraintlayout/solver/widgets/i;I)V

    .line 726
    .line 727
    .line 728
    return-void

    .line 729
    :cond_22
    if-nez v1, :cond_24

    .line 730
    .line 731
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 732
    .line 733
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 734
    .line 735
    if-eqz v3, :cond_24

    .line 736
    .line 737
    invoke-virtual {v2, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 738
    .line 739
    .line 740
    invoke-virtual {v4, v8}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 741
    .line 742
    .line 743
    if-eqz v6, :cond_23

    .line 744
    .line 745
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 746
    .line 747
    .line 748
    move-result-object v1

    .line 749
    invoke-virtual {v2, v4, v15, v1}, Landroidx/constraintlayout/solver/widgets/i;->j(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 750
    .line 751
    .line 752
    goto :goto_8

    .line 753
    :cond_23
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 754
    .line 755
    .line 756
    move-result v1

    .line 757
    neg-int v1, v1

    .line 758
    invoke-virtual {v2, v4, v1}, Landroidx/constraintlayout/solver/widgets/i;->i(Landroidx/constraintlayout/solver/widgets/i;I)V

    .line 759
    .line 760
    .line 761
    :goto_8
    iget v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 762
    .line 763
    if-lez v1, :cond_26

    .line 764
    .line 765
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 766
    .line 767
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 768
    .line 769
    .line 770
    move-result-object v1

    .line 771
    iget v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 772
    .line 773
    invoke-virtual {v1, v8, v2, v0}, Landroidx/constraintlayout/solver/widgets/i;->h(ILandroidx/constraintlayout/solver/widgets/i;I)V

    .line 774
    .line 775
    .line 776
    return-void

    .line 777
    :cond_24
    if-eqz v1, :cond_26

    .line 778
    .line 779
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 780
    .line 781
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 782
    .line 783
    if-eqz v1, :cond_26

    .line 784
    .line 785
    invoke-virtual {v2, v7}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 786
    .line 787
    .line 788
    invoke-virtual {v4, v7}, Landroidx/constraintlayout/solver/widgets/i;->p(I)V

    .line 789
    .line 790
    .line 791
    if-eqz v6, :cond_25

    .line 792
    .line 793
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 794
    .line 795
    .line 796
    move-result-object v1

    .line 797
    invoke-virtual {v2, v4, v15, v1}, Landroidx/constraintlayout/solver/widgets/i;->o(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 798
    .line 799
    .line 800
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 801
    .line 802
    .line 803
    move-result-object v1

    .line 804
    invoke-virtual {v4, v2, v8, v1}, Landroidx/constraintlayout/solver/widgets/i;->o(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V

    .line 805
    .line 806
    .line 807
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w()Ll/r3d0;

    .line 808
    .line 809
    .line 810
    move-result-object v1

    .line 811
    invoke-virtual {v1, v2}, Ll/s3d0;->a(Ll/s3d0;)V

    .line 812
    .line 813
    .line 814
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x()Ll/r3d0;

    .line 815
    .line 816
    .line 817
    move-result-object v1

    .line 818
    invoke-virtual {v1, v4}, Ll/s3d0;->a(Ll/s3d0;)V

    .line 819
    .line 820
    .line 821
    goto :goto_9

    .line 822
    :cond_25
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 823
    .line 824
    .line 825
    move-result v1

    .line 826
    neg-int v1, v1

    .line 827
    int-to-float v1, v1

    .line 828
    invoke-virtual {v2, v4, v1}, Landroidx/constraintlayout/solver/widgets/i;->n(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 829
    .line 830
    .line 831
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 832
    .line 833
    .line 834
    move-result v1

    .line 835
    int-to-float v1, v1

    .line 836
    invoke-virtual {v4, v2, v1}, Landroidx/constraintlayout/solver/widgets/i;->n(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 837
    .line 838
    .line 839
    :goto_9
    iget v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 840
    .line 841
    if-lez v1, :cond_26

    .line 842
    .line 843
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 844
    .line 845
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 846
    .line 847
    .line 848
    move-result-object v1

    .line 849
    iget v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 850
    .line 851
    invoke-virtual {v1, v8, v2, v0}, Landroidx/constraintlayout/solver/widgets/i;->h(ILandroidx/constraintlayout/solver/widgets/i;I)V

    .line 852
    .line 853
    .line 854
    :cond_26
    return-void
.end method

.method public static b(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/c;IILandroidx/constraintlayout/solver/widgets/d;)Z
    .locals 24

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p4

    .line 6
    .line 7
    iget-object v3, v2, Landroidx/constraintlayout/solver/widgets/d;->a:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 8
    .line 9
    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/d;->c:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 10
    .line 11
    iget-object v5, v2, Landroidx/constraintlayout/solver/widgets/d;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 12
    .line 13
    iget-object v6, v2, Landroidx/constraintlayout/solver/widgets/d;->d:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 14
    .line 15
    iget-object v7, v2, Landroidx/constraintlayout/solver/widgets/d;->e:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 16
    .line 17
    iget v2, v2, Landroidx/constraintlayout/solver/widgets/d;->k:F

    .line 18
    .line 19
    move-object/from16 v8, p0

    .line 20
    .line 21
    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 22
    .line 23
    aget-object v8, v8, v1

    .line 24
    .line 25
    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 26
    .line 27
    const/4 v8, 0x2

    .line 28
    const/4 v9, 0x1

    .line 29
    if-nez v1, :cond_3

    .line 30
    .line 31
    iget v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l0:I

    .line 32
    .line 33
    if-nez v7, :cond_0

    .line 34
    .line 35
    move v11, v9

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 v11, 0x0

    .line 38
    :goto_0
    if-ne v7, v9, :cond_1

    .line 39
    .line 40
    move v12, v9

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    const/4 v12, 0x0

    .line 43
    :goto_1
    if-ne v7, v8, :cond_2

    .line 44
    .line 45
    :goto_2
    move v7, v9

    .line 46
    goto :goto_5

    .line 47
    :cond_2
    const/4 v7, 0x0

    .line 48
    goto :goto_5

    .line 49
    :cond_3
    iget v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->m0:I

    .line 50
    .line 51
    if-nez v7, :cond_4

    .line 52
    .line 53
    move v11, v9

    .line 54
    goto :goto_3

    .line 55
    :cond_4
    const/4 v11, 0x0

    .line 56
    :goto_3
    if-ne v7, v9, :cond_5

    .line 57
    .line 58
    move v12, v9

    .line 59
    goto :goto_4

    .line 60
    :cond_5
    const/4 v12, 0x0

    .line 61
    :goto_4
    if-ne v7, v8, :cond_2

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :goto_5
    move-object v14, v3

    .line 65
    const/16 p0, 0x0

    .line 66
    .line 67
    const/16 p4, 0x0

    .line 68
    .line 69
    const/4 v8, 0x0

    .line 70
    const/4 v13, 0x0

    .line 71
    const/4 v15, 0x0

    .line 72
    const/16 v16, 0x0

    .line 73
    .line 74
    const/16 v17, 0x0

    .line 75
    .line 76
    :goto_6
    const/16 v10, 0x8

    .line 77
    .line 78
    if-nez v13, :cond_14

    .line 79
    .line 80
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    .line 81
    .line 82
    .line 83
    move-result v9

    .line 84
    if-eq v9, v10, :cond_9

    .line 85
    .line 86
    add-int/lit8 v15, v15, 0x1

    .line 87
    .line 88
    if-nez v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 91
    .line 92
    .line 93
    move-result v9

    .line 94
    :goto_7
    int-to-float v9, v9

    .line 95
    add-float v16, v16, v9

    .line 96
    .line 97
    goto :goto_8

    .line 98
    :cond_6
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 99
    .line 100
    .line 101
    move-result v9

    .line 102
    goto :goto_7

    .line 103
    :goto_8
    if-eq v14, v5, :cond_7

    .line 104
    .line 105
    iget-object v9, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 106
    .line 107
    aget-object v9, v9, p3

    .line 108
    .line 109
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 110
    .line 111
    .line 112
    move-result v9

    .line 113
    int-to-float v9, v9

    .line 114
    add-float v16, v16, v9

    .line 115
    .line 116
    :cond_7
    if-eq v14, v6, :cond_8

    .line 117
    .line 118
    iget-object v9, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 119
    .line 120
    add-int/lit8 v19, p3, 0x1

    .line 121
    .line 122
    aget-object v9, v9, v19

    .line 123
    .line 124
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 125
    .line 126
    .line 127
    move-result v9

    .line 128
    int-to-float v9, v9

    .line 129
    add-float v16, v16, v9

    .line 130
    .line 131
    :cond_8
    iget-object v9, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 132
    .line 133
    aget-object v9, v9, p3

    .line 134
    .line 135
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 136
    .line 137
    .line 138
    move-result v9

    .line 139
    int-to-float v9, v9

    .line 140
    add-float v17, v17, v9

    .line 141
    .line 142
    iget-object v9, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 143
    .line 144
    add-int/lit8 v19, p3, 0x1

    .line 145
    .line 146
    aget-object v9, v9, v19

    .line 147
    .line 148
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 149
    .line 150
    .line 151
    move-result v9

    .line 152
    int-to-float v9, v9

    .line 153
    add-float v17, v17, v9

    .line 154
    .line 155
    :cond_9
    iget-object v9, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 156
    .line 157
    aget-object v9, v9, p3

    .line 158
    .line 159
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    .line 160
    .line 161
    .line 162
    move-result v9

    .line 163
    if-eq v9, v10, :cond_10

    .line 164
    .line 165
    iget-object v9, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 166
    .line 167
    aget-object v9, v9, v1

    .line 168
    .line 169
    sget-object v10, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 170
    .line 171
    if-ne v9, v10, :cond_10

    .line 172
    .line 173
    add-int/lit8 v8, v8, 0x1

    .line 174
    .line 175
    if-nez v1, :cond_c

    .line 176
    .line 177
    iget v9, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e:I

    .line 178
    .line 179
    if-eqz v9, :cond_a

    .line 180
    .line 181
    return p4

    .line 182
    :cond_a
    iget v9, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h:I

    .line 183
    .line 184
    if-nez v9, :cond_b

    .line 185
    .line 186
    iget v9, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->i:I

    .line 187
    .line 188
    if-eqz v9, :cond_e

    .line 189
    .line 190
    :cond_b
    return p4

    .line 191
    :cond_c
    iget v9, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->f:I

    .line 192
    .line 193
    if-eqz v9, :cond_d

    .line 194
    .line 195
    return p4

    .line 196
    :cond_d
    iget v9, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->k:I

    .line 197
    .line 198
    if-nez v9, :cond_f

    .line 199
    .line 200
    iget v9, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l:I

    .line 201
    .line 202
    if-eqz v9, :cond_e

    .line 203
    .line 204
    goto :goto_9

    .line 205
    :cond_e
    iget v9, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 206
    .line 207
    cmpl-float v9, v9, p0

    .line 208
    .line 209
    if-eqz v9, :cond_10

    .line 210
    .line 211
    :cond_f
    :goto_9
    return p4

    .line 212
    :cond_10
    iget-object v9, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 213
    .line 214
    add-int/lit8 v10, p3, 0x1

    .line 215
    .line 216
    aget-object v9, v9, v10

    .line 217
    .line 218
    iget-object v9, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 219
    .line 220
    if-eqz v9, :cond_12

    .line 221
    .line 222
    iget-object v9, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 223
    .line 224
    iget-object v10, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 225
    .line 226
    aget-object v10, v10, p3

    .line 227
    .line 228
    iget-object v10, v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 229
    .line 230
    if-eqz v10, :cond_12

    .line 231
    .line 232
    iget-object v10, v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 233
    .line 234
    if-eq v10, v14, :cond_11

    .line 235
    .line 236
    goto :goto_a

    .line 237
    :cond_11
    move-object v10, v9

    .line 238
    goto :goto_b

    .line 239
    :cond_12
    :goto_a
    const/4 v10, 0x0

    .line 240
    :goto_b
    if-eqz v10, :cond_13

    .line 241
    .line 242
    move-object v14, v10

    .line 243
    goto :goto_c

    .line 244
    :cond_13
    const/4 v13, 0x1

    .line 245
    :goto_c
    const/4 v9, 0x1

    .line 246
    goto/16 :goto_6

    .line 247
    .line 248
    :cond_14
    iget-object v9, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 249
    .line 250
    aget-object v9, v9, p3

    .line 251
    .line 252
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 253
    .line 254
    .line 255
    move-result-object v9

    .line 256
    iget-object v13, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 257
    .line 258
    add-int/lit8 v19, p3, 0x1

    .line 259
    .line 260
    aget-object v13, v13, v19

    .line 261
    .line 262
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 263
    .line 264
    .line 265
    move-result-object v13

    .line 266
    iget-object v10, v9, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 267
    .line 268
    if-eqz v10, :cond_3b

    .line 269
    .line 270
    move/from16 v20, v2

    .line 271
    .line 272
    iget-object v2, v13, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 273
    .line 274
    if-nez v2, :cond_15

    .line 275
    .line 276
    goto/16 :goto_23

    .line 277
    .line 278
    :cond_15
    iget v10, v10, Ll/s3d0;->b:I

    .line 279
    .line 280
    move/from16 v21, v7

    .line 281
    .line 282
    const/4 v7, 0x1

    .line 283
    if-ne v10, v7, :cond_3b

    .line 284
    .line 285
    iget v2, v2, Ll/s3d0;->b:I

    .line 286
    .line 287
    if-eq v2, v7, :cond_16

    .line 288
    .line 289
    goto/16 :goto_23

    .line 290
    .line 291
    :cond_16
    if-lez v8, :cond_17

    .line 292
    .line 293
    if-eq v8, v15, :cond_17

    .line 294
    .line 295
    return p4

    .line 296
    :cond_17
    if-nez v21, :cond_19

    .line 297
    .line 298
    if-nez v11, :cond_19

    .line 299
    .line 300
    if-eqz v12, :cond_18

    .line 301
    .line 302
    goto :goto_d

    .line 303
    :cond_18
    move/from16 v2, p0

    .line 304
    .line 305
    goto :goto_f

    .line 306
    :cond_19
    :goto_d
    if-eqz v5, :cond_1a

    .line 307
    .line 308
    iget-object v2, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 309
    .line 310
    aget-object v2, v2, p3

    .line 311
    .line 312
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 313
    .line 314
    .line 315
    move-result v2

    .line 316
    int-to-float v2, v2

    .line 317
    goto :goto_e

    .line 318
    :cond_1a
    move/from16 v2, p0

    .line 319
    .line 320
    :goto_e
    if-eqz v6, :cond_1b

    .line 321
    .line 322
    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 323
    .line 324
    aget-object v6, v6, v19

    .line 325
    .line 326
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 327
    .line 328
    .line 329
    move-result v6

    .line 330
    int-to-float v6, v6

    .line 331
    add-float/2addr v2, v6

    .line 332
    :cond_1b
    :goto_f
    iget-object v6, v9, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 333
    .line 334
    iget v6, v6, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 335
    .line 336
    iget-object v7, v13, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 337
    .line 338
    iget v7, v7, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 339
    .line 340
    cmpg-float v10, v6, v7

    .line 341
    .line 342
    if-gez v10, :cond_1c

    .line 343
    .line 344
    sub-float/2addr v7, v6

    .line 345
    :goto_10
    sub-float v7, v7, v16

    .line 346
    .line 347
    goto :goto_11

    .line 348
    :cond_1c
    sub-float v7, v6, v7

    .line 349
    .line 350
    goto :goto_10

    .line 351
    :goto_11
    const-wide/16 v22, 0x1

    .line 352
    .line 353
    if-lez v8, :cond_25

    .line 354
    .line 355
    if-ne v8, v15, :cond_25

    .line 356
    .line 357
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 358
    .line 359
    .line 360
    move-result-object v2

    .line 361
    if-eqz v2, :cond_1d

    .line 362
    .line 363
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 364
    .line 365
    .line 366
    move-result-object v2

    .line 367
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 368
    .line 369
    aget-object v2, v2, v1

    .line 370
    .line 371
    sget-object v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 372
    .line 373
    if-ne v2, v5, :cond_1d

    .line 374
    .line 375
    return p4

    .line 376
    :cond_1d
    add-float v7, v7, v16

    .line 377
    .line 378
    sub-float v7, v7, v17

    .line 379
    .line 380
    :goto_12
    if-eqz v3, :cond_24

    .line 381
    .line 382
    sget-object v2, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 383
    .line 384
    if-eqz v2, :cond_1e

    .line 385
    .line 386
    iget-wide v10, v2, Ll/pa00;->B:J

    .line 387
    .line 388
    sub-long v10, v10, v22

    .line 389
    .line 390
    iput-wide v10, v2, Ll/pa00;->B:J

    .line 391
    .line 392
    iget-wide v10, v2, Ll/pa00;->s:J

    .line 393
    .line 394
    add-long v10, v10, v22

    .line 395
    .line 396
    iput-wide v10, v2, Ll/pa00;->s:J

    .line 397
    .line 398
    iget-wide v10, v2, Ll/pa00;->y:J

    .line 399
    .line 400
    add-long v10, v10, v22

    .line 401
    .line 402
    iput-wide v10, v2, Ll/pa00;->y:J

    .line 403
    .line 404
    :cond_1e
    iget-object v2, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 405
    .line 406
    aget-object v2, v2, v1

    .line 407
    .line 408
    if-nez v2, :cond_1f

    .line 409
    .line 410
    if-ne v3, v4, :cond_23

    .line 411
    .line 412
    :cond_1f
    int-to-float v5, v8

    .line 413
    div-float v5, v7, v5

    .line 414
    .line 415
    cmpl-float v10, v20, p0

    .line 416
    .line 417
    if-lez v10, :cond_21

    .line 418
    .line 419
    iget-object v5, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->p0:[F

    .line 420
    .line 421
    aget v5, v5, v1

    .line 422
    .line 423
    const/high16 v10, -0x40800000    # -1.0f

    .line 424
    .line 425
    cmpl-float v10, v5, v10

    .line 426
    .line 427
    if-nez v10, :cond_20

    .line 428
    .line 429
    move/from16 v5, p0

    .line 430
    .line 431
    goto :goto_13

    .line 432
    :cond_20
    mul-float/2addr v5, v7

    .line 433
    div-float v5, v5, v20

    .line 434
    .line 435
    :cond_21
    :goto_13
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    .line 436
    .line 437
    .line 438
    move-result v10

    .line 439
    const/16 v11, 0x8

    .line 440
    .line 441
    if-ne v10, v11, :cond_22

    .line 442
    .line 443
    move/from16 v5, p0

    .line 444
    .line 445
    :cond_22
    iget-object v10, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 446
    .line 447
    aget-object v10, v10, p3

    .line 448
    .line 449
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 450
    .line 451
    .line 452
    move-result v10

    .line 453
    int-to-float v10, v10

    .line 454
    add-float/2addr v6, v10

    .line 455
    iget-object v10, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 456
    .line 457
    aget-object v10, v10, p3

    .line 458
    .line 459
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 460
    .line 461
    .line 462
    move-result-object v10

    .line 463
    iget-object v11, v9, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 464
    .line 465
    invoke-virtual {v10, v11, v6}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 466
    .line 467
    .line 468
    iget-object v10, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 469
    .line 470
    aget-object v10, v10, v19

    .line 471
    .line 472
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 473
    .line 474
    .line 475
    move-result-object v10

    .line 476
    iget-object v11, v9, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 477
    .line 478
    add-float/2addr v6, v5

    .line 479
    invoke-virtual {v10, v11, v6}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 480
    .line 481
    .line 482
    iget-object v5, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 483
    .line 484
    aget-object v5, v5, p3

    .line 485
    .line 486
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 487
    .line 488
    .line 489
    move-result-object v5

    .line 490
    invoke-virtual {v5, v0}, Landroidx/constraintlayout/solver/widgets/i;->g(Landroidx/constraintlayout/solver/c;)V

    .line 491
    .line 492
    .line 493
    iget-object v5, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 494
    .line 495
    aget-object v5, v5, v19

    .line 496
    .line 497
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 498
    .line 499
    .line 500
    move-result-object v5

    .line 501
    invoke-virtual {v5, v0}, Landroidx/constraintlayout/solver/widgets/i;->g(Landroidx/constraintlayout/solver/c;)V

    .line 502
    .line 503
    .line 504
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 505
    .line 506
    aget-object v3, v3, v19

    .line 507
    .line 508
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 509
    .line 510
    .line 511
    move-result v3

    .line 512
    int-to-float v3, v3

    .line 513
    add-float/2addr v6, v3

    .line 514
    :cond_23
    move-object v3, v2

    .line 515
    goto/16 :goto_12

    .line 516
    .line 517
    :cond_24
    const/16 v18, 0x1

    .line 518
    .line 519
    return v18

    .line 520
    :cond_25
    cmpg-float v8, v7, p0

    .line 521
    .line 522
    if-gez v8, :cond_26

    .line 523
    .line 524
    move/from16 v10, p4

    .line 525
    .line 526
    move v12, v10

    .line 527
    const/16 v21, 0x1

    .line 528
    .line 529
    goto :goto_14

    .line 530
    :cond_26
    move v10, v11

    .line 531
    :goto_14
    if-eqz v21, :cond_2c

    .line 532
    .line 533
    sub-float/2addr v7, v2

    .line 534
    invoke-virtual {v3, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->k(I)F

    .line 535
    .line 536
    .line 537
    move-result v2

    .line 538
    mul-float/2addr v7, v2

    .line 539
    add-float/2addr v6, v7

    .line 540
    :goto_15
    if-eqz v3, :cond_2b

    .line 541
    .line 542
    sget-object v2, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 543
    .line 544
    if-eqz v2, :cond_27

    .line 545
    .line 546
    iget-wide v7, v2, Ll/pa00;->B:J

    .line 547
    .line 548
    sub-long v7, v7, v22

    .line 549
    .line 550
    iput-wide v7, v2, Ll/pa00;->B:J

    .line 551
    .line 552
    iget-wide v7, v2, Ll/pa00;->s:J

    .line 553
    .line 554
    add-long v7, v7, v22

    .line 555
    .line 556
    iput-wide v7, v2, Ll/pa00;->s:J

    .line 557
    .line 558
    iget-wide v7, v2, Ll/pa00;->y:J

    .line 559
    .line 560
    add-long v7, v7, v22

    .line 561
    .line 562
    iput-wide v7, v2, Ll/pa00;->y:J

    .line 563
    .line 564
    :cond_27
    iget-object v2, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 565
    .line 566
    aget-object v2, v2, v1

    .line 567
    .line 568
    if-nez v2, :cond_28

    .line 569
    .line 570
    if-ne v3, v4, :cond_2a

    .line 571
    .line 572
    :cond_28
    if-nez v1, :cond_29

    .line 573
    .line 574
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 575
    .line 576
    .line 577
    move-result v5

    .line 578
    :goto_16
    int-to-float v5, v5

    .line 579
    goto :goto_17

    .line 580
    :cond_29
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 581
    .line 582
    .line 583
    move-result v5

    .line 584
    goto :goto_16

    .line 585
    :goto_17
    iget-object v7, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 586
    .line 587
    aget-object v7, v7, p3

    .line 588
    .line 589
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 590
    .line 591
    .line 592
    move-result v7

    .line 593
    int-to-float v7, v7

    .line 594
    add-float/2addr v6, v7

    .line 595
    iget-object v7, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 596
    .line 597
    aget-object v7, v7, p3

    .line 598
    .line 599
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 600
    .line 601
    .line 602
    move-result-object v7

    .line 603
    iget-object v8, v9, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 604
    .line 605
    invoke-virtual {v7, v8, v6}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 606
    .line 607
    .line 608
    iget-object v7, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 609
    .line 610
    aget-object v7, v7, v19

    .line 611
    .line 612
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 613
    .line 614
    .line 615
    move-result-object v7

    .line 616
    iget-object v8, v9, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 617
    .line 618
    add-float/2addr v6, v5

    .line 619
    invoke-virtual {v7, v8, v6}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 620
    .line 621
    .line 622
    iget-object v5, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 623
    .line 624
    aget-object v5, v5, p3

    .line 625
    .line 626
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 627
    .line 628
    .line 629
    move-result-object v5

    .line 630
    invoke-virtual {v5, v0}, Landroidx/constraintlayout/solver/widgets/i;->g(Landroidx/constraintlayout/solver/c;)V

    .line 631
    .line 632
    .line 633
    iget-object v5, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 634
    .line 635
    aget-object v5, v5, v19

    .line 636
    .line 637
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 638
    .line 639
    .line 640
    move-result-object v5

    .line 641
    invoke-virtual {v5, v0}, Landroidx/constraintlayout/solver/widgets/i;->g(Landroidx/constraintlayout/solver/c;)V

    .line 642
    .line 643
    .line 644
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 645
    .line 646
    aget-object v3, v3, v19

    .line 647
    .line 648
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 649
    .line 650
    .line 651
    move-result v3

    .line 652
    int-to-float v3, v3

    .line 653
    add-float/2addr v6, v3

    .line 654
    :cond_2a
    move-object v3, v2

    .line 655
    goto :goto_15

    .line 656
    :cond_2b
    const/16 v18, 0x1

    .line 657
    .line 658
    goto/16 :goto_22

    .line 659
    .line 660
    :cond_2c
    if-nez v10, :cond_2d

    .line 661
    .line 662
    if-eqz v12, :cond_2b

    .line 663
    .line 664
    :cond_2d
    if-eqz v10, :cond_2e

    .line 665
    .line 666
    :goto_18
    sub-float/2addr v7, v2

    .line 667
    goto :goto_19

    .line 668
    :cond_2e
    if-eqz v12, :cond_2f

    .line 669
    .line 670
    goto :goto_18

    .line 671
    :cond_2f
    :goto_19
    add-int/lit8 v2, v15, 0x1

    .line 672
    .line 673
    int-to-float v2, v2

    .line 674
    div-float v2, v7, v2

    .line 675
    .line 676
    if-eqz v12, :cond_31

    .line 677
    .line 678
    const/4 v8, 0x1

    .line 679
    if-le v15, v8, :cond_30

    .line 680
    .line 681
    add-int/lit8 v2, v15, -0x1

    .line 682
    .line 683
    int-to-float v2, v2

    .line 684
    :goto_1a
    div-float v2, v7, v2

    .line 685
    .line 686
    goto :goto_1b

    .line 687
    :cond_30
    const/high16 v2, 0x40000000    # 2.0f

    .line 688
    .line 689
    goto :goto_1a

    .line 690
    :cond_31
    :goto_1b
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    .line 691
    .line 692
    .line 693
    move-result v7

    .line 694
    const/16 v11, 0x8

    .line 695
    .line 696
    if-eq v7, v11, :cond_32

    .line 697
    .line 698
    add-float v7, v6, v2

    .line 699
    .line 700
    goto :goto_1c

    .line 701
    :cond_32
    move v7, v6

    .line 702
    :goto_1c
    if-eqz v12, :cond_33

    .line 703
    .line 704
    const/4 v8, 0x1

    .line 705
    if-le v15, v8, :cond_33

    .line 706
    .line 707
    iget-object v7, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 708
    .line 709
    aget-object v7, v7, p3

    .line 710
    .line 711
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 712
    .line 713
    .line 714
    move-result v7

    .line 715
    int-to-float v7, v7

    .line 716
    add-float/2addr v7, v6

    .line 717
    :cond_33
    if-eqz v10, :cond_34

    .line 718
    .line 719
    if-eqz v5, :cond_34

    .line 720
    .line 721
    iget-object v6, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 722
    .line 723
    aget-object v6, v6, p3

    .line 724
    .line 725
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 726
    .line 727
    .line 728
    move-result v6

    .line 729
    int-to-float v6, v6

    .line 730
    add-float/2addr v7, v6

    .line 731
    :cond_34
    :goto_1d
    if-eqz v3, :cond_2b

    .line 732
    .line 733
    sget-object v6, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 734
    .line 735
    if-eqz v6, :cond_35

    .line 736
    .line 737
    iget-wide v10, v6, Ll/pa00;->B:J

    .line 738
    .line 739
    sub-long v10, v10, v22

    .line 740
    .line 741
    iput-wide v10, v6, Ll/pa00;->B:J

    .line 742
    .line 743
    iget-wide v10, v6, Ll/pa00;->s:J

    .line 744
    .line 745
    add-long v10, v10, v22

    .line 746
    .line 747
    iput-wide v10, v6, Ll/pa00;->s:J

    .line 748
    .line 749
    iget-wide v10, v6, Ll/pa00;->y:J

    .line 750
    .line 751
    add-long v10, v10, v22

    .line 752
    .line 753
    iput-wide v10, v6, Ll/pa00;->y:J

    .line 754
    .line 755
    :cond_35
    iget-object v6, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 756
    .line 757
    aget-object v6, v6, v1

    .line 758
    .line 759
    if-nez v6, :cond_37

    .line 760
    .line 761
    if-ne v3, v4, :cond_36

    .line 762
    .line 763
    goto :goto_1e

    .line 764
    :cond_36
    const/16 v11, 0x8

    .line 765
    .line 766
    goto :goto_21

    .line 767
    :cond_37
    :goto_1e
    if-nez v1, :cond_38

    .line 768
    .line 769
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 770
    .line 771
    .line 772
    move-result v8

    .line 773
    :goto_1f
    int-to-float v8, v8

    .line 774
    goto :goto_20

    .line 775
    :cond_38
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 776
    .line 777
    .line 778
    move-result v8

    .line 779
    goto :goto_1f

    .line 780
    :goto_20
    if-eq v3, v5, :cond_39

    .line 781
    .line 782
    iget-object v10, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 783
    .line 784
    aget-object v10, v10, p3

    .line 785
    .line 786
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 787
    .line 788
    .line 789
    move-result v10

    .line 790
    int-to-float v10, v10

    .line 791
    add-float/2addr v7, v10

    .line 792
    :cond_39
    iget-object v10, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 793
    .line 794
    aget-object v10, v10, p3

    .line 795
    .line 796
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 797
    .line 798
    .line 799
    move-result-object v10

    .line 800
    iget-object v11, v9, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 801
    .line 802
    invoke-virtual {v10, v11, v7}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 803
    .line 804
    .line 805
    iget-object v10, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 806
    .line 807
    aget-object v10, v10, v19

    .line 808
    .line 809
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 810
    .line 811
    .line 812
    move-result-object v10

    .line 813
    iget-object v11, v9, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 814
    .line 815
    add-float v12, v7, v8

    .line 816
    .line 817
    invoke-virtual {v10, v11, v12}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 818
    .line 819
    .line 820
    iget-object v10, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 821
    .line 822
    aget-object v10, v10, p3

    .line 823
    .line 824
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 825
    .line 826
    .line 827
    move-result-object v10

    .line 828
    invoke-virtual {v10, v0}, Landroidx/constraintlayout/solver/widgets/i;->g(Landroidx/constraintlayout/solver/c;)V

    .line 829
    .line 830
    .line 831
    iget-object v10, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 832
    .line 833
    aget-object v10, v10, v19

    .line 834
    .line 835
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 836
    .line 837
    .line 838
    move-result-object v10

    .line 839
    invoke-virtual {v10, v0}, Landroidx/constraintlayout/solver/widgets/i;->g(Landroidx/constraintlayout/solver/c;)V

    .line 840
    .line 841
    .line 842
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 843
    .line 844
    aget-object v3, v3, v19

    .line 845
    .line 846
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 847
    .line 848
    .line 849
    move-result v3

    .line 850
    int-to-float v3, v3

    .line 851
    add-float/2addr v8, v3

    .line 852
    add-float/2addr v7, v8

    .line 853
    if-eqz v6, :cond_36

    .line 854
    .line 855
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    .line 856
    .line 857
    .line 858
    move-result v3

    .line 859
    const/16 v11, 0x8

    .line 860
    .line 861
    if-eq v3, v11, :cond_3a

    .line 862
    .line 863
    add-float/2addr v7, v2

    .line 864
    :cond_3a
    :goto_21
    move-object v3, v6

    .line 865
    goto/16 :goto_1d

    .line 866
    .line 867
    :goto_22
    return v18

    .line 868
    :cond_3b
    :goto_23
    return p4
.end method

.method public static c(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/c;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    sget-object v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 7
    .line 8
    const/4 v3, 0x2

    .line 9
    if-eq v0, v2, :cond_0

    .line 10
    .line 11
    iget-object v0, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 12
    .line 13
    aget-object v0, v0, v1

    .line 14
    .line 15
    sget-object v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_PARENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 16
    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    iget-object v0, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 20
    .line 21
    iget v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->e:I

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iget-object v4, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 28
    .line 29
    iget v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->e:I

    .line 30
    .line 31
    sub-int/2addr v1, v4

    .line 32
    iget-object v4, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 33
    .line 34
    invoke-virtual {p1, v4}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    iput-object v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 39
    .line 40
    iget-object v4, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 41
    .line 42
    invoke-virtual {p1, v4}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    iput-object v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 47
    .line 48
    iget-object v4, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 49
    .line 50
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 51
    .line 52
    invoke-virtual {p1, v4, v0}, Landroidx/constraintlayout/solver/c;->f(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 53
    .line 54
    .line 55
    iget-object v4, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->w:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 56
    .line 57
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 58
    .line 59
    invoke-virtual {p1, v4, v1}, Landroidx/constraintlayout/solver/c;->f(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 60
    .line 61
    .line 62
    iput v3, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->a:I

    .line 63
    .line 64
    invoke-virtual {p2, v0, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->f0(II)V

    .line 65
    .line 66
    .line 67
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 68
    .line 69
    const/4 v1, 0x1

    .line 70
    aget-object v0, v0, v1

    .line 71
    .line 72
    if-eq v0, v2, :cond_3

    .line 73
    .line 74
    iget-object v0, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 75
    .line 76
    aget-object v0, v0, v1

    .line 77
    .line 78
    sget-object v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_PARENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 79
    .line 80
    if-ne v0, v1, :cond_3

    .line 81
    .line 82
    iget-object v0, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 83
    .line 84
    iget v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->e:I

    .line 85
    .line 86
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    iget-object v1, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 91
    .line 92
    iget v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->e:I

    .line 93
    .line 94
    sub-int/2addr p0, v1

    .line 95
    iget-object v1, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 96
    .line 97
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    iput-object v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 102
    .line 103
    iget-object v1, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 104
    .line 105
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    iput-object v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 110
    .line 111
    iget-object v1, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->v:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 112
    .line 113
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 114
    .line 115
    invoke-virtual {p1, v1, v0}, Landroidx/constraintlayout/solver/c;->f(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 116
    .line 117
    .line 118
    iget-object v1, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->x:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 119
    .line 120
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 121
    .line 122
    invoke-virtual {p1, v1, p0}, Landroidx/constraintlayout/solver/c;->f(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 123
    .line 124
    .line 125
    iget v1, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 126
    .line 127
    if-gtz v1, :cond_1

    .line 128
    .line 129
    invoke-virtual {p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    const/16 v2, 0x8

    .line 134
    .line 135
    if-ne v1, v2, :cond_2

    .line 136
    .line 137
    :cond_1
    iget-object v1, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 138
    .line 139
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    iput-object v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 144
    .line 145
    iget-object v1, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 146
    .line 147
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->j:Landroidx/constraintlayout/solver/SolverVariable;

    .line 148
    .line 149
    iget v2, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U:I

    .line 150
    .line 151
    add-int/2addr v2, v0

    .line 152
    invoke-virtual {p1, v1, v2}, Landroidx/constraintlayout/solver/c;->f(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 153
    .line 154
    .line 155
    :cond_2
    iput v3, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b:I

    .line 156
    .line 157
    invoke-virtual {p2, v0, p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->t0(II)V

    .line 158
    .line 159
    .line 160
    :cond_3
    return-void
.end method

.method public static d(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)Z
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 2
    .line 3
    aget-object v1, v0, p1

    .line 4
    .line 5
    sget-object v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-eq v1, v2, :cond_0

    .line 9
    .line 10
    return v3

    .line 11
    :cond_0
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->I:F

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    cmpl-float v1, v1, v2

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move v2, v3

    .line 23
    :goto_0
    aget-object p0, v0, v2

    .line 24
    .line 25
    return v3

    .line 26
    :cond_2
    if-nez p1, :cond_5

    .line 27
    .line 28
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->e:I

    .line 29
    .line 30
    if-eqz p1, :cond_3

    .line 31
    .line 32
    return v3

    .line 33
    :cond_3
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h:I

    .line 34
    .line 35
    if-nez p1, :cond_4

    .line 36
    .line 37
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->i:I

    .line 38
    .line 39
    if-eqz p0, :cond_7

    .line 40
    .line 41
    :cond_4
    return v3

    .line 42
    :cond_5
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->f:I

    .line 43
    .line 44
    if-eqz p1, :cond_6

    .line 45
    .line 46
    return v3

    .line 47
    :cond_6
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->k:I

    .line 48
    .line 49
    if-nez p1, :cond_8

    .line 50
    .line 51
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->l:I

    .line 52
    .line 53
    if-eqz p0, :cond_7

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_7
    return v2

    .line 57
    :cond_8
    :goto_1
    return v3
.end method

.method public static e(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;II)V
    .locals 4

    .line 1
    mul-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 6
    .line 7
    aget-object v2, v2, v0

    .line 8
    .line 9
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 18
    .line 19
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    iput-object v3, v2, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 24
    .line 25
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 26
    .line 27
    aget-object v2, v2, v0

    .line 28
    .line 29
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    int-to-float p2, p2

    .line 34
    iput p2, v2, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 35
    .line 36
    iget-object p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 37
    .line 38
    aget-object p2, p2, v0

    .line 39
    .line 40
    invoke-virtual {p2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    const/4 v2, 0x1

    .line 45
    iput v2, p2, Ll/s3d0;->b:I

    .line 46
    .line 47
    iget-object p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 48
    .line 49
    aget-object p2, p2, v1

    .line 50
    .line 51
    invoke-virtual {p2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 56
    .line 57
    aget-object v0, v3, v0

    .line 58
    .line 59
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p2, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 64
    .line 65
    iget-object p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 66
    .line 67
    aget-object p2, p2, v1

    .line 68
    .line 69
    invoke-virtual {p2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->t(I)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    int-to-float p1, p1

    .line 78
    iput p1, p2, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 79
    .line 80
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 81
    .line 82
    aget-object p0, p0, v1

    .line 83
    .line 84
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    iput v2, p0, Ll/s3d0;->b:I

    .line 89
    .line 90
    return-void
.end method
