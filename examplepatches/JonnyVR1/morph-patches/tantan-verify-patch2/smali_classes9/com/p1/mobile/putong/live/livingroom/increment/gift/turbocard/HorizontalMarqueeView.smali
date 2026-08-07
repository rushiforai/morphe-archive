.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;
.super Landroid/widget/HorizontalScrollView;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Ljava/lang/String;

.field public f:Landroid/animation/ObjectAnimator;

.field public g:Landroid/widget/TextView;

.field public h:I

.field public i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 83
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 82
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->f:Landroid/animation/ObjectAnimator;

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
    const-string p3, "#ffffffff"

    .line 16
    .line 17
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->a:I

    .line 26
    .line 27
    sget p2, Ll/vhc0;->x:I

    .line 28
    .line 29
    const/16 p3, 0xc

    .line 30
    .line 31
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->b:I

    .line 36
    .line 37
    sget p2, Ll/vhc0;->s:I

    .line 38
    .line 39
    const/4 p3, 0x0

    .line 40
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->c:I

    .line 45
    .line 46
    sget p2, Ll/vhc0;->t:I

    .line 47
    .line 48
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->d:I

    .line 53
    .line 54
    sget p2, Ll/vhc0;->w:I

    .line 55
    .line 56
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->e:Ljava/lang/String;

    .line 61
    .line 62
    sget p2, Ll/vhc0;->u:I

    .line 63
    .line 64
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    int-to-float p2, p2

    .line 69
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->i:I

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->a()V

    .line 79
    .line 80
    .line 81
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setHorizontalScrollBarEnabled(Z)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 15
    .line 16
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 17
    .line 18
    const/4 v1, -0x1

    .line 19
    const/4 v2, -0x2

    .line 20
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 21
    .line 22
    .line 23
    const v1, 0x800013

    .line 24
    .line 25
    .line 26
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setContentLayoutParams(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 29
    .line 30
    .line 31
    const v0, 0x800003

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setGravity(I)V

    .line 35
    .line 36
    .line 37
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->b:I

    .line 38
    .line 39
    int-to-float v0, v0

    .line 40
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setTextSize(F)V

    .line 41
    .line 42
    .line 43
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->a:I

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->e:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setMarqueeText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    const/4 v0, 0x1

    .line 54
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setMaxLines(I)V

    .line 55
    .line 56
    .line 57
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->c:I

    .line 58
    .line 59
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setBackgroundColor(I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public b()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->f:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 7
    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->h:I

    .line 9
    .line 10
    neg-int v1, v1

    .line 11
    int-to-float v1, v1

    .line 12
    const/4 v2, 0x2

    .line 13
    new-array v2, v2, [F

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    aput v1, v2, v3

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v3, 0x1

    .line 20
    aput v1, v2, v3

    .line 21
    .line 22
    const-string v1, "translationX"

    .line 23
    .line 24
    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->f:Landroid/animation/ObjectAnimator;

    .line 29
    .line 30
    const-wide/16 v1, 0x0

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->f:Landroid/animation/ObjectAnimator;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public c(ILjava/lang/Runnable;I)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x2

    .line 7
    const-string v3, "translationX"

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-le v0, v4, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->f:Landroid/animation/ObjectAnimator;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->f:Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    neg-int v0, v0

    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    add-int/2addr v0, v4

    .line 48
    int-to-float p3, p3

    .line 49
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result p3

    .line 53
    sub-int/2addr v0, p3

    .line 54
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->h:I

    .line 55
    .line 56
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 57
    .line 58
    int-to-float v0, v0

    .line 59
    new-array v2, v2, [F

    .line 60
    .line 61
    const/4 v4, 0x0

    .line 62
    const/4 v5, 0x0

    .line 63
    aput v5, v2, v4

    .line 64
    .line 65
    aput v0, v2, v1

    .line 66
    .line 67
    invoke-static {p3, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->f:Landroid/animation/ObjectAnimator;

    .line 72
    .line 73
    int-to-long v0, p1

    .line 74
    invoke-virtual {p3, v0, v1}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->f:Landroid/animation/ObjectAnimator;

    .line 78
    .line 79
    iget p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->d:I

    .line 80
    .line 81
    int-to-float p3, p3

    .line 82
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->h:I

    .line 83
    .line 84
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    int-to-float v0, v0

    .line 89
    const/high16 v1, 0x42480000    # 50.0f

    .line 90
    .line 91
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    int-to-float v1, v1

    .line 96
    div-float/2addr v0, v1

    .line 97
    mul-float/2addr p3, v0

    .line 98
    float-to-long v0, p3

    .line 99
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_1
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->h:I

    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 106
    .line 107
    new-array p3, v2, [F

    .line 108
    .line 109
    fill-array-data p3, :array_0

    .line 110
    .line 111
    .line 112
    invoke-static {p1, v3, p3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->f:Landroid/animation/ObjectAnimator;

    .line 117
    .line 118
    const-wide/16 v0, 0x9c4

    .line 119
    .line 120
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->f:Landroid/animation/ObjectAnimator;

    .line 124
    .line 125
    const-wide/16 v0, 0x0

    .line 126
    .line 127
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 128
    .line 129
    .line 130
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->f:Landroid/animation/ObjectAnimator;

    .line 131
    .line 132
    new-instance p3, Landroid/view/animation/LinearInterpolator;

    .line 133
    .line 134
    invoke-direct {p3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p1, p3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->f:Landroid/animation/ObjectAnimator;

    .line 141
    .line 142
    invoke-static {p1, p2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 143
    .line 144
    .line 145
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->f:Landroid/animation/ObjectAnimator;

    .line 146
    .line 147
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->i:I

    .line 10
    .line 11
    if-lez v1, :cond_0

    .line 12
    .line 13
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    :cond_0
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->onMeasure(II)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setAnimDuration(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->c:I

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setContentLayoutParams(Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setGravity(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMarqueeText(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

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

.method public setMaxLines(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSingleLine(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTextColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTextSize(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
