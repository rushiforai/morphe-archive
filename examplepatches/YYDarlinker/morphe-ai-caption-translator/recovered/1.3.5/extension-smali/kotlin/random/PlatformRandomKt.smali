.class public final Lkotlin/random/PlatformRandomKt;
.super Ljava/lang/Object;
.source "PlatformRandom.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u001a\u001c\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0087\u0080\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005\u001a\u001c\u0010\u0006\u001a\u00020\u0002*\u00020\u0001H\u0087\u0080\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005\u001a\u000e\u0010\u0007\u001a\u00020\u0002H\u0081\u0088\u0004b\u0002\u0008\u0008\u001a\u001a\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000cH\u0080\u0080\u0004\u00a8\u0006\u000e"
    }
    d2 = {
        "asJavaRandom",
        "Ljava/util/Random;",
        "Lkotlin/random/Random;",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.3",
        "asKotlinRandom",
        "defaultPlatformRandom",
        "Lkotlin/internal/InlineOnly;",
        "doubleFromParts",
        "",
        "hi26",
        "",
        "low27",
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
.method public static final asJavaRandom(Lkotlin/random/Random;)Ljava/util/Random;
    .registers 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    instance-of v0, p0, Lkotlin/random/AbstractPlatformRandom;

    if-eqz v0, :cond_d

    move-object v0, p0

    check-cast v0, Lkotlin/random/AbstractPlatformRandom;

    goto :goto_e

    :cond_d
    const/4 v0, 0x0

    :goto_e
    if-eqz v0, :cond_18

    invoke-virtual {v0}, Lkotlin/random/AbstractPlatformRandom;->getImpl()Ljava/util/Random;

    move-result-object v0

    if-nez v0, :cond_17

    goto :goto_18

    :cond_17
    return-object v0

    :cond_18
    :goto_18
    new-instance v0, Lkotlin/random/KotlinRandom;

    invoke-direct {v0, p0}, Lkotlin/random/KotlinRandom;-><init>(Lkotlin/random/Random;)V

    check-cast v0, Ljava/util/Random;

    return-object v0
.end method

.method public static final asKotlinRandom(Ljava/util/Random;)Lkotlin/random/Random;
    .registers 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    instance-of v0, p0, Lkotlin/random/KotlinRandom;

    if-eqz v0, :cond_d

    move-object v0, p0

    check-cast v0, Lkotlin/random/KotlinRandom;

    goto :goto_e

    :cond_d
    const/4 v0, 0x0

    :goto_e
    if-eqz v0, :cond_18

    invoke-virtual {v0}, Lkotlin/random/KotlinRandom;->getImpl()Lkotlin/random/Random;

    move-result-object v0

    if-nez v0, :cond_17

    goto :goto_18

    :cond_17
    return-object v0

    :cond_18
    :goto_18
    new-instance v0, Lkotlin/random/PlatformRandom;

    invoke-direct {v0, p0}, Lkotlin/random/PlatformRandom;-><init>(Ljava/util/Random;)V

    check-cast v0, Lkotlin/random/Random;

    return-object v0
.end method

.method private static final defaultPlatformRandom()Lkotlin/random/Random;
    .registers 1

    .line 29
    sget-object v0, Lkotlin/internal/PlatformImplementationsKt;->IMPLEMENTATIONS:Lkotlin/internal/PlatformImplementations;

    invoke-virtual {v0}, Lkotlin/internal/PlatformImplementations;->defaultPlatformRandom()Lkotlin/random/Random;

    move-result-object v0

    return-object v0
.end method

.method public static final doubleFromParts(II)D
    .registers 4

    int-to-long v0, p0

    const/16 p0, 0x1b

    shl-long/2addr v0, p0

    int-to-long p0, p1

    add-long/2addr v0, p0

    long-to-double p0, v0

    const-wide/high16 v0, 0x4340000000000000L    # 9.007199254740992E15

    div-double/2addr p0, v0

    return-wide p0
.end method
