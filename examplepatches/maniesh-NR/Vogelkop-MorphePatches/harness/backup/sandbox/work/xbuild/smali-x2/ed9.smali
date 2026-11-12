.class public final Led9;
.super Ls63;
.source "SourceFile"

# interfaces
.implements Ljbl;


# virtual methods
.method public final s0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lepj;)Ldgh;
    .registers 13

    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    const/4 v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    const-string v3, "parent"

    const-string v4, "Missing required view with ID: "

    const v5, 0x7f0a06b5

    const v6, 0x7f0a0549

    const v7, 0x7f0a02a3

    const v8, 0x7f0a025f

    if-eqz p3, :cond_71

    if-eq p3, v1, :cond_27

    if-eq p3, v0, :cond_27

    const/4 v0, 0x3

    if-eq p3, v0, :cond_27

    const/4 v0, 0x4

    if-eq p3, v0, :cond_27

    invoke-static {}, Lh9o;->p()V

    return-object v2

    :cond_27
    if-eqz p2, :cond_6d

    const p3, 0x7f0d01bd

    invoke-virtual {p1, p3, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-static {v8, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    if-eqz p1, :cond_5c

    invoke-static {v7, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/touch/CurveOverlayView;

    if-eqz p3, :cond_5a

    invoke-static {v6, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz p3, :cond_58

    invoke-static {v5, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz p3, :cond_5d

    new-instance p2, Lg77;

    sget-object v0, Lick;->a:Lick;

    invoke-direct {p2, p1, p3, v0}, Lg77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_c4

    :cond_58
    move v5, v6

    goto :goto_5d

    :cond_5a
    move v5, v7

    goto :goto_5d

    :cond_5c
    move v5, v8

    :cond_5d
    :goto_5d
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v2

    :cond_6d
    invoke-static {v3}, Lt3p;->q(Ljava/lang/String;)V

    return-object v2

    :cond_71
    if-eqz p2, :cond_10f

    const p3, 0x7f0d01be

    invoke-virtual {p1, p3, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-static {v8, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    if-eqz p1, :cond_fe

    invoke-static {v7, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/touch/CurveOverlayView;

    if-eqz p3, :cond_fc

    const p3, 0x7f0a0390

    invoke-static {p3, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_fa

    invoke-static {v6, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz p3, :cond_f8

    invoke-static {v5, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz p3, :cond_ff

    const v5, 0x7f0a0aca

    invoke-static {v5, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/FrameLayout;

    if-eqz v6, :cond_ff

    new-instance p2, Lg77;

    new-instance v2, Lkck;

    new-array v0, v0, [Landroid/view/ViewGroup;

    const/4 v4, 0x0

    aput-object v6, v0, v4

    aput-object v3, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v2, v0}, Lkck;-><init>(Ljava/util/List;)V

    invoke-direct {p2, p1, p3, v2}, Lg77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_c4
    iget-object p1, p2, Lg77;->a:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    new-instance p3, Lyk4;

    const/16 v0, 0x1a

    invoke-direct {p3, p0, v0}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    iget-object p1, p2, Lg77;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    const p3, 0x7f14078d

    const-string v0, "opera.com/connect"

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, p3, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance p3, Ldd9;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p3, v1}, Lagc;-><init>(Landroid/content/Context;)V

    invoke-static {p1, p0, v0, v0, p3}, Lphj;->c0(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lagc;)V

    iget-object p0, p2, Lg77;->c:Ljava/lang/Object;

    check-cast p0, Ldgh;

    return-object p0

    :cond_f8
    move v5, v6

    goto :goto_ff

    :cond_fa
    move v5, p3

    goto :goto_ff

    :cond_fc
    move v5, v7

    goto :goto_ff

    :cond_fe
    move v5, v8

    :cond_ff
    :goto_ff
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v2

    :cond_10f
    invoke-static {v3}, Lt3p;->q(Ljava/lang/String;)V

    return-object v2
.end method

.method public final y()Ljava/lang/String;
    .registers 1

    const-string p0, "flow-scan-intro"

    return-object p0
.end method
