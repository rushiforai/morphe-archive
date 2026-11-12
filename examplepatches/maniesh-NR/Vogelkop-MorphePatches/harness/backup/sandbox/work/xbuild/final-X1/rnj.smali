.class public final Lrnj;
.super Lonj;
.source "SourceFile"


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Lrnj;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    sget-object p0, Lmnj;->a:Lmnj;

    return v0
.end method

.method public final hashCode()I
    .registers 1

    sget-object p0, Lmnj;->a:Lmnj;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
