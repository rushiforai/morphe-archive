.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VDraweeView;

.field public g:Lv/VImage;

.field public h:Lv/VDraweeView;

.field public i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public k:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->f()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->g(Ll/x20;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ljk0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->k:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {p0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final synthetic f()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic g(Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    invoke-interface {p1}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final h(Ll/x20;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 4
    .line 5
    const-string v2, "https://auto.tancdn.com/v1/raw/64673fea-4f02-4f5e-9ef6-96f6de4c4d0d11.so"

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 12
    .line 13
    const-string v2, "https://auto.tancdn.com/v1/raw/4f9fe897-56cc-4fa8-86c4-f8aa02e2fd0011.so"

    .line 14
    .line 15
    const/4 v4, -0x1

    .line 16
    invoke-virtual {v1, v2, v4}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 20
    .line 21
    const-string v2, "https://auto.tancdn.com/v1/raw/77cbc051-9a53-4a89-81c0-40c8f6fc7b1e11.so"

    .line 22
    .line 23
    invoke-virtual {v1, v2, v4}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->b:Landroid/widget/FrameLayout;

    .line 27
    .line 28
    const/high16 v2, 0x43080000    # 136.0f

    .line 29
    .line 30
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    neg-int v4, v4

    .line 35
    int-to-float v4, v4

    .line 36
    const/4 v5, 0x2

    .line 37
    new-array v6, v5, [F

    .line 38
    .line 39
    const/4 v7, 0x0

    .line 40
    aput v4, v6, v7

    .line 41
    .line 42
    const/4 v4, 0x0

    .line 43
    aput v4, v6, v3

    .line 44
    .line 45
    const-string v8, "translationY"

    .line 46
    .line 47
    invoke-static {v1, v8, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const-wide/16 v9, 0x28a

    .line 52
    .line 53
    invoke-virtual {v1, v9, v10}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    .line 56
    new-instance v6, Landroid/view/animation/OvershootInterpolator;

    .line 57
    .line 58
    invoke-direct {v6}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v6}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 62
    .line 63
    .line 64
    iget-object v6, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->b:Landroid/widget/FrameLayout;

    .line 65
    .line 66
    new-array v11, v5, [F

    .line 67
    .line 68
    fill-array-data v11, :array_0

    .line 69
    .line 70
    .line 71
    const-string v12, "alpha"

    .line 72
    .line 73
    invoke-static {v6, v12, v11}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    invoke-virtual {v6, v9, v10}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 78
    .line 79
    .line 80
    new-instance v11, Landroid/view/animation/LinearInterpolator;

    .line 81
    .line 82
    invoke-direct {v11}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v6, v11}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 86
    .line 87
    .line 88
    iget-object v11, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->a:Landroid/view/View;

    .line 89
    .line 90
    new-array v13, v5, [F

    .line 91
    .line 92
    fill-array-data v13, :array_1

    .line 93
    .line 94
    .line 95
    invoke-static {v11, v12, v13}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 96
    .line 97
    .line 98
    move-result-object v11

    .line 99
    invoke-virtual {v11, v9, v10}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 100
    .line 101
    .line 102
    new-instance v9, Landroid/view/animation/LinearInterpolator;

    .line 103
    .line 104
    invoke-direct {v9}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v11, v9}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 108
    .line 109
    .line 110
    iget-object v9, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->b:Landroid/widget/FrameLayout;

    .line 111
    .line 112
    const/4 v10, 0x4

    .line 113
    new-array v13, v10, [F

    .line 114
    .line 115
    fill-array-data v13, :array_2

    .line 116
    .line 117
    .line 118
    const-string v14, "translationX"

    .line 119
    .line 120
    invoke-static {v9, v14, v13}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 121
    .line 122
    .line 123
    move-result-object v9

    .line 124
    const-wide/16 v13, 0x1f4

    .line 125
    .line 126
    invoke-virtual {v9, v13, v14}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 127
    .line 128
    .line 129
    new-instance v15, Landroid/view/animation/OvershootInterpolator;

    .line 130
    .line 131
    invoke-direct {v15}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v9, v15}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 135
    .line 136
    .line 137
    iget-object v15, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->b:Landroid/widget/FrameLayout;

    .line 138
    .line 139
    new-array v10, v10, [F

    .line 140
    .line 141
    fill-array-data v10, :array_3

    .line 142
    .line 143
    .line 144
    invoke-static {v15, v8, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 145
    .line 146
    .line 147
    move-result-object v10

    .line 148
    invoke-virtual {v10, v13, v14}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 149
    .line 150
    .line 151
    new-instance v15, Landroid/view/animation/OvershootInterpolator;

    .line 152
    .line 153
    invoke-direct {v15}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v10, v15}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 157
    .line 158
    .line 159
    iget-object v15, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->b:Landroid/widget/FrameLayout;

    .line 160
    .line 161
    move/from16 v16, v2

    .line 162
    .line 163
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    move/from16 v17, v3

    .line 168
    .line 169
    move/from16 v18, v4

    .line 170
    .line 171
    int-to-double v3, v2

    .line 172
    const-wide v19, -0x4046666666666666L    # -0.1

    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    mul-double v3, v3, v19

    .line 178
    .line 179
    double-to-float v2, v3

    .line 180
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    neg-int v3, v3

    .line 185
    int-to-float v3, v3

    .line 186
    const/4 v4, 0x3

    .line 187
    new-array v4, v4, [F

    .line 188
    .line 189
    aput v18, v4, v7

    .line 190
    .line 191
    aput v2, v4, v17

    .line 192
    .line 193
    aput v3, v4, v5

    .line 194
    .line 195
    invoke-static {v15, v8, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    invoke-virtual {v2, v13, v14}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 200
    .line 201
    .line 202
    new-instance v3, Landroid/view/animation/LinearInterpolator;

    .line 203
    .line 204
    invoke-direct {v3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v2, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 208
    .line 209
    .line 210
    const-wide/16 v3, 0x92e

    .line 211
    .line 212
    invoke-virtual {v2, v3, v4}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 213
    .line 214
    .line 215
    iget-object v7, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->b:Landroid/widget/FrameLayout;

    .line 216
    .line 217
    new-array v8, v5, [F

    .line 218
    .line 219
    fill-array-data v8, :array_4

    .line 220
    .line 221
    .line 222
    invoke-static {v7, v12, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 223
    .line 224
    .line 225
    move-result-object v7

    .line 226
    invoke-virtual {v7, v13, v14}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 227
    .line 228
    .line 229
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 230
    .line 231
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v7, v8}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v7, v3, v4}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 238
    .line 239
    .line 240
    iget-object v8, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->a:Landroid/view/View;

    .line 241
    .line 242
    new-array v5, v5, [F

    .line 243
    .line 244
    fill-array-data v5, :array_5

    .line 245
    .line 246
    .line 247
    invoke-static {v8, v12, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 248
    .line 249
    .line 250
    move-result-object v5

    .line 251
    invoke-virtual {v5, v13, v14}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 252
    .line 253
    .line 254
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 255
    .line 256
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v5, v8}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v5, v3, v4}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 263
    .line 264
    .line 265
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 266
    .line 267
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 268
    .line 269
    .line 270
    iput-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->k:Landroid/animation/AnimatorSet;

    .line 271
    .line 272
    invoke-virtual {v3, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 273
    .line 274
    .line 275
    move-result-object v3

    .line 276
    invoke-virtual {v3, v6}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 277
    .line 278
    .line 279
    move-result-object v3

    .line 280
    invoke-virtual {v3, v11}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 281
    .line 282
    .line 283
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->k:Landroid/animation/AnimatorSet;

    .line 284
    .line 285
    invoke-virtual {v3, v9}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 286
    .line 287
    .line 288
    move-result-object v3

    .line 289
    invoke-virtual {v3, v10}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 290
    .line 291
    .line 292
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->k:Landroid/animation/AnimatorSet;

    .line 293
    .line 294
    invoke-virtual {v3, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 295
    .line 296
    .line 297
    move-result-object v3

    .line 298
    invoke-virtual {v3, v7}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 299
    .line 300
    .line 301
    move-result-object v3

    .line 302
    invoke-virtual {v3, v5}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 303
    .line 304
    .line 305
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->k:Landroid/animation/AnimatorSet;

    .line 306
    .line 307
    invoke-virtual {v3, v9}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 308
    .line 309
    .line 310
    move-result-object v3

    .line 311
    invoke-virtual {v3, v1}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 312
    .line 313
    .line 314
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->k:Landroid/animation/AnimatorSet;

    .line 315
    .line 316
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 317
    .line 318
    .line 319
    move-result-object v1

    .line 320
    invoke-virtual {v1, v10}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 321
    .line 322
    .line 323
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->k:Landroid/animation/AnimatorSet;

    .line 324
    .line 325
    new-instance v2, Ll/jjk0;

    .line 326
    .line 327
    invoke-direct {v2, v0}, Ll/jjk0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;)V

    .line 328
    .line 329
    .line 330
    new-instance v3, Ll/kjk0;

    .line 331
    .line 332
    move-object/from16 v4, p1

    .line 333
    .line 334
    invoke-direct {v3, v0, v4}, Ll/kjk0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;Ll/x20;)V

    .line 335
    .line 336
    .line 337
    invoke-static {v1, v2, v3}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 338
    .line 339
    .line 340
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->k:Landroid/animation/AnimatorSet;

    .line 341
    .line 342
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 343
    .line 344
    .line 345
    return-void

    .line 346
    nop

    .line 347
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 348
    .line 349
    .line 350
    .line 351
    .line 352
    .line 353
    .line 354
    .line 355
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    .line 363
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x3f666666    # 0.9f
        0x3f99999a    # 1.2f
        0x3f800000    # 1.0f
    .end array-data

    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x3f666666    # 0.9f
        0x3f99999a    # 1.2f
        0x3f800000    # 1.0f
    .end array-data

    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    :array_4
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    :array_5
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public i(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->j(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->h(Ll/x20;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->d:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->userName:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->h:Lv/VDraweeView;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->avatarUrl:Ljava/lang/String;

    .line 11
    .line 12
    sget v2, Ll/qa00;->x:I

    .line 13
    .line 14
    const-string v3, "context_livingAct"

    .line 15
    .line 16
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->f:Lv/VDraweeView;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v3, v0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->e:Lv/VText;

    .line 31
    .line 32
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Kj:I

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->g:Lv/VImage;

    .line 38
    .line 39
    sget v0, Ll/obc0;->A8:I

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget v0, Ll/obc0;->B8:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->d()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/UserUpgradeView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
