.class public interface abstract Ll/v7i;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract b(Ll/dj70;)Z
.end method

.method public abstract c(Ll/dj70;)V
.end method

.method public abstract d(Ll/dj70;)V
.end method

.method public e()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract f()V
.end method

.method public abstract g(Ll/dj70;)V
.end method

.method public abstract h()V
.end method

.method public i(Ll/dj70;)V
    .locals 1

    .line 1
    invoke-interface {p0, p1}, Ll/v7i;->g(Ll/dj70;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p0, p1}, Ll/v7i;->b(Ll/dj70;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/v7i;->d(Ll/dj70;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-interface {p0, p1}, Ll/v7i;->c(Ll/dj70;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p0, p1}, Ll/v7i;->k(Ll/dj70;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p0}, Ll/v7i;->h()V

    .line 21
    .line 22
    .line 23
    invoke-interface {p0}, Ll/v7i;->j()V

    .line 24
    .line 25
    .line 26
    invoke-interface {p0}, Ll/v7i;->f()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public abstract j()V
.end method

.method public k(Ll/dj70;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/dj70;->m:Ll/s6i;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/s6i;->c()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object p1, p1, Ll/dj70;->m:Ll/s6i;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/s6i;->e()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-void

    .line 21
    :cond_1
    :goto_0
    invoke-interface {p0}, Ll/v7i;->e()V

    .line 22
    .line 23
    .line 24
    return-void
.end method
