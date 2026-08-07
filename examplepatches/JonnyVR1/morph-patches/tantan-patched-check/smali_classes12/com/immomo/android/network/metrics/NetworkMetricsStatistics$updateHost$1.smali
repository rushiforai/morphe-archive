.class final Lcom/immomo/android/network/metrics/NetworkMetricsStatistics$updateHost$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic $hosts:Ljava/util/Set;


# direct methods
.method public constructor <init>(Ljava/util/Set;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics$updateHost$1;->$hosts:Ljava/util/Set;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 55
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics$updateHost$1;->invoke()V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke()V
    .locals 10

    .line 1
    sget-object v0, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->INSTANCE:Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->d()Ll/vv5;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v2, p0, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics$updateHost$1;->$hosts:Ljava/util/Set;

    .line 10
    .line 11
    check-cast v2, Ljava/lang/Iterable;

    .line 12
    .line 13
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    move-object v6, v2

    .line 18
    check-cast v6, Ljava/lang/String;

    .line 19
    .line 20
    const/16 v8, 0x2f

    .line 21
    .line 22
    const/4 v9, 0x0

    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x0

    .line 25
    const/4 v4, 0x0

    .line 26
    const/4 v5, 0x0

    .line 27
    const/4 v7, 0x0

    .line 28
    invoke-static/range {v1 .. v9}, Ll/vv5;->b(Ll/vv5;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Ll/apl;Ljava/lang/String;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ll/vv5;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v1, 0x0

    .line 34
    :goto_0
    invoke-virtual {v0, v1}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->i(Ll/vv5;)V

    .line 35
    .line 36
    .line 37
    sget-object v0, Lcom/immomo/android/network/metrics/StrategyFetcher;->INSTANCE:Lcom/immomo/android/network/metrics/StrategyFetcher;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/immomo/android/network/metrics/StrategyFetcher;->e()Ljava/util/concurrent/atomic/AtomicReference;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/immomo/android/network/metrics/Strategy;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics$updateHost$1;->$hosts:Ljava/util/Set;

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Lcom/immomo/android/network/metrics/Strategy;->p(Ljava/util/Set;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
