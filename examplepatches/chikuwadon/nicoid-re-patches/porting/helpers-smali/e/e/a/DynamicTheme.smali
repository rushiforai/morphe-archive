.class public final Le/e/a/DynamicTheme;
.super Ljava/lang/Object;
.source "DynamicTheme.java"


# direct methods
.method public static apply(Landroid/app/Activity;)V
    .registers 2

    invoke-static {p0}, Le/e/a/ThemeChoice;->apply(Landroid/app/Activity;)V

    return-void
.end method

.method public static background(Landroid/view/View;)V
    .registers 2

    invoke-static {p0}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    return-void
.end method

.method public static button(Landroid/widget/Button;)V
    .registers 2

    invoke-static {p0}, Le/e/a/ThemeChoice;->button(Landroid/widget/Button;)V

    return-void
.end method

.method public static commentTextColor(Landroid/view/View;)I
    .registers 2

    invoke-static {p0}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method public static compactDialogButtons(Landroid/app/AlertDialog;)V
    .registers 7

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_5b

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinimumHeight(I)V

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    if-eqz v5, :cond_35

    invoke-virtual {v0}, Landroid/widget/Button;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    const/high16 v4, 0x42300000    # 44.0f

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v4, v3

    float-to-int v4, v4

    iput v4, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/high16 v4, 0x42c00000    # 96.0f

    invoke-virtual {v0}, Landroid/widget/Button;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v4, v3

    float-to-int v4, v4

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setMinimumWidth(I)V

    :cond_35
    invoke-static {v0}, Le/e/a/DynamicTheme;->styleDialogAction(Landroid/widget/Button;)V

    invoke-virtual {v0}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v3, v2, Landroid/view/View;

    if-eqz v3, :cond_5b

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    move-result v4

    invoke-virtual {v2, v3, v1, v4, v1}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v2, v1}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {v0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/DynamicTheme;->dialogFooterColor(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_5b
    const/4 v0, -0x2

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_76

    invoke-virtual {v0}, Landroid/widget/Button;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x42c00000    # 96.0f

    mul-float/2addr v4, v3

    float-to-int v4, v4

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setMinimumWidth(I)V

    invoke-static {v0}, Le/e/a/DynamicTheme;->styleDialogAction(Landroid/widget/Button;)V

    :cond_76
    return-void
.end method

.method public static dialogFooterColor(Landroid/content/Context;)I
    .registers 2

    invoke-static {p0}, Le/e/a/DynamicTheme;->isNight(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_a

    const v0, -0xe4e2de

    return v0

    :cond_a
    const v0, -0x1

    return v0
.end method

.method public static isNight(Landroid/content/Context;)Z
    .registers 2

    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public static labelBackground(Landroid/view/View;)I
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/DynamicTheme;->isNight(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_e

    const v0, -0xd7c9b5

    return v0

    :cond_e
    const v0, -0x20170c

    return v0
.end method

.method public static menuCategory(Landroid/view/View;)V
    .registers 7

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x41000000    # 8.0f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    invoke-static {p0}, Le/e/a/DynamicTheme;->labelBackground(Landroid/view/View;)I

    move-result v1

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v2, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    new-instance v5, Landroid/graphics/drawable/InsetDrawable;

    move v3, v0

    move-object v0, v5

    move-object v1, v2

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v2, v3, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method public static secondaryTextColor(Landroid/view/View;)I
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/DynamicTheme;->isNight(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_e

    const v0, -0x333334

    return v0

    :cond_e
    const v0, -0xa6a6a7

    return v0
.end method

.method public static styleDialogAction(Landroid/widget/Button;)V
    .registers 7

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/DynamicTheme;->isNight(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_14

    const v2, -0xcbb69c

    const v3, -0x563811

    const v4, -0x1

    goto :goto_1d

    :cond_14
    const v2, -0x231609

    const v3, -0xbd9a73

    const v4, -0xe7d4bd

    :goto_1d
    invoke-virtual {p0, v4}, Landroid/widget/Button;->setTextColor(I)V

    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v5, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/4 v2, 0x0

    invoke-virtual {v5, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setTextColor(I)V

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v2, v0

    invoke-virtual {v5, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {p0, v5}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public static textColor(Landroid/view/View;)I
    .registers 2

    invoke-static {p0}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result v0

    return v0
.end method
