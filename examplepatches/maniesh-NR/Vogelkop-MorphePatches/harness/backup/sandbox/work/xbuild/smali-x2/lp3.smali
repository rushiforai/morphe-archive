.class public abstract Llp3;
.super Lcom/opera/android/bar/BottomBar;
.source "SourceFile"


# instance fields
.field public s:Landroid/view/View;

.field public t:I


# virtual methods
.method public final a(I)V
    .registers 2

    invoke-super {p0, p1}, Lcom/opera/android/bar/BottomBar;->a(I)V

    iget-object p0, p0, Llp3;->s:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method public final f()I
    .registers 1

    iget p0, p0, Llp3;->t:I

    return p0
.end method

.method public g()V
    .registers 2

    iget-object v0, p0, Llp3;->s:Landroid/view/View;

    invoke-static {v0}, Latj;->a(Landroid/view/View;)V

    iget-object p0, p0, Lcom/opera/android/bar/BottomBar;->g:Landroid/view/View;

    if-eqz p0, :cond_c

    invoke-static {p0}, Latj;->a(Landroid/view/View;)V

    :cond_c
    return-void
.end method

.method public l(I)V
    .registers 10

    iget-object v0, p0, Lcom/opera/android/bar/BottomBar;->g:Landroid/view/View;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    if-eqz v0, :cond_22

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_22

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v3, 0x7f040a4c

    invoke-static {v3, v0, v2}, Lf03;->w(ILandroid/content/Context;I)I

    move-result v3

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v1, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    add-int/2addr v0, v3

    goto :goto_23

    :cond_22
    move v0, v2

    :goto_23
    const/4 v3, 0x1

    if-lez v0, :cond_28

    move v4, v3

    goto :goto_29

    :cond_28
    move v4, v2

    :goto_29
    iget-object v5, p0, Lcom/opera/android/bar/BottomBar;->g:Landroid/view/View;

    if-eqz v5, :cond_31

    int-to-float v6, p1

    invoke-virtual {v5, v6}, Landroid/view/View;->setTranslationY(F)V

    :cond_31
    if-eqz v4, :cond_35

    if-lt p1, v0, :cond_36

    :cond_35
    move v3, v2

    :cond_36
    iget-object v5, p0, Lcom/opera/android/bar/BottomBar;->h:Landroid/view/View;

    if-eqz v5, :cond_43

    if-eqz v3, :cond_3e

    move v6, v2

    goto :goto_40

    :cond_3e
    const/16 v6, 0x8

    :goto_40
    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    :cond_43
    sub-int v5, p1, v0

    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    move-result v5

    iget-object v6, p0, Llp3;->s:Landroid/view/View;

    int-to-float v7, v5

    invoke-virtual {v6, v7}, Landroid/view/View;->setTranslationY(F)V

    if-eqz v4, :cond_61

    if-nez v3, :cond_61

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v1, v3}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    neg-int v1, v1

    goto :goto_62

    :cond_61
    move v1, v2

    :goto_62
    add-int v3, v0, v5

    add-int/2addr v3, v1

    iget-object v1, p0, Lcom/opera/android/bar/BottomBar;->i:Landroid/view/View;

    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1, v3}, Landroid/view/View;->setTranslationY(F)V

    if-eqz v4, :cond_75

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    :cond_75
    add-int/2addr v2, v5

    iput v2, p0, Llp3;->t:I

    invoke-virtual {p0, v2}, Lcom/opera/android/bar/BottomBar;->j(I)V

    invoke-virtual {p0}, Lcom/opera/android/bar/BottomBar;->m()V

    return-void
.end method

.method public n()I
    .registers 1

    const p0, 0x7f0a0109

    return p0
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f070099

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f07009a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    const v1, 0x7f0a0747

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-nez p0, :cond_23

    return-void

    :cond_23
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Ljo5;

    iput v0, v1, Ljo5;->P:I

    invoke-virtual {v1, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {v1, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public onFinishInflate()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    invoke-virtual {p0}, Llp3;->n()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Llp3;->s:Landroid/view/View;

    return-void
.end method
