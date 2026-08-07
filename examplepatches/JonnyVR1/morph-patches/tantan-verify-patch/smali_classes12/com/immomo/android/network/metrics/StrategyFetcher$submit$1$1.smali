.class final Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

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
.field final synthetic this$0:Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1;


# direct methods
.method public constructor <init>(Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;->this$0:Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 31
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;->invoke()V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke()V
    .locals 3

    .line 1
    sget-object v0, Lcom/immomo/android/network/metrics/StrategyFetcher;->INSTANCE:Lcom/immomo/android/network/metrics/StrategyFetcher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/android/network/metrics/StrategyFetcher;->e()Ljava/util/concurrent/atomic/AtomicReference;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/immomo/android/network/metrics/Strategy;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/immomo/android/network/metrics/Strategy;->i()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget-object v1, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->INSTANCE:Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;

    .line 21
    .line 22
    new-instance v2, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;

    .line 23
    .line 24
    invoke-direct {v2, p0, v0}, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;-><init>(Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;Lcom/immomo/android/network/metrics/Strategy;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v2}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->a(Lkotlin/jvm/functions/Function2;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
