.class public Ll/l8e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/osl;


# instance fields
.field public final a:Lv/VDraweeView;

.field public final b:Lv/VDraweeView;

.field public final c:Lv/VDraweeView;

.field public final d:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final e:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

.field public f:Ll/xyd0;

.field public final g:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xyd0;

    .line 5
    .line 6
    new-instance v1, Ljava/util/HashSet;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "down_box_guild"

    .line 12
    .line 13
    invoke-direct {v0, v2, v1}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/l8e;->f:Ll/xyd0;

    .line 17
    .line 18
    iput-object p1, p0, Ll/l8e;->e:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 19
    .line 20
    iput-object p2, p0, Ll/l8e;->a:Lv/VDraweeView;

    .line 21
    .line 22
    iput-object p3, p0, Ll/l8e;->b:Lv/VDraweeView;

    .line 23
    .line 24
    iput-object p4, p0, Ll/l8e;->c:Lv/VDraweeView;

    .line 25
    .line 26
    iput-object p5, p0, Ll/l8e;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    const/4 p2, 0x1

    .line 30
    filled-new-array {p1, p2}, [I

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ll/l8e;->g:Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    const-wide/16 p2, 0x1

    .line 41
    .line 42
    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static synthetic c(Ll/l8e;ILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/l8e;->n(ILandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic d(Ll/l8e;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l8e;->s()V

    return-void
.end method

.method public static synthetic e(Ll/l8e;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l8e;->o(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic f(Ll/l8e;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l8e;->l(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic g(Ll/l8e;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l8e;->t()V

    return-void
.end method

.method public static synthetic h(Ll/l8e;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l8e;->q(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic i(Ll/l8e;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l8e;->m()V

    return-void
.end method

.method public static synthetic j(Ll/l8e;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l8e;->r()V

    return-void
.end method

.method public static synthetic k(Ll/l8e;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l8e;->p(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public a()Landroid/animation/Animator;
    .locals 10

    .line 1
    iget-object v0, p0, Ll/l8e;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v1, v0, Landroid/view/View;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/l8e;->g:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    check-cast v0, Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget-object v2, p0, Ll/l8e;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    sub-int/2addr v1, v2

    .line 27
    new-instance v2, Ljava/util/Random;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 30
    .line 31
    .line 32
    iget-object v3, p0, Ll/l8e;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 33
    .line 34
    invoke-virtual {v2, v1}, Ljava/util/Random;->nextInt(I)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    int-to-float v1, v1

    .line 39
    invoke-virtual {v3, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    div-int/lit8 v1, v0, 0x2

    .line 47
    .line 48
    iget-object v2, p0, Ll/l8e;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 49
    .line 50
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    neg-int v2, v2

    .line 55
    filled-new-array {v2, v1}, [I

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    const-wide/16 v3, 0xed8

    .line 64
    .line 65
    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 66
    .line 67
    .line 68
    new-instance v3, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 69
    .line 70
    invoke-direct {v3}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 74
    .line 75
    .line 76
    new-instance v3, Ll/c8e;

    .line 77
    .line 78
    invoke-direct {v3, p0}, Ll/c8e;-><init>(Ll/l8e;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 82
    .line 83
    .line 84
    new-instance v3, Ll/d8e;

    .line 85
    .line 86
    invoke-direct {v3, p0}, Ll/d8e;-><init>(Ll/l8e;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v2, v3}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 90
    .line 91
    .line 92
    sget v5, Ll/qa00;->k:I

    .line 93
    .line 94
    const/4 v6, 0x0

    .line 95
    const/4 v8, 0x0

    .line 96
    const/4 v4, 0x0

    .line 97
    move v7, v5

    .line 98
    move v9, v5

    .line 99
    filled-new-array/range {v4 .. v9}, [I

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    const-wide/16 v6, 0x1388

    .line 108
    .line 109
    invoke-virtual {v3, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 110
    .line 111
    .line 112
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    .line 113
    .line 114
    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v3, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 118
    .line 119
    .line 120
    new-instance v4, Ll/e8e;

    .line 121
    .line 122
    invoke-direct {v4, p0, v1}, Ll/e8e;-><init>(Ll/l8e;I)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v3, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 126
    .line 127
    .line 128
    new-instance v4, Ll/f8e;

    .line 129
    .line 130
    invoke-direct {v4, p0}, Ll/f8e;-><init>(Ll/l8e;)V

    .line 131
    .line 132
    .line 133
    invoke-static {v3, v4}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 134
    .line 135
    .line 136
    sub-int/2addr v1, v5

    .line 137
    iget-object v4, p0, Ll/l8e;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 138
    .line 139
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    sub-int/2addr v0, v4

    .line 144
    const/high16 v4, 0x41800000    # 16.0f

    .line 145
    .line 146
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    add-int/2addr v0, v4

    .line 151
    filled-new-array {v1, v0}, [I

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    const-wide/16 v4, 0xbb8

    .line 160
    .line 161
    invoke-virtual {v0, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 162
    .line 163
    .line 164
    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 165
    .line 166
    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 170
    .line 171
    .line 172
    new-instance v1, Ll/g8e;

    .line 173
    .line 174
    invoke-direct {v1, p0}, Ll/g8e;-><init>(Ll/l8e;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 178
    .line 179
    .line 180
    const/4 v1, 0x2

    .line 181
    new-array v4, v1, [F

    .line 182
    .line 183
    fill-array-data v4, :array_0

    .line 184
    .line 185
    .line 186
    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    new-instance v5, Ll/h8e;

    .line 191
    .line 192
    invoke-direct {v5, p0}, Ll/h8e;-><init>(Ll/l8e;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 196
    .line 197
    .line 198
    const-wide/16 v5, 0x12c

    .line 199
    .line 200
    invoke-virtual {v4, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 201
    .line 202
    .line 203
    iget-object p0, p0, Ll/l8e;->e:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 204
    .line 205
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getBottomRemainDuration()J

    .line 206
    .line 207
    .line 208
    move-result-wide v5

    .line 209
    const-wide/16 v7, 0x3e8

    .line 210
    .line 211
    mul-long/2addr v5, v7

    .line 212
    invoke-virtual {v4, v5, v6}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 213
    .line 214
    .line 215
    const/4 p0, 0x4

    .line 216
    new-array p0, p0, [Landroid/animation/Animator;

    .line 217
    .line 218
    const/4 v5, 0x0

    .line 219
    aput-object v2, p0, v5

    .line 220
    .line 221
    const/4 v2, 0x1

    .line 222
    aput-object v3, p0, v2

    .line 223
    .line 224
    aput-object v0, p0, v1

    .line 225
    .line 226
    const/4 v0, 0x3

    .line 227
    aput-object v4, p0, v0

    .line 228
    .line 229
    invoke-static {p0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    return-object p0

    .line 234
    nop

    .line 235
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public b()Landroid/animation/Animator;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l8e;->a:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/l8e;->e:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getOuterVanishDynamic()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "context_livingAct"

    .line 10
    .line 11
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x3

    .line 15
    new-array v0, v0, [F

    .line 16
    .line 17
    fill-array-data v0, :array_0

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/k8e;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/k8e;-><init>(Ll/l8e;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 30
    .line 31
    .line 32
    const-wide/16 v1, 0x190

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    .line 37
    return-object v0

    .line 38
    nop

    .line 39
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f4ccccd    # 0.8f
        0x3f99999a    # 1.2f
    .end array-data
.end method

.method public final synthetic l(Landroid/animation/ValueAnimator;)V
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
    iget-object p0, p0, Ll/l8e;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 12
    .line 13
    int-to-float p1, p1

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic m()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l8e;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    neg-int v1, v1

    .line 8
    int-to-float v1, v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/l8e;->c:Lv/VDraweeView;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic n(ILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget-object p0, p0, Ll/l8e;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 12
    .line 13
    sub-int/2addr p1, p2

    .line 14
    int-to-float p1, p1

    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic o(Landroid/animation/ValueAnimator;)V
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
    iget-object p0, p0, Ll/l8e;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 12
    .line 13
    int-to-float p1, p1

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic p(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Ll/l8e;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic q(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Ll/l8e;->b:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/l8e;->b:Lv/VDraweeView;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic r()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/l8e;->f:Ll/xyd0;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/l8e;->c:Lv/VDraweeView;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public reset()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l8e;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/l8e;->b:Lv/VDraweeView;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/l8e;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/l8e;->c:Lv/VDraweeView;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/l8e;->b:Lv/VDraweeView;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/l8e;->a:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic s()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/l8e;->c:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final t()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/l8e;->f:Ll/xyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/HashSet;

    .line 8
    .line 9
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object v0, p0, Ll/l8e;->c:Lv/VDraweeView;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v3, p0, Ll/l8e;->c:Lv/VDraweeView;

    .line 29
    .line 30
    sget-object v4, Ll/zft;->r:Ljava/lang/String;

    .line 31
    .line 32
    new-instance v7, Ll/i8e;

    .line 33
    .line 34
    invoke-direct {v7, p0}, Ll/i8e;-><init>(Ll/l8e;)V

    .line 35
    .line 36
    .line 37
    new-instance v8, Ll/j8e;

    .line 38
    .line 39
    invoke-direct {v8, p0}, Ll/j8e;-><init>(Ll/l8e;)V

    .line 40
    .line 41
    .line 42
    const-string v2, "context_livingAct"

    .line 43
    .line 44
    const/4 v5, 0x1

    .line 45
    const/4 v6, 0x1

    .line 46
    invoke-static/range {v2 .. v8}, Ll/izs;->j(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IZLl/x20;Ll/x20;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method
