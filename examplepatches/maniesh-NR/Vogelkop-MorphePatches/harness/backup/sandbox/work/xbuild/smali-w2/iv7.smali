.class public final Liv7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lk6l;

.field public final b:Lq6e;

.field public final c:Llg;

.field public final d:Lpde;

.field public final e:Lpde;

.field public final f:Lpde;

.field public final g:Lpde;

.field public final h:Lpde;

.field public final i:Ltsd;

.field public j:Z

.field public final k:Lpde;

.field public l:I


# direct methods
.method public constructor <init>(Lndc;Lk6l;Lq6e;Llg;)V
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v1, v0, Liv7;->a:Lk6l;

    iput-object v2, v0, Liv7;->b:Lq6e;

    iput-object v3, v0, Liv7;->c:Llg;

    new-instance v4, Lpde;

    iget-object v5, v2, Lq6e;->a:Ljava/util/ArrayList;

    invoke-static {v5}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v4, v5}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v4, v0, Liv7;->d:Lpde;

    new-instance v5, Lpde;

    invoke-virtual {v2}, Lq6e;->b()Leri;

    move-result-object v6

    invoke-direct {v5, v6}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v5, v0, Liv7;->e:Lpde;

    new-instance v6, Lpde;

    invoke-virtual {v3}, Llg;->b()Leri;

    move-result-object v7

    invoke-direct {v6, v7}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v6, v0, Liv7;->f:Lpde;

    new-instance v7, Lpde;

    const-wide v8, 0x7ffffffffffffffdL

    invoke-virtual {v2, v8, v9}, Lq6e;->c(J)Ll6e;

    move-result-object v8

    instance-of v9, v8, Ll42;

    if-eqz v9, :cond_46

    check-cast v8, Ll42;

    goto :goto_47

    :cond_46
    const/4 v8, 0x0

    :goto_47
    invoke-direct {v7, v8}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v7, v0, Liv7;->g:Lpde;

    new-instance v8, Lpde;

    const-wide v9, 0x7ffffffffffffffcL

    invoke-virtual {v2, v9, v10}, Lq6e;->c(J)Ll6e;

    move-result-object v9

    invoke-direct {v8, v9}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v8, v0, Liv7;->h:Lpde;

    new-instance v9, Ltsd;

    new-instance v10, Lhv7;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Leri;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Leri;

    invoke-virtual {v7}, Lekc;->g()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ll42;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Leri;

    invoke-direct/range {v10 .. v15}, Lhv7;-><init>(Ljava/util/List;Leri;Leri;Ll42;Leri;)V

    invoke-direct {v9, v10}, Ltsd;-><init>(Ljava/lang/Object;)V

    iput-object v9, v0, Liv7;->i:Ltsd;

    new-instance v10, Lpde;

    invoke-virtual {v0}, Liv7;->a()Z

    move-result v11

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-direct {v10, v11}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v10, v0, Liv7;->k:Lpde;

    new-instance v10, Lkv1;

    const/4 v11, 0x1

    invoke-direct {v10, v0, v11}, Lkv1;-><init>(Ljava/lang/Object;B)V

    new-instance v12, Lfv7;

    const/4 v13, 0x0

    invoke-direct {v12, v0, v13}, Lfv7;-><init>(Liv7;B)V

    invoke-interface/range {p1 .. p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v14

    invoke-static {v2, v14, v10, v12}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance v2, Lr85;

    invoke-direct {v2, v0, v11}, Lr85;-><init>(Ljava/lang/Object;B)V

    new-instance v10, Lfv7;

    invoke-direct {v10, v0, v11}, Lfv7;-><init>(Liv7;B)V

    invoke-interface/range {p1 .. p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v12

    invoke-static {v3, v12, v2, v10}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance v2, Lgv7;

    invoke-direct {v2, v0, v13}, Lgv7;-><init>(Liv7;B)V

    new-instance v3, Lug;

    const/16 v10, 0x13

    invoke-direct {v3, v2, v10}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v2, v9, Ltsd;->l:Lh42;

    invoke-virtual {v2, v4, v3}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v3, Lgv7;

    invoke-direct {v3, v0, v11}, Lgv7;-><init>(Liv7;B)V

    new-instance v4, Lug;

    invoke-direct {v4, v3, v10}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v5, v4}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v3, Lgv7;

    const/4 v4, 0x2

    invoke-direct {v3, v0, v4}, Lgv7;-><init>(Liv7;B)V

    new-instance v4, Lug;

    invoke-direct {v4, v3, v10}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v6, v4}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v3, Lgv7;

    const/4 v4, 0x3

    invoke-direct {v3, v0, v4}, Lgv7;-><init>(Liv7;B)V

    new-instance v4, Lug;

    invoke-direct {v4, v3, v10}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v7, v4}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v3, Lgv7;

    const/4 v4, 0x4

    invoke-direct {v3, v0, v4}, Lgv7;-><init>(Liv7;B)V

    new-instance v4, Lug;

    invoke-direct {v4, v3, v10}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v8, v4}, Lh42;->s(Lekc;Lf7f;)V

    iget-object v1, v1, Lk6l;->w:Lxg;

    new-instance v2, Lqz;

    const/4 v3, 0x6

    invoke-direct {v2, v0, v3}, Lqz;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lvme;

    invoke-direct {v0, v10}, Lvme;-><init>(B)V

    move-object/from16 v3, p1

    invoke-static {v1, v3, v2, v0}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 5

    iget-boolean v0, p0, Liv7;->j:Z

    if-nez v0, :cond_1e

    iget-object v0, p0, Liv7;->c:Llg;

    invoke-virtual {v0}, Llg;->b()Leri;

    move-result-object v0

    invoke-interface {v0}, Leri;->getId()J

    move-result-wide v0

    iget-object p0, p0, Liv7;->b:Lq6e;

    invoke-virtual {p0}, Lq6e;->b()Leri;

    move-result-object p0

    invoke-interface {p0}, Leri;->getId()J

    move-result-wide v2

    cmp-long p0, v0, v2

    if-nez p0, :cond_1e

    const/4 p0, 0x0

    return p0

    :cond_1e
    const/4 p0, 0x1

    return p0
.end method

.method public final b()Z
    .registers 5

    iget-object p0, p0, Liv7;->c:Llg;

    invoke-virtual {p0}, Llg;->b()Leri;

    move-result-object p0

    invoke-interface {p0}, Leri;->getId()J

    move-result-wide v0

    const-wide v2, 0x7ffffffffffffffdL

    cmp-long p0, v0, v2

    if-nez p0, :cond_15

    const/4 p0, 0x1

    return p0

    :cond_15
    const/4 p0, 0x0

    return p0
.end method

.method public final c(Leri;)V
    .registers 7

    invoke-interface {p1}, Leri;->b()Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object p0, p0, Liv7;->b:Lq6e;

    iget-object v0, p0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    instance-of v1, v0, Ljava/util/Collection;

    if-eqz v1, :cond_1d

    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3c

    :cond_1d
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_21
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leri;

    invoke-interface {v1}, Leri;->getId()J

    move-result-wide v1

    invoke-interface {p1}, Leri;->getId()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_21

    invoke-virtual {p0, p1}, Lq6e;->n(Leri;)V

    :cond_3c
    return-void
.end method

.method public final d()V
    .registers 4

    iget-object v0, p0, Liv7;->b:Lq6e;

    iget-object v1, v0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Liv7;->d:Lpde;

    invoke-static {v2, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object v1, p0, Liv7;->e:Lpde;

    invoke-virtual {v0}, Lq6e;->b()Leri;

    move-result-object v2

    invoke-static {v1, v2}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    const-wide v1, 0x7ffffffffffffffdL

    invoke-virtual {v0, v1, v2}, Lq6e;->c(J)Ll6e;

    move-result-object v1

    instance-of v2, v1, Ll42;

    if-eqz v2, :cond_26

    check-cast v1, Ll42;

    goto :goto_27

    :cond_26
    const/4 v1, 0x0

    :goto_27
    iget-object v2, p0, Liv7;->g:Lpde;

    invoke-static {v2, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    const-wide v1, 0x7ffffffffffffffcL

    invoke-virtual {v0, v1, v2}, Lq6e;->c(J)Ll6e;

    move-result-object v0

    iget-object v1, p0, Liv7;->h:Lpde;

    invoke-static {v1, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    invoke-virtual {p0}, Liv7;->a()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object p0, p0, Liv7;->k:Lpde;

    invoke-static {p0, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final e(Leri;Z)Z
    .registers 6

    iget-object v0, p0, Liv7;->c:Llg;

    if-eqz p2, :cond_a

    const/4 p2, 0x1

    invoke-virtual {v0, p1, p2, p2}, Llg;->f(Leri;ZZ)Z

    move-result p2

    goto :goto_12

    :cond_a
    invoke-interface {p1}, Leri;->getId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Llg;->e(J)Z

    move-result p2

    :goto_12
    if-eqz p2, :cond_19

    iget-object p0, p0, Liv7;->b:Lq6e;

    invoke-virtual {p0, p1}, Lq6e;->k(Leri;)V

    :cond_19
    return p2
.end method

.method public final f()V
    .registers 4

    iget-object v0, p0, Liv7;->a:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_13

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->j0()J

    move-result-wide v0

    iget-object v2, p0, Liv7;->b:Lq6e;

    invoke-virtual {v2, v0, v1}, Lq6e;->c(J)Ll6e;

    move-result-object v0

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    if-nez v0, :cond_1e

    iget-object v0, p0, Liv7;->e:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leri;

    :cond_1e
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Liv7;->e(Leri;Z)Z

    return-void
.end method
