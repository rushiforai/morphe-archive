.class public final Lg9g;
.super Llj;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lo37;
.implements Lq9g;


# instance fields
.field public A:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final B:Lcom/opera/android/settings/SettingsManager;

.field public C:Lth6;

.field public D:Logf;

.field public final r:Ls9g;

.field public final s:Lb9g;

.field public final t:Lcom/opera/android/Lazy;

.field public final u:Lmw3;

.field public final v:Lua7;

.field public w:Ljava/lang/String;

.field public x:Luo7;

.field public y:Landroid/view/View;

.field public z:Lcom/opera/android/ui/catalog/widget/OperaListItem;


# direct methods
.method public constructor <init>(Lgjm;Ls9g;Lb9g;Lcom/opera/android/Lazy;Lmw3;Lcom/opera/android/settings/SettingsManager;)V
    .registers 9

    const v0, 0x7f140cc5

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Llj;-><init>(II)V

    iput-object p2, p0, Lg9g;->r:Ls9g;

    iput-object p3, p0, Lg9g;->s:Lb9g;

    iput-object p4, p0, Lg9g;->t:Lcom/opera/android/Lazy;

    iput-object p5, p0, Lg9g;->u:Lmw3;

    iput-object p6, p0, Lg9g;->B:Lcom/opera/android/settings/SettingsManager;

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lg9g;->v:Lua7;

    return-void
.end method


# virtual methods
.method public final A()V
    .registers 1

    invoke-virtual {p0}, Lg9g;->K0()V

    return-void
.end method

.method public final G0()V
    .registers 3

    iget-object v0, p0, Lg9g;->y:Landroid/view/View;

    const v1, 0x7f0a0221

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_21

    iget-object v0, p0, Lg9g;->y:Landroid/view/View;

    const v1, 0x7f0a0826

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_21

    invoke-virtual {p0}, Lryl;->g0()V

    :cond_21
    return-void
.end method

.method public final H0(IJZ)V
    .registers 8

    iget-object v0, p0, Lg9g;->y:Landroid/view/View;

    const v1, 0x7f0a0221

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-gtz p1, :cond_13

    const-wide/16 v1, 0x0

    cmp-long p1, p2, v1

    if-gtz p1, :cond_13

    const/4 p1, 0x0

    goto :goto_14

    :cond_13
    const/4 p1, 0x1

    :goto_14
    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    iget-object p1, p0, Lg9g;->y:Landroid/view/View;

    const v0, 0x7f0a0ae3

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz p4, :cond_38

    invoke-static {p2, p3, v0}, Laik;->j(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    const p3, 0x7f140a61

    invoke-virtual {p0, p3, p2}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_47

    :cond_38
    invoke-static {p2, p3, v0}, Laik;->h(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    const p3, 0x7f141191

    invoke-virtual {p0, p3, p2}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    :goto_47
    new-instance p2, Lqxh;

    invoke-direct {p2, p0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    return-void
.end method

.method public final I0(Z)V
    .registers 4

    if-eqz p1, :cond_4

    const/4 p1, 0x0

    goto :goto_6

    :cond_4
    const/16 p1, 0x8

    :goto_6
    iget-object v0, p0, Lg9g;->y:Landroid/view/View;

    const v1, 0x7f0a0cfe

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lg9g;->y:Landroid/view/View;

    const v1, 0x7f0a0cfc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lg9g;->y:Landroid/view/View;

    const v1, 0x7f0a0cfb

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lg9g;->y:Landroid/view/View;

    const v0, 0x7f0a0cfd

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final J0(Z)V
    .registers 6

    iget-object v0, p0, Lg9g;->y:Landroid/view/View;

    const v1, 0x7f0a0a6c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/settings/SettingsStatusView;

    iget-object v1, p0, Lg9g;->D:Logf;

    const/4 v2, 0x0

    if-eqz v1, :cond_41

    iget-object v3, p0, Lg9g;->w:Ljava/lang/String;

    iget-object v1, v1, Logf;->a:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_41

    if-eqz p1, :cond_41

    new-instance p1, Landroid/graphics/drawable/LayerDrawable;

    iget-object v1, p0, Lg9g;->D:Logf;

    iget-object v1, v1, Logf;->c:Landroid/graphics/drawable/Drawable;

    filled-new-array {v1}, [Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1, v2, v2}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    new-instance v1, Lb0j;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, p1, v3}, Lb0j;-><init>(Landroid/graphics/drawable/LayerDrawable;[Ljava/lang/Integer;)V

    const p1, 0x7f140a36

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_5e

    :cond_41
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    const v1, 0x7f0805a6

    invoke-static {v1, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-static {v1, p1}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    const p1, 0x7f140be8

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    :goto_5e
    iget-object p1, v0, Lcom/opera/android/settings/SettingsStatusView;->c:Lnck;

    iget-object v0, p1, Lnck;->d:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p1, Lnck;->d:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-static {p1, p0, v2}, Ln1h;->o(Landroid/view/View;Ljava/lang/CharSequence;I)V

    return-void
.end method

.method public final K0()V
    .registers 8

    iget-object v0, p0, Lg9g;->C:Lth6;

    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->clear()V

    iget-object v1, v0, Lth6;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lui6;->o:[Llag;

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v4, v3, v1, v2}, Lui6;->B(ZZLjava/lang/String;[Llag;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->addAll(Ljava/util/Collection;)V

    iget-object v0, p0, Lg9g;->y:Landroid/view/View;

    const v1, 0x7f0a0826

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v2, p0, Lg9g;->C:Lth6;

    invoke-virtual {v2}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v2

    move v3, v4

    :goto_29
    if-ge v3, v2, :cond_3b

    iget-object v5, p0, Lg9g;->C:Lth6;

    const/4 v6, 0x0

    invoke-virtual {v5, v3, v6, v0}, Lth6;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {v5, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_29

    :cond_3b
    if-gtz v2, :cond_3f

    const/16 v4, 0x8

    :cond_3f
    iget-object v0, p0, Lg9g;->y:Landroid/view/View;

    const v2, 0x7f0a0829

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lg9g;->y:Landroid/view/View;

    const v2, 0x7f0a0827

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lg9g;->y:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lg9g;->y:Landroid/view/View;

    const v0, 0x7f0a0224

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0, v4}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final L0()Z
    .registers 5

    iget-object v0, p0, Lg9g;->x:Luo7;

    sget-object v1, Lkag;->b:Lkag;

    const/4 v2, 0x0

    if-eqz v0, :cond_c

    iget-object p0, v0, Luo7;->d:Lkag;

    if-ne p0, v1, :cond_1a

    goto :goto_18

    :cond_c
    sget-object v0, Ls9g;->h:Ls9g;

    iget-object p0, p0, Lg9g;->w:Ljava/lang/String;

    sget-object v3, Llag;->g:Llag;

    invoke-virtual {v0, v3, p0, v2}, Ls9g;->g(Llag;Ljava/lang/String;Z)Lkag;

    move-result-object p0

    if-ne p0, v1, :cond_1a

    :goto_18
    const/4 p0, 0x1

    return p0

    :cond_1a
    return v2
.end method

.method public final d(Ljava/util/List;)V
    .registers 2

    invoke-virtual {p0}, Lg9g;->K0()V

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 15

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0cfd

    const/16 v2, 0x9c4

    iget-object v3, p0, Lg9g;->u:Lmw3;

    sget-object v4, Lijm;->b:Lijm;

    const/4 v5, 0x0

    if-ne v0, v1, :cond_47

    invoke-static {}, LJ/N;->M4QvXpDD()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;

    invoke-static {p1}, LJ/N;->MNitnPWj(Ljava/lang/Object;)D

    move-result-wide v0

    iget-object v6, p0, Lg9g;->w:Ljava/lang/String;

    invoke-static {v6}, Lcom/opera/android/browser/BrowserUtils;->getHostString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {p1, v6, v0, v1}, LJ/N;->MvtzH5Ni(Ljava/lang/Object;Ljava/lang/Object;D)V

    iget-object p1, p0, Lg9g;->w:Ljava/lang/String;

    invoke-static {p1}, LJ/N;->M3MkeCX1(Ljava/lang/Object;)V

    iget-object p1, p0, Lg9g;->B:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "text_wrap"

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->Q(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lg9g;->I0(Z)V

    invoke-virtual {v3}, Lmw3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lysj;

    new-instance p1, Lglj;

    const v0, 0x7f1415bd

    invoke-direct {p1, v0, v2}, Lglj;-><init>(II)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1, v4}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_47
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0224

    if-ne v0, v1, :cond_79

    iget-object p1, p0, Lg9g;->w:Ljava/lang/String;

    invoke-static {p1}, LJ/N;->MaOW0yoz(Ljava/lang/Object;)V

    iget-object p1, p0, Lg9g;->w:Ljava/lang/String;

    invoke-static {p1}, LJ/N;->M3WHFAwg(Ljava/lang/Object;)V

    sget-object p1, Ls9g;->h:Ls9g;

    iget-object v0, p0, Lg9g;->w:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ls9g;->c(Ljava/lang/String;)V

    invoke-virtual {v3}, Lmw3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lysj;

    invoke-virtual {p0}, Lg9g;->G0()V

    new-instance p0, Lglj;

    const v0, 0x7f141121

    invoke-direct {p0, v0, v2}, Lglj;-><init>(II)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p0, v4}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_79
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0221

    const/4 v6, 0x1

    if-ne v0, v1, :cond_c0

    iget-object p1, p0, Lg9g;->w:Ljava/lang/String;

    invoke-static {p1, v6}, Llx3;->a(Ljava/lang/String;Z)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lg9g;->w:Ljava/lang/String;

    const-string v1, "open_in_app_count"

    invoke-virtual {p1, v1, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-static {v0}, Lcom/opera/android/browser/BrowserUtils;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-wide/16 v0, 0x0

    invoke-virtual {p0, v5, v0, v1, v5}, Lg9g;->H0(IJZ)V

    invoke-virtual {v3}, Lmw3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lysj;

    invoke-virtual {p0}, Lg9g;->G0()V

    new-instance p0, Lglj;

    const v0, 0x7f1403b3

    invoke-direct {p0, v0, v2}, Lglj;-><init>(II)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p0, v4}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_c0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_188

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0826

    if-ne v0, v1, :cond_188

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    move-object v10, v1

    check-cast v10, Llag;

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Lkag;

    sget-object v1, Llag;->b:Llag;

    if-ne v10, v1, :cond_f7

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lg9g;->w:Ljava/lang/String;

    sget-object v3, Lkag;->b:Lkag;

    if-ne v0, v3, :cond_f0

    move v0, v6

    goto :goto_f1

    :cond_f0
    move v0, v5

    :goto_f1
    invoke-static {v1, v2, v0}, Laoh;->l(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_188

    :cond_f7
    move-object v11, p1

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p1, p0, Lg9g;->w:Ljava/lang/String;

    invoke-static {p1}, Lcom/opera/android/browser/BrowserUtils;->getHostString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    new-instance v9, Ljava/util/ArrayList;

    invoke-static {v10}, Lui6;->j(Llag;)[Lkag;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v9, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Leog;->i0(Landroid/content/Context;)Lpyc;

    move-result-object v0

    iget-object v1, v0, Ltim;->a:Luim;

    check-cast v1, Leog;

    new-instance v7, Lf9g;

    move-object v8, p0

    invoke-direct/range {v7 .. v12}, Lf9g;-><init>(Lg9g;Ljava/util/ArrayList;Llag;Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iput-object v7, v1, Leog;->h:Landroid/view/MenuItem$OnMenuItemClickListener;

    iget-object p0, v1, Leog;->d:Lps5;

    iget-object v1, v8, Lg9g;->w:Ljava/lang/String;

    sget-object v2, Ls9g;->h:Ls9g;

    invoke-virtual {v2, v1, v5}, Ls9g;->f(Ljava/lang/String;Z)Ljag;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_14c

    invoke-virtual {v1, v10, v2}, Ljag;->a(Llag;Lkag;)Lkag;

    move-result-object v3

    if-eqz v3, :cond_14c

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v10}, Ljag;->b(Llag;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14a

    move-object v2, v3

    goto :goto_14c

    :cond_14a
    sget-object v2, Lkag;->d:Lkag;

    :cond_14c
    :goto_14c
    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    move v2, v5

    :goto_151
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_174

    invoke-virtual {v8}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkag;

    invoke-static {v3, v10, v7, v12}, Lui6;->R(Landroid/content/Context;Llag;Lkag;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v6, v2, v5, v3}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object v3

    if-ne v2, v1, :cond_16d

    move v7, v6

    goto :goto_16e

    :cond_16d
    move v7, v5

    :goto_16e
    invoke-virtual {v3, v7}, Lqtd;->setChecked(Z)Landroid/view/MenuItem;

    add-int/lit8 v2, v2, 0x1

    goto :goto_151

    :cond_174
    invoke-virtual {v8}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v10}, Lui6;->S(Landroid/content/Context;Llag;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lps5;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    invoke-virtual {p0, v6, v6, v6}, Lbud;->setGroupCheckable(IZZ)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v0, v4}, Lr22;->b(Ljjm;Lijm;)V

    :cond_188
    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    iget-object v0, p0, Lg9g;->r:Ls9g;

    invoke-virtual {v0, p0}, Ls9g;->m(Lq9g;)V

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lg9g;->y:Landroid/view/View;

    iput-object v0, p0, Lg9g;->C:Lth6;

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Lg9g;->v:Lua7;

    return-object p0
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 11

    iget-object v0, p0, Lg9g;->v:Lua7;

    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object v0

    check-cast v0, Lc9g;

    iget-object v0, v0, Lc9g;->a:Ljava/lang/String;

    iput-object v0, p0, Lg9g;->w:Ljava/lang/String;

    iget-object v0, p0, Lg9g;->t:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvo7;

    new-instance v1, Lorg/chromium/url/GURL;

    iget-object v2, p0, Lg9g;->w:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lvo7;->a(Lorg/chromium/url/GURL;Z)Luo7;

    move-result-object v0

    iput-object v0, p0, Lg9g;->x:Luo7;

    const v0, 0x7f0d032c

    invoke-virtual {p1, v0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lg9g;->y:Landroid/view/View;

    const p2, 0x7f0a0417

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/FadingScrollView;

    iget-object p2, p0, Lg9g;->y:Landroid/view/View;

    const v0, 0x7f0a0a5f

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/opera/android/custom_views/SideMarginContainer;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Luk6;

    const/16 v1, 0x14

    invoke-direct {v0, p1, v1}, Luk6;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p2, Lcom/opera/android/custom_views/SideMarginContainer;->a:Luk6;

    iget-object p1, p0, Lg9g;->y:Landroid/view/View;

    const p2, 0x7f0a0a6c

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/settings/SettingsStatusView;

    iget-object p2, p0, Lg9g;->w:Ljava/lang/String;

    invoke-static {p2}, Lcom/opera/android/browser/BrowserUtils;->getHostString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iget-object v0, p1, Lcom/opera/android/settings/SettingsStatusView;->c:Lnck;

    iget-object v0, v0, Lnck;->c:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p2, Lzvd;

    const/16 v0, 0xe

    invoke-direct {p2, p0, v0}, Lzvd;-><init>(Ljava/lang/Object;B)V

    iget-object p1, p1, Lcom/opera/android/settings/SettingsStatusView;->c:Lnck;

    iget-object p1, p1, Lnck;->d:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lth6;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object v0, p0, Lg9g;->w:Ljava/lang/String;

    invoke-direct {p1, p2, v0}, Lth6;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object p1, p0, Lg9g;->C:Lth6;

    new-instance p1, Ld9g;

    invoke-direct {p1, p0}, Ld9g;-><init>(Lg9g;)V

    iget-object p2, p0, Lg9g;->w:Ljava/lang/String;

    sget-object v0, Llx3;->a:Li7f;

    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, LJ/N;->MOJ0_F$K(Ljava/lang/Object;Ljava/lang/Object;Z)V

    iget-object p1, p0, Lg9g;->r:Ls9g;

    invoke-virtual {p1, p0}, Ls9g;->a(Lq9g;)V

    invoke-virtual {p0}, Lg9g;->K0()V

    iget-object p1, p0, Lg9g;->y:Landroid/view/View;

    const p2, 0x7f0a0224

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lg9g;->y:Landroid/view/View;

    const p2, 0x7f0a0221

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lg9g;->y:Landroid/view/View;

    const p2, 0x7f0a0084

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p2, p0, Lg9g;->w:Ljava/lang/String;

    sget-object v1, Lhj;->a:Li7f;

    invoke-static {p2}, Lwqm;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_c5

    move v1, v2

    goto :goto_c9

    :cond_c5
    invoke-static {v1, v2}, LJ/N;->M$NXlYYm(Ljava/lang/Object;Z)I

    move-result v1

    :goto_c9
    and-int/2addr v1, v0

    if-ne v1, v0, :cond_ce

    move v1, v0

    goto :goto_cf

    :cond_ce
    move v1, v2

    :goto_cf
    invoke-virtual {p1, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    new-instance v1, Le9g;

    invoke-direct {v1, p2, v0}, Le9g;-><init>(Ljava/lang/Object;I)V

    iput-object v1, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p1, p0, Lg9g;->y:Landroid/view/View;

    const p2, 0x7f0a0bdd

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p2, p0, Lg9g;->w:Ljava/lang/String;

    invoke-static {p2}, Lwqm;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_ee

    move v1, v2

    goto :goto_f2

    :cond_ee
    invoke-static {v1, v2}, LJ/N;->M$NXlYYm(Ljava/lang/Object;Z)I

    move-result v1

    :goto_f2
    const/4 v3, 0x2

    and-int/2addr v1, v3

    if-ne v1, v3, :cond_f8

    move v1, v0

    goto :goto_f9

    :cond_f8
    move v1, v2

    :goto_f9
    invoke-virtual {p1, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    new-instance v1, Le9g;

    invoke-direct {v1, p2, v3}, Le9g;-><init>(Ljava/lang/Object;I)V

    iput-object v1, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p1, p0, Lg9g;->w:Ljava/lang/String;

    invoke-static {p1}, LJ/N;->MO9jFwQ0(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Double;

    if-eqz p1, :cond_10f

    move p2, v0

    goto :goto_110

    :cond_10f
    move p2, v2

    :goto_110
    if-nez p2, :cond_120

    invoke-static {}, LJ/N;->M4QvXpDD()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;

    invoke-static {p1}, LJ/N;->MNitnPWj(Ljava/lang/Object;)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    :cond_120
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    const-wide v6, 0x3ff3333340000000L    # 1.2000000476837158

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    mul-double/2addr v4, v6

    const-wide/high16 v6, 0x4014000000000000L    # 5.0

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->round(D)J

    move-result-wide v4

    long-to-int p1, v4

    mul-int/lit8 p1, p1, 0x5

    iget-object v1, p0, Lg9g;->w:Ljava/lang/String;

    invoke-static {v1}, LJ/N;->MzJrTmZH(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    if-eqz v1, :cond_149

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    goto :goto_151

    :cond_149
    iget-object v4, p0, Lg9g;->B:Lcom/opera/android/settings/SettingsManager;

    const-string v5, "text_wrap"

    invoke-virtual {v4, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    :goto_151
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const v5, 0x7f1415bb

    invoke-virtual {p0, v5, p1}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    if-eqz v4, :cond_166

    const v4, 0x7f141273

    goto :goto_169

    :cond_166
    const v4, 0x7f141272

    :goto_169
    invoke-virtual {p0, v4}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lg9g;->y:Landroid/view/View;

    const v6, 0x7f0a0cfb

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const-string v6, " \u2022 "

    invoke-static {p1, v6, v4}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v4, Lqxh;

    invoke-direct {v4, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v5, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-object p1, p0, Lg9g;->y:Landroid/view/View;

    const v4, 0x7f0a0cfd

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-nez p2, :cond_198

    if-nez v1, :cond_198

    move p1, v2

    goto :goto_199

    :cond_198
    move p1, v0

    :goto_199
    invoke-virtual {p0, p1}, Lg9g;->I0(Z)V

    iget-object p1, p0, Lg9g;->w:Ljava/lang/String;

    iget-object p2, p0, Lg9g;->y:Landroid/view/View;

    const v1, 0x7f0a0c6f

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p2, p0, Lg9g;->A:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-static {p1, v2}, LJ/N;->M$OhQnXp(Ljava/lang/Object;Z)I

    move-result v1

    if-eq v1, v0, :cond_1b5

    if-ne v1, v3, :cond_1b5

    move v1, v0

    goto :goto_1b6

    :cond_1b5
    move v1, v2

    :goto_1b6
    invoke-virtual {p2, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    iget-object p2, p0, Lg9g;->A:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v1, Lmgf;

    const/4 v3, 0x3

    invoke-direct {v1, p0, p1, v3}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p1, p0, Lg9g;->y:Landroid/view/View;

    const p2, 0x7f0a040c

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p1, p0, Lg9g;->z:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p2, p0, Lg9g;->x:Luo7;

    if-eqz p2, :cond_1dc

    iget-object p2, p2, Luo7;->b:Lqo7;

    iget-boolean p2, p2, Lqo7;->e:Z

    if-eqz p2, :cond_1dc

    move p2, v0

    goto :goto_1dd

    :cond_1dc
    move p2, v2

    :goto_1dd
    if-eqz p2, :cond_1e8

    invoke-virtual {p1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object p1, p0, Lg9g;->z:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setEnabled(Z)V

    goto :goto_1f8

    :cond_1e8
    invoke-virtual {p0}, Lg9g;->L0()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object p1, p0, Lg9g;->z:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ld9g;

    invoke-direct {p2, p0}, Ld9g;-><init>(Lg9g;)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    :goto_1f8
    const/4 p1, 0x0

    iput-object p1, p0, Lg9g;->D:Logf;

    iget-object p2, p0, Lg9g;->x:Luo7;

    if-eqz p2, :cond_205

    iget-object p2, p2, Luo7;->b:Lqo7;

    iget-boolean p2, p2, Lqo7;->e:Z

    if-nez p2, :cond_20b

    :cond_205
    invoke-virtual {p0}, Lg9g;->L0()Z

    move-result p2

    if-eqz p2, :cond_20c

    :cond_20b
    move v2, v0

    :cond_20c
    invoke-virtual {p0, v2}, Lg9g;->J0(Z)V

    iget-object p2, p0, Lg9g;->y:Landroid/view/View;

    sget-object v0, Lq9n;->c:Ll5b;

    if-nez p2, :cond_217

    move-object p2, p1

    goto :goto_21f

    :cond_217
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object p2

    :goto_21f
    if-eqz p2, :cond_229

    iget-object p1, p2, Lcom/opera/android/BrowserActivity;->Z:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lpgf;

    :cond_229
    if-eqz p1, :cond_237

    iget-object p2, p0, Lg9g;->w:Ljava/lang/String;

    new-instance v0, Lo8f;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lo8f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2, v0}, Lpgf;->d(Ljava/lang/String;Lcom/opera/api/Callback;)V

    :cond_237
    iget-object p1, p0, Lg9g;->x:Luo7;

    if-eqz p1, :cond_252

    iget-boolean p1, p1, Luo7;->f:Z

    if-nez p1, :cond_252

    invoke-virtual {p0}, Lg9g;->L0()Z

    move-result p1

    if-eqz p1, :cond_252

    sget-object v0, Ls9g;->h:Ls9g;

    iget-object v2, p0, Lg9g;->w:Ljava/lang/String;

    sget-object v3, Llag;->g:Llag;

    const/4 v5, 0x1

    const/4 v1, 0x0

    sget-object v4, Lkag;->d:Lkag;

    invoke-virtual/range {v0 .. v5}, Ls9g;->o(ZLjava/lang/String;Llag;Lkag;Z)V

    :cond_252
    return-void
.end method
