.class final Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;
.super Lnicoid/network238/okhttp3/EventListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/EventListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AggregateEventListener"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0092\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0011\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0010\u000b\n\u0002\u0008\u000b\u0008\u0002\u0018\u00002\u00020\u0001B\u0015\u0012\u000c\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0017\u0010\t\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u001f\u0010\r\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001f\u0010\u000f\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u000eJ\u001f\u0010\u0012\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0011\u001a\u00020\u0010H\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J-\u0010\u0017\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0011\u001a\u00020\u00102\u000c\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u00020\u00150\u0014H\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u001f\u0010\u001b\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u001a\u001a\u00020\u0019H\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ-\u0010\u001f\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u001a\u001a\u00020\u00192\u000c\u0010\u001e\u001a\u0008\u0012\u0004\u0012\u00020\u001d0\u0014H\u0016\u00a2\u0006\u0004\u0008\u001f\u0010 J\'\u0010$\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\"\u001a\u00020!2\u0006\u0010#\u001a\u00020\u0015H\u0016\u00a2\u0006\u0004\u0008$\u0010%J\u0017\u0010&\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008&\u0010\nJ!\u0010)\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0008\u0010(\u001a\u0004\u0018\u00010\'H\u0016\u00a2\u0006\u0004\u0008)\u0010*J1\u0010-\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\"\u001a\u00020!2\u0006\u0010#\u001a\u00020\u00152\u0008\u0010,\u001a\u0004\u0018\u00010+H\u0016\u00a2\u0006\u0004\u0008-\u0010.J9\u00101\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\"\u001a\u00020!2\u0006\u0010#\u001a\u00020\u00152\u0008\u0010,\u001a\u0004\u0018\u00010+2\u0006\u00100\u001a\u00020/H\u0016\u00a2\u0006\u0004\u00081\u00102J\u001f\u00105\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u00104\u001a\u000203H\u0016\u00a2\u0006\u0004\u00085\u00106J\u001f\u00107\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u00104\u001a\u000203H\u0016\u00a2\u0006\u0004\u00087\u00106J\u0017\u00108\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u00088\u0010\nJ\u001f\u0010;\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010:\u001a\u000209H\u0016\u00a2\u0006\u0004\u0008;\u0010<J\u0017\u0010=\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008=\u0010\nJ\u001f\u0010@\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010?\u001a\u00020>H\u0016\u00a2\u0006\u0004\u0008@\u0010AJ\u001f\u0010B\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u00100\u001a\u00020/H\u0016\u00a2\u0006\u0004\u0008B\u0010CJ\u0017\u0010D\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008D\u0010\nJ\u001f\u0010G\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010F\u001a\u00020EH\u0016\u00a2\u0006\u0004\u0008G\u0010HJ\u0017\u0010I\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008I\u0010\nJ\u001f\u0010J\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010?\u001a\u00020>H\u0016\u00a2\u0006\u0004\u0008J\u0010AJ\u001f\u0010K\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u00100\u001a\u00020/H\u0016\u00a2\u0006\u0004\u0008K\u0010CJ\u0017\u0010L\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008L\u0010\nJ\u001f\u0010M\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u00100\u001a\u00020/H\u0016\u00a2\u0006\u0004\u0008M\u0010CJ\u0017\u0010N\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008N\u0010\nJ\u001f\u0010O\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010F\u001a\u00020EH\u0016\u00a2\u0006\u0004\u0008O\u0010HJ\u001f\u0010P\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010F\u001a\u00020EH\u0016\u00a2\u0006\u0004\u0008P\u0010HJ\u0017\u0010Q\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008Q\u0010\nJ\u001f\u0010S\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010R\u001a\u00020EH\u0016\u00a2\u0006\u0004\u0008S\u0010HJ\'\u0010W\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010T\u001a\u00020/2\u0006\u0010V\u001a\u00020UH\u0016\u00a2\u0006\u0004\u0008W\u0010XJ)\u0010[\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010Y\u001a\u00020E2\u0008\u0010Z\u001a\u0004\u0018\u000109H\u0016\u00a2\u0006\u0004\u0008[\u0010\\R\u001d\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0003\u0010]\u001a\u0004\u0008^\u0010_\u00a8\u0006`"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;",
        "Lnicoid/network238/okhttp3/EventListener;",
        "",
        "eventListeners",
        "<init>",
        "([Lnicoid/network238/okhttp3/EventListener;)V",
        "Lnicoid/network238/okhttp3/Call;",
        "call",
        "",
        "callStart",
        "(Lnicoid/network238/okhttp3/Call;)V",
        "Lnicoid/network238/okhttp3/Dispatcher;",
        "dispatcher",
        "dispatcherQueueStart",
        "(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Dispatcher;)V",
        "dispatcherQueueEnd",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "url",
        "proxySelectStart",
        "(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/HttpUrl;)V",
        "",
        "Ljava/net/Proxy;",
        "proxies",
        "proxySelectEnd",
        "(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/HttpUrl;Ljava/util/List;)V",
        "",
        "domainName",
        "dnsStart",
        "(Lnicoid/network238/okhttp3/Call;Ljava/lang/String;)V",
        "Ljava/net/InetAddress;",
        "inetAddressList",
        "dnsEnd",
        "(Lnicoid/network238/okhttp3/Call;Ljava/lang/String;Ljava/util/List;)V",
        "Ljava/net/InetSocketAddress;",
        "inetSocketAddress",
        "proxy",
        "connectStart",
        "(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V",
        "secureConnectStart",
        "Lnicoid/network238/okhttp3/Handshake;",
        "handshake",
        "secureConnectEnd",
        "(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Handshake;)V",
        "Lnicoid/network238/okhttp3/Protocol;",
        "protocol",
        "connectEnd",
        "(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Protocol;)V",
        "Ljava/io/IOException;",
        "ioe",
        "connectFailed",
        "(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Protocol;Ljava/io/IOException;)V",
        "Lnicoid/network238/okhttp3/Connection;",
        "connection",
        "connectionAcquired",
        "(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Connection;)V",
        "connectionReleased",
        "requestHeadersStart",
        "Lnicoid/network238/okhttp3/Request;",
        "request",
        "requestHeadersEnd",
        "(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Request;)V",
        "requestBodyStart",
        "",
        "byteCount",
        "requestBodyEnd",
        "(Lnicoid/network238/okhttp3/Call;J)V",
        "requestFailed",
        "(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V",
        "responseHeadersStart",
        "Lnicoid/network238/okhttp3/Response;",
        "response",
        "responseHeadersEnd",
        "(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V",
        "responseBodyStart",
        "responseBodyEnd",
        "responseFailed",
        "callEnd",
        "callFailed",
        "canceled",
        "satisfactionFailure",
        "cacheHit",
        "cacheMiss",
        "cachedResponse",
        "cacheConditionalHit",
        "exception",
        "",
        "retry",
        "retryDecision",
        "(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;Z)V",
        "networkResponse",
        "nextRequest",
        "followUpDecision",
        "(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Request;)V",
        "[Lnicoid/network238/okhttp3/EventListener;",
        "getEventListeners",
        "()[Lnicoid/network238/okhttp3/EventListener;",
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
.field private final eventListeners:[Lnicoid/network238/okhttp3/EventListener;


# direct methods
.method public constructor <init>([Lnicoid/network238/okhttp3/EventListener;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 576
    invoke-direct {p0}, Lnicoid/network238/okhttp3/EventListener;-><init>()V

    .line 577
    iput-object p1, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    return-void
.end method


# virtual methods
.method public cacheConditionalHit(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 834
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 835
    invoke-virtual {v3, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->cacheConditionalHit(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public cacheHit(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 819
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 820
    invoke-virtual {v3, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->cacheHit(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public cacheMiss(Lnicoid/network238/okhttp3/Call;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 825
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 826
    invoke-virtual {v3, p1}, Lnicoid/network238/okhttp3/EventListener;->cacheMiss(Lnicoid/network238/okhttp3/Call;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public callEnd(Lnicoid/network238/okhttp3/Call;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 786
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 787
    invoke-virtual {v3, p1}, Lnicoid/network238/okhttp3/EventListener;->callEnd(Lnicoid/network238/okhttp3/Call;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public callFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 795
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 796
    invoke-virtual {v3, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->callFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public callStart(Lnicoid/network238/okhttp3/Call;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 580
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 581
    invoke-virtual {v3, p1}, Lnicoid/network238/okhttp3/EventListener;->callStart(Lnicoid/network238/okhttp3/Call;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public canceled(Lnicoid/network238/okhttp3/Call;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 801
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 802
    invoke-virtual {v3, p1}, Lnicoid/network238/okhttp3/EventListener;->canceled(Lnicoid/network238/okhttp3/Call;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public connectEnd(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Protocol;)V
    .registers 9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 672
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 673
    invoke-virtual {v3, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/EventListener;->connectEnd(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Protocol;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public connectFailed(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Protocol;Ljava/io/IOException;)V
    .registers 15

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 684
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 685
    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    move-object v8, p5

    invoke-virtual/range {v3 .. v8}, Lnicoid/network238/okhttp3/EventListener;->connectFailed(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Protocol;Ljava/io/IOException;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public connectStart(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 646
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 647
    invoke-virtual {v3, p1, p2, p3}, Lnicoid/network238/okhttp3/EventListener;->connectStart(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public connectionAcquired(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Connection;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 693
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 694
    invoke-virtual {v3, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->connectionAcquired(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Connection;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public connectionReleased(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Connection;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 702
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 703
    invoke-virtual {v3, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->connectionReleased(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Connection;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public dispatcherQueueEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Dispatcher;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 598
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 599
    invoke-virtual {v3, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->dispatcherQueueEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Dispatcher;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public dispatcherQueueStart(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Dispatcher;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 589
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 590
    invoke-virtual {v3, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->dispatcherQueueStart(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Dispatcher;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public dnsEnd(Lnicoid/network238/okhttp3/Call;Ljava/lang/String;Ljava/util/List;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/Call;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/net/InetAddress;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 636
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 637
    invoke-virtual {v3, p1, p2, p3}, Lnicoid/network238/okhttp3/EventListener;->dnsEnd(Lnicoid/network238/okhttp3/Call;Ljava/lang/String;Ljava/util/List;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public dnsStart(Lnicoid/network238/okhttp3/Call;Ljava/lang/String;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 626
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 627
    invoke-virtual {v3, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->dnsStart(Lnicoid/network238/okhttp3/Call;Ljava/lang/String;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public followUpDecision(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Request;)V
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 854
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 855
    invoke-virtual {v3, p1, p2, p3}, Lnicoid/network238/okhttp3/EventListener;->followUpDecision(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Request;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final getEventListeners()[Lnicoid/network238/okhttp3/EventListener;
    .registers 2

    .line 577
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    return-object v0
.end method

.method public proxySelectEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/HttpUrl;Ljava/util/List;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/Call;",
            "Lnicoid/network238/okhttp3/HttpUrl;",
            "Ljava/util/List<",
            "Ljava/net/Proxy;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 617
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 618
    invoke-virtual {v3, p1, p2, p3}, Lnicoid/network238/okhttp3/EventListener;->proxySelectEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/HttpUrl;Ljava/util/List;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public proxySelectStart(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/HttpUrl;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 607
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 608
    invoke-virtual {v3, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->proxySelectStart(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/HttpUrl;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public requestBodyEnd(Lnicoid/network238/okhttp3/Call;J)V
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 732
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 733
    invoke-virtual {v3, p1, p2, p3}, Lnicoid/network238/okhttp3/EventListener;->requestBodyEnd(Lnicoid/network238/okhttp3/Call;J)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public requestBodyStart(Lnicoid/network238/okhttp3/Call;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 723
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 724
    invoke-virtual {v3, p1}, Lnicoid/network238/okhttp3/EventListener;->requestBodyStart(Lnicoid/network238/okhttp3/Call;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public requestFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 741
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 742
    invoke-virtual {v3, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->requestFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public requestHeadersEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Request;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 717
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 718
    invoke-virtual {v3, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->requestHeadersEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Request;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public requestHeadersStart(Lnicoid/network238/okhttp3/Call;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 708
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 709
    invoke-virtual {v3, p1}, Lnicoid/network238/okhttp3/EventListener;->requestHeadersStart(Lnicoid/network238/okhttp3/Call;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public responseBodyEnd(Lnicoid/network238/okhttp3/Call;J)V
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 771
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 772
    invoke-virtual {v3, p1, p2, p3}, Lnicoid/network238/okhttp3/EventListener;->responseBodyEnd(Lnicoid/network238/okhttp3/Call;J)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public responseBodyStart(Lnicoid/network238/okhttp3/Call;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 762
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 763
    invoke-virtual {v3, p1}, Lnicoid/network238/okhttp3/EventListener;->responseBodyStart(Lnicoid/network238/okhttp3/Call;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public responseFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 780
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 781
    invoke-virtual {v3, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->responseFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public responseHeadersEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 756
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 757
    invoke-virtual {v3, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->responseHeadersEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public responseHeadersStart(Lnicoid/network238/okhttp3/Call;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 747
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 748
    invoke-virtual {v3, p1}, Lnicoid/network238/okhttp3/EventListener;->responseHeadersStart(Lnicoid/network238/okhttp3/Call;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public retryDecision(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;Z)V
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 844
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 845
    invoke-virtual {v3, p1, p2, p3}, Lnicoid/network238/okhttp3/EventListener;->retryDecision(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public satisfactionFailure(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 810
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 811
    invoke-virtual {v3, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->satisfactionFailure(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public secureConnectEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Handshake;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 661
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 662
    invoke-virtual {v3, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->secureConnectEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Handshake;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public secureConnectStart(Lnicoid/network238/okhttp3/Call;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 652
    iget-object v0, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->eventListeners:[Lnicoid/network238/okhttp3/EventListener;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 653
    invoke-virtual {v3, p1}, Lnicoid/network238/okhttp3/EventListener;->secureConnectStart(Lnicoid/network238/okhttp3/Call;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
