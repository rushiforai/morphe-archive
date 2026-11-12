.class public final Luoj;
.super Llj;
.source "SourceFile"

# interfaces
.implements Lq9g;


# instance fields
.field public final r:Ls9g;

.field public final s:Lgjm;

.field public final t:Llag;

.field public u:Ly83;

.field public v:Lyz7;

.field public w:Lhag;

.field public x:Lpq3;

.field public y:Landroid/view/MenuItem;

.field public z:Z


# direct methods
.method public constructor <init>(Ls9g;Lgjm;ILlag;)V
    .registers 6

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    invoke-virtual {v0, p3}, Lu7k;->s(I)V

    iget-object p3, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast p3, Litl;

    const v0, 0x7f10003b

    iput v0, p3, Litl;->b:I

    const/4 v0, 0x1

    iput v0, p3, Litl;->k:I

    invoke-direct {p0, p3}, Lltl;-><init>(Litl;)V

    iput-object p1, p0, Luoj;->r:Ls9g;

    iput-object p2, p0, Luoj;->s:Lgjm;

    iput-object p4, p0, Luoj;->t:Llag;

    return-void
.end method


# virtual methods
.method public final A()V
    .registers 3

    iget-object v0, p0, Luoj;->w:Lhag;

    iget-object v1, v0, Lhag;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lhag;->H(Ljava/lang/String;)V

    iget-boolean v0, p0, Luoj;->z:Z

    invoke-virtual {p0, v0}, Luoj;->G0(Z)V

    return-void
.end method

.method public final G0(Z)V
    .registers 10

    iput-boolean p1, p0, Luoj;->z:Z

    const v0, 0x7f0a0932

    invoke-virtual {p0, v0}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-object v1, p0, Luoj;->w:Lhag;

    iget-object v1, v1, Lhag;->c:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-lez v1, :cond_17

    move v1, v2

    goto :goto_18

    :cond_17
    move v1, v3

    :goto_18
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    sget-object v0, Llag;->b:Llag;

    iget-object v1, p0, Luoj;->t:Llag;

    if-eq v1, v0, :cond_23

    move v0, v2

    goto :goto_24

    :cond_23
    move v0, v3

    :goto_24
    const/16 v4, 0x8

    if-nez p1, :cond_2c

    if-eqz v0, :cond_2c

    move v5, v3

    goto :goto_2d

    :cond_2c
    move v5, v4

    :goto_2d
    invoke-static {v1}, Lcom/opera/android/settings/SettingsManager;->K(Llag;)Z

    move-result v6

    if-eqz v6, :cond_3d

    invoke-static {v1}, Lui6;->j(Llag;)[Lkag;

    move-result-object v6

    array-length v6, v6

    const/4 v7, 0x2

    if-le v6, v7, :cond_3d

    move v6, v2

    goto :goto_3e

    :cond_3d
    move v6, v3

    :goto_3e
    iget-object v7, p0, Luoj;->u:Ly83;

    if-eqz v6, :cond_4a

    iget-object v6, v7, Ly83;->d:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v6, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_51

    :cond_4a
    iget-object v6, v7, Ly83;->e:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v6, v5}, Landroid/view/View;->setVisibility(I)V

    :goto_51
    iget-object v5, p0, Luoj;->u:Ly83;

    iget-object v5, v5, Ly83;->g:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    sget-object v6, Llag;->d:Llag;

    if-ne v1, v6, :cond_61

    if-nez p1, :cond_61

    if-eqz v0, :cond_61

    move v1, v3

    goto :goto_62

    :cond_61
    move v1, v4

    :goto_62
    invoke-virtual {v5, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Luoj;->w:Lhag;

    iget-object v1, v1, Lhag;->c:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_71

    move v1, v2

    goto :goto_72

    :cond_71
    move v1, v3

    :goto_72
    if-eqz v0, :cond_7a

    if-nez v1, :cond_7a

    if-nez p1, :cond_7a

    move v0, v2

    goto :goto_7b

    :cond_7a
    move v0, v3

    :goto_7b
    iget-object v5, p0, Luoj;->u:Ly83;

    iget-object v5, v5, Ly83;->h:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v0, :cond_85

    move v0, v3

    goto :goto_86

    :cond_85
    move v0, v4

    :goto_86
    invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V

    if-nez v1, :cond_8d

    if-eqz p1, :cond_8e

    :cond_8d
    move v2, v3

    :cond_8e
    iget-object p0, p0, Luoj;->x:Lpq3;

    iget-object p0, p0, Lpq3;->b:Lcom/opera/android/custom_views/OperaButtonBarLayout;

    if-nez v2, :cond_95

    move v3, v4

    :cond_95
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final H0(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V
    .registers 6

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Luoj;->t:Llag;

    invoke-static {v0, v1}, Lui6;->S(Landroid/content/Context;Llag;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    if-eqz v0, :cond_13

    new-instance v3, Lqxh;

    invoke-direct {v3, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_14

    :cond_13
    move-object v3, v2

    :goto_14
    invoke-virtual {p1, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    sget-object v0, Ls9g;->h:Ls9g;

    iget-object v0, v0, Ls9g;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->k(Llag;)Lkag;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v1, v0, v2}, Lui6;->R(Landroid/content/Context;Llag;Lkag;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    return-void
.end method

.method public final I0(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V
    .registers 9

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Luoj;->t:Llag;

    invoke-static {v0, v1}, Lui6;->S(Landroid/content/Context;Llag;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    if-eqz v0, :cond_13

    new-instance v3, Lqxh;

    invoke-direct {v3, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_14

    :cond_13
    move-object v3, v2

    :goto_14
    invoke-virtual {p1, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    sget-object v0, Ls9g;->h:Ls9g;

    iget-object v0, v0, Ls9g;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->k(Llag;)Lkag;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v1, v0, v2}, Lui6;->R(Landroid/content/Context;Llag;Lkag;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance v2, Lqxh;

    invoke-direct {v2, p0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-static {v1}, Lui6;->j(Llag;)[Lkag;

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_36
    const/4 v4, 0x1

    if-ge v3, v1, :cond_49

    aget-object v5, p0, v3

    sget-object v6, Lkag;->c:Lkag;

    if-ne v5, v6, :cond_46

    if-eq v0, v6, :cond_42

    move v2, v4

    :cond_42
    invoke-virtual {p1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    return-void

    :cond_46
    add-int/lit8 v3, v3, 0x1

    goto :goto_36

    :cond_49
    sget-object p0, Lkag;->b:Lkag;

    if-ne v0, p0, :cond_4e

    move v2, v4

    :cond_4e
    invoke-virtual {p1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    return-void
.end method

.method public final d(Ljava/util/List;)V
    .registers 4

    invoke-interface {p1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v0, Lzx1;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    move-result p1

    if-eqz p1, :cond_1d

    iget-object p1, p0, Luoj;->w:Lhag;

    iget-object v0, p1, Lhag;->e:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lhag;->H(Ljava/lang/String;)V

    iget-boolean p1, p0, Luoj;->z:Z

    invoke-virtual {p0, p1}, Luoj;->G0(Z)V

    :cond_1d
    return-void
.end method

.method public final l0(Z)V
    .registers 3

    iget-object v0, p0, Luoj;->y:Landroid/view/MenuItem;

    if-eqz v0, :cond_10

    invoke-interface {v0}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object p0, p0, Luoj;->y:Landroid/view/MenuItem;

    invoke-interface {p0}, Landroid/view/MenuItem;->collapseActionView()Z

    return-void

    :cond_10
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    iget-object v0, p0, Luoj;->r:Ls9g;

    invoke-virtual {v0, p0}, Ls9g;->m(Lq9g;)V

    invoke-super {p0}, Lltl;->onDestroyView()V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Luoj;->G0(Z)V

    iget-object p1, p0, Luoj;->r:Ls9g;

    invoke-virtual {p1, p0}, Ls9g;->a(Lq9g;)V

    return-void
.end method

.method public final u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 4

    invoke-static {p1, p2}, Lpq3;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lpq3;

    move-result-object p1

    iput-object p1, p0, Luoj;->x:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    const p2, 0x7f141139

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Luoj;->x:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lh4i;

    const/16 v0, 0x9

    invoke-direct {p2, p0, v0}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Luoj;->x:Lpq3;

    iget-object p0, p0, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 15

    new-instance v0, Lhag;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Luoj;->t:Llag;

    invoke-direct {v0, v1, v2, p0}, Lhag;-><init>(Landroid/content/Context;Llag;Luoj;)V

    iput-object v0, p0, Luoj;->w:Lhag;

    const v0, 0x7f0d03ad

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a00e5

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v5, :cond_134

    const p2, 0x7f0a0823

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v6, :cond_134

    const p2, 0x7f0a0824

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v7, :cond_134

    move-object v4, p1

    check-cast v4, Landroid/widget/LinearLayout;

    const p2, 0x7f0a0a7a

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v9, :cond_134

    const p2, 0x7f0a0a7d

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v0, :cond_134

    const p2, 0x7f0a0bcc

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v10, :cond_134

    new-instance v3, Ly83;

    const/16 v11, 0xc

    move-object v8, v4

    invoke-direct/range {v3 .. v11}, Ly83;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;B)V

    iput-object v3, p0, Luoj;->u:Ly83;

    new-instance p1, Landroid/animation/LayoutTransition;

    invoke-direct {p1}, Landroid/animation/LayoutTransition;-><init>()V

    new-instance p2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {p2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {p1, v1, p2}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0, p2}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    iget-object p2, p0, Luoj;->u:Ly83;

    iget-object p2, p2, Ly83;->f:Ljava/lang/Object;

    check-cast p2, Landroid/widget/LinearLayout;

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    sget-object p1, Llag;->d:Llag;

    sget-object p2, Llag;->b:Llag;

    if-ne v2, p1, :cond_96

    iget-object p1, p0, Luoj;->u:Ly83;

    iget-object p1, p1, Ly83;->g:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_9d

    :cond_96
    if-ne v2, p2, :cond_9d

    const p1, 0x7f080790

    move v7, p1

    goto :goto_9e

    :cond_9d
    :goto_9d
    move v7, v1

    :goto_9e
    new-instance v3, Lyz7;

    iget-object v4, p0, Luoj;->w:Lhag;

    const/4 v5, 0x1

    const/4 v8, 0x0

    const v6, 0x7f140b45

    invoke-direct/range {v3 .. v8}, Lyz7;-><init>(Landroidx/recyclerview/widget/d;IIII)V

    iput-object v3, p0, Luoj;->v:Lyz7;

    iget-object p1, p0, Luoj;->u:Ly83;

    iget-object p1, p1, Ly83;->c:Ljava/lang/Object;

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    invoke-direct {v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {p1, v3}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object p1, p0, Luoj;->u:Ly83;

    iget-object p1, p1, Ly83;->c:Ljava/lang/Object;

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, p0, Luoj;->v:Lyz7;

    iget-object v3, v3, Lyz7;->c:Lx93;

    invoke-virtual {p1, v3}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    const/16 p1, 0x8

    if-eq v2, p2, :cond_11c

    invoke-static {v2}, Lcom/opera/android/settings/SettingsManager;->K(Llag;)Z

    move-result p2

    if-eqz p2, :cond_dc

    invoke-static {v2}, Lui6;->j(Llag;)[Lkag;

    move-result-object p2

    array-length p2, p2

    const/4 v2, 0x2

    if-gt p2, v2, :cond_dd

    :cond_dc
    move v0, v1

    :cond_dd
    iget-object p2, p0, Luoj;->u:Ly83;

    if-eqz v0, :cond_104

    iget-object p2, p2, Ly83;->d:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0, p2}, Luoj;->H0(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    sget-object v0, Lkag;->b:Lkag;

    sget-object v1, Lkag;->c:Lkag;

    sget-object v2, Lkag;->d:Lkag;

    filled-new-array {v2, v0, v1}, [Lkag;

    move-result-object v0

    new-instance v1, Ltoj;

    invoke-direct {v1, p0, v0, p2}, Ltoj;-><init>(Luoj;[Lkag;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    invoke-virtual {p2, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Luoj;->u:Ly83;

    iget-object p2, p2, Ly83;->e:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_12e

    :cond_104
    iget-object p2, p2, Ly83;->e:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0, p2}, Luoj;->I0(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    new-instance v0, Lroj;

    invoke-direct {v0, p0, p2, v1}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p2, p0, Luoj;->u:Ly83;

    iget-object p2, p2, Ly83;->d:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_12e

    :cond_11c
    iget-object p2, p0, Luoj;->u:Ly83;

    iget-object p2, p2, Ly83;->d:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object p2, p0, Luoj;->u:Ly83;

    iget-object p2, p2, Ly83;->e:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    :goto_12e
    iget-object p0, p0, Luoj;->v:Lyz7;

    invoke-virtual {p0}, Lyz7;->c()V

    return-void

    :cond_134
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

.method public final x0(Litd;)V
    .registers 5

    const v0, 0x7f0a0932

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Luoj;->y:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SearchView;

    const v1, 0x7f140082

    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    new-instance v1, Loji;

    invoke-direct {v1, p0}, Loji;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Lhti;)V

    iget-object v0, p0, Luoj;->y:Landroid/view/MenuItem;

    new-instance v1, Lutd;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Lutd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;

    return-void
.end method
