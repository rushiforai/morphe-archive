.class abstract Lnicoid/network238/kotlin/text/CharsKt__CharKt;
.super Lnicoid/network238/kotlin/text/CharsKt__CharJVMKt;
.source "SourceFile"


# direct methods
.method public static final equals(CCZ)Z
    .registers 3

    if-eq p0, p1, :cond_1

    if-eqz p2, :cond_0

    .line 237
    invoke-static {p0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result p0

    .line 238
    invoke-static {p1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result p1

    if-eq p0, p1, :cond_1

    .line 240
    invoke-static {p0}, Ljava/lang/Character;->toLowerCase(C)C

    move-result p0

    invoke-static {p1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result p1

    if-eq p0, p1, :cond_1

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public static isSurrogate(C)Z
    .registers 2

    const v0, 0xd800

    if-gt v0, p0, :cond_0

    const v0, 0xe000

    if-ge p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
