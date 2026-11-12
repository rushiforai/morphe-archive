.class public final Lh8d;
.super Luim;
.source "SourceFile"

# interfaces
.implements Ldmk;
.implements Lhf3;


# instance fields
.field public final d:Z

.field public final e:Ljava/lang/String;

.field public final f:Lqb7;

.field public final g:Lg8d;

.field public final h:Lfmk;

.field public final i:Z

.field public j:Lq5g;

.field public k:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lg8d;Lfmk;Lqb7;ILjava/lang/String;)V
    .registers 7

    invoke-direct {p0}, Luim;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lh8d;->d:Z

    iput-object p1, p0, Lh8d;->g:Lg8d;

    iput-object p2, p0, Lh8d;->h:Lfmk;

    invoke-interface {p1}, Lg8d;->Q()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lh8d;->e:Ljava/lang/String;

    iput-object p5, p0, Lh8d;->k:Ljava/lang/String;

    iput-object p3, p0, Lh8d;->f:Lqb7;

    iput-boolean p4, p0, Lh8d;->i:Z

    return-void
.end method


# virtual methods
.method public final D()V
    .registers 1

    return-void
.end method

.method public final E()V
    .registers 2

    iget-object v0, p0, Lh8d;->g:Lg8d;

    invoke-interface {v0}, Lg8d;->J()V

    invoke-virtual {p0}, Landroidx/fragment/app/i;->dismiss()V

    return-void
.end method

.method public final g0(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 4

    new-instance p1, Lz46;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/i;->getTheme()I

    move-result v1

    invoke-direct {p1, v0, v1}, Lz46;-><init>(Landroid/content/Context;I)V

    iget-boolean p0, p0, Lh8d;->d:Z

    if-eqz p0, :cond_19

    new-instance p0, Lkim;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1, p0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    :cond_19
    return-object p1
.end method

.method public final handleSubscriptionPlans(Lbmk;)V
    .registers 7

    new-instance v0, Lf8d;

    iget v1, p1, Lbmk;->d:F

    iget-object p1, p1, Lbmk;->c:Lcsh;

    invoke-direct {v0, v1}, Lf8d;-><init>(F)V

    const/4 v1, 0x1

    iget-boolean v2, p0, Lh8d;->i:Z

    if-eqz v2, :cond_3e

    if-ne v2, v1, :cond_61

    iget-object v2, p0, Lh8d;->j:Lq5g;

    iget-object v2, v2, Lq5g;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;

    invoke-interface {p1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v3, Lzx1;

    const/16 v4, 0xe

    invoke-direct {v3, p0, v4}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p1

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-virtual {v2, p1, v0}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->d(Ljava/util/List;Lf8d;)V

    iget-object p1, p0, Lh8d;->j:Lq5g;

    iget-object p1, p1, Lq5g;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;

    iget-object p0, p0, Lh8d;->k:Ljava/lang/String;

    invoke-virtual {p1, p0, v1}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->f(Ljava/lang/String;Z)Z

    return-void

    :cond_3e
    iget-object v2, p0, Lh8d;->j:Lq5g;

    iget-object v2, v2, Lq5g;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;

    invoke-virtual {v2, p1, v0}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->d(Ljava/util/List;Lf8d;)V

    iget-object p1, p0, Lh8d;->j:Lq5g;

    iget-object p1, p1, Lq5g;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;

    iget-object v0, p0, Lh8d;->k:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->f(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_61

    iget-object p1, p0, Lh8d;->j:Lq5g;

    iget-object p1, p1, Lq5g;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;

    iget-object p0, p0, Lh8d;->e:Ljava/lang/String;

    invoke-virtual {p1, p0, v1}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->f(Ljava/lang/String;Z)Z

    :cond_61
    return-void
.end method

.method public final handleSubscriptionPlans(Lcmk;)V
    .registers 2

    .line 98
    return-void
.end method

.method public final handleSubscriptionPlans(Lzlk;)V
    .registers 2

    .line 99
    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 6

    const p2, 0x7f0d033e

    const/4 p3, 0x0

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a01fe

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz p3, :cond_33

    const p2, 0x7f0a0af2

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;

    if-eqz v1, :cond_33

    new-instance p2, Lq5g;

    check-cast p1, Landroid/widget/LinearLayout;

    const/4 v0, 0x1

    invoke-direct {p2, p1, p3, v1, v0}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p2, p0, Lh8d;->j:Lq5g;

    new-instance p2, Lyzb;

    const/16 p3, 0x11

    invoke-direct {p2, p0, p3}, Lyzb;-><init>(Ljava/lang/Object;B)V

    iput-object p2, v1, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->b:Lvlk;

    return-object p1

    :cond_33
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v0
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/i;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lh8d;->j:Lq5g;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lh8d;->h:Lfmk;

    iget-object p1, p1, Lfmk;->c:Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    new-instance v0, Ld8d;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2, v0}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p1, p0, Lh8d;->j:Lq5g;

    iget-object p1, p1, Lq5g;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    iget-boolean p2, p0, Lh8d;->i:Z

    if-eqz p2, :cond_25

    const/4 v0, 0x1

    if-ne p2, v0, :cond_28

    const v1, 0x7f140420

    goto :goto_28

    :cond_25
    const v1, 0x7f141194

    :cond_28
    :goto_28
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lh8d;->j:Lq5g;

    iget-object p1, p1, Lq5g;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance p2, Lsma;

    const/16 v0, 0x17

    invoke-direct {p2, p0, v0}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final v()V
    .registers 1

    return-void
.end method
