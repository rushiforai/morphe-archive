.class public Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VMarqueeText;

.field public g:Landroid/widget/RelativeLayout;

.field public h:Lv/VDraweeView;

.field public i:Lv/VFrame;

.field public j:Landroid/view/View;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public o:Landroid/animation/AnimatorSet;

.field public p:Ljava/lang/String;


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

.method private synthetic G(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->g:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->a:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->b:Lv/VDraweeView;

    .line 6
    .line 7
    const/4 v5, 0x0

    .line 8
    move-object v0, p0

    .line 9
    move-object v4, p1

    .line 10
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->C(Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/data/User;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private P()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->a:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->g:Landroid/widget/RelativeLayout;

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

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->E(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;ZLl/x20;ZLcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->F(ZLl/x20;ZLcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method private setShadowProgress(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->a:Landroid/widget/RelativeLayout;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->a:Landroid/widget/RelativeLayout;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->j:Landroid/view/View;

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

.method public static synthetic u(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->G(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->p:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->K(Ljava/lang/String;Z)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->setShadowProgress(I)V

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ok4;->a(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;Landroid/view/View;)V

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
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 211
    .line 212
    iget-wide v2, v2, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealthRatio:D

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
    new-instance v2, Ll/nk4;

    .line 248
    .line 249
    invoke-direct {v2, v1}, Ll/nk4;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;)V

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
    iput-object v11, v1, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->o:Landroid/animation/AnimatorSet;

    .line 261
    .line 262
    move-object v2, v0

    .line 263
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;

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
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;Landroid/view/View;Landroid/view/View;ZLandroid/view/View;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {v11, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 278
    .line 279
    .line 280
    iget-object v0, v1, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->o:Landroid/animation/AnimatorSet;

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
    iget-object v0, v1, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->o:Landroid/animation/AnimatorSet;

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
    iget-object v0, v1, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->o:Landroid/animation/AnimatorSet;

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

.method public final synthetic E(Landroid/animation/ValueAnimator;)V
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
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->setShadowProgress(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic F(ZLl/x20;ZLcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p2}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    if-nez p3, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->a:Landroid/widget/RelativeLayout;

    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->g:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->h:Lv/VDraweeView;

    .line 14
    .line 15
    const/4 p5, 0x1

    .line 16
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->C(Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/data/User;Z)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public final K(Ljava/lang/String;Z)V
    .locals 1

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
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    const-string v0, "pink"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_5

    .line 25
    .line 26
    const-string v0, "green"

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_3

    .line 33
    .line 34
    if-eqz p2, :cond_2

    .line 35
    .line 36
    const-string p1, "https://auto.tancdn.com/v1/raw/da1c92bb-10bd-4be5-8a7c-484a3114fc3f10.pdf"

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    const-string p1, "https://auto.tancdn.com/v1/raw/325aa354-d86c-4da9-94d7-ab96d03ed2d810.pdf"

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_3
    if-eqz p2, :cond_4

    .line 43
    .line 44
    const-string p1, "https://auto.tancdn.com/v1/raw/8fcfec5b-586e-4d47-907b-4f154ef82d2711.pdf"

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_4
    const-string p1, "https://auto.tancdn.com/v1/raw/7230e9c7-c2d9-4271-8382-a65a804a3aab10.pdf"

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_5
    if-eqz p2, :cond_6

    .line 51
    .line 52
    const-string p1, "https://auto.tancdn.com/v1/raw/85069e36-7e42-44ca-a1ed-1d0c154ccfdb10.pdf"

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_6
    const-string p1, "https://auto.tancdn.com/v1/raw/06c77811-480d-45d2-a0fa-4f93d71b6ab610.pdf"

    .line 56
    .line 57
    :goto_1
    if-eqz p2, :cond_7

    .line 58
    .line 59
    const/4 p2, 0x1

    .line 60
    goto :goto_2

    .line 61
    :cond_7
    const/4 p2, 0x2

    .line 62
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 63
    .line 64
    const/4 v0, 0x0

    .line 65
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;Ll/x20;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->P()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2, p4, p6}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->O(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1, p3, p6}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->M(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->a:Landroid/widget/RelativeLayout;

    .line 11
    .line 12
    new-instance v0, Ll/lk4;

    .line 13
    .line 14
    move-object v1, p0

    .line 15
    move-object v5, p1

    .line 16
    move v4, p4

    .line 17
    move v2, p5

    .line 18
    move-object v3, p7

    .line 19
    invoke-direct/range {v0 .. v5}, Ll/lk4;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;ZLl/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, v1, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->g:Landroid/widget/RelativeLayout;

    .line 26
    .line 27
    new-instance p1, Ll/mk4;

    .line 28
    .line 29
    invoke-direct {p1, v1, v5}, Ll/mk4;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;Lcom/p1/mobile/putong/data/User;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final M(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->i:Lv/VFrame;

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
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->k:Lv/VText;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 20
    .line 21
    .line 22
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->gap:J

    .line 23
    .line 24
    const-wide/32 v3, 0xf423f

    .line 25
    .line 26
    .line 27
    cmp-long v3, v1, v3

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    if-lez v3, :cond_0

    .line 31
    .line 32
    long-to-double v1, v1

    .line 33
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1}, Ll/xau;->o(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const/4 v2, -0x1

    .line 42
    if-eq v1, v2, :cond_0

    .line 43
    .line 44
    new-instance v1, Landroid/text/SpannableString;

    .line 45
    .line 46
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->gap:J

    .line 47
    .line 48
    long-to-double v5, v5

    .line 49
    invoke-static {v5, v6}, Ll/yau;->c(D)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-direct {v1, v3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    new-instance v3, Lv/text/CustomTypefaceSpan;

    .line 57
    .line 58
    sget v5, Ll/tak0;->p:I

    .line 59
    .line 60
    const-string v6, "sans-serif"

    .line 61
    .line 62
    invoke-direct {v3, v6, v0, v2, v5}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Landroid/text/SpannableString;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    invoke-static {v5}, Ll/xau;->o(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    const/16 v7, 0x12

    .line 74
    .line 75
    invoke-virtual {v1, v3, v4, v5, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 76
    .line 77
    .line 78
    new-instance v3, Lv/text/CustomTypefaceSpan;

    .line 79
    .line 80
    sget v5, Ll/tak0;->q:I

    .line 81
    .line 82
    invoke-direct {v3, v6, v0, v2, v5}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1}, Landroid/text/SpannableString;->toString()Ljava/lang/String;

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
    invoke-virtual {v1}, Landroid/text/SpannableString;->length()I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    invoke-virtual {v1, v3, v0, v2, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->k:Lv/VText;

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->k:Lv/VText;

    .line 107
    .line 108
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->k:Lv/VText;

    .line 112
    .line 113
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->gap:J

    .line 114
    .line 115
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->h:Lv/VDraweeView;

    .line 127
    .line 128
    if-nez v0, :cond_1

    .line 129
    .line 130
    const-string v0, "context_livingAct"

    .line 131
    .line 132
    invoke-static {v0, v1, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

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
    invoke-virtual {v1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 141
    .line 142
    .line 143
    :goto_1
    invoke-direct {p0, v4}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->setShadowProgress(I)V

    .line 144
    .line 145
    .line 146
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->j:Landroid/view/View;

    .line 147
    .line 148
    invoke-virtual {p0, p3, p2}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->N(Ljava/lang/String;Landroid/view/View;)V

    .line 149
    .line 150
    .line 151
    iget-wide p1, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealthRatio:D

    .line 152
    .line 153
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 154
    .line 155
    cmpl-double p1, p1, v0

    .line 156
    .line 157
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->l:Lv/VText;

    .line 158
    .line 159
    const/4 p3, 0x1

    .line 160
    if-nez p1, :cond_2

    .line 161
    .line 162
    invoke-static {p2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->k:Lv/VText;

    .line 166
    .line 167
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 168
    .line 169
    .line 170
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->m:Lv/VText;

    .line 171
    .line 172
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_2
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->k:Lv/VText;

    .line 180
    .line 181
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->m:Lv/VText;

    .line 185
    .line 186
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public final N(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    const-string p0, "pink"

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_2

    .line 18
    .line 19
    const-string p0, "green"

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_1

    .line 26
    .line 27
    const-string p0, "#FF9A0E"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const-string p0, "#07C26D"

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    const-string p0, "#F83899"

    .line 34
    .line 35
    :goto_0
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    .line 36
    .line 37
    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 38
    .line 39
    .line 40
    const/high16 v0, 0x41800000    # 16.0f

    .line 41
    .line 42
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    int-to-float v0, v0

    .line 47
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 48
    .line 49
    .line 50
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 4

    .line 1
    iput-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->p:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->c:Lv/VDraweeView;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->iconUrl:Ljava/lang/String;

    .line 8
    .line 9
    const/high16 v2, 0x42380000    # 46.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const-string v3, "context_livingAct"

    .line 16
    .line 17
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->d:Lv/VText;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->e:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {p0, p1, p3, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->Q(Lcom/p1/mobile/putong/data/LiveFansClubLevel;ZLv/VText;Lv/VText;)V

    .line 25
    .line 26
    .line 27
    sget-object p3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->d:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 32
    .line 33
    .line 34
    iget-object p3, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    if-nez p3, :cond_0

    .line 41
    .line 42
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->d:Lv/VText;

    .line 43
    .line 44
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 51
    .line 52
    .line 53
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->e:Lv/VText;

    .line 54
    .line 55
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 62
    .line 63
    .line 64
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->b:Lv/VDraweeView;

    .line 69
    .line 70
    if-nez p3, :cond_1

    .line 71
    .line 72
    invoke-static {v3, v0, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->getDefaultCardBgDraw()Landroid/graphics/drawable/GradientDrawable;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-virtual {v0, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 81
    .line 82
    .line 83
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->f:Lv/VMarqueeText;

    .line 84
    .line 85
    iget-object p1, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->d:Lv/VText;

    .line 91
    .line 92
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->f:Lv/VMarqueeText;

    .line 93
    .line 94
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->M(Lv/VText;Lv/VText;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$a;

    .line 102
    .line 103
    invoke-direct {p2, p0, p4}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    const-wide/16 p3, 0x1c2

    .line 107
    .line 108
    invoke-static {p1, p2, p3, p4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/data/LiveFansClubLevel;ZLv/VText;Lv/VText;)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x2710

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->memberCount:J

    .line 6
    .line 7
    cmp-long p0, v2, v0

    .line 8
    .line 9
    if-ltz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p4, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Me:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ne:I

    .line 27
    .line 28
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    :goto_1
    invoke-virtual {p4, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    if-eqz p2, :cond_3

    .line 36
    .line 37
    iget-wide p0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->memberCount:J

    .line 38
    .line 39
    cmp-long p2, p0, v0

    .line 40
    .line 41
    if-ltz p2, :cond_2

    .line 42
    .line 43
    div-long/2addr p0, v0

    .line 44
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    goto :goto_2

    .line 49
    :cond_2
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    :goto_2
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    iget-wide p0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->grade:J

    .line 58
    .line 59
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->o:Landroid/animation/AnimatorSet;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->o:Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->g:Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    const/high16 v1, 0x3f800000    # 1.0f

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->g:Landroid/widget/RelativeLayout;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->g:Landroid/widget/RelativeLayout;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->h:Lv/VDraweeView;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->a:Landroid/widget/RelativeLayout;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->a:Landroid/widget/RelativeLayout;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->a:Landroid/widget/RelativeLayout;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->b:Lv/VDraweeView;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->B(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

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
