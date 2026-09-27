.class public Lkotlin/internal/jdk8/JDK8PlatformImplementations;
.super Lkotlin/internal/jdk7/JDK7PlatformImplementations;
.source "JDK8PlatformImplementations.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/internal/jdk8/JDK8PlatformImplementations$ReflectSdkVersion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010$\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0010\u0018\u00002\u00020\u0001:\u0001\u001fB\t\u0008F\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0082\u0080\u0004J\u001c\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\rH\u0096\u0080\u0004JA\u0010\u000e\u001a\u0004\u0018\u0001H\u000f\"\u0004\u0008\u0000\u0010\u0010\"\u0004\u0008\u0001\u0010\u000f2\u0012\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u0002H\u0010\u0012\u0004\u0012\u0002H\u000f0\u00122\u0006\u0010\u0013\u001a\u0002H\u00102\u0006\u0010\u0014\u001a\u0002H\u000fH\u0096\u0080\u0004\u00a2\u0006\u0002\u0010\u0015JN\u0010\u0016\u001a\u0002H\u000f\"\u0004\u0008\u0000\u0010\u0010\"\u0004\u0008\u0001\u0010\u000f\"\n\u0008\u0002\u0010\u0017*\u0004\u0008\u0002H\u000f2\u0012\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u0002H\u0010\u0012\u0004\u0012\u0002H\u000f0\u00182\u0006\u0010\u0013\u001a\u0002H\u00102\u0006\u0010\u0019\u001a\u0002H\u0017H\u0096\u0080\u0004\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u001aJ\n\u0010\u001b\u001a\u00020\u001cH\u0096\u0080\u0004J\n\u0010\u001d\u001a\u00020\u001eH\u0096\u0080\u0004\u0082\u0002\u0004\n\u0002\u00089\u00a8\u0006 "
    }
    d2 = {
        "Lkotlin/internal/jdk8/JDK8PlatformImplementations;",
        "Lkotlin/internal/jdk7/JDK7PlatformImplementations;",
        "<init>",
        "()V",
        "sdkIsNullOrAtLeast",
        "",
        "version",
        "",
        "getMatchResultNamedGroup",
        "Lkotlin/text/MatchGroup;",
        "matchResult",
        "Ljava/util/regex/MatchResult;",
        "name",
        "",
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
        "defaultPlatformRandom",
        "Lkotlin/random/Random;",
        "getSystemClock",
        "Lkotlin/time/Clock;",
        "ReflectSdkVersion",
        "kotlin-stdlib-jdk8"
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

    .line 28
    invoke-direct {p0}, Lkotlin/internal/jdk7/JDK7PlatformImplementations;-><init>()V

    return-void
.end method

.method static final computeIfAbsent$lambda$0(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    return-object p0
.end method

.method static final computeIfAbsent$lambda$1(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 67
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private final sdkIsNullOrAtLeast(I)Z
    .registers 2

    .line 41
    sget-object p0, Lkotlin/internal/jdk8/JDK8PlatformImplementations$ReflectSdkVersion;->sdkVersion:Ljava/lang/Integer;

    if-eqz p0, :cond_f

    sget-object p0, Lkotlin/internal/jdk8/JDK8PlatformImplementations$ReflectSdkVersion;->sdkVersion:Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-lt p0, p1, :cond_d

    goto :goto_f

    :cond_d
    const/4 p0, 0x0

    return p0

    :cond_f
    :goto_f
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public computeIfAbsent(Ljava/util/concurrent/ConcurrentMap;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
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

    const-string v0, "map"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "newValue"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v0, 0x18

    .line 65
    invoke-direct {p0, v0}, Lkotlin/internal/jdk8/JDK8PlatformImplementations;->sdkIsNullOrAtLeast(I)Z

    move-result p0

    if-eqz p0, :cond_21

    .line 67
    new-instance p0, Lkotlin/internal/jdk8/JDK8PlatformImplementations$$ExternalSyntheticLambda4;

    invoke-direct {p0, p3}, Lkotlin/internal/jdk8/JDK8PlatformImplementations$$ExternalSyntheticLambda4;-><init>(Ljava/lang/Object;)V

    new-instance p3, Lkotlin/internal/jdk8/JDK8PlatformImplementations$$ExternalSyntheticLambda5;

    invoke-direct {p3, p0}, Lkotlin/internal/jdk8/JDK8PlatformImplementations$$ExternalSyntheticLambda5;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-static {p1, p2, p3}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/concurrent/ConcurrentMap;Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 71
    :cond_21
    invoke-interface {p1, p2, p3}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_28

    return-object p3

    :cond_28
    return-object p0
.end method

.method public defaultPlatformRandom()Lkotlin/random/Random;
    .registers 2

    const/16 v0, 0x22

    .line 80
    invoke-direct {p0, v0}, Lkotlin/internal/jdk8/JDK8PlatformImplementations;->sdkIsNullOrAtLeast(I)Z

    move-result v0

    if-eqz v0, :cond_10

    new-instance p0, Lkotlin/random/jdk8/PlatformThreadLocalRandom;

    invoke-direct {p0}, Lkotlin/random/jdk8/PlatformThreadLocalRandom;-><init>()V

    check-cast p0, Lkotlin/random/Random;

    return-object p0

    :cond_10
    invoke-super {p0}, Lkotlin/internal/jdk7/JDK7PlatformImplementations;->defaultPlatformRandom()Lkotlin/random/Random;

    move-result-object p0

    return-object p0
.end method

.method public getMatchResultNamedGroup(Ljava/util/regex/MatchResult;Ljava/lang/String;)Lkotlin/text/MatchGroup;
    .registers 6

    const-string p0, "matchResult"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "name"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    instance-of p0, p1, Ljava/util/regex/Matcher;

    const/4 v0, 0x0

    if-eqz p0, :cond_12

    check-cast p1, Ljava/util/regex/Matcher;

    goto :goto_13

    :cond_12
    move-object p1, v0

    :goto_13
    if-eqz p1, :cond_3d

    .line 46
    new-instance p0, Lkotlin/ranges/IntRange;

    invoke-static {p1, p2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/regex/Matcher;Ljava/lang/String;)I

    move-result v1

    invoke-static {p1, p2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1(Ljava/util/regex/Matcher;Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-direct {p0, v1, v2}, Lkotlin/ranges/IntRange;-><init>(II)V

    .line 47
    invoke-virtual {p0}, Lkotlin/ranges/IntRange;->getStart()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ltz v1, :cond_3c

    .line 48
    new-instance v0, Lkotlin/text/MatchGroup;

    invoke-static {p1, p2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/regex/Matcher;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "group(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v0, p1, p0}, Lkotlin/text/MatchGroup;-><init>(Ljava/lang/String;Lkotlin/ranges/IntRange;)V

    :cond_3c
    return-object v0

    .line 44
    :cond_3d
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Retrieving groups by name is not supported on this platform."

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getOrDefault(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
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

    const-string v0, "map"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v0, 0x18

    .line 54
    invoke-direct {p0, v0}, Lkotlin/internal/jdk8/JDK8PlatformImplementations;->sdkIsNullOrAtLeast(I)Z

    move-result p0

    if-eqz p0, :cond_12

    .line 56
    invoke-static {p1, p2, p3}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 59
    :cond_12
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_21

    invoke-interface {p1, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_20

    const/4 p0, 0x0

    return-object p0

    :cond_20
    return-object p3

    :cond_21
    return-object p0
.end method

.method public getSystemClock()Lkotlin/time/Clock;
    .registers 2

    const/16 v0, 0x1a

    .line 84
    invoke-direct {p0, v0}, Lkotlin/internal/jdk8/JDK8PlatformImplementations;->sdkIsNullOrAtLeast(I)Z

    move-result p0

    if-eqz p0, :cond_10

    new-instance p0, Lkotlin/internal/jdk8/JDK8PlatformImplementations$getSystemClock$1;

    invoke-direct {p0}, Lkotlin/internal/jdk8/JDK8PlatformImplementations$getSystemClock$1;-><init>()V

    check-cast p0, Lkotlin/time/Clock;

    return-object p0

    .line 87
    :cond_10
    new-instance p0, Lkotlin/internal/jdk8/JDK8PlatformImplementations$getSystemClock$2;

    invoke-direct {p0}, Lkotlin/internal/jdk8/JDK8PlatformImplementations$getSystemClock$2;-><init>()V

    check-cast p0, Lkotlin/time/Clock;

    return-object p0
.end method
