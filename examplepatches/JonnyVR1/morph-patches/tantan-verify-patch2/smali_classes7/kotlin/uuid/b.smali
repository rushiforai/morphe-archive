.class public Lkotlin/uuid/b;
.super Lkotlin/uuid/a;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0010\t\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u001a3\u0010\u0008\u001a\u00020\u0007*\u00020\u00002\u0006\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0005\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u0003H\u0001\u00a2\u0006\u0004\u0008\u0008\u0010\t\u001a#\u0010\u000c\u001a\u00020\u0007*\u00020\u00012\u0006\u0010\n\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0000H\u0000\u00a2\u0006\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "",
        "",
        "dst",
        "",
        "dstOffset",
        "startIndex",
        "endIndex",
        "",
        "d",
        "(J[BIII)V",
        "index",
        "value",
        "e",
        "([BIJ)V",
        "kotlin-stdlib"
    }
    k = 0x5
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x31
    xs = "kotlin/uuid/UuidKt"
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lkotlin/uuid/a;-><init>()V

    return-void
.end method

.method public static final d(J[BIII)V
    .locals 4
    .param p2    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/uuid/ExperimentalUuidApi;
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    rsub-int/lit8 p4, p4, 0x7

    .line 5
    .line 6
    rsub-int/lit8 p5, p5, 0x8

    .line 7
    .line 8
    if-gt p5, p4, :cond_0

    .line 9
    .line 10
    :goto_0
    shl-int/lit8 v0, p4, 0x3

    .line 11
    .line 12
    shr-long v0, p0, v0

    .line 13
    .line 14
    const-wide/16 v2, 0xff

    .line 15
    .line 16
    and-long/2addr v0, v2

    .line 17
    long-to-int v0, v0

    .line 18
    invoke-static {}, Lkotlin/text/HexExtensionsKt;->a()[I

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    aget v0, v1, v0

    .line 23
    .line 24
    add-int/lit8 v1, p3, 0x1

    .line 25
    .line 26
    shr-int/lit8 v2, v0, 0x8

    .line 27
    .line 28
    int-to-byte v2, v2

    .line 29
    aput-byte v2, p2, p3

    .line 30
    .line 31
    add-int/lit8 p3, p3, 0x2

    .line 32
    .line 33
    int-to-byte v0, v0

    .line 34
    aput-byte v0, p2, v1

    .line 35
    .line 36
    if-eq p4, p5, :cond_0

    .line 37
    .line 38
    add-int/lit8 p4, p4, -0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-void
.end method

.method public static final e([BIJ)V
    .locals 5
    .param p0    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x7

    .line 5
    :goto_0
    const/4 v1, -0x1

    .line 6
    if-ge v1, v0, :cond_0

    .line 7
    .line 8
    shl-int/lit8 v1, v0, 0x3

    .line 9
    .line 10
    add-int/lit8 v2, p1, 0x1

    .line 11
    .line 12
    shr-long v3, p2, v1

    .line 13
    .line 14
    long-to-int v1, v3

    .line 15
    int-to-byte v1, v1

    .line 16
    aput-byte v1, p0, p1

    .line 17
    .line 18
    add-int/lit8 v0, v0, -0x1

    .line 19
    .line 20
    move p1, v2

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method
