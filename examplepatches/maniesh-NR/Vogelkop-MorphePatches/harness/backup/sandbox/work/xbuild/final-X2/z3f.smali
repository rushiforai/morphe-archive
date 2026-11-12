.class public final Lz3f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lodb;


# instance fields
.field public final a:Lx5f;

.field public final b:Lesk;

.field public final c:Lghf;

.field public final d:Ljava/util/LinkedHashSet;


# direct methods
.method public constructor <init>(Lx5f;Lesk;Lghf;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lz3f;->a:Lx5f;

    iput-object p2, p0, Lz3f;->b:Lesk;

    iput-object p3, p0, Lz3f;->c:Lghf;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lz3f;->d:Ljava/util/LinkedHashSet;

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/android/suggestion/Suggestion;)V
    .registers 5

    iget-object p1, p1, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    instance-of v0, p1, Lb58;

    if-eqz v0, :cond_9

    check-cast p1, Lb58;

    goto :goto_a

    :cond_9
    const/4 p1, 0x0

    :goto_a
    if-eqz p1, :cond_22

    new-instance v0, Ly3f;

    iget v1, p1, Lb58;->a:I

    iget-object v2, p1, Lb58;->b:Ljava/lang/Integer;

    invoke-direct {v0, v1, v2}, Ly3f;-><init>(ILjava/lang/Integer;)V

    iget-object v1, p0, Lz3f;->d:Ljava/util/LinkedHashSet;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object p1, p1, Lb58;->g:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lz3f;->c(Ljava/util/ArrayList;)V

    :cond_22
    return-void
.end method

.method public final b(Lcom/opera/android/suggestion/Suggestion;)V
    .registers 11

    iget-object p1, p1, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    instance-of v0, p1, Lb58;

    if-eqz v0, :cond_9

    check-cast p1, Lb58;

    goto :goto_a

    :cond_9
    const/4 p1, 0x0

    :goto_a
    if-nez p1, :cond_d

    return-void

    :cond_d
    iget v0, p1, Lb58;->a:I

    iget-object v1, p1, Lb58;->b:Ljava/lang/Integer;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, p0, Lz3f;->a:Lx5f;

    iget-object v5, v4, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    invoke-virtual {v6, v5}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v5

    invoke-virtual {v5}, Lqd0;->C0()Lif0;

    move-result-object v5

    invoke-static {}, Lzpa;->L()Lkq0;

    move-result-object v7

    invoke-virtual {v7}, Lkq0;->y()Lhf0;

    move-result-object v8

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v8, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    const/4 v2, 0x5

    invoke-virtual {v7, v2}, Ljf0;->e(I)V

    invoke-virtual {v4, v5, v7, v0, v1}, Lx5f;->d(Lif0;Lkq0;ILjava/lang/Integer;)V

    invoke-virtual {v4, v6}, Lx5f;->U0(Lx56;)V

    iget-object p1, p1, Lb58;->f:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lz3f;->c(Ljava/util/ArrayList;)V

    return-void
.end method

.method public final c(Ljava/util/ArrayList;)V
    .registers 10

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_82

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_17
    if-ge v4, v2, :cond_31

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Landroid/net/Uri;

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lp6l;->a:Lp6l;

    iget-object v7, p0, Lz3f;->c:Lghf;

    invoke-virtual {v7, v5, v6}, Lghf;->L(Ljava/lang/String;Lp6l;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_17

    :cond_31
    new-instance p1, Ljava/util/ArrayList;

    invoke-static {v0, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v2, v3

    :goto_3f
    if-ge v2, v1, :cond_69

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    check-cast v4, Ljava/lang/String;

    iget-object v5, p0, Lz3f;->b:Lesk;

    invoke-interface {v5}, Lesk;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lt9f;

    new-instance v6, Lfvh;

    invoke-direct {v6}, Lfvh;-><init>()V

    invoke-virtual {v6}, Lfvh;->c()V

    invoke-virtual {v6, v4}, Lfvh;->h(Ljava/lang/String;)V

    new-instance v4, Lkvh;

    invoke-direct {v4, v6}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v5, v4}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3f

    :cond_69
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p0

    :goto_6d
    if-ge v3, p0, :cond_82

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v3, v3, 0x1

    check-cast v0, Lv84;

    new-instance v1, Lj06;

    const/16 v2, 0x15

    invoke-direct {v1, v2}, Lj06;-><init>(B)V

    invoke-interface {v0, v1}, Lv84;->enqueue(Lf94;)V

    goto :goto_6d

    :cond_82
    return-void
.end method

.method public final reset()V
    .registers 10

    iget-object v0, p0, Lz3f;->d:Ljava/util/LinkedHashSet;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_39

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ly3f;

    iget v3, v2, Ly3f;->a:I

    iget-object v2, v2, Ly3f;->b:Ljava/lang/Integer;

    iget-object v4, p0, Lz3f;->a:Lx5f;

    iget-object v5, v4, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    invoke-virtual {v6, v5}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v5

    invoke-virtual {v5}, Lqd0;->C0()Lif0;

    move-result-object v5

    invoke-static {}, Lzpa;->L()Lkq0;

    move-result-object v7

    const/4 v8, 0x2

    invoke-virtual {v7, v8}, Ljf0;->e(I)V

    const/4 v8, 0x6

    invoke-virtual {v7, v8}, Ljf0;->e(I)V

    invoke-virtual {v4, v5, v7, v3, v2}, Lx5f;->d(Lif0;Lkq0;ILjava/lang/Integer;)V

    invoke-virtual {v4, v6}, Lx5f;->U0(Lx56;)V

    goto :goto_6

    :cond_39
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    return-void
.end method
