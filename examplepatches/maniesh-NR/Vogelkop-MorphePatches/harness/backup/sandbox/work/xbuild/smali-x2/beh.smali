.class public final Lbeh;
.super Lwu8;
.source "SourceFile"


# instance fields
.field public final g:Lcy;

.field public final h:Lpde;

.field public final i:Landroidx/recyclerview/widget/RecyclerView;

.field public final j:Lcom/opera/android/favorites/FavoriteGridLayoutManager;

.field public final k:Lsdh;

.field public final l:Lzdh;


# direct methods
.method public constructor <init>(Lmdh;Lqdh;Lqr8;Lcy;Lcom/opera/android/settings/SettingsManager;Lpde;Lkze;Lx5f;Lx5f;Landroid/view/View$OnLongClickListener;Landroid/view/View;Lnv2;Ltlg;Lpde;Lp6l;)V
    .registers 33

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-object/from16 v14, p4

    move-object/from16 v15, p6

    move-object/from16 v1, p14

    move-object/from16 v3, p11

    invoke-direct {v0, v3}, Lwu8;-><init>(Landroid/view/View;)V

    iput-object v14, v0, Lbeh;->g:Lcy;

    iput-object v15, v0, Lbeh;->h:Lpde;

    iget-object v3, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {v3}, Lp37;->z(Landroid/view/View;)Lkze;

    move-result-object v3

    iget-object v4, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const v5, 0x7f0a04ef

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v4, v0, Lbeh;->i:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v5, Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    new-instance v6, Ljjg;

    const/4 v7, 0x3

    invoke-direct {v6, v0, v7}, Ljjg;-><init>(Ljava/lang/Object;B)V

    new-instance v8, Lgw7;

    invoke-direct {v8, v1, v7}, Lgw7;-><init>(Lpde;B)V

    const/4 v9, 0x0

    invoke-direct {v5, v6, v8, v9}, Lcom/opera/android/favorites/FavoriteGridLayoutManager;-><init>(Lesk;Lesk;Z)V

    iput-object v5, v0, Lbeh;->j:Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    move-object v6, v4

    new-instance v4, Lydh;

    iget-object v8, v2, Lmdh;->f:Lcq5;

    invoke-virtual {v8}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lf8f;

    invoke-virtual {v8}, Lf8f;->c()Z

    move-result v8

    const/4 v10, 0x2

    if-eqz v8, :cond_50

    move v8, v7

    goto :goto_51

    :cond_50
    move v8, v10

    :goto_51
    iget v11, v5, Landroidx/recyclerview/widget/CustomGridLayoutManager;->b:I

    move-object/from16 v12, p2

    iget-object v13, v12, Lqdh;->b:Lghf;

    invoke-direct {v4, v8, v11, v13}, Lydh;-><init>(IILghf;)V

    invoke-virtual {v15}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ltta;

    new-instance v1, Lsdh;

    const/4 v7, 0x0

    move-object/from16 v10, p3

    move-object/from16 v11, p12

    move-object/from16 v13, p15

    move-object/from16 p11, v3

    move-object/from16 v16, v5

    move-object v15, v6

    move-object v6, v8

    move v14, v9

    move-object v3, v12

    move-object/from16 v5, p5

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v12, p13

    invoke-direct/range {v1 .. v13}, Lsdh;-><init>(Lmdh;Lqdh;Ltq8;Lcom/opera/android/settings/SettingsManager;Ltta;ZLorm;Lskm;Lqr8;Lnv2;Ltlg;Lp6l;)V

    iput-object v1, v0, Lbeh;->k:Lsdh;

    new-instance v3, Lzdh;

    invoke-direct {v3, v0, v14}, Lzdh;-><init>(Ljava/lang/Object;B)V

    iput-object v3, v0, Lbeh;->l:Lzdh;

    move-object/from16 v4, v16

    invoke-virtual {v15, v4}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {v15, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    invoke-virtual {v15, v14}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    iget-object v4, v4, Landroidx/recyclerview/widget/CustomGridLayoutManager;->f:Li7f;

    invoke-virtual {v4, v3}, Li7f;->b(Ljava/lang/Object;)Z

    move-object/from16 v3, p4

    invoke-virtual {v3, v15, v1}, Lcy;->h(Landroidx/recyclerview/widget/RecyclerView;Lsdh;)V

    iget-object v2, v2, Lmdh;->h:Lh42;

    new-instance v3, Laeh;

    invoke-direct {v3, v0, v14}, Laeh;-><init>(Lbeh;B)V

    move-object/from16 v4, p11

    invoke-static {v2, v4, v3}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v3, Laeh;

    const/4 v5, 0x1

    invoke-direct {v3, v0, v5}, Laeh;-><init>(Lbeh;B)V

    move-object/from16 v5, p7

    invoke-static {v5, v4, v3}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v3, Leqh;

    move-object/from16 v6, p10

    invoke-direct {v3, v15, v6}, Leqh;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View$OnLongClickListener;)V

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_cb

    iget-object v3, v1, Lns8;->c:Ls9i;

    iget-object v3, v3, Ls9i;->b:Ljava/lang/Object;

    check-cast v3, Ltq8;

    check-cast v3, Lydh;

    invoke-virtual {v3, v2}, Lydh;->E(Ljava/util/List;)V

    :cond_cb
    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lvr8;

    invoke-virtual {v1, v2}, Lns8;->X(Lvr8;)V

    new-instance v1, Laeh;

    const/4 v2, 0x2

    invoke-direct {v1, v0, v2}, Laeh;-><init>(Lbeh;B)V

    move-object/from16 v15, p6

    invoke-static {v15, v4, v1}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v1, Laeh;

    const/4 v11, 0x3

    invoke-direct {v1, v0, v11}, Laeh;-><init>(Lbeh;B)V

    move-object/from16 v0, p14

    invoke-static {v0, v4, v1}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final c0()V
    .registers 2

    iget-object p0, p0, Lbeh;->g:Lcy;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcy;->g(Z)V

    return-void
.end method

.method public final e0()V
    .registers 2

    iget-object p0, p0, Lbeh;->g:Lcy;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcy;->g(Z)V

    return-void
.end method

.method public final onDestroy()V
    .registers 4

    iget-object v0, p0, Lbeh;->g:Lcy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Lcy;->h(Landroidx/recyclerview/widget/RecyclerView;Lsdh;)V

    iget-object v0, p0, Lbeh;->l:Lzdh;

    iget-object v2, p0, Lbeh;->j:Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    iget-object v2, v2, Landroidx/recyclerview/widget/CustomGridLayoutManager;->f:Li7f;

    invoke-virtual {v2, v0}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object p0, p0, Lbeh;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-void
.end method
