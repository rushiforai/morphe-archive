.class public final Lht1;
.super Lc63;
.source "SourceFile"


# instance fields
.field public final e:Lit1;

.field public final f:Lumi;

.field public final g:Lua7;


# direct methods
.method public constructor <init>(Lit1;Lumi;Lgjm;Lgw3;)V
    .registers 6

    sget-object v0, Let1;->c:Let1;

    invoke-direct {p0, p3, p4, v0}, Lc63;-><init>(Lgjm;Lqcf;Ljava/lang/Object;)V

    iput-object p1, p0, Lht1;->e:Lit1;

    iput-object p2, p0, Lht1;->f:Lumi;

    new-instance p1, Lua7;

    invoke-direct {p1, p0, p3}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p1, p0, Lht1;->g:Lua7;

    return-void
.end method


# virtual methods
.method public final g0(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 10

    new-instance p1, Landroid/app/Dialog;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f150295

    invoke-direct {p1, v0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    const v0, 0x7f0d0058

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setContentView(I)V

    const v0, 0x7f0a02de

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->requireViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a01b6

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/OperaButtonBarLayout;

    const/4 v3, 0x0

    if-eqz v2, :cond_a0

    move-object v1, v0

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    const v2, 0x7f0a06b5

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v4, :cond_9f

    const v2, 0x7f0a074b

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v4, :cond_9f

    const v2, 0x7f0a084d

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v5, :cond_9f

    const v2, 0x7f0a0a4f

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v6, :cond_9f

    const v2, 0x7f0a0a9f

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/Space;

    if-eqz v7, :cond_9f

    const v2, 0x7f0a06c5

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/custom_views/DialogTitle;

    if-eqz v7, :cond_9f

    new-instance v0, Lkf;

    invoke-direct {v0, v1, v4, v5, v6}, Lkf;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/custom_views/FadingRecyclerView;)V

    const/4 v1, 0x0

    invoke-virtual {v6, v1}, Landroid/view/View;->setWillNotDraw(Z)V

    new-instance v2, Lvx;

    const/4 v6, 0x3

    invoke-direct {v2, p0, v6}, Lvx;-><init>(Ljava/lang/Object;B)V

    iget-object v6, p0, Lht1;->f:Lumi;

    invoke-interface {v6, v2}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v2

    new-instance v6, Lxj;

    const/16 v7, 0xa

    invoke-direct {v6, v0, p0, v7}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v6}, Lnml;->c(Ln5o;)Loml;

    move-result-object v0

    invoke-virtual {v0, v3, v3}, Loml;->a(Ljava/lang/Object;Ljri;)V

    new-instance v0, Lgt1;

    invoke-direct {v0, p0, p1, v1}, Lgt1;-><init>(Lht1;Landroid/app/Dialog;B)V

    invoke-virtual {v5, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lgt1;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lgt1;-><init>(Lht1;Landroid/app/Dialog;B)V

    invoke-virtual {v4, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1

    :cond_9f
    move v1, v2

    :cond_a0
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v3
.end method

.method public final h0()Ljava/lang/Class;
    .registers 1

    iget-object p0, p0, Lht1;->g:Lua7;

    invoke-virtual {p0}, Lua7;->p()Ln37;

    move-result-object p0

    check-cast p0, Lft1;

    const-class p0, Lft1;

    return-object p0
.end method
