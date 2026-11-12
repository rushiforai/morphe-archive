.class public abstract Lhkg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public a:Lgig;

.field public b:Leig;


# virtual methods
.method public a(Lxbf;)V
    .registers 3

    iget-object v0, p1, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgig;

    iput-object v0, p0, Lhkg;->a:Lgig;

    iget-object p1, p1, Lxbf;->c:Ljava/lang/Object;

    check-cast p1, Lode;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    iget-object p1, p0, Lhkg;->b:Leig;

    if-eqz p1, :cond_1c

    iget-object p0, p0, Lhkg;->a:Lgig;

    invoke-interface {p0, p1}, Lgig;->S(Leig;)V

    :cond_1c
    return-void
.end method

.method public b(Lxbf;)V
    .registers 3

    iget-object p1, p1, Lxbf;->c:Ljava/lang/Object;

    check-cast p1, Lode;

    invoke-virtual {p1, p0}, Lekc;->p(Lf7f;)V

    iget-object p1, p0, Lhkg;->b:Leig;

    if-eqz p1, :cond_10

    iget-object v0, p0, Lhkg;->a:Lgig;

    invoke-interface {v0, p1}, Lgig;->g0(Leig;)V

    :cond_10
    const/4 p1, 0x0

    iput-object p1, p0, Lhkg;->a:Lgig;

    return-void
.end method

.method public final c()Lgig;
    .registers 1

    iget-object p0, p0, Lhkg;->a:Lgig;

    if-eqz p0, :cond_5

    return-object p0

    :cond_5
    invoke-static {}, Lh9o;->e()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public abstract d(Lgig;)V
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Lgig;

    iget-object v0, p0, Lhkg;->a:Lgig;

    if-ne v0, p1, :cond_7

    return-void

    :cond_7
    iget-object v1, p0, Lhkg;->b:Leig;

    if-eqz v1, :cond_e

    invoke-interface {v0, v1}, Lgig;->g0(Leig;)V

    :cond_e
    iput-object p1, p0, Lhkg;->a:Lgig;

    iget-object v0, p0, Lhkg;->b:Leig;

    if-eqz v0, :cond_17

    invoke-interface {p1, v0}, Lgig;->S(Leig;)V

    :cond_17
    iget-object p1, p0, Lhkg;->a:Lgig;

    invoke-virtual {p0, p1}, Lhkg;->d(Lgig;)V

    return-void
.end method
