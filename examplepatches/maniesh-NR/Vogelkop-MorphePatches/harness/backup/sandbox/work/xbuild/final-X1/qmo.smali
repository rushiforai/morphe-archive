.class public final Lqmo;
.super Lkqo;
.source "SourceFile"


# virtual methods
.method public final a(I)Z
    .registers 2

    const/16 p0, 0xc8

    if-gt p0, p1, :cond_a

    const/16 p0, 0x12b

    if-gt p1, p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method
