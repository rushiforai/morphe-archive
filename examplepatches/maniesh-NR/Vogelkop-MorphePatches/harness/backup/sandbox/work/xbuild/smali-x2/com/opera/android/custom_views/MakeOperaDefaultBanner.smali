.class public final Lcom/opera/android/custom_views/MakeOperaDefaultBanner;
.super Landroidx/cardview/widget/CardView;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001\u00a8\u0006\u0002"
    }
    d2 = {
        "Lcom/opera/android/custom_views/MakeOperaDefaultBanner;",
        "Landroidx/cardview/widget/CardView;",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic h:I


# instance fields
.field public final g:Lei;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 15
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const v0, 0x7f040165

    invoke-direct {p0, p1, p2, v0}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d0267

    invoke-virtual {v1, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v1, 0x7f0a0231

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lcom/opera/android/custom_views/StylingImageButton;

    const/4 v2, 0x0

    if-eqz v5, :cond_f9

    const v1, 0x7f0a056f

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v6, :cond_f9

    const v1, 0x7f0a097e

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Lcom/google/android/material/button/MaterialButton;

    if-eqz v7, :cond_f9

    const v1, 0x7f0a0b66

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v3, :cond_f9

    const v1, 0x7f0a06c5

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v8, v3

    check-cast v8, Landroid/widget/TextView;

    if-eqz v8, :cond_f9

    const v1, 0x7f0a0b9a

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Landroid/widget/TextView;

    if-eqz v9, :cond_f9

    const v1, 0x7f0a0b9b

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v10, v3

    check-cast v10, Landroid/widget/TextView;

    if-eqz v10, :cond_f9

    const v1, 0x7f0a0b9c

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v11, v3

    check-cast v11, Landroid/widget/TextView;

    if-eqz v11, :cond_f9

    const v1, 0x7f0a0b9e

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v3, :cond_f9

    new-instance v3, Lei;

    move-object v4, p0

    invoke-direct/range {v3 .. v11}, Lei;-><init>(Lcom/opera/android/custom_views/MakeOperaDefaultBanner;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageView;Lcom/google/android/material/button/MaterialButton;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V

    iput-object v3, v4, Lcom/opera/android/custom_views/MakeOperaDefaultBanner;->g:Lei;

    sget-object p0, Lkhh;->s:[I

    const/4 v1, 0x0

    invoke-virtual {p1, p2, p0, v0, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p0

    const/4 p1, 0x3

    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-virtual {v4, p1}, Landroidx/cardview/widget/CardView;->b(I)V

    const/4 p1, 0x0

    const/4 p2, 0x4

    invoke-virtual {p0, p2, p1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p1

    iget-object p2, v4, Landroidx/cardview/widget/CardView;->e:Lpad;

    iget-object p2, p2, Lpad;->b:Ljava/lang/Object;

    check-cast p2, Li8i;

    iget v0, p2, Li8i;->a:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_ac

    iput p1, p2, Li8i;->a:F

    invoke-virtual {p2, v2}, Li8i;->b(Landroid/graphics/Rect;)V

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_ac
    invoke-virtual {p0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    const-string p2, ""

    if-nez p1, :cond_b5

    move-object p1, p2

    :cond_b5
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_bd

    move-object v0, p2

    :cond_bd
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_c5

    move-object p2, v1

    :cond_c5
    invoke-virtual {v9, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v11, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, " "

    invoke-static {v1, p1, v0, p1, p2}, Lsko;->n(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v8, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {v4}, Landroid/view/View;->isLaidOut()Z

    move-result p0

    if-eqz p0, :cond_ef

    invoke-virtual {v4}, Landroid/view/View;->isLayoutRequested()Z

    move-result p0

    if-nez p0, :cond_ef

    invoke-virtual {v4}, Lcom/opera/android/custom_views/MakeOperaDefaultBanner;->d()V

    return-void

    :cond_ef
    new-instance p0, Lho3;

    const/4 p1, 0x5

    invoke-direct {p0, v4, p1}, Lho3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, p0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void

    :cond_f9
    move-object v4, p0

    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v2
.end method

.method public static e(Landroid/widget/TextView;I)Z
    .registers 3

    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result p0

    int-to-float p1, p1

    cmpl-float p0, p0, p1

    if-lez p0, :cond_17

    const/4 p0, 0x1

    return p0

    :cond_17
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final d()V
    .registers 13

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingStart()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingEnd()I

    move-result v1

    sub-int/2addr v0, v1

    const/high16 v1, 0x42fa0000    # 125.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    iget-object v2, p0, Lcom/opera/android/custom_views/MakeOperaDefaultBanner;->g:Lei;

    iget-object v3, v2, Lei;->d:Landroid/view/View;

    check-cast v3, Lcom/google/android/material/button/MaterialButton;

    iget-object v4, v2, Lei;->e:Landroid/view/View;

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    add-int/2addr v3, v1

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-gt v3, v0, :cond_2d

    move v3, v5

    goto :goto_2e

    :cond_2d
    move v3, v6

    :goto_2e
    iget-object v7, v2, Lei;->f:Ljava/lang/Object;

    check-cast v7, Lcom/opera/android/custom_views/StylingImageView;

    const/16 v8, 0x8

    if-eqz v3, :cond_38

    move v9, v6

    goto :goto_39

    :cond_38
    move v9, v8

    :goto_39
    invoke-virtual {v7, v9}, Landroid/view/View;->setVisibility(I)V

    iget-object v7, v2, Lei;->d:Landroid/view/View;

    check-cast v7, Lcom/google/android/material/button/MaterialButton;

    if-eqz v3, :cond_44

    move p0, v6

    goto :goto_65

    :cond_44
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance v9, Landroid/util/TypedValue;

    invoke-direct {v9}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v10

    const v11, 0x7f0406e5

    invoke-virtual {v10, v11, v9, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v9, v9, Landroid/util/TypedValue;->data:I

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    invoke-static {v9, p0}, Landroid/util/TypedValue;->complexToDimensionPixelSize(ILandroid/util/DisplayMetrics;)I

    move-result p0

    :goto_65
    sget-object v9, Lq9n;->c:Ll5b;

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    instance-of v10, v9, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v10, :cond_7e

    move-object v10, v9

    check-cast v10, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v10}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result v11

    if-eq v11, p0, :cond_7e

    invoke-virtual {v10, p0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    invoke-virtual {v7, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_7e
    if-nez v3, :cond_88

    iget-object p0, v2, Lei;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    :cond_88
    sub-int/2addr v0, v1

    iget-object p0, v2, Lei;->h:Landroid/view/View;

    check-cast p0, Landroid/widget/TextView;

    iget-object v1, v2, Lei;->g:Landroid/view/View;

    check-cast v1, Landroid/widget/TextView;

    invoke-static {v4, v0}, Lcom/opera/android/custom_views/MakeOperaDefaultBanner;->e(Landroid/widget/TextView;I)Z

    move-result v3

    if-nez v3, :cond_a4

    invoke-static {v1, v0}, Lcom/opera/android/custom_views/MakeOperaDefaultBanner;->e(Landroid/widget/TextView;I)Z

    move-result v3

    if-nez v3, :cond_a4

    invoke-static {p0, v0}, Lcom/opera/android/custom_views/MakeOperaDefaultBanner;->e(Landroid/widget/TextView;I)Z

    move-result v0

    if-nez v0, :cond_a4

    move v5, v6

    :cond_a4
    iget-object v0, v2, Lei;->i:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    if-eqz v5, :cond_ac

    move v2, v6

    goto :goto_ad

    :cond_ac
    move v2, v8

    :goto_ad
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    if-nez v5, :cond_b4

    move v0, v6

    goto :goto_b5

    :cond_b4
    move v0, v8

    :goto_b5
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    if-nez v5, :cond_bc

    move v0, v6

    goto :goto_bd

    :cond_bc
    move v0, v8

    :goto_bd
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    if-eqz v5, :cond_c3

    move v6, v8

    :cond_c3
    invoke-virtual {p0, v6}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p1, p0, Lcom/opera/android/custom_views/MakeOperaDefaultBanner;->g:Lei;

    iget-object p1, p1, Lei;->b:Landroid/view/ViewGroup;

    check-cast p1, Lcom/opera/android/custom_views/MakeOperaDefaultBanner;

    new-instance v0, Ldnb;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Ldnb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
