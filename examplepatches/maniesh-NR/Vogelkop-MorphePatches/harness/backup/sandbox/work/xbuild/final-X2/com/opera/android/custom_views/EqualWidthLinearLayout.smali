.class public Lcom/opera/android/custom_views/EqualWidthLinearLayout;
.super Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;
.source "SourceFile"


# instance fields
.field public c:Leal;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final onFinishInflate()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_b

    return-void

    :cond_b
    const-string p0, "Vertical orientation not supported"

    invoke-static {p0}, Lyt7;->k(Ljava/lang/String;)V

    return-void
.end method

.method public final onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    iget-object v0, p0, Lcom/opera/android/custom_views/EqualWidthLinearLayout;->c:Leal;

    if-eqz v0, :cond_c

    invoke-virtual {v0, p0, p1}, Leal;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final onLayout(ZIIII)V
    .registers 16

    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_a

    move p1, v1

    goto :goto_b

    :cond_a
    move p1, v0

    :goto_b
    sub-int/2addr p4, p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p2

    sub-int/2addr p4, p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p2

    sub-int/2addr p4, p2

    sub-int/2addr p5, p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p2

    sub-int/2addr p5, p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result p2

    sub-int/2addr p5, p2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p3

    move v3, p2

    move v2, v0

    :goto_2b
    const/16 v4, 0x8

    if-ge v2, p2, :cond_3e

    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-ne v5, v4, :cond_3b

    add-int/lit8 v3, v3, -0x1

    :cond_3b
    add-int/lit8 v2, v2, 0x1

    goto :goto_2b

    :cond_3e
    if-eqz p1, :cond_47

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    sub-int/2addr p1, v1

    const/4 v1, -0x1

    goto :goto_48

    :cond_47
    move p1, v0

    :goto_48
    if-ge v0, p2, :cond_83

    mul-int v2, v1, v0

    add-int/2addr v2, p1

    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-eq v5, v4, :cond_80

    div-int v5, p4, v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    sub-int v6, v5, v6

    div-int/lit8 v6, v6, 0x2

    add-int/2addr v6, p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v7

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    sub-int v8, p5, v8

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v7

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v7, v6

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    add-int/2addr v9, v8

    invoke-virtual {v2, v6, v8, v7, v9}, Landroid/view/View;->layout(IIII)V

    sub-int/2addr p4, v5

    add-int/2addr p3, v5

    :cond_80
    add-int/lit8 v0, v0, 0x1

    goto :goto_48

    :cond_83
    return-void
.end method

.method public final onMeasure(II)V
    .registers 14

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    move v4, v1

    move v3, v2

    :goto_15
    const/16 v5, 0x8

    if-ge v3, v1, :cond_28

    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-ne v6, v5, :cond_25

    add-int/lit8 v4, v4, -0x1

    :cond_25
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    :cond_28
    move v3, v2

    :goto_29
    if-ge v3, v1, :cond_5f

    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v7

    if-eq v7, v5, :cond_5c

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    div-int v8, v0, v4

    add-int/lit8 v4, v4, -0x1

    sub-int/2addr v0, v8

    const/high16 v9, 0x40000000    # 2.0f

    invoke-static {v8, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    iget v9, v7, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v8, v2, v9}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v8

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v9

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v10

    add-int/2addr v10, v9

    iget v7, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {p2, v10, v7}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v7

    invoke-virtual {v6, v8, v7}, Landroid/view/View;->measure(II)V

    :cond_5c
    add-int/lit8 v3, v3, 0x1

    goto :goto_29

    :cond_5f
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4

    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    iget-object v1, p0, Lcom/opera/android/custom_views/EqualWidthLinearLayout;->c:Leal;

    if-eqz v1, :cond_d

    invoke-virtual {v1, p0, p1}, Leal;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    or-int/2addr v0, p0

    :cond_d
    return v0
.end method
