.class public final Lydh;
.super Ltq8;
.source "SourceFile"


# instance fields
.field public final h:I

.field public i:I

.field public final j:Lghf;

.field public final k:Ljava/util/ArrayList;

.field public final l:Lkdh;

.field public m:Z


# direct methods
.method public constructor <init>(IILghf;)V
    .registers 4

    invoke-direct {p0}, Ltq8;-><init>()V

    iput p1, p0, Lydh;->h:I

    iput p2, p0, Lydh;->i:I

    iput-object p3, p0, Lydh;->j:Lghf;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lydh;->k:Ljava/util/ArrayList;

    new-instance p1, Lkdh;

    invoke-direct {p1}, Ltq8;-><init>()V

    iput-object p1, p0, Lydh;->l:Lkdh;

    return-void
.end method


# virtual methods
.method public final D()V
    .registers 9

    iget-object v0, p0, Lydh;->l:Lkdh;

    iget-object v1, v0, Ltq8;->e:Ljava/util/ArrayList;

    :goto_4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    if-lez v2, :cond_13

    invoke-virtual {v0, v3}, Ltq8;->u(I)Lhq8;

    move-result-object v2

    invoke-virtual {v0, v2}, Ltq8;->A(Lhq8;)V

    goto :goto_4

    :cond_13
    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1d
    :goto_1d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_33

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lhq8;

    invoke-static {v4, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1d

    invoke-virtual {p0, v4}, Ltq8;->A(Lhq8;)V

    goto :goto_1d

    :cond_33
    iget-object v2, p0, Lydh;->k:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    iget v5, p0, Lydh;->i:I

    iget v6, p0, Lydh;->h:I

    mul-int/2addr v5, v6

    iget-boolean v7, p0, Lydh;->m:Z

    sub-int/2addr v5, v7

    if-le v4, v5, :cond_45

    const/4 v4, 0x1

    goto :goto_46

    :cond_45
    move v4, v3

    :goto_46
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    iget v7, p0, Lydh;->i:I

    mul-int/2addr v7, v6

    iget-boolean v6, p0, Lydh;->m:Z

    sub-int/2addr v7, v6

    sub-int/2addr v7, v4

    if-le v5, v7, :cond_54

    move v5, v7

    :cond_54
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v5

    move v6, v3

    :goto_5a
    if-ge v6, v5, :cond_68

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lhq8;

    invoke-virtual {p0, v6, v7}, Ltq8;->s(ILhq8;)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_5a

    :cond_68
    invoke-static {v4, v2}, Lkotlin/collections/CollectionsKt;->f0(ILjava/util/List;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_72
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v5, v3, 0x1

    if-ltz v3, :cond_87

    check-cast v4, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    invoke-virtual {v0, v3, v4}, Ltq8;->s(ILhq8;)V

    move v3, v5

    goto :goto_72

    :cond_87
    invoke-static {}, Lj95;->n()V

    const/4 p0, 0x0

    throw p0

    :cond_8c
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_9a

    iget-object v2, v0, Lhq8;->b:Ltq8;

    if-eqz v2, :cond_9a

    invoke-virtual {p0, v0}, Ltq8;->A(Lhq8;)V

    return-void

    :cond_9a
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_ad

    iget-object v1, v0, Lhq8;->b:Ltq8;

    if-nez v1, :cond_ad

    iget-object v1, p0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p0, v1, v0}, Ltq8;->s(ILhq8;)V

    :cond_ad
    return-void
.end method

.method public final E(Ljava/util/List;)V
    .registers 6

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_11
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    new-instance v2, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    iget-object v1, v1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iget-object v3, p0, Lydh;->j:Lghf;

    invoke-direct {v2, v1, v3}, Lcom/opera/android/favorites/PushedSpeedDialFavorite;-><init>(Ltqi;Lghf;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_2a
    iget-object p1, p0, Lydh;->k:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_33

    return-void

    :cond_33
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Lydh;->D()V

    return-void
.end method

.method public final c()Ljava/lang/String;
    .registers 1

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public final e()J
    .registers 3

    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public final g()Ljava/lang/String;
    .registers 1

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public final h()Ljava/lang/String;
    .registers 1

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public final i(Lp6l;)Ljava/lang/String;
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public final q(Ljava/lang/String;)V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public final z()Ljava/util/Date;
    .registers 1

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method
