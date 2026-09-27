.class public final Lkotlin/random/FallbackThreadLocalRandom;
.super Lkotlin/random/AbstractPlatformRandom;
.source "PlatformRandom.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003*\u0001\u0005\u0008\u0000\u0018\u00002\u00020\u0001B\t\u0008F\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u0011\u0010\u0004\u001a\u00020\u0005X\u0082\u0084\u0008\u00a2\u0006\u0004\n\u0002\u0010\u0006R\u0015\u0010\u0007\u001a\u00020\u00088VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Lkotlin/random/FallbackThreadLocalRandom;",
        "Lkotlin/random/AbstractPlatformRandom;",
        "<init>",
        "()V",
        "implStorage",
        "kotlin/random/FallbackThreadLocalRandom$implStorage$1",
        "Lkotlin/random/FallbackThreadLocalRandom$implStorage$1;",
        "impl",
        "Ljava/util/Random;",
        "getImpl",
        "()Ljava/util/Random;",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final implStorage:Lkotlin/random/FallbackThreadLocalRandom$implStorage$1;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 51
    invoke-direct {p0}, Lkotlin/random/AbstractPlatformRandom;-><init>()V

    .line 52
    new-instance v0, Lkotlin/random/FallbackThreadLocalRandom$implStorage$1;

    invoke-direct {v0}, Lkotlin/random/FallbackThreadLocalRandom$implStorage$1;-><init>()V

    iput-object v0, p0, Lkotlin/random/FallbackThreadLocalRandom;->implStorage:Lkotlin/random/FallbackThreadLocalRandom$implStorage$1;

    return-void
.end method


# virtual methods
.method public getImpl()Ljava/util/Random;
    .registers 2

    .line 57
    iget-object p0, p0, Lkotlin/random/FallbackThreadLocalRandom;->implStorage:Lkotlin/random/FallbackThreadLocalRandom$implStorage$1;

    invoke-virtual {p0}, Lkotlin/random/FallbackThreadLocalRandom$implStorage$1;->get()Ljava/lang/Object;

    move-result-object p0

    const-string v0, "get(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p0, Ljava/util/Random;

    return-object p0
.end method
