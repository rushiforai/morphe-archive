.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/PopupWindow;

.field public b:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/ygn;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/ygn;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;->b:Ljava/lang/Runnable;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ll/ygn;

    invoke-direct {p1, p0}, Ll/ygn;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;->b:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ll/ygn;

    invoke-direct {p1, p0}, Ll/ygn;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;->b:Ljava/lang/Runnable;

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;->u()V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;->v()V

    return-void
.end method

.method private synthetic u()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;->a:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;->a:Landroid/widget/PopupWindow;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;->b:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic v()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;->a:Landroid/widget/PopupWindow;

    .line 3
    .line 4
    return-void
.end method

.method public w(Landroid/view/View;)V
    .locals 6

    .line 1
    new-instance v0, Landroid/widget/PopupWindow;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    invoke-direct {v0, p0, v1, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;->a:Landroid/widget/PopupWindow;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;->a:Landroid/widget/PopupWindow;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;->a:Landroid/widget/PopupWindow;

    .line 20
    .line 21
    new-instance v2, Ll/zgn;

    .line 22
    .line 23
    invoke-direct {v2, p0}, Ll/zgn;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 27
    .line 28
    .line 29
    const/high16 v0, 0x43260000    # 166.0f

    .line 30
    .line 31
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-static {v0}, Ll/dox;->b(I)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/high16 v2, 0x42700000    # 60.0f

    .line 40
    .line 41
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-static {v2}, Ll/dox;->b(I)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-virtual {p0, v0, v2}, Landroid/view/View;->measure(II)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    neg-int v0, v0

    .line 57
    const/4 v2, 0x2

    .line 58
    div-int/2addr v0, v2

    .line 59
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    div-int/2addr v3, v2

    .line 64
    add-int/2addr v0, v3

    .line 65
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    add-int/2addr v3, v4

    .line 74
    neg-int v3, v3

    .line 75
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;->a:Landroid/widget/PopupWindow;

    .line 76
    .line 77
    const/16 v5, 0x30

    .line 78
    .line 79
    invoke-static {v4, p1, v0, v3, v5}, Ll/kl80;->c(Landroid/widget/PopupWindow;Landroid/view/View;III)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getMinimumHeight()I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    neg-int p1, p1

    .line 87
    int-to-float p1, p1

    .line 88
    new-array v0, v2, [F

    .line 89
    .line 90
    const/4 v3, 0x0

    .line 91
    aput p1, v0, v3

    .line 92
    .line 93
    const/4 p1, 0x0

    .line 94
    aput p1, v0, v1

    .line 95
    .line 96
    const-string p1, "translationY"

    .line 97
    .line 98
    invoke-static {p0, p1, v0}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    new-array v0, v2, [F

    .line 103
    .line 104
    fill-array-data v0, :array_0

    .line 105
    .line 106
    .line 107
    const-string v1, "alpha"

    .line 108
    .line 109
    invoke-static {p0, v1, v0}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 114
    .line 115
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 116
    .line 117
    .line 118
    const-wide/16 v2, 0x12c

    .line 119
    .line 120
    filled-new-array {p1, v0}, [Landroid/animation/Animator;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-static {v1, v2, v3, p1}, Ll/gt0;->y(Landroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;->b:Ljava/lang/Runnable;

    .line 136
    .line 137
    const-wide/16 v0, 0xbb8

    .line 138
    .line 139
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
