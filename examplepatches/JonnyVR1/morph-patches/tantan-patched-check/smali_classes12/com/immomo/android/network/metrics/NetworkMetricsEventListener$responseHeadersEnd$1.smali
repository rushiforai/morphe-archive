.class final Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->responseHeadersEnd(Ll/ry3;Ll/i5d0;)V
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
.field final synthetic $call:Ll/ry3;

.field final synthetic $response:Ll/i5d0;

.field final synthetic this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;


# direct methods
.method public constructor <init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;Ll/i5d0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;->$call:Ll/ry3;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;->$response:Ll/i5d0;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 71
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;->invoke()V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->f()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/t4f;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;->$call:Ll/ry3;

    .line 24
    .line 25
    iget-object v3, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;->$response:Ll/i5d0;

    .line 26
    .line 27
    invoke-virtual {v1, v2, v3}, Ll/t4f;->responseHeadersEnd(Ll/ry3;Ll/i5d0;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->b(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;)Ll/t4f;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v1, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;->$call:Ll/ry3;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;->$response:Ll/i5d0;

    .line 42
    .line 43
    invoke-virtual {v0, v1, v2}, Ll/t4f;->responseHeadersEnd(Ll/ry3;Ll/i5d0;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->c(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;)Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 53
    .line 54
    .line 55
    move-result-wide v1

    .line 56
    invoke-virtual {v0, v1, v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->T(J)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->c(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;)Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;->$response:Ll/i5d0;

    .line 66
    .line 67
    invoke-virtual {v0, p0}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->P(Ll/i5d0;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method
