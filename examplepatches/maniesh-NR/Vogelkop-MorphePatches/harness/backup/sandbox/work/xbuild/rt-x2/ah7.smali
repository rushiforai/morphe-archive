.class public final Lah7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lati;
.implements Lqf7;


# instance fields
.field public final a:Lrf7;

.field public final b:Lvx;

.field public final c:Lode;

.field public final d:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lrf7;Lvx;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lah7;->a:Lrf7;

    iput-object p2, p0, Lah7;->b:Lvx;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Lah7;->c:Lode;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lah7;->d:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lah7;->j()V

    return-void
.end method


# virtual methods
.method public final a(Lre7;)V
    .registers 11

    iget-object v0, p0, Lah7;->d:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_8
    const/4 v4, -0x1

    if-ge v3, v1, :cond_1e

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v3, v3, 0x1

    check-cast v5, Lre7;

    iget-wide v5, v5, Lre7;->o:J

    iget-wide v7, p1, Lre7;->o:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_1f

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_1e
    move v2, v4

    :cond_1f
    if-eq v2, v4, :cond_2d

    invoke-virtual {v0, v2, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Lre7;->q()Z

    move-result p1

    if-eqz p1, :cond_2d

    invoke-virtual {p0}, Lah7;->k()V

    :cond_2d
    return-void
.end method

.method public final b(Lre7;)V
    .registers 2

    return-void
.end method

.method public final c(Lre7;)V
    .registers 3

    invoke-virtual {p1}, Lre7;->q()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lah7;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lah7;->k()V

    return-void
.end method

.method public final d(Lre7;)V
    .registers 3

    iget-object v0, p0, Lah7;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lre7;->q()Z

    move-result p1

    if-eqz p1, :cond_e

    invoke-virtual {p0}, Lah7;->k()V

    :cond_e
    return-void
.end method

.method public final e(Lre7;)V
    .registers 2

    return-void
.end method

.method public final f(Lre7;)V
    .registers 3

    invoke-virtual {p1}, Lre7;->q()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lah7;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lah7;->k()V

    return-void
.end method

.method public final g(Lesi;)V
    .registers 2

    return-void
.end method

.method public final h(Lre7;)V
    .registers 3

    iget-object v0, p0, Lah7;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lre7;->q()Z

    move-result p1

    if-eqz p1, :cond_e

    invoke-virtual {p0}, Lah7;->k()V

    :cond_e
    return-void
.end method

.method public final i()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final j()V
    .registers 6

    iget-object v0, p0, Lah7;->d:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lah7;->a:Lrf7;

    iget-object v1, v1, Lrf7;->c:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_18
    :goto_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lre7;

    invoke-virtual {v4}, Lre7;->q()Z

    move-result v4

    if-eqz v4, :cond_18

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_18

    :cond_2f
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Lah7;->k()V

    return-void
.end method

.method public final k()V
    .registers 2

    iget-object v0, p0, Lah7;->c:Lode;

    iget-object p0, p0, Lah7;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Lekc;->n(Ljava/lang/Object;)V

    return-void
.end method

.method public final l()V
    .registers 1

    invoke-virtual {p0}, Lah7;->j()V

    return-void
.end method

.method public final m()Lekc;
    .registers 1

    iget-object p0, p0, Lah7;->c:Lode;

    return-object p0
.end method

.method public final remove(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lre7;

    iget-object p0, p0, Lah7;->a:Lrf7;

    invoke-virtual {p0, p1}, Lrf7;->s(Lre7;)V

    return-void
.end method
