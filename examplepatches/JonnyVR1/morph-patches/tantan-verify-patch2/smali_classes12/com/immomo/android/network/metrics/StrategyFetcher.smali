.class public final Lcom/immomo/android/network/metrics/StrategyFetcher;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010%\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J?\u0010\u0011\u001a\u0004\u0018\u00010\r*\u00020\t2\u0006\u0010\u000b\u001a\u00020\n2\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000c2\u0012\u0010\u0010\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\r0\u000fH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\r\u0010\u0014\u001a\u00020\u0013\u00a2\u0006\u0004\u0008\u0014\u0010\u0003J1\u0010\u0018\u001a\u00020\u00132\u0006\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u0017\u001a\u00020\u00162\u0012\u0010\u0010\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\r0\u000f\u00a2\u0006\u0004\u0008\u0018\u0010\u0019R\u001d\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\n0\u001a8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001b\u0010\u001c\u001a\u0004\u0008\u001d\u0010\u001e\u00a8\u0006\u001f"
    }
    d2 = {
        "Lcom/immomo/android/network/metrics/StrategyFetcher;",
        "",
        "<init>",
        "()V",
        "",
        "percentage",
        "",
        "f",
        "(I)Z",
        "Ll/apl;",
        "Lcom/immomo/android/network/metrics/Strategy;",
        "strategy",
        "Lkotlin/Function0;",
        "",
        "url",
        "",
        "map",
        "c",
        "(Ll/apl;Lcom/immomo/android/network/metrics/Strategy;Lkotlin/jvm/functions/Function0;Ljava/util/Map;)Ljava/lang/String;",
        "",
        "d",
        "success",
        "",
        "totalTimeMillis",
        "g",
        "(ZJLjava/util/Map;)V",
        "Ljava/util/concurrent/atomic/AtomicReference;",
        "a",
        "Ljava/util/concurrent/atomic/AtomicReference;",
        "e",
        "()Ljava/util/concurrent/atomic/AtomicReference;",
        "sdk_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/immomo/android/network/metrics/StrategyFetcher;

.field private static final a:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcom/immomo/android/network/metrics/Strategy;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/android/network/metrics/StrategyFetcher;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/android/network/metrics/StrategyFetcher;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/android/network/metrics/StrategyFetcher;->INSTANCE:Lcom/immomo/android/network/metrics/StrategyFetcher;

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 9
    .line 10
    new-instance v1, Lcom/immomo/android/network/metrics/Strategy;

    .line 11
    .line 12
    invoke-direct {v1}, Lcom/immomo/android/network/metrics/Strategy;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    sput-object v0, Lcom/immomo/android/network/metrics/StrategyFetcher;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 19
    .line 20
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic a(Lcom/immomo/android/network/metrics/StrategyFetcher;Ll/apl;Lcom/immomo/android/network/metrics/Strategy;Lkotlin/jvm/functions/Function0;Ljava/util/Map;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/immomo/android/network/metrics/StrategyFetcher;->c(Ll/apl;Lcom/immomo/android/network/metrics/Strategy;Lkotlin/jvm/functions/Function0;Ljava/util/Map;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic b(Lcom/immomo/android/network/metrics/StrategyFetcher;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/android/network/metrics/StrategyFetcher;->f(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final c(Ll/apl;Lcom/immomo/android/network/metrics/Strategy;Lkotlin/jvm/functions/Function0;Ljava/util/Map;)Ljava/lang/String;
    .locals 3
    .param p1    # Ll/apl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/apl;",
            "Lcom/immomo/android/network/metrics/Strategy;",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/immomo/android/network/metrics/Strategy;->h()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/Set;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-nez v0, :cond_1

    .line 12
    .line 13
    if-lez p0, :cond_1

    .line 14
    .line 15
    :try_start_0
    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Ljava/lang/String;

    .line 20
    .line 21
    invoke-interface {p1, v2, p4}, Ll/apl;->a(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    :cond_0
    :goto_1
    add-int/lit8 p0, p0, -0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    throw p0

    .line 33
    :catch_0
    sget-object v2, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->INSTANCE:Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->f()Lcom/immomo/android/network/metrics/NetworkMetricsStatistics$a;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Lcom/immomo/android/network/metrics/Strategy;->e()V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    return-object v1
.end method

.method private final f(I)Z
    .locals 6

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    if-gez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/16 v1, 0x64

    .line 7
    .line 8
    if-lt v1, p1, :cond_1

    .line 9
    .line 10
    move v1, v0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    move v1, p0

    .line 13
    :goto_1
    if-eqz v1, :cond_3

    .line 14
    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    invoke-static {v1, v2}, Lkotlin/random/RandomKt;->a(J)Lkotlin/random/Random;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-wide/16 v2, 0x0

    .line 24
    .line 25
    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    .line 26
    .line 27
    invoke-virtual {v1, v2, v3, v4, v5}, Lkotlin/random/Random;->nextDouble(DD)D

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    int-to-double v3, p1

    .line 32
    cmpg-double p1, v1, v3

    .line 33
    .line 34
    if-gtz p1, :cond_2

    .line 35
    .line 36
    return v0

    .line 37
    :cond_2
    return p0

    .line 38
    :cond_3
    const-string p0, "Percentage must be between 0 and 100"

    .line 39
    .line 40
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    return p0
.end method


# virtual methods
.method public final d()V
    .locals 6

    .line 1
    sget-object v0, Ll/l4k;->INSTANCE:Ll/l4k;

    .line 2
    .line 3
    invoke-static {}, Ll/r5e;->b()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v3, Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1;

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-direct {v3, p0}, Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 11
    .line 12
    .line 13
    const/4 v4, 0x2

    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static/range {v0 .. v5}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final e()Ljava/util/concurrent/atomic/AtomicReference;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcom/immomo/android/network/metrics/Strategy;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/immomo/android/network/metrics/StrategyFetcher;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g(ZJLjava/util/Map;)V
    .locals 8
    .param p4    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZJ",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/l4k;->INSTANCE:Ll/l4k;

    .line 5
    .line 6
    invoke-static {}, Ll/r5e;->b()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    new-instance v2, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1;

    .line 11
    .line 12
    const/4 v7, 0x0

    .line 13
    move v4, p1

    .line 14
    move-wide v5, p2

    .line 15
    move-object v3, p4

    .line 16
    invoke-direct/range {v2 .. v7}, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1;-><init>(Ljava/util/Map;ZJLkotlin/coroutines/Continuation;)V

    .line 17
    .line 18
    .line 19
    const/4 v4, 0x2

    .line 20
    const/4 v5, 0x0

    .line 21
    move-object v3, v2

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-static/range {v0 .. v5}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 24
    .line 25
    .line 26
    return-void
.end method
