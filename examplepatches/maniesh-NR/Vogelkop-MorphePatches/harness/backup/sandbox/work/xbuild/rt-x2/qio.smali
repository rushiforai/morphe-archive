.class public abstract Lqio;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public final a(Lg94;)Lqio;
    .registers 3

    instance-of v0, p0, Llio;

    if-nez v0, :cond_c

    move-object v0, p0

    check-cast v0, Lmio;

    iget-object v0, v0, Lmio;->a:Ljava/lang/Object;

    invoke-interface {p1, v0}, Lg94;->l(Ljava/lang/Object;)V

    :cond_c
    return-object p0
.end method
