.class public final Le/e/a/Ui110;
.super Ljava/lang/Object;
.source "Ui110.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Ui110$ActionGlyph;,
        Le/e/a/Ui110$Glyph;,
        Le/e/a/Ui110$Heart;,
        Le/e/a/Ui110$Swipe;,
        Le/e/a/Ui110$Tabs;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static actionColor(Landroid/content/Context;)I
    .registers 1

    .line 5
    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_a

    const p0, -0xdedad3

    goto :goto_d

    :cond_a
    const p0, -0x1a1715

    :goto_d
    return p0
.end method

.method public static circle(Landroid/view/View;)V
    .registers 4

    .line 6
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/Ui110;->actionColor(Landroid/content/Context;)I

    move-result v1

    const/16 v2, 0x64

    invoke-static {v0, v1, v2}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setElevation(F)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method static compact(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;
    .registers 3

    .line 11
    invoke-static {p0, p1, p2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1, p1, p1}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    return-object p0
.end method

.method static flat(Landroid/widget/Button;)V
    .registers 2

    .line 7
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setMinimumWidth(I)V

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setMinimumHeight(I)V

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setBackgroundColor(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setTextColor(I)V

    return-void
.end method

.method static icon(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    .registers 7

    .line 12
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Le/e/a/Ui110;->flat(Landroid/widget/Button;)V

    const/16 v1, 0xc

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/widget/Button;->setPadding(IIII)V

    new-instance v1, Le/e/a/Ui110$ActionGlyph;

    invoke-direct {v1, p0, p1}, Le/e/a/Ui110$ActionGlyph;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-virtual {v0, v1, p0, p0, p0}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    const/16 p0, 0x11

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setGravity(I)V

    return-object v0
.end method

.method public static like(Landroid/widget/Button;Z)V
    .registers 8

    invoke-static {p0}, Le/e/a/ShortLike119;->bridge(Landroid/widget/Button;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 14
    :cond_7
    invoke-static {p0}, Le/e/a/Ui110;->flat(Landroid/widget/Button;)V

    invoke-static {p0}, Le/e/a/Ui110;->circle(Landroid/view/View;)V

    const-string v0, ""

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u3044\u3044\u306d"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p1, :cond_25

    const-string v0, " \u2713"

    :cond_25
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    const/4 v1, 0x2

    new-array v1, v1, [Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/Ui110;->actionColor(Landroid/content/Context;)I

    move-result v3

    const/16 v4, 0x64

    invoke-static {v2, v3, v4}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Landroid/graphics/drawable/InsetDrawable;

    new-instance v4, Le/e/a/Ui110$Heart;

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5, p1}, Le/e/a/Ui110$Heart;-><init>(Landroid/content/Context;Z)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p1

    const/16 v5, 0x9

    invoke-static {p1, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    invoke-direct {v2, v4, p1}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    const/4 p1, 0x1

    aput-object v2, v1, p1

    invoke-direct {v0, v1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setCompoundDrawablePadding(I)V

    const/16 p1, 0x11

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setGravity(I)V

    invoke-virtual {p0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    if-eqz p1, :cond_8e

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x28

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_8e
    return-void
.end method

.method static primary(Landroid/widget/Button;)V
    .registers 4

    .line 8
    invoke-static {p0}, Le/e/a/Ui110;->flat(Landroid/widget/Button;)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    const/16 v2, 0xc

    invoke-static {v0, v1, v2}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Le/e/a/DialogColors;->onAccent(I)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setTextColor(I)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x10

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1, v2}, Landroid/widget/Button;->setPadding(IIII)V

    return-void
.end method
