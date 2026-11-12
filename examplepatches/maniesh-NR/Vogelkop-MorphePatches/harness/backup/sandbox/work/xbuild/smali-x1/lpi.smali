.class public final Llpi;
.super Lmx3;
.source "SourceFile"


# virtual methods
.method public final a()V
    .registers 16

    const v0, 0x7f0a080a

    iget-object p0, p0, Lmx3;->a:Lzp1;

    invoke-virtual {p0, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const v1, 0x7f0a026f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    const v3, 0x7f0a02a5

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    const v5, 0x7f0d0054

    const/4 v6, 0x0

    invoke-virtual {p0, v5, v0, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    move-object v5, p0

    check-cast v5, Lcom/opera/android/custom_views/TopPaddingFadingScrollView;

    const v7, 0x7f0a026e

    invoke-static {v7, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/LinearLayout;

    if-eqz v8, :cond_e4

    const v7, 0x7f0a02a4

    invoke-static {v7, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/FrameLayout;

    if-eqz v8, :cond_e4

    invoke-static {v3, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/FrameLayout;

    if-eqz v9, :cond_e5

    const v3, 0x102000b

    invoke-static {v3, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v10, :cond_e5

    const v11, 0x7f0a06b6

    invoke-static {v11, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    if-eqz v12, :cond_e2

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    if-eqz p0, :cond_79

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p0

    goto :goto_7b

    :cond_79
    const-string p0, ""

    :goto_7b
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    const/4 v3, 0x1

    if-lez v1, :cond_84

    move v1, v3

    goto :goto_85

    :cond_84
    move v1, v6

    :goto_85
    if-eqz v1, :cond_8d

    invoke-virtual {v10, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v10, v6}, Landroid/view/View;->setVisibility(I)V

    :cond_8d
    invoke-virtual {v4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-gtz v4, :cond_9a

    move v3, v6

    :cond_9a
    if-eqz v3, :cond_d7

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    move v7, v6

    :goto_a1
    if-ge v7, v4, :cond_d4

    invoke-virtual {p0, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    invoke-virtual {p0, v10}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-virtual {v8, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-nez v7, :cond_be

    invoke-virtual {v10}, Landroid/view/View;->getPaddingStart()I

    move-result v11

    invoke-virtual {v10}, Landroid/view/View;->getPaddingEnd()I

    move-result v13

    invoke-virtual {v10}, Landroid/view/View;->getPaddingBottom()I

    move-result v14

    invoke-virtual {v10, v11, v6, v13, v14}, Landroid/view/View;->setPaddingRelative(IIII)V

    :cond_be
    add-int/lit8 v11, v4, -0x1

    if-ne v7, v11, :cond_d1

    invoke-virtual {v10}, Landroid/view/View;->getPaddingStart()I

    move-result v11

    invoke-virtual {v10}, Landroid/view/View;->getPaddingTop()I

    move-result v13

    invoke-virtual {v10}, Landroid/view/View;->getPaddingEnd()I

    move-result v14

    invoke-virtual {v10, v11, v13, v14, v6}, Landroid/view/View;->setPaddingRelative(IIII)V

    :cond_d1
    add-int/lit8 v7, v7, 0x1

    goto :goto_a1

    :cond_d4
    invoke-virtual {v9, v6}, Landroid/view/View;->setVisibility(I)V

    :cond_d7
    if-eqz v1, :cond_de

    if-eqz v3, :cond_de

    invoke-virtual {v12, v6}, Landroid/view/View;->setVisibility(I)V

    :cond_de
    invoke-virtual {v0, v5, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    return-void

    :cond_e2
    move v3, v11

    goto :goto_e5

    :cond_e4
    move v3, v7

    :cond_e5
    :goto_e5
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
