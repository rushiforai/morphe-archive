.class public abstract Lgej;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# instance fields
.field public final a:I

.field public b:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x43700000    # 240.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {p1, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Lgej;->a:I

    return-void
.end method


# virtual methods
.method public a(ILandroid/view/View;)V
    .registers 3

    return-void
.end method

.method public b()I
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    return p0
.end method

.method public c()I
    .registers 1

    iget p0, p0, Lgej;->a:I

    return p0
.end method

.method public final e()V
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    iget v1, v0, Lcom/opera/android/widget/MeasurableHeightScrollView;->M:I

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    sub-int/2addr v1, v0

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    sub-int/2addr v1, v0

    iput v1, p0, Lgej;->b:I

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public f(I)V
    .registers 4

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    invoke-virtual {v0, p1, p1, v1, p0}, Landroid/view/View;->layout(IIII)V

    return-void
.end method

.method public g(I)V
    .registers 4

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {p1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-virtual {p0, p1, v0}, Landroid/view/View;->measure(II)V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 8

    iget p1, p0, Lgej;->b:I

    invoke-virtual {p0}, Lgej;->c()I

    move-result p2

    if-ge p1, p2, :cond_9

    move p1, p2

    :cond_9
    invoke-virtual {p0, p1}, Lgej;->f(I)V

    iget p1, p0, Lgej;->b:I

    invoke-virtual {p0}, Lgej;->c()I

    move-result p2

    if-ge p1, p2, :cond_15

    move p1, p2

    :cond_15
    invoke-virtual {p0}, Lgej;->b()I

    move-result p2

    sub-int/2addr p1, p2

    const/4 p2, 0x1

    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p3

    const/4 p4, 0x0

    invoke-virtual {p0, p4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p5

    invoke-virtual {p5}, Landroid/view/View;->getMeasuredHeight()I

    move-result p5

    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0, p4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    add-int/2addr v1, p1

    invoke-virtual {p3, p4, p5, v0, v1}, Landroid/view/View;->layout(IIII)V

    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    check-cast p2, Lcom/opera/android/widget/MeasurableHeightScrollView;

    iget p3, p2, Lcom/opera/android/widget/MeasurableHeightScrollView;->M:I

    invoke-virtual {p2}, Landroid/view/View;->getPaddingTop()I

    move-result p5

    sub-int/2addr p3, p5

    invoke-virtual {p2}, Landroid/view/View;->getPaddingBottom()I

    move-result p2

    sub-int/2addr p3, p2

    invoke-virtual {p0}, Lgej;->b()I

    move-result p2

    sub-int/2addr p3, p2

    if-ltz p3, :cond_5a

    move p4, p3

    :cond_5a
    invoke-virtual {p0, p4, p1}, Lgej;->a(ILandroid/view/View;)V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 7

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lgej;->g(I)V

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    check-cast p2, Lcom/opera/android/widget/MeasurableHeightScrollView;

    iget v0, p2, Lcom/opera/android/widget/MeasurableHeightScrollView;->M:I

    invoke-virtual {p2}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p2}, Landroid/view/View;->getPaddingBottom()I

    move-result p2

    sub-int/2addr v0, p2

    iget p2, p0, Lgej;->b:I

    invoke-virtual {p0}, Lgej;->c()I

    move-result v1

    if-ge p2, v1, :cond_22

    move p2, v1

    :cond_22
    invoke-virtual {p0}, Lgej;->b()I

    move-result v1

    sub-int/2addr p2, v1

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {p1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    invoke-static {p2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-virtual {v1, v3, p2}, Landroid/view/View;->measure(II)V

    invoke-virtual {p0, p1, v0}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method
