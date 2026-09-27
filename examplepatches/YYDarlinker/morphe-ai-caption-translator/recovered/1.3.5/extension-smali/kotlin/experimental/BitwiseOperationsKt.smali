.class public final Lkotlin/experimental/BitwiseOperationsKt;
.super Ljava/lang/Object;
.source "bitwiseOperations.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0000\n\u0002\u0010\u0005\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\n\n\u0000\u001a(\u0010\u0000\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0001H\u0087\u008c\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a(\u0010\u0007\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0001H\u0087\u008c\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a(\u0010\u0008\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0001H\u0087\u008c\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a \u0010\t\u001a\u00020\u0001*\u00020\u0001H\u0087\u0088\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a(\u0010\u0000\u001a\u00020\n*\u00020\n2\u0006\u0010\u0002\u001a\u00020\nH\u0087\u008c\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a(\u0010\u0007\u001a\u00020\n*\u00020\n2\u0006\u0010\u0002\u001a\u00020\nH\u0087\u008c\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a(\u0010\u0008\u001a\u00020\n*\u00020\n2\u0006\u0010\u0002\u001a\u00020\nH\u0087\u008c\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u001a \u0010\t\u001a\u00020\n*\u00020\nH\u0087\u0088\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0002\u0008\u0006\u00a8\u0006\u000b"
    }
    d2 = {
        "and",
        "",
        "other",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.1",
        "Lkotlin/internal/InlineOnly;",
        "or",
        "xor",
        "inv",
        "",
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
.method private static final and(BB)B
    .registers 2

    and-int/2addr p0, p1

    int-to-byte p0, p0

    return p0
.end method

.method private static final and(SS)S
    .registers 2

    and-int/2addr p0, p1

    int-to-short p0, p0

    return p0
.end method

.method private static final inv(B)B
    .registers 1

    not-int p0, p0

    int-to-byte p0, p0

    return p0
.end method

.method private static final inv(S)S
    .registers 1

    not-int p0, p0

    int-to-short p0, p0

    return p0
.end method

.method private static final or(BB)B
    .registers 2

    or-int/2addr p0, p1

    int-to-byte p0, p0

    return p0
.end method

.method private static final or(SS)S
    .registers 2

    or-int/2addr p0, p1

    int-to-short p0, p0

    return p0
.end method

.method private static final xor(BB)B
    .registers 2

    xor-int/2addr p0, p1

    int-to-byte p0, p0

    return p0
.end method

.method private static final xor(SS)S
    .registers 2

    xor-int/2addr p0, p1

    int-to-short p0, p0

    return p0
.end method
