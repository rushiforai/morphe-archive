.class public final Lqyf;
.super Lk8;
.source "SourceFile"


# virtual methods
.method public final s0(Lxo7;)Ldz;
    .registers 4

    invoke-virtual {p0}, Lk8;->a0()Z

    move-result v0

    if-nez v0, :cond_c

    new-instance p0, Li0f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :cond_c
    iget-object p0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    const-class v0, Lxo7;

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v1, "createAdsProvider"

    invoke-static {p0, v1, v0, p1}, Lmzg;->k(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldz;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method
