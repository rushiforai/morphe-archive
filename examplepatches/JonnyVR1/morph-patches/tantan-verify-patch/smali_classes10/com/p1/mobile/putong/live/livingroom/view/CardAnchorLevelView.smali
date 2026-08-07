.class public Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VMarqueeText;

.field public f:Landroid/widget/RelativeLayout;

.field public g:Lv/VDraweeView;

.field public h:Lv/VFrame;

.field public i:Landroid/view/View;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public n:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private synthetic K(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->a:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->f:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->g:Lv/VDraweeView;

    .line 6
    .line 7
    const/4 v5, 0x1

    .line 8
    move-object v0, p0

    .line 9
    move-object v4, p1

    .line 10
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->C(Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/data/User;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic L(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->f:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->a:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->b:Lv/VDraweeView;

    .line 6
    .line 7
    const/4 v5, 0x0

    .line 8
    move-object v0, p0

    .line 9
    move-object v4, p1

    .line 10
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->C(Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/data/User;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->K(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->L(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method private setShadowProgress(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->a:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/high16 v1, 0x41400000    # 12.0f

    .line 8
    .line 9
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    sub-int/2addr v0, v2

    .line 14
    int-to-float v0, v0

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->a:Landroid/widget/RelativeLayout;

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    sub-int/2addr v2, v1

    .line 26
    mul-int/2addr p1, v2

    .line 27
    int-to-float p1, p1

    .line 28
    const v1, 0x3c23d70a    # 0.01f

    .line 29
    .line 30
    .line 31
    mul-float/2addr p1, v1

    .line 32
    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    float-to-int p1, p1

    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->i:Landroid/view/View;

    .line 38
    .line 39
    filled-new-array {p0}, [Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p1, p0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->G(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->M()V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->N(Z)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->setShadowProgress(I)V

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mh4;->a(Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C(Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v5, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    new-array v3, v0, [F

    .line 9
    .line 10
    fill-array-data v3, :array_0

    .line 11
    .line 12
    .line 13
    const-string v4, "scaleX"

    .line 14
    .line 15
    invoke-static {v5, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v6

    .line 19
    const-wide/16 v7, 0x12c

    .line 20
    .line 21
    invoke-virtual {v6, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    new-instance v3, Landroid/view/animation/LinearInterpolator;

    .line 25
    .line 26
    invoke-direct {v3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v6, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 30
    .line 31
    .line 32
    new-array v3, v0, [F

    .line 33
    .line 34
    fill-array-data v3, :array_1

    .line 35
    .line 36
    .line 37
    const-string v9, "scaleY"

    .line 38
    .line 39
    invoke-static {v5, v9, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v10

    .line 43
    invoke-virtual {v10, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    new-instance v3, Landroid/view/animation/LinearInterpolator;

    .line 47
    .line 48
    invoke-direct {v3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v10, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 52
    .line 53
    .line 54
    new-array v3, v0, [F

    .line 55
    .line 56
    fill-array-data v3, :array_2

    .line 57
    .line 58
    .line 59
    const-string v11, "alpha"

    .line 60
    .line 61
    invoke-static {v5, v11, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 62
    .line 63
    .line 64
    move-result-object v12

    .line 65
    invoke-virtual {v12, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 66
    .line 67
    .line 68
    new-instance v3, Landroid/view/animation/LinearInterpolator;

    .line 69
    .line 70
    invoke-direct {v3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v12, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 74
    .line 75
    .line 76
    new-array v3, v0, [F

    .line 77
    .line 78
    fill-array-data v3, :array_3

    .line 79
    .line 80
    .line 81
    invoke-static {v2, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 82
    .line 83
    .line 84
    move-result-object v13

    .line 85
    const-wide/16 v14, 0xc8

    .line 86
    .line 87
    invoke-virtual {v13, v14, v15}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 88
    .line 89
    .line 90
    new-instance v3, Landroid/view/animation/LinearInterpolator;

    .line 91
    .line 92
    invoke-direct {v3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v13, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 96
    .line 97
    .line 98
    new-array v3, v0, [F

    .line 99
    .line 100
    fill-array-data v3, :array_4

    .line 101
    .line 102
    .line 103
    invoke-static {v2, v9, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-virtual {v3, v14, v15}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 108
    .line 109
    .line 110
    new-instance v14, Landroid/view/animation/LinearInterpolator;

    .line 111
    .line 112
    invoke-direct {v14}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v3, v14}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 116
    .line 117
    .line 118
    new-array v14, v0, [F

    .line 119
    .line 120
    fill-array-data v14, :array_5

    .line 121
    .line 122
    .line 123
    invoke-static {v2, v4, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 124
    .line 125
    .line 126
    move-result-object v14

    .line 127
    invoke-virtual {v14, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 128
    .line 129
    .line 130
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    .line 131
    .line 132
    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v14, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 136
    .line 137
    .line 138
    new-array v4, v0, [F

    .line 139
    .line 140
    fill-array-data v4, :array_6

    .line 141
    .line 142
    .line 143
    invoke-static {v2, v9, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 144
    .line 145
    .line 146
    move-result-object v9

    .line 147
    invoke-virtual {v9, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 148
    .line 149
    .line 150
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    .line 151
    .line 152
    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v9, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 156
    .line 157
    .line 158
    new-array v4, v0, [F

    .line 159
    .line 160
    fill-array-data v4, :array_7

    .line 161
    .line 162
    .line 163
    invoke-static {v2, v11, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 164
    .line 165
    .line 166
    move-result-object v15

    .line 167
    invoke-virtual {v15, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 168
    .line 169
    .line 170
    const-wide/16 v7, 0x64

    .line 171
    .line 172
    invoke-virtual {v15, v7, v8}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 173
    .line 174
    .line 175
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    .line 176
    .line 177
    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v15, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 181
    .line 182
    .line 183
    new-array v0, v0, [F

    .line 184
    .line 185
    fill-array-data v0, :array_8

    .line 186
    .line 187
    .line 188
    move-object/from16 v4, p3

    .line 189
    .line 190
    invoke-static {v4, v11, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 191
    .line 192
    .line 193
    move-result-object v7

    .line 194
    move-object v0, v3

    .line 195
    const-wide/16 v2, 0x12c

    .line 196
    .line 197
    invoke-virtual {v7, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 198
    .line 199
    .line 200
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 201
    .line 202
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v7, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 206
    .line 207
    .line 208
    move-object/from16 v2, p4

    .line 209
    .line 210
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 211
    .line 212
    iget-wide v2, v2, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->wealthRatio:D

    .line 213
    .line 214
    const-wide/high16 v16, 0x4059000000000000L    # 100.0

    .line 215
    .line 216
    mul-double v2, v2, v16

    .line 217
    .line 218
    double-to-int v2, v2

    .line 219
    const/4 v3, 0x0

    .line 220
    filled-new-array {v3, v2}, [I

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    const-wide/16 v3, 0xdc

    .line 229
    .line 230
    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 231
    .line 232
    .line 233
    move-result-object v8

    .line 234
    new-instance v2, Ll/yyb;

    .line 235
    .line 236
    invoke-direct {v2}, Ll/yyb;-><init>()V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v8, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 240
    .line 241
    .line 242
    const-wide/16 v2, 0xc8

    .line 243
    .line 244
    invoke-virtual {v8, v2, v3}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 245
    .line 246
    .line 247
    new-instance v2, Ll/lh4;

    .line 248
    .line 249
    invoke-direct {v2, v1}, Ll/lh4;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v8, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 253
    .line 254
    .line 255
    new-instance v11, Landroid/animation/AnimatorSet;

    .line 256
    .line 257
    invoke-direct {v11}, Landroid/animation/AnimatorSet;-><init>()V

    .line 258
    .line 259
    .line 260
    iput-object v11, v1, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->n:Landroid/animation/AnimatorSet;

    .line 261
    .line 262
    move-object v2, v0

    .line 263
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView$a;

    .line 264
    .line 265
    move-object/from16 v3, p3

    .line 266
    .line 267
    move/from16 v4, p5

    .line 268
    .line 269
    move-object/from16 p4, v8

    .line 270
    .line 271
    move-object v8, v2

    .line 272
    move-object/from16 v2, p2

    .line 273
    .line 274
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;Landroid/view/View;Landroid/view/View;ZLandroid/view/View;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {v11, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 278
    .line 279
    .line 280
    iget-object v0, v1, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->n:Landroid/animation/AnimatorSet;

    .line 281
    .line 282
    invoke-virtual {v0, v6}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    invoke-virtual {v0, v10}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    invoke-virtual {v0, v12}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-virtual {v0, v13}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    invoke-virtual {v0, v8}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-virtual {v0, v15}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    invoke-virtual {v0, v7}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    invoke-virtual {v0, v14}, Landroid/animation/AnimatorSet$Builder;->before(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    invoke-virtual {v0, v9}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 315
    .line 316
    .line 317
    if-eqz p5, :cond_0

    .line 318
    .line 319
    iget-object v0, v1, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->n:Landroid/animation/AnimatorSet;

    .line 320
    .line 321
    move-object/from16 v2, p4

    .line 322
    .line 323
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    invoke-virtual {v0, v14}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 328
    .line 329
    .line 330
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->n:Landroid/animation/AnimatorSet;

    .line 331
    .line 332
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 333
    .line 334
    .line 335
    return-void

    .line 336
    nop

    .line 337
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f59999a    # 0.85f
    .end array-data

    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f59999a    # 0.85f
    .end array-data

    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_3
    .array-data 4
        0x3f59999a    # 0.85f
        0x3f866666    # 1.05f
    .end array-data

    :array_4
    .array-data 4
        0x3f59999a    # 0.85f
        0x3f866666    # 1.05f
    .end array-data

    :array_5
    .array-data 4
        0x3f866666    # 1.05f
        0x3f800000    # 1.0f
    .end array-data

    :array_6
    .array-data 4
        0x3f866666    # 1.05f
        0x3f800000    # 1.0f
    .end array-data

    :array_7
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_8
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final E(J)I
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p0, p1, v0

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    sget p0, Ll/n9c0;->s:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const-wide/16 v0, 0x5

    .line 11
    .line 12
    cmp-long p0, p1, v0

    .line 13
    .line 14
    if-gez p0, :cond_1

    .line 15
    .line 16
    sget p0, Ll/n9c0;->l:I

    .line 17
    .line 18
    return p0

    .line 19
    :cond_1
    const-wide/16 v0, 0xa

    .line 20
    .line 21
    cmp-long p0, p1, v0

    .line 22
    .line 23
    if-gez p0, :cond_2

    .line 24
    .line 25
    sget p0, Ll/n9c0;->p:I

    .line 26
    .line 27
    return p0

    .line 28
    :cond_2
    const-wide/16 v0, 0x14

    .line 29
    .line 30
    cmp-long p0, p1, v0

    .line 31
    .line 32
    if-gez p0, :cond_3

    .line 33
    .line 34
    sget p0, Ll/n9c0;->t:I

    .line 35
    .line 36
    return p0

    .line 37
    :cond_3
    const-wide/16 v0, 0x1e

    .line 38
    .line 39
    cmp-long p0, p1, v0

    .line 40
    .line 41
    if-gez p0, :cond_4

    .line 42
    .line 43
    sget p0, Ll/n9c0;->m:I

    .line 44
    .line 45
    return p0

    .line 46
    :cond_4
    const-wide/16 v0, 0x28

    .line 47
    .line 48
    cmp-long p0, p1, v0

    .line 49
    .line 50
    if-gez p0, :cond_5

    .line 51
    .line 52
    sget p0, Ll/n9c0;->y:I

    .line 53
    .line 54
    return p0

    .line 55
    :cond_5
    const-wide/16 v0, 0x32

    .line 56
    .line 57
    cmp-long p0, p1, v0

    .line 58
    .line 59
    if-gez p0, :cond_6

    .line 60
    .line 61
    sget p0, Ll/n9c0;->I:I

    .line 62
    .line 63
    return p0

    .line 64
    :cond_6
    sget p0, Ll/n9c0;->U:I

    .line 65
    .line 66
    return p0
.end method

.method public final F(Ljava/lang/Long;)I
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    sget p0, Ll/n9c0;->e1:I

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    const-wide/16 v2, 0x5

    .line 19
    .line 20
    cmp-long p0, v0, v2

    .line 21
    .line 22
    if-gez p0, :cond_1

    .line 23
    .line 24
    sget p0, Ll/n9c0;->C:I

    .line 25
    .line 26
    return p0

    .line 27
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    const-wide/16 v2, 0xa

    .line 32
    .line 33
    cmp-long p0, v0, v2

    .line 34
    .line 35
    if-gez p0, :cond_2

    .line 36
    .line 37
    sget p0, Ll/n9c0;->E:I

    .line 38
    .line 39
    return p0

    .line 40
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    const-wide/16 v2, 0x14

    .line 45
    .line 46
    cmp-long p0, v0, v2

    .line 47
    .line 48
    if-gez p0, :cond_3

    .line 49
    .line 50
    sget p0, Ll/n9c0;->F:I

    .line 51
    .line 52
    return p0

    .line 53
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 54
    .line 55
    .line 56
    move-result-wide v0

    .line 57
    const-wide/16 v2, 0x1e

    .line 58
    .line 59
    cmp-long p0, v0, v2

    .line 60
    .line 61
    if-gez p0, :cond_4

    .line 62
    .line 63
    sget p0, Ll/n9c0;->Y:I

    .line 64
    .line 65
    return p0

    .line 66
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 67
    .line 68
    .line 69
    move-result-wide v0

    .line 70
    const-wide/16 v2, 0x28

    .line 71
    .line 72
    cmp-long p0, v0, v2

    .line 73
    .line 74
    if-gez p0, :cond_5

    .line 75
    .line 76
    sget p0, Ll/n9c0;->X:I

    .line 77
    .line 78
    return p0

    .line 79
    :cond_5
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 80
    .line 81
    .line 82
    move-result-wide p0

    .line 83
    const-wide/16 v0, 0x32

    .line 84
    .line 85
    cmp-long p0, p0, v0

    .line 86
    .line 87
    if-gez p0, :cond_6

    .line 88
    .line 89
    sget p0, Ll/n9c0;->g0:I

    .line 90
    .line 91
    return p0

    .line 92
    :cond_6
    sget p0, Ll/n9c0;->H0:I

    .line 93
    .line 94
    return p0
.end method

.method public final synthetic G(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->setShadowProgress(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic M()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->N(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final N(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/i9n;->b()Z

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    const-string p1, "https://auto.tancdn.com/v1/raw/e428f9b1-b6b8-406f-b35a-1532e6146fc611.pdf"

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p0, p1, v1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    const-string p1, "https://auto.tancdn.com/v1/raw/0fd04768-e495-4471-ba3f-728dad45e2fa11.pdf"

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    invoke-virtual {p0, p1, v1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->R()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->Q(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->P(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->a:Landroid/widget/RelativeLayout;

    .line 11
    .line 12
    new-instance p3, Ll/ih4;

    .line 13
    .line 14
    invoke-direct {p3, p0, p1}, Ll/ih4;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;Lcom/p1/mobile/putong/data/User;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->f:Landroid/widget/RelativeLayout;

    .line 21
    .line 22
    new-instance p3, Ll/jh4;

    .line 23
    .line 24
    invoke-direct {p3, p0, p1}, Ll/jh4;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;Lcom/p1/mobile/putong/data/User;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final P(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->h:Lv/VFrame;

    .line 2
    .line 3
    const/high16 v1, 0x41300000    # 11.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->j:Lv/VText;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 20
    .line 21
    .line 22
    iget-wide v2, v1, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->gap:J

    .line 23
    .line 24
    const-wide/32 v4, 0xf423f

    .line 25
    .line 26
    .line 27
    cmp-long v4, v2, v4

    .line 28
    .line 29
    const/4 v5, 0x0

    .line 30
    if-lez v4, :cond_0

    .line 31
    .line 32
    long-to-double v2, v2

    .line 33
    invoke-static {v2, v3}, Ll/yau;->c(D)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v2}, Ll/xau;->o(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const/4 v3, -0x1

    .line 42
    if-eq v2, v3, :cond_0

    .line 43
    .line 44
    new-instance v2, Landroid/text/SpannableString;

    .line 45
    .line 46
    iget-wide v6, v1, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->gap:J

    .line 47
    .line 48
    long-to-double v6, v6

    .line 49
    invoke-static {v6, v7}, Ll/yau;->c(D)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-direct {v2, v4}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    new-instance v4, Lv/text/CustomTypefaceSpan;

    .line 57
    .line 58
    sget v6, Ll/tak0;->p:I

    .line 59
    .line 60
    const-string v7, "sans-serif"

    .line 61
    .line 62
    invoke-direct {v4, v7, v0, v3, v6}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2}, Landroid/text/SpannableString;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    invoke-static {v6}, Ll/xau;->o(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v6

    .line 73
    const/16 v8, 0x12

    .line 74
    .line 75
    invoke-virtual {v2, v4, v5, v6, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 76
    .line 77
    .line 78
    new-instance v4, Lv/text/CustomTypefaceSpan;

    .line 79
    .line 80
    sget v6, Ll/tak0;->q:I

    .line 81
    .line 82
    invoke-direct {v4, v7, v0, v3, v6}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2}, Landroid/text/SpannableString;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-static {v0}, Ll/xau;->o(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    invoke-virtual {v2}, Landroid/text/SpannableString;->length()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    invoke-virtual {v2, v4, v0, v3, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->j:Lv/VText;

    .line 101
    .line 102
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->j:Lv/VText;

    .line 107
    .line 108
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->j:Lv/VText;

    .line 112
    .line 113
    iget-wide v2, v1, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->gap:J

    .line 114
    .line 115
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    :goto_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->g:Lv/VDraweeView;

    .line 127
    .line 128
    if-nez v0, :cond_1

    .line 129
    .line 130
    const-string v0, "context_livingAct"

    .line 131
    .line 132
    invoke-static {v0, v2, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->getDefaultCardBgDraw()Landroid/graphics/drawable/GradientDrawable;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-virtual {v2, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 141
    .line 142
    .line 143
    :goto_1
    invoke-direct {p0, v5}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->setShadowProgress(I)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 147
    .line 148
    iget-wide p1, p1, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->grade:J

    .line 149
    .line 150
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->E(J)I

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->i:Landroid/view/View;

    .line 155
    .line 156
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->O(ILandroid/view/View;)V

    .line 157
    .line 158
    .line 159
    iget-wide p1, v1, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->wealthRatio:D

    .line 160
    .line 161
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 162
    .line 163
    cmpl-double p1, p1, v0

    .line 164
    .line 165
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->k:Lv/VText;

    .line 166
    .line 167
    const/4 v0, 0x1

    .line 168
    if-nez p1, :cond_2

    .line 169
    .line 170
    invoke-static {p2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->j:Lv/VText;

    .line 174
    .line 175
    invoke-static {p1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 176
    .line 177
    .line 178
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->l:Lv/VText;

    .line 179
    .line 180
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :cond_2
    sget-object p1, Ll/htd0;->f:Ll/htd0;

    .line 185
    .line 186
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    check-cast p1, Ll/civ;

    .line 191
    .line 192
    invoke-virtual {p1}, Ll/civ;->n()Z

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    if-eqz p1, :cond_3

    .line 197
    .line 198
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->C9:I

    .line 199
    .line 200
    goto :goto_2

    .line 201
    :cond_3
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->A9:I

    .line 202
    .line 203
    :goto_2
    invoke-static {p1}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 208
    .line 209
    .line 210
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->k:Lv/VText;

    .line 211
    .line 212
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 213
    .line 214
    .line 215
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->j:Lv/VText;

    .line 216
    .line 217
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 218
    .line 219
    .line 220
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->l:Lv/VText;

    .line 221
    .line 222
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 223
    .line 224
    .line 225
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->c:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->iconUrl:Ljava/lang/String;

    .line 6
    .line 7
    const/high16 v2, 0x42380000    # 46.0f

    .line 8
    .line 9
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const-string v3, "context_livingAct"

    .line 14
    .line 15
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->d:Lv/VText;

    .line 19
    .line 20
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 21
    .line 22
    iget-wide v1, v1, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->grade:J

    .line 23
    .line 24
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->d:Lv/VText;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->d:Lv/VText;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 41
    .line 42
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->grade:J

    .line 43
    .line 44
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->F(Ljava/lang/Long;)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->b:Lv/VDraweeView;

    .line 64
    .line 65
    if-nez p1, :cond_0

    .line 66
    .line 67
    invoke-static {v3, v0, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->getDefaultCardBgDraw()Landroid/graphics/drawable/GradientDrawable;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 76
    .line 77
    .line 78
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->d:Lv/VText;

    .line 79
    .line 80
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->e:Lv/VMarqueeText;

    .line 81
    .line 82
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->M(Lv/VText;Lv/VText;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    new-instance p2, Ll/kh4;

    .line 90
    .line 91
    invoke-direct {p2, p0}, Ll/kh4;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;)V

    .line 92
    .line 93
    .line 94
    const-wide/16 v0, 0x1c2

    .line 95
    .line 96
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final R()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->a:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->f:Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->n:Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->n:Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->f:Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    const/high16 v1, 0x3f800000    # 1.0f

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->f:Landroid/widget/RelativeLayout;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->f:Landroid/widget/RelativeLayout;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->g:Lv/VDraweeView;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->a:Landroid/widget/RelativeLayout;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->a:Landroid/widget/RelativeLayout;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->a:Landroid/widget/RelativeLayout;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->b:Lv/VDraweeView;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->B(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 8
    .line 9
    const/high16 v0, 0x41800000    # 16.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {p0, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
