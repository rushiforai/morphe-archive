.class final Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;->invoke()V
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


# instance fields
.field final synthetic $strategyRef:Lcom/immomo/android/network/metrics/Strategy;

.field final synthetic this$0:Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;


# direct methods
.method public constructor <init>(Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;Lcom/immomo/android/network/metrics/Strategy;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;->this$0:Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;

    iput-object p2, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;->$strategyRef:Lcom/immomo/android/network/metrics/Strategy;

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 113
    check-cast p1, Ll/apl;

    check-cast p2, Ll/vv5;

    invoke-virtual {p0, p1, p2}, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;->invoke(Ll/apl;Ll/vv5;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Ll/apl;Ll/vv5;)V
    .locals 4
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
    :try_start_0
    iget-object v0, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;->this$0:Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;->this$0:Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1;->$map:Ljava/util/Map;

    .line 9
    .line 10
    invoke-static {p2}, Ll/ok20;->b(Ll/vv5;)Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-interface {v0, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;->this$0:Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;

    .line 18
    .line 19
    iget-object p2, p2, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;->this$0:Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1;

    .line 20
    .line 21
    iget-boolean v0, p2, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1;->$success:Z

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-wide v0, p2, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1;->$totalTimeMillis:J

    .line 26
    .line 27
    iget-object p2, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;->$strategyRef:Lcom/immomo/android/network/metrics/Strategy;

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/immomo/android/network/metrics/Strategy;->j()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    int-to-long v2, p2

    .line 34
    cmp-long p2, v0, v2

    .line 35
    .line 36
    if-lez p2, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    sget-object p2, Lcom/immomo/android/network/metrics/StrategyFetcher;->INSTANCE:Lcom/immomo/android/network/metrics/StrategyFetcher;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;->$strategyRef:Lcom/immomo/android/network/metrics/Strategy;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/immomo/android/network/metrics/Strategy;->m()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-static {p2, v0}, Lcom/immomo/android/network/metrics/StrategyFetcher;->b(Lcom/immomo/android/network/metrics/StrategyFetcher;I)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    iget-object v0, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;->$strategyRef:Lcom/immomo/android/network/metrics/Strategy;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    new-instance v1, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1$2;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1$2;-><init>(Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;->this$0:Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;->this$0:Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1;->$map:Ljava/util/Map;

    .line 68
    .line 69
    invoke-static {p2, p1, v0, v1, p0}, Lcom/immomo/android/network/metrics/StrategyFetcher;->a(Lcom/immomo/android/network/metrics/StrategyFetcher;Ll/apl;Lcom/immomo/android/network/metrics/Strategy;Lkotlin/jvm/functions/Function0;Ljava/util/Map;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    :goto_0
    sget-object p2, Lcom/immomo/android/network/metrics/StrategyFetcher;->INSTANCE:Lcom/immomo/android/network/metrics/StrategyFetcher;

    .line 74
    .line 75
    iget-object v0, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;->$strategyRef:Lcom/immomo/android/network/metrics/Strategy;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/immomo/android/network/metrics/Strategy;->k()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-static {p2, v0}, Lcom/immomo/android/network/metrics/StrategyFetcher;->b(Lcom/immomo/android/network/metrics/StrategyFetcher;I)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_2

    .line 86
    .line 87
    iget-object v0, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;->$strategyRef:Lcom/immomo/android/network/metrics/Strategy;

    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    .line 91
    .line 92
    new-instance v1, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1$1;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1$1;-><init>(Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;->this$0:Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;

    .line 98
    .line 99
    iget-object p0, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1;->this$0:Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1;->$map:Ljava/util/Map;

    .line 102
    .line 103
    invoke-static {p2, p1, v0, v1, p0}, Lcom/immomo/android/network/metrics/StrategyFetcher;->a(Lcom/immomo/android/network/metrics/StrategyFetcher;Ll/apl;Lcom/immomo/android/network/metrics/Strategy;Lkotlin/jvm/functions/Function0;Ljava/util/Map;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    .line 105
    .line 106
    :cond_2
    return-void

    .line 107
    :catch_0
    sget-object p0, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->INSTANCE:Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->f()Lcom/immomo/android/network/metrics/NetworkMetricsStatistics$a;

    .line 110
    .line 111
    .line 112
    return-void
.end method
