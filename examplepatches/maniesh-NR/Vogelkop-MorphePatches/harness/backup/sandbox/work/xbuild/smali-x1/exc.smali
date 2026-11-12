.class public final Lexc;
.super Lgv9$a;
.source "SourceFile"

# interfaces
.implements Lsvd;


# virtual methods
.method public final b(Ljava/lang/String;)V
    .registers 2

    invoke-virtual {p0}, Lgv9$a;->copyOnWrite()V

    iget-object p0, p0, Lgv9$a;->instance:Lgv9;

    check-cast p0, Lfxc;

    invoke-virtual {p0, p1}, Lfxc;->f(Ljava/lang/String;)V

    return-void
.end method

.method public final c(Ljava/lang/String;)V
    .registers 2

    invoke-virtual {p0}, Lgv9$a;->copyOnWrite()V

    iget-object p0, p0, Lgv9$a;->instance:Lgv9;

    check-cast p0, Lfxc;

    invoke-virtual {p0, p1}, Lfxc;->g(Ljava/lang/String;)V

    return-void
.end method
