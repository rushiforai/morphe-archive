.class abstract Le/e/a/TabViewport110;
.super Landroid/widget/FrameLayout;
.source "TabViewport110.java"


# instance fields
.field private horizontal:Z

.field private final slop:I

.field private startX:F

.field private startY:F

.field private velocity:Landroid/view/VelocityTracker;

.field private vertical:Z


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 9
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    iput p1, p0, Le/e/a/TabViewport110;->slop:I

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Le/e/a/TabViewport110;->setClipChildren(Z)V

    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p1, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p1}, Le/e/a/TabViewport110;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private begin(Landroid/view/MotionEvent;)V
    .registers 6

    .line 11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Le/e/a/TabViewport110;->startX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Le/e/a/TabViewport110;->startY:F

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/TabViewport110;->horizontal:Z

    iget v1, p0, Le/e/a/TabViewport110;->startX:F

    invoke-virtual {p0}, Le/e/a/TabViewport110;->getContext()Landroid/content/Context;

    move-result-object v2

    const/16 v3, 0x18

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    int-to-float v2, v2

    cmpg-float v1, v1, v2

    if-ltz v1, :cond_27

    invoke-virtual {p0}, Le/e/a/TabViewport110;->switching()Z

    move-result v1

    if-nez v1, :cond_27

    goto :goto_28

    :cond_27
    const/4 v0, 0x1

    :goto_28
    iput-boolean v0, p0, Le/e/a/TabViewport110;->vertical:Z

    invoke-direct {p0}, Le/e/a/TabViewport110;->recycle()V

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Le/e/a/TabViewport110;->velocity:Landroid/view/VelocityTracker;

    iget-object v0, p0, Le/e/a/TabViewport110;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    return-void
.end method

.method private classify(Landroid/view/MotionEvent;)V
    .registers 6

    .line 12
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_d

    iput-boolean v1, p0, Le/e/a/TabViewport110;->vertical:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/TabViewport110;->horizontal:Z

    return-void

    :cond_d
    iget-boolean v0, p0, Le/e/a/TabViewport110;->vertical:Z

    if-nez v0, :cond_5b

    iget-boolean v0, p0, Le/e/a/TabViewport110;->horizontal:Z

    if-eqz v0, :cond_16

    goto :goto_5b

    :cond_16
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v2, p0, Le/e/a/TabViewport110;->startX:F

    sub-float/2addr v0, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget v2, p0, Le/e/a/TabViewport110;->startY:F

    sub-float/2addr p1, v2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v3, p0, Le/e/a/TabViewport110;->slop:I

    int-to-float v3, v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_3e

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_3e

    :goto_3b
    iput-boolean v1, p0, Le/e/a/TabViewport110;->vertical:Z

    goto :goto_5b

    :cond_3e
    iget v2, p0, Le/e/a/TabViewport110;->slop:I

    invoke-static {v0, p1, v2}, Le/e/a/Following190$Gestures;->isHorizontal(FFI)Z

    move-result p1

    if-eqz p1, :cond_5b

    iget p1, p0, Le/e/a/TabViewport110;->startX:F

    iget v2, p0, Le/e/a/TabViewport110;->startY:F

    const/4 v3, 0x0

    cmpg-float v0, v0, v3

    if-gez v0, :cond_51

    const/4 v0, 0x1

    goto :goto_52

    :cond_51
    const/4 v0, -0x1

    :goto_52
    invoke-static {p0, p1, v2, v0}, Le/e/a/TabViewport110;->scrollable(Landroid/view/View;FFI)Z

    move-result p1

    if-eqz p1, :cond_59

    goto :goto_3b

    :cond_59
    iput-boolean v1, p0, Le/e/a/TabViewport110;->horizontal:Z

    :cond_5b
    :goto_5b
    return-void
.end method

.method static fill(Landroid/view/View;)V
    .registers 5

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    const/4 v1, -0x1

    if-nez v0, :cond_c

    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    :cond_c
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    instance-of v2, v0, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v2, :cond_1d

    move-object v2, v0

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    iget v2, v2, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_1d

    const/4 v1, 0x0

    :cond_1d
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    instance-of v0, p0, Landroid/widget/ScrollView;

    if-eqz v0, :cond_2c

    check-cast p0, Landroid/widget/ScrollView;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    :cond_2c
    return-void
.end method

.method private recycle()V
    .registers 2

    .line 16
    iget-object v0, p0, Le/e/a/TabViewport110;->velocity:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_c

    iget-object v0, p0, Le/e/a/TabViewport110;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/TabViewport110;->velocity:Landroid/view/VelocityTracker;

    :cond_c
    return-void
.end method

.method private static scrollable(Landroid/view/View;FFI)Z
    .registers 12

    .line 13
    instance-of v0, p0, Landroid/view/ViewGroup;

    const/4 v1, 0x1

    if-eqz v0, :cond_62

    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    sub-int/2addr v2, v1

    :goto_d
    if-gez v2, :cond_10

    goto :goto_62

    :cond_10
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-eqz v4, :cond_1b

    goto :goto_5f

    :cond_1b
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v4, p1

    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v4, v5

    invoke-virtual {v3}, Landroid/view/View;->getTranslationX()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v5, p2

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr v5, v6

    invoke-virtual {v3}, Landroid/view/View;->getTranslationY()F

    move-result v6

    sub-float/2addr v5, v6

    const/4 v6, 0x0

    cmpl-float v7, v4, v6

    if-ltz v7, :cond_5f

    cmpl-float v6, v5, v6

    if-ltz v6, :cond_5f

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v6

    int-to-float v6, v6

    cmpg-float v6, v4, v6

    if-gez v6, :cond_5f

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    cmpg-float v6, v5, v6

    if-gez v6, :cond_5f

    invoke-static {v3, v4, v5, p3}, Le/e/a/TabViewport110;->scrollable(Landroid/view/View;FFI)Z

    move-result v3

    if-eqz v3, :cond_5f

    return v1

    :cond_5f
    :goto_5f
    add-int/lit8 v2, v2, -0x1

    goto :goto_d

    :cond_62
    :goto_62
    instance-of p1, p0, Le/e/a/TabViewport110;

    if-nez p1, :cond_6d

    invoke-virtual {p0, p3}, Landroid/view/View;->canScrollHorizontally(I)Z

    move-result p0

    if-eqz p0, :cond_6d

    return v1

    :cond_6d
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method protected onDetachedFromWindow()V
    .registers 2

    .line 17
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/TabViewport110;->horizontal:Z

    iput-boolean v0, p0, Le/e/a/TabViewport110;->vertical:Z

    invoke-direct {p0}, Le/e/a/TabViewport110;->recycle()V

    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_a

    invoke-direct {p0, p1}, Le/e/a/TabViewport110;->begin(Landroid/view/MotionEvent;)V

    goto :goto_37

    :cond_a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-ne v0, v1, :cond_27

    invoke-direct {p0, p1}, Le/e/a/TabViewport110;->classify(Landroid/view/MotionEvent;)V

    iget-boolean p1, p0, Le/e/a/TabViewport110;->horizontal:Z

    if-eqz p1, :cond_37

    invoke-virtual {p0}, Le/e/a/TabViewport110;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_26

    invoke-virtual {p0}, Le/e/a/TabViewport110;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_26
    return v2

    :cond_27
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_34

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    if-ne p1, v2, :cond_37

    :cond_34
    invoke-direct {p0}, Le/e/a/TabViewport110;->recycle()V

    :cond_37
    :goto_37
    iget-boolean p1, p0, Le/e/a/TabViewport110;->horizontal:Z

    return p1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 9

    .line 15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_9

    invoke-direct {p0, p1}, Le/e/a/TabViewport110;->begin(Landroid/view/MotionEvent;)V

    :cond_9
    iget-object v1, p0, Le/e/a/TabViewport110;->velocity:Landroid/view/VelocityTracker;

    if-eqz v1, :cond_12

    iget-object v1, p0, Le/e/a/TabViewport110;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {v1, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_12
    const/4 v1, 0x2

    if-ne v0, v1, :cond_18

    invoke-direct {p0, p1}, Le/e/a/TabViewport110;->classify(Landroid/view/MotionEvent;)V

    :cond_18
    const/4 v1, 0x1

    if-eq v0, v1, :cond_1e

    const/4 v2, 0x3

    if-ne v0, v2, :cond_79

    :cond_1e
    iget-object v2, p0, Le/e/a/TabViewport110;->velocity:Landroid/view/VelocityTracker;

    const/4 v3, 0x0

    if-eqz v2, :cond_31

    iget-object v2, p0, Le/e/a/TabViewport110;->velocity:Landroid/view/VelocityTracker;

    const/16 v4, 0x3e8

    invoke-virtual {v2, v4}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    iget-object v2, p0, Le/e/a/TabViewport110;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {v2}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v2

    goto :goto_32

    :cond_31
    const/4 v2, 0x0

    :goto_32
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iget v4, p0, Le/e/a/TabViewport110;->startX:F

    sub-float/2addr p1, v4

    const/4 v4, 0x0

    if-ne v0, v1, :cond_5a

    iget-boolean v0, p0, Le/e/a/TabViewport110;->horizontal:Z

    if-eqz v0, :cond_5a

    iget-boolean v0, p0, Le/e/a/TabViewport110;->vertical:Z

    if-nez v0, :cond_5a

    invoke-virtual {p0}, Le/e/a/TabViewport110;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Le/e/a/TabViewport110;->getContext()Landroid/content/Context;

    move-result-object v5

    const/16 v6, 0x258

    invoke-static {v5, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {p1, v2, v0, v5}, Le/e/a/Following190$Gestures;->shouldSwitch(FFII)Z

    move-result v0

    if-eqz v0, :cond_5a

    const/4 v0, 0x1

    goto :goto_5b

    :cond_5a
    const/4 v0, 0x0

    :goto_5b
    iput-boolean v4, p0, Le/e/a/TabViewport110;->horizontal:Z

    invoke-direct {p0}, Le/e/a/TabViewport110;->recycle()V

    invoke-virtual {p0}, Le/e/a/TabViewport110;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-eqz v2, :cond_6d

    invoke-virtual {p0}, Le/e/a/TabViewport110;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    invoke-interface {v2, v4}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_6d
    if-eqz v0, :cond_79

    cmpg-float p1, p1, v3

    if-gez p1, :cond_75

    const/4 p1, 0x1

    goto :goto_76

    :cond_75
    const/4 p1, -0x1

    :goto_76
    invoke-virtual {p0, p1}, Le/e/a/TabViewport110;->swipe(I)V

    :cond_79
    return v1
.end method

.method abstract swipe(I)V
.end method

.method abstract switching()Z
.end method
