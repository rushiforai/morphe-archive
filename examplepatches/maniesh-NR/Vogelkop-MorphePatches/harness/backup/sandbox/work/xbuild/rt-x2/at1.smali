.class public final Lat1;
.super Lj93;
.source "SourceFile"


# instance fields
.field public final d:Llw3;

.field public final e:Lgjm;

.field public final f:Lz77;

.field public final g:Lyl6;

.field public final h:Lru9;

.field public final i:Lumi;

.field public final j:Lit1;

.field public final k:Lorm;

.field public final l:Lekc;

.field public final m:Lr2i;

.field public final n:Le4i;

.field public final o:Ljze;

.field public final p:Lqie;

.field public q:Z

.field public r:Z

.field public s:Ld7j;

.field public t:Lvb0;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lg8j;Llw3;Lgjm;Lz77;Lyl6;Lru9;Lumi;Lit1;Lorm;Lekc;Lr2i;Le4i;)V
    .registers 14

    invoke-direct {p0, p1, p2}, Lj93;-><init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    iput-object p3, p0, Lat1;->d:Llw3;

    iput-object p4, p0, Lat1;->e:Lgjm;

    iput-object p5, p0, Lat1;->f:Lz77;

    iput-object p6, p0, Lat1;->g:Lyl6;

    iput-object p7, p0, Lat1;->h:Lru9;

    iput-object p8, p0, Lat1;->i:Lumi;

    iput-object p9, p0, Lat1;->j:Lit1;

    iput-object p10, p0, Lat1;->k:Lorm;

    iput-object p11, p0, Lat1;->l:Lekc;

    iput-object p12, p0, Lat1;->m:Lr2i;

    iput-object p13, p0, Lat1;->n:Le4i;

    new-instance p1, Ljze;

    sget-object p2, Lus1;->e:Lus1;

    invoke-direct {p1, p2}, Ljze;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lat1;->o:Ljze;

    new-instance p2, Lqie;

    const/16 p4, 0x13

    invoke-direct {p2, p4}, Lqie;-><init>(B)V

    iput-object p2, p0, Lat1;->p:Lqie;

    iget-object p2, p3, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->k()Lsl6;

    move-result-object p2

    invoke-virtual {p2}, Lsl6;->b()Z

    move-result p2

    iput-boolean p2, p0, Lat1;->q:Z

    invoke-static {p0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object p2

    new-instance p3, Lyf;

    const/4 p4, 0x1

    const/4 p5, 0x0

    invoke-direct {p3, p4, p5, p0}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p6, 0x3

    invoke-static {p2, p5, p5, p3, p6}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    iget-object p2, p12, Lr2i;->h:Lkze;

    new-instance p3, Lvs1;

    const/4 p5, 0x0

    invoke-direct {p3, p0, p5}, Lvs1;-><init>(Lat1;B)V

    new-instance p5, Lug;

    const/4 p6, 0x2

    invoke-direct {p5, p3, p6}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, p2, p5}, Ljze;->s(Lekc;Lf7f;)V

    new-instance p2, Lvs1;

    invoke-direct {p2, p0, p4}, Lvs1;-><init>(Lat1;B)V

    new-instance p0, Lug;

    invoke-direct {p0, p2, p6}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, p11, p0}, Ljze;->s(Lekc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final e()V
    .registers 7

    iget-object v2, p0, Lat1;->t:Lvb0;

    if-eqz v2, :cond_12

    const/4 v0, 0x0

    iput-object v0, p0, Lat1;->t:Lvb0;

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object v0, p0, Lat1;->g:Lyl6;

    iget-object v1, p0, Lat1;->k:Lorm;

    sget-object v3, Lac0;->f:Lac0;

    invoke-virtual/range {v0 .. v5}, Lyl6;->i(Lorm;Lvb0;Lac0;ZLjava/lang/String;)V

    :cond_12
    return-void
.end method

.method public final g(Landroid/content/Context;Lndc;Lqs1;)V
    .registers 13

    new-instance v0, Los1;

    new-instance v1, Lys1;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lys1;-><init>(Lat1;B)V

    new-instance v3, Li51;

    const/4 v8, 0x2

    move-object v4, p0

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    invoke-direct/range {v3 .. v8}, Li51;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lys1;

    const/4 p1, 0x1

    invoke-direct {p0, v4, p1}, Lys1;-><init>(Lat1;B)V

    invoke-direct {v0, v1, v3, p0, v2}, Los1;-><init>(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;B)V

    iget-object p0, v4, Lat1;->f:Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final h(Landroid/content/Context;Lqs1;)V
    .registers 5

    iget p2, p2, Lqs1;->a:I

    invoke-static {p2}, Ld7j;->d(I)Ld7j;

    move-result-object p2

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Lxj;

    const/16 v1, 0x9

    invoke-direct {v0, p0, p1, v1}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p0, Lat1;->i:Lumi;

    invoke-virtual {p1, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p1

    new-instance v0, Lt40;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lt40;-><init>(B)V

    invoke-virtual {p1, v0}, Lnml;->c(Ln5o;)Loml;

    move-result-object p1

    iget-object p0, p0, Lat1;->p:Lqie;

    invoke-virtual {p0, p1, p2}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final i(Ljava/util/List;)V
    .registers 27

    move-object/from16 v0, p0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, v0, Lat1;->l:Lekc;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Lm18;->b:Lm18;

    const-string v5, "6"

    const/16 v6, 0xa

    if-ne v3, v4, :cond_b0

    sget-object v3, Lzs1;->a:Lh58;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_20
    :goto_20
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_35

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    move-object v10, v9

    check-cast v10, Ld7j;

    iget-boolean v10, v10, Ld7j;->f:Z

    if-nez v10, :cond_20

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_20

    :cond_35
    new-instance v3, Ljava/util/ArrayList;

    invoke-static {v4, v6}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v3, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v9, 0x0

    :goto_43
    if-ge v9, v6, :cond_5f

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    check-cast v10, Ld7j;

    new-instance v11, Lqs1;

    iget-byte v12, v10, Ld7j;->e:B

    iget v13, v10, Ld7j;->c:I

    iget-boolean v14, v10, Ld7j;->d:Z

    const/4 v15, 0x0

    const-wide/16 v16, 0x0

    invoke-direct/range {v11 .. v17}, Lqs1;-><init>(IIZZJ)V

    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_43

    :cond_5f
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    move-object/from16 v3, p1

    check-cast v3, Ljava/lang/Iterable;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_6a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_179

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lk15;

    iget-object v6, v4, Lk15;->a:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v9}, Ld7j;->d(I)Ld7j;

    move-result-object v9

    new-instance v10, Lqs1;

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    iget v12, v9, Ld7j;->c:I

    invoke-static {v6, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9c

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    sget-object v9, Lm18;->c:Lm18;

    if-ne v6, v9, :cond_9c

    iget-boolean v6, v0, Lat1;->q:Z

    if-nez v6, :cond_9c

    const/4 v13, 0x1

    goto :goto_9d

    :cond_9c
    const/4 v13, 0x0

    :goto_9d
    iget-object v6, v4, Lk15;->c:Ll15;

    sget-object v9, Ll15;->b:Ll15;

    if-ne v6, v9, :cond_a5

    const/4 v14, 0x1

    goto :goto_a6

    :cond_a5
    const/4 v14, 0x0

    :goto_a6
    iget-wide v7, v4, Lk15;->b:J

    move-wide v15, v7

    invoke-direct/range {v10 .. v16}, Lqs1;-><init>(IIZZJ)V

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6a

    :cond_b0
    sget-object v2, Lzs1;->a:Lh58;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_bb
    :goto_bb
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_d4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Ld7j;

    iget-boolean v8, v7, Ld7j;->d:Z

    if-nez v8, :cond_d0

    iget-boolean v7, v7, Ld7j;->f:Z

    if-nez v7, :cond_bb

    :cond_d0
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_bb

    :cond_d4
    new-instance v2, Ljava/util/ArrayList;

    invoke-static {v3, v6}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v6, 0x0

    :goto_e2
    const-string v7, "rewards.claimed_app_icons"

    iget-object v8, v0, Lat1;->m:Lr2i;

    if-ge v6, v4, :cond_124

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v6, v6, 0x1

    check-cast v10, Ld7j;

    new-instance v18, Lqs1;

    iget-byte v11, v10, Ld7j;->e:B

    iget v12, v10, Ld7j;->c:I

    iget-boolean v13, v10, Ld7j;->d:Z

    if-eqz v13, :cond_111

    iget-object v8, v8, Lr2i;->c:Lru9;

    iget-object v8, v8, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-static {v8, v7}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v7

    iget-byte v8, v10, Ld7j;->e:B

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_111

    const/16 v21, 0x1

    goto :goto_113

    :cond_111
    const/16 v21, 0x0

    :goto_113
    const/16 v22, 0x0

    const-wide/16 v23, 0x0

    move/from16 v19, v11

    move/from16 v20, v12

    invoke-direct/range {v18 .. v24}, Lqs1;-><init>(IIZZJ)V

    move-object/from16 v7, v18

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e2

    :cond_124
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v2, v8, Lr2i;->c:Lru9;

    iget-object v2, v2, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-static {v2, v7}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_138
    :goto_138
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_14f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Ljava/lang/String;

    invoke-static {v6, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_138

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_138

    :cond_14f
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v8, 0x0

    :goto_154
    if-ge v8, v2, :cond_179

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v8, v8, 0x1

    check-cast v4, Ljava/lang/String;

    new-instance v9, Lqs1;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ld7j;->d(I)Ld7j;

    move-result-object v4

    iget v11, v4, Ld7j;->c:I

    const/4 v13, 0x0

    const-wide/16 v14, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v9 .. v15}, Lqs1;-><init>(IIZZJ)V

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_154

    :cond_179
    iget-object v6, v0, Lat1;->o:Ljze;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lus1;

    const/4 v4, 0x0

    const/16 v5, 0xe

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Lus1;->a(Lus1;Ljava/util/ArrayList;Lqs1;ZZI)Lus1;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljze;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final k(Ld7j;ZZ)V
    .registers 11

    iget-object p0, p0, Lat1;->o:Ljze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lus1;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lus1;

    iget-byte p1, p1, Ld7j;->e:B

    iget-object v0, v0, Lus1;->a:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lqs1;

    iget v3, v3, Lqs1;->a:I

    if-ne p1, v3, :cond_19

    goto :goto_2c

    :cond_2b
    const/4 v2, 0x0

    :goto_2c
    move-object v3, v2

    check-cast v3, Lqs1;

    const/4 v6, 0x1

    const/4 v2, 0x0

    move v4, p2

    move v5, p3

    invoke-static/range {v1 .. v6}, Lus1;->a(Lus1;Ljava/util/ArrayList;Lqs1;ZZI)Lus1;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljze;->r(Ljava/lang/Object;)V

    return-void
.end method
