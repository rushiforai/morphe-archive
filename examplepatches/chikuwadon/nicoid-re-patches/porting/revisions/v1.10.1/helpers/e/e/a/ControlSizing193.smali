.class public final Le/e/a/ControlSizing193;
.super Ljava/lang/Object;
.source "ControlSizing193.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static glyph(FLjava/lang/String;)F
    .registers 2

    invoke-static {p0, p1}, Le/e/a/Revision196;->glyph(FLjava/lang/String;)F

    move-result p0

    return p0
.end method

.method static item(Landroid/view/View;Ljava/lang/String;)V
    .registers 6

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x30

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "speed"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1e

    const-string v3, "quality"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_20

    :cond_1e
    const/16 v1, 0x38

    :cond_20
    invoke-static {v2, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    .line 13
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, p1, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 p1, 0x0

    iput p1, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    const/16 p1, 0x10

    iput p1, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 14
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setMinimumWidth(I)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, p1, p1, p1, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 15
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_56

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMinWidth(I)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMinHeight(I)V

    const/high16 v0, 0x41500000    # 13.0f

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 16
    :cond_56
    return-void
.end method
