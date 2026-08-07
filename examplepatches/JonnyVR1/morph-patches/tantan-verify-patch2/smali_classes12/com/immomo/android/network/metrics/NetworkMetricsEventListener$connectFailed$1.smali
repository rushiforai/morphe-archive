.class final Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->connectFailed(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V
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

.field final synthetic $inetSocketAddress:Ljava/net/InetSocketAddress;

.field final synthetic $ioe:Ljava/io/IOException;

.field final synthetic $protocol:Lokhttp3/Protocol;

.field final synthetic $proxy:Ljava/net/Proxy;

.field final synthetic this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;


# direct methods
.method public constructor <init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$call:Ll/ry3;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$inetSocketAddress:Ljava/net/InetSocketAddress;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$proxy:Ljava/net/Proxy;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$protocol:Lokhttp3/Protocol;

    .line 10
    .line 11
    iput-object p6, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$ioe:Ljava/io/IOException;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 84
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->invoke()V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

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
    move-object v2, v1

    .line 22
    check-cast v2, Ll/t4f;

    .line 23
    .line 24
    iget-object v3, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$call:Ll/ry3;

    .line 25
    .line 26
    iget-object v4, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$inetSocketAddress:Ljava/net/InetSocketAddress;

    .line 27
    .line 28
    iget-object v5, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$proxy:Ljava/net/Proxy;

    .line 29
    .line 30
    iget-object v6, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$protocol:Lokhttp3/Protocol;

    .line 31
    .line 32
    iget-object v7, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$ioe:Ljava/io/IOException;

    .line 33
    .line 34
    invoke-virtual/range {v2 .. v7}, Ll/t4f;->connectFailed(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->b(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;)Ll/t4f;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    iget-object v2, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$call:Ll/ry3;

    .line 47
    .line 48
    iget-object v3, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$inetSocketAddress:Ljava/net/InetSocketAddress;

    .line 49
    .line 50
    iget-object v4, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$proxy:Ljava/net/Proxy;

    .line 51
    .line 52
    iget-object v5, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$protocol:Lokhttp3/Protocol;

    .line 53
    .line 54
    iget-object v6, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$ioe:Ljava/io/IOException;

    .line 55
    .line 56
    invoke-virtual/range {v1 .. v6}, Ll/t4f;->connectFailed(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->c(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;)Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 66
    .line 67
    .line 68
    move-result-wide v1

    .line 69
    invoke-virtual {v0, v1, v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->z(J)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 73
    .line 74
    invoke-static {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->c(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;)Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;->$ioe:Ljava/io/IOException;

    .line 79
    .line 80
    invoke-virtual {v0, p0}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->X(Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method
