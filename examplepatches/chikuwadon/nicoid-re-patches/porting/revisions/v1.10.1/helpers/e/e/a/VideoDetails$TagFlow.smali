.class final Le/e/a/VideoDetails$TagFlow;
.super Landroid/view/ViewGroup;
.source "VideoDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/VideoDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TagFlow"
.end annotation


# instance fields
.field final gap:I


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 5

    .line 45
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    const/16 v0, 0x8

    # invokes: Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v0}, Le/e/a/VideoDetails;->access$0(Landroid/content/Context;I)I

    move-result p1

    iput p1, p0, Le/e/a/VideoDetails$TagFlow;->gap:I

    iget p1, p0, Le/e/a/VideoDetails$TagFlow;->gap:I

    iget v0, p0, Le/e/a/VideoDetails$TagFlow;->gap:I

    iget v1, p0, Le/e/a/VideoDetails$TagFlow;->gap:I

    iget v2, p0, Le/e/a/VideoDetails$TagFlow;->gap:I

    invoke-virtual {p0, p1, v0, v1, v2}, Le/e/a/VideoDetails$TagFlow;->setPadding(IIII)V

    return-void
.end method


# virtual methods
.method protected onLayout(ZIIII)V
    .registers 13

    .line 45
    sub-int/2addr p4, p2

    invoke-virtual {p0}, Le/e/a/VideoDetails$TagFlow;->getPaddingLeft()I

    move-result p1

    sub-int/2addr p4, p1

    invoke-virtual {p0}, Le/e/a/VideoDetails$TagFlow;->getPaddingRight()I

    move-result p1

    sub-int/2addr p4, p1

    invoke-virtual {p0}, Le/e/a/VideoDetails$TagFlow;->getPaddingTop()I

    move-result p1

    const/4 p2, 0x0

    const/4 p3, 0x0

    const/4 p5, 0x0

    const/4 v0, 0x0

    :goto_13
    invoke-virtual {p0}, Le/e/a/VideoDetails$TagFlow;->getChildCount()I

    move-result v1

    if-lt p3, v1, :cond_1a

    return-void

    :cond_1a
    invoke-virtual {p0, p3}, Le/e/a/VideoDetails$TagFlow;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    if-lez p5, :cond_32

    add-int v4, p5, v2

    if-le v4, p4, :cond_32

    iget p5, p0, Le/e/a/VideoDetails$TagFlow;->gap:I

    add-int/2addr v0, p5

    add-int/2addr p1, v0

    const/4 p5, 0x0

    const/4 v0, 0x0

    :cond_32
    invoke-virtual {p0}, Le/e/a/VideoDetails$TagFlow;->getPaddingLeft()I

    move-result v4

    add-int/2addr v4, p5

    add-int v5, v4, v2

    add-int v6, p1, v3

    invoke-virtual {v1, v4, p1, v5, v6}, Landroid/view/View;->layout(IIII)V

    iget v1, p0, Le/e/a/VideoDetails$TagFlow;->gap:I

    add-int/2addr v2, v1

    add-int/2addr p5, v2

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    add-int/lit8 p3, p3, 0x1

    goto :goto_13
.end method

.method protected onMeasure(II)V
    .registers 12

    .line 45
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-virtual {p0}, Le/e/a/VideoDetails$TagFlow;->getPaddingLeft()I

    move-result v0

    sub-int v0, p1, v0

    invoke-virtual {p0}, Le/e/a/VideoDetails$TagFlow;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_18
    invoke-virtual {p0}, Le/e/a/VideoDetails$TagFlow;->getChildCount()I

    move-result v6

    if-lt v2, v6, :cond_31

    add-int/2addr v4, v5

    invoke-virtual {p0}, Le/e/a/VideoDetails$TagFlow;->getPaddingTop()I

    move-result v0

    add-int/2addr v4, v0

    invoke-virtual {p0}, Le/e/a/VideoDetails$TagFlow;->getPaddingBottom()I

    move-result v0

    add-int/2addr v4, v0

    invoke-static {v4, p2}, Le/e/a/VideoDetails$TagFlow;->resolveSize(II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Le/e/a/VideoDetails$TagFlow;->setMeasuredDimension(II)V

    return-void

    :cond_31
    invoke-virtual {p0, v2}, Le/e/a/VideoDetails$TagFlow;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    const/high16 v7, -0x80000000

    invoke-static {v0, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    invoke-static {v1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    invoke-virtual {v6, v7, v8}, Landroid/view/View;->measure(II)V

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    if-lez v3, :cond_56

    add-int v8, v3, v7

    if-le v8, v0, :cond_56

    iget v3, p0, Le/e/a/VideoDetails$TagFlow;->gap:I

    add-int/2addr v5, v3

    add-int/2addr v4, v5

    const/4 v3, 0x0

    const/4 v5, 0x0

    :cond_56
    iget v8, p0, Le/e/a/VideoDetails$TagFlow;->gap:I

    add-int/2addr v7, v8

    add-int/2addr v3, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    add-int/lit8 v2, v2, 0x1

    goto :goto_18
.end method
