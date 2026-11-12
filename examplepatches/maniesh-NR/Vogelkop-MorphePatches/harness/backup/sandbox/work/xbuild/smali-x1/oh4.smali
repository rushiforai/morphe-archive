.class public abstract Loh4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq8j;


# instance fields
.field public volatile a:Z


# virtual methods
.method public final a()V
    .registers 2

    iget-boolean v0, p0, Loh4;->a:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Loh4;->b()V

    return-void
.end method

.method public b()V
    .registers 1

    invoke-virtual {p0}, Loh4;->e()V

    return-void
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 3

    iget-boolean v0, p0, Loh4;->a:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0, p1}, Loh4;->d(Ljava/lang/Object;)V

    return-void
.end method

.method public abstract d(Ljava/lang/Object;)V
.end method

.method public abstract e()V
.end method
