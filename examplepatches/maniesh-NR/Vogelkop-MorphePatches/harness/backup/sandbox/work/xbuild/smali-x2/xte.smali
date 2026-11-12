.class public abstract Lxte;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq8j;


# instance fields
.field public a:Z


# virtual methods
.method public final a()V
    .registers 2

    iget-boolean v0, p0, Lxte;->a:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    iput-boolean v0, p0, Lxte;->a:Z

    invoke-virtual {p0}, Lxte;->d()V

    :cond_a
    return-void
.end method

.method public abstract b(Ljava/lang/Object;)V
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 2

    if-nez p1, :cond_6

    const/4 p1, 0x1

    iput-boolean p1, p0, Lxte;->a:Z

    return-void

    :cond_6
    invoke-virtual {p0, p1}, Lxte;->b(Ljava/lang/Object;)V

    return-void
.end method

.method public abstract d()V
.end method
