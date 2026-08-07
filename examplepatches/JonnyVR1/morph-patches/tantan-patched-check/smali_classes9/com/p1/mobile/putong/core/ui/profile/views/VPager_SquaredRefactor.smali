.class public Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;
.super Lv/VPager;
.source "SourceFile"


# instance fields
.field public P0:F

.field public Q0:Z

.field public R0:F

.field public S0:F

.field public T0:Z

.field public final U0:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VPager;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const v0, 0x3f4ccccd    # 0.8f

    .line 5
    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->P0:F

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->Q0:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->T0:Z

    .line 13
    .line 14
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->U0:I

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2}, Lv/VPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p2, 0x3f4ccccd    # 0.8f

    .line 26
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->P0:F

    const/4 p2, 0x0

    .line 27
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->Q0:Z

    .line 28
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->T0:Z

    .line 29
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->U0:I

    return-void
.end method


# virtual methods
.method public final d0(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->Q0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    and-int/lit16 v0, v0, 0xff

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    if-eq v0, v2, :cond_3

    .line 16
    .line 17
    const/4 v3, 0x2

    .line 18
    if-eq v0, v3, :cond_0

    .line 19
    .line 20
    const/4 v2, 0x3

    .line 21
    if-eq v0, v2, :cond_3

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->T0:Z

    .line 25
    .line 26
    if-nez v0, :cond_5

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->R0:F

    .line 33
    .line 34
    sub-float/2addr v0, v3

    .line 35
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->S0:F

    .line 44
    .line 45
    sub-float/2addr v3, v4

    .line 46
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->U0:I

    .line 51
    .line 52
    int-to-float v5, v4

    .line 53
    cmpl-float v5, v0, v5

    .line 54
    .line 55
    if-gez v5, :cond_1

    .line 56
    .line 57
    int-to-float v4, v4

    .line 58
    cmpl-float v4, v3, v4

    .line 59
    .line 60
    if-ltz v4, :cond_5

    .line 61
    .line 62
    :cond_1
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->T0:Z

    .line 63
    .line 64
    cmpl-float v0, v0, v3

    .line 65
    .line 66
    if-lez v0, :cond_2

    .line 67
    .line 68
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->d0(Z)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->d0(Z)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->T0:Z

    .line 77
    .line 78
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->d0(Z)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->R0:F

    .line 87
    .line 88
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->S0:F

    .line 93
    .line 94
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->T0:Z

    .line 95
    .line 96
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->d0(Z)V

    .line 97
    .line 98
    .line 99
    :cond_5
    :goto_0
    invoke-super {p0, p1}, Lv/VPager;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    return p0
.end method

.method public getCurrentWidthHeightRate()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->P0:F

    .line 2
    .line 3
    return p0
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    int-to-float p2, v0

    .line 14
    const v0, 0x3f4ccccd    # 0.8f

    .line 15
    .line 16
    .line 17
    mul-float/2addr p2, v0

    .line 18
    float-to-int p2, p2

    .line 19
    const/high16 v0, 0x40000000    # 2.0f

    .line 20
    .line 21
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    invoke-super {p0, p1, p2}, Lv/VPager;->onMeasure(II)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-super {p0, p1, p2}, Lv/VPager;->onMeasure(II)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-static {p1, p2}, Ll/psh0;->a(II)I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->P0:F

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    cmpl-float v1, v0, v1

    .line 41
    .line 42
    if-lez v1, :cond_2

    .line 43
    .line 44
    const/high16 v1, 0x3f800000    # 1.0f

    .line 45
    .line 46
    cmpg-float v0, v0, v1

    .line 47
    .line 48
    if-gez v0, :cond_2

    .line 49
    .line 50
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    int-to-float p2, p1

    .line 55
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->P0:F

    .line 56
    .line 57
    div-float/2addr p2, v0

    .line 58
    float-to-int p2, p2

    .line 59
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    invoke-super {p0, p1, p2}, Lv/VPager;->onMeasure(II)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    invoke-super {p0, p2, p2}, Lv/VPager;->onMeasure(II)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public setPreferVPagerOnHorizontalConflict(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->Q0:Z

    .line 2
    .line 3
    return-void
.end method

.method public setWidthHeightRate(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->P0:F

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->P0:F

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method
