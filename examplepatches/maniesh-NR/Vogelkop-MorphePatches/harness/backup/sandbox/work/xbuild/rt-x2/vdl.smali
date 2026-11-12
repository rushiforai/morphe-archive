.class public final Lvdl;
.super Lgv9$a;
.source "SourceFile"

# interfaces
.implements Lsvd;


# virtual methods
.method public final b(D)V
    .registers 3

    invoke-virtual {p0}, Lgv9$a;->copyOnWrite()V

    iget-object p0, p0, Lgv9$a;->instance:Lgv9;

    check-cast p0, Lxdl;

    invoke-virtual {p0, p1, p2}, Lxdl;->e(D)V

    return-void
.end method
