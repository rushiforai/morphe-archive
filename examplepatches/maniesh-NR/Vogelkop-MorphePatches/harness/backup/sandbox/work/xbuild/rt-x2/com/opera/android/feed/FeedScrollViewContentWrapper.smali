.class public Lcom/opera/android/feed/FeedScrollViewContentWrapper;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Z

.field public f:Lav8;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final onLayout(ZIIII)V
    .registers 6

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    const/4 p3, 0x1

    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p3

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result p4

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result p5

    invoke-virtual {p2, p1, p1, p4, p5}, Landroid/view/View;->layout(IIII)V

    invoke-virtual {p3}, Landroid/view/View;->getVisibility()I

    move-result p2

    const/16 p4, 0x8

    if-eq p2, p4, :cond_35

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    invoke-virtual {p3}, Landroid/view/View;->getMeasuredHeight()I

    move-result p4

    sub-int/2addr p2, p4

    iget p0, p0, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->c:I

    sub-int/2addr p2, p0

    invoke-virtual {p3}, Landroid/view/View;->getMeasuredWidth()I

    move-result p0

    invoke-virtual {p3}, Landroid/view/View;->getMeasuredHeight()I

    move-result p4

    add-int/2addr p4, p2

    invoke-virtual {p3, p1, p2, p0, p4}, Landroid/view/View;->layout(IIII)V

    :cond_35
    return-void
.end method

.method public final onMeasure(II)V
    .registers 11

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Lcom/opera/android/feed/FeedScrollView;

    iget v4, v3, Lcom/opera/android/feed/FeedScrollView;->E:I

    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v4, v3

    iget-object v3, p0, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->f:Lav8;

    if-eqz v3, :cond_47

    iget-object v3, v3, Lav8;->a:Lcv8;

    iget-object v5, v3, Lcv8;->w:Lijc;

    new-instance v6, Landroid/util/Size;

    iget-object v7, v3, Lcv8;->D:Ldv8;

    iget v7, v7, Ldv8;->b:I

    sub-int v7, v4, v7

    invoke-direct {v6, p1, v7}, Landroid/util/Size;-><init>(II)V

    iget-object v7, v5, Lijc;->i:Ljava/lang/Object;

    check-cast v7, Landroid/util/Size;

    invoke-static {v7, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_42

    iput-object v6, v5, Lijc;->i:Ljava/lang/Object;

    invoke-virtual {v5}, Lijc;->h()V

    :cond_42
    iget-object v3, v3, Lcv8;->m:Lnjm;

    invoke-virtual {v3}, Lnjm;->b()V

    :cond_47
    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {p1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-virtual {v0, v5, p2}, Landroid/view/View;->measure(II)V

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v5

    const/16 v6, 0x8

    if-eq v5, v6, :cond_5d

    move p2, v1

    :cond_5d
    iput-boolean p2, p0, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->e:Z

    if-eqz p2, :cond_83

    invoke-static {p1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    iget v1, p0, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->c:I

    sub-int v1, v4, v1

    iget v5, p0, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->a:I

    sub-int/2addr v1, v5

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-virtual {v2, p2, v1}, Landroid/view/View;->measure(II)V

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    iget v1, p0, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->c:I

    add-int/2addr p2, v1

    add-int/2addr p2, v0

    invoke-static {v4, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void

    :cond_83
    iget p2, p0, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->b:I

    add-int/2addr v0, p2

    if-gt v0, v4, :cond_8c

    invoke-virtual {p0, p1, v4}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void

    :cond_8c
    iget p2, p0, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->d:I

    add-int/2addr v4, p2

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method
