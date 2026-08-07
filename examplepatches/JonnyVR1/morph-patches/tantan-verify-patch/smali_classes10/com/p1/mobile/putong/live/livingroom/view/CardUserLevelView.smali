.class public Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;
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

.field public o:Ll/vak0;

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

.method private synthetic E(Landroid/animation/ValueAnimator;)V
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
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->setShadowProgress(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic F(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->f:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->b:Lv/VDraweeView;

    .line 6
    .line 7
    const/4 v5, 0x0

    .line 8
    move-object v0, p0

    .line 9
    move-object v4, p1

    .line 10
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->C(Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/data/User;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static M(Lv/VText;Lv/VText;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-string v0, "80"

    .line 6
    .line 7
    invoke-static {p0, v0}, Ll/n3d0;->j(ILjava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static O(ILandroid/view/View;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v1, 0x41300000    # 11.0f

    .line 7
    .line 8
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Ll/n3d0;->a(I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private R()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->f:Landroid/widget/RelativeLayout;

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

.method public static getDefaultCardBgDraw()Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const-string v1, "#242429"

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/gc2;->b(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    return-object v0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;Lcom/p1/mobile/putong/data/LiveUserLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->G(Lcom/p1/mobile/putong/data/LiveUserLevel;)V

    return-void
.end method

.method public static synthetic s(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method private setShadowProgress(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->a:Landroid/widget/RelativeLayout;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->a:Landroid/widget/RelativeLayout;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->i:Landroid/view/View;

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

.method public static synthetic u(Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->F(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->E(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;)Ll/vak0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->o:Ll/vak0;

    return-object p0
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->setShadowProgress(I)V

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mn4;->a(Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C(Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 20

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

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
    invoke-static {v6, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v7

    .line 19
    const-wide/16 v8, 0x12c

    .line 20
    .line 21
    invoke-virtual {v7, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

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
    invoke-virtual {v7, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

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
    const-string v5, "scaleY"

    .line 38
    .line 39
    invoke-static {v6, v5, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v10

    .line 43
    invoke-virtual {v10, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

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
    invoke-static {v6, v11, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 62
    .line 63
    .line 64
    move-result-object v12

    .line 65
    invoke-virtual {v12, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

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
    invoke-static {v2, v5, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

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
    invoke-virtual {v14, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

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
    invoke-static {v2, v5, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 144
    .line 145
    .line 146
    move-result-object v15

    .line 147
    invoke-virtual {v15, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

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
    invoke-virtual {v15, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

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
    move-result-object v4

    .line 167
    invoke-virtual {v4, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 168
    .line 169
    .line 170
    const-wide/16 v8, 0x64

    .line 171
    .line 172
    invoke-virtual {v4, v8, v9}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 173
    .line 174
    .line 175
    new-instance v5, Landroid/view/animation/LinearInterpolator;

    .line 176
    .line 177
    invoke-direct {v5}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v4, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

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
    move-object/from16 v5, p3

    .line 189
    .line 190
    invoke-static {v5, v11, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 191
    .line 192
    .line 193
    move-result-object v8

    .line 194
    move-object v0, v3

    .line 195
    const-wide/16 v2, 0x12c

    .line 196
    .line 197
    invoke-virtual {v8, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

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
    invoke-virtual {v8, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 206
    .line 207
    .line 208
    move-object/from16 v2, p4

    .line 209
    .line 210
    iget-object v3, v2, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 211
    .line 212
    iget-wide v2, v3, Lcom/p1/mobile/putong/data/LiveUserLevel;->wealthRatio:D

    .line 213
    .line 214
    const-wide/high16 v18, 0x4059000000000000L    # 100.0

    .line 215
    .line 216
    mul-double v2, v2, v18

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
    move-object v9, v4

    .line 229
    const-wide/16 v3, 0xdc

    .line 230
    .line 231
    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 232
    .line 233
    .line 234
    move-result-object v11

    .line 235
    new-instance v2, Ll/yyb;

    .line 236
    .line 237
    invoke-direct {v2}, Ll/yyb;-><init>()V

    .line 238
    .line 239
    .line 240
    invoke-virtual {v11, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 241
    .line 242
    .line 243
    const-wide/16 v2, 0xc8

    .line 244
    .line 245
    invoke-virtual {v11, v2, v3}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 246
    .line 247
    .line 248
    new-instance v2, Ll/hn4;

    .line 249
    .line 250
    invoke-direct {v2, v1}, Ll/hn4;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v11, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 254
    .line 255
    .line 256
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 257
    .line 258
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 259
    .line 260
    .line 261
    iput-object v2, v1, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->n:Landroid/animation/AnimatorSet;

    .line 262
    .line 263
    move-object v3, v0

    .line 264
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView$a;

    .line 265
    .line 266
    move/from16 v4, p5

    .line 267
    .line 268
    move-object/from16 v16, v11

    .line 269
    .line 270
    move-object/from16 v17, v15

    .line 271
    .line 272
    move-object v15, v2

    .line 273
    move-object v11, v9

    .line 274
    move-object/from16 v2, p2

    .line 275
    .line 276
    move-object v9, v3

    .line 277
    move-object v3, v5

    .line 278
    move-object/from16 v5, p4

    .line 279
    .line 280
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;Landroid/view/View;Landroid/view/View;ZLcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    .line 281
    .line 282
    .line 283
    invoke-virtual {v15, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 284
    .line 285
    .line 286
    iget-object v0, v1, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->n:Landroid/animation/AnimatorSet;

    .line 287
    .line 288
    invoke-virtual {v0, v7}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    invoke-virtual {v0, v10}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    invoke-virtual {v0, v12}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    invoke-virtual {v0, v13}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    invoke-virtual {v0, v9}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    invoke-virtual {v0, v11}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    invoke-virtual {v0, v8}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    invoke-virtual {v0, v14}, Landroid/animation/AnimatorSet$Builder;->before(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    move-object/from16 v2, v17

    .line 321
    .line 322
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 323
    .line 324
    .line 325
    if-eqz p5, :cond_0

    .line 326
    .line 327
    iget-object v0, v1, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->n:Landroid/animation/AnimatorSet;

    .line 328
    .line 329
    move-object/from16 v2, v16

    .line 330
    .line 331
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    invoke-virtual {v0, v14}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 336
    .line 337
    .line 338
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->n:Landroid/animation/AnimatorSet;

    .line 339
    .line 340
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 341
    .line 342
    .line 343
    return-void

    .line 344
    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f59999a    # 0.85f
    .end array-data

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

.method public final synthetic G(Lcom/p1/mobile/putong/data/LiveUserLevel;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->o:Ll/vak0;

    .line 8
    .line 9
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    iget-wide v6, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 12
    .line 13
    iget-wide v8, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->superGrade:J

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    const/4 v5, 0x0

    .line 17
    invoke-static/range {v2 .. v9}, Ll/ln4;->c(Ll/vak0;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;ZZJJ)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public K()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->p:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->g:Lv/VDraweeView;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->g:Lv/VDraweeView;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->p:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "context_livingAct"

    .line 20
    .line 21
    invoke-static {v1, v0, p0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->getDefaultCardBgDraw()Landroid/graphics/drawable/GradientDrawable;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/data/User;Ll/vak0;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {p2}, Ll/ln4;->a(Ll/vak0;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->o:Ll/vak0;

    .line 8
    .line 9
    :cond_0
    iput-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->p:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->R()V

    .line 12
    .line 13
    .line 14
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 15
    .line 16
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->P(Lcom/p1/mobile/putong/data/LiveUserLevel;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 20
    .line 21
    invoke-virtual {p0, p2, p4}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->N(Lcom/p1/mobile/putong/data/LiveUserLevel;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 25
    .line 26
    new-instance p3, Ll/in4;

    .line 27
    .line 28
    invoke-direct {p3, p5}, Ll/in4;-><init>(Ll/x20;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->f:Landroid/widget/RelativeLayout;

    .line 35
    .line 36
    new-instance p3, Ll/jn4;

    .line 37
    .line 38
    invoke-direct {p3, p0, p1}, Ll/jn4;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;Lcom/p1/mobile/putong/data/User;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final N(Lcom/p1/mobile/putong/data/LiveUserLevel;Ljava/lang/String;)V
    .locals 9

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->superGrade:J

    .line 2
    .line 3
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->j:Lv/VText;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->gap:J

    .line 12
    .line 13
    const-wide/32 v4, 0xf423f

    .line 14
    .line 15
    .line 16
    cmp-long v4, v2, v4

    .line 17
    .line 18
    const/4 v5, 0x0

    .line 19
    if-lez v4, :cond_0

    .line 20
    .line 21
    long-to-double v2, v2

    .line 22
    invoke-static {v2, v3}, Ll/yau;->c(D)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v2}, Ll/xau;->o(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/4 v3, -0x1

    .line 31
    if-eq v2, v3, :cond_0

    .line 32
    .line 33
    new-instance v2, Landroid/text/SpannableString;

    .line 34
    .line 35
    iget-wide v3, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->gap:J

    .line 36
    .line 37
    long-to-double v3, v3

    .line 38
    invoke-static {v3, v4}, Ll/yau;->c(D)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-direct {v2, v3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    sget v4, Ll/n9c0;->w1:I

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    new-instance v4, Lv/text/CustomTypefaceSpan;

    .line 60
    .line 61
    sget v6, Ll/tak0;->p:I

    .line 62
    .line 63
    const-string v7, "sans-serif"

    .line 64
    .line 65
    invoke-direct {v4, v7, p2, v3, v6}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Landroid/text/SpannableString;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    invoke-static {v6}, Ll/xau;->o(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    const/16 v8, 0x12

    .line 77
    .line 78
    invoke-virtual {v2, v4, v5, v6, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 79
    .line 80
    .line 81
    new-instance v4, Lv/text/CustomTypefaceSpan;

    .line 82
    .line 83
    sget v6, Ll/tak0;->q:I

    .line 84
    .line 85
    invoke-direct {v4, v7, p2, v3, v6}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v2}, Landroid/text/SpannableString;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-static {p2}, Ll/xau;->o(Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    invoke-virtual {v2}, Landroid/text/SpannableString;->length()I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    invoke-virtual {v2, v4, p2, v3, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 101
    .line 102
    .line 103
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->j:Lv/VText;

    .line 104
    .line 105
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->j:Lv/VText;

    .line 110
    .line 111
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 112
    .line 113
    .line 114
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->j:Lv/VText;

    .line 115
    .line 116
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->gap:J

    .line 117
    .line 118
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    :goto_0
    const-wide/16 v2, 0x0

    .line 126
    .line 127
    cmp-long p2, v0, v2

    .line 128
    .line 129
    if-lez p2, :cond_1

    .line 130
    .line 131
    invoke-direct {p0, v5}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->setShadowProgress(I)V

    .line 132
    .line 133
    .line 134
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->o:Ll/vak0;

    .line 135
    .line 136
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 137
    .line 138
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->i:Landroid/view/View;

    .line 139
    .line 140
    invoke-static {p2, v5, v0, v1, v2}, Ll/ln4;->f(Ll/vak0;ZJLandroid/view/View;)V

    .line 141
    .line 142
    .line 143
    iget-wide p1, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->wealthRatio:D

    .line 144
    .line 145
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 146
    .line 147
    cmpl-double p1, p1, v0

    .line 148
    .line 149
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->k:Lv/VText;

    .line 150
    .line 151
    const/4 v0, 0x1

    .line 152
    if-nez p1, :cond_2

    .line 153
    .line 154
    invoke-static {p2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->j:Lv/VText;

    .line 158
    .line 159
    invoke-static {p1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->l:Lv/VText;

    .line 163
    .line 164
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_2
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->j:Lv/VText;

    .line 172
    .line 173
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 174
    .line 175
    .line 176
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->l:Lv/VText;

    .line 177
    .line 178
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 179
    .line 180
    .line 181
    return-void
.end method

.method public final P(Lcom/p1/mobile/putong/data/LiveUserLevel;Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->c:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->iconUrl:Ljava/lang/String;

    .line 4
    .line 5
    const/high16 v2, 0x42380000    # 46.0f

    .line 6
    .line 7
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const-string v3, "context_livingAct"

    .line 12
    .line 13
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->d:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 21
    .line 22
    .line 23
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->superGrade:J

    .line 24
    .line 25
    const-wide/16 v4, 0x0

    .line 26
    .line 27
    cmp-long v2, v0, v4

    .line 28
    .line 29
    if-lez v2, :cond_1

    .line 30
    .line 31
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->b:Lv/VDraweeView;

    .line 36
    .line 37
    if-nez v4, :cond_0

    .line 38
    .line 39
    invoke-static {v3, v5, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->getDefaultCardBgDraw()Landroid/graphics/drawable/GradientDrawable;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {v5, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->b:Lv/VDraweeView;

    .line 56
    .line 57
    if-nez v4, :cond_2

    .line 58
    .line 59
    invoke-static {v3, v5, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->getDefaultCardBgDraw()Landroid/graphics/drawable/GradientDrawable;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {v5, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->o:Ll/vak0;

    .line 71
    .line 72
    const/4 v3, 0x0

    .line 73
    if-lez v2, :cond_3

    .line 74
    .line 75
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->d:Lv/VText;

    .line 76
    .line 77
    invoke-static {p2, v3, v2}, Ll/ln4;->h(Ll/vak0;ZLandroid/widget/TextView;)V

    .line 78
    .line 79
    .line 80
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->e:Lv/VMarqueeText;

    .line 81
    .line 82
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ue:I

    .line 83
    .line 84
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(I)V

    .line 85
    .line 86
    .line 87
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->d:Lv/VText;

    .line 88
    .line 89
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_3
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 98
    .line 99
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->d:Lv/VText;

    .line 100
    .line 101
    invoke-static {p2, v3, v0, v1, v2}, Ll/ln4;->g(Ll/vak0;ZJLandroid/widget/TextView;)V

    .line 102
    .line 103
    .line 104
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->e:Lv/VMarqueeText;

    .line 105
    .line 106
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ve:I

    .line 107
    .line 108
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 109
    .line 110
    .line 111
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->d:Lv/VText;

    .line 112
    .line 113
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 114
    .line 115
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->d:Lv/VText;

    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->e:Lv/VMarqueeText;

    .line 125
    .line 126
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->Q(Lv/VText;Lv/VText;)V

    .line 127
    .line 128
    .line 129
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 130
    .line 131
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    new-instance v0, Ll/kn4;

    .line 139
    .line 140
    invoke-direct {v0, p0, p1}, Ll/kn4;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;Lcom/p1/mobile/putong/data/LiveUserLevel;)V

    .line 141
    .line 142
    .line 143
    const-wide/16 p0, 0x1c2

    .line 144
    .line 145
    invoke-static {p2, v0, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public Q(Lv/VText;Lv/VText;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->o:Ll/vak0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ln4;->a(Ll/vak0;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->o:Ll/vak0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->textColor:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->o:Ll/vak0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->textColor:Ljava/lang/String;

    .line 30
    .line 31
    sget p1, Ll/n9c0;->w1:I

    .line 32
    .line 33
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-static {p0, p1}, Ll/n3d0;->h(Ljava/lang/String;I)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    invoke-virtual {p1}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    const-string p1, "80"

    .line 50
    .line 51
    invoke-static {p0, p1}, Ll/n3d0;->j(ILjava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->K()V

    .line 2
    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 5
    .line 6
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->f:Landroid/widget/RelativeLayout;

    .line 7
    .line 8
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->g:Lv/VDraweeView;

    .line 9
    .line 10
    const/4 v5, 0x1

    .line 11
    move-object v0, p0

    .line 12
    move-object v4, p1

    .line 13
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->C(Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/data/User;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->n:Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->f:Landroid/widget/RelativeLayout;

    .line 10
    .line 11
    const/high16 v1, 0x3f800000    # 1.0f

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->f:Landroid/widget/RelativeLayout;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->f:Landroid/widget/RelativeLayout;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->g:Lv/VDraweeView;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->b:Lv/VDraweeView;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->B(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
