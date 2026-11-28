.class public abstract Lnicoid/network238/okhttp3/EventListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;,
        Lnicoid/network238/okhttp3/EventListener$Companion;,
        Lnicoid/network238/okhttp3/EventListener$Factory;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u008e\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0010\u000b\n\u0002\u0008\u000e\u0008&\u0018\u0000 ^2\u00020\u0001:\u0003_^`B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u001f\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u001f\u0010\r\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000cJ\u001f\u0010\u0010\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u000f\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J-\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u000f\u001a\u00020\u000e2\u000c\u0010\u0014\u001a\u0008\u0012\u0004\u0012\u00020\u00130\u0012H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u001f\u0010\u0019\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0018\u001a\u00020\u0017H\u0016\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ-\u0010\u001d\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0018\u001a\u00020\u00172\u000c\u0010\u001c\u001a\u0008\u0012\u0004\u0012\u00020\u001b0\u0012H\u0016\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\'\u0010\"\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010 \u001a\u00020\u001f2\u0006\u0010!\u001a\u00020\u0013H\u0016\u00a2\u0006\u0004\u0008\"\u0010#J\u0017\u0010$\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008$\u0010\u0008J!\u0010\'\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0010&\u001a\u0004\u0018\u00010%H\u0016\u00a2\u0006\u0004\u0008\'\u0010(J1\u0010+\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010 \u001a\u00020\u001f2\u0006\u0010!\u001a\u00020\u00132\u0008\u0010*\u001a\u0004\u0018\u00010)H\u0016\u00a2\u0006\u0004\u0008+\u0010,J9\u0010/\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010 \u001a\u00020\u001f2\u0006\u0010!\u001a\u00020\u00132\u0008\u0010*\u001a\u0004\u0018\u00010)2\u0006\u0010.\u001a\u00020-H\u0016\u00a2\u0006\u0004\u0008/\u00100J\u001f\u00103\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u00102\u001a\u000201H\u0016\u00a2\u0006\u0004\u00083\u00104J\u001f\u00105\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u00102\u001a\u000201H\u0016\u00a2\u0006\u0004\u00085\u00104J\u0017\u00106\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u00086\u0010\u0008J\u001f\u00109\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u00108\u001a\u000207H\u0016\u00a2\u0006\u0004\u00089\u0010:J\u0017\u0010;\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008;\u0010\u0008J\u001f\u0010>\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010=\u001a\u00020<H\u0016\u00a2\u0006\u0004\u0008>\u0010?J\u001f\u0010@\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010.\u001a\u00020-H\u0016\u00a2\u0006\u0004\u0008@\u0010AJ\u0017\u0010B\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008B\u0010\u0008J\u001f\u0010E\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010D\u001a\u00020CH\u0016\u00a2\u0006\u0004\u0008E\u0010FJ\u0017\u0010G\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008G\u0010\u0008J\u001f\u0010H\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010=\u001a\u00020<H\u0016\u00a2\u0006\u0004\u0008H\u0010?J\u001f\u0010I\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010.\u001a\u00020-H\u0016\u00a2\u0006\u0004\u0008I\u0010AJ\u0017\u0010J\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008J\u0010\u0008J\u001f\u0010K\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010.\u001a\u00020-H\u0016\u00a2\u0006\u0004\u0008K\u0010AJ\u0017\u0010L\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008L\u0010\u0008J\u001f\u0010M\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010D\u001a\u00020CH\u0016\u00a2\u0006\u0004\u0008M\u0010FJ\u001f\u0010N\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010D\u001a\u00020CH\u0016\u00a2\u0006\u0004\u0008N\u0010FJ\u0017\u0010O\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008O\u0010\u0008J\u001f\u0010Q\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010P\u001a\u00020CH\u0016\u00a2\u0006\u0004\u0008Q\u0010FJ\'\u0010U\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010R\u001a\u00020-2\u0006\u0010T\u001a\u00020SH\u0016\u00a2\u0006\u0004\u0008U\u0010VJ)\u0010Y\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010W\u001a\u00020C2\u0008\u0010X\u001a\u0004\u0018\u000107H\u0016\u00a2\u0006\u0004\u0008Y\u0010ZJ\u0018\u0010\\\u001a\u00020\u00002\u0006\u0010[\u001a\u00020\u0000H\u0086\u0002\u00a2\u0006\u0004\u0008\\\u0010]\u00a8\u0006a"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/EventListener;",
        "",
        "<init>",
        "()V",
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
        "other",
        "plus",
        "(Lnicoid/network238/okhttp3/EventListener;)Lnicoid/network238/okhttp3/EventListener;",
        "Companion",
        "Factory",
        "AggregateEventListener",
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


# static fields
.field public static final Companion:Lnicoid/network238/okhttp3/EventListener$Companion;

.field public static final NONE:Lnicoid/network238/okhttp3/EventListener;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/EventListener$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/EventListener$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/EventListener;->Companion:Lnicoid/network238/okhttp3/EventListener$Companion;

    .line 572
    new-instance v0, Lnicoid/network238/okhttp3/EventListener$Companion$NONE$1;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/EventListener$Companion$NONE$1;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/EventListener;->NONE:Lnicoid/network238/okhttp3/EventListener;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cacheConditionalHit(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public cacheHit(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public cacheMiss(Lnicoid/network238/okhttp3/Call;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public callEnd(Lnicoid/network238/okhttp3/Call;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public callFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public callStart(Lnicoid/network238/okhttp3/Call;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public canceled(Lnicoid/network238/okhttp3/Call;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public connectEnd(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Protocol;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public connectFailed(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Protocol;Ljava/io/IOException;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public connectStart(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public connectionAcquired(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Connection;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public connectionReleased(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Connection;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public dispatcherQueueEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Dispatcher;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public dispatcherQueueStart(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Dispatcher;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public dnsEnd(Lnicoid/network238/okhttp3/Call;Ljava/lang/String;Ljava/util/List;)V
    .registers 4
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

    return-void
.end method

.method public dnsStart(Lnicoid/network238/okhttp3/Call;Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public followUpDecision(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Request;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public final plus(Lnicoid/network238/okhttp3/EventListener;)Lnicoid/network238/okhttp3/EventListener;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 542
    sget-object v0, Lnicoid/network238/okhttp3/EventListener;->NONE:Lnicoid/network238/okhttp3/EventListener;

    if-ne p0, v0, :cond_0

    return-object p1

    .line 543
    :cond_0
    instance-of v1, p0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    move-object v1, p0

    check-cast v1, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->getEventListeners()[Lnicoid/network238/okhttp3/EventListener;

    move-result-object v1

    goto :goto_0

    .line 544
    :cond_1
    new-array v1, v3, [Lnicoid/network238/okhttp3/EventListener;

    aput-object p0, v1, v2

    :goto_0
    if-ne p1, v0, :cond_2

    return-object p0

    .line 549
    :cond_2
    instance-of v0, p1, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;

    if-eqz v0, :cond_3

    check-cast p1, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;->getEventListeners()[Lnicoid/network238/okhttp3/EventListener;

    move-result-object p1

    goto :goto_1

    .line 550
    :cond_3
    new-array v0, v3, [Lnicoid/network238/okhttp3/EventListener;

    aput-object p1, v0, v2

    move-object p1, v0

    .line 553
    :goto_1
    new-instance v0, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;

    invoke-static {v1, p1}, Lnicoid/network238/kotlin/collections/ArraysKt;->plus([Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lnicoid/network238/okhttp3/EventListener;

    invoke-direct {v0, p1}, Lnicoid/network238/okhttp3/EventListener$AggregateEventListener;-><init>([Lnicoid/network238/okhttp3/EventListener;)V

    return-object v0
.end method

.method public proxySelectEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/HttpUrl;Ljava/util/List;)V
    .registers 4
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

    return-void
.end method

.method public proxySelectStart(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/HttpUrl;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public requestBodyEnd(Lnicoid/network238/okhttp3/Call;J)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public requestBodyStart(Lnicoid/network238/okhttp3/Call;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public requestFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public requestHeadersEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Request;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public requestHeadersStart(Lnicoid/network238/okhttp3/Call;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public responseBodyEnd(Lnicoid/network238/okhttp3/Call;J)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public responseBodyStart(Lnicoid/network238/okhttp3/Call;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public responseFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public responseHeadersEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public responseHeadersStart(Lnicoid/network238/okhttp3/Call;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public retryDecision(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;Z)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public satisfactionFailure(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public secureConnectEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Handshake;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public secureConnectStart(Lnicoid/network238/okhttp3/Call;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method
