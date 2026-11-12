.class public final Lqt6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhgd;
.implements Lj92;


# instance fields
.field public a:Z

.field public b:Z

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# virtual methods
.method public final a()V
    .registers 2

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0}, Lqt6;->j(Ljava/util/List;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lqt6;->b:Z

    return-void
.end method

.method public final b()Ljava/util/Collection;
    .registers 1

    iget-object p0, p0, Lqt6;->f:Ljava/lang/Object;

    check-cast p0, Ll0n;

    iget-object p0, p0, Ll0n;->c:Lj92;

    invoke-interface {p0}, Lj92;->b()Ljava/util/Collection;

    move-result-object p0

    return-object p0
.end method

.method public final c(Lthg;)V
    .registers 3

    iget-object v0, p0, Lqt6;->f:Ljava/lang/Object;

    check-cast v0, Lhgd;

    if-eqz v0, :cond_11

    invoke-interface {v0, p1}, Lhgd;->c(Lthg;)V

    iget-object p1, p0, Lqt6;->f:Ljava/lang/Object;

    check-cast p1, Lhgd;

    invoke-interface {p1}, Lhgd;->getPlaybackParameters()Lthg;

    move-result-object p1

    :cond_11
    iget-object p0, p0, Lqt6;->c:Ljava/lang/Object;

    check-cast p0, Le3k;

    invoke-virtual {p0, p1}, Le3k;->c(Lthg;)V

    return-void
.end method

.method public final d(Ljava/util/ArrayList;)V
    .registers 4

    iget-object v0, p0, Lqt6;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    iput-boolean v1, p0, Lqt6;->a:Z

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    iget-object p0, p0, Lqt6;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, v1, p1}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    return-void
.end method

.method public final e()Z
    .registers 2

    iget-boolean v0, p0, Lqt6;->a:Z

    if-eqz v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    iget-object p0, p0, Lqt6;->f:Ljava/lang/Object;

    check-cast p0, Lhgd;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p0}, Lhgd;->e()Z

    move-result p0

    return p0
.end method

.method public final f()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lqt6;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final g(Ljava/util/ArrayList;)V
    .registers 4

    iget-object v0, p0, Lqt6;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    iput-boolean v1, p0, Lqt6;->a:Z

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object p0, p0, Lqt6;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public final getPlaybackParameters()Lthg;
    .registers 2

    iget-object v0, p0, Lqt6;->f:Ljava/lang/Object;

    check-cast v0, Lhgd;

    if-eqz v0, :cond_b

    invoke-interface {v0}, Lhgd;->getPlaybackParameters()Lthg;

    move-result-object p0

    return-object p0

    :cond_b
    iget-object p0, p0, Lqt6;->c:Ljava/lang/Object;

    check-cast p0, Le3k;

    iget-object p0, p0, Le3k;->d:Lthg;

    return-object p0
.end method

.method public final getPositionUs()J
    .registers 3

    iget-boolean v0, p0, Lqt6;->a:Z

    if-eqz v0, :cond_d

    iget-object p0, p0, Lqt6;->c:Ljava/lang/Object;

    check-cast p0, Le3k;

    invoke-virtual {p0}, Le3k;->getPositionUs()J

    move-result-wide v0

    return-wide v0

    :cond_d
    iget-object p0, p0, Lqt6;->f:Ljava/lang/Object;

    check-cast p0, Lhgd;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p0}, Lhgd;->getPositionUs()J

    move-result-wide v0

    return-wide v0
.end method

.method public final h()Z
    .registers 1

    iget-object p0, p0, Lqt6;->f:Ljava/lang/Object;

    check-cast p0, Ll0n;

    iget-object p0, p0, Ll0n;->c:Lj92;

    invoke-interface {p0}, Lj92;->h()Z

    move-result p0

    return p0
.end method

.method public final i(Z)V
    .registers 6

    iget-object v0, p0, Lqt6;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lqt6;->f:Ljava/lang/Object;

    check-cast v1, Ll0n;

    iget-object v2, v1, Ll0n;->e:Lvz5;

    iput-object v2, v1, Ll0n;->d:Lvz5;

    if-nez v2, :cond_f

    return-void

    :cond_f
    iget-object v3, v1, Ll0n;->c:Lj92;

    iput-object v3, v2, Lvz5;->i:Ljava/lang/Object;

    const/4 v2, 0x0

    iput-object v2, v1, Ll0n;->e:Lvz5;

    iget-boolean v2, p0, Lqt6;->b:Z

    if-eqz v2, :cond_1d

    invoke-interface {v3}, Lj92;->a()V

    :cond_1d
    iget-boolean v2, p0, Lqt6;->a:Z

    if-eqz v2, :cond_31

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2b

    iget-boolean p0, p0, Lqt6;->b:Z

    if-nez p0, :cond_43

    :cond_2b
    iget-object p0, v1, Ll0n;->c:Lj92;

    invoke-interface {p0, v0}, Lj92;->j(Ljava/util/List;)V

    goto :goto_43

    :cond_31
    iget-object v0, v1, Ll0n;->c:Lj92;

    iget-object v2, p0, Lqt6;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-interface {v0, v2}, Lj92;->d(Ljava/util/ArrayList;)V

    iget-object v0, v1, Ll0n;->c:Lj92;

    iget-object p0, p0, Lqt6;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-interface {v0, p0}, Lj92;->g(Ljava/util/ArrayList;)V

    :cond_43
    :goto_43
    iget-object p0, v1, Ll0n;->c:Lj92;

    invoke-interface {p0, p1}, Lj92;->i(Z)V

    return-void
.end method

.method public final j(Ljava/util/List;)V
    .registers 3

    iget-object v0, p0, Lqt6;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Lqt6;->d:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    iget-object p1, p0, Lqt6;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lqt6;->a:Z

    return-void
.end method

.method public final k()Z
    .registers 2

    iget-boolean v0, p0, Lqt6;->b:Z

    if-nez v0, :cond_a

    iget-boolean p0, p0, Lqt6;->a:Z

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    const/4 p0, 0x1

    return p0
.end method

.method public final l(Lq83;)V
    .registers 4

    invoke-virtual {p1}, Lq83;->j()Lhgd;

    move-result-object v0

    if-eqz v0, :cond_2c

    iget-object v1, p0, Lqt6;->f:Ljava/lang/Object;

    check-cast v1, Lhgd;

    if-eq v0, v1, :cond_2c

    if-nez v1, :cond_1e

    iput-object v0, p0, Lqt6;->f:Ljava/lang/Object;

    iput-object p1, p0, Lqt6;->e:Ljava/lang/Object;

    iget-object p0, p0, Lqt6;->c:Ljava/lang/Object;

    check-cast p0, Le3k;

    iget-object p0, p0, Le3k;->d:Lthg;

    check-cast v0, Lkgd;

    invoke-virtual {v0, p0}, Lkgd;->c(Lthg;)V

    return-void

    :cond_1e
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Multiple renderer media clocks enabled."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    const/16 p1, 0x3e8

    invoke-static {p1, p0}, Lzh8;->h(ILjava/lang/RuntimeException;)Lzh8;

    move-result-object p0

    throw p0

    :cond_2c
    return-void
.end method

.method public final m()V
    .registers 5

    iget-object v0, p0, Lqt6;->e:Ljava/lang/Object;

    check-cast v0, Ljrk;

    iget-object v1, p0, Lqt6;->f:Ljava/lang/Object;

    check-cast v1, Lmrk;

    iget-boolean v2, v1, Lmrk;->w:Z

    if-nez v2, :cond_26

    iget-object v3, v1, Lmrk;->G:Lrv7;

    iget-object v3, v3, Lrv7;->n:Lyv7;

    iget-object v3, v3, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    iget-object v3, v3, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-eqz v3, :cond_23

    iget v3, v3, Lywj;->j:I

    if-lez v3, :cond_23

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    const-wide/16 v1, 0x64

    invoke-static {v0, v1, v2}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void

    :cond_23
    const/4 v0, 0x1

    if-ne v2, v0, :cond_27

    :cond_26
    return-void

    :cond_27
    iput-boolean v0, v1, Lmrk;->w:Z

    iget-object p0, p0, Lqt6;->c:Ljava/lang/Object;

    check-cast p0, Lbrk;

    invoke-virtual {p0}, Lbrk;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final onFailure()V
    .registers 2

    iget-object p0, p0, Lqt6;->f:Ljava/lang/Object;

    check-cast p0, Ll0n;

    const/4 v0, 0x0

    iput-object v0, p0, Ll0n;->e:Lvz5;

    iget-object v0, p0, Ll0n;->d:Lvz5;

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Lvz5;->a()V

    :cond_e
    iget-object p0, p0, Ll0n;->c:Lj92;

    invoke-interface {p0}, Lj92;->onFailure()V

    return-void
.end method
