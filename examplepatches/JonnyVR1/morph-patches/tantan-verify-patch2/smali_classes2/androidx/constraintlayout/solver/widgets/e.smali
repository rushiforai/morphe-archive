.class public Landroidx/constraintlayout/solver/widgets/e;
.super Ll/jfq0;
.source "SourceFile"


# instance fields
.field public A0:I

.field public B0:I

.field public C0:I

.field public D0:I

.field public E0:I

.field public F0:[Landroidx/constraintlayout/solver/widgets/d;

.field public G0:[Landroidx/constraintlayout/solver/widgets/d;

.field public H0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/constraintlayout/solver/widgets/f;",
            ">;"
        }
    .end annotation
.end field

.field public I0:Z

.field public J0:Z

.field public K0:Z

.field public L0:I

.field public M0:I

.field public N0:I

.field public O0:Z

.field public P0:Z

.field public Q0:Z

.field public R0:I

.field public w0:Z

.field public x0:Landroidx/constraintlayout/solver/c;

.field public y0:Landroidx/constraintlayout/solver/widgets/j;

.field public z0:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/jfq0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/e;->w0:Z

    .line 6
    .line 7
    new-instance v1, Landroidx/constraintlayout/solver/c;

    .line 8
    .line 9
    invoke-direct {v1}, Landroidx/constraintlayout/solver/c;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Landroidx/constraintlayout/solver/widgets/e;->x0:Landroidx/constraintlayout/solver/c;

    .line 13
    .line 14
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/e;->D0:I

    .line 15
    .line 16
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/e;->E0:I

    .line 17
    .line 18
    const/4 v1, 0x4

    .line 19
    new-array v2, v1, [Landroidx/constraintlayout/solver/widgets/d;

    .line 20
    .line 21
    iput-object v2, p0, Landroidx/constraintlayout/solver/widgets/e;->F0:[Landroidx/constraintlayout/solver/widgets/d;

    .line 22
    .line 23
    new-array v1, v1, [Landroidx/constraintlayout/solver/widgets/d;

    .line 24
    .line 25
    iput-object v1, p0, Landroidx/constraintlayout/solver/widgets/e;->G0:[Landroidx/constraintlayout/solver/widgets/d;

    .line 26
    .line 27
    new-instance v1, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 33
    .line 34
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/e;->I0:Z

    .line 35
    .line 36
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/e;->J0:Z

    .line 37
    .line 38
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/e;->K0:Z

    .line 39
    .line 40
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/e;->L0:I

    .line 41
    .line 42
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/e;->M0:I

    .line 43
    .line 44
    const/4 v1, 0x7

    .line 45
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/e;->N0:I

    .line 46
    .line 47
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/e;->O0:Z

    .line 48
    .line 49
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/e;->P0:Z

    .line 50
    .line 51
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/e;->Q0:Z

    .line 52
    .line 53
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/e;->R0:I

    .line 54
    .line 55
    return-void
.end method


# virtual methods
.method public K0()V
    .locals 22

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K:I

    .line 4
    .line 5
    iget v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->L:I

    .line 6
    .line 7
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v4, 0x0

    .line 12
    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    .line 13
    .line 14
    .line 15
    move-result v5

    .line 16
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    .line 21
    .line 22
    .line 23
    move-result v6

    .line 24
    iput-boolean v4, v1, Landroidx/constraintlayout/solver/widgets/e;->P0:Z

    .line 25
    .line 26
    iput-boolean v4, v1, Landroidx/constraintlayout/solver/widgets/e;->Q0:Z

    .line 27
    .line 28
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->y0:Landroidx/constraintlayout/solver/widgets/j;

    .line 33
    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    new-instance v0, Landroidx/constraintlayout/solver/widgets/j;

    .line 37
    .line 38
    invoke-direct {v0, v1}, Landroidx/constraintlayout/solver/widgets/j;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->y0:Landroidx/constraintlayout/solver/widgets/j;

    .line 42
    .line 43
    :cond_0
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->y0:Landroidx/constraintlayout/solver/widgets/j;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroidx/constraintlayout/solver/widgets/j;->b(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    .line 46
    .line 47
    .line 48
    iget v0, v1, Landroidx/constraintlayout/solver/widgets/e;->z0:I

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->C0(I)V

    .line 51
    .line 52
    .line 53
    iget v0, v1, Landroidx/constraintlayout/solver/widgets/e;->A0:I

    .line 54
    .line 55
    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D0(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->R()V

    .line 59
    .line 60
    .line 61
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->x0:Landroidx/constraintlayout/solver/c;

    .line 62
    .line 63
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/c;->x()Ll/wx3;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v1, v0}, Ll/jfq0;->T(Ll/wx3;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    iput v4, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K:I

    .line 72
    .line 73
    iput v4, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->L:I

    .line 74
    .line 75
    :goto_0
    iget v0, v1, Landroidx/constraintlayout/solver/widgets/e;->N0:I

    .line 76
    .line 77
    const/16 v7, 0x20

    .line 78
    .line 79
    const/16 v8, 0x8

    .line 80
    .line 81
    const/4 v9, 0x1

    .line 82
    if-eqz v0, :cond_4

    .line 83
    .line 84
    invoke-virtual {v1, v8}, Landroidx/constraintlayout/solver/widgets/e;->Y0(I)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_2

    .line 89
    .line 90
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/e;->a1()V

    .line 91
    .line 92
    .line 93
    :cond_2
    invoke-virtual {v1, v7}, Landroidx/constraintlayout/solver/widgets/e;->Y0(I)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_3

    .line 98
    .line 99
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/e;->X0()V

    .line 100
    .line 101
    .line 102
    :cond_3
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->x0:Landroidx/constraintlayout/solver/c;

    .line 103
    .line 104
    iput-boolean v9, v0, Landroidx/constraintlayout/solver/c;->g:Z

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_4
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->x0:Landroidx/constraintlayout/solver/c;

    .line 108
    .line 109
    iput-boolean v4, v0, Landroidx/constraintlayout/solver/c;->g:Z

    .line 110
    .line 111
    :goto_1
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 112
    .line 113
    aget-object v10, v0, v9

    .line 114
    .line 115
    aget-object v11, v0, v4

    .line 116
    .line 117
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/e;->c1()V

    .line 118
    .line 119
    .line 120
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_5

    .line 127
    .line 128
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 129
    .line 130
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 131
    .line 132
    .line 133
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 134
    .line 135
    new-instance v12, Landroidx/constraintlayout/solver/widgets/f;

    .line 136
    .line 137
    iget-object v13, v1, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 138
    .line 139
    invoke-direct {v12, v13}, Landroidx/constraintlayout/solver/widgets/f;-><init>(Ljava/util/List;)V

    .line 140
    .line 141
    .line 142
    invoke-interface {v0, v4, v12}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    :cond_5
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 146
    .line 147
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 148
    .line 149
    .line 150
    move-result v12

    .line 151
    iget-object v13, v1, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 152
    .line 153
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    sget-object v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 158
    .line 159
    if-eq v0, v14, :cond_7

    .line 160
    .line 161
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    if-ne v0, v14, :cond_6

    .line 166
    .line 167
    goto :goto_2

    .line 168
    :cond_6
    move v14, v4

    .line 169
    goto :goto_3

    .line 170
    :cond_7
    :goto_2
    move v14, v9

    .line 171
    :goto_3
    move v0, v4

    .line 172
    move v15, v0

    .line 173
    :goto_4
    move/from16 v16, v4

    .line 174
    .line 175
    if-ge v15, v12, :cond_1d

    .line 176
    .line 177
    iget-boolean v4, v1, Landroidx/constraintlayout/solver/widgets/e;->O0:Z

    .line 178
    .line 179
    if-nez v4, :cond_1d

    .line 180
    .line 181
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 182
    .line 183
    invoke-interface {v4, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v4

    .line 187
    check-cast v4, Landroidx/constraintlayout/solver/widgets/f;

    .line 188
    .line 189
    iget-boolean v4, v4, Landroidx/constraintlayout/solver/widgets/f;->d:Z

    .line 190
    .line 191
    if-eqz v4, :cond_8

    .line 192
    .line 193
    move/from16 v20, v12

    .line 194
    .line 195
    goto/16 :goto_12

    .line 196
    .line 197
    :cond_8
    invoke-virtual {v1, v7}, Landroidx/constraintlayout/solver/widgets/e;->Y0(I)Z

    .line 198
    .line 199
    .line 200
    move-result v4

    .line 201
    if-eqz v4, :cond_a

    .line 202
    .line 203
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->s()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 204
    .line 205
    .line 206
    move-result-object v4

    .line 207
    sget-object v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 208
    .line 209
    if-ne v4, v7, :cond_9

    .line 210
    .line 211
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->B()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 212
    .line 213
    .line 214
    move-result-object v4

    .line 215
    if-ne v4, v7, :cond_9

    .line 216
    .line 217
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 218
    .line 219
    invoke-interface {v4, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object v4

    .line 223
    check-cast v4, Landroidx/constraintlayout/solver/widgets/f;

    .line 224
    .line 225
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/f;->d()Ljava/util/List;

    .line 226
    .line 227
    .line 228
    move-result-object v4

    .line 229
    check-cast v4, Ljava/util/ArrayList;

    .line 230
    .line 231
    iput-object v4, v1, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 232
    .line 233
    goto :goto_5

    .line 234
    :cond_9
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 235
    .line 236
    invoke-interface {v4, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v4

    .line 240
    check-cast v4, Landroidx/constraintlayout/solver/widgets/f;

    .line 241
    .line 242
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/f;->a:Ljava/util/List;

    .line 243
    .line 244
    check-cast v4, Ljava/util/ArrayList;

    .line 245
    .line 246
    iput-object v4, v1, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 247
    .line 248
    :cond_a
    :goto_5
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/e;->c1()V

    .line 249
    .line 250
    .line 251
    iget-object v4, v1, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 252
    .line 253
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 254
    .line 255
    .line 256
    move-result v4

    .line 257
    move/from16 v7, v16

    .line 258
    .line 259
    :goto_6
    if-ge v7, v4, :cond_c

    .line 260
    .line 261
    move/from16 v17, v9

    .line 262
    .line 263
    iget-object v9, v1, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 264
    .line 265
    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v9

    .line 269
    check-cast v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 270
    .line 271
    instance-of v8, v9, Ll/jfq0;

    .line 272
    .line 273
    if-eqz v8, :cond_b

    .line 274
    .line 275
    check-cast v9, Ll/jfq0;

    .line 276
    .line 277
    invoke-virtual {v9}, Ll/jfq0;->K0()V

    .line 278
    .line 279
    .line 280
    :cond_b
    add-int/lit8 v7, v7, 0x1

    .line 281
    .line 282
    move/from16 v9, v17

    .line 283
    .line 284
    const/16 v8, 0x8

    .line 285
    .line 286
    goto :goto_6

    .line 287
    :cond_c
    move/from16 v17, v9

    .line 288
    .line 289
    move v7, v0

    .line 290
    move/from16 v0, v16

    .line 291
    .line 292
    move/from16 v8, v17

    .line 293
    .line 294
    :goto_7
    if-eqz v8, :cond_1c

    .line 295
    .line 296
    add-int/lit8 v9, v0, 0x1

    .line 297
    .line 298
    :try_start_0
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->x0:Landroidx/constraintlayout/solver/c;

    .line 299
    .line 300
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/c;->F()V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/e;->c1()V

    .line 304
    .line 305
    .line 306
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->x0:Landroidx/constraintlayout/solver/c;

    .line 307
    .line 308
    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->g(Landroidx/constraintlayout/solver/c;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 309
    .line 310
    .line 311
    move/from16 v0, v16

    .line 312
    .line 313
    :goto_8
    if-ge v0, v4, :cond_d

    .line 314
    .line 315
    move/from16 v18, v7

    .line 316
    .line 317
    :try_start_1
    iget-object v7, v1, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 318
    .line 319
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object v7

    .line 323
    check-cast v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 324
    .line 325
    move/from16 v19, v0

    .line 326
    .line 327
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->x0:Landroidx/constraintlayout/solver/c;

    .line 328
    .line 329
    invoke-virtual {v7, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->g(Landroidx/constraintlayout/solver/c;)V

    .line 330
    .line 331
    .line 332
    add-int/lit8 v0, v19, 0x1

    .line 333
    .line 334
    move/from16 v7, v18

    .line 335
    .line 336
    goto :goto_8

    .line 337
    :catch_0
    move-exception v0

    .line 338
    goto :goto_9

    .line 339
    :cond_d
    move/from16 v18, v7

    .line 340
    .line 341
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->x0:Landroidx/constraintlayout/solver/c;

    .line 342
    .line 343
    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/widgets/e;->O0(Landroidx/constraintlayout/solver/c;)Z

    .line 344
    .line 345
    .line 346
    move-result v8

    .line 347
    if-eqz v8, :cond_e

    .line 348
    .line 349
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->x0:Landroidx/constraintlayout/solver/c;

    .line 350
    .line 351
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/c;->B()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 352
    .line 353
    .line 354
    :cond_e
    move/from16 v20, v12

    .line 355
    .line 356
    goto :goto_a

    .line 357
    :catch_1
    move-exception v0

    .line 358
    move/from16 v18, v7

    .line 359
    .line 360
    :goto_9
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 361
    .line 362
    .line 363
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 364
    .line 365
    move/from16 v19, v8

    .line 366
    .line 367
    new-instance v8, Ljava/lang/StringBuilder;

    .line 368
    .line 369
    move/from16 v20, v12

    .line 370
    .line 371
    const-string v12, "EXCEPTION : "

    .line 372
    .line 373
    invoke-direct {v8, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 377
    .line 378
    .line 379
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v0

    .line 383
    invoke-virtual {v7, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    move/from16 v8, v19

    .line 387
    .line 388
    :goto_a
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->x0:Landroidx/constraintlayout/solver/c;

    .line 389
    .line 390
    if-eqz v8, :cond_10

    .line 391
    .line 392
    sget-object v8, Landroidx/constraintlayout/solver/widgets/h;->a:[Z

    .line 393
    .line 394
    invoke-virtual {v1, v0, v8}, Landroidx/constraintlayout/solver/widgets/e;->g1(Landroidx/constraintlayout/solver/c;[Z)V

    .line 395
    .line 396
    .line 397
    :cond_f
    const/16 v19, 0x2

    .line 398
    .line 399
    goto :goto_c

    .line 400
    :cond_10
    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G0(Landroidx/constraintlayout/solver/c;)V

    .line 401
    .line 402
    .line 403
    move/from16 v0, v16

    .line 404
    .line 405
    :goto_b
    if-ge v0, v4, :cond_f

    .line 406
    .line 407
    iget-object v8, v1, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 408
    .line 409
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    move-result-object v8

    .line 413
    check-cast v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 414
    .line 415
    iget-object v12, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 416
    .line 417
    aget-object v12, v12, v16

    .line 418
    .line 419
    const/16 v19, 0x2

    .line 420
    .line 421
    sget-object v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 422
    .line 423
    if-ne v12, v7, :cond_11

    .line 424
    .line 425
    invoke-virtual {v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 426
    .line 427
    .line 428
    move-result v12

    .line 429
    move/from16 v21, v0

    .line 430
    .line 431
    invoke-virtual {v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F()I

    .line 432
    .line 433
    .line 434
    move-result v0

    .line 435
    if-ge v12, v0, :cond_12

    .line 436
    .line 437
    sget-object v0, Landroidx/constraintlayout/solver/widgets/h;->a:[Z

    .line 438
    .line 439
    aput-boolean v17, v0, v19

    .line 440
    .line 441
    goto :goto_c

    .line 442
    :cond_11
    move/from16 v21, v0

    .line 443
    .line 444
    :cond_12
    iget-object v0, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 445
    .line 446
    aget-object v0, v0, v17

    .line 447
    .line 448
    if-ne v0, v7, :cond_13

    .line 449
    .line 450
    invoke-virtual {v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 451
    .line 452
    .line 453
    move-result v0

    .line 454
    invoke-virtual {v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E()I

    .line 455
    .line 456
    .line 457
    move-result v7

    .line 458
    if-ge v0, v7, :cond_13

    .line 459
    .line 460
    sget-object v0, Landroidx/constraintlayout/solver/widgets/h;->a:[Z

    .line 461
    .line 462
    aput-boolean v17, v0, v19

    .line 463
    .line 464
    goto :goto_c

    .line 465
    :cond_13
    add-int/lit8 v0, v21, 0x1

    .line 466
    .line 467
    goto :goto_b

    .line 468
    :goto_c
    if-eqz v14, :cond_16

    .line 469
    .line 470
    const/16 v7, 0x8

    .line 471
    .line 472
    if-ge v9, v7, :cond_16

    .line 473
    .line 474
    sget-object v0, Landroidx/constraintlayout/solver/widgets/h;->a:[Z

    .line 475
    .line 476
    aget-boolean v0, v0, v19

    .line 477
    .line 478
    if-eqz v0, :cond_16

    .line 479
    .line 480
    move/from16 v0, v16

    .line 481
    .line 482
    move v8, v0

    .line 483
    move v12, v8

    .line 484
    :goto_d
    if-ge v0, v4, :cond_14

    .line 485
    .line 486
    iget-object v7, v1, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 487
    .line 488
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 489
    .line 490
    .line 491
    move-result-object v7

    .line 492
    check-cast v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 493
    .line 494
    move/from16 v19, v0

    .line 495
    .line 496
    iget v0, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K:I

    .line 497
    .line 498
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 499
    .line 500
    .line 501
    move-result v21

    .line 502
    add-int v0, v0, v21

    .line 503
    .line 504
    invoke-static {v8, v0}, Ljava/lang/Math;->max(II)I

    .line 505
    .line 506
    .line 507
    move-result v8

    .line 508
    iget v0, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->L:I

    .line 509
    .line 510
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 511
    .line 512
    .line 513
    move-result v7

    .line 514
    add-int/2addr v0, v7

    .line 515
    invoke-static {v12, v0}, Ljava/lang/Math;->max(II)I

    .line 516
    .line 517
    .line 518
    move-result v12

    .line 519
    add-int/lit8 v0, v19, 0x1

    .line 520
    .line 521
    const/16 v7, 0x8

    .line 522
    .line 523
    goto :goto_d

    .line 524
    :cond_14
    iget v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->V:I

    .line 525
    .line 526
    invoke-static {v0, v8}, Ljava/lang/Math;->max(II)I

    .line 527
    .line 528
    .line 529
    move-result v0

    .line 530
    iget v7, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->W:I

    .line 531
    .line 532
    invoke-static {v7, v12}, Ljava/lang/Math;->max(II)I

    .line 533
    .line 534
    .line 535
    move-result v7

    .line 536
    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 537
    .line 538
    if-ne v11, v8, :cond_15

    .line 539
    .line 540
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 541
    .line 542
    .line 543
    move-result v12

    .line 544
    if-ge v12, v0, :cond_15

    .line 545
    .line 546
    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 547
    .line 548
    .line 549
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 550
    .line 551
    aput-object v8, v0, v16

    .line 552
    .line 553
    move/from16 v0, v17

    .line 554
    .line 555
    move/from16 v18, v0

    .line 556
    .line 557
    goto :goto_e

    .line 558
    :cond_15
    move/from16 v0, v16

    .line 559
    .line 560
    :goto_e
    if-ne v10, v8, :cond_17

    .line 561
    .line 562
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 563
    .line 564
    .line 565
    move-result v12

    .line 566
    if-ge v12, v7, :cond_17

    .line 567
    .line 568
    invoke-virtual {v1, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 569
    .line 570
    .line 571
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 572
    .line 573
    aput-object v8, v0, v17

    .line 574
    .line 575
    move/from16 v0, v17

    .line 576
    .line 577
    move/from16 v18, v0

    .line 578
    .line 579
    goto :goto_f

    .line 580
    :cond_16
    move/from16 v0, v16

    .line 581
    .line 582
    :cond_17
    :goto_f
    iget v7, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->V:I

    .line 583
    .line 584
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 585
    .line 586
    .line 587
    move-result v8

    .line 588
    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    .line 589
    .line 590
    .line 591
    move-result v7

    .line 592
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 593
    .line 594
    .line 595
    move-result v8

    .line 596
    if-le v7, v8, :cond_18

    .line 597
    .line 598
    invoke-virtual {v1, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 599
    .line 600
    .line 601
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 602
    .line 603
    sget-object v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 604
    .line 605
    aput-object v7, v0, v16

    .line 606
    .line 607
    move/from16 v0, v17

    .line 608
    .line 609
    move/from16 v18, v0

    .line 610
    .line 611
    :cond_18
    iget v7, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->W:I

    .line 612
    .line 613
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 614
    .line 615
    .line 616
    move-result v8

    .line 617
    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    .line 618
    .line 619
    .line 620
    move-result v7

    .line 621
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 622
    .line 623
    .line 624
    move-result v8

    .line 625
    if-le v7, v8, :cond_19

    .line 626
    .line 627
    invoke-virtual {v1, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 628
    .line 629
    .line 630
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 631
    .line 632
    sget-object v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 633
    .line 634
    aput-object v7, v0, v17

    .line 635
    .line 636
    move/from16 v0, v17

    .line 637
    .line 638
    move/from16 v18, v0

    .line 639
    .line 640
    :cond_19
    if-nez v18, :cond_1b

    .line 641
    .line 642
    iget-object v7, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 643
    .line 644
    aget-object v7, v7, v16

    .line 645
    .line 646
    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 647
    .line 648
    if-ne v7, v8, :cond_1a

    .line 649
    .line 650
    if-lez v5, :cond_1a

    .line 651
    .line 652
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 653
    .line 654
    .line 655
    move-result v7

    .line 656
    if-le v7, v5, :cond_1a

    .line 657
    .line 658
    move/from16 v7, v17

    .line 659
    .line 660
    iput-boolean v7, v1, Landroidx/constraintlayout/solver/widgets/e;->P0:Z

    .line 661
    .line 662
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 663
    .line 664
    sget-object v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 665
    .line 666
    aput-object v12, v0, v16

    .line 667
    .line 668
    invoke-virtual {v1, v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 669
    .line 670
    .line 671
    move v0, v7

    .line 672
    move/from16 v18, v0

    .line 673
    .line 674
    goto :goto_10

    .line 675
    :cond_1a
    move/from16 v7, v17

    .line 676
    .line 677
    :goto_10
    iget-object v12, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 678
    .line 679
    aget-object v12, v12, v7

    .line 680
    .line 681
    if-ne v12, v8, :cond_1b

    .line 682
    .line 683
    if-lez v6, :cond_1b

    .line 684
    .line 685
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 686
    .line 687
    .line 688
    move-result v8

    .line 689
    if-le v8, v6, :cond_1b

    .line 690
    .line 691
    iput-boolean v7, v1, Landroidx/constraintlayout/solver/widgets/e;->Q0:Z

    .line 692
    .line 693
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 694
    .line 695
    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 696
    .line 697
    aput-object v8, v0, v7

    .line 698
    .line 699
    invoke-virtual {v1, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 700
    .line 701
    .line 702
    const/4 v7, 0x1

    .line 703
    const/4 v8, 0x1

    .line 704
    goto :goto_11

    .line 705
    :cond_1b
    move v8, v0

    .line 706
    move/from16 v7, v18

    .line 707
    .line 708
    :goto_11
    move v0, v9

    .line 709
    move/from16 v12, v20

    .line 710
    .line 711
    const/16 v17, 0x1

    .line 712
    .line 713
    goto/16 :goto_7

    .line 714
    .line 715
    :cond_1c
    move/from16 v18, v7

    .line 716
    .line 717
    move/from16 v20, v12

    .line 718
    .line 719
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 720
    .line 721
    invoke-interface {v0, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 722
    .line 723
    .line 724
    move-result-object v0

    .line 725
    check-cast v0, Landroidx/constraintlayout/solver/widgets/f;

    .line 726
    .line 727
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/f;->g()V

    .line 728
    .line 729
    .line 730
    move/from16 v0, v18

    .line 731
    .line 732
    :goto_12
    add-int/lit8 v15, v15, 0x1

    .line 733
    .line 734
    move/from16 v4, v16

    .line 735
    .line 736
    move/from16 v12, v20

    .line 737
    .line 738
    const/16 v7, 0x20

    .line 739
    .line 740
    const/16 v8, 0x8

    .line 741
    .line 742
    const/4 v9, 0x1

    .line 743
    goto/16 :goto_4

    .line 744
    .line 745
    :cond_1d
    iput-object v13, v1, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 746
    .line 747
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 748
    .line 749
    if-eqz v4, :cond_1e

    .line 750
    .line 751
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->V:I

    .line 752
    .line 753
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 754
    .line 755
    .line 756
    move-result v3

    .line 757
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 758
    .line 759
    .line 760
    move-result v2

    .line 761
    iget v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->W:I

    .line 762
    .line 763
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 764
    .line 765
    .line 766
    move-result v4

    .line 767
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    .line 768
    .line 769
    .line 770
    move-result v3

    .line 771
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/e;->y0:Landroidx/constraintlayout/solver/widgets/j;

    .line 772
    .line 773
    invoke-virtual {v4, v1}, Landroidx/constraintlayout/solver/widgets/j;->a(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    .line 774
    .line 775
    .line 776
    iget v4, v1, Landroidx/constraintlayout/solver/widgets/e;->z0:I

    .line 777
    .line 778
    add-int/2addr v2, v4

    .line 779
    iget v4, v1, Landroidx/constraintlayout/solver/widgets/e;->B0:I

    .line 780
    .line 781
    add-int/2addr v2, v4

    .line 782
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->y0(I)V

    .line 783
    .line 784
    .line 785
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/e;->A0:I

    .line 786
    .line 787
    add-int/2addr v3, v2

    .line 788
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/e;->C0:I

    .line 789
    .line 790
    add-int/2addr v3, v2

    .line 791
    invoke-virtual {v1, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b0(I)V

    .line 792
    .line 793
    .line 794
    goto :goto_13

    .line 795
    :cond_1e
    iput v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->K:I

    .line 796
    .line 797
    iput v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->L:I

    .line 798
    .line 799
    :goto_13
    if-eqz v0, :cond_1f

    .line 800
    .line 801
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 802
    .line 803
    aput-object v11, v0, v16

    .line 804
    .line 805
    const/16 v17, 0x1

    .line 806
    .line 807
    aput-object v10, v0, v17

    .line 808
    .line 809
    :cond_1f
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/e;->x0:Landroidx/constraintlayout/solver/c;

    .line 810
    .line 811
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/c;->x()Ll/wx3;

    .line 812
    .line 813
    .line 814
    move-result-object v0

    .line 815
    invoke-virtual {v1, v0}, Ll/jfq0;->T(Ll/wx3;)V

    .line 816
    .line 817
    .line 818
    invoke-virtual {v1}, Ll/jfq0;->J0()Landroidx/constraintlayout/solver/widgets/e;

    .line 819
    .line 820
    .line 821
    move-result-object v0

    .line 822
    if-ne v1, v0, :cond_20

    .line 823
    .line 824
    invoke-virtual {v1}, Ll/jfq0;->F0()V

    .line 825
    .line 826
    .line 827
    :cond_20
    return-void
.end method

.method public N0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/e;->P0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/4 v0, 0x1

    .line 8
    if-ne p2, v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/e;->Q0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    .line 11
    .line 12
    .line 13
    :cond_1
    return-void
.end method

.method public O0(Landroidx/constraintlayout/solver/c;)Z
    .locals 8

    .line 1
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b(Landroidx/constraintlayout/solver/c;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    move v2, v1

    .line 12
    :goto_0
    const/4 v3, 0x1

    .line 13
    if-ge v2, v0, :cond_5

    .line 14
    .line 15
    iget-object v4, p0, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    check-cast v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 22
    .line 23
    instance-of v5, v4, Landroidx/constraintlayout/solver/widgets/e;

    .line 24
    .line 25
    if-eqz v5, :cond_3

    .line 26
    .line 27
    iget-object v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 28
    .line 29
    aget-object v6, v5, v1

    .line 30
    .line 31
    aget-object v3, v5, v3

    .line 32
    .line 33
    sget-object v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 34
    .line 35
    if-ne v6, v5, :cond_0

    .line 36
    .line 37
    sget-object v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 38
    .line 39
    invoke-virtual {v4, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->g0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    if-ne v3, v5, :cond_1

    .line 43
    .line 44
    sget-object v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 45
    .line 46
    invoke-virtual {v4, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-virtual {v4, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b(Landroidx/constraintlayout/solver/c;)V

    .line 50
    .line 51
    .line 52
    if-ne v6, v5, :cond_2

    .line 53
    .line 54
    invoke-virtual {v4, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->g0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    if-ne v3, v5, :cond_4

    .line 58
    .line 59
    invoke-virtual {v4, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->u0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    invoke-static {p0, p1, v4}, Landroidx/constraintlayout/solver/widgets/h;->c(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/c;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v4, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->b(Landroidx/constraintlayout/solver/c;)V

    .line 67
    .line 68
    .line 69
    :cond_4
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_5
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/e;->D0:I

    .line 73
    .line 74
    if-lez v0, :cond_6

    .line 75
    .line 76
    invoke-static {p0, p1, v1}, Landroidx/constraintlayout/solver/widgets/c;->a(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/c;I)V

    .line 77
    .line 78
    .line 79
    :cond_6
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/e;->E0:I

    .line 80
    .line 81
    if-lez v0, :cond_7

    .line 82
    .line 83
    invoke-static {p0, p1, v3}, Landroidx/constraintlayout/solver/widgets/c;->a(Landroidx/constraintlayout/solver/widgets/e;Landroidx/constraintlayout/solver/c;I)V

    .line 84
    .line 85
    .line 86
    :cond_7
    return v3
.end method

.method public final P0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V
    .locals 5

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/e;->D0:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/e;->G0:[Landroidx/constraintlayout/solver/widgets/d;

    .line 6
    .line 7
    array-length v2, v1

    .line 8
    if-lt v0, v2, :cond_0

    .line 9
    .line 10
    array-length v0, v1

    .line 11
    mul-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, [Landroidx/constraintlayout/solver/widgets/d;

    .line 18
    .line 19
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/e;->G0:[Landroidx/constraintlayout/solver/widgets/d;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/e;->G0:[Landroidx/constraintlayout/solver/widgets/d;

    .line 22
    .line 23
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/e;->D0:I

    .line 24
    .line 25
    new-instance v2, Landroidx/constraintlayout/solver/widgets/d;

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/e;->V0()Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    invoke-direct {v2, p1, v3, v4}, Landroidx/constraintlayout/solver/widgets/d;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;IZ)V

    .line 33
    .line 34
    .line 35
    aput-object v2, v0, v1

    .line 36
    .line 37
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/e;->D0:I

    .line 38
    .line 39
    add-int/lit8 p1, p1, 0x1

    .line 40
    .line 41
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/e;->D0:I

    .line 42
    .line 43
    return-void
.end method

.method public Q()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/e;->x0:Landroidx/constraintlayout/solver/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/c;->F()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/e;->z0:I

    .line 8
    .line 9
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/e;->B0:I

    .line 10
    .line 11
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/e;->A0:I

    .line 12
    .line 13
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/e;->C0:I

    .line 14
    .line 15
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/e;->H0:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 18
    .line 19
    .line 20
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/e;->O0:Z

    .line 21
    .line 22
    invoke-super {p0}, Ll/jfq0;->Q()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final Q0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V
    .locals 5

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/e;->E0:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/e;->F0:[Landroidx/constraintlayout/solver/widgets/d;

    .line 6
    .line 7
    array-length v3, v2

    .line 8
    if-lt v0, v3, :cond_0

    .line 9
    .line 10
    array-length v0, v2

    .line 11
    mul-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, [Landroidx/constraintlayout/solver/widgets/d;

    .line 18
    .line 19
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/e;->F0:[Landroidx/constraintlayout/solver/widgets/d;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/e;->F0:[Landroidx/constraintlayout/solver/widgets/d;

    .line 22
    .line 23
    iget v2, p0, Landroidx/constraintlayout/solver/widgets/e;->E0:I

    .line 24
    .line 25
    new-instance v3, Landroidx/constraintlayout/solver/widgets/d;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/e;->V0()Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    invoke-direct {v3, p1, v1, v4}, Landroidx/constraintlayout/solver/widgets/d;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;IZ)V

    .line 32
    .line 33
    .line 34
    aput-object v3, v0, v2

    .line 35
    .line 36
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/e;->E0:I

    .line 37
    .line 38
    add-int/2addr p1, v1

    .line 39
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/e;->E0:I

    .line 40
    .line 41
    return-void
.end method

.method public R0(Ll/pa00;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/e;->x0:Landroidx/constraintlayout/solver/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/c;->w(Ll/pa00;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public S0()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/e;->N0:I

    .line 2
    .line 3
    return p0
.end method

.method public T0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public U0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/constraintlayout/solver/widgets/e;->Q0:Z

    .line 2
    .line 3
    return p0
.end method

.method public V0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/constraintlayout/solver/widgets/e;->w0:Z

    .line 2
    .line 3
    return p0
.end method

.method public W0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/constraintlayout/solver/widgets/e;->P0:Z

    .line 2
    .line 3
    return p0
.end method

.method public X0()V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/widgets/e;->Y0(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/e;->N0:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/widgets/e;->d(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/e;->f1()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public Y0(I)Z
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/e;->N0:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-ne p0, p1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public Z0(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    sget-object v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 7
    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->c:Ll/r3d0;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/r3d0;->h(I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    aget-object p1, p1, v0

    .line 21
    .line 22
    if-eq p1, v1, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d:Ll/r3d0;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, p2}, Ll/r3d0;->h(I)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public a1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->S()V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 20
    .line 21
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->S()V

    .line 22
    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public b1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/e;->a1()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/e;->N0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/widgets/e;->d(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final c1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/e;->D0:I

    .line 3
    .line 4
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/e;->E0:I

    .line 5
    .line 6
    return-void
.end method

.method public d(I)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 20
    .line 21
    invoke-virtual {v2, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->d(I)V

    .line 22
    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public d1(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/e;->N0:I

    .line 2
    .line 3
    return-void
.end method

.method public e1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/constraintlayout/solver/widgets/e;->w0:Z

    .line 2
    .line 3
    return-void
.end method

.method public f1()V
    .locals 3

    .line 1
    sget-object v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->TOP:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v1, 0x0

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v1, v2}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v1, v2}, Landroidx/constraintlayout/solver/widgets/i;->l(Landroidx/constraintlayout/solver/widgets/i;F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public g1(Landroidx/constraintlayout/solver/c;[Z)V
    .locals 9

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    aput-boolean v1, p2, v0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G0(Landroidx/constraintlayout/solver/c;)V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    move v3, v1

    .line 15
    :goto_0
    if-ge v3, v2, :cond_2

    .line 16
    .line 17
    iget-object v4, p0, Ll/jfq0;->v0:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    check-cast v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 24
    .line 25
    invoke-virtual {v4, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->G0(Landroidx/constraintlayout/solver/c;)V

    .line 26
    .line 27
    .line 28
    iget-object v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 29
    .line 30
    aget-object v5, v5, v1

    .line 31
    .line 32
    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 33
    .line 34
    const/4 v7, 0x1

    .line 35
    if-ne v5, v6, :cond_0

    .line 36
    .line 37
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->F()I

    .line 42
    .line 43
    .line 44
    move-result v8

    .line 45
    if-ge v5, v8, :cond_0

    .line 46
    .line 47
    aput-boolean v7, p2, v0

    .line 48
    .line 49
    :cond_0
    iget-object v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 50
    .line 51
    aget-object v5, v5, v7

    .line 52
    .line 53
    if-ne v5, v6, :cond_1

    .line 54
    .line 55
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->E()I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-ge v5, v4, :cond_1

    .line 64
    .line 65
    aput-boolean v7, p2, v0

    .line 66
    .line 67
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    return-void
.end method
