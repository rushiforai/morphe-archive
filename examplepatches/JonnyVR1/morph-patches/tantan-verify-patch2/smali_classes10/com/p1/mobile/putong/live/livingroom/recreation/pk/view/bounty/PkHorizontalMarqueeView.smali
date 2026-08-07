.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;
.super Landroid/widget/HorizontalScrollView;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Ljava/lang/String;

.field public f:Landroid/animation/Animator;

.field public g:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 62
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->f:Landroid/animation/Animator;

    .line 6
    .line 7
    sget-object p3, Ll/vhc0;->r:[I

    .line 8
    .line 9
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget p2, Ll/vhc0;->v:I

    .line 14
    .line 15
    const/4 p3, 0x0

    .line 16
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->a:I

    .line 21
    .line 22
    sget p2, Ll/vhc0;->x:I

    .line 23
    .line 24
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->b:I

    .line 29
    .line 30
    sget p2, Ll/vhc0;->s:I

    .line 31
    .line 32
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->c:I

    .line 37
    .line 38
    sget p2, Ll/vhc0;->t:I

    .line 39
    .line 40
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->d:I

    .line 45
    .line 46
    sget p2, Ll/vhc0;->w:I

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->e:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->c()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->d()V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->f:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final c()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setHorizontalScrollBarEnabled(Z)V

    .line 3
    .line 4
    .line 5
    const/high16 v0, 0x41600000    # 14.0f

    .line 6
    .line 7
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setFadingEdgeLength(I)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-virtual {p0, v0}, Landroid/view/View;->setHorizontalFadingEdgeEnabled(Z)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 28
    .line 29
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 30
    .line 31
    const/4 v2, -0x1

    .line 32
    const/4 v3, -0x2

    .line 33
    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 37
    .line 38
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->b:I

    .line 39
    .line 40
    int-to-float v3, v3

    .line 41
    const/4 v4, 0x2

    .line 42
    invoke-virtual {v2, v4, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 46
    .line 47
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->a:I

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 53
    .line 54
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->e:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 60
    .line 61
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 65
    .line 66
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->c:I

    .line 67
    .line 68
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 69
    .line 70
    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 72
    .line 73
    const/16 v3, 0x11

    .line 74
    .line 75
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 76
    .line 77
    .line 78
    const/16 v2, 0x10

    .line 79
    .line 80
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 81
    .line 82
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 83
    .line 84
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final synthetic d()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public e(ILjava/lang/Runnable;)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-virtual {v2, v1, v1}, Landroid/view/View;->measure(II)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/high16 v2, 0x42c00000    # 96.0f

    .line 25
    .line 26
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/4 v3, 0x2

    .line 31
    if-le v1, v2, :cond_1

    .line 32
    .line 33
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->f:Landroid/animation/Animator;

    .line 34
    .line 35
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->f:Landroid/animation/Animator;

    .line 42
    .line 43
    invoke-virtual {v4}, Landroid/animation/Animator;->cancel()V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->d:I

    .line 47
    .line 48
    int-to-float v4, v4

    .line 49
    add-int v5, v1, v2

    .line 50
    .line 51
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    int-to-float v5, v5

    .line 56
    const/high16 v6, 0x42400000    # 48.0f

    .line 57
    .line 58
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    int-to-float v6, v6

    .line 63
    div-float/2addr v5, v6

    .line 64
    mul-float/2addr v4, v5

    .line 65
    float-to-long v9, v4

    .line 66
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 67
    .line 68
    int-to-long v7, p1

    .line 69
    new-instance v11, Landroid/view/animation/LinearInterpolator;

    .line 70
    .line 71
    invoke-direct {v11}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 72
    .line 73
    .line 74
    int-to-float p1, v2

    .line 75
    neg-int v1, v1

    .line 76
    int-to-float v1, v1

    .line 77
    new-array v12, v3, [F

    .line 78
    .line 79
    aput p1, v12, v0

    .line 80
    .line 81
    const/4 p1, 0x1

    .line 82
    aput v1, v12, p1

    .line 83
    .line 84
    const-string v6, "translationX"

    .line 85
    .line 86
    invoke-static/range {v5 .. v12}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->f:Landroid/animation/Animator;

    .line 91
    .line 92
    new-instance v0, Ll/jx70;

    .line 93
    .line 94
    invoke-direct {v0, p0}, Ll/jx70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p1, v0}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 102
    .line 103
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    .line 104
    .line 105
    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 106
    .line 107
    .line 108
    new-array v8, v3, [F

    .line 109
    .line 110
    fill-array-data v8, :array_0

    .line 111
    .line 112
    .line 113
    const-string v2, "translationX"

    .line 114
    .line 115
    const-wide/16 v3, 0x9c4

    .line 116
    .line 117
    const-wide/16 v5, 0x0

    .line 118
    .line 119
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->f:Landroid/animation/Animator;

    .line 124
    .line 125
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 126
    .line 127
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 128
    .line 129
    .line 130
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->f:Landroid/animation/Animator;

    .line 131
    .line 132
    invoke-static {p1, p2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->f:Landroid/animation/Animator;

    .line 136
    .line 137
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public getLeftFadingEdgeStrength()F
    .locals 0

    const/high16 p0, 0x3f800000    # 1.0f

    return p0
.end method

.method public getMarqueeText()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setAnimDuration(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public setMarqueeText(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
