.class public final Lar8;
.super Lk24;
.source "SourceFile"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Lsj7;


# instance fields
.field public A:Lizj;

.field public B:Z

.field public final f:La83;

.field public final g:Li3j;

.field public final h:Lr9i;

.field public final i:Lo63;

.field public final j:Lvq8;

.field public final k:Ljvj;

.field public final l:Ltv3;

.field public m:Z

.field public n:Z

.field public o:Lcom/opera/android/favorites/FavoriteFolderRootView;

.field public p:Landroid/view/View;

.field public q:Lcom/opera/android/custom_views/OverlayView;

.field public r:Ltq8;

.field public final s:Ltq8;

.field public final t:Lwq8;

.field public u:Lzq8;

.field public v:Landroidx/recyclerview/widget/RecyclerView;

.field public w:Landroid/view/View;

.field public x:Lcom/opera/android/favorites/FavoriteGridLayoutManager;

.field public y:Lns8;

.field public z:Lo28;


# direct methods
.method public constructor <init>(Li3j;Lr9i;Ltq8;Lvq8;Lx77;Ljvj;)V
    .registers 9

    invoke-direct {p0}, Lk24;-><init>()V

    new-instance v0, La83;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, La83;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lar8;->f:La83;

    new-instance v0, Ltv3;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ltv3;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lar8;->l:Ltv3;

    iput-boolean v1, p0, Lar8;->m:Z

    new-instance v0, Lwq8;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lwq8;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lar8;->t:Lwq8;

    iput-object p3, p0, Lar8;->r:Ltq8;

    iget-object p3, p3, Lhq8;->b:Ltq8;

    iput-object p3, p0, Lar8;->s:Ltq8;

    iput-object p1, p0, Lar8;->g:Li3j;

    iput-object p2, p0, Lar8;->h:Lr9i;

    iget-object p1, p5, Lx77;->c:Ljava/lang/Object;

    check-cast p1, Lskm;

    iget-object p2, p5, Lx77;->b:Ljava/lang/Object;

    check-cast p2, Ltq8;

    instance-of p2, p2, Lkdh;

    if-eqz p2, :cond_3d

    new-instance p2, Lxdh;

    iget-object p3, p5, Lx77;->d:Ljava/lang/Object;

    check-cast p3, Lqdh;

    invoke-direct {p2, p3, p1}, Lxdh;-><init>(Lqdh;Lskm;)V

    goto :goto_42

    :cond_3d
    new-instance p2, Ljr8;

    invoke-direct {p2, p1}, Ljr8;-><init>(Lskm;)V

    :goto_42
    iput-object p2, p0, Lar8;->i:Lo63;

    iput-object p4, p0, Lar8;->j:Lvq8;

    iput-object p6, p0, Lar8;->k:Ljvj;

    return-void
.end method


# virtual methods
.method public final c(Landroidx/recyclerview/widget/i;)V
    .registers 2

    return-void
.end method

.method public final l0(Z)V
    .registers 2

    invoke-virtual {p0}, Lar8;->o0()V

    return-void
.end method

.method public final n0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 26

    move-object/from16 v0, p0

    const v1, 0x7f0d0141

    const/4 v2, 0x0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-virtual {v3, v1, v4, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    sget-object v3, Lr5n;->a:Ljava/util/WeakHashMap;

    const v3, 0x7f0a090b

    invoke-static {v1, v3}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    check-cast v3, Lcom/opera/android/favorites/FavoriteFolderRootView;

    iput-object v3, v0, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    iget-object v4, v0, Lar8;->g:Li3j;

    iput-object v4, v3, Lcom/opera/android/favorites/FavoriteFolderRootView;->b:Li3j;

    new-instance v4, Lic;

    const/4 v5, 0x4

    invoke-direct {v4, v0, v5}, Lic;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v3, v0, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    invoke-virtual {v3, v2}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    iget-object v4, v0, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    const v6, 0x7f0a026e

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, v0, Lar8;->p:Landroid/view/View;

    iget-object v4, v0, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    const v6, 0x7f0a04bf

    invoke-static {v6, v4}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v4, v0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v4, v0, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    const v6, 0x7f0a0ba9

    invoke-static {v4, v6}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    iput-object v4, v0, Lar8;->w:Landroid/view/View;

    const v4, 0x7f0a07da

    invoke-static {v1, v4}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    check-cast v4, Lcom/opera/android/custom_views/OverlayView;

    iput-object v4, v0, Lar8;->q:Lcom/opera/android/custom_views/OverlayView;

    new-instance v4, Lyq8;

    iget-object v7, v0, Lar8;->p:Landroid/view/View;

    invoke-direct {v4, v0, v7}, Lyq8;-><init>(Lar8;Landroid/view/View;)V

    const-string v7, "editable"

    invoke-virtual {v3, v7}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v7

    new-instance v8, Lo28;

    invoke-direct {v8, v4}, Lo28;-><init>(Lyq8;)V

    iput-object v8, v0, Lar8;->z:Lo28;

    iget-object v4, v0, Lar8;->A:Lizj;

    iget-object v4, v4, Lizj;->d:Lpde;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Ltta;

    iget-object v12, v0, Lar8;->z:Lo28;

    iget-object v4, v0, Lar8;->j:Lvq8;

    iget-object v8, v4, Lvq8;->b:Ljava/lang/Object;

    move-object v9, v8

    check-cast v9, Ltq8;

    instance-of v8, v9, Lkdh;

    if-eqz v8, :cond_cd

    new-instance v8, Lsdh;

    iget-object v10, v4, Lvq8;->f:Ljava/lang/Object;

    check-cast v10, Lmdh;

    iget-object v11, v4, Lvq8;->g:Ljava/lang/Object;

    check-cast v11, Lqdh;

    iget-object v12, v4, Lvq8;->c:Ljava/lang/Object;

    check-cast v12, Lcom/opera/android/settings/SettingsManager;

    iget-object v14, v4, Lvq8;->d:Ljava/lang/Object;

    move-object v15, v14

    check-cast v15, Lorm;

    iget-object v14, v4, Lvq8;->e:Ljava/lang/Object;

    move-object/from16 v16, v14

    check-cast v16, Lskm;

    iget-object v14, v4, Lvq8;->h:Ljava/lang/Object;

    move-object/from16 v17, v14

    check-cast v17, Lqr8;

    iget-object v14, v4, Lvq8;->i:Ljava/lang/Object;

    move-object/from16 v18, v14

    check-cast v18, Lnv2;

    iget-object v14, v4, Lvq8;->j:Ljava/lang/Object;

    move-object/from16 v19, v14

    check-cast v19, Ltlg;

    iget-object v4, v4, Lvq8;->l:Ljava/lang/Object;

    move-object/from16 v20, v4

    check-cast v20, Lp6l;

    const/4 v14, 0x1

    move-object/from16 v22, v11

    move-object v11, v9

    move-object v9, v10

    move-object/from16 v10, v22

    invoke-direct/range {v8 .. v20}, Lsdh;-><init>(Lmdh;Lqdh;Ltq8;Lcom/opera/android/settings/SettingsManager;Ltta;ZLorm;Lskm;Lqr8;Lnv2;Ltlg;Lp6l;)V

    goto :goto_fa

    :cond_cd
    new-instance v8, Lns8;

    iget-object v10, v4, Lvq8;->c:Ljava/lang/Object;

    check-cast v10, Lcom/opera/android/settings/SettingsManager;

    iget-boolean v11, v4, Lvq8;->a:Z

    iget-object v14, v4, Lvq8;->e:Ljava/lang/Object;

    move-object/from16 v16, v14

    check-cast v16, Lskm;

    iget-object v14, v4, Lvq8;->h:Ljava/lang/Object;

    move-object/from16 v17, v14

    check-cast v17, Lqr8;

    iget-object v14, v4, Lvq8;->i:Ljava/lang/Object;

    move-object/from16 v18, v14

    check-cast v18, Lnv2;

    iget-object v14, v4, Lvq8;->k:Ljava/lang/Object;

    move-object/from16 v20, v14

    check-cast v20, Lzzj;

    iget-object v4, v4, Lvq8;->l:Ljava/lang/Object;

    move-object/from16 v21, v4

    check-cast v21, Lp6l;

    const/4 v14, 0x1

    const/4 v15, 0x1

    const/16 v19, 0x0

    invoke-direct/range {v8 .. v21}, Lns8;-><init>(Ltq8;Lcom/opera/android/settings/SettingsManager;ZLo28;Ltta;ZZLskm;Lqr8;Lnv2;Ltlg;Lzzj;Lp6l;)V

    :goto_fa
    iput-object v8, v0, Lar8;->y:Lns8;

    iget-object v4, v0, Lar8;->h:Lr9i;

    iput-object v4, v8, Lns8;->f:Lr9i;

    iget-object v4, v8, Lns8;->k:Lh7f;

    invoke-virtual {v4, v0}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object v4, v0, Lar8;->y:Lns8;

    iget-object v8, v0, Lar8;->q:Lcom/opera/android/custom_views/OverlayView;

    iget-object v9, v4, Lns8;->i:Lvi7;

    if-eqz v9, :cond_10f

    iput-object v8, v9, Lvi7;->o:Lcom/opera/android/custom_views/OverlayView;

    :cond_10f
    iget-object v8, v0, Lar8;->f:La83;

    invoke-virtual {v4, v8}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    new-instance v4, Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    iget-object v8, v0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    iget-object v8, v0, Lar8;->A:Lizj;

    iget-object v8, v8, Lizj;->d:Lpde;

    invoke-static {v8}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v9, Lgw7;

    const/4 v10, 0x2

    invoke-direct {v9, v8, v10}, Lgw7;-><init>(Lpde;B)V

    new-instance v8, Lkw3;

    const/16 v11, 0x9

    invoke-direct {v8, v11}, Lkw3;-><init>(B)V

    const/4 v11, 0x1

    invoke-direct {v4, v9, v8, v11}, Lcom/opera/android/favorites/FavoriteGridLayoutManager;-><init>(Lesk;Lesk;Z)V

    iput-object v4, v0, Lar8;->x:Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    iget-object v8, v0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v8, v4}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object v4, v0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v8, v0, Lar8;->y:Lns8;

    invoke-virtual {v4, v8}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v4, v0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v8, Lbm8;

    invoke-direct {v8, v0, v5}, Lbm8;-><init>(Ljava/lang/Object;B)V

    invoke-static {v8, v4}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    iget-object v4, v0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v5, Lyc3;

    invoke-direct {v5, v0, v10}, Lyc3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v5}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    iget-object v4, v0, Lar8;->r:Ltq8;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v4, v4, Lkdh;

    const v5, 0x7f0a04c0

    if-nez v4, :cond_1ca

    const-string v4, "focus"

    invoke-virtual {v3, v4}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    iget-object v4, v0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v4}, Landroid/view/View;->getPaddingLeft()I

    move-result v6

    iget-object v8, v0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v8}, Landroid/view/View;->getPaddingTop()I

    move-result v8

    iget-object v9, v0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v9}, Landroid/view/View;->getPaddingRight()I

    move-result v9

    invoke-virtual {v4, v6, v8, v9, v2}, Landroid/view/View;->setPadding(IIII)V

    iget-object v4, v0, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    iget-object v5, v0, Lar8;->r:Ltq8;

    invoke-virtual {v5}, Lhq8;->h()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v5, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Landroid/widget/TextView;->getCurrentHintTextColor()I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    new-instance v6, Lup2;

    invoke-direct {v6, v4, v5, v10}, Lup2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    new-instance v6, Le73;

    const/4 v8, 0x5

    invoke-direct {v6, v5, v4, v8}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object v5

    if-eqz v5, :cond_1b1

    invoke-static {v5, v4, v6}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_1b1
    if-eqz v7, :cond_1c3

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    if-eqz v3, :cond_1de

    iget-object v2, v0, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    new-instance v3, Lkv;

    invoke-direct {v3, v4, v11}, Lkv;-><init>(Landroid/widget/EditText;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_1de

    :cond_1c3
    invoke-virtual {v4, v2}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setInputType(I)V

    goto :goto_1de

    :cond_1ca
    iget-object v2, v0, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, v0, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_1de
    :goto_1de
    iget-object v2, v0, Lar8;->l:Ltv3;

    iget-object v3, v0, Lar8;->k:Ljvj;

    iget-object v3, v3, Ljvj;->a:Lh7f;

    invoke-virtual {v3, v2}, Lh7f;->b(Ljava/lang/Object;)Z

    iput-boolean v11, v0, Lar8;->B:Z

    iget-object v2, v0, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    new-instance v3, Lbn7;

    const/16 v4, 0x14

    invoke-direct {v3, v0, v4}, Lbn7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lcom/opera/android/favorites/FavoriteFolderRootView;->b(Lbn7;)V

    iget-object v2, v0, Lar8;->A:Lizj;

    iget-object v2, v2, Lizj;->d:Lpde;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v3

    new-instance v4, Lks6;

    const/4 v5, 0x7

    invoke-direct {v4, v0, v5}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v3, v4}, Lekc;->j(Lndc;Lf7f;)V

    return-object v1
.end method

.method public final o(Landroidx/recyclerview/widget/i;)V
    .registers 4

    iget-boolean p1, p0, Lar8;->m:Z

    if-nez p1, :cond_13

    const/4 p1, 0x1

    iput-boolean p1, p0, Lar8;->m:Z

    iget-object v0, p0, Lar8;->y:Lns8;

    iget-object v0, v0, Lns8;->i:Lvi7;

    if-eqz v0, :cond_f

    iput-boolean p1, v0, Lvi7;->q:Z

    :cond_f
    iget-boolean v0, p0, Lar8;->n:Z

    if-eqz v0, :cond_14

    :cond_13
    return-void

    :cond_14
    iput-boolean p1, p0, Lar8;->B:Z

    iget-object p1, p0, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    new-instance v0, Lbn7;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Lbn7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lcom/opera/android/favorites/FavoriteFolderRootView;->b(Lbn7;)V

    return-void
.end method

.method public final o0()V
    .registers 4

    iget-boolean v0, p0, Lar8;->n:Z

    if-nez v0, :cond_d

    const/4 v0, 0x1

    iput-boolean v0, p0, Lar8;->n:Z

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isRemoving()Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_d
    return-void

    :cond_e
    iget-object v0, p0, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    if-eqz v0, :cond_37

    const v1, 0x7f0a04c0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-object v1, p0, Lar8;->r:Ltq8;

    if-eqz v1, :cond_2e

    instance-of v2, v1, Lkdh;

    if-nez v2, :cond_2e

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lhq8;->q(Ljava/lang/String;)V

    :cond_2e
    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    :cond_37
    iget-object v0, p0, Lar8;->y:Lns8;

    iget-object v0, v0, Lns8;->j:Lflb;

    if-eqz v0, :cond_40

    invoke-virtual {v0}, Lflb;->i()V

    :cond_40
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/w;->U()V

    return-void
.end method

.method public final onAttach(Landroid/app/Activity;)V
    .registers 3

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/app/Activity;)V

    check-cast p1, Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Lcom/opera/android/BrowserActivity;->K0()Lizj;

    move-result-object p1

    iput-object p1, p0, Lar8;->A:Lizj;

    new-instance p1, Lzq8;

    invoke-direct {p1, p0}, Lzq8;-><init>(Lar8;)V

    iput-object p1, p0, Lar8;->u:Lzq8;

    iget-object p1, p0, Lar8;->s:Ltq8;

    iget-object v0, p0, Lar8;->t:Lwq8;

    invoke-virtual {p1, v0}, Ltq8;->t(Lsq8;)V

    iget-object p0, p0, Lar8;->u:Lzq8;

    invoke-static {p0}, Lac8;->c(Ljava/lang/Object;)V

    return-void
.end method

.method public final onCreateAnimator(IZI)Landroid/animation/Animator;
    .registers 4

    if-nez p1, :cond_d

    if-nez p2, :cond_d

    if-nez p3, :cond_d

    iget-object p0, p0, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    invoke-virtual {p0}, Lcom/opera/android/favorites/FavoriteFolderRootView;->a()Landroid/animation/ValueAnimator;

    move-result-object p0

    return-object p0

    :cond_d
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onCreateAnimator(IZI)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method

.method public final onDestroy()V
    .registers 3

    iget-object v0, p0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_a

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iput-object v1, p0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    :cond_a
    invoke-super {p0}, Lryl;->onDestroy()V

    return-void
.end method

.method public final onDestroyView()V
    .registers 3

    iget-object v0, p0, Lar8;->l:Ltv3;

    iget-object v1, p0, Lar8;->k:Ljvj;

    iget-object v1, v1, Ljvj;->a:Lh7f;

    invoke-virtual {v1, v0}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lar8;->y:Lns8;

    iget-object v1, p0, Lar8;->f:La83;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/d;->unregisterAdapterDataObserver(Lgph;)V

    invoke-super {p0}, Lk24;->onDestroyView()V

    return-void
.end method

.method public final onDetach()V
    .registers 3

    invoke-super {p0}, Lk24;->onDetach()V

    iget-object v0, p0, Lar8;->s:Ltq8;

    iget-object v1, p0, Lar8;->t:Lwq8;

    invoke-virtual {v0, v1}, Ltq8;->B(Lsq8;)V

    iget-object v0, p0, Lar8;->u:Lzq8;

    invoke-static {v0}, Lac8;->d(Ljava/lang/Object;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lar8;->u:Lzq8;

    return-void
.end method

.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 4

    iget-object p2, p0, Lar8;->r:Ltq8;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p3

    invoke-interface {p3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Lhq8;->q(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    sget-object p1, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lq9n;->u(Landroid/view/View;)Z

    const/4 p0, 0x1

    return p0
.end method

.method public final onPause()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    iget-boolean v0, p0, Lar8;->m:Z

    if-eqz v0, :cond_c

    iget-object p0, p0, Lar8;->i:Lo63;

    invoke-virtual {p0}, Lo63;->i()V

    :cond_c
    return-void
.end method

.method public final onResume()V
    .registers 3

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    iget-boolean v0, p0, Lar8;->m:Z

    if-eqz v0, :cond_18

    iget-boolean v1, p0, Lar8;->n:Z

    if-nez v1, :cond_18

    iget-boolean v1, p0, Lar8;->B:Z

    if-nez v1, :cond_18

    if-eqz v0, :cond_18

    iget-object v0, p0, Lar8;->i:Lo63;

    iget-object p0, p0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p0}, Lh6e;->d(Landroidx/recyclerview/widget/RecyclerView;)V

    :cond_18
    return-void
.end method

.method public final p0()V
    .registers 6

    iget-object v0, p0, Lar8;->x:Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1b

    iget-object v0, p0, Lar8;->x:Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    iget-object v3, p0, Lar8;->y:Lns8;

    invoke-virtual {v3}, Lns8;->getItemCount()I

    move-result v3

    sub-int/2addr v3, v1

    if-ne v0, v3, :cond_1b

    move v0, v1

    goto :goto_1c

    :cond_1b
    move v0, v2

    :goto_1c
    iget-object v3, p0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_22

    const/4 v4, 0x2

    goto :goto_23

    :cond_22
    move v4, v2

    :goto_23
    invoke-virtual {v3, v4}, Landroid/view/View;->setOverScrollMode(I)V

    if-nez v0, :cond_33

    iget-object v0, p0, Lar8;->r:Ltq8;

    if-eqz v0, :cond_33

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, v0, Lkdh;

    if-eqz v0, :cond_34

    :cond_33
    move v1, v2

    :cond_34
    iget-object p0, p0, Lar8;->w:Landroid/view/View;

    if-nez v1, :cond_3a

    const/16 v2, 0x8

    :cond_3a
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
