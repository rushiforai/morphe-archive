.class public final Lsb6;
.super Li93;
.source "SourceFile"

# interfaces
.implements Lo37;


# instance fields
.field public final t:Lj25;

.field public final u:Ljl4;

.field public final v:Lumi;

.field public final w:Lr65;

.field public final x:Lua7;

.field public y:Lei;


# direct methods
.method public constructor <init>(Lumi;Lr65;Lgjm;)V
    .registers 8

    sget v0, Lfki;->a:I

    const/4 v1, 0x0

    const v2, 0x7f140fb8

    const v3, 0x7f10000d

    invoke-direct {p0, v2, v3, v0, v1}, Li93;-><init>(IIIZ)V

    new-instance v0, Lj25;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lj25;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lsb6;->t:Lj25;

    new-instance v0, Ljl4;

    const/16 v1, 0x18

    invoke-direct {v0, p0, v1}, Ljl4;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lsb6;->u:Ljl4;

    iput-object p1, p0, Lsb6;->v:Lumi;

    iput-object p2, p0, Lsb6;->w:Lr65;

    new-instance p1, Lua7;

    invoke-direct {p1, p0, p3}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p1, p0, Lsb6;->x:Lua7;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    iget-object p0, p0, Lsb6;->u:Ljl4;

    return-object p0
.end method

.method public final H0()Lcom/opera/android/settings/SettingsManager;
    .registers 2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    return-object p0
.end method

.method public final I0()V
    .registers 5

    iget-object v0, p0, Lsb6;->w:Lr65;

    invoke-virtual {v0}, Lr65;->m()Z

    move-result v0

    iget-object v1, p0, Lsb6;->y:Lei;

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-eqz v0, :cond_2e

    iget-object v0, v1, Lei;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lsb6;->y:Lei;

    iget-object v0, v0, Lei;->e:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lsb6;->y:Lei;

    iget-object v0, v0, Lei;->e:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v1, Lyk4;

    const/16 v2, 0x9

    invoke-direct {v1, p0, v2}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_2e
    iget-object v0, v1, Lei;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lsb6;->y:Lei;

    iget-object v0, v0, Lei;->e:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lsb6;->y:Lei;

    iget-object v0, v0, Lei;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lsb6;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string v1, "personalized_ads"

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result p0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v0, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    new-instance p0, Lqb6;

    invoke-direct {p0, v0}, Lqb6;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iput-object p0, v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    return-void
.end method

.method public final a()Loba;
    .registers 7

    iget-object v0, p0, Lsb6;->x:Lua7;

    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object v1

    check-cast v1, Lpb6;

    iget-boolean v1, v1, Lpb6;->a:Z

    if-eqz v1, :cond_7b

    invoke-virtual {p0}, Lsb6;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const-string v1, "process_news_topics"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p0}, Lsb6;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    const-string v2, "personalized_news"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result v1

    iget-object v2, p0, Lsb6;->y:Lei;

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v0, v1, :cond_40

    new-array v0, v3, [I

    iget-object v1, v2, Lei;->h:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    aput v1, v0, v4

    iget-object p0, p0, Lsb6;->y:Lei;

    iget-object p0, p0, Lei;->d:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result p0

    aput p0, v0, v5

    goto :goto_75

    :cond_40
    if-nez v0, :cond_5c

    new-array v0, v3, [I

    iget-object v1, v2, Lei;->h:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    aput v1, v0, v4

    iget-object p0, p0, Lsb6;->y:Lei;

    iget-object p0, p0, Lei;->d:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result p0

    aput p0, v0, v5

    :goto_5a
    move v4, v5

    goto :goto_75

    :cond_5c
    new-array v0, v3, [I

    iget-object v1, v2, Lei;->d:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    aput v1, v0, v4

    iget-object p0, p0, Lsb6;->y:Lei;

    iget-object p0, p0, Lei;->h:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result p0

    aput p0, v0, v5

    goto :goto_5a

    :goto_75
    new-instance p0, Loba;

    invoke-direct {p0, v0, v4}, Loba;-><init>([II)V

    return-object p0

    :cond_7b
    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object p0

    check-cast p0, Lpb6;

    iget-object p0, p0, Lpb6;->b:Loba;

    return-object p0
.end method

.method public final onDestroyView()V
    .registers 3

    invoke-super {p0}, Lltl;->onDestroyView()V

    invoke-virtual {p0}, Lsb6;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    iget-object v1, p0, Lsb6;->t:Lj25;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lsb6;->y:Lei;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p1

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    new-instance p2, Lrb6;

    invoke-virtual {p0}, Lsb6;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-direct {p2, v0}, Lrb6;-><init>(Lcom/opera/android/settings/SettingsManager;)V

    invoke-virtual {p1, p2}, Ltcc;->a(Lmdc;)V

    invoke-virtual {p0}, Lsb6;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object p1

    iget-object p2, p0, Lsb6;->t:Lj25;

    invoke-virtual {p1, p2}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->i:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lsb6;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object p2

    const-string v0, "ga_usage_statistics"

    invoke-virtual {p2, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p2

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    new-instance p2, Lqb6;

    invoke-direct {p2, p1}, Lqb6;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p1, p0, Lsb6;->w:Lr65;

    invoke-virtual {p1}, Lr65;->m()Z

    move-result p1

    iget-object p2, p0, Lsb6;->y:Lei;

    if-eqz p1, :cond_51

    iget-object p1, p2, Lei;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_6c

    :cond_51
    iget-object p1, p2, Lei;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lsb6;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object p2

    const-string v0, "collect_website_categories"

    invoke-virtual {p2, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p2

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    new-instance p2, Lqb6;

    invoke-direct {p2, p1}, Lqb6;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    :goto_6c
    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lsb6;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object p2

    const-string v0, "process_news_topics"

    invoke-virtual {p2, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p2

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    new-instance p2, Lqb6;

    invoke-direct {p2, p1}, Lqb6;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->g:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lsb6;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object p2

    const-string v0, "process_location"

    invoke-virtual {p2, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p2

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    new-instance p2, Lqb6;

    invoke-direct {p2, p1}, Lqb6;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->d:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lsb6;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object p2

    const-string v0, "personalized_news"

    invoke-virtual {p2, v0}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result p2

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    new-instance p2, Lqb6;

    invoke-direct {p2, p1}, Lqb6;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lsb6;->I0()V

    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->b:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->jumpDrawablesToCurrentState()V

    iget-object p0, p0, Li93;->s:Lrn9;

    invoke-virtual {p0}, Lrn9;->F()V

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Lsb6;->x:Lua7;

    return-object p0
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 14

    invoke-super {p0, p1, p2}, Lltl;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    const v0, 0x7f0d0383

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a09a2

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v3, :cond_6f

    const p2, 0x7f0a09a3

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v4, :cond_6f

    const p2, 0x7f0a09b1

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v5, :cond_6f

    const p2, 0x7f0a09c7

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v6, :cond_6f

    const p2, 0x7f0a09d8

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v7, :cond_6f

    const p2, 0x7f0a09dd

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_6f

    const p2, 0x7f0a0a17

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v9, :cond_6f

    new-instance v1, Lei;

    move-object v2, p1

    check-cast v2, Landroid/widget/LinearLayout;

    const/16 v10, 0xb

    invoke-direct/range {v1 .. v10}, Lei;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    iput-object v1, p0, Lsb6;->y:Lei;

    return-void

    :cond_6f
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
