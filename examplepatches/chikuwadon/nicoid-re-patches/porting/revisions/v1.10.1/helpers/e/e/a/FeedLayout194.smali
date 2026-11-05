.class public final Le/e/a/FeedLayout194;
.super Landroid/widget/LinearLayout;
.source "FeedLayout194.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "c"    # Landroid/content/Context;

    .line 7
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 8
    .param p1, "w"    # I
    .param p2, "h"    # I

    .line 8
    invoke-virtual {p0}, Le/e/a/FeedLayout194;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .local v0, "density":F
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_13

    const/4 v1, 0x0

    goto :goto_17

    :cond_13
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .local v1, "width":I
    :goto_17
    const/high16 v3, 0x41800000    # 16.0f

    mul-float v3, v3, v0

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    const/high16 v4, 0x44340000    # 720.0f

    mul-float v4, v4, v0

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    sub-int v4, v1, v4

    div-int/lit8 v4, v4, 0x2

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    add-int/2addr v3, v2

    .local v3, "inset":I
    invoke-virtual {p0}, Le/e/a/FeedLayout194;->getPaddingLeft()I

    move-result v2

    if-ne v2, v3, :cond_3c

    invoke-virtual {p0}, Le/e/a/FeedLayout194;->getPaddingRight()I

    move-result v2

    if-eq v2, v3, :cond_47

    :cond_3c
    invoke-virtual {p0}, Le/e/a/FeedLayout194;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Le/e/a/FeedLayout194;->getPaddingBottom()I

    move-result v4

    invoke-virtual {p0, v3, v2, v3, v4}, Le/e/a/FeedLayout194;->setPadding(IIII)V

    :cond_47
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    return-void
.end method
