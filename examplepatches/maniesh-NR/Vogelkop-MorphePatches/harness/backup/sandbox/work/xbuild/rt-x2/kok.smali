.class public final Lkok;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhzj;


# instance fields
.field public final a:Lcom/opera/android/custom_views/FadingRecyclerView;

.field public final b:Lcom/opera/android/feed/FeedScrollView;

.field public final c:Landroid/widget/TextView;

.field public final d:Lcom/opera/android/favorites/FavoriteGridLayoutManager;

.field public final e:Lizj;

.field public final f:Lipk;

.field public final g:Liok;

.field public final h:Lxok;

.field public final i:Lw6j;

.field public final j:Ljok;

.field public k:Lhok;

.field public final l:Lvk2;

.field public final m:Lkr8;

.field public final n:Lgd6;

.field public final o:Lpde;

.field public p:Lzzh;

.field public q:Z

.field public r:Z

.field public final s:Leok;

.field public final t:Lkze;

.field public final u:Ldok;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lnr8;Lipk;Lcom/opera/android/BrowserActivity;Lcom/opera/android/custom_views/FadingRecyclerView;Lcom/opera/android/feed/FeedScrollView;Landroid/widget/TextView;Lvk2;Lx5f;Lx5f;Losf;Lkze;Lqr8;Lnv2;Lbvl;Lpde;Lp6l;)V
    .registers 43

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    move-object/from16 v3, p12

    move-object/from16 v4, p16

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v5, Ljok;

    invoke-direct {v5, v0}, Ljok;-><init>(Lkok;)V

    iput-object v5, v0, Lkok;->j:Ljok;

    new-instance v6, La83;

    const/16 v7, 0x10

    invoke-direct {v6, v0, v7}, La83;-><init>(Ljava/lang/Object;B)V

    new-instance v7, Lkr8;

    invoke-direct {v7}, Lxr6;-><init>()V

    iput-object v7, v0, Lkok;->m:Lkr8;

    new-instance v7, Lpde;

    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {v7, v8}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v7, v0, Lkok;->o:Lpde;

    new-instance v7, Liw7;

    const/4 v8, 0x1

    invoke-direct {v7, v0, v8}, Liw7;-><init>(Lhzj;B)V

    new-instance v9, Leok;

    invoke-direct {v9, v0}, Leok;-><init>(Lkok;)V

    iput-object v9, v0, Lkok;->s:Leok;

    new-instance v9, Ldok;

    const/4 v10, 0x0

    invoke-direct {v9, v0, v10}, Ldok;-><init>(Lkok;B)V

    iput-object v9, v0, Lkok;->u:Ldok;

    new-instance v11, Lz61;

    invoke-direct {v11, v1}, Lz61;-><init>(Landroid/view/View;)V

    iget-object v11, v11, Lz61;->b:Ljava/lang/Object;

    check-cast v11, Lkze;

    iput-object v1, v0, Lkok;->a:Lcom/opera/android/custom_views/FadingRecyclerView;

    iput-object v2, v0, Lkok;->b:Lcom/opera/android/feed/FeedScrollView;

    move-object/from16 v12, p7

    iput-object v12, v0, Lkok;->c:Landroid/widget/TextView;

    move-object/from16 v12, p8

    iput-object v12, v0, Lkok;->l:Lvk2;

    invoke-virtual/range {p4 .. p4}, Lcom/opera/android/BrowserActivity;->K0()Lizj;

    move-result-object v12

    iput-object v12, v0, Lkok;->e:Lizj;

    iget-object v13, v12, Lizj;->a:Ljava/util/ArrayList;

    invoke-virtual {v13, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v13, Ldok;

    invoke-direct {v13, v0, v8}, Ldok;-><init>(Lkok;B)V

    invoke-static {v4, v11, v13}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v11, Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    iget-object v12, v12, Lizj;->d:Lpde;

    invoke-static {v12}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v13, Lgw7;

    invoke-direct {v13, v12, v10}, Lgw7;-><init>(Lpde;B)V

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Lgw7;

    invoke-direct {v14, v4, v8}, Lgw7;-><init>(Lpde;B)V

    invoke-direct {v11, v13, v14, v10}, Lcom/opera/android/favorites/FavoriteGridLayoutManager;-><init>(Lesk;Lesk;Z)V

    iput-object v11, v0, Lkok;->d:Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    invoke-virtual {v1, v11}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->B0(Landroidx/recyclerview/widget/e;)V

    new-instance v4, Lhw7;

    const/4 v10, 0x3

    invoke-direct {v4, v0, v10}, Lhw7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v4}, Lcom/opera/android/feed/FeedScrollView;->F(Lile;)V

    move-object/from16 v14, p3

    iput-object v14, v0, Lkok;->f:Lipk;

    new-instance v4, Lxok;

    invoke-direct {v4}, Lxok;-><init>()V

    iput-object v4, v0, Lkok;->h:Lxok;

    new-instance v10, Lw6j;

    new-instance v13, Ltxi;

    const/16 v15, 0x18

    invoke-direct {v13, v0, v15}, Ltxi;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v15, p9

    move-object/from16 v8, p11

    invoke-direct {v10, v13, v8, v15}, Lw6j;-><init>(Ltxi;Losf;Lx5f;)V

    iput-object v10, v0, Lkok;->i:Lw6j;

    new-instance v8, Liok;

    invoke-direct {v8, v4, v10}, Liok;-><init>(Lxok;Lw6j;)V

    iput-object v8, v0, Lkok;->g:Liok;

    new-instance v8, Lgd6;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    const/4 v15, 0x1

    invoke-direct {v8, v13, v15}, Lgd6;-><init>(Landroid/content/Context;B)V

    iput-object v8, v0, Lkok;->n:Lgd6;

    new-instance v13, Lhok;

    invoke-virtual {v12}, Lekc;->g()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v20, v16

    check-cast v20, Ltta;

    move-object/from16 v19, p1

    move-object/from16 v21, p10

    move-object/from16 v22, p13

    move-object/from16 v23, p14

    move-object/from16 v24, p17

    move-object/from16 v17, v4

    move-object/from16 v18, v8

    move-object/from16 v16, v10

    move v4, v15

    move-object/from16 v15, p2

    invoke-direct/range {v13 .. v24}, Lhok;-><init>(Lipk;Lnr8;Lw6j;Lxok;Lgd6;Lcom/opera/android/settings/SettingsManager;Ltta;Lx5f;Lqr8;Lnv2;Lp6l;)V

    iput-object v13, v0, Lkok;->k:Lhok;

    iput-boolean v4, v13, Lns8;->t:Z

    new-instance v8, Lqlk;

    const/4 v10, 0x4

    invoke-direct {v8, v0, v10}, Lqlk;-><init>(Ljava/lang/Object;B)V

    iput-object v8, v13, Lns8;->s:Lqlk;

    new-instance v8, Lr9i;

    const v10, 0x7f0a062b

    move-object/from16 v14, p4

    invoke-virtual {v14, v10}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v10

    new-instance v14, Ljw7;

    move-object/from16 v15, p15

    invoke-direct {v14, v15, v4}, Ljw7;-><init>(Lbvl;B)V

    invoke-direct {v8, v2, v10, v14}, Lr9i;-><init>(Landroidx/core/widget/NestedScrollView;Landroid/view/View;Lhcb;)V

    iput-object v8, v13, Lns8;->f:Lr9i;

    iget-object v2, v0, Lkok;->k:Lhok;

    iget-object v2, v2, Lns8;->k:Lh7f;

    invoke-virtual {v2, v7}, Lh7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {v12}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ltta;

    iget-object v4, v0, Lkok;->k:Lhok;

    if-eqz v4, :cond_11b

    invoke-virtual {v4, v2}, Lns8;->V(Ltta;)V

    :cond_11b
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v2, v11, Landroidx/recyclerview/widget/CustomGridLayoutManager;->g:I

    const/4 v15, 0x1

    if-eq v2, v15, :cond_128

    iput v15, v11, Landroidx/recyclerview/widget/CustomGridLayoutManager;->g:I

    invoke-virtual {v11}, Landroidx/recyclerview/widget/f;->requestLayout()V

    :cond_128
    iget-object v2, v0, Lkok;->k:Lhok;

    invoke-virtual {v2, v5}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    iget-object v2, v0, Lkok;->k:Lhok;

    invoke-virtual {v2, v6}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    iget-object v2, v0, Lkok;->k:Lhok;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iput-object v3, v0, Lkok;->t:Lkze;

    invoke-virtual {v3, v9}, Lekc;->k(Lf7f;)V

    new-instance v1, Lzdh;

    const/4 v15, 0x1

    invoke-direct {v1, v0, v15}, Lzdh;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v11, Landroidx/recyclerview/widget/CustomGridLayoutManager;->f:Li7f;

    invoke-virtual {v2, v1}, Li7f;->b(Ljava/lang/Object;)Z

    iget v1, v11, Landroidx/recyclerview/widget/CustomGridLayoutManager;->b:I

    invoke-virtual {v0, v1}, Lkok;->b(I)V

    invoke-virtual {v0}, Lkok;->c()V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 5

    if-eqz p1, :cond_3a

    iget-object p1, p0, Lkok;->k:Lhok;

    if-eqz p1, :cond_3a

    const/4 p1, 0x0

    iget-object v0, p0, Lkok;->a:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object p1, v0, Landroidx/recyclerview/widget/RecyclerView;->c:Landroidx/recyclerview/widget/g;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/g;->c()Lro9;

    move-result-object p1

    invoke-virtual {p1}, Lro9;->f()V

    iget-object p1, p0, Lkok;->e:Lizj;

    iget-object p1, p1, Lizj;->d:Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ltta;

    iget-object v1, p0, Lkok;->k:Lhok;

    if-eqz v1, :cond_26

    invoke-virtual {v1, p1}, Lns8;->V(Ltta;)V

    :cond_26
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Lkok;->d:Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    iget v1, p1, Landroidx/recyclerview/widget/CustomGridLayoutManager;->g:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_35

    iput v2, p1, Landroidx/recyclerview/widget/CustomGridLayoutManager;->g:I

    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->requestLayout()V

    :cond_35
    iget-object p0, p0, Lkok;->k:Lhok;

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    :cond_3a
    return-void
.end method

.method public final b(I)V
    .registers 5

    iget-object v0, p0, Lkok;->p:Lzzh;

    if-eqz v0, :cond_b

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lzzh;->run(Ljava/lang/Object;)V

    :cond_b
    iget-object p0, p0, Lkok;->h:Lxok;

    iget v0, p0, Lxok;->i:I

    iget-object v1, p0, Ltq8;->e:Ljava/util/ArrayList;

    if-eq p1, v0, :cond_59

    iput p1, p0, Lxok;->i:I

    iget-object p1, p0, Lxok;->h:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget v2, p0, Lxok;->i:I

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object p1

    :goto_26
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-le v0, v2, :cond_3e

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Ltq8;->u(I)Lhq8;

    move-result-object v0

    invoke-virtual {p0, v0}, Ltq8;->A(Lhq8;)V

    goto :goto_26

    :cond_3e
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_42
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_59

    new-instance v1, Lqok;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Look;

    invoke-direct {v1, v2}, Lqok;-><init>(Look;)V

    invoke-virtual {p0, v0, v1}, Ltq8;->s(ILhq8;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_42

    :cond_59
    return-void
.end method

.method public final c()V
    .registers 5

    iget-object v0, p0, Lkok;->h:Lxok;

    iget-object v0, v0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_d

    move v2, v1

    goto :goto_f

    :cond_d
    const/16 v2, 0x8

    :goto_f
    iget-object v3, p0, Lkok;->c:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    if-nez v0, :cond_17

    const/4 v1, 0x1

    :cond_17
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object p0, p0, Lkok;->o:Lpde;

    invoke-static {p0, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method
