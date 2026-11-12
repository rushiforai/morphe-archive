.class public final Ldqk;
.super Lgqk;
.source "SourceFile"


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_22

    const-class v2, Ldqk;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    check-cast p1, Ldqk;

    iget v2, p0, Lgqk;->a:I

    iget v3, p1, Lgqk;->a:I

    if-ne v2, v3, :cond_22

    iget-object p0, p0, Lgqk;->b:Lxpk;

    iget-object p1, p1, Lgqk;->b:Lxpk;

    if-ne p0, p1, :cond_22

    return v0

    :cond_22
    return v1
.end method

.method public final hashCode()I
    .registers 2

    iget v0, p0, Lgqk;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object p0, p0, Lgqk;->b:Lxpk;

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
