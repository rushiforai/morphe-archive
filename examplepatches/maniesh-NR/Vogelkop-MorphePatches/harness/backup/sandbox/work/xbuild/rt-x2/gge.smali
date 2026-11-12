.class public final Lgge;
.super Llj;
.source "SourceFile"

# interfaces
.implements Ljbl;


# instance fields
.field public final r:Lbf9;

.field public final s:Lcom/opera/android/settings/SettingsManager;

.field public t:Lkf;

.field public u:Lzq2;

.field public v:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lbf9;Lcom/opera/android/settings/SettingsManager;)V
    .registers 6

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    iget-object v1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    const/4 v2, 0x2

    iput v2, v1, Litl;->k:I

    const v2, 0x7f1407ad

    invoke-virtual {v0, v2}, Lu7k;->s(I)V

    invoke-direct {p0, v1}, Lltl;-><init>(Litl;)V

    iput-object p1, p0, Lgge;->r:Lbf9;

    iput-object p2, p0, Lgge;->s:Lcom/opera/android/settings/SettingsManager;

    return-void
.end method

.method public static G0(Landroidx/fragment/app/w;)Z
    .registers 7

    const-string v0, "flow"

    invoke-virtual {p0, v0}, Landroidx/fragment/app/w;->F(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    check-cast v1, Lfge;

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v1, :cond_1b

    iget-object v5, v1, Lfge;->u:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, v1, Lfge;->t:Lbf9;

    invoke-virtual {v5, v1}, Lcom/opera/android/settings/SettingsManager;->r(Lbf9;)Z

    move-result v1

    if-nez v1, :cond_1b

    invoke-virtual {p0, v2, v4, v0}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    move-result v3

    :cond_1b
    if-eqz v3, :cond_1e

    return v4

    :cond_1e
    const-string v0, "flow-onboarding"

    invoke-virtual {p0, v2, v4, v0}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static H0(Landroid/view/View;)V
    .registers 5

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0707dd

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sget-object v1, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    instance-of v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_2d

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-ne v2, v0, :cond_23

    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-eq v2, v0, :cond_2d

    :cond_23
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {v1, v0, v2, v0, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_2d
    return-void
.end method


# virtual methods
.method public final h0(Landroidx/fragment/app/w;)V
    .registers 2

    invoke-static {p1}, Lgge;->G0(Landroidx/fragment/app/w;)Z

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Lltl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p1, p0, Lgge;->t:Lkf;

    if-eqz p1, :cond_20

    iget-object v0, p0, Lgge;->u:Lzq2;

    if-eqz v0, :cond_20

    iget-object p1, p1, Lkf;->c:Ljava/lang/Object;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-static {p1}, Lgge;->H0(Landroid/view/View;)V

    iget-object p1, p0, Lgge;->u:Lzq2;

    iget-object p1, p1, Lzq2;->c:Lcom/google/android/material/button/MaterialButton;

    invoke-static {p1}, Lgge;->H0(Landroid/view/View;)V

    iget-object p0, p0, Lgge;->u:Lzq2;

    iget-object p0, p0, Lzq2;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-static {p0}, Lgge;->H0(Landroid/view/View;)V

    :cond_20
    return-void
.end method

.method public final onDestroy()V
    .registers 3

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object v0, p0, Lgge;->s:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lgge;->r:Lbf9;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->r(Lbf9;)Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object v0, p0, Lgge;->v:Ljava/lang/Runnable;

    if-eqz v0, :cond_14

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_14
    const/4 v0, 0x0

    iput-object v0, p0, Lgge;->v:Ljava/lang/Runnable;

    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lgge;->t:Lkf;

    iput-object v0, p0, Lgge;->u:Lzq2;

    invoke-super {p0}, Lltl;->onDestroyView()V

    return-void
.end method

.method public final u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 6

    const v0, 0x7f0d02d1

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a0261

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    if-eqz v0, :cond_42

    const p2, 0x7f0a05f3

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    if-eqz v1, :cond_42

    new-instance p2, Lzq2;

    check-cast p1, Landroid/widget/LinearLayout;

    const/4 v2, 0x1

    invoke-direct {p2, p1, v0, v1, v2}, Lzq2;-><init>(Landroid/widget/LinearLayout;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;B)V

    iput-object p2, p0, Lgge;->u:Lzq2;

    new-instance p1, Ln42;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Ln42;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lgge;->u:Lzq2;

    iget-object p0, p0, Lzq2;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance p1, Ln42;

    const/4 p2, 0x3

    invoke-direct {p1, p2}, Ln42;-><init>(B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_42
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 5

    const v0, 0x7f0d02d2

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz p1, :cond_19

    check-cast p1, Landroid/widget/LinearLayout;

    new-instance p2, Lkf;

    const/16 v0, 0x13

    invoke-direct {p2, v0, p1, p1}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    iput-object p2, p0, Lgge;->t:Lkf;

    return-void

    :cond_19
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final y()Ljava/lang/String;
    .registers 1

    const-string p0, "flow-onboarding"

    return-object p0
.end method
