.class final Lcom/immomo/android/network/metrics/NetworkMetricsStatistics$init$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->g(Landroid/app/Application;Ll/vv5;)V
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
.field final synthetic $app:Landroid/app/Application;

.field final synthetic $config:Ll/vv5;


# direct methods
.method public constructor <init>(Ll/vv5;Landroid/app/Application;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics$init$1;->$config:Ll/vv5;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics$init$1;->$app:Landroid/app/Application;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 31
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics$init$1;->invoke()V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke()V
    .locals 2

    .line 1
    sget-object v0, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->INSTANCE:Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics$init$1;->$config:Ll/vv5;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->i(Ll/vv5;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics$init$1;->$app:Landroid/app/Application;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->h(Landroid/app/Application;)V

    .line 11
    .line 12
    .line 13
    new-instance p0, Lcom/immomo/android/network/metrics/Strategy;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/immomo/android/network/metrics/Strategy;-><init>()V

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/immomo/android/network/metrics/StrategyFetcher;->INSTANCE:Lcom/immomo/android/network/metrics/StrategyFetcher;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/immomo/android/network/metrics/StrategyFetcher;->e()Ljava/util/concurrent/atomic/AtomicReference;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/immomo/android/network/metrics/StrategyFetcher;->d()V

    .line 28
    .line 29
    .line 30
    return-void
.end method
