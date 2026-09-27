.class public final Lkotlin/UShortKt;
.super Ljava/lang/Object;
.source "UShort.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0005\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\n\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\u001a)\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007b\u0002\u0008\u0008\u00a2\u0006\u0002\u0010\u0003\u001a)\u0010\u0000\u001a\u00020\u0001*\u00020\tH\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007b\u0002\u0008\u0008\u00a2\u0006\u0002\u0010\n\u001a)\u0010\u0000\u001a\u00020\u0001*\u00020\u000bH\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007b\u0002\u0008\u0008\u00a2\u0006\u0002\u0010\u000c\u001a)\u0010\u0000\u001a\u00020\u0001*\u00020\rH\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007b\u0002\u0008\u0008\u00a2\u0006\u0002\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "toUShort",
        "Lkotlin/UShort;",
        "",
        "(B)S",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.5",
        "Lkotlin/internal/InlineOnly;",
        "Lkotlin/internal/IntrinsicConstEvaluation;",
        "",
        "(S)S",
        "",
        "(I)S",
        "",
        "(J)S",
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
.method private static final toUShort(B)S
    .registers 1

    int-to-short p0, p0

    .line 416
    invoke-static {p0}, Lkotlin/UShort;->constructor-impl(S)S

    move-result p0

    return p0
.end method

.method private static final toUShort(I)S
    .registers 1

    int-to-short p0, p0

    .line 439
    invoke-static {p0}, Lkotlin/UShort;->constructor-impl(S)S

    move-result p0

    return p0
.end method

.method private static final toUShort(J)S
    .registers 2

    long-to-int p0, p0

    int-to-short p0, p0

    .line 451
    invoke-static {p0}, Lkotlin/UShort;->constructor-impl(S)S

    move-result p0

    return p0
.end method

.method private static final toUShort(S)S
    .registers 1

    .line 427
    invoke-static {p0}, Lkotlin/UShort;->constructor-impl(S)S

    move-result p0

    return p0
.end method
