.class public Lcom/opera/android/custom_views/SideMarginContainer;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# instance fields
.field public a:Luk6;

.field public final b:Lm9f;

.field public final c:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lm9f;

    invoke-direct {p1, p0}, Lm9f;-><init>(Landroid/view/ViewGroup;)V

    iput-object p1, p0, Lcom/opera/android/custom_views/SideMarginContainer;->b:Lm9f;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/custom_views/SideMarginContainer;->c:Z

    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    return-void
.end method


# virtual methods
.method public final onAttachedToWindow()V
    .registers 1

    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    iget-object p0, p0, Lcom/opera/android/custom_views/SideMarginContainer;->b:Lm9f;

    invoke-virtual {p0}, Lm9f;->f()V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Lcom/opera/android/custom_views/SideMarginContainer;->b:Lm9f;

    invoke-virtual {p0}, Lm9f;->h()V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    if-eqz p1, :cond_1f

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    sub-int/2addr p4, p2

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p2

    sub-int/2addr p4, p2

    div-int/lit8 p4, p4, 0x2

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p2

    add-int/2addr p2, p4

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p3

    invoke-virtual {p0, p4, p1, p2, p3}, Landroid/view/View;->layout(IIII)V

    :cond_1f
    return-void
.end method

.method public final onMeasure(II)V
    .registers 9

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-nez v0, :cond_a

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    return-void

    :cond_a
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    iget-boolean v0, p0, Lcom/opera/android/custom_views/SideMarginContainer;->c:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lcom/opera/android/custom_views/SideMarginContainer;->b:Lm9f;

    invoke-virtual {v0}, Lm9f;->e()I

    move-result v0

    goto :goto_1f

    :cond_1e
    move v0, v1

    :goto_1f
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x1

    if-lez v0, :cond_28

    move v4, v3

    goto :goto_29

    :cond_28
    move v4, v1

    :goto_29
    shl-int/2addr v0, v3

    sub-int v0, p1, v0

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-virtual {v2, v5, v1}, Landroid/view/View;->measure(II)V

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v5, -0x1

    if-ne v1, v5, :cond_4f

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    if-ge v1, p2, :cond_4f

    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-static {p2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-virtual {v2, v0, p2}, Landroid/view/View;->measure(II)V

    :cond_4f
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    iget-object p0, p0, Lcom/opera/android/custom_views/SideMarginContainer;->a:Luk6;

    if-eqz p0, :cond_63

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/FadingScrollView;

    iget-object p0, p0, Lcom/opera/android/custom_views/FadingScrollView;->c:Lz5n;

    invoke-virtual {p0, v4}, Lz5n;->f(Z)V

    :cond_63
    return-void
.end method
