.class final Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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


# static fields
.field public static final INSTANCE:Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1;

    invoke-direct {v0}, Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1;-><init>()V

    sput-object v0, Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1;->INSTANCE:Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 9
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1;->invoke()V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke()V
    .locals 1

    .line 1
    sget-object p0, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->INSTANCE:Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;

    .line 2
    .line 3
    sget-object v0, Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1$1;->INSTANCE:Lcom/immomo/android/network/metrics/StrategyFetcher$fetch$1$1$1;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->a(Lkotlin/jvm/functions/Function2;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
