.class public final Lxz1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyz1;


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 2

    if-eq p0, p1, :cond_8

    instance-of p0, p1, Lxz1;

    if-nez p0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
