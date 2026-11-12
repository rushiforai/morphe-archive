.class public final Lfuc;
.super Lgv9$a;
.source "SourceFile"

# interfaces
.implements Lsvd;


# virtual methods
.method public final b(Ljava/lang/String;Louc;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lgv9$a;->copyOnWrite()V

    iget-object p0, p0, Lgv9$a;->instance:Lgv9;

    check-cast p0, Liuc;

    invoke-virtual {p0}, Liuc;->l()Lfad;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
