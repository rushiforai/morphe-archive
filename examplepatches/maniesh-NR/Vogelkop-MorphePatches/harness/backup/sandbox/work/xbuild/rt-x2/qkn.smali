.class public final Lqkn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lgjm;

.field public final b:Lqln;

.field public final c:Lonn;

.field public final d:Lcom/opera/android/settings/SettingsManager;

.field public final e:Lezg;

.field public final f:Landroidx/recyclerview/widget/RecyclerView;

.field public final g:Lk3i;

.field public final h:Lx4i;

.field public final i:Lqs7;

.field public final j:Lujn;

.field public final k:Lzk7;

.field public final l:Lq87;

.field public m:Lt79;

.field public n:Li4a;

.field public o:Z

.field public final p:Lysj;

.field public q:Lexd;

.field public final r:Lcom/opera/android/StatusBarDrawingFrameLayout;

.field public final s:Lt77;


# direct methods
.method public constructor <init>(Lgjm;Lqln;Lonn;Lcom/opera/android/settings/SettingsManager;Landroidx/recyclerview/widget/RecyclerView;Ln1;Lysj;Lcom/opera/android/StatusBarDrawingFrameLayout;Lorm;Leej;Lwln;Lk3i;Lx4i;)V
    .registers 29

    move-object/from16 v4, p2

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v10, Lezg;

    const/16 v0, 0xb

    invoke-direct {v10, p0, v0}, Lezg;-><init>(Ljava/lang/Object;B)V

    iput-object v10, p0, Lqkn;->e:Lezg;

    new-instance v11, Lt77;

    const/16 v0, 0xc

    invoke-direct {v11, p0, v0}, Lt77;-><init>(Ljava/lang/Object;B)V

    iput-object v11, p0, Lqkn;->s:Lt77;

    move-object/from16 v0, p1

    iput-object v0, p0, Lqkn;->a:Lgjm;

    iput-object v4, p0, Lqkn;->b:Lqln;

    move-object/from16 v0, p3

    iput-object v0, p0, Lqkn;->c:Lonn;

    iput-object v7, p0, Lqkn;->d:Lcom/opera/android/settings/SettingsManager;

    iput-object v8, p0, Lqkn;->f:Landroidx/recyclerview/widget/RecyclerView;

    move-object/from16 v0, p12

    iput-object v0, p0, Lqkn;->g:Lk3i;

    iput-object v9, p0, Lqkn;->h:Lx4i;

    sget-object v0, Lqs7;->o:Lqs7;

    iput-object v0, p0, Lqkn;->i:Lqs7;

    move-object/from16 v0, p7

    iput-object v0, p0, Lqkn;->p:Lysj;

    move-object/from16 v0, p8

    iput-object v0, p0, Lqkn;->r:Lcom/opera/android/StatusBarDrawingFrameLayout;

    new-instance v12, Lk56;

    invoke-direct {v12}, Lk56;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, v12, Lxkj;->g:Z

    new-instance v13, Lujn;

    iget-object v14, v4, Lqln;->g:Lagm;

    new-instance v0, Lpkn;

    move-object v1, p0

    move-object/from16 v3, p6

    move-object/from16 v5, p9

    move-object/from16 v6, p10

    move-object/from16 v2, p11

    invoke-direct/range {v0 .. v6}, Lpkn;-><init>(Lqkn;Lwln;Ln1;Lqln;Lorm;Leej;)V

    invoke-direct {v13, v3, v14, v7, v0}, Lujn;-><init>(Ln1;Lagm;Lcom/opera/android/settings/SettingsManager;Ltjn;)V

    iput-object v13, p0, Lqkn;->j:Lujn;

    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0c0093

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lqkn;->b(I)V

    invoke-virtual {v8, v12}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    invoke-virtual {v8, v13}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    new-instance v0, Lzk7;

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lg00;

    const/4 v4, 0x2

    const v5, 0x7f080a22

    invoke-direct {v3, v2, v5, v4}, Lg00;-><init>(Ljava/lang/Object;IB)V

    new-instance v2, Lr2n;

    const/16 v4, 0x8

    invoke-direct {v2, p0, v4}, Lr2n;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v3, v2}, Lzk7;-><init>(Lyk7;Lxk7;)V

    iput-object v0, p0, Lqkn;->k:Lzk7;

    invoke-virtual {v8, v0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    new-instance v0, Lq87;

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lz4k;

    const/16 v4, 0xd

    invoke-direct {v3, p0, v4}, Lz4k;-><init>(Ljava/lang/Object;B)V

    const v4, 0x7f080a24

    invoke-direct {v0, v2, v4, v3}, Lq87;-><init>(Landroid/content/Context;ILll7;)V

    iput-object v0, p0, Lqkn;->l:Lq87;

    invoke-virtual {v8, v0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    invoke-virtual {p0}, Lqkn;->d()Z

    invoke-virtual {v7, v10}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iget-object p0, v9, Lx4i;->h:Lode;

    invoke-virtual {p0, v11}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object v0, p0, Lqkn;->h:Lx4i;

    iget-object v0, v0, Lx4i;->h:Lode;

    iget-object v1, p0, Lqkn;->s:Lt77;

    invoke-virtual {v0, v1}, Lekc;->p(Lf7f;)V

    iget-object v0, p0, Lqkn;->d:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lqkn;->e:Lezg;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    :goto_10
    iget-object v0, p0, Lqkn;->f:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->p:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1f

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->r0(I)V

    goto :goto_10

    :cond_1f
    const/4 v0, 0x1

    iput-boolean v0, p0, Lqkn;->o:Z

    return-void
.end method

.method public final b(I)V
    .registers 22

    move-object/from16 v0, p0

    move/from16 v8, p1

    new-instance v3, Landroidx/recyclerview/widget/GridLayoutManager;

    iget-object v1, v0, Lqkn;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    const/4 v2, 0x2

    filled-new-array {v8, v2}, [I

    move-result-object v4

    new-instance v5, Ljava/util/LinkedHashSet;

    invoke-static {v2}, Lqbd;->a(I)I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/LinkedHashSet;-><init>(I)V

    const/4 v7, 0x0

    :goto_1a
    if-ge v7, v2, :cond_28

    aget v9, v4, v7

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v5, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_1a

    :cond_28
    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1b7

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    const/4 v10, 0x1

    if-ne v4, v10, :cond_49

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    goto/16 :goto_16b

    :cond_49
    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1b1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    :goto_59
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_165

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    if-eqz v4, :cond_15e

    if-eqz v5, :cond_15e

    const/high16 v7, -0x80000000

    sget-object v9, Lzwc;->d:Lzwc;

    if-eqz v4, :cond_106

    if-eqz v5, :cond_106

    int-to-long v13, v4

    const-wide/32 v15, 0x7fffffff

    int-to-long v11, v5

    if-gez v4, :cond_8d

    if-ne v7, v4, :cond_88

    move v6, v4

    move/from16 v17, v10

    goto :goto_8b

    :cond_88
    neg-int v6, v4

    const/16 v17, 0x0

    :goto_8b
    neg-long v13, v13

    goto :goto_90

    :cond_8d
    move v6, v4

    const/16 v17, 0x0

    :goto_90
    if-gez v5, :cond_9f

    if-ne v7, v5, :cond_9a

    move/from16 v17, v10

    move-wide/from16 v18, v15

    move v15, v5

    goto :goto_9d

    :cond_9a
    move-wide/from16 v18, v15

    neg-int v15, v5

    :goto_9d
    neg-long v11, v11

    goto :goto_a2

    :cond_9f
    move-wide/from16 v18, v15

    move v15, v5

    :goto_a2
    if-eqz v17, :cond_dd

    cmp-long v6, v13, v11

    if-eqz v6, :cond_cb

    rem-long/2addr v11, v13

    const-wide/16 v15, 0x0

    cmp-long v6, v11, v15

    if-nez v6, :cond_c7

    cmp-long v6, v13, v18

    if-gtz v6, :cond_b5

    long-to-int v6, v13

    goto :goto_117

    :cond_b5
    new-instance v0, Lwed;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, v9, v1}, Lwed;-><init>(Lzwc;[Ljava/lang/Object;)V

    throw v0

    :cond_c7
    long-to-int v15, v11

    rem-long/2addr v13, v11

    long-to-int v6, v13

    goto :goto_dd

    :cond_cb
    new-instance v0, Lwed;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, v9, v1}, Lwed;-><init>(Lzwc;[Ljava/lang/Object;)V

    throw v0

    :cond_dd
    :goto_dd
    if-nez v6, :cond_e1

    move v6, v15

    goto :goto_117

    :cond_e1
    if-eqz v15, :cond_117

    invoke-static {v6}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v9

    shr-int/2addr v6, v9

    invoke-static {v15}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v11

    shr-int/2addr v15, v11

    sget-object v12, Lwp8;->a:[[D

    if-le v9, v11, :cond_f2

    move v9, v11

    :cond_f2
    :goto_f2
    if-eq v6, v15, :cond_104

    sub-int v11, v6, v15

    invoke-static {v6, v15}, Ljava/lang/Math;->min(II)I

    move-result v15

    invoke-static {v11}, Ljava/lang/Math;->abs(I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v11

    shr-int/2addr v6, v11

    goto :goto_f2

    :cond_104
    shl-int/2addr v6, v9

    goto :goto_117

    :cond_106
    const-wide/32 v18, 0x7fffffff

    if-eq v4, v7, :cond_14c

    if-eq v5, v7, :cond_14c

    add-int v6, v4, v5

    sget-object v9, Lwp8;->a:[[D

    ushr-int/lit8 v9, v6, 0x1f

    not-int v11, v9

    add-int/2addr v11, v10

    xor-int/2addr v6, v11

    add-int/2addr v6, v9

    :cond_117
    :goto_117
    div-int v6, v4, v6

    int-to-long v11, v6

    int-to-long v13, v5

    mul-long/2addr v11, v13

    const-wide/32 v13, -0x80000000

    cmp-long v6, v11, v13

    if-ltz v6, :cond_146

    cmp-long v6, v11, v18

    if-gtz v6, :cond_146

    long-to-int v6, v11

    sget-object v9, Lwp8;->a:[[D

    ushr-int/lit8 v9, v6, 0x1f

    not-int v11, v9

    add-int/2addr v11, v10

    xor-int/2addr v6, v11

    add-int/2addr v6, v9

    if-ne v6, v7, :cond_15f

    new-instance v0, Lwed;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lzwc;->e:Lzwc;

    invoke-direct {v0, v2, v1}, Lwed;-><init>(Lzwc;[Ljava/lang/Object;)V

    throw v0

    :cond_146
    new-instance v0, Lwed;

    invoke-direct {v0}, Lwed;-><init>()V

    throw v0

    :cond_14c
    new-instance v0, Lwed;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, v9, v1}, Lwed;-><init>(Lzwc;[Ljava/lang/Object;)V

    throw v0

    :cond_15e
    const/4 v6, 0x0

    :cond_15f
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto/16 :goto_59

    :cond_165
    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v2

    :goto_16b
    invoke-direct {v3, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(I)V

    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object v2, v0, Lqkn;->n:Li4a;

    if-eqz v2, :cond_178

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->q0(Liph;)V

    :cond_178
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x41800000    # 16.0f

    invoke-static {v2, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v6

    const/high16 v2, 0x41000000    # 8.0f

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-static {v10, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v4, v1

    new-instance v1, Lt79;

    const/4 v7, 0x0

    const/4 v9, 0x0

    iget-object v2, v0, Lqkn;->f:Landroidx/recyclerview/widget/RecyclerView;

    move v5, v4

    invoke-direct/range {v1 .. v9}, Lt79;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/GridLayoutManager;IIIIIB)V

    iput-object v1, v0, Lqkn;->m:Lt79;

    new-instance v4, Li4a;

    invoke-direct {v4, v1}, Li4a;-><init>(Lk8;)V

    iput-object v4, v0, Lqkn;->n:Li4a;

    invoke-virtual {v2, v4}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    new-instance v1, Lj4a;

    iget-object v0, v0, Lqkn;->j:Lujn;

    invoke-direct {v1, v3, v8, v0}, Lj4a;-><init>(Landroidx/recyclerview/widget/GridLayoutManager;ILd4a;)V

    iput-boolean v10, v1, Ltx7;->b:Z

    iput-boolean v10, v1, Ltx7;->a:Z

    iput-object v1, v3, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    return-void

    :cond_1b1
    const-string v0, "Empty collection can\'t be reduced."

    invoke-static {v0}, Lyt7;->k(Ljava/lang/String;)V

    return-void

    :cond_1b7
    new-instance v0, Ljava/security/InvalidParameterException;

    const-string v1, "Empty arguments"

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final c(Z)V
    .registers 6

    iget-object v0, p0, Lqkn;->j:Lujn;

    iget-object v1, v0, Lujn;->e:Ln1;

    invoke-virtual {v1, p1}, Ln1;->G0(Z)V

    iget-object v1, p0, Lqkn;->g:Lk3i;

    invoke-virtual {v1}, Lk3i;->c()Z

    move-result v1

    iget-object v2, p0, Lqkn;->b:Lqln;

    if-eqz v1, :cond_61

    if-eqz p1, :cond_61

    iget-object p1, v2, Lqln;->f:Lami;

    iget-object p1, p1, Lami;->g:Ljava/lang/Object;

    check-cast p1, Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Lqkn;->h:Lx4i;

    iget-object p0, p0, Lx4i;->h:Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-eqz p0, :cond_5b

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5b

    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p0

    check-cast p1, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_40
    :goto_40
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Laln;

    invoke-interface {v3}, Laln;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_40

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_40

    :cond_5b
    sget-object v1, Ll08;->a:Ll08;

    :cond_5d
    invoke-virtual {v0, v1}, Lujn;->T(Ljava/util/List;)V

    return-void

    :cond_61
    iget-object p0, v2, Lqln;->f:Lami;

    iget-object p0, p0, Lami;->g:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    invoke-virtual {v0, p0}, Lujn;->T(Ljava/util/List;)V

    return-void
.end method

.method public final d()Z
    .registers 4

    iget-object v0, p0, Lqkn;->b:Lqln;

    invoke-virtual {v0}, Lqln;->i()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lqkn;->j:Lujn;

    invoke-virtual {v1, v0}, Lujn;->P(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lqkn;->i:Lqs7;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lqs7;->p:Ljava/lang/String;

    if-eqz v1, :cond_38

    const/4 v1, -0x1

    if-eq v0, v1, :cond_38

    const-string v1, "wallpaper_current"

    iget-object v2, p0, Lqkn;->d:Lcom/opera/android/settings/SettingsManager;

    iget-object v2, v2, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {v2, v1}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v1

    iget-object p0, p0, Lqkn;->f:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v1, :cond_35

    const/high16 v1, 0x42800000    # 64.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    invoke-static {p0, v0, v1}, Lexg;->z(Landroidx/recyclerview/widget/RecyclerView;II)V

    const/4 p0, 0x1

    return p0

    :cond_35
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_38
    const/4 p0, 0x0

    return p0
.end method
