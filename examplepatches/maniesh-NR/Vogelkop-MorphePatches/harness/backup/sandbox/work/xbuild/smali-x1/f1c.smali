.class public final Lf1c;
.super Li93;
.source "SourceFile"


# instance fields
.field public final A:Lode;

.field public B:Lcr2;

.field public final t:Lx0c;

.field public final u:Lj1c;

.field public final v:Lg0c;

.field public final w:Lb1c;

.field public final x:Lcom/opera/android/settings/SettingsManager;

.field public final y:Lq6e;

.field public final z:Lv3m;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lq6e;Lj1c;Lv3m;Lg0c;)V
    .registers 8

    const v0, 0x7f140ff5

    invoke-direct {p0, v0}, Li93;-><init>(I)V

    new-instance v0, Lx0c;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lx0c;-><init>(Lf1c;B)V

    iput-object v0, p0, Lf1c;->t:Lx0c;

    new-instance v0, Lb1c;

    invoke-direct {v0, p0}, Lb1c;-><init>(Lf1c;)V

    iput-object v0, p0, Lf1c;->w:Lb1c;

    iput-object p1, p0, Lf1c;->x:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Lf1c;->y:Lq6e;

    iput-object p3, p0, Lf1c;->u:Lj1c;

    iput-object p4, p0, Lf1c;->z:Lv3m;

    iput-object p5, p0, Lf1c;->v:Lg0c;

    iget-object p1, p4, Lv3m;->d:Lplk;

    iget-object p1, p1, Lplk;->c:Ljava/lang/Object;

    check-cast p1, Lode;

    iput-object p1, p0, Lf1c;->A:Lode;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    iget-object p0, p0, Lf1c;->t:Lx0c;

    return-object p0
.end method

.method public final onDestroyView()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lf1c;->B:Lcr2;

    invoke-super {p0}, Lltl;->onDestroyView()V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 10

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lf1c;->B:Lcr2;

    iget-object p1, p1, Lcr2;->g:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object p1

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    iget-object p1, p0, Lf1c;->B:Lcr2;

    iget-object p1, p1, Lcr2;->g:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object p1

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/animation/LayoutTransition;->disableTransitionType(I)V

    iget-object p1, p0, Lf1c;->z:Lv3m;

    iget-object v1, p1, Lv3m;->a:Landroid/content/Context;

    invoke-static {v1}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2c

    move v1, v2

    goto :goto_2e

    :cond_2c
    const/16 v1, 0x8

    :goto_2e
    iget-object v3, p0, Lf1c;->B:Lcr2;

    iget-object v3, v3, Lcr2;->e:Landroid/view/View;

    check-cast v3, Lcom/opera/android/custom_views/SeparatorView;

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v3, p0, Lf1c;->B:Lcr2;

    iget-object v3, v3, Lcr2;->b:Landroid/view/View;

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v3, p0, Lf1c;->B:Lcr2;

    iget-object v3, v3, Lcr2;->l:Landroid/view/View;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lf1c;->u:Lj1c;

    iget-object v1, v1, Lj1c;->e:Ljava/lang/Object;

    check-cast v1, Lv9j;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v3

    iget-object v4, p0, Lf1c;->B:Lcr2;

    iget-object v4, v4, Lcr2;->g:Landroid/view/ViewGroup;

    check-cast v4, Landroid/widget/LinearLayout;

    new-instance v5, Lks6;

    const/16 v6, 0x15

    invoke-direct {v5, p0, v6}, Lks6;-><init>(Ljava/lang/Object;B)V

    const/4 v6, 0x0

    invoke-static {v1, v3, v4, v6, v5}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    iget-object v1, p0, Lf1c;->B:Lcr2;

    iget-object v1, v1, Lcr2;->d:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v3, Ly0c;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v4}, Ly0c;-><init>(Lf1c;B)V

    invoke-virtual {v1, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lf1c;->B:Lcr2;

    iget-object v1, v1, Lcr2;->n:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v3, Ly0c;

    const/4 v4, 0x2

    invoke-direct {v3, p0, v4}, Ly0c;-><init>(Lf1c;B)V

    invoke-virtual {v1, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lf1c;->B:Lcr2;

    iget-object v1, v1, Lcr2;->n:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v3, Ly0c;

    invoke-direct {v3, p0, v0}, Ly0c;-><init>(Lf1c;B)V

    invoke-virtual {v1, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lf1c;->B:Lcr2;

    iget-object v1, v1, Lcr2;->n:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v3, Lrxh;

    const v5, 0x7f141227    # 1.9682E38f

    invoke-direct {v3, v5}, Lrxh;-><init>(I)V

    iput-object v3, v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z:Lpxh;

    invoke-virtual {v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u()V

    iget-object v1, p0, Lf1c;->B:Lcr2;

    iget-object v1, v1, Lcr2;->l:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v3, Ly0c;

    invoke-direct {v3, p0, p2}, Ly0c;-><init>(Lf1c;B)V

    invoke-virtual {v1, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Lf1c;->B:Lcr2;

    iget-object v1, p2, Lcr2;->i:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v3, Lx0c;

    invoke-direct {v3, p0, v4}, Lx0c;-><init>(Lf1c;B)V

    iput-object v3, v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p2, p2, Lcr2;->c:Landroid/view/View;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v1, Ly0c;

    const/4 v3, 0x5

    invoke-direct {v1, p0, v3}, Ly0c;-><init>(Lf1c;B)V

    invoke-virtual {p2, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Lf1c;->B:Lcr2;

    iget-object p2, p2, Lcr2;->j:Landroid/view/View;

    check-cast p2, Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {p2, v1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object v1, p0, Lf1c;->w:Lb1c;

    invoke-virtual {p2, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object p2, p0, Lf1c;->B:Lcr2;

    iget-object p2, p2, Lcr2;->h:Ljava/lang/Object;

    check-cast p2, Lcom/google/android/material/button/MaterialButton;

    new-instance v1, Ly0c;

    const/4 v3, 0x6

    invoke-direct {v1, p0, v3}, Ly0c;-><init>(Lf1c;B)V

    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Lf1c;->B:Lcr2;

    iget-object p2, p2, Lcr2;->f:Landroid/view/View;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const v1, 0x7f14034d

    invoke-virtual {p1, v1}, Lv3m;->a(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object p1, p0, Lf1c;->B:Lcr2;

    iget-object p2, p1, Lcr2;->f:Landroid/view/View;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v1, Lx0c;

    invoke-direct {v1, p0, v0}, Lx0c;-><init>(Lf1c;B)V

    iput-object v1, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p1, p1, Lcr2;->k:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ly0c;

    invoke-direct {p2, p0, v2}, Ly0c;-><init>(Lf1c;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 20

    move-object/from16 v0, p2

    invoke-super/range {p0 .. p2}, Lltl;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    const v1, 0x7f0d0386

    const/4 v2, 0x0

    move-object/from16 v3, p1

    invoke-virtual {v3, v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v0, 0x7f0a0095

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lcom/google/android/material/button/MaterialButton;

    if-eqz v5, :cond_dc

    const v0, 0x7f0a00fc

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v6, :cond_dc

    const v0, 0x7f0a0147

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v2, :cond_dc

    const v0, 0x7f0a0148

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v7, :cond_dc

    const v0, 0x7f0a03c4

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v2, :cond_dc

    const v0, 0x7f0a042a

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_dc

    const v0, 0x7f0a05e7

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v2, :cond_dc

    const v0, 0x7f0a05e8

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v9, :cond_dc

    const v0, 0x7f0a05e9

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v2, :cond_dc

    move-object v4, v1

    check-cast v4, Landroid/widget/LinearLayout;

    const v0, 0x7f0a098a

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_dc

    const v0, 0x7f0a0bec

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v11, :cond_dc

    const v0, 0x7f0a0bf0

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v12, :cond_dc

    const v0, 0x7f0a0bf1

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v13, :cond_dc

    const v0, 0x7f0a0bf2

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v14, :cond_dc

    const v0, 0x7f0a0bf3

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v15, :cond_dc

    const v0, 0x7f0a0ca6

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v16, :cond_dc

    new-instance v3, Lcr2;

    invoke-direct/range {v3 .. v16}, Lcr2;-><init>(Landroid/widget/LinearLayout;Lcom/google/android/material/button/MaterialButton;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/SeparatorView;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lf1c;->B:Lcr2;

    return-void

    :cond_dc
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
