.class public final Lkotlin/internal/UProgressionUtilKt;
.super Ljava/lang/Object;
.source "UProgressionUtil.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0008\u0002\u001a)\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u0001H\u0082\u0080\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u001a)\u0010\u0000\u001a\u00020\u00072\u0006\u0010\u0002\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u00072\u0006\u0010\u0004\u001a\u00020\u0007H\u0082\u0080\u0004\u00a2\u0006\u0004\u0008\u0008\u0010\t\u001a?\u0010\n\u001a\u00020\u00012\u0006\u0010\u000b\u001a\u00020\u00012\u0006\u0010\u000c\u001a\u00020\u00012\u0006\u0010\r\u001a\u00020\u000eH\u0081\u0080\u0004b\u0002\u0008\u0010b\u000c\u0008\u0011\u0012\u0008\u0008\u0012\u0012\u0004\u0008\u0008(\u0013b\u0002\u0008\u0014\u00a2\u0006\u0004\u0008\u000f\u0010\u0006\u001a?\u0010\n\u001a\u00020\u00072\u0006\u0010\u000b\u001a\u00020\u00072\u0006\u0010\u000c\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0015H\u0081\u0080\u0004b\u0002\u0008\u0010b\u000c\u0008\u0011\u0012\u0008\u0008\u0012\u0012\u0004\u0008\u0008(\u0013b\u0002\u0008\u0014\u00a2\u0006\u0004\u0008\u0016\u0010\t\u00a8\u0006\u0017"
    }
    d2 = {
        "differenceModulo",
        "Lkotlin/UInt;",
        "a",
        "b",
        "c",
        "differenceModulo-WZ9TVnA",
        "(III)I",
        "Lkotlin/ULong;",
        "differenceModulo-sambcqE",
        "(JJJ)J",
        "getProgressionLastElement",
        "start",
        "end",
        "step",
        "",
        "getProgressionLastElement-Nkh28Cs",
        "Lkotlin/PublishedApi;",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.3",
        "Lkotlin/internal/UsedFromCompilerGeneratedCode;",
        "",
        "getProgressionLastElement-7ftBX0g",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private static final differenceModulo-WZ9TVnA(III)I
    .registers 4

    .line 10
    invoke-static {p0, p2}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$1(II)I

    move-result p0

    .line 11
    invoke-static {p1, p2}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$1(II)I

    move-result p1

    .line 12
    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$2(II)I

    move-result v0

    sub-int/2addr p0, p1

    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    if-ltz v0, :cond_14

    return p0

    :cond_14
    add-int/2addr p0, p2

    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final differenceModulo-sambcqE(JJJ)J
    .registers 7

    .line 16
    invoke-static {p0, p1, p4, p5}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$1(JJ)J

    move-result-wide p0

    .line 17
    invoke-static {p2, p3, p4, p5}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$1(JJ)J

    move-result-wide p2

    .line 18
    invoke-static {p0, p1, p2, p3}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)I

    move-result v0

    sub-long/2addr p0, p2

    invoke-static {p0, p1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide p0

    if-ltz v0, :cond_14

    return-wide p0

    :cond_14
    add-long/2addr p0, p4

    invoke-static {p0, p1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final getProgressionLastElement-7ftBX0g(JJJ)J
    .registers 14

    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-lez v0, :cond_20

    .line 66
    invoke-static {p0, p1, p2, p3}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)I

    move-result v0

    if-ltz v0, :cond_e

    move-wide p0, p2

    goto :goto_2b

    :cond_e
    invoke-static {p4, p5}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide p4

    move-wide v6, p2

    move-wide p2, p0

    move-wide p0, v6

    invoke-static/range {p0 .. p5}, Lkotlin/internal/UProgressionUtilKt;->differenceModulo-sambcqE(JJJ)J

    move-result-wide p2

    sub-long p2, p0, p2

    invoke-static {p2, p3}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide p0

    return-wide p0

    :cond_20
    move-wide v6, p2

    move-wide p2, p0

    move-wide p0, v6

    if-gez v0, :cond_3e

    .line 67
    invoke-static {p2, p3, p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)I

    move-result v0

    if-gtz v0, :cond_2c

    :goto_2b
    return-wide p0

    :cond_2c
    neg-long p4, p4

    invoke-static {p4, p5}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v4

    move-wide v2, p0

    move-wide v0, p2

    invoke-static/range {v0 .. v5}, Lkotlin/internal/UProgressionUtilKt;->differenceModulo-sambcqE(JJJ)J

    move-result-wide p0

    add-long p2, v2, p0

    invoke-static {p2, p3}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide p0

    return-wide p0

    .line 68
    :cond_3e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Step is zero."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final getProgressionLastElement-Nkh28Cs(III)I
    .registers 4

    if-lez p2, :cond_17

    .line 41
    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$2(II)I

    move-result v0

    if-ltz v0, :cond_9

    goto :goto_1f

    :cond_9
    invoke-static {p2}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p2

    invoke-static {p1, p0, p2}, Lkotlin/internal/UProgressionUtilKt;->differenceModulo-WZ9TVnA(III)I

    move-result p0

    sub-int/2addr p1, p0

    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0

    :cond_17
    if-gez p2, :cond_2f

    .line 42
    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$2(II)I

    move-result v0

    if-gtz v0, :cond_20

    :goto_1f
    return p1

    :cond_20
    neg-int p2, p2

    invoke-static {p2}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p2

    invoke-static {p0, p1, p2}, Lkotlin/internal/UProgressionUtilKt;->differenceModulo-WZ9TVnA(III)I

    move-result p0

    add-int/2addr p1, p0

    invoke-static {p1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0

    .line 43
    :cond_2f
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Step is zero."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
