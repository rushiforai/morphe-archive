.class public final Le/e/a/MiniViewport237;
.super Landroid/widget/LinearLayout;
.source "MiniViewport237.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View;)V
    .registers 4

    .line 5
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Le/e/a/MiniViewport237;->setOrientation(I)V

    const/16 p1, 0x11

    invoke-virtual {p0, p1}, Le/e/a/MiniViewport237;->setGravity(I)V

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p1, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p2, p1}, Le/e/a/MiniViewport237;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 9

    .line 6
    const/4 v0, 0x0

    move v1, v0

    :goto_2
    invoke-virtual {p0}, Le/e/a/MiniViewport237;->getChildCount()I

    move-result v2

    if-lt v1, v2, :cond_c

    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    return-void

    :cond_c
    invoke-virtual {p0, v1}, Le/e/a/MiniViewport237;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    instance-of v4, v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    if-nez v4, :cond_22

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_2e

    :cond_22
    iput v5, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v5, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, 0x0

    iput v2, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    invoke-virtual {v3, v0, v0, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    :goto_2e
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method
