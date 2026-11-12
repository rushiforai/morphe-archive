.class public final Ld0k;
.super Lpa3;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final b:Lipk;

.field public final c:Lx5f;

.field public final d:Likc;

.field public final e:Lxok;

.field public final f:Lh42;

.field public final g:Lw6j;

.field public final h:Landroidx/recyclerview/widget/RecyclerView;

.field public final i:Lizj;

.field public final j:Lhok;

.field public final k:Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;

.field public l:Z

.field public m:I

.field public n:Z

.field public o:Z

.field public p:Z


# direct methods
.method public constructor <init>(Lfe5;Lipk;Landroid/view/View;Lx5f;Lcom/opera/android/settings/SettingsManager;Lx5f;Losf;Lcbf;Lqr8;Lnv2;Likc;Lp6l;)V
    .registers 30

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move-object/from16 v4, p11

    move-object/from16 v5, p3

    invoke-direct {v0, v5}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object v2, v0, Ld0k;->b:Lipk;

    iput-object v3, v0, Ld0k;->c:Lx5f;

    iput-object v4, v0, Ld0k;->d:Likc;

    new-instance v6, Lxok;

    invoke-direct {v6}, Lxok;-><init>()V

    iput-object v6, v0, Ld0k;->e:Lxok;

    new-instance v15, Lyc3;

    const/4 v5, 0x6

    invoke-direct {v15, v0, v5}, Lyc3;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v2, Lipk;->a:Lxbf;

    iget-object v2, v2, Lxbf;->d:Ljava/lang/Object;

    check-cast v2, Lh42;

    iput-object v2, v0, Ld0k;->f:Lh42;

    new-instance v9, Lw6j;

    new-instance v2, Ltxi;

    const/16 v5, 0xd

    invoke-direct {v2, v0, v5}, Ltxi;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v5, p7

    invoke-direct {v9, v2, v3, v5}, Lw6j;-><init>(Ltxi;Lx5f;Losf;)V

    iput-object v9, v0, Ld0k;->g:Lw6j;

    iget-object v2, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const v3, 0x7f0a04ef

    invoke-virtual {v2, v3}, Landroid/view/View;->requireViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v2, v0, Ld0k;->h:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {v3}, Lfsp;->m(Landroid/view/View;)Lpde;

    move-result-object v3

    new-instance v5, Lizj;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    new-instance v8, Likc;

    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v8, v10}, Lekc;-><init>(Ljava/lang/Object;)V

    invoke-direct {v5, v7, v1, v8, v3}, Lizj;-><init>(Landroid/content/Context;Lndc;Likc;Likc;)V

    iput-object v5, v0, Ld0k;->i:Lizj;

    new-instance v3, Lhok;

    iget-object v5, v5, Lizj;->d:Lpde;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v7

    move-object v8, v7

    check-cast v8, Ltta;

    move-object v7, v5

    move-object v5, v3

    move-object v3, v7

    move-object/from16 v7, p5

    move-object/from16 v11, p6

    move-object/from16 v10, p8

    move-object/from16 v12, p9

    move-object/from16 v13, p10

    move-object/from16 v14, p12

    invoke-direct/range {v5 .. v14}, Lhok;-><init>(Lxok;Lcom/opera/android/settings/SettingsManager;Ltta;Lw6j;Lcbf;Lx5f;Lqr8;Lnv2;Lp6l;)V

    iput-object v5, v0, Ld0k;->j:Lhok;

    new-instance v6, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ltta;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ltta;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Number;

    invoke-virtual {v10}, Ljava/lang/Number;->intValue()I

    move-result v10

    invoke-static {v8}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v8

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v8

    iget-object v11, v9, Ltta;->h:Lsta;

    iget v12, v11, Lsta;->a:I

    const/4 v13, 0x1

    shl-int/2addr v10, v13

    sub-int/2addr v8, v10

    iget v10, v9, Ltta;->c:I

    move/from16 v16, v10

    move v14, v13

    :goto_ae
    const/16 v13, 0x10

    if-ge v14, v13, :cond_be

    add-int v13, v16, v12

    add-int/2addr v13, v10

    if-gt v13, v8, :cond_be

    add-int v13, v12, v10

    add-int v16, v13, v16

    add-int/lit8 v14, v14, 0x1

    goto :goto_ae

    :cond_be
    const/4 v13, 0x1

    if-le v14, v13, :cond_cf

    add-int/lit8 v13, v14, -0x1

    mul-int v16, v10, v14

    sub-int v8, v8, v16

    div-int/2addr v8, v13

    iget v11, v11, Lsta;->b:I

    invoke-static {v8, v12, v11}, Ldjh;->c(III)I

    move-result v8

    goto :goto_d0

    :cond_cf
    const/4 v8, 0x0

    :goto_d0
    new-instance v11, Lgr8;

    iget v9, v9, Ltta;->a:I

    invoke-direct {v11, v14, v10, v8, v9}, Lgr8;-><init>(IIII)V

    new-instance v8, Lzzh;

    const/16 v9, 0x8

    invoke-direct {v8, v0, v9}, Lzzh;-><init>(Ljava/lang/Object;B)V

    move-object/from16 p3, v2

    move-object/from16 p6, v5

    move-object/from16 p2, v6

    move-object/from16 p4, v7

    move-object/from16 p7, v8

    move-object/from16 p5, v11

    invoke-direct/range {p2 .. p7}, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;-><init>(Landroidx/recyclerview/widget/RecyclerView;Ltta;Lgr8;Lhok;Lzzh;)V

    iput-object v6, v0, Ld0k;->k:Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;

    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    invoke-virtual {v2, v5}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    invoke-virtual {v2, v6}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {v2, v15}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    new-instance v2, Lc0k;

    const/4 v5, 0x0

    invoke-direct {v2, v0, v5}, Lc0k;-><init>(Ld0k;B)V

    new-instance v5, Lt7d;

    const/16 v6, 0xe

    invoke-direct {v5, v2, v6}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v4, v1, v5}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v2, Lc0k;

    const/4 v13, 0x1

    invoke-direct {v2, v0, v13}, Lc0k;-><init>(Ld0k;B)V

    new-instance v0, Lt7d;

    invoke-direct {v0, v2, v6}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v3, v1, v0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final U(Lgqk;Ljava/lang/String;)V
    .registers 4

    iget-boolean p1, p0, Ld0k;->p:Z

    if-eqz p1, :cond_5

    return-void

    :cond_5
    const/4 p1, 0x1

    iput-boolean p1, p0, Ld0k;->p:Z

    iget-object p2, p0, Ld0k;->j:Lhok;

    iget-object p2, p2, Lhok;->C:Ljava/lang/Object;

    check-cast p2, Ljava/util/HashSet;

    invoke-virtual {p2}, Ljava/util/HashSet;->clear()V

    iget-object p2, p0, Ld0k;->f:Lh42;

    invoke-virtual {p2, p0}, Lekc;->k(Lf7f;)V

    iput-boolean p1, p0, Ld0k;->o:Z

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Llpk;

    invoke-virtual {p0, p2}, Ld0k;->a0(Llpk;)V

    iget-object p2, p0, Ld0k;->g:Lw6j;

    iget-object v0, p2, Lw6j;->c:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    iget-object p2, p2, Lw6j;->d:Ljava/lang/Object;

    check-cast p2, Landroid/util/SparseArray;

    invoke-virtual {p2}, Landroid/util/SparseArray;->clear()V

    iput-boolean p1, p0, Ld0k;->n:Z

    return-void
.end method

.method public final Y()V
    .registers 5

    const/4 v0, 0x0

    iput-boolean v0, p0, Ld0k;->l:Z

    iget-boolean v1, p0, Ld0k;->n:Z

    if-eqz v1, :cond_11

    const/4 v1, -0x1

    sget-object v2, Lxk0;->b:Lxk0;

    iget-object v3, p0, Ld0k;->g:Lw6j;

    invoke-virtual {v3, v1, v2}, Lw6j;->n(ILxk0;)V

    iput-boolean v0, p0, Ld0k;->n:Z

    :cond_11
    iget-object v1, p0, Ld0k;->f:Lh42;

    invoke-virtual {v1, p0}, Lekc;->p(Lf7f;)V

    iput-boolean v0, p0, Ld0k;->o:Z

    iput-boolean v0, p0, Ld0k;->p:Z

    return-void
.end method

.method public final Z()V
    .registers 11

    iget-object v0, p0, Ld0k;->i:Lizj;

    iget-object v1, v0, Lizj;->d:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltta;

    iget-object v2, p0, Ld0k;->k:Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v3, v1, Ltta;->c:I

    iput v3, v2, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->b:I

    iget v1, v1, Ltta;->a:I

    iput v1, v2, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->c:I

    iget-object v1, p0, Ld0k;->h:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v0, v0, Lizj;->d:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltta;

    iget-object v4, p0, Ld0k;->d:Likc;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    invoke-static {v1}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    iget-object v5, v3, Ltta;->h:Lsta;

    iget v6, v5, Lsta;->a:I

    const/4 v7, 0x1

    shl-int/2addr v4, v7

    sub-int/2addr v1, v4

    iget v3, v3, Ltta;->c:I

    move v8, v3

    move v4, v7

    :goto_44
    const/16 v9, 0x10

    if-ge v4, v9, :cond_53

    add-int v9, v8, v6

    add-int/2addr v9, v3

    if-gt v9, v1, :cond_53

    add-int v9, v6, v3

    add-int/2addr v8, v9

    add-int/lit8 v4, v4, 0x1

    goto :goto_44

    :cond_53
    if-le v4, v7, :cond_5f

    add-int/lit8 v7, v4, -0x1

    mul-int/2addr v3, v4

    sub-int/2addr v1, v3

    div-int/2addr v1, v7

    iget v3, v5, Lsta;->b:I

    invoke-static {v1, v6, v3}, Ldjh;->c(III)I

    :cond_5f
    iput v4, v2, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->a:I

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltta;

    iget-object p0, p0, Ld0k;->j:Lhok;

    invoke-virtual {p0, v0}, Lns8;->V(Ltta;)V

    return-void
.end method

.method public final a0(Llpk;)V
    .registers 4

    iget-boolean v0, p0, Ld0k;->o:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    if-eqz p1, :cond_16

    iget v0, p0, Ld0k;->m:I

    if-eqz v0, :cond_16

    const/4 v1, 0x0

    iput-boolean v1, p0, Ld0k;->o:Z

    if-nez v0, :cond_13

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_1b

    :cond_13
    iget-object p1, p1, Llpk;->c:Ljava/util/ArrayList;

    goto :goto_1b

    :cond_16
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    :goto_1b
    iget-object p0, p0, Ld0k;->e:Lxok;

    invoke-virtual {p0, p1}, Lxok;->D(Ljava/util/List;)Ljava/util/List;

    return-void
.end method

.method public final bridge synthetic d0(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Llpk;

    invoke-virtual {p0, p1}, Ld0k;->a0(Llpk;)V

    return-void
.end method
