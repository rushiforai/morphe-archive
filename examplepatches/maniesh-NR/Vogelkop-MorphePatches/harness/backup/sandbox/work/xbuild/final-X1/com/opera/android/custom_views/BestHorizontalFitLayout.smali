.class public Lcom/opera/android/custom_views/BestHorizontalFitLayout;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final onLayout(ZIIII)V
    .registers 6

    iget-object p1, p0, Lcom/opera/android/custom_views/BestHorizontalFitLayout;->a:Landroid/view/View;

    if-eqz p1, :cond_25

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p4

    iget-object p5, p0, Lcom/opera/android/custom_views/BestHorizontalFitLayout;->a:Landroid/view/View;

    invoke-virtual {p5}, Landroid/view/View;->getMeasuredWidth()I

    move-result p5

    add-int/2addr p5, p4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p4

    iget-object p0, p0, Lcom/opera/android/custom_views/BestHorizontalFitLayout;->a:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    add-int/2addr p0, p4

    invoke-virtual {p1, p2, p3, p5, p0}, Landroid/view/View;->layout(IIII)V

    :cond_25
    return-void
.end method

.method public final onMeasure(II)V
    .registers 14

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    add-int/2addr v3, v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v4

    add-int/2addr v4, v2

    sub-int/2addr v1, v4

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    const/4 v5, 0x0

    if-nez v2, :cond_26

    invoke-virtual {p0, v5, v5}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void

    :cond_26
    const/4 v6, 0x0

    move v7, v5

    :goto_28
    if-ge v7, v2, :cond_47

    invoke-virtual {p0, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v9

    const/16 v10, 0x8

    if-eq v9, v10, :cond_44

    if-eqz v0, :cond_41

    invoke-virtual {p0, v8, v5, p2}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    if-gt v6, v1, :cond_43

    :cond_41
    move-object v6, v8

    goto :goto_47

    :cond_43
    move-object v6, v8

    :cond_44
    add-int/lit8 v7, v7, 0x1

    goto :goto_28

    :cond_47
    :goto_47
    iget-object v0, p0, Lcom/opera/android/custom_views/BestHorizontalFitLayout;->a:Landroid/view/View;

    if-eqz v0, :cond_57

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_57

    iget-object v0, p0, Lcom/opera/android/custom_views/BestHorizontalFitLayout;->a:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_57
    if-eqz v6, :cond_5c

    invoke-virtual {v6, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_5c
    iput-object v6, p0, Lcom/opera/android/custom_views/BestHorizontalFitLayout;->a:Landroid/view/View;

    if-nez v6, :cond_64

    invoke-virtual {p0, v5, v5}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void

    :cond_64
    invoke-virtual {p0, v6, p1, p2}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    add-int/2addr p1, v4

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    add-int/2addr p2, v3

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method

.method public final onViewAdded(Landroid/view/View;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onViewAdded(Landroid/view/View;)V

    const/4 p0, 0x4

    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
