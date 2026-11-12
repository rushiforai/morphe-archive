.class public final Ltyo;
.super Lejo;
.source "SourceFile"


# virtual methods
.method public final d(Lqio;)V
    .registers 4

    instance-of v0, p1, Llio;

    if-nez v0, :cond_13

    check-cast p1, Lmio;

    iget-object p1, p1, Lmio;->a:Ljava/lang/Object;

    sget-object v0, Lgxo;->c:Lgxo;

    new-instance v1, Lttn;

    invoke-direct {v1, p0, p1}, Lttn;-><init>(Ltyo;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lgxo;->b(Ljava/lang/Runnable;)V

    return-void

    :cond_13
    check-cast p1, Llio;

    iget-object p0, p1, Llio;->a:Ljava/lang/Exception;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    return-void
.end method
