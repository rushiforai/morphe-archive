.class public Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VText;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VText;

.field public e:Lv/VImage;

.field public f:Landroid/animation/AnimatorSet;

.field public g:I

.field public h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->f:Landroid/animation/AnimatorSet;

    .line 6
    .line 7
    const/high16 p1, 0x427c0000    # 63.0f

    .line 8
    .line 9
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->g:I

    .line 14
    .line 15
    const/high16 p1, 0x43020000    # 130.0f

    .line 16
    .line 17
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->h:I

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->f:Landroid/animation/AnimatorSet;

    const/high16 p1, 0x427c0000    # 63.0f

    .line 26
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->g:I

    const/high16 p1, 0x43020000    # 130.0f

    .line 27
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->h:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->f:Landroid/animation/AnimatorSet;

    const/high16 p1, 0x427c0000    # 63.0f

    .line 30
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->g:I

    const/high16 p1, 0x43020000    # 130.0f

    .line 31
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->h:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->i(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Landroid/view/View$OnLongClickListener;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p0, p1}, Landroid/view/View$OnLongClickListener;->onLongClick(Landroid/view/View;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->k(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;JII)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->m(JII)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->j(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->l(I)V

    return-void
.end method

.method private setHeight(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->a:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 8
    .line 9
    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->a:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    sub-int/2addr v3, p1

    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->a:Landroid/widget/RelativeLayout;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    invoke-virtual {v1, v2, v3, p1, v4}, Landroid/view/View;->layout(IIII)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->a:Landroid/widget/RelativeLayout;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->b:Lv/VText;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->b:Lv/VText;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-nez p1, :cond_0

    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->b:Lv/VText;

    .line 57
    .line 58
    invoke-static {p1}, Ll/bnl0;->n0(Landroid/view/View;)V

    .line 59
    .line 60
    .line 61
    const/high16 p1, 0x41800000    # 16.0f

    .line 62
    .line 63
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->a:Landroid/widget/RelativeLayout;

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->b:Lv/VText;

    .line 74
    .line 75
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    sub-int/2addr v0, v1

    .line 80
    div-int/lit8 v0, v0, 0x2

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->b:Lv/VText;

    .line 83
    .line 84
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    add-int/2addr v2, v0

    .line 89
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->b:Lv/VText;

    .line 90
    .line 91
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    add-int/2addr v3, p1

    .line 96
    invoke-virtual {v1, v0, p1, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 97
    .line 98
    .line 99
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->c:Landroid/widget/LinearLayout;

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_1

    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->c:Landroid/widget/LinearLayout;

    .line 108
    .line 109
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->d:Lv/VText;

    .line 114
    .line 115
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-ge p1, v0, :cond_1

    .line 120
    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->c:Landroid/widget/LinearLayout;

    .line 122
    .line 123
    invoke-static {p1}, Ll/bnl0;->n0(Landroid/view/View;)V

    .line 124
    .line 125
    .line 126
    const/high16 p1, 0x42080000    # 34.0f

    .line 127
    .line 128
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->c:Landroid/widget/LinearLayout;

    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->a:Landroid/widget/RelativeLayout;

    .line 135
    .line 136
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->c:Landroid/widget/LinearLayout;

    .line 141
    .line 142
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    add-int/2addr v2, p1

    .line 147
    const/4 v3, 0x0

    .line 148
    invoke-virtual {v0, v3, p1, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->d:Lv/VText;

    .line 152
    .line 153
    invoke-static {p1}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->c:Landroid/widget/LinearLayout;

    .line 157
    .line 158
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->d:Lv/VText;

    .line 163
    .line 164
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    sub-int/2addr p1, v0

    .line 169
    div-int/lit8 p1, p1, 0x2

    .line 170
    .line 171
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->d:Lv/VText;

    .line 172
    .line 173
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    add-int/2addr v1, p1

    .line 178
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->d:Lv/VText;

    .line 179
    .line 180
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    invoke-virtual {v0, p1, v3, v1, p0}, Landroid/view/View;->layout(IIII)V

    .line 185
    .line 186
    .line 187
    :cond_1
    return-void
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lwl0;->a(Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->g:I

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->h:I

    .line 7
    .line 8
    return p0
.end method

.method public final synthetic i(Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->n(Z)Z

    .line 3
    .line 4
    .line 5
    invoke-interface {p1, p2}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic j(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->o(F)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ljava/lang/Integer;

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->setHeight(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic k(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sub-float/2addr v0, v1

    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->o(F)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->setHeight(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic l(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->o(F)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->setHeight(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic m(JII)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr v0, p1

    .line 6
    const-wide/16 p1, 0x64

    .line 7
    .line 8
    cmp-long p1, v0, p1

    .line 9
    .line 10
    if-gez p1, :cond_0

    .line 11
    .line 12
    const/high16 p1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->o(F)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, p3}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->setHeight(I)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->b:Lv/VText;

    .line 21
    .line 22
    new-instance p2, Ll/kwl0;

    .line 23
    .line 24
    invoke-direct {p2, p0, p4}, Ll/kwl0;-><init>(Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;I)V

    .line 25
    .line 26
    .line 27
    const-wide/16 p3, 0x1f4

    .line 28
    .line 29
    invoke-virtual {p1, p2, p3, p4}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public n(Z)Z
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->f:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/4 v0, 0x0

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->f:Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    return v0

    .line 22
    :cond_0
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 23
    .line 24
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->f:Landroid/animation/AnimatorSet;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->h(Z)I

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->h(Z)I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    filled-new-array {v7, v6}, [I

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-wide/16 v2, 0x12c

    .line 46
    .line 47
    invoke-virtual {p1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    .line 50
    sget-object v2, Lcom/sunshine/engine/base/InterpolatorType;->overshoot:Lcom/sunshine/engine/base/InterpolatorType;

    .line 51
    .line 52
    invoke-virtual {v2}, Lcom/sunshine/engine/base/InterpolatorType;->obtain()Landroid/view/animation/Interpolator;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {p1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 60
    .line 61
    .line 62
    move-result-wide v4

    .line 63
    new-instance v2, Ll/hwl0;

    .line 64
    .line 65
    invoke-direct {v2, p0}, Ll/hwl0;-><init>(Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 69
    .line 70
    .line 71
    filled-new-array {v6, v7}, [I

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 76
    .line 77
    .line 78
    move-result-object v8

    .line 79
    const-wide/16 v2, 0x1f4

    .line 80
    .line 81
    invoke-virtual {v8, v2, v3}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 82
    .line 83
    .line 84
    sget-object v2, Lcom/sunshine/engine/base/InterpolatorType;->accelerate:Lcom/sunshine/engine/base/InterpolatorType;

    .line 85
    .line 86
    invoke-virtual {v2}, Lcom/sunshine/engine/base/InterpolatorType;->obtain()Landroid/view/animation/Interpolator;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v8, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 91
    .line 92
    .line 93
    const-wide/16 v2, 0xc8

    .line 94
    .line 95
    invoke-virtual {v8, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 96
    .line 97
    .line 98
    new-instance v2, Ll/iwl0;

    .line 99
    .line 100
    invoke-direct {v2, p0}, Ll/iwl0;-><init>(Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v8, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 104
    .line 105
    .line 106
    new-instance v2, Ll/jwl0;

    .line 107
    .line 108
    move-object v3, p0

    .line 109
    invoke-direct/range {v2 .. v7}, Ll/jwl0;-><init>(Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;JII)V

    .line 110
    .line 111
    .line 112
    invoke-static {v8, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 113
    .line 114
    .line 115
    iget-object p0, v3, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->f:Landroid/animation/AnimatorSet;

    .line 116
    .line 117
    const/4 v2, 0x2

    .line 118
    new-array v2, v2, [Landroid/animation/Animator;

    .line 119
    .line 120
    aput-object p1, v2, v0

    .line 121
    .line 122
    aput-object v8, v2, v1

    .line 123
    .line 124
    invoke-virtual {p0, v2}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 125
    .line 126
    .line 127
    iget-object p0, v3, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->f:Landroid/animation/AnimatorSet;

    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 130
    .line 131
    .line 132
    return v1

    .line 133
    :cond_1
    move-object v3, p0

    .line 134
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    if-eqz p0, :cond_2

    .line 139
    .line 140
    iget-object p0, v3, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->f:Landroid/animation/AnimatorSet;

    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 143
    .line 144
    .line 145
    const/4 p0, 0x0

    .line 146
    iput-object p0, v3, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->f:Landroid/animation/AnimatorSet;

    .line 147
    .line 148
    :cond_2
    const/4 p0, 0x0

    .line 149
    invoke-virtual {v3, p0}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->o(F)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->h(Z)I

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->setHeight(I)V

    .line 157
    .line 158
    .line 159
    return v1
.end method

.method public final o(F)V
    .locals 5

    .line 1
    const v0, 0x3dcccccd    # 0.1f

    .line 2
    .line 3
    .line 4
    cmpl-float v1, p1, v0

    .line 5
    .line 6
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->b:Lv/VText;

    .line 7
    .line 8
    const/16 v3, 0x8

    .line 9
    .line 10
    if-lez v1, :cond_2

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->b:Lv/VText;

    .line 17
    .line 18
    sub-float v0, p1, v0

    .line 19
    .line 20
    const v4, 0x3f666666    # 0.9f

    .line 21
    .line 22
    .line 23
    div-float/2addr v0, v4

    .line 24
    invoke-virtual {v2, v0}, Landroid/view/View;->setAlpha(F)V

    .line 25
    .line 26
    .line 27
    const v0, 0x3e99999a    # 0.3f

    .line 28
    .line 29
    .line 30
    cmpl-float v2, p1, v0

    .line 31
    .line 32
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->c:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    if-lez v2, :cond_1

    .line 35
    .line 36
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    new-instance v2, Ljava/lang/StringBuffer;

    .line 43
    .line 44
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 51
    .line 52
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    const/4 v3, 0x3

    .line 68
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    const/16 v4, 0x12

    .line 73
    .line 74
    invoke-static {v4}, Ll/qa00;->f(I)I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-static {v2, v1, v3, v4}, Ll/q8g0;->O(Ljava/lang/String;ILandroid/graphics/Typeface;I)Landroid/text/SpannableStringBuilder;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->d:Lv/VText;

    .line 83
    .line 84
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->c:Landroid/widget/LinearLayout;

    .line 88
    .line 89
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->c:Landroid/widget/LinearLayout;

    .line 93
    .line 94
    sub-float/2addr p1, v0

    .line 95
    const v0, 0x3f333333    # 0.7f

    .line 96
    .line 97
    .line 98
    div-float/2addr p1, v0

    .line 99
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_1
    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_2
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->c:Landroid/widget/LinearLayout;

    .line 111
    .line 112
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setMaxHeight(I)V
    .locals 2

    .line 1
    const/high16 v0, 0x42c80000    # 100.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ge p1, v1, :cond_0

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->h:I

    .line 14
    .line 15
    return-void
.end method

.method public setMinHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->e:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/fwl0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/fwl0;-><init>(Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;Landroid/view/View$OnClickListener;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->e:Lv/VImage;

    .line 2
    .line 3
    new-instance v0, Ll/gwl0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/gwl0;-><init>(Landroid/view/View$OnLongClickListener;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
