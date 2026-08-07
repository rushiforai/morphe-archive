.class public Ll/qj90;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z
    .locals 2

    const/4 v0, 0x1

    return v0

    .line 1
    sget-object v0, Ll/qj90$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_3

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    if-eq p0, v1, :cond_2

    .line 14
    .line 15
    const/4 v1, 0x3

    .line 16
    if-eq p0, v1, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x4

    .line 19
    if-eq p0, v1, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_0
    invoke-static {}, Ll/joa;->j4()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    :goto_0
    xor-int/2addr p0, v0

    .line 28
    return p0

    .line 29
    :cond_1
    invoke-static {}, Ll/joa;->e4()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    goto :goto_0

    .line 34
    :cond_2
    invoke-static {}, Ll/joa;->X3()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    goto :goto_0

    .line 39
    :cond_3
    invoke-static {}, Ll/joa;->m4()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    goto :goto_0
.end method

.method public static b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z
    .locals 2

    const/4 v0, 0x1

    return v0

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-static {v0, p0}, Ll/qj90;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public static c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z
    .locals 0

    const/4 p0, 0x1

    return p0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ROAMING_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    if-ne p1, p0, :cond_1

    .line 12
    .line 13
    invoke-static {p1}, Ll/qj90;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_1
    const/4 p0, 0x0

    .line 19
    return p0
.end method
