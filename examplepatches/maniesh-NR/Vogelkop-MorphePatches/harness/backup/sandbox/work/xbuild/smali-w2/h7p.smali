.class public final Lh7p;
.super Lfjo;
.source "SourceFile"


# instance fields
.field public a:Lnxo;


# virtual methods
.method public final onAttachedToWindow()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-object v0, p0, Lh7p;->a:Lnxo;

    iget-object v1, v0, Lnxo;->j:Landroid/widget/FrameLayout;

    if-nez v1, :cond_17

    new-instance v1, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lnxo;->b(Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;)V

    goto :goto_1a

    :cond_17
    invoke-static {v1}, Lupj;->j(Landroid/view/View;)V

    :goto_1a
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 8

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    iget-object v2, p0, Lh7p;->a:Lnxo;

    if-eqz v2, :cond_4d

    if-eqz v0, :cond_4d

    if-eqz v1, :cond_4d

    invoke-static {v2, v0, v1}, Lz4o;->k(Lnxo;II)[I

    move-result-object p1

    const/4 p2, 0x0

    move v0, p2

    :goto_16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x1

    if-ge v0, v1, :cond_45

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v3, v1, Lcom/opera/ad/view/VolumeMutableButton;

    const/high16 v4, 0x40000000    # 2.0f

    if-eqz v3, :cond_39

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v2, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    :goto_31
    invoke-static {v2, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Landroid/view/View;->measure(II)V

    goto :goto_42

    :cond_39
    aget v3, p1, p2

    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    aget v2, p1, v2

    goto :goto_31

    :goto_42
    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    :cond_45
    aget p2, p1, p2

    aget p1, p1, v2

    invoke-virtual {p0, p2, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void

    :cond_4d
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    return-void
.end method

.method public final onWindowFocusChanged(Z)V
    .registers 3

    iget-object v0, p0, Lh7p;->a:Lnxo;

    if-eqz v0, :cond_d

    if-eqz p1, :cond_a

    invoke-virtual {v0}, Lnxo;->g()V

    goto :goto_d

    :cond_a
    invoke-virtual {v0}, Lnxo;->f()V

    :cond_d
    :goto_d
    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    return-void
.end method

.method public final unregister()V
    .registers 2

    iget-object v0, p0, Lh7p;->a:Lnxo;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Lnxo;->f()V

    :cond_7
    invoke-static {p0}, Lupj;->j(Landroid/view/View;)V

    return-void
.end method
