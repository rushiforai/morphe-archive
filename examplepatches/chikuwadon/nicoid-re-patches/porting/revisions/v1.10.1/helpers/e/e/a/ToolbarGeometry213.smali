.class public final Le/e/a/ToolbarGeometry213;
.super Ljava/lang/Object;
.source "ToolbarGeometry213.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static width(Landroid/view/View;I)I
    .registers 5

    if-gtz p1, :cond_42

    if-nez p0, :cond_5

    goto :goto_42

    :cond_5
    move-object p1, p0

    :goto_6
    const/4 v0, 0x1

    if-nez p1, :cond_18

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0

    .line 12
    :cond_18
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    if-lez v1, :cond_35

    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result p0

    sub-int/2addr v1, p0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result p0

    sub-int/2addr v1, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0

    .line 14
    :cond_35
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    .line 15
    instance-of v0, p1, Landroid/view/View;

    if-eqz v0, :cond_40

    check-cast p1, Landroid/view/View;

    goto :goto_6

    :cond_40
    const/4 p1, 0x0

    goto :goto_6

    :cond_42
    :goto_42
    return p1
.end method
