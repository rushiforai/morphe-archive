.class public Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Lk2c;


# instance fields
.field public a:Ll2c;

.field public b:Lfr;

.field public c:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    new-instance v0, Ll2c;

    invoke-direct {v0, p0, p0, p2}, Ll2c;-><init>(Landroid/view/View;Lk2c;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;->a:Ll2c;

    invoke-static {p1, p2}, Lfr;->f(Landroid/content/Context;Landroid/util/AttributeSet;)Lfr;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;->b:Lfr;

    if-eqz p1, :cond_12

    invoke-virtual {p1, p0}, Lfr;->e(Landroid/view/View;)V

    :cond_12
    if-eqz p2, :cond_2e

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x101011f

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x0

    const/4 v0, -0x1

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;->c:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    :cond_2e
    return-void
.end method

.method public final b()Ll2c;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;->a:Ll2c;

    return-object p0
.end method

.method public final c()V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;->b:Lfr;

    if-eqz v0, :cond_7

    invoke-virtual {v0, p0}, Lfr;->e(Landroid/view/View;)V

    :cond_7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_c
    if-ge v1, v0, :cond_22

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    instance-of v4, v3, Lm2c;

    if-eqz v4, :cond_1f

    check-cast v3, Lm2c;

    invoke-interface {v3, v2, p0}, Lm2c;->a(Landroid/view/View;Lk2c;)V

    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :cond_22
    return-void
.end method

.method public final checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 2

    instance-of p0, p1, Li2c;

    return p0
.end method

.method public final bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 10
    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public final generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/RelativeLayout$LayoutParams;
    .registers 3

    new-instance v0, Li2c;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Li2c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public final i(I)V
    .registers 3

    if-eqz p1, :cond_9

    const/4 v0, 0x1

    if-ne p1, v0, :cond_d

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutDirection(I)V

    goto :goto_d

    :cond_9
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutDirection(I)V

    :cond_d
    :goto_d
    invoke-virtual {p0}, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;->c()V

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    invoke-static {p0}, Lcs5;->P(Landroid/view/ViewGroup;)V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 5

    invoke-virtual {p0}, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;->c()V

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    iget v1, p0, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;->c:I

    if-lez v1, :cond_17

    if-ge v1, v0, :cond_17

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p1

    iget v0, p0, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;->c:I

    invoke-static {v0, p1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    :cond_17
    invoke-super {p0, p1, p2}, Landroid/widget/RelativeLayout;->onMeasure(II)V

    return-void
.end method
