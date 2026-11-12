.class public abstract Lgcp;
.super Lpxo;
.source "SourceFile"


# virtual methods
.method public final b(Lvoo;)V
    .registers 7

    check-cast p1, Lylp;

    new-instance v0, Lagm;

    iget-object v1, p0, Lpxo;->b:Lr22;

    iget-object v1, v1, Lr22;->c:Ljava/lang/Object;

    check-cast v1, Lwjh;

    iget-object v2, p0, Lpxo;->i:Lp7p;

    const/16 v3, 0xb

    iget-object v4, p0, Lpxo;->a:Landroid/content/Context;

    invoke-direct {v0, v4, v1, v2, v3}, Lagm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Ltbp;

    invoke-direct {v1, p0, p1}, Ltbp;-><init>(Lgcp;Lylp;)V

    invoke-virtual {v0, p1, v1}, Lagm;->g(Lylp;Ln1p;)V

    return-void
.end method
