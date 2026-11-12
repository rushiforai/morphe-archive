.class public final Lsyk;
.super Ly93;
.source "SourceFile"


# instance fields
.field public final D:Lskm;

.field public final E:Lcom/opera/android/settings/SettingsManager;

.field public final F:Lqr8;

.field public final G:Lua7;

.field public final H:Lnv2;

.field public final I:Lzzj;

.field public J:[Ltq8;

.field public K:Lizj;

.field public final L:Lpde;


# direct methods
.method public constructor <init>(Lgjm;Lskm;Lcom/opera/android/settings/SettingsManager;Lqr8;Lnv2;Lzzj;Lpde;)V
    .registers 10

    const v0, 0x7f141222

    const v1, 0x7f100035

    invoke-direct {p0, v0, v1}, Ly93;-><init>(II)V

    iput-object p2, p0, Lsyk;->D:Lskm;

    iput-object p3, p0, Lsyk;->E:Lcom/opera/android/settings/SettingsManager;

    iput-object p4, p0, Lsyk;->F:Lqr8;

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lsyk;->G:Lua7;

    iput-object p5, p0, Lsyk;->H:Lnv2;

    iput-object p6, p0, Lsyk;->I:Lzzj;

    iput-object p7, p0, Lsyk;->L:Lpde;

    return-void
.end method


# virtual methods
.method public final G0(Ljava/lang/Object;Landroidx/recyclerview/widget/LinearLayoutManager;)Landroidx/recyclerview/widget/d;
    .registers 17

    move-object v1, p1

    check-cast v1, Ltq8;

    move-object/from16 v0, p2

    check-cast v0, Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    new-instance v0, Lryk;

    iget-object v2, p0, Lsyk;->K:Lizj;

    iget-object v2, v2, Lizj;->d:Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Ltta;

    const/4 v11, 0x0

    sget-object v13, Lp6l;->a:Lp6l;

    iget-object v2, p0, Lsyk;->E:Lcom/opera/android/settings/SettingsManager;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    iget-object v8, p0, Lsyk;->D:Lskm;

    iget-object v9, p0, Lsyk;->F:Lqr8;

    iget-object v10, p0, Lsyk;->H:Lnv2;

    iget-object v12, p0, Lsyk;->I:Lzzj;

    invoke-direct/range {v0 .. v13}, Lns8;-><init>(Ltq8;Lcom/opera/android/settings/SettingsManager;ZLo28;Ltta;ZZLskm;Lqr8;Lnv2;Ltlg;Lzzj;Lp6l;)V

    new-instance v1, Lvr8;

    new-instance v2, Ldxh;

    const p0, 0x1010038

    invoke-direct {v2, p0}, Ldxh;-><init>(I)V

    new-instance v4, Lfxh;

    const p0, 0x106000d

    invoke-direct {v4, p0}, Lfxh;-><init>(I)V

    new-instance v5, Ldxh;

    const p0, 0x7f04047f

    invoke-direct {v5, p0}, Ldxh;-><init>(I)V

    new-instance v6, Ldxh;

    const p0, 0x7f04047e

    invoke-direct {v6, p0}, Ldxh;-><init>(I)V

    new-instance v7, Ldxh;

    const p0, 0x1010036

    invoke-direct {v7, p0}, Ldxh;-><init>(I)V

    new-instance v8, Ldxh;

    const p0, 0x7f04084a

    invoke-direct {v8, p0}, Ldxh;-><init>(I)V

    new-instance v9, Ldxh;

    invoke-direct {v9, p0}, Ldxh;-><init>(I)V

    new-instance v10, Ldxh;

    const p0, 0x7f0409c4

    invoke-direct {v10, p0}, Ldxh;-><init>(I)V

    new-instance v11, Lfxh;

    const p0, 0x7f06011a

    invoke-direct {v11, p0}, Lfxh;-><init>(I)V

    const/4 v12, 0x2

    sget-object v3, Llaj;->e:Llaj;

    invoke-direct/range {v1 .. v12}, Lvr8;-><init>(Lcxh;Llaj;Lfxh;Lcxh;Lcxh;Lcxh;Lcxh;Lcxh;Lcxh;Lfxh;I)V

    invoke-virtual {v0, v1}, Lns8;->X(Lvr8;)V

    return-object v0
.end method

.method public final H0(Landroid/view/ViewGroup;Ljava/lang/Object;)Lu93;
    .registers 10

    move-object v4, p2

    check-cast v4, Ltq8;

    iget-object p2, p0, Ly93;->B:Landroid/view/LayoutInflater;

    const v0, 0x7f0d03eb

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Landroid/view/ViewGroup;

    const/4 p1, 0x0

    invoke-virtual {v2, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const p1, 0x7f0a04ef

    invoke-virtual {v2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView;

    new-instance v5, Lqyk;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    iget-object p1, p0, Lsyk;->K:Lizj;

    iget-object p1, p1, Lizj;->d:Lpde;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p2, Lgw7;

    const/4 v0, 0x2

    invoke-direct {p2, p1, v0}, Lgw7;-><init>(Lpde;B)V

    iget-object p1, p0, Lsyk;->L:Lpde;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lgw7;

    const/4 v6, 0x4

    invoke-direct {v0, p1, v6}, Lgw7;-><init>(Lpde;B)V

    invoke-direct {v5, p0, p2, v0, v3}, Lqyk;-><init>(Lsyk;Lgw7;Lgw7;Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object p2, p0, Lsyk;->K:Lizj;

    iget-object p2, p2, Lizj;->d:Lpde;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    new-instance v6, Lpyk;

    invoke-direct {v6, v3, v1}, Lpyk;-><init>(Landroidx/recyclerview/widget/RecyclerView;B)V

    invoke-virtual {p2, v0, v6}, Lekc;->j(Lndc;Lf7f;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    new-instance v0, Lpyk;

    const/4 v1, 0x1

    invoke-direct {v0, v3, v1}, Lpyk;-><init>(Landroidx/recyclerview/widget/RecyclerView;B)V

    invoke-virtual {p1, p2, v0}, Lekc;->j(Lndc;Lf7f;)V

    iput-boolean v1, v3, Landroidx/recyclerview/widget/RecyclerView;->t:Z

    invoke-virtual {v3, v5}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    new-instance v0, Lu93;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lu93;-><init>(Ly93;Landroid/view/ViewGroup;Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/Object;Landroidx/recyclerview/widget/LinearLayoutManager;)V

    return-object v0
.end method

.method public final bridge synthetic L0()[Ljava/lang/Object;
    .registers 1

    invoke-virtual {p0}, Lsyk;->P0()[Ltq8;

    move-result-object p0

    return-object p0
.end method

.method public final M0()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lsyk;->J:[Ltq8;

    invoke-super {p0}, Ly93;->M0()V

    return-void
.end method

.method public final P0()[Ltq8;
    .registers 9

    iget-object v0, p0, Lsyk;->J:[Ltq8;

    if-nez v0, :cond_5c

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v0

    check-cast v0, Lcom/opera/android/favorites/e;

    iget-object v0, v0, Lcom/opera/android/favorites/e;->g:Lcom/opera/android/favorites/b;

    iget-object v1, v0, Ltq8;->e:Ljava/util/ArrayList;

    iget-object v2, v0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-gt v1, v4, :cond_27

    new-array v0, v3, [Ltq8;

    goto :goto_5a

    :cond_27
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v4

    new-array v4, v1, [Ltq8;

    move v5, v3

    :goto_2f
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v3, v6, :cond_59

    invoke-virtual {v0, v3}, Ltq8;->u(I)Lhq8;

    move-result-object v6

    check-cast v6, Ltq8;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    check-cast v7, Lcom/opera/android/OperaApplication;

    invoke-virtual {v7}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v7

    check-cast v7, Lcom/opera/android/favorites/e;

    iget-object v7, v7, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    if-eq v6, v7, :cond_56

    if-ge v5, v1, :cond_59

    add-int/lit8 v7, v5, 0x1

    aput-object v6, v4, v5

    move v5, v7

    :cond_56
    add-int/lit8 v3, v3, 0x1

    goto :goto_2f

    :cond_59
    move-object v0, v4

    :goto_5a
    iput-object v0, p0, Lsyk;->J:[Ltq8;

    :cond_5c
    invoke-virtual {p0}, Lsyk;->Q0()V

    iget-object p0, p0, Lsyk;->J:[Ltq8;

    return-object p0
.end method

.method public final Q0()V
    .registers 3

    iget-object v0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object v0

    iget-object v0, v0, Litd;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_f

    return-void

    :cond_f
    iget-object v0, p0, Lsyk;->J:[Ltq8;

    if-eqz v0, :cond_18

    array-length v0, v0

    if-lez v0, :cond_18

    const/4 v0, 0x1

    goto :goto_19

    :cond_18
    const/4 v0, 0x0

    :goto_19
    const v1, 0x7f0a0b1c

    invoke-virtual {p0, v1}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    const v1, 0x7f0a0b1f

    invoke-virtual {p0, v1}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public final onAttach(Landroid/app/Activity;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/app/Activity;)V

    check-cast p1, Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Lcom/opera/android/BrowserActivity;->K0()Lizj;

    move-result-object p1

    iput-object p1, p0, Lsyk;->K:Lizj;

    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Ly93;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lsyk;->J:[Ltq8;

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 11

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0b1c

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_a9

    invoke-virtual {p0}, Lsyk;->P0()[Ltq8;

    move-result-object p1

    iget-object v0, p0, Ly93;->v:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result v0

    aget-object p1, p1, v0

    iget-object v0, p1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :cond_1d
    :goto_1d
    if-ge v2, v1, :cond_8d

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    check-cast v4, Lhq8;

    instance-of v5, v4, Ltq8;

    if-eqz v5, :cond_49

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v5

    sget-object v6, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v5}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    check-cast v5, Lcom/opera/android/OperaApplication;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v5

    check-cast v4, Ltq8;

    new-instance v6, Lcrk;

    const/4 v7, 0x5

    invoke-direct {v6, p0, v7}, Lcrk;-><init>(Ljava/lang/Object;B)V

    check-cast v5, Lcom/opera/android/favorites/e;

    invoke-virtual {v5, v4, v6}, Lcom/opera/android/favorites/e;->j(Ltq8;Llr8;)V

    goto :goto_1d

    :cond_49
    sget-object v5, Lp6l;->a:Lp6l;

    invoke-virtual {v4, v5}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "ofa://ui/"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_71

    invoke-virtual {v4, v5}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v7

    sget-object v8, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v7}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    check-cast v7, Lcom/opera/android/OperaApplication;

    invoke-virtual {v7}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v7

    invoke-virtual {v7, v6, v5}, Lnr8;->c(Ljava/lang/String;Lp6l;)Lhq8;

    move-result-object v6

    if-nez v6, :cond_1d

    :cond_71
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v6

    sget-object v7, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    check-cast v6, Lcom/opera/android/OperaApplication;

    invoke-virtual {v6}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v6

    invoke-virtual {v4}, Lhq8;->h()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v7, v4}, Lnr8;->b(Ljava/lang/String;Ljava/lang/String;)J

    goto :goto_1d

    :cond_8d
    iget-object p1, p1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-le p1, v3, :cond_99

    const p1, 0x7f141175

    goto :goto_9c

    :cond_99
    const p1, 0x7f141162    # 1.96816E38f

    :goto_9c
    iget-object p0, p0, Lltl;->n:Lqm9;

    new-instance v0, Lglj;

    const/16 v1, 0x9c4

    invoke-direct {v0, p1, v1}, Lglj;-><init>(II)V

    invoke-virtual {p0, v0}, Lqm9;->f(Lo93;)V

    return v3

    :cond_a9
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0b1f

    iget-object v4, p0, Lsyk;->G:Lua7;

    if-ne v0, v1, :cond_d4

    invoke-virtual {p0}, Lsyk;->P0()[Ltq8;

    move-result-object p1

    iget-object v0, p0, Ly93;->v:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result v0

    aget-object p1, p1, v0

    new-instance v0, Lduh;

    invoke-virtual {p1}, Lhq8;->h()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lduh;-><init>(Ljava/lang/String;)V

    new-instance v1, Lwj;

    const/16 v2, 0x8

    invoke-direct {v1, p0, p1, v2}, Lwj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4, v0, v1}, Lua7;->E(Lr37;Lf7f;)V

    return v3

    :cond_d4
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a0b1b

    if-ne p1, v0, :cond_ed

    new-instance p1, Leuh;

    invoke-direct {p1}, Leuh;-><init>()V

    new-instance v0, Lqzg;

    const/16 v1, 0x1b

    invoke-direct {v0, p0, v1}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, p1, v0}, Lua7;->E(Lr37;Lf7f;)V

    return v3

    :cond_ed
    return v2
.end method

.method public final x0(Litd;)V
    .registers 2

    invoke-virtual {p0}, Lsyk;->Q0()V

    return-void
.end method
