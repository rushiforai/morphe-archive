.class final Le/e/a/Revision197$PreviewRow;
.super Landroid/widget/LinearLayout;
.source "Revision197.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Revision197;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "PreviewRow"
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 27
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Le/e/a/Revision197$PreviewRow;->setOrientation(I)V

    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 10

    .line 29
    invoke-virtual {p0}, Le/e/a/Revision197$PreviewRow;->getChildCount()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_85

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-eqz v0, :cond_85

    .line 30
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    invoke-virtual {p0}, Le/e/a/Revision197$PreviewRow;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v0, v2

    invoke-virtual {p0}, Le/e/a/Revision197$PreviewRow;->getPaddingRight()I

    move-result v2

    sub-int/2addr v0, v2

    .line 31
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Le/e/a/Revision197$PreviewRow;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    .line 32
    invoke-virtual {v3}, Landroid/widget/CheckBox;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    invoke-virtual {v3}, Landroid/widget/CheckBox;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v4

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v4, v4

    invoke-virtual {v3}, Landroid/widget/CheckBox;->getCompoundPaddingLeft()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v3}, Landroid/widget/CheckBox;->getCompoundPaddingRight()I

    move-result v3

    add-int/2addr v4, v3

    invoke-virtual {p0}, Le/e/a/Revision197$PreviewRow;->getContext()Landroid/content/Context;

    move-result-object v3

    const/16 v5, 0x20

    invoke-static {v3, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    add-int/2addr v4, v3

    .line 33
    div-int/lit8 v3, v0, 0x3

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    sub-int/2addr v0, v3

    div-int/lit8 v4, v0, 0x2

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 34
    nop

    :goto_65
    if-lt v2, v1, :cond_68

    goto :goto_85

    :cond_68
    invoke-virtual {p0, v2}, Le/e/a/Revision197$PreviewRow;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    if-nez v2, :cond_76

    move v6, v3

    goto :goto_7d

    :cond_76
    const/4 v6, 0x1

    if-ne v2, v6, :cond_7b

    move v6, v4

    goto :goto_7d

    :cond_7b
    sub-int v6, v0, v4

    :goto_7d
    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/4 v6, 0x0

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    add-int/lit8 v2, v2, 0x1

    goto :goto_65

    .line 36
    :cond_85
    :goto_85
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 37
    return-void
.end method
