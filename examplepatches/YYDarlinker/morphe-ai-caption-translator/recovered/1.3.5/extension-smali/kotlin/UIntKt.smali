.class public final Lkotlin/UIntKt;
.super Ljava/lang/Object;
.source "UInt.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0005\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\n\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0006\n\u0002\u0008\u0002\u001a)\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007b\u0002\u0008\u0008\u00a2\u0006\u0002\u0010\u0003\u001a)\u0010\u0000\u001a\u00020\u0001*\u00020\tH\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007b\u0002\u0008\u0008\u00a2\u0006\u0002\u0010\n\u001a)\u0010\u0000\u001a\u00020\u0001*\u00020\u000bH\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007b\u0002\u0008\u0008\u00a2\u0006\u0002\u0010\u000c\u001a)\u0010\u0000\u001a\u00020\u0001*\u00020\rH\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007b\u0002\u0008\u0008\u00a2\u0006\u0002\u0010\u000e\u001a)\u0010\u0000\u001a\u00020\u0001*\u00020\u000fH\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007b\u0002\u0008\u0008\u00a2\u0006\u0002\u0010\u0010\u001a)\u0010\u0000\u001a\u00020\u0001*\u00020\u0011H\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007b\u0002\u0008\u0008\u00a2\u0006\u0002\u0010\u0012\u00a8\u0006\u0013"
    }
    d2 = {
        "toUInt",
        "Lkotlin/UInt;",
        "",
        "(B)I",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.5",
        "Lkotlin/internal/InlineOnly;",
        "Lkotlin/internal/IntrinsicConstEvaluation;",
        "",
        "(S)I",
        "",
        "(I)I",
        "",
        "(J)I",
        "",
        "(F)I",
        "",
        "(D)I",
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
.method private static final toUInt(B)I
    .registers 1

    .line 439
    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final toUInt(D)I
    .registers 2

    .line 495
    invoke-static {p0, p1}, Lkotlin/UnsignedKt;->doubleToUInt(D)I

    move-result p0

    return p0
.end method

.method private static final toUInt(F)I
    .registers 3

    float-to-double v0, p0

    .line 485
    invoke-static {v0, v1}, Lkotlin/UnsignedKt;->doubleToUInt(D)I

    move-result p0

    return p0
.end method

.method private static final toUInt(I)I
    .registers 1

    .line 462
    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final toUInt(J)I
    .registers 2

    long-to-int p0, p0

    .line 474
    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method

.method private static final toUInt(S)I
    .registers 1

    .line 451
    invoke-static {p0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result p0

    return p0
.end method
