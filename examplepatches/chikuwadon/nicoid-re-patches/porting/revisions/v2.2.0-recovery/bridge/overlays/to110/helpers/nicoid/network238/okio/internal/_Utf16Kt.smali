.class public final Lnicoid/network238/okio/internal/_Utf16Kt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0010\u0008\n\u0002\u0008\u0007\u001a\u0018\u0010\u0006\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u00022\u0006\u0010\u0008\u001a\u00020\u0002H\u0000\"\u0019\u0010\u0000\u001a\u00020\u0001*\u00020\u00028\u00c0\u0002X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0000\u0010\u0003\"\u0019\u0010\u0004\u001a\u00020\u0001*\u00020\u00028\u00c0\u0002X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0003\"\u0019\u0010\u0005\u001a\u00020\u0001*\u00020\u00028\u00c0\u0002X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0005\u0010\u0003\u00a8\u0006\t"
    }
    d2 = {
        "isSurrogate",
        "",
        "",
        "(I)Z",
        "isHighSurrogate",
        "isLowSurrogate",
        "combineSurrogates",
        "high",
        "low",
        "okio"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final combineSurrogates(II)I
    .registers 2

    and-int/lit16 p0, p0, 0x3ff

    shl-int/lit8 p0, p0, 0xa

    and-int/lit16 p1, p1, 0x3ff

    or-int/2addr p0, p1

    const/high16 p1, 0x10000

    add-int/2addr p0, p1

    return p0
.end method

.method public static final isHighSurrogate(I)Z
    .registers 4
    .param p0, "$this$isHighSurrogate"    # I

    const/4 v0, 0x0

    .line 29
    .local v0, "$i$f$isHighSurrogate":I
    const v1, 0xd800

    const/4 v2, 0x0

    if-gt v1, p0, :cond_0

    const v1, 0xdc00

    if-ge p0, v1, :cond_0

    const/4 v2, 0x1

    :cond_0
    return v2
.end method

.method public static final isLowSurrogate(I)Z
    .registers 4
    .param p0, "$this$isLowSurrogate"    # I

    const/4 v0, 0x0

    .line 32
    .local v0, "$i$f$isLowSurrogate":I
    const v1, 0xdc00

    const/4 v2, 0x0

    if-gt v1, p0, :cond_0

    const v1, 0xe000

    if-ge p0, v1, :cond_0

    const/4 v2, 0x1

    :cond_0
    return v2
.end method

.method public static final isSurrogate(I)Z
    .registers 4
    .param p0, "$this$isSurrogate"    # I

    const/4 v0, 0x0

    .line 26
    .local v0, "$i$f$isSurrogate":I
    const v1, 0xd800

    const/4 v2, 0x0

    if-gt v1, p0, :cond_0

    const v1, 0xe000

    if-ge p0, v1, :cond_0

    const/4 v2, 0x1

    :cond_0
    return v2
.end method
