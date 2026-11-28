.class public final Lnicoid/network238/okhttp3/internal/connection/RealCall;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Call;
.implements Ljava/lang/Cloneable;
.implements Lnicoid/network238/okhttp3/internal/concurrent/Lockable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;,
        Lnicoid/network238/okhttp3/internal/connection/RealCall$CallReference;,
        Lnicoid/network238/okhttp3/internal/connection/RealCall$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u00c7\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u001a\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010\u000e\n\u0002\u0008\u0006*\u0001\u001b\u0008\u0007\u0018\u0000 z2\u00020\u00012\u00020\u00022\u00020\u0003:\u0003xyzB\u001f\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0008\u0010\u001a\u001a\u00020=H\u0016J\u0010\u0010>\u001a\u00020?2\u0006\u0010\u0014\u001a\u00020\u0015H\u0016J\'\u0010@\u001a\u0004\u0018\u0001HA\"\u0008\u0008\u0000\u0010A*\u00020 2\u000c\u0010B\u001a\u0008\u0012\u0004\u0012\u0002HA0CH\u0016\u00a2\u0006\u0002\u0010DJ%\u0010@\u001a\u0004\u0018\u0001HA\"\u0004\u0008\u0000\u0010A2\u000e\u0010B\u001a\n\u0012\u0006\u0008\u0001\u0012\u0002HA0EH\u0016\u00a2\u0006\u0002\u0010FJ3\u0010@\u001a\u0002HA\"\u0008\u0008\u0000\u0010A*\u00020 2\u000c\u0010B\u001a\u0008\u0012\u0004\u0012\u0002HA0C2\u000c\u0010G\u001a\u0008\u0012\u0004\u0012\u0002HA0HH\u0016\u00a2\u0006\u0002\u0010IJ3\u0010@\u001a\u0002HA\"\u0008\u0008\u0000\u0010A*\u00020 2\u000c\u0010B\u001a\u0008\u0012\u0004\u0012\u0002HA0E2\u000c\u0010G\u001a\u0008\u0012\u0004\u0012\u0002HA0HH\u0016\u00a2\u0006\u0002\u0010JJ\u0008\u0010K\u001a\u00020\u0001H\u0016J\u0008\u0010L\u001a\u00020\u0007H\u0016J\u0008\u0010M\u001a\u00020?H\u0016J\u0008\u0010N\u001a\u00020\tH\u0016J\u0008\u0010O\u001a\u00020PH\u0016J\u0010\u0010Q\u001a\u00020?2\u0006\u0010R\u001a\u00020SH\u0016J\u0008\u0010T\u001a\u00020\tH\u0016J\u0008\u0010U\u001a\u00020?H\u0002J\r\u0010V\u001a\u00020PH\u0000\u00a2\u0006\u0002\u0008WJ\u001e\u0010X\u001a\u00020?2\u0006\u0010L\u001a\u00020\u00072\u0006\u0010Y\u001a\u00020\t2\u0006\u0010Z\u001a\u00020[J\u0015\u0010\\\u001a\u00020)2\u0006\u0010Z\u001a\u00020[H\u0000\u00a2\u0006\u0002\u0008]J\u000e\u0010^\u001a\u00020?2\u0006\u0010%\u001a\u00020$JI\u0010_\u001a\u0004\u0018\u00010`2\u0006\u00103\u001a\u00020)2\u0008\u0008\u0002\u0010a\u001a\u00020\t2\u0008\u0008\u0002\u0010b\u001a\u00020\t2\u0008\u0008\u0002\u0010c\u001a\u00020\t2\u0008\u0008\u0002\u0010d\u001a\u00020\t2\u0008\u0010e\u001a\u0004\u0018\u00010`H\u0000\u00a2\u0006\u0002\u0008fJ\u0019\u0010g\u001a\u0004\u0018\u00010`2\u0008\u0010e\u001a\u0004\u0018\u00010`H\u0000\u00a2\u0006\u0002\u0008hJ\u0014\u0010i\u001a\u0004\u0018\u00010`2\u0008\u0010e\u001a\u0004\u0018\u00010`H\u0002J\u000f\u0010j\u001a\u0004\u0018\u00010kH\u0000\u00a2\u0006\u0002\u0008lJ\u0014\u0010m\u001a\u0004\u0018\u00010`2\u0008\u0010n\u001a\u0004\u0018\u00010`H\u0002J\u0006\u0010(\u001a\u00020?J\u0006\u0010o\u001a\u00020?J\u0015\u0010p\u001a\u00020?2\u0006\u0010q\u001a\u00020\tH\u0000\u00a2\u0006\u0002\u0008rJ\u0006\u0010s\u001a\u00020\tJ\u0008\u0010t\u001a\u00020uH\u0002J\r\u0010v\u001a\u00020uH\u0000\u00a2\u0006\u0002\u0008wR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u0011\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0014\u001a\u00020\u0015X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0016\u0010\u0017\"\u0004\u0008\u0018\u0010\u0019R\u0010\u0010\u001a\u001a\u00020\u001bX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u001cR\u000e\u0010\u001d\u001a\u00020\u001eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u001f\u001a\u0004\u0018\u00010 X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010!\u001a\u0004\u0018\u00010\"X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\"\u0010%\u001a\u0004\u0018\u00010$2\u0008\u0010#\u001a\u0004\u0018\u00010$@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008&\u0010\'R\u000e\u0010(\u001a\u00020\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\"\u0010*\u001a\u0004\u0018\u00010)2\u0008\u0010#\u001a\u0004\u0018\u00010)@BX\u0080\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008+\u0010,R\u000e\u0010-\u001a\u00020\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010.\u001a\u00020\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010/\u001a\u00020\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00100\u001a\u00020\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00101\u001a\u00020\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00102\u001a\u00020\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u00103\u001a\u0004\u0018\u00010)X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u00104\u001a\u0008\u0012\u0004\u0012\u00020605X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00087\u00108R\u001c\u00109\u001a\u0010\u0012\u000c\u0012\n <*\u0004\u0018\u00010;0;0:X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006{"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "Lnicoid/network238/okhttp3/Call;",
        "",
        "Lnicoid/network238/okhttp3/internal/concurrent/Lockable;",
        "client",
        "Lnicoid/network238/okhttp3/OkHttpClient;",
        "originalRequest",
        "Lnicoid/network238/okhttp3/Request;",
        "forWebSocket",
        "",
        "<init>",
        "(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request;Z)V",
        "getClient",
        "()Lnicoid/network238/okhttp3/OkHttpClient;",
        "getOriginalRequest",
        "()Lnicoid/network238/okhttp3/Request;",
        "getForWebSocket",
        "()Z",
        "connectionPool",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;",
        "eventListener",
        "Lnicoid/network238/okhttp3/EventListener;",
        "getEventListener$okhttp",
        "()Lnicoid/network238/okhttp3/EventListener;",
        "setEventListener$okhttp",
        "(Lnicoid/network238/okhttp3/EventListener;)V",
        "timeout",
        "nicoid/network238/okhttp3/internal/connection/RealCall$timeout$1",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;",
        "executed",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "callStackTrace",
        "",
        "exchangeFinder",
        "Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;",
        "value",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "connection",
        "getConnection",
        "()Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "timeoutEarlyExit",
        "Lnicoid/network238/okhttp3/internal/connection/Exchange;",
        "interceptorScopedExchange",
        "getInterceptorScopedExchange$okhttp",
        "()Lnicoid/network238/okhttp3/internal/connection/Exchange;",
        "requestBodyOpen",
        "responseBodyOpen",
        "socketSinkOpen",
        "socketSourceOpen",
        "expectMoreExchanges",
        "canceled",
        "exchange",
        "plansToCancel",
        "Ljava/util/concurrent/CopyOnWriteArrayList;",
        "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;",
        "getPlansToCancel$okhttp",
        "()Ljava/util/concurrent/CopyOnWriteArrayList;",
        "tags",
        "Ljava/util/concurrent/atomic/AtomicReference;",
        "Lnicoid/network238/okhttp3/internal/Tags;",
        "nicoid.network238.kotlin.jvm.PlatformType",
        "Lnicoid/network238/okio/Timeout;",
        "addEventListener",
        "",
        "tag",
        "T",
        "type",
        "Lnicoid/network238/kotlin/reflect/KClass;",
        "(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;",
        "Ljava/lang/Class;",
        "(Ljava/lang/Class;)Ljava/lang/Object;",
        "computeIfAbsent",
        "Lnicoid/network238/kotlin/Function0;",
        "(Lnicoid/network238/kotlin/reflect/KClass;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;",
        "(Ljava/lang/Class;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;",
        "clone",
        "request",
        "cancel",
        "isCanceled",
        "execute",
        "Lnicoid/network238/okhttp3/Response;",
        "enqueue",
        "responseCallback",
        "Lnicoid/network238/okhttp3/Callback;",
        "isExecuted",
        "callStart",
        "getResponseWithInterceptorChain",
        "getResponseWithInterceptorChain$okhttp",
        "enterNetworkInterceptorExchange",
        "newRoutePlanner",
        "chain",
        "Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;",
        "initExchange",
        "initExchange$okhttp",
        "acquireConnectionNoEvents",
        "messageDone",
        "Ljava/io/IOException;",
        "requestDone",
        "responseDone",
        "socketSourceDone",
        "socketSinkDone",
        "e",
        "messageDone$okhttp",
        "noMoreExchanges",
        "noMoreExchanges$okhttp",
        "callDone",
        "releaseConnectionNoEvents",
        "Ljava/net/Socket;",
        "releaseConnectionNoEvents$okhttp",
        "timeoutExit",
        "cause",
        "upgradeToSocket",
        "exitNetworkInterceptorExchange",
        "closeExchange",
        "exitNetworkInterceptorExchange$okhttp",
        "retryAfterFailure",
        "toLoggableString",
        "",
        "redactedUrl",
        "redactedUrl$okhttp",
        "AsyncCall",
        "CallReference",
        "Companion",
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
.field private static final Companion:Lnicoid/network238/okhttp3/internal/connection/RealCall$Companion;

.field private static final eventListenerUpdater:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater<",
            "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
            "Lnicoid/network238/okhttp3/EventListener;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private callStackTrace:Ljava/lang/Object;

.field private volatile canceled:Z

.field private final client:Lnicoid/network238/okhttp3/OkHttpClient;

.field private connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

.field private final connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

.field private volatile eventListener:Lnicoid/network238/okhttp3/EventListener;

.field private volatile exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

.field private exchangeFinder:Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;

.field private final executed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private expectMoreExchanges:Z

.field private final forWebSocket:Z

.field private interceptorScopedExchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

.field private final originalRequest:Lnicoid/network238/okhttp3/Request;

.field private final plansToCancel:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;",
            ">;"
        }
    .end annotation
.end field

.field private requestBodyOpen:Z

.field private responseBodyOpen:Z

.field private socketSinkOpen:Z

.field private socketSourceOpen:Z

.field private final tags:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lnicoid/network238/okhttp3/internal/Tags;",
            ">;"
        }
    .end annotation
.end field

.field private final timeout:Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;

.field private timeoutEarlyExit:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RealCall$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->Companion:Lnicoid/network238/okhttp3/internal/connection/RealCall$Companion;

    .line 622
    const-class v0, Lnicoid/network238/okhttp3/EventListener;

    const-string v1, "eventListener"

    const-class v2, Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-static {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->eventListenerUpdater:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request;Z)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    .line 69
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->originalRequest:Lnicoid/network238/okhttp3/Request;

    .line 70
    iput-boolean p3, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->forWebSocket:Z

    .line 74
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->connectionPool()Lnicoid/network238/okhttp3/ConnectionPool;

    move-result-object p3

    invoke-virtual {p3}, Lnicoid/network238/okhttp3/ConnectionPool;->getDelegate$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    move-result-object p3

    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    .line 77
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->eventListenerFactory()Lnicoid/network238/okhttp3/EventListener$Factory;

    move-result-object p3

    invoke-interface {p3, p0}, Lnicoid/network238/okhttp3/EventListener$Factory;->create(Lnicoid/network238/okhttp3/Call;)Lnicoid/network238/okhttp3/EventListener;

    move-result-object p3

    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->eventListener:Lnicoid/network238/okhttp3/EventListener;

    .line 80
    new-instance p3, Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;

    invoke-direct {p3, p0}, Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;-><init>(Lnicoid/network238/okhttp3/internal/connection/RealCall;)V

    .line 85
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->callTimeoutMillis()I

    move-result p1

    int-to-long v0, p1

    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p3, v0, v1, p1}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 84
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->timeout:Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;

    .line 88
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->executed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 119
    const/4 p1, 0x1

    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->expectMoreExchanges:Z

    .line 127
    new-instance p1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->plansToCancel:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 129
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Request;->getTags$okhttp()Lnicoid/network238/okhttp3/internal/Tags;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->tags:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public static final synthetic access$getEventListenerUpdater$cp()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;
    .registers 1

    .line 65
    sget-object v0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->eventListenerUpdater:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    return-object v0
.end method

.method public static final synthetic access$getTimeout$p(Lnicoid/network238/okhttp3/internal/connection/RealCall;)Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;
    .registers 1

    .line 65
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->timeout:Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;

    return-object p0
.end method

.method public static final synthetic access$toLoggableString(Lnicoid/network238/okhttp3/internal/connection/RealCall;)Ljava/lang/String;
    .registers 1

    .line 65
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->toLoggableString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private final callDone(Ljava/io/IOException;)Ljava/io/IOException;
    .registers 5

    .line 640
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 641
    new-instance p1, Ljava/lang/AssertionError;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Thread "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " MUST NOT hold lock on "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 411
    :cond_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    if-eqz v1, :cond_6

    if-eqz v0, :cond_2

    .line 644
    invoke-static {v1}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 645
    :cond_1
    new-instance p1, Ljava/lang/AssertionError;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Thread "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " MUST NOT hold lock on "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 648
    :cond_2
    :goto_0
    monitor-enter v1

    .line 417
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->releaseConnectionNoEvents$okhttp()Ljava/net/Socket;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 648
    monitor-exit v1

    .line 419
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    if-nez v2, :cond_4

    if-eqz v0, :cond_3

    .line 420
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    .line 421
    :cond_3
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->eventListener:Lnicoid/network238/okhttp3/EventListener;

    invoke-virtual {v2, p0, v1}, Lnicoid/network238/okhttp3/EventListener;->connectionReleased(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Connection;)V

    .line 422
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object v2

    invoke-virtual {v2, v1, p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->connectionReleased(Lnicoid/network238/okhttp3/Connection;Lnicoid/network238/okhttp3/Call;)V

    if-eqz v0, :cond_6

    .line 424
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object v0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->connectionClosed(Lnicoid/network238/okhttp3/Connection;)V

    goto :goto_1

    :cond_4
    if-nez v0, :cond_5

    goto :goto_1

    .line 427
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Check failed."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    .line 648
    monitor-exit v1

    throw p1

    .line 431
    :cond_6
    :goto_1
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->timeoutExit(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    .line 435
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->eventListener:Lnicoid/network238/okhttp3/EventListener;

    if-eqz p1, :cond_7

    .line 433
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, p0, v0}, Lnicoid/network238/okhttp3/EventListener;->callFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    return-object v0

    .line 435
    :cond_7
    invoke-virtual {v1, p0}, Lnicoid/network238/okhttp3/EventListener;->callEnd(Lnicoid/network238/okhttp3/Call;)V

    return-object v0
.end method

.method private final callStart()V
    .registers 3

    .line 205
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v0

    const-string v1, "response.body().close()"

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->getStackTraceForCloseable(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->callStackTrace:Ljava/lang/Object;

    .line 206
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->eventListener:Lnicoid/network238/okhttp3/EventListener;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/EventListener;->callStart(Lnicoid/network238/okhttp3/Call;)V

    return-void
.end method

.method public static synthetic messageDone$okhttp$default(Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/Exchange;ZZZZLjava/io/IOException;ILjava/lang/Object;)Ljava/io/IOException;
    .registers 10

    and-int/lit8 p8, p7, 0x2

    const/4 v0, 0x0

    if-eqz p8, :cond_0

    move p2, v0

    :cond_0
    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_1

    move p3, v0

    :cond_1
    and-int/lit8 p8, p7, 0x8

    if-eqz p8, :cond_2

    move p4, v0

    :cond_2
    and-int/lit8 p7, p7, 0x10

    if-eqz p7, :cond_3

    move p5, v0

    .line 336
    :cond_3
    invoke-virtual/range {p0 .. p6}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->messageDone$okhttp(Lnicoid/network238/okhttp3/internal/connection/Exchange;ZZZZLjava/io/IOException;)Ljava/io/IOException;

    move-result-object p0

    return-object p0
.end method

.method private final timeoutExit(Ljava/io/IOException;)Ljava/io/IOException;
    .registers 4

    .line 466
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->timeoutEarlyExit:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 467
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->timeout:Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;

    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v0

    if-nez v0, :cond_1

    :goto_0
    return-object p1

    .line 469
    :cond_1
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "timeout"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    if-eqz p1, :cond_2

    .line 470
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    :cond_2
    return-object v0
.end method

.method private final toLoggableString()Ljava/lang/String;
    .registers 3

    .line 524
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->isCanceled()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "canceled "

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 525
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->forWebSocket:Z

    if-eqz v1, :cond_1

    const-string v1, "web socket"

    goto :goto_1

    :cond_1
    const-string v1, "call"

    .line 524
    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 526
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->redactedUrl$okhttp()Ljava/lang/String;

    move-result-object v1

    .line 524
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final acquireConnectionNoEvents(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 634
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p1}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 635
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Thread "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " MUST hold lock on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 323
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    if-nez v0, :cond_1

    .line 324
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    .line 325
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getCalls()Ljava/util/List;

    move-result-object p1

    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RealCall$CallReference;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->callStackTrace:Ljava/lang/Object;

    invoke-direct {v0, p0, v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall$CallReference;-><init>(Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    .line 323
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Check failed."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addEventListener(Lnicoid/network238/okhttp3/EventListener;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 136
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->eventListener:Lnicoid/network238/okhttp3/EventListener;

    .line 137
    sget-object v1, Lnicoid/network238/okhttp3/internal/connection/RealCall;->eventListenerUpdater:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/EventListener;->plus(Lnicoid/network238/okhttp3/EventListener;)Lnicoid/network238/okhttp3/EventListener;

    move-result-object v2

    invoke-static {v1, p0, v0, v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall$0;->m(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void
.end method

.method public cancel()V
    .registers 3

    .line 169
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->canceled:Z

    if-eqz v0, :cond_0

    return-void

    .line 171
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->canceled:Z

    .line 172
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->cancel()V

    .line 173
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->plansToCancel:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    .line 174
    invoke-interface {v1}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;->cancel()V

    goto :goto_0

    .line 177
    :cond_2
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->eventListener:Lnicoid/network238/okhttp3/EventListener;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/EventListener;->canceled(Lnicoid/network238/okhttp3/Call;)V

    return-void
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2

    .line 65
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->clone()Lnicoid/network238/okhttp3/Call;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lnicoid/network238/okhttp3/Call;
    .registers 5

    .line 155
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RealCall;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->originalRequest:Lnicoid/network238/okhttp3/Request;

    iget-boolean v3, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->forWebSocket:Z

    invoke-direct {v0, v1, v2, v3}, Lnicoid/network238/okhttp3/internal/connection/RealCall;-><init>(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request;Z)V

    return-object v0
.end method

.method public enqueue(Lnicoid/network238/okhttp3/Callback;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 196
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->executed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 198
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->callStart()V

    .line 199
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v0

    new-instance v1, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;

    invoke-direct {v1, p0, p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;-><init>(Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/Callback;)V

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Dispatcher;->enqueue$okhttp(Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;)V

    return-void

    .line 196
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Already Executed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final enterNetworkInterceptorExchange(Lnicoid/network238/okhttp3/Request;ZLnicoid/network238/okhttp3/internal/http/RealInterceptorChain;)V
    .registers 18

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 263
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->interceptorScopedExchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_4

    .line 631
    monitor-enter p0

    .line 266
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->responseBodyOpen:Z

    if-nez v0, :cond_3

    .line 270
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->requestBodyOpen:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSourceOpen:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSinkOpen:Z

    if-nez v0, :cond_2

    .line 271
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 631
    monitor-exit p0

    if-eqz p2, :cond_1

    .line 275
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;

    .line 276
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/OkHttpClient;->getTaskRunner$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    move-result-object v1

    .line 277
    invoke-virtual/range {p3 .. p3}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getConnectionPool()Lnicoid/network238/okhttp3/ConnectionPool;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/ConnectionPool;->getDelegate$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    move-result-object v2

    .line 278
    invoke-virtual/range {p3 .. p3}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getReadTimeoutMillis$okhttp()I

    move-result v3

    .line 279
    invoke-virtual/range {p3 .. p3}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getWriteTimeoutMillis$okhttp()I

    move-result v4

    .line 280
    invoke-virtual/range {p3 .. p3}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getConnectTimeoutMillis$okhttp()I

    move-result v5

    .line 281
    invoke-virtual/range {p3 .. p3}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getReadTimeoutMillis$okhttp()I

    move-result v6

    .line 282
    iget-object v7, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v7}, Lnicoid/network238/okhttp3/OkHttpClient;->pingIntervalMillis()I

    move-result v7

    .line 283
    invoke-virtual/range {p3 .. p3}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getRetryOnConnectionFailure()Z

    move-result v8

    .line 284
    iget-object v9, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v9}, Lnicoid/network238/okhttp3/OkHttpClient;->fastFallback()Z

    move-result v9

    .line 285
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v10

    move-object/from16 v11, p3

    invoke-virtual {v11, v10}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->address(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Address;

    move-result-object v10

    .line 286
    iget-object v11, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v11}, Lnicoid/network238/okhttp3/OkHttpClient;->getRouteDatabase$okhttp()Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    move-result-object v11

    .line 275
    move-object v12, p0

    move-object v13, p1

    invoke-direct/range {v0 .. v13}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;IIIIIZZLnicoid/network238/okhttp3/Address;Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/Request;)V

    .line 292
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/OkHttpClient;->fastFallback()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lnicoid/network238/okhttp3/internal/connection/FastFallbackExchangeFinder;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/OkHttpClient;->getTaskRunner$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lnicoid/network238/okhttp3/internal/connection/FastFallbackExchangeFinder;-><init>(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V

    goto :goto_0

    .line 293
    :cond_0
    new-instance v1, Lnicoid/network238/okhttp3/internal/connection/SequentialExchangeFinder;

    invoke-direct {v1, v0}, Lnicoid/network238/okhttp3/internal/connection/SequentialExchangeFinder;-><init>(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;)V

    .line 290
    :goto_0
    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->exchangeFinder:Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;

    :cond_1
    return-void

    .line 270
    :cond_2
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Check failed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 267
    :cond_3
    const-string v0, "cannot make a new request because the previous response is still open: please call response.close()"

    .line 266
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    .line 631
    monitor-exit p0

    throw v0

    .line 263
    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Check failed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public execute()Lnicoid/network238/okhttp3/Response;
    .registers 4

    .line 183
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->executed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 185
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->timeout:Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;

    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->enter()V

    .line 186
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->callStart()V

    .line 188
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/Dispatcher;->executed$okhttp(Lnicoid/network238/okhttp3/internal/connection/RealCall;)Z

    .line 189
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getResponseWithInterceptorChain$okhttp()Lnicoid/network238/okhttp3/Response;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v1

    invoke-virtual {v1, p0}, Lnicoid/network238/okhttp3/Dispatcher;->finished$okhttp(Lnicoid/network238/okhttp3/internal/connection/RealCall;)V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v1

    invoke-virtual {v1, p0}, Lnicoid/network238/okhttp3/Dispatcher;->finished$okhttp(Lnicoid/network238/okhttp3/internal/connection/RealCall;)V

    throw v0

    .line 183
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already Executed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final exitNetworkInterceptorExchange$okhttp(Z)V
    .registers 3

    .line 661
    monitor-enter p0

    .line 504
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->expectMoreExchanges:Z

    if-eqz v0, :cond_1

    .line 505
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 661
    monitor-exit p0

    if-eqz p1, :cond_0

    .line 508
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->detachWithViolence()V

    :cond_0
    nop

    .line 511
    const/4 p1, 0x0

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->interceptorScopedExchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    return-void

    .line 504
    :cond_1
    :try_start_1
    const-string p1, "released"

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 661
    monitor-exit p0

    throw p1
.end method

.method public final getClient()Lnicoid/network238/okhttp3/OkHttpClient;
    .registers 2

    .line 67
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    return-object v0
.end method

.method public final getConnection()Lnicoid/network238/okhttp3/internal/connection/RealConnection;
    .registers 2

    .line 98
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    return-object v0
.end method

.method public final getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;
    .registers 2

    .line 77
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->eventListener:Lnicoid/network238/okhttp3/EventListener;

    return-object v0
.end method

.method public final getForWebSocket()Z
    .registers 2

    .line 70
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->forWebSocket:Z

    return v0
.end method

.method public final getInterceptorScopedExchange$okhttp()Lnicoid/network238/okhttp3/internal/connection/Exchange;
    .registers 2

    .line 107
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->interceptorScopedExchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    return-object v0
.end method

.method public final getOriginalRequest()Lnicoid/network238/okhttp3/Request;
    .registers 2

    .line 69
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->originalRequest:Lnicoid/network238/okhttp3/Request;

    return-object v0
.end method

.method public final getPlansToCancel$okhttp()Ljava/util/concurrent/CopyOnWriteArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;",
            ">;"
        }
    .end annotation

    .line 127
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->plansToCancel:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-object v0
.end method

.method public final getResponseWithInterceptorChain$okhttp()Lnicoid/network238/okhttp3/Response;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 212
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 213
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->interceptors()Ljava/util/List;

    move-result-object v0

    invoke-static {v2, v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 214
    new-instance v0, Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor;-><init>()V

    invoke-interface {v2, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 215
    new-instance v0, Lnicoid/network238/okhttp3/internal/http/BridgeInterceptor;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/http/BridgeInterceptor;-><init>()V

    invoke-interface {v2, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 216
    new-instance v0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor;-><init>()V

    invoke-interface {v2, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 217
    sget-object v0, Lnicoid/network238/okhttp3/internal/connection/ConnectInterceptor;->INSTANCE:Lnicoid/network238/okhttp3/internal/connection/ConnectInterceptor;

    invoke-interface {v2, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 218
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->forWebSocket:Z

    if-nez v0, :cond_0

    .line 219
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->networkInterceptors()Ljava/util/List;

    move-result-object v0

    invoke-static {v2, v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 221
    :cond_0
    sget-object v0, Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor;->INSTANCE:Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor;

    invoke-interface {v2, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 224
    new-instance v0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    .line 229
    iget-object v5, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->originalRequest:Lnicoid/network238/okhttp3/Request;

    .line 224
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/16 v7, 0x20

    const/4 v8, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;-><init>(Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/util/List;ILjava/lang/Void;Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/OkHttpClient;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 234
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->originalRequest:Lnicoid/network238/okhttp3/Request;

    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->proceed(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    .line 235
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->isCanceled()Z

    move-result v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_1

    .line 245
    invoke-virtual {p0, v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->noMoreExchanges$okhttp(Ljava/io/IOException;)Ljava/io/IOException;

    return-object v0

    .line 236
    :cond_1
    :try_start_1
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    .line 237
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Canceled"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    const/4 v2, 0x0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 242
    :try_start_2
    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->noMoreExchanges$okhttp(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception v0

    const/4 v2, 0x1

    :goto_0
    if-nez v2, :cond_2

    .line 245
    invoke-virtual {p0, v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->noMoreExchanges$okhttp(Ljava/io/IOException;)Ljava/io/IOException;

    :cond_2
    throw v0
.end method

.method public final initExchange$okhttp(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;)Lnicoid/network238/okhttp3/internal/connection/Exchange;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 632
    monitor-enter p0

    .line 301
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->expectMoreExchanges:Z

    if-eqz v0, :cond_2

    .line 302
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->responseBodyOpen:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->requestBodyOpen:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSourceOpen:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSinkOpen:Z

    if-nez v0, :cond_1

    .line 303
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 632
    monitor-exit p0

    .line 305
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->exchangeFinder:Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 306
    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;->find()Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    move-result-object v1

    .line 307
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v1, v2, p1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->newCodec$okhttp(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;)Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    move-result-object p1

    .line 308
    new-instance v1, Lnicoid/network238/okhttp3/internal/connection/Exchange;

    invoke-direct {v1, p0, v0, p1}, Lnicoid/network238/okhttp3/internal/connection/Exchange;-><init>(Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;)V

    .line 309
    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->interceptorScopedExchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    .line 310
    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    .line 633
    monitor-enter p0

    .line 312
    const/4 p1, 0x1

    :try_start_1
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->requestBodyOpen:Z

    .line 313
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->responseBodyOpen:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 633
    monitor-exit p0

    .line 316
    iget-boolean p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->canceled:Z

    if-nez p1, :cond_0

    return-object v1

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Canceled"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    .line 633
    monitor-exit p0

    throw p1

    .line 302
    :cond_1
    :try_start_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Check failed."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 301
    :cond_2
    const-string p1, "released"

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception p1

    .line 632
    monitor-exit p0

    throw p1
.end method

.method public isCanceled()Z
    .registers 2

    .line 180
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->canceled:Z

    return v0
.end method

.method public isExecuted()Z
    .registers 2

    .line 202
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->executed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public final messageDone$okhttp(Lnicoid/network238/okhttp3/internal/connection/Exchange;ZZZZLjava/io/IOException;)Ljava/io/IOException;
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 344
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_c

    .line 638
    monitor-enter p0

    const/4 p1, 0x0

    if-eqz p2, :cond_0

    .line 350
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->requestBodyOpen:Z

    if-nez v0, :cond_3

    :cond_0
    if-eqz p3, :cond_1

    .line 351
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->responseBodyOpen:Z

    if-nez v0, :cond_3

    :cond_1
    if-eqz p5, :cond_2

    .line 352
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSinkOpen:Z

    if-nez v0, :cond_3

    :cond_2
    if-eqz p4, :cond_a

    .line 353
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSourceOpen:Z

    if-eqz v0, :cond_a

    :cond_3
    if-eqz p2, :cond_4

    .line 355
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->requestBodyOpen:Z

    :cond_4
    if-eqz p3, :cond_5

    .line 356
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->responseBodyOpen:Z

    :cond_5
    if-eqz p5, :cond_6

    .line 357
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSinkOpen:Z

    :cond_6
    if-eqz p4, :cond_7

    .line 358
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSourceOpen:Z

    .line 359
    :cond_7
    iget-boolean p2, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->requestBodyOpen:Z

    const/4 p3, 0x1

    if-nez p2, :cond_8

    .line 360
    iget-boolean p2, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->responseBodyOpen:Z

    if-nez p2, :cond_8

    .line 361
    iget-boolean p2, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSinkOpen:Z

    if-nez p2, :cond_8

    .line 362
    iget-boolean p2, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSourceOpen:Z

    if-nez p2, :cond_8

    move p2, p3

    goto :goto_0

    :cond_8
    move p2, p1

    :goto_0
    if-eqz p2, :cond_9

    .line 363
    iget-boolean p4, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->expectMoreExchanges:Z

    if-nez p4, :cond_9

    goto :goto_1

    :cond_9
    move p3, p1

    :goto_1
    move p1, p2

    goto :goto_2

    .line 365
    :cond_a
    move p3, p1

    :goto_2
    sget-object p2, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 638
    monitor-exit p0

    if-eqz p1, :cond_b

    .line 368
    const/4 p1, 0x0

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    .line 369
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    if-eqz p1, :cond_b

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->incrementSuccessCount$okhttp()V

    :cond_b
    if-eqz p3, :cond_c

    .line 373
    invoke-direct {p0, p6}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->callDone(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    return-object p1

    :cond_c
    return-object p6

    :catchall_0
    move-exception p1

    .line 638
    monitor-exit p0

    throw p1
.end method

.method public final noMoreExchanges$okhttp(Ljava/io/IOException;)Ljava/io/IOException;
    .registers 4

    .line 639
    monitor-enter p0

    .line 382
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->expectMoreExchanges:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 383
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->expectMoreExchanges:Z

    .line 384
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->requestBodyOpen:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->responseBodyOpen:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSinkOpen:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSourceOpen:Z

    if-nez v0, :cond_0

    const/4 v1, 0x1

    .line 386
    :cond_0
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 639
    monitor-exit p0

    if-eqz v1, :cond_1

    .line 389
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->callDone(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    :cond_1
    return-object p1

    :catchall_0
    move-exception p1

    .line 639
    monitor-exit p0

    throw p1
.end method

.method public final redactedUrl$okhttp()Ljava/lang/String;
    .registers 2

    .line 529
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->originalRequest:Lnicoid/network238/okhttp3/Request;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->redact()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final releaseConnectionNoEvents$okhttp()Ljava/net/Socket;
    .registers 7

    .line 445
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 649
    sget-boolean v1, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v1, :cond_0

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 650
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Thread "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " MUST hold lock on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 448
    :cond_0
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getCalls()Ljava/util/List;

    move-result-object v1

    .line 654
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, -0x1

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 655
    check-cast v4, Ljava/lang/ref/Reference;

    .line 449
    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4, p0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    move v3, v5

    :cond_2
    if-eq v3, v5, :cond_4

    .line 452
    invoke-interface {v1, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 453
    const/4 v2, 0x0

    iput-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    .line 455
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 456
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->setIdleAtNs(J)V

    .line 457
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connectionBecameIdle(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 458
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->socket()Ljava/net/Socket;

    move-result-object v0

    return-object v0

    :cond_3
    return-object v2

    .line 450
    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Check failed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public request()Lnicoid/network238/okhttp3/Request;
    .registers 2

    .line 157
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->originalRequest:Lnicoid/network238/okhttp3/Request;

    return-object v0
.end method

.method public final retryAfterFailure()Z
    .registers 4

    .line 515
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getHasFailure$okhttp()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 516
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->exchangeFinder:Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;->getRoutePlanner()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;

    move-result-object v0

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getConnection$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    move-result-object v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-interface {v0, v2}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;->hasNext(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public final setEventListener$okhttp(Lnicoid/network238/okhttp3/EventListener;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->eventListener:Lnicoid/network238/okhttp3/EventListener;

    return-void
.end method

.method public tag(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "+TT;>;)TT;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 142
    invoke-static {p1}, Lnicoid/network238/kotlin/jvm/JvmClassMappingKt;->getKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->tag(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public tag(Ljava/lang/Class;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")TT;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 152
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->tags:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {p1}, Lnicoid/network238/kotlin/jvm/JvmClassMappingKt;->getKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p1

    invoke-static {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/TagsKt;->computeIfAbsent(Ljava/util/concurrent/atomic/AtomicReference;Lnicoid/network238/kotlin/reflect/KClass;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public tag(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/kotlin/reflect/KClass;",
            ")TT;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 140
    invoke-static {p1}, Lnicoid/network238/kotlin/jvm/JvmClassMappingKt;->getJavaClass(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->tags:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/Tags;

    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/internal/Tags;->get(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public tag(Lnicoid/network238/kotlin/reflect/KClass;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/kotlin/reflect/KClass;",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")TT;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 147
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->tags:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/TagsKt;->computeIfAbsent(Ljava/util/concurrent/atomic/AtomicReference;Lnicoid/network238/kotlin/reflect/KClass;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 131
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->timeout:Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;

    return-object v0
.end method

.method public final timeoutEarlyExit()V
    .registers 3

    .line 479
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->timeoutEarlyExit:Z

    if-nez v0, :cond_0

    .line 480
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->timeoutEarlyExit:Z

    .line 481
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->timeout:Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;

    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    return-void

    .line 479
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Check failed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final upgradeToSocket()V
    .registers 3

    .line 485
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->timeoutEarlyExit()V

    .line 660
    monitor-enter p0

    .line 488
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-eqz v0, :cond_3

    .line 489
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSinkOpen:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSourceOpen:Z

    if-nez v0, :cond_2

    .line 490
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->requestBodyOpen:Z

    if-nez v0, :cond_1

    .line 491
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->responseBodyOpen:Z

    if-eqz v0, :cond_0

    .line 492
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->responseBodyOpen:Z

    .line 493
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSinkOpen:Z

    .line 494
    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall;->socketSourceOpen:Z

    .line 495
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 660
    monitor-exit p0

    return-void

    .line 491
    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Check failed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 490
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Check failed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 489
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Check failed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 488
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Check failed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    .line 660
    monitor-exit p0

    throw v0
.end method
