.class public Lcom/opera/android/custom_views/PercentWidthContainer;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final b:F

.field public final c:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/opera/android/custom_views/PercentWidthContainer;->b:F

    iput v0, p0, Lcom/opera/android/custom_views/PercentWidthContainer;->c:F

    if-eqz p2, :cond_26

    sget-object v0, Lkhh;->z:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x0

    iget v0, p0, Lcom/opera/android/custom_views/PercentWidthContainer;->c:F

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/PercentWidthContainer;->c:F

    const/4 p2, 0x1

    iget v0, p0, Lcom/opera/android/custom_views/PercentWidthContainer;->b:F

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/PercentWidthContainer;->b:F

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    :cond_26
    return-void
.end method


# virtual methods
.method public final measureChildWithMargins(Landroid/view/View;IIII)V
    .registers 12

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    if-nez v2, :cond_46

    if-lez v1, :cond_46

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p2

    sub-int/2addr v1, p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p2

    sub-int/2addr v1, p2

    int-to-float p2, v1

    iget-boolean p3, p0, Lcom/opera/android/custom_views/PercentWidthContainer;->a:Z

    if-eqz p3, :cond_22

    iget p3, p0, Lcom/opera/android/custom_views/PercentWidthContainer;->c:F

    goto :goto_24

    :cond_22
    iget p3, p0, Lcom/opera/android/custom_views/PercentWidthContainer;->b:F

    :goto_24
    mul-float/2addr p2, p3

    float-to-int p2, p2

    const/high16 p3, 0x40000000    # 2.0f

    invoke-static {p2, p3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result p0

    add-int/2addr p0, p3

    iget p3, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    add-int/2addr p0, p3

    iget p3, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    add-int/2addr p0, p3

    add-int/2addr p0, p5

    iget p3, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    invoke-static {p4, p0, p3}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result p0

    invoke-virtual {p1, p2, p0}, Landroid/view/View;->measure(II)V

    return-void

    :cond_46
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-super/range {v0 .. v5}, Landroid/view/ViewGroup;->measureChildWithMargins(Landroid/view/View;IIII)V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_a

    const/4 p1, 0x1

    goto :goto_b

    :cond_a
    const/4 p1, 0x0

    :goto_b
    iget-boolean v0, p0, Lcom/opera/android/custom_views/PercentWidthContainer;->a:Z

    if-ne p1, v0, :cond_10

    return-void

    :cond_10
    iput-boolean p1, p0, Lcom/opera/android/custom_views/PercentWidthContainer;->a:Z

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    iget-boolean v1, p0, Lcom/opera/android/custom_views/PercentWidthContainer;->a:Z

    if-ne v0, v1, :cond_18

    return-void

    :cond_18
    iput-boolean v0, p0, Lcom/opera/android/custom_views/PercentWidthContainer;->a:Z

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method
