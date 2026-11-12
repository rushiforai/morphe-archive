.class public Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;
.super Landroidx/coordinatorlayout/widget/CoordinatorLayout;
.source "SourceFile"


# instance fields
.field public A:I

.field public B:Ln1n;

.field public final y:F

.field public z:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->y:F

    if-eqz p2, :cond_2b

    const v1, 0x101011f

    filled-new-array {v1}, [I

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    new-instance v1, Ln1n;

    const/4 v2, 0x0

    invoke-direct {v1, v0, p2, v2}, Ln1n;-><init>(IIF)V

    iput-object v1, p0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->B:Ln1n;

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    :cond_2b
    return-void
.end method


# virtual methods
.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-nez v0, :cond_1d

    iput v2, p0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->A:I

    iget-object v0, p0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->z:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_13

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    iput-object v1, p0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->z:Landroid/view/VelocityTracker;

    :cond_13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, p0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->A:I

    :cond_1d
    iget-object v0, p0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->z:Landroid/view/VelocityTracker;

    if-nez v0, :cond_27

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->z:Landroid/view/VelocityTracker;

    :cond_27
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_3c

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v3, 0x3

    if-ne p1, v3, :cond_47

    :cond_3c
    iput v2, p0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->A:I

    iget-object p1, p0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->z:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_47

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    iput-object v1, p0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->z:Landroid/view/VelocityTracker;

    :cond_47
    return v0
.end method

.method public final onMeasure(II)V
    .registers 7

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    iget-object v1, p0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->B:Ln1n;

    if-eqz v1, :cond_30

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p1

    iget-object v1, p0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->B:Ln1n;

    iget v2, v1, Ln1n;->c:F

    const/4 v3, 0x0

    cmpl-float v3, v2, v3

    if-eqz v3, :cond_19

    int-to-float v3, v0

    mul-float/2addr v3, v2

    float-to-int v2, v3

    goto :goto_1a

    :cond_19
    move v2, v0

    :goto_1a
    iget v3, v1, Ln1n;->b:I

    if-eqz v3, :cond_21

    if-le v2, v3, :cond_21

    move v2, v3

    :cond_21
    iget v1, v1, Ln1n;->a:I

    if-eqz v1, :cond_28

    if-ge v2, v1, :cond_28

    move v2, v1

    :cond_28
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v0, p1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    :cond_30
    invoke-super {p0, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->onMeasure(II)V

    return-void
.end method
