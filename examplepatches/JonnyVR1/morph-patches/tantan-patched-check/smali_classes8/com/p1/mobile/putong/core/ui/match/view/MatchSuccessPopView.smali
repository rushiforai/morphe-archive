.class public Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/syl;


# instance fields
.field public A:Lcom/tantan/library/svga/SVGAnimationView;

.field public B:Ll/ryl;

.field public d:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

.field public e:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VLinear;

.field public l:Lv/VText;

.field public m:Lv/VLinear;

.field public n:Lv/VText;

.field public o:Lv/VLinear;

.field public p:Lv/VText;

.field public q:Lv/VLinear;

.field public r:Lv/VText;

.field public s:Landroidx/constraintlayout/widget/Guideline;

.field public t:Lv/VDraweeView;

.field public u:Lv/VDraweeView;

.field public v:Lv/VDraweeView;

.field public w:Landroid/view/View;

.field public x:Lv/VFrame;

.field public y:Lv/VImage;

.field public z:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-object p0
.end method

.method public static bridge synthetic h0(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)Ll/ryl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->B:Ll/ryl;

    return-object p0
.end method

.method public static bridge synthetic i0(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic j0(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->m0()V

    return-void
.end method

.method public static bridge synthetic k0(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->p0()V

    return-void
.end method


# virtual methods
.method public E(Lcom/p1/mobile/putong/data/User;)V
    .locals 32

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    move-object/from16 v2, p1

    .line 5
    .line 6
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->w(Lcom/p1/mobile/putong/data/User;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->u:Lv/VDraweeView;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->g:Lv/VText;

    .line 16
    .line 17
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->i:Lv/VText;

    .line 21
    .line 22
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->v:Lv/VDraweeView;

    .line 26
    .line 27
    new-instance v10, Landroid/view/animation/LinearInterpolator;

    .line 28
    .line 29
    invoke-direct {v10}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 30
    .line 31
    .line 32
    const/4 v2, 0x2

    .line 33
    new-array v11, v2, [F

    .line 34
    .line 35
    fill-array-data v11, :array_0

    .line 36
    .line 37
    .line 38
    sget-object v13, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 39
    .line 40
    const-wide/16 v6, 0x0

    .line 41
    .line 42
    const-wide/16 v8, 0x12c

    .line 43
    .line 44
    move-object v5, v13

    .line 45
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    iget-object v12, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->h:Lv/VText;

    .line 50
    .line 51
    new-instance v18, Landroid/view/animation/LinearInterpolator;

    .line 52
    .line 53
    invoke-direct/range {v18 .. v18}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 54
    .line 55
    .line 56
    new-array v5, v2, [F

    .line 57
    .line 58
    fill-array-data v5, :array_1

    .line 59
    .line 60
    .line 61
    const-wide/16 v14, 0x0

    .line 62
    .line 63
    const-wide/16 v16, 0x12c

    .line 64
    .line 65
    move-object/from16 v19, v5

    .line 66
    .line 67
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    iget-object v12, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->j:Lv/VText;

    .line 72
    .line 73
    new-instance v18, Landroid/view/animation/LinearInterpolator;

    .line 74
    .line 75
    invoke-direct/range {v18 .. v18}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 76
    .line 77
    .line 78
    new-array v6, v2, [F

    .line 79
    .line 80
    fill-array-data v6, :array_2

    .line 81
    .line 82
    .line 83
    move-object/from16 v19, v6

    .line 84
    .line 85
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 86
    .line 87
    .line 88
    move-result-object v16

    .line 89
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->v:Lv/VDraweeView;

    .line 90
    .line 91
    new-instance v23, Landroid/view/animation/LinearInterpolator;

    .line 92
    .line 93
    invoke-direct/range {v23 .. v23}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 94
    .line 95
    .line 96
    const/high16 v7, 0x41700000    # 15.0f

    .line 97
    .line 98
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v8

    .line 102
    neg-int v8, v8

    .line 103
    int-to-float v8, v8

    .line 104
    new-array v9, v2, [F

    .line 105
    .line 106
    const/4 v10, 0x0

    .line 107
    aput v10, v9, v3

    .line 108
    .line 109
    aput v8, v9, v1

    .line 110
    .line 111
    sget-object v25, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 112
    .line 113
    const-wide/16 v19, 0x0

    .line 114
    .line 115
    const-wide/16 v21, 0x12c

    .line 116
    .line 117
    move-object/from16 v17, v6

    .line 118
    .line 119
    move-object/from16 v24, v9

    .line 120
    .line 121
    move-object/from16 v18, v25

    .line 122
    .line 123
    invoke-static/range {v17 .. v24}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 124
    .line 125
    .line 126
    move-result-object v17

    .line 127
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->h:Lv/VText;

    .line 128
    .line 129
    new-instance v30, Landroid/view/animation/LinearInterpolator;

    .line 130
    .line 131
    invoke-direct/range {v30 .. v30}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 132
    .line 133
    .line 134
    const/high16 v8, 0x40a00000    # 5.0f

    .line 135
    .line 136
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 137
    .line 138
    .line 139
    move-result v9

    .line 140
    neg-int v9, v9

    .line 141
    int-to-float v9, v9

    .line 142
    new-array v11, v2, [F

    .line 143
    .line 144
    aput v10, v11, v3

    .line 145
    .line 146
    aput v9, v11, v1

    .line 147
    .line 148
    const-wide/16 v26, 0x0

    .line 149
    .line 150
    const-wide/16 v28, 0x12c

    .line 151
    .line 152
    move-object/from16 v24, v6

    .line 153
    .line 154
    move-object/from16 v31, v11

    .line 155
    .line 156
    invoke-static/range {v24 .. v31}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 157
    .line 158
    .line 159
    move-result-object v18

    .line 160
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->j:Lv/VText;

    .line 161
    .line 162
    new-instance v30, Landroid/view/animation/LinearInterpolator;

    .line 163
    .line 164
    invoke-direct/range {v30 .. v30}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 165
    .line 166
    .line 167
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 168
    .line 169
    .line 170
    move-result v9

    .line 171
    neg-int v9, v9

    .line 172
    int-to-float v9, v9

    .line 173
    new-array v11, v2, [F

    .line 174
    .line 175
    aput v10, v11, v3

    .line 176
    .line 177
    aput v9, v11, v1

    .line 178
    .line 179
    move-object/from16 v24, v6

    .line 180
    .line 181
    move-object/from16 v31, v11

    .line 182
    .line 183
    invoke-static/range {v24 .. v31}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 184
    .line 185
    .line 186
    move-result-object v19

    .line 187
    move-object v14, v4

    .line 188
    move-object v15, v5

    .line 189
    filled-new-array/range {v14 .. v19}, [Landroid/animation/Animator;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    invoke-static {v4}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    iget-object v12, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->u:Lv/VDraweeView;

    .line 198
    .line 199
    new-instance v18, Landroid/view/animation/LinearInterpolator;

    .line 200
    .line 201
    invoke-direct/range {v18 .. v18}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 202
    .line 203
    .line 204
    new-array v5, v2, [F

    .line 205
    .line 206
    fill-array-data v5, :array_3

    .line 207
    .line 208
    .line 209
    const-wide/16 v14, 0x0

    .line 210
    .line 211
    const-wide/16 v16, 0x12c

    .line 212
    .line 213
    move-object/from16 v19, v5

    .line 214
    .line 215
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 216
    .line 217
    .line 218
    move-result-object v5

    .line 219
    iget-object v12, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->g:Lv/VText;

    .line 220
    .line 221
    new-instance v18, Landroid/view/animation/LinearInterpolator;

    .line 222
    .line 223
    invoke-direct/range {v18 .. v18}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 224
    .line 225
    .line 226
    new-array v6, v2, [F

    .line 227
    .line 228
    fill-array-data v6, :array_4

    .line 229
    .line 230
    .line 231
    move-object/from16 v19, v6

    .line 232
    .line 233
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 234
    .line 235
    .line 236
    move-result-object v20

    .line 237
    iget-object v12, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->i:Lv/VText;

    .line 238
    .line 239
    new-instance v18, Landroid/view/animation/LinearInterpolator;

    .line 240
    .line 241
    invoke-direct/range {v18 .. v18}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 242
    .line 243
    .line 244
    new-array v6, v2, [F

    .line 245
    .line 246
    fill-array-data v6, :array_5

    .line 247
    .line 248
    .line 249
    move-object/from16 v19, v6

    .line 250
    .line 251
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 252
    .line 253
    .line 254
    move-result-object v21

    .line 255
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->u:Lv/VDraweeView;

    .line 256
    .line 257
    new-instance v30, Landroid/view/animation/LinearInterpolator;

    .line 258
    .line 259
    invoke-direct/range {v30 .. v30}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 260
    .line 261
    .line 262
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 263
    .line 264
    .line 265
    move-result v7

    .line 266
    int-to-float v7, v7

    .line 267
    new-array v9, v2, [F

    .line 268
    .line 269
    aput v7, v9, v3

    .line 270
    .line 271
    aput v10, v9, v1

    .line 272
    .line 273
    move-object/from16 v24, v6

    .line 274
    .line 275
    move-object/from16 v31, v9

    .line 276
    .line 277
    invoke-static/range {v24 .. v31}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 278
    .line 279
    .line 280
    move-result-object v22

    .line 281
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->g:Lv/VText;

    .line 282
    .line 283
    new-instance v30, Landroid/view/animation/LinearInterpolator;

    .line 284
    .line 285
    invoke-direct/range {v30 .. v30}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 286
    .line 287
    .line 288
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 289
    .line 290
    .line 291
    move-result v7

    .line 292
    int-to-float v7, v7

    .line 293
    new-array v9, v2, [F

    .line 294
    .line 295
    aput v7, v9, v3

    .line 296
    .line 297
    aput v10, v9, v1

    .line 298
    .line 299
    move-object/from16 v24, v6

    .line 300
    .line 301
    move-object/from16 v31, v9

    .line 302
    .line 303
    invoke-static/range {v24 .. v31}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 304
    .line 305
    .line 306
    move-result-object v23

    .line 307
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->i:Lv/VText;

    .line 308
    .line 309
    new-instance v30, Landroid/view/animation/LinearInterpolator;

    .line 310
    .line 311
    invoke-direct/range {v30 .. v30}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 312
    .line 313
    .line 314
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 315
    .line 316
    .line 317
    move-result v7

    .line 318
    int-to-float v7, v7

    .line 319
    new-array v2, v2, [F

    .line 320
    .line 321
    aput v7, v2, v3

    .line 322
    .line 323
    aput v10, v2, v1

    .line 324
    .line 325
    move-object/from16 v31, v2

    .line 326
    .line 327
    move-object/from16 v24, v6

    .line 328
    .line 329
    invoke-static/range {v24 .. v31}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 330
    .line 331
    .line 332
    move-result-object v24

    .line 333
    move-object/from16 v19, v5

    .line 334
    .line 335
    filled-new-array/range {v19 .. v24}, [Landroid/animation/Animator;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 340
    .line 341
    .line 342
    move-result-object v1

    .line 343
    new-instance v2, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$i;

    .line 344
    .line 345
    invoke-direct {v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$i;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;Landroid/animation/Animator;)V

    .line 346
    .line 347
    .line 348
    invoke-static {v4, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 349
    .line 350
    .line 351
    new-instance v2, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$j;

    .line 352
    .line 353
    invoke-direct {v2, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$j;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)V

    .line 354
    .line 355
    .line 356
    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 357
    .line 358
    .line 359
    invoke-virtual {v4}, Landroid/animation/Animator;->start()V

    .line 360
    .line 361
    .line 362
    return-void

    .line 363
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    :array_4
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    :array_5
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public N(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/x7c0;->f:I

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$b;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$b;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->getRootView()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public V()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->o0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->n0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public a0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->f:Lv/VImage;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->g:Lv/VText;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->h:Lv/VText;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->i:Lv/VText;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->j:Lv/VText;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->k:Lv/VLinear;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->l:Lv/VText;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->m:Lv/VLinear;

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->n:Lv/VText;

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->o:Lv/VLinear;

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->p:Lv/VText;

    .line 50
    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->q:Lv/VLinear;

    .line 54
    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->r:Lv/VText;

    .line 58
    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->s:Landroidx/constraintlayout/widget/Guideline;

    .line 62
    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->t:Lv/VDraweeView;

    .line 66
    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->u:Lv/VDraweeView;

    .line 70
    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->v:Lv/VDraweeView;

    .line 74
    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->w:Landroid/view/View;

    .line 78
    .line 79
    if-eqz v0, :cond_1

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->y:Lv/VImage;

    .line 82
    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->x:Lv/VFrame;

    .line 86
    .line 87
    if-eqz v0, :cond_1

    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->z:Lv/VImage;

    .line 90
    .line 91
    if-eqz v0, :cond_1

    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->A:Lcom/tantan/library/svga/SVGAnimationView;

    .line 94
    .line 95
    if-nez p0, :cond_0

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    const/4 p0, 0x0

    .line 99
    return p0

    .line 100
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 101
    return p0
.end method

.method public getRootView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public final l0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ygx;->a(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final m0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->B:Ll/ryl;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/ryl;->f()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {}, Ll/nrb0;->b()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->B:Ll/ryl;

    .line 25
    .line 26
    invoke-interface {v2}, Ll/ryl;->f()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->y:Lv/VImage;

    .line 31
    .line 32
    invoke-interface {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->z:Lv/VImage;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->x:Lv/VFrame;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->y:Lv/VImage;

    .line 44
    .line 45
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    return-void
.end method

.method public final n0()V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->a0()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v8, Ll/fzf0;

    .line 11
    .line 12
    const/high16 v1, 0x3f000000    # 0.5f

    .line 13
    .line 14
    invoke-direct {v8, v1}, Ll/fzf0;-><init>(F)V

    .line 15
    .line 16
    .line 17
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->t:Lv/VDraweeView;

    .line 18
    .line 19
    const/high16 v1, 0x42700000    # 60.0f

    .line 20
    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    neg-int v3, v3

    .line 26
    int-to-float v3, v3

    .line 27
    const/high16 v10, 0x41200000    # 10.0f

    .line 28
    .line 29
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    int-to-float v4, v4

    .line 34
    const/4 v11, 0x2

    .line 35
    new-array v9, v11, [F

    .line 36
    .line 37
    const/4 v12, 0x0

    .line 38
    aput v3, v9, v12

    .line 39
    .line 40
    const/4 v13, 0x1

    .line 41
    aput v4, v9, v13

    .line 42
    .line 43
    sget-object v3, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 44
    .line 45
    const-wide/16 v16, 0xc8

    .line 46
    .line 47
    const-wide/16 v6, 0x5dc

    .line 48
    .line 49
    move-wide/from16 v4, v16

    .line 50
    .line 51
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    move-result-object v14

    .line 55
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->v:Lv/VDraweeView;

    .line 56
    .line 57
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    int-to-float v1, v1

    .line 62
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    neg-int v4, v4

    .line 67
    int-to-float v4, v4

    .line 68
    new-array v9, v11, [F

    .line 69
    .line 70
    aput v1, v9, v12

    .line 71
    .line 72
    aput v4, v9, v13

    .line 73
    .line 74
    move-wide/from16 v4, v16

    .line 75
    .line 76
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    move-object v2, v14

    .line 81
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->t:Lv/VDraweeView;

    .line 82
    .line 83
    new-instance v20, Landroid/view/animation/LinearInterpolator;

    .line 84
    .line 85
    invoke-direct/range {v20 .. v20}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 86
    .line 87
    .line 88
    new-array v3, v11, [F

    .line 89
    .line 90
    fill-array-data v3, :array_0

    .line 91
    .line 92
    .line 93
    sget-object v15, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 94
    .line 95
    const-wide/16 v18, 0x64

    .line 96
    .line 97
    move-object/from16 v21, v3

    .line 98
    .line 99
    invoke-static/range {v14 .. v21}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->v:Lv/VDraweeView;

    .line 104
    .line 105
    new-instance v20, Landroid/view/animation/LinearInterpolator;

    .line 106
    .line 107
    invoke-direct/range {v20 .. v20}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 108
    .line 109
    .line 110
    new-array v4, v11, [F

    .line 111
    .line 112
    fill-array-data v4, :array_1

    .line 113
    .line 114
    .line 115
    move-object/from16 v21, v4

    .line 116
    .line 117
    invoke-static/range {v14 .. v21}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    new-instance v5, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$g;

    .line 122
    .line 123
    invoke-direct {v5, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$g;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)V

    .line 124
    .line 125
    .line 126
    invoke-static {v2, v5}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 127
    .line 128
    .line 129
    new-instance v5, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$h;

    .line 130
    .line 131
    invoke-direct {v5, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$h;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)V

    .line 132
    .line 133
    .line 134
    invoke-static {v2, v5}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 135
    .line 136
    .line 137
    filled-new-array {v2, v1, v3, v4}, [Landroid/animation/Animator;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final o0()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 9
    .line 10
    new-instance v7, Landroid/view/animation/DecelerateInterpolator;

    .line 11
    .line 12
    invoke-direct {v7}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    new-array v8, v0, [F

    .line 17
    .line 18
    fill-array-data v8, :array_0

    .line 19
    .line 20
    .line 21
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 22
    .line 23
    const-wide/16 v3, 0x0

    .line 24
    .line 25
    const-wide/16 v5, 0x12c

    .line 26
    .line 27
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 32
    .line 33
    new-instance v8, Landroid/view/animation/DecelerateInterpolator;

    .line 34
    .line 35
    invoke-direct {v8}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 36
    .line 37
    .line 38
    const/high16 p0, 0x41a00000    # 20.0f

    .line 39
    .line 40
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    neg-int p0, p0

    .line 45
    int-to-float p0, p0

    .line 46
    new-array v9, v0, [F

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    aput p0, v9, v0

    .line 50
    .line 51
    const/4 p0, 0x0

    .line 52
    const/4 v0, 0x1

    .line 53
    aput p0, v9, v0

    .line 54
    .line 55
    sget-object v3, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 56
    .line 57
    const-wide/16 v4, 0x0

    .line 58
    .line 59
    const-wide/16 v6, 0x12c

    .line 60
    .line 61
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    filled-new-array {v1, p0}, [Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->l0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->v:Lv/VDraweeView;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->u:Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->v:Lv/VDraweeView;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->u:Lv/VDraweeView;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->h:Lv/VText;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->g:Lv/VText;

    .line 23
    .line 24
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->h:Lv/VText;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->g:Lv/VText;

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->j:Lv/VText;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->i:Lv/VText;

    .line 34
    .line 35
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->j:Lv/VText;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->i:Lv/VText;

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public r()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->h:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    const/4 v3, 0x1

    .line 9
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->g:Lv/VText;

    .line 13
    .line 14
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->r:Lv/VText;

    .line 22
    .line 23
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->l:Lv/VText;

    .line 31
    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v2, "["

    .line 35
    .line 36
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Hj:I

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v3, "]"

    .line 53
    .line 54
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->n:Lv/VText;

    .line 65
    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    sget v5, Lcom/p1/mobile/putong/core/R$string;->i4:I

    .line 76
    .line 77
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->p:Lv/VText;

    .line 95
    .line 96
    new-instance v1, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Gj:I

    .line 106
    .line 107
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->k:Lv/VLinear;

    .line 125
    .line 126
    new-instance v1, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$a;

    .line 127
    .line 128
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$a;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->m:Lv/VLinear;

    .line 135
    .line 136
    new-instance v1, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$c;

    .line 137
    .line 138
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$c;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)V

    .line 139
    .line 140
    .line 141
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->o:Lv/VLinear;

    .line 145
    .line 146
    new-instance v1, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$d;

    .line 147
    .line 148
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$d;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)V

    .line 149
    .line 150
    .line 151
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->q:Lv/VLinear;

    .line 155
    .line 156
    new-instance v1, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$e;

    .line 157
    .line 158
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$e;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)V

    .line 159
    .line 160
    .line 161
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->f:Lv/VImage;

    .line 165
    .line 166
    new-instance v1, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$f;

    .line 167
    .line 168
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$f;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)V

    .line 169
    .line 170
    .line 171
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->A:Lcom/tantan/library/svga/SVGAnimationView;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "https://auto.tancdn.com/v1/raw/43f6acda-0599-43c7-95cb-4b2b00f758ba11.so"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->A:Lcom/tantan/library/svga/SVGAnimationView;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "\u65b0\u914d\u5bf9"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const-string v2, " \u00b7 "

    .line 15
    .line 16
    if-eqz v1, :cond_2

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_0

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 49
    .line 50
    iget v1, v1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 51
    .line 52
    const/4 v3, 0x1

    .line 53
    invoke-static {v1, v3}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-nez v3, :cond_0

    .line 62
    .line 63
    const-string v3, "("

    .line 64
    .line 65
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v1, ")"

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 77
    .line 78
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 79
    .line 80
    invoke-static {v1}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-nez v1, :cond_1

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 94
    .line 95
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 96
    .line 97
    invoke-static {v1}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-lez v1, :cond_3

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-nez v1, :cond_3

    .line 117
    .line 118
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v1, "\u5c81"

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {v1}, Ll/hmj0;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    :cond_3
    :goto_0
    const/4 v1, 0x0

    .line 145
    if-eqz p2, :cond_4

    .line 146
    .line 147
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->g:Lv/VText;

    .line 148
    .line 149
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->i:Lv/VText;

    .line 155
    .line 156
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 161
    .line 162
    .line 163
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 164
    .line 165
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->u:Lv/VDraweeView;

    .line 166
    .line 167
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-virtual {p2, v0, p1, v1}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 176
    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->h:Lv/VText;

    .line 180
    .line 181
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 182
    .line 183
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    .line 185
    .line 186
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->j:Lv/VText;

    .line 187
    .line 188
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    .line 194
    .line 195
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 196
    .line 197
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->v:Lv/VDraweeView;

    .line 198
    .line 199
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    invoke-virtual {p2, v0, p1, v1}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 208
    .line 209
    .line 210
    :goto_1
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 211
    .line 212
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->t:Lv/VDraweeView;

    .line 213
    .line 214
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 215
    .line 216
    .line 217
    move-result-object p2

    .line 218
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 219
    .line 220
    .line 221
    move-result-object p2

    .line 222
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 223
    .line 224
    .line 225
    move-result-object p2

    .line 226
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 227
    .line 228
    .line 229
    move-result-object p2

    .line 230
    invoke-virtual {p1, p0, p2, v1}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 231
    .line 232
    .line 233
    return-void
.end method

.method public x(Ll/ryl;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/syl;->x(Ll/ryl;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->B:Ll/ryl;

    .line 5
    .line 6
    return-void
.end method
