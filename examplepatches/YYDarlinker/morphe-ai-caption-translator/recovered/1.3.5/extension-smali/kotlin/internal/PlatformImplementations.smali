.class public Lkotlin/internal/PlatformImplementations;
.super Ljava/lang/Object;
.source "PlatformImplementations.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/internal/PlatformImplementations$ReflectThrowable;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPlatformImplementations.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PlatformImplementations.kt\nkotlin/internal/PlatformImplementations\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,94:1\n1#2:95\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0003\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010$\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0010\u0018\u00002\u00020\u0001:\u0001\"B\t\u0008F\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001a\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u0007H\u0096\u0080\u0004J\u0018\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u00070\n2\u0006\u0010\u0008\u001a\u00020\u0007H\u0096\u0080\u0004J\u001c\u0010\u000b\u001a\u0004\u0018\u00010\u000c2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0010H\u0096\u0080\u0004J\n\u0010\u0011\u001a\u00020\u0012H\u0096\u0080\u0004J\n\u0010\u0013\u001a\u00020\u0014H\u0096\u0080\u0004JA\u0010\u0015\u001a\u0004\u0018\u0001H\u0016\"\u0004\u0008\u0000\u0010\u0017\"\u0004\u0008\u0001\u0010\u00162\u0012\u0010\u0018\u001a\u000e\u0012\u0004\u0012\u0002H\u0017\u0012\u0004\u0012\u0002H\u00160\u00192\u0006\u0010\u001a\u001a\u0002H\u00172\u0006\u0010\u001b\u001a\u0002H\u0016H\u0096\u0080\u0004\u00a2\u0006\u0002\u0010\u001cJN\u0010\u001d\u001a\u0002H\u0016\"\u0004\u0008\u0000\u0010\u0017\"\u0004\u0008\u0001\u0010\u0016\"\n\u0008\u0002\u0010\u001e*\u0004\u0008\u0002H\u00162\u0012\u0010\u0018\u001a\u000e\u0012\u0004\u0012\u0002H\u0017\u0012\u0004\u0012\u0002H\u00160\u001f2\u0006\u0010\u001a\u001a\u0002H\u00172\u0006\u0010 \u001a\u0002H\u001eH\u0096\u0080\u0004\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010!\u0082\u0002\u0004\n\u0002\u00089\u00a8\u0006#"
    }
    d2 = {
        "Lkotlin/internal/PlatformImplementations;",
        "",
        "<init>",
        "()V",
        "addSuppressed",
        "",
        "cause",
        "",
        "exception",
        "getSuppressed",
        "",
        "getMatchResultNamedGroup",
        "Lkotlin/text/MatchGroup;",
        "matchResult",
        "Ljava/util/regex/MatchResult;",
        "name",
        "",
        "defaultPlatformRandom",
        "Lkotlin/random/Random;",
        "getSystemClock",
        "Lkotlin/time/Clock;",
        "getOrDefault",
        "V",
        "K",
        "map",
        "",
        "key",
        "default",
        "(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        "computeIfAbsent",
        "NewV",
        "Ljava/util/concurrent/ConcurrentMap;",
        "newValue",
        "(Ljava/util/concurrent/ConcurrentMap;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        "ReflectThrowable",
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


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    .registers 5

    const-string p0, "cause"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "exception"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    sget-object p0, Lkotlin/internal/PlatformImplementations$ReflectThrowable;->addSuppressed:Ljava/lang/reflect/Method;

    if-eqz p0, :cond_17

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-virtual {p0, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_17
    return-void
.end method

.method public computeIfAbsent(Ljava/util/concurrent/ConcurrentMap;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            "NewV::TV;>(",
            "Ljava/util/concurrent/ConcurrentMap<",
            "TK;TV;>;TK;TNewV;)TV;"
        }
    .end annotation

    const-string p0, "map"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "newValue"

    invoke-static {p3, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "computeIfAbsent should not be called on the base PlatformImplementations."

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public defaultPlatformRandom()Lkotlin/random/Random;
    .registers 1

    .line 48
    new-instance p0, Lkotlin/random/FallbackThreadLocalRandom;

    invoke-direct {p0}, Lkotlin/random/FallbackThreadLocalRandom;-><init>()V

    check-cast p0, Lkotlin/random/Random;

    return-object p0
.end method

.method public getMatchResultNamedGroup(Ljava/util/regex/MatchResult;Ljava/lang/String;)Lkotlin/text/MatchGroup;
    .registers 3

    const-string p0, "matchResult"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "name"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Retrieving groups by name is not supported on this platform."

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getOrDefault(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "TK;+TV;>;TK;TV;)TV;"
        }
    .end annotation

    const-string p0, "map"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "getOrDefault should not be called on the base PlatformImplementations."

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getSuppressed(Ljava/lang/Throwable;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    const-string p0, "exception"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    sget-object p0, Lkotlin/internal/PlatformImplementations$ReflectThrowable;->getSuppressed:Ljava/lang/reflect/Method;

    if-eqz p0, :cond_1a

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_1a

    check-cast p0, [Ljava/lang/Throwable;

    invoke-static {p0}, Lkotlin/collections/ArraysKt;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    if-nez p0, :cond_19

    goto :goto_1a

    :cond_19
    return-object p0

    .line 41
    :cond_1a
    :goto_1a
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getSystemClock()Lkotlin/time/Clock;
    .registers 2

    .line 51
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "getSystemClock should not be called on the base PlatformImplementations."

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
