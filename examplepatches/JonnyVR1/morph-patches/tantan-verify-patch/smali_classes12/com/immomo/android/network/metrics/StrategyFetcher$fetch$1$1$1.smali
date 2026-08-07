.class final Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1;->invoke()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Ll/apl;",
        "Ll/vv5;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0010\u0006\u001a\u00020\u0003*\u00020\u00002\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0001H\n\u00a2\u0006\u0004\u0008\u0004\u0010\u0005"
    }
    d2 = {
        "Ll/apl;",
        "Ll/vv5;",
        "it",
        "",
        "invoke",
        "(Ll/apl;Ll/vv5;)V",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1$1;

    invoke-direct {v0}, Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1$1;-><init>()V

    sput-object v0, Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1$1;->INSTANCE:Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1$1;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 62
    check-cast p1, Ll/apl;

    check-cast p2, Ll/vv5;

    invoke-virtual {p0, p1, p2}, Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1$1;->invoke(Ll/apl;Ll/vv5;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Ll/apl;Ll/vv5;)V
    .locals 2
    .param p1    # Ll/apl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/vv5;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/immomo/android/network/metrics/StrategyFetcher;->INSTANCE:Lcom/immomo/android/network/metrics/StrategyFetcher;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/StrategyFetcher;->e()Ljava/util/concurrent/atomic/AtomicReference;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/immomo/android/network/metrics/Strategy;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    new-instance v1, Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1$1$response$1;

    .line 20
    .line 21
    invoke-direct {v1, v0}, Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1$1$response$1;-><init>(Lcom/immomo/android/network/metrics/Strategy;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p2}, Ll/ok20;->b(Ll/vv5;)Ljava/util/Map;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-static {p0, p1, v0, v1, p2}, Lcom/immomo/android/network/metrics/StrategyFetcher;->a(Lcom/immomo/android/network/metrics/StrategyFetcher;Ll/apl;Lcom/immomo/android/network/metrics/Strategy;Lkotlin/jvm/functions/Function0;Ljava/util/Map;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/StrategyFetcher;->e()Ljava/util/concurrent/atomic/AtomicReference;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance p2, Lcom/immomo/android/network/metrics/Strategy;

    .line 39
    .line 40
    invoke-direct {p2, p1}, Lcom/immomo/android/network/metrics/Strategy;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    sget-object p0, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->INSTANCE:Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->c()Landroid/app/Application;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    if-eqz p0, :cond_0

    .line 53
    .line 54
    sget-object p2, Ll/o4f0;->INSTANCE:Ll/o4f0;

    .line 55
    .line 56
    const-string v0, "MMNetworkMetrics4Android_STRATEGY"

    .line 57
    .line 58
    invoke-virtual {p2, p0, v0, p1}, Ll/o4f0;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method
