.class public final Lxtg;
.super Lltl;
.source "SourceFile"


# instance fields
.field public final r:Lua7;

.field public final s:Lzyk;

.field public t:Lttg;

.field public u:Z

.field public v:Lkf;


# direct methods
.method public constructor <init>(Lgjm;)V
    .registers 4

    const v0, 0x7f0d01e4

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x1

    iput-boolean v1, v0, Litl;->e:Z

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lxtg;->r:Lua7;

    new-instance p1, Lyse;

    const/4 v0, 0x7

    invoke-direct {p1, p0, v0}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lxtg;->s:Lzyk;

    return-void
.end method

.method public static J0()V
    .registers 3

    sget-object v0, Llqm;->v:Llqm;

    const/4 v1, 0x0

    const-string v2, "https://support-vpn-pro.opera.com/"

    invoke-static {v2, v0, v1}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    const/4 v1, 0x3

    iput v1, v0, Lvx3;->b:I

    const/4 v1, 0x1

    invoke-static {v0, v1, v0}, Lo18;->t(Lvx3;ZLvx3;)V

    return-void
.end method


# virtual methods
.method public final G0()V
    .registers 6

    iget-object v0, p0, Lxtg;->r:Lua7;

    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object v0

    check-cast v0, Lptg;

    invoke-virtual {p0}, Lxtg;->H0()Lvug;

    move-result-object p0

    iget-object v0, v0, Lptg;->c:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object v1

    new-instance v2, Ljj4;

    const/16 v3, 0xe

    const/4 v4, 0x0

    invoke-direct {v2, p0, v0, v4, v3}, Ljj4;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v1, v4, v4, v2, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

.method public final H0()Lvug;
    .registers 1

    iget-object p0, p0, Lxtg;->s:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvug;

    return-object p0
.end method

.method public final I0(I)V
    .registers 10

    iget-boolean v0, p0, Lxtg;->u:Z

    if-nez v0, :cond_3b

    const/4 v0, 0x1

    iput-boolean v0, p0, Lxtg;->u:Z

    iget-object v0, p0, Lxtg;->r:Lua7;

    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object v0

    check-cast v0, Lptg;

    invoke-virtual {p0}, Lxtg;->H0()Lvug;

    move-result-object p0

    iget v1, v0, Lptg;->a:I

    iget-object v0, v0, Lptg;->b:Lltg;

    iget-object p0, p0, Lvug;->f:Lorm;

    invoke-static {v1}, Lbwg;->E(I)Lwm0;

    move-result-object v3

    const-string v1, "organic"

    if-eqz v0, :cond_27

    iget-object v2, v0, Lltg;->a:Ljava/lang/String;

    if-eqz v2, :cond_27

    move-object v4, v2

    goto :goto_28

    :cond_27
    move-object v4, v1

    :goto_28
    if-eqz v0, :cond_30

    iget-object v0, v0, Lltg;->b:Ljava/lang/String;

    if-eqz v0, :cond_30

    move-object v5, v0

    goto :goto_31

    :cond_30
    move-object v5, v1

    :goto_31
    invoke-static {p1}, Lbwg;->F(I)Lxm0;

    move-result-object v6

    check-cast p0, Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-nez p1, :cond_3c

    :cond_3b
    return-void

    :cond_3c
    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lck0;

    invoke-direct {v1, p1, v0}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v2, Lrg;

    const/16 v7, 0xb

    invoke-direct/range {v2 .. v7}, Lrg;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final g0()V
    .registers 2

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lxtg;->I0(I)V

    invoke-super {p0}, Lryl;->g0()V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lxtg;->I0(I)V

    invoke-super {p0}, Lryl;->onDestroy()V

    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lxtg;->t:Lttg;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 14

    invoke-super/range {p0 .. p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljj4;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v1, v3, v2, v0}, Ljj4;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1}, Lf03;->g(Lkotlin/jvm/functions/Function2;)Lj94;

    move-result-object v0

    const/4 v1, -0x1

    invoke-static {v0, v1}, Lic4;->l(Lf99;I)Lf99;

    move-result-object v0

    new-instance v1, Lcw;

    const/16 v2, 0x10

    invoke-direct {v1, v0, p0, v2}, Lcw;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v0

    new-instance v3, Lte5;

    const/4 v9, 0x4

    const/4 v10, 0x2

    const/4 v4, 0x2

    const-class v6, Lxtg;

    const-string v7, "applyLayoutVariant"

    const-string v8, "applyLayoutVariant(Lcom/opera/android/premium/giveaway/ui/PremiumGiveawayFragment$LayoutVariant;)V"

    move-object v5, p0

    invoke-direct/range {v3 .. v10}, Lte5;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v1, Lz99;

    const/4 v2, 0x2

    invoke-direct {v1, v0, v3, v2}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    invoke-static {v0}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v0

    invoke-static {v1, v0}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    invoke-virtual {p0}, Lxtg;->H0()Lvug;

    move-result-object v0

    iget-object v0, v0, Lvug;->i:Lnak;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    invoke-interface {v1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v1

    invoke-static {v0, v1}, Lscd;->D(Lf99;Ltcc;)Lj94;

    move-result-object v0

    new-instance v3, Lte5;

    const/4 v10, 0x3

    const-string v7, "applyUiState"

    const-string v8, "applyUiState(Lcom/opera/android/premium/giveaway/ui/PremiumGiveawayUiState;)V"

    invoke-direct/range {v3 .. v10}, Lte5;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v1, Lz99;

    invoke-direct {v1, v0, v3, v2}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    invoke-static {v0}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v0

    invoke-static {v1, v0}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    invoke-virtual {p0}, Lxtg;->H0()Lvug;

    move-result-object v0

    iget-object v0, v0, Lvug;->j:Lnak;

    new-instance v1, Lyc1;

    const/16 v3, 0xd

    invoke-direct {v1, v0, v3}, Lyc1;-><init>(Lf99;B)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-static {v1, v0}, Lscd;->D(Lf99;Ltcc;)Lj94;

    move-result-object v0

    new-instance v3, Lte5;

    const/4 v10, 0x4

    const-string v7, "handleUiEvent"

    const-string v8, "handleUiEvent(Lcom/opera/android/premium/giveaway/ui/PremiumGiveawayUiEvent;)V"

    invoke-direct/range {v3 .. v10}, Lte5;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v1, Lz99;

    invoke-direct {v1, v0, v3, v2}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    invoke-static {v0}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v0

    invoke-static {v1, v0}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 3

    const p1, 0x7f0a02a9

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lkf;->e(Landroid/view/View;)Lkf;

    move-result-object p1

    iput-object p1, p0, Lxtg;->v:Lkf;

    return-void
.end method
