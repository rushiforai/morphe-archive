.class Lkotlin/NumbersKt__NumbersKt;
.super Lkotlin/NumbersKt__NumbersJVMKt;
.source "Numbers.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0000\n\u0002\u0010\u0008\n\u0002\u0010\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\n\n\u0000\u001a \u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0087\u0088\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a \u0010\u0007\u001a\u00020\u0001*\u00020\u0002H\u0087\u0088\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a \u0010\u0008\u001a\u00020\u0001*\u00020\u0002H\u0087\u0088\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a \u0010\t\u001a\u00020\u0002*\u00020\u0002H\u0087\u0088\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a \u0010\n\u001a\u00020\u0002*\u00020\u0002H\u0087\u0088\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a$\u0010\u000b\u001a\u00020\u0002*\u00020\u00022\u0006\u0010\u000c\u001a\u00020\u0001H\u0087\u0080\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\r\u001a$\u0010\u000e\u001a\u00020\u0002*\u00020\u00022\u0006\u0010\u000c\u001a\u00020\u0001H\u0087\u0080\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\r\u001a \u0010\u0000\u001a\u00020\u0001*\u00020\u000fH\u0087\u0088\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a \u0010\u0007\u001a\u00020\u0001*\u00020\u000fH\u0087\u0088\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a \u0010\u0008\u001a\u00020\u0001*\u00020\u000fH\u0087\u0088\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a \u0010\t\u001a\u00020\u000f*\u00020\u000fH\u0087\u0088\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a \u0010\n\u001a\u00020\u000f*\u00020\u000fH\u0087\u0088\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a$\u0010\u000b\u001a\u00020\u000f*\u00020\u000f2\u0006\u0010\u000c\u001a\u00020\u0001H\u0087\u0080\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\r\u001a$\u0010\u000e\u001a\u00020\u000f*\u00020\u000f2\u0006\u0010\u000c\u001a\u00020\u0001H\u0087\u0080\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\r\u00a8\u0006\u0010"
    }
    d2 = {
        "countOneBits",
        "",
        "",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.4",
        "Lkotlin/internal/InlineOnly;",
        "countLeadingZeroBits",
        "countTrailingZeroBits",
        "takeHighestOneBit",
        "takeLowestOneBit",
        "rotateLeft",
        "bitCount",
        "1.6",
        "rotateRight",
        "",
        "kotlin-stdlib"
    }
    k = 0x5
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x31
    xs = "kotlin/NumbersKt"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lkotlin/NumbersKt__NumbersJVMKt;-><init>()V

    return-void
.end method

.method private static final countLeadingZeroBits(B)I
    .registers 1

    and-int/lit16 p0, p0, 0xff

    .line 140
    invoke-static {p0}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result p0

    add-int/lit8 p0, p0, -0x18

    return p0
.end method

.method private static final countLeadingZeroBits(S)I
    .registers 2

    const v0, 0xffff

    and-int/2addr p0, v0

    .line 207
    invoke-static {p0}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result p0

    add-int/lit8 p0, p0, -0x10

    return p0
.end method

.method private static final countOneBits(B)I
    .registers 1

    and-int/lit16 p0, p0, 0xff

    .line 133
    invoke-static {p0}, Ljava/lang/Integer;->bitCount(I)I

    move-result p0

    return p0
.end method

.method private static final countOneBits(S)I
    .registers 2

    const v0, 0xffff

    and-int/2addr p0, v0

    .line 199
    invoke-static {p0}, Ljava/lang/Integer;->bitCount(I)I

    move-result p0

    return p0
.end method

.method private static final countTrailingZeroBits(B)I
    .registers 1

    or-int/lit16 p0, p0, 0x100

    .line 147
    invoke-static {p0}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result p0

    return p0
.end method

.method private static final countTrailingZeroBits(S)I
    .registers 2

    const/high16 v0, 0x10000

    or-int/2addr p0, v0

    .line 214
    invoke-static {p0}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result p0

    return p0
.end method

.method public static final rotateLeft(BI)B
    .registers 3

    and-int/lit8 p1, p1, 0x7

    shl-int v0, p0, p1

    and-int/lit16 p0, p0, 0xff

    rsub-int/lit8 p1, p1, 0x8

    ushr-int/2addr p0, p1

    or-int/2addr p0, v0

    int-to-byte p0, p0

    return p0
.end method

.method public static final rotateLeft(SI)S
    .registers 4

    and-int/lit8 p1, p1, 0xf

    shl-int v0, p0, p1

    const v1, 0xffff

    and-int/2addr p0, v1

    rsub-int/lit8 p1, p1, 0x10

    ushr-int/2addr p0, p1

    or-int/2addr p0, v0

    int-to-short p0, p0

    return p0
.end method

.method public static final rotateRight(BI)B
    .registers 3

    and-int/lit8 p1, p1, 0x7

    rsub-int/lit8 v0, p1, 0x8

    shl-int v0, p0, v0

    and-int/lit16 p0, p0, 0xff

    ushr-int/2addr p0, p1

    or-int/2addr p0, v0

    int-to-byte p0, p0

    return p0
.end method

.method public static final rotateRight(SI)S
    .registers 4

    and-int/lit8 p1, p1, 0xf

    rsub-int/lit8 v0, p1, 0x10

    shl-int v0, p0, v0

    const v1, 0xffff

    and-int/2addr p0, v1

    ushr-int/2addr p0, p1

    or-int/2addr p0, v0

    int-to-short p0, p0

    return p0
.end method

.method private static final takeHighestOneBit(B)B
    .registers 1

    and-int/lit16 p0, p0, 0xff

    .line 155
    invoke-static {p0}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result p0

    int-to-byte p0, p0

    return p0
.end method

.method private static final takeHighestOneBit(S)S
    .registers 2

    const v0, 0xffff

    and-int/2addr p0, v0

    .line 222
    invoke-static {p0}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result p0

    int-to-short p0, p0

    return p0
.end method

.method private static final takeLowestOneBit(B)B
    .registers 1

    .line 163
    invoke-static {p0}, Ljava/lang/Integer;->lowestOneBit(I)I

    move-result p0

    int-to-byte p0, p0

    return p0
.end method

.method private static final takeLowestOneBit(S)S
    .registers 1

    .line 230
    invoke-static {p0}, Ljava/lang/Integer;->lowestOneBit(I)I

    move-result p0

    int-to-short p0, p0

    return p0
.end method
