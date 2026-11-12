.class public final Ltkc;
.super Lz5k;
.source "SourceFile"

# interfaces
.implements Lzsh;
.implements Lndc;


# instance fields
.field public final f:Llu3;

.field public final g:Llu3;

.field public final h:Landroidx/recyclerview/widget/RecyclerView;

.field public final i:Ldqc;

.field public final j:Ltsd;

.field public final k:Lkze;

.field public final l:Lqdc;

.field public final m:Lqdc;

.field public final n:Lks6;

.field public final o:Lnoc;

.field public final p:Lqkc;

.field public final q:Lagm;


# direct methods
.method public constructor <init>(Lndc;Llu3;Llu3;Landroidx/recyclerview/widget/RecyclerView;Lijc;Lcom/opera/android/feed/FeedScrollView;Ldqc;Ltsd;Lkze;Ltsd;Lfwf;)V
    .registers 24

    move-object/from16 v0, p7

    sget-object v4, Le6k;->o:Le6k;

    const v5, 0x7f0d0232

    const/4 v6, 0x0

    const-class v2, Lskc;

    move-object v1, p0

    move-object/from16 v3, p5

    invoke-direct/range {v1 .. v6}, Lz5k;-><init>(Ljava/lang/Class;Lijc;Le6k;IB)V

    iput-object p2, p0, Ltkc;->f:Llu3;

    iput-object p3, p0, Ltkc;->g:Llu3;

    move-object/from16 v2, p4

    iput-object v2, p0, Ltkc;->h:Landroidx/recyclerview/widget/RecyclerView;

    iput-object v0, p0, Ltkc;->i:Ldqc;

    move-object/from16 v2, p8

    iput-object v2, p0, Ltkc;->j:Ltsd;

    move-object/from16 v2, p9

    iput-object v2, p0, Ltkc;->k:Lkze;

    new-instance v2, Lqdc;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lqdc;-><init>(Lndc;Z)V

    iput-object v2, p0, Ltkc;->l:Lqdc;

    iput-object v2, p0, Ltkc;->m:Lqdc;

    new-instance v3, Lks6;

    const/16 v4, 0x1a

    invoke-direct {v3, p0, v4}, Lks6;-><init>(Ljava/lang/Object;B)V

    iput-object v3, p0, Ltkc;->n:Lks6;

    new-instance v8, Lnoc;

    iget-object v7, v0, Ldqc;->d:Ljs6;

    move-object/from16 v4, p6

    invoke-direct {v8, p1, v4, v7}, Lnoc;-><init>(Lndc;Lcom/opera/android/feed/FeedScrollView;Ljs6;)V

    iput-object v8, p0, Ltkc;->o:Lnoc;

    new-instance v5, Lqkc;

    new-instance v6, Lrkc;

    const/4 p1, 0x0

    invoke-direct {v6, p0, p1}, Lrkc;-><init>(Ljava/lang/Object;B)V

    iget-object v9, v0, Ldqc;->g:Lrlh;

    new-instance v11, Lwub;

    invoke-direct {v11, p0}, Lwub;-><init>(Ljava/lang/Object;)V

    move-object/from16 v10, p11

    invoke-direct/range {v5 .. v11}, Lqkc;-><init>(Lrkc;Ljs6;Lnoc;Lrlh;Lfwf;Lwub;)V

    iput-object v5, p0, Ltkc;->p:Lqkc;

    new-instance p1, Lagm;

    new-instance v4, Lgv8;

    const/16 v5, 0x15

    move-object/from16 v6, p10

    invoke-direct {v4, p0, v6, v5}, Lgv8;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p1, v4}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Ltkc;->q:Lagm;

    sget-object p1, Lqcc;->c:Lqcc;

    invoke-virtual {v2, p1}, Lqdc;->g(Lqcc;)V

    iget-object p1, v0, Ldqc;->e:Ljze;

    invoke-virtual {p1, v3}, Lekc;->k(Lf7f;)V

    iget-object p1, v0, Ldqc;->f:Lrlh;

    invoke-static {p1, v2}, Lscd;->D(Lf99;Ltcc;)Lj94;

    move-result-object p1

    invoke-static {v2}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v0

    new-instance v2, Lfb9;

    const/16 v3, 0x9

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, p0}, Lfb9;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p1, v0, v2}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    return-void
.end method


# virtual methods
.method public final C()Lagm;
    .registers 1

    iget-object p0, p0, Ltkc;->q:Lagm;

    return-object p0
.end method

.method public final D(Ljava/util/List;ZZZ)V
    .registers 13

    iget-object p0, p0, Ltkc;->p:Lqkc;

    iput-boolean p2, p0, Lqkc;->k:Z

    iput-boolean p3, p0, Lqkc;->l:Z

    iput-boolean p4, p0, Lqkc;->m:Z

    iget-object v0, p0, Lqkc;->n:Ljava/util/List;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez p3, :cond_12

    if-nez p2, :cond_12

    move p3, v1

    goto :goto_13

    :cond_12
    move p3, v2

    :goto_13
    check-cast p1, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_49

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lzmc;

    if-eqz v5, :cond_45

    instance-of v6, v5, Lkmc;

    if-nez v6, :cond_41

    instance-of v6, v5, Lnmc;

    if-nez v6, :cond_41

    instance-of v6, v5, Lpmc;

    if-nez v6, :cond_41

    instance-of v6, v5, Lqmc;

    if-nez v6, :cond_41

    instance-of v5, v5, Lwmc;

    if-eqz v5, :cond_45

    :cond_41
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    :cond_45
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_49
    if-eqz p4, :cond_6a

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_6a

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    move p4, v1

    :cond_56
    if-ge p4, p1, :cond_6a

    invoke-virtual {v3, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 p4, p4, 0x1

    check-cast v4, Lzmc;

    invoke-interface {v4}, Lzmc;->a()Llmc;

    move-result-object v4

    iget-object v4, v4, Llmc;->h:Limc;

    if-eqz v4, :cond_56

    move p1, v2

    goto :goto_6b

    :cond_6a
    move p1, v1

    :goto_6b
    new-instance p4, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {v3, v4}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {p4, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    :goto_7a
    if-ge v1, v4, :cond_e2

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v1, v1, 0x1

    check-cast v5, Lzmc;

    if-eqz v5, :cond_de

    instance-of v6, v5, Lkmc;

    if-eqz v6, :cond_97

    new-instance v6, Lblc;

    new-instance v7, Lclc;

    check-cast v5, Lkmc;

    invoke-direct {v7, v5, p1}, Lclc;-><init>(Lkmc;Z)V

    invoke-direct {v6, v7}, Lblc;-><init>(Lclc;)V

    goto :goto_da

    :cond_97
    instance-of v6, v5, Lnmc;

    if-eqz v6, :cond_a8

    new-instance v6, Ldlc;

    new-instance v7, Lelc;

    check-cast v5, Lnmc;

    invoke-direct {v7, v5, p1}, Lelc;-><init>(Lnmc;Z)V

    invoke-direct {v6, v7}, Ldlc;-><init>(Lelc;)V

    goto :goto_da

    :cond_a8
    instance-of v6, v5, Lpmc;

    if-eqz v6, :cond_b9

    new-instance v6, Lflc;

    new-instance v7, Lglc;

    check-cast v5, Lpmc;

    invoke-direct {v7, v5, p1}, Lglc;-><init>(Lpmc;Z)V

    invoke-direct {v6, v7}, Lflc;-><init>(Lglc;)V

    goto :goto_da

    :cond_b9
    instance-of v6, v5, Lqmc;

    if-eqz v6, :cond_ca

    new-instance v6, Lhlc;

    new-instance v7, Lilc;

    check-cast v5, Lqmc;

    invoke-direct {v7, v5, p1, p3, p2}, Lilc;-><init>(Lqmc;ZZZ)V

    invoke-direct {v6, v7}, Lhlc;-><init>(Lilc;)V

    goto :goto_da

    :cond_ca
    instance-of v6, v5, Lwmc;

    if-eqz v6, :cond_de

    new-instance v6, Ljlc;

    new-instance v7, Lklc;

    check-cast v5, Lwmc;

    invoke-direct {v7, v5, p1, p3, p2}, Lklc;-><init>(Lwmc;ZZZ)V

    invoke-direct {v6, v7}, Ljlc;-><init>(Lklc;)V

    :goto_da
    invoke-virtual {p4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7a

    :cond_de
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_e2
    iput-object p4, p0, Lqkc;->n:Ljava/util/List;

    new-instance p1, Lik;

    invoke-direct {p1, p4, v0}, Lik;-><init>(Ljava/util/ArrayList;Ljava/util/List;)V

    invoke-static {p1, v2}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object p1

    invoke-virtual {p1, p0}, Lj87;->b(Landroidx/recyclerview/widget/d;)V

    return-void
.end method

.method public final b(Lsjm;)V
    .registers 5

    iget-boolean p1, p1, Lsjm;->a:Z

    iget-object v0, p0, Ltkc;->o:Lnoc;

    iget-boolean v1, v0, Lnoc;->e:Z

    if-eq v1, p1, :cond_2b

    iput-boolean p1, v0, Lnoc;->e:Z

    iget-object v1, v0, Lnoc;->c:Llw7;

    if-eqz p1, :cond_1b

    iget-object v2, v1, Llw7;->b:Ltcc;

    if-eqz v2, :cond_15

    invoke-virtual {v2, v1}, Ltcc;->a(Lmdc;)V

    :cond_15
    iget-object v0, v0, Lnoc;->b:Lcan;

    invoke-virtual {v0}, Lcan;->d()V

    goto :goto_2b

    :cond_1b
    iget-object v2, v1, Llw7;->b:Ltcc;

    if-eqz v2, :cond_22

    invoke-virtual {v2, v1}, Ltcc;->b(Lmdc;)V

    :cond_22
    iget-object v0, v0, Lnoc;->a:Ljs6;

    iget-object v0, v0, Ljs6;->j:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    :cond_2b
    :goto_2b
    iget-object p0, p0, Ltkc;->p:Lqkc;

    iget-object p0, p0, Lqkc;->g:Laan;

    invoke-virtual {p0, p1}, Lcan;->b(Z)V

    return-void
.end method

.method public final c()V
    .registers 5

    iget-object p0, p0, Ltkc;->i:Ldqc;

    iget-object p0, p0, Ldqc;->d:Ljs6;

    iget-object v0, p0, Ljs6;->d:Ljava/lang/Object;

    check-cast v0, Lfs6;

    iget-object v0, v0, Lfs6;->d:Ljze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2f

    iget-object p0, p0, Ljs6;->e:Ljava/lang/Object;

    check-cast p0, Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcq6;

    iget-object p0, p0, Lcq6;->d:Lti9;

    iget-object v0, p0, Lti9;->a:Lnx5;

    new-instance v1, Lrf4;

    const/4 v2, 0x5

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p0}, Lrf4;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p0, 0x3

    invoke-static {v0, v3, v3, v1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_2f
    return-void
.end method

.method public final getLifecycle()Ltcc;
    .registers 1

    iget-object p0, p0, Ltkc;->m:Lqdc;

    return-object p0
.end method

.method public final onDestroy()V
    .registers 3

    iget-object v0, p0, Ltkc;->l:Lqdc;

    sget-object v1, Lqcc;->a:Lqcc;

    invoke-virtual {v0, v1}, Lqdc;->g(Lqcc;)V

    iget-object v0, p0, Ltkc;->i:Ldqc;

    iget-object v0, v0, Ldqc;->e:Ljze;

    iget-object p0, p0, Ltkc;->n:Lks6;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    return-void
.end method

.method public final t()Lja2;
    .registers 2

    new-instance p0, Lskc;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    return-object p0
.end method

.method public final z()Z
    .registers 3

    iget-object v0, p0, Ltkc;->l:Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    sget-object v1, Lqcc;->e:Lqcc;

    invoke-virtual {v0, v1}, Lqcc;->d(Lqcc;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Ltkc;->i:Ldqc;

    iget-object p0, p0, Ldqc;->f:Lrlh;

    iget-object p0, p0, Lrlh;->a:Lnak;

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lfqc;

    if-eqz p0, :cond_1c

    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method
