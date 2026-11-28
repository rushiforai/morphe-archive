.class public final Lnicoid/network238/okhttp3/internal/connection/SequentialExchangeFinder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\u0008\u0001\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\u0008\u001a\u00020\tH\u0016R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\n"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/SequentialExchangeFinder;",
        "Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;",
        "routePlanner",
        "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;)V",
        "getRoutePlanner",
        "()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;",
        "find",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final routePlanner:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/SequentialExchangeFinder;->routePlanner:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;

    return-void
.end method


# virtual methods
.method public find()Lnicoid/network238/okhttp3/internal/connection/RealConnection;
    .registers 6

    const/4 v0, 0x0

    move-object v1, v0

    .line 29
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/SequentialExchangeFinder;->getRoutePlanner()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;

    move-result-object v2

    invoke-interface {v2}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;->isCanceled()Z

    move-result v2

    if-nez v2, :cond_6

    .line 32
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/SequentialExchangeFinder;->getRoutePlanner()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;

    move-result-object v2

    invoke-interface {v2}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;->plan()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    move-result-object v2

    .line 34
    invoke-interface {v2}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;->isReady()Z

    move-result v3

    if-nez v3, :cond_2

    .line 35
    invoke-interface {v2}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;->connectTcp()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    move-result-object v3

    .line 38
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->isSuccess()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;->connectTlsEtc()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    move-result-object v3

    .line 42
    :cond_0
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->component2()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    move-result-object v4

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->component3()Ljava/lang/Throwable;

    move-result-object v3

    if-nez v3, :cond_1

    if-eqz v4, :cond_2

    .line 46
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/SequentialExchangeFinder;->getRoutePlanner()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;

    move-result-object v2

    invoke-interface {v2}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;->getDeferredPlans()Lnicoid/network238/kotlin/collections/ArrayDeque;

    move-result-object v2

    invoke-virtual {v2, v4}, Lnicoid/network238/kotlin/collections/ArrayDeque;->addFirst(Ljava/lang/Object;)V

    goto :goto_0

    .line 44
    :cond_1
    throw v3

    .line 50
    :cond_2
    invoke-interface {v2}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;->handleSuccess()Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v2

    if-nez v1, :cond_3

    move-object v1, v2

    goto :goto_1

    .line 55
    :cond_3
    invoke-static {v1, v2}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 57
    :goto_1
    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/connection/RetryTlsHandshakeKt;->attemptAnotherConnection(Ljava/io/IOException;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 60
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/SequentialExchangeFinder;->getRoutePlanner()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v2, v0, v3, v0}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;->hasNext$default(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;Lnicoid/network238/okhttp3/internal/connection/RealConnection;ILjava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_0

    .line 61
    :cond_4
    throw v1

    .line 58
    :cond_5
    throw v1

    .line 29
    :cond_6
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Canceled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getRoutePlanner()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;
    .registers 2

    .line 24
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/SequentialExchangeFinder;->routePlanner:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;

    return-object v0
.end method
