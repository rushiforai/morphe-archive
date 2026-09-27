.class public final Lkotlin/math/UMathKt;
.super Ljava/lang/Object;
.source "UMath.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u001a3\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u0001H\u0087\u0088\u0004b\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008b\u0002\u0008\t\u00a2\u0006\u0004\u0008\u0004\u0010\u0005\u001a3\u0010\u0000\u001a\u00020\n2\u0006\u0010\u0002\u001a\u00020\n2\u0006\u0010\u0003\u001a\u00020\nH\u0087\u0088\u0004b\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008b\u0002\u0008\t\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u001a3\u0010\r\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u0001H\u0087\u0088\u0004b\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008b\u0002\u0008\t\u00a2\u0006\u0004\u0008\u000e\u0010\u0005\u001a3\u0010\r\u001a\u00020\n2\u0006\u0010\u0002\u001a\u00020\n2\u0006\u0010\u0003\u001a\u00020\nH\u0087\u0088\u0004b\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008b\u0002\u0008\t\u00a2\u0006\u0004\u0008\u000f\u0010\u000c\u00a8\u0006\u0010"
    }
    d2 = {
        "min",
        "Lkotlin/UInt;",
        "a",
        "b",
        "min-J1ME1BU",
        "(II)I",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.5",
        "Lkotlin/internal/InlineOnly;",
        "Lkotlin/ULong;",
        "min-eb3DHEI",
        "(JJ)J",
        "max",
        "max-J1ME1BU",
        "max-eb3DHEI",
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
.method private static final max-J1ME1BU(II)I
    .registers 2

    .line 32
    invoke-static {p0, p1}, Lkotlin/comparisons/UComparisonsKt;->maxOf-J1ME1BU(II)I

    move-result p0

    return p0
.end method

.method private static final max-eb3DHEI(JJ)J
    .registers 4

    .line 41
    invoke-static {p0, p1, p2, p3}, Lkotlin/comparisons/UComparisonsKt;->maxOf-eb3DHEI(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final min-J1ME1BU(II)I
    .registers 2

    .line 14
    invoke-static {p0, p1}, Lkotlin/comparisons/UComparisonsKt;->minOf-J1ME1BU(II)I

    move-result p0

    return p0
.end method

.method private static final min-eb3DHEI(JJ)J
    .registers 4

    .line 23
    invoke-static {p0, p1, p2, p3}, Lkotlin/comparisons/UComparisonsKt;->minOf-eb3DHEI(JJ)J

    move-result-wide p0

    return-wide p0
.end method
