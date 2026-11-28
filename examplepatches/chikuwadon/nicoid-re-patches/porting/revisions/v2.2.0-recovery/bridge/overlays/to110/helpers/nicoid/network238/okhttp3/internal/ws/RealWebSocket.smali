.class public final Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/WebSocket;
.implements Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;
.implements Lnicoid/network238/okhttp3/internal/concurrent/Lockable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;,
        Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Companion;,
        Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;,
        Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$WriterTask;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u00b2\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0008\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u0000 f2\u00020\u00012\u00020\u00022\u00020\u0003:\u0004cdefBI\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\u000c\u001a\u00020\r\u0012\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u000f\u0012\u0006\u0010\u0010\u001a\u00020\r\u0012\u0006\u0010\u0011\u001a\u00020\r\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u0008\u00109\u001a\u00020\u0007H\u0016J\u0008\u0010.\u001a\u00020\rH\u0016J\u0008\u0010:\u001a\u00020;H\u0016J\u000e\u0010<\u001a\u00020;2\u0006\u0010=\u001a\u00020>J\u000c\u0010?\u001a\u000200*\u00020\u000fH\u0002J\u0015\u0010@\u001a\u00020(2\u0006\u0010A\u001a\u00020BH\u0000\u00a2\u0006\u0002\u0008CJ\u001e\u0010D\u001a\u00020;2\u0006\u0010&\u001a\u00020\u00172\u0006\u0010\'\u001a\u00020E2\u0006\u0010=\u001a\u000200J\u000e\u0010F\u001a\u00020;2\u0006\u0010A\u001a\u00020BJ\u0006\u0010G\u001a\u000200J\u0006\u0010H\u001a\u00020;J\u0006\u0010I\u001a\u00020;J\u0006\u00105\u001a\u000202J\u0006\u00106\u001a\u000202J\u0006\u00107\u001a\u000202J\u0010\u0010J\u001a\u00020;2\u0006\u0010K\u001a\u00020\u0017H\u0016J\u0010\u0010J\u001a\u00020;2\u0006\u0010L\u001a\u00020+H\u0016J\u0010\u0010M\u001a\u00020;2\u0006\u0010N\u001a\u00020+H\u0016J\u0010\u0010O\u001a\u00020;2\u0006\u0010N\u001a\u00020+H\u0016J\u0018\u0010P\u001a\u00020;2\u0006\u0010Q\u001a\u0002022\u0006\u0010R\u001a\u00020\u0017H\u0016J\u0010\u0010S\u001a\u0002002\u0006\u0010K\u001a\u00020\u0017H\u0016J\u0010\u0010S\u001a\u0002002\u0006\u0010L\u001a\u00020+H\u0016J\u0018\u0010S\u001a\u0002002\u0006\u0010T\u001a\u00020+2\u0006\u0010U\u001a\u000202H\u0002J\u000e\u0010V\u001a\u0002002\u0006\u0010N\u001a\u00020+J\u001a\u0010W\u001a\u0002002\u0006\u0010Q\u001a\u0002022\u0008\u0010R\u001a\u0004\u0018\u00010\u0017H\u0016J \u0010W\u001a\u0002002\u0006\u0010Q\u001a\u0002022\u0008\u0010R\u001a\u0004\u0018\u00010\u00172\u0006\u0010X\u001a\u00020\rJ\u0008\u0010Y\u001a\u00020;H\u0002J\r\u0010Z\u001a\u000200H\u0000\u00a2\u0006\u0002\u0008[J\r\u0010\\\u001a\u00020;H\u0000\u00a2\u0006\u0002\u0008]J(\u0010^\u001a\u00020;2\n\u0010_\u001a\u00060`j\u0002`a2\n\u0008\u0002\u0010A\u001a\u0004\u0018\u00010B2\u0008\u0008\u0002\u0010b\u001a\u000200R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0008\u001a\u00020\tX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001c\u0010\u0018\u001a\u0004\u0018\u00010\u0019X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001a\u0010\u001b\"\u0004\u0008\u001c\u0010\u001dR\u0010\u0010\u001e\u001a\u0004\u0018\u00010\u001fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010 \u001a\u0004\u0018\u00010!X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\"\u001a\u0004\u0018\u00010#X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010$\u001a\u00020%X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010&\u001a\u0004\u0018\u00010\u0017X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\'\u001a\u0004\u0018\u00010(X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010)\u001a\u0008\u0012\u0004\u0012\u00020+0*X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010,\u001a\u0008\u0012\u0004\u0012\u00020-0*X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010.\u001a\u00020\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010/\u001a\u000200X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00101\u001a\u000202X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u00103\u001a\u0004\u0018\u00010\u0017X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00104\u001a\u000200X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00105\u001a\u000202X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00106\u001a\u000202X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00107\u001a\u000202X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00108\u001a\u000200X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006g"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;",
        "Lnicoid/network238/okhttp3/WebSocket;",
        "Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;",
        "Lnicoid/network238/okhttp3/internal/concurrent/Lockable;",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "originalRequest",
        "Lnicoid/network238/okhttp3/Request;",
        "listener",
        "Lnicoid/network238/okhttp3/WebSocketListener;",
        "random",
        "Ljava/util/Random;",
        "pingIntervalMillis",
        "",
        "extensions",
        "Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;",
        "minimumDeflateSize",
        "webSocketCloseTimeout",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/WebSocketListener;Ljava/util/Random;JLnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;JJ)V",
        "getListener$okhttp",
        "()Lnicoid/network238/okhttp3/WebSocketListener;",
        "key",
        "",
        "call",
        "Lnicoid/network238/okhttp3/Call;",
        "getCall$okhttp",
        "()Lnicoid/network238/okhttp3/Call;",
        "setCall$okhttp",
        "(Lnicoid/network238/okhttp3/Call;)V",
        "writerTask",
        "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
        "reader",
        "Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;",
        "writer",
        "Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;",
        "taskQueue",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;",
        "name",
        "socket",
        "Lnicoid/network238/okio/Socket;",
        "pongQueue",
        "Ljava/util/ArrayDeque;",
        "Lnicoid/network238/okio/ByteString;",
        "messageAndCloseQueue",
        "",
        "queueSize",
        "enqueuedClose",
        "",
        "receivedCloseCode",
        "",
        "receivedCloseReason",
        "failed",
        "sentPingCount",
        "receivedPingCount",
        "receivedPongCount",
        "awaitingPong",
        "request",
        "cancel",
        "",
        "connect",
        "client",
        "Lnicoid/network238/okhttp3/OkHttpClient;",
        "isValid",
        "checkUpgradeSuccess",
        "response",
        "Lnicoid/network238/okhttp3/Response;",
        "checkUpgradeSuccess$okhttp",
        "initReaderAndWriter",
        "Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;",
        "loopReader",
        "processNextFrame",
        "finishReader",
        "tearDown",
        "onReadMessage",
        "text",
        "bytes",
        "onReadPing",
        "payload",
        "onReadPong",
        "onReadClose",
        "code",
        "reason",
        "send",
        "data",
        "formatOpcode",
        "pong",
        "close",
        "cancelAfterCloseMillis",
        "runWriter",
        "writeOneFrame",
        "writeOneFrame$okhttp",
        "writePingFrame",
        "writePingFrame$okhttp",
        "failWebSocket",
        "e",
        "Ljava/lang/Exception;",
        "Lnicoid/network238/kotlin/Exception;",
        "isWriter",
        "Message",
        "Close",
        "WriterTask",
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
.field public static final CANCEL_AFTER_CLOSE_MILLIS:J = 0xea60L

.field public static final Companion:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Companion;

.field public static final DEFAULT_MINIMUM_DEFLATE_SIZE:J = 0x400L

.field private static final MAX_QUEUE_SIZE:J = 0x1000000L

.field private static final ONLY_HTTP1:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private awaitingPong:Z

.field private call:Lnicoid/network238/okhttp3/Call;

.field private enqueuedClose:Z

.field private extensions:Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;

.field private failed:Z

.field private final key:Ljava/lang/String;

.field private final listener:Lnicoid/network238/okhttp3/WebSocketListener;

.field private final messageAndCloseQueue:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private minimumDeflateSize:J

.field private name:Ljava/lang/String;

.field private final originalRequest:Lnicoid/network238/okhttp3/Request;

.field private final pingIntervalMillis:J

.field private final pongQueue:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Lnicoid/network238/okio/ByteString;",
            ">;"
        }
    .end annotation
.end field

.field private queueSize:J

.field private final random:Ljava/util/Random;

.field private reader:Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;

.field private receivedCloseCode:I

.field private receivedCloseReason:Ljava/lang/String;

.field private receivedPingCount:I

.field private receivedPongCount:I

.field private sentPingCount:I

.field private socket:Lnicoid/network238/okio/Socket;

.field private taskQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

.field private final webSocketCloseTimeout:J

.field private writer:Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;

.field private writerTask:Lnicoid/network238/okhttp3/internal/concurrent/Task;


# direct methods
.method public static synthetic $r8$lambda$0T3qT4Eg5PnlD3bX-T9nHdqY_Jw(Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;)Lnicoid/network238/kotlin/Unit;
    .registers 1

    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->finishReader$lambda$0$0(Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;)Lnicoid/network238/kotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$3UeTKdScoteZtprq_bJvU_Ppjpc(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;)Lnicoid/network238/kotlin/Unit;
    .registers 1

    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->writeOneFrame$lambda$0$0(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;)Lnicoid/network238/kotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$CoyTb8PMxSv5bSlhxaYuHDtmnaQ(Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)Lnicoid/network238/kotlin/Unit;
    .registers 1

    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failWebSocket$lambda$0$0(Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)Lnicoid/network238/kotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$M3uLbVxgXTEj1BhnKpRA6a_aJpc(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;J)J
    .registers 3

    invoke-static {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->initReaderAndWriter$lambda$0$0(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;J)J

    move-result-wide p0

    return-wide p0
.end method

.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->Companion:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Companion;

    .line 678
    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    invoke-static {v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->ONLY_HTTP1:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/WebSocketListener;Ljava/util/Random;JLnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;JJ)V
    .registers 12

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->originalRequest:Lnicoid/network238/okhttp3/Request;

    .line 59
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->listener:Lnicoid/network238/okhttp3/WebSocketListener;

    .line 60
    iput-object p4, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->random:Ljava/util/Random;

    .line 61
    iput-wide p5, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->pingIntervalMillis:J

    .line 66
    iput-object p7, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->extensions:Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;

    .line 68
    iput-wide p8, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->minimumDeflateSize:J

    .line 69
    iput-wide p10, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->webSocketCloseTimeout:J

    .line 90
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->newQueue()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->taskQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    .line 99
    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->pongQueue:Ljava/util/ArrayDeque;

    .line 102
    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    .line 111
    const/4 p1, -0x1

    iput p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedCloseCode:I

    .line 132
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object p1

    const-string p3, "GET"

    invoke-static {p3, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 136
    sget-object p2, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    const/16 p1, 0x10

    new-array p3, p1, [B

    invoke-virtual {p4, p3}, Ljava/util/Random;->nextBytes([B)V

    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    const/4 p6, 0x3

    const/4 p7, 0x0

    const/4 p4, 0x0

    const/4 p5, 0x0

    invoke-static/range {p2 .. p7}, Lnicoid/network238/okio/ByteString$Companion;->of$default(Lnicoid/network238/okio/ByteString$Companion;[BIIILjava/lang/Object;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    invoke-static {p1, p4, p2, p3}, Lnicoid/network238/okio/ByteString;->base64$default(Lnicoid/network238/okio/ByteString;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->key:Ljava/lang/String;

    return-void

    .line 133
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "Request must be GET: "

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 132
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public static final synthetic access$getMessageAndCloseQueue$p(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;)Ljava/util/ArrayDeque;
    .registers 1

    .line 55
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    return-object p0
.end method

.method public static final synthetic access$getName$p(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;)Ljava/lang/String;
    .registers 1

    .line 55
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->name:Ljava/lang/String;

    return-object p0
.end method

.method public static final synthetic access$isValid(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;)Z
    .registers 2

    .line 55
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->isValid(Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;)Z

    move-result p0

    return p0
.end method

.method public static final synthetic access$setExtensions$p(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;)V
    .registers 2

    .line 55
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->extensions:Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;

    return-void
.end method

.method public static synthetic failWebSocket$default(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;Ljava/lang/Exception;Lnicoid/network238/okhttp3/Response;ZILjava/lang/Object;)V
    .registers 6

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    const/4 p3, 0x0

    .line 617
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failWebSocket(Ljava/lang/Exception;Lnicoid/network238/okhttp3/Response;Z)V

    return-void
.end method

.method private static final failWebSocket$lambda$0$0(Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)Lnicoid/network238/kotlin/Unit;
    .registers 1

    .line 636
    iget-object p0, p0, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast p0, Ljava/io/Closeable;

    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    .line 637
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method private static final finishReader$lambda$0$0(Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;)Lnicoid/network238/kotlin/Unit;
    .registers 1

    .line 362
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    .line 363
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method private static final initReaderAndWriter$lambda$0$0(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;J)J
    .registers 3

    .line 291
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->writePingFrame$okhttp()V

    return-wide p1
.end method

.method private final isValid(Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;)Z
    .registers 3

    .line 219
    iget-boolean v0, p1, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->unknownValues:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 222
    :cond_0
    iget-object v0, p1, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientMaxWindowBits:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    goto :goto_0

    .line 225
    :cond_1
    iget-object p1, p1, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverMaxWindowBits:Ljava/lang/Integer;

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/16 v0, 0x8

    if-gt v0, p1, :cond_2

    const/16 v0, 0x10

    if-lt p1, v0, :cond_3

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method private final runWriter()V
    .registers 9

    .line 705
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 706
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

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 501
    :cond_0
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->writerTask:Lnicoid/network238/okhttp3/internal/concurrent/Task;

    if-eqz v3, :cond_1

    .line 503
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->taskQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    const/4 v6, 0x2

    const/4 v7, 0x0

    const-wide/16 v4, 0x0

    invoke-static/range {v2 .. v7}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->schedule$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Lnicoid/network238/okhttp3/internal/concurrent/Task;JILjava/lang/Object;)V

    :cond_1
    return-void
.end method

.method private final declared-synchronized send(Lnicoid/network238/okio/ByteString;I)Z
    .registers 9

    monitor-enter p0

    .line 443
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failed:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->enqueuedClose:Z

    if-nez v0, :cond_1

    .line 446
    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->queueSize:J

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    int-to-long v4, v0

    add-long/2addr v2, v4

    const-wide/32 v4, 0x1000000

    cmp-long v0, v2, v4

    if-lez v0, :cond_0

    .line 447
    const/16 p1, 0x3e9

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->close(ILjava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v1

    .line 452
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->queueSize:J

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->queueSize:J

    .line 453
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    new-instance v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;

    invoke-direct {v1, p2, p1}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;-><init>(ILnicoid/network238/okio/ByteString;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 454
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->runWriter()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    const/4 p1, 0x1

    return p1

    :cond_1
    monitor-exit p0

    return v1

    .line 442
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method private static final writeOneFrame$lambda$0$0(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;)Lnicoid/network238/kotlin/Unit;
    .registers 1

    .line 551
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->cancel()V

    .line 552
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .line 144
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->call:Lnicoid/network238/okhttp3/Call;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/Call;->cancel()V

    return-void
.end method

.method public final checkUpgradeSuccess$okhttp(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okio/Socket;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 233
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    const/16 v1, 0x65

    const/16 v2, 0x27

    if-ne v0, v1, :cond_4

    .line 239
    const-string v0, "Connection"

    const/4 v1, 0x0

    const/4 v3, 0x2

    invoke-static {p1, v0, v1, v3, v1}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 240
    const-string v4, "Upgrade"

    const/4 v5, 0x1

    invoke-static {v4, v0, v5}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 246
    invoke-static {p1, v4, v1, v3, v1}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 247
    const-string v4, "websocket"

    invoke-static {v4, v0, v5}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 253
    const-string v0, "Sec-WebSocket-Accept"

    invoke-static {p1, v0, v1, v3, v1}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 254
    sget-object v3, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->key:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okio/ByteString;->sha1()Lnicoid/network238/okio/ByteString;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4, v5, v1}, Lnicoid/network238/okio/ByteString;->base64$default(Lnicoid/network238/okio/ByteString;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 255
    invoke-static {v1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 261
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->socket()Lnicoid/network238/okio/Socket;

    move-result-object p1

    if-eqz p1, :cond_0

    return-object p1

    .line 262
    :cond_0
    new-instance p1, Ljava/net/ProtocolException;

    const-string v0, "Web Socket socket missing: bad interceptor?"

    invoke-direct {p1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 256
    :cond_1
    new-instance p1, Ljava/net/ProtocolException;

    .line 257
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Expected \'Sec-WebSocket-Accept\' header value \'"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "\' but was \'"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 256
    invoke-direct {p1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 248
    :cond_2
    new-instance p1, Ljava/net/ProtocolException;

    .line 249
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Expected \'Upgrade\' header value \'websocket\' but was \'"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 248
    invoke-direct {p1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 241
    :cond_3
    new-instance p1, Ljava/net/ProtocolException;

    .line 242
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Expected \'Connection\' header value \'Upgrade\' but was \'"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 241
    invoke-direct {p1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 234
    :cond_4
    new-instance v0, Ljava/net/ProtocolException;

    .line 235
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Expected HTTP 101 response but was \'"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v3, 0x20

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->message()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 234
    invoke-direct {v0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close(ILjava/lang/String;)Z
    .registers 5

    .line 470
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->webSocketCloseTimeout:J

    invoke-virtual {p0, p1, p2, v0, v1}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->close(ILjava/lang/String;J)Z

    move-result p1

    return p1
.end method

.method public final declared-synchronized close(ILjava/lang/String;J)Z
    .registers 10

    monitor-enter p0

    .line 477
    :try_start_0
    sget-object v0, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->INSTANCE:Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/ws/WebSocketProtocol;->validateCloseCode(I)V

    if-eqz p2, :cond_1

    .line 481
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v0, p2}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    .line 482
    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    int-to-long v1, v1

    const-wide/16 v3, 0x7b

    cmp-long v1, v1, v3

    if-gtz v1, :cond_0

    goto :goto_0

    .line 483
    :cond_0
    const-string p1, "reason.size() > 123: "

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 482
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 477
    :cond_1
    const/4 v0, 0x0

    .line 487
    :goto_0
    iget-boolean p2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failed:Z

    if-nez p2, :cond_2

    iget-boolean p2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->enqueuedClose:Z

    if-nez p2, :cond_2

    .line 490
    const/4 p2, 0x1

    iput-boolean p2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->enqueuedClose:Z

    .line 493
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    new-instance v2, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;

    invoke-direct {v2, p1, v0, p3, p4}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;-><init>(ILnicoid/network238/okio/ByteString;J)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 494
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->runWriter()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p2

    :cond_2
    monitor-exit p0

    const/4 p1, 0x0

    return p1

    .line 476
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_1
.end method

.method public final connect(Lnicoid/network238/okhttp3/OkHttpClient;)V
    .registers 10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 148
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->originalRequest:Lnicoid/network238/okhttp3/Request;

    const-string v1, "Sec-WebSocket-Extensions"

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 149
    new-instance v3, Ljava/net/ProtocolException;

    const-string p1, "Request header not permitted: \'Sec-WebSocket-Extensions\'"

    invoke-direct {v3, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    const/4 v6, 0x6

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v2, p0

    invoke-static/range {v2 .. v7}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failWebSocket$default(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;Ljava/lang/Exception;Lnicoid/network238/okhttp3/Response;ZILjava/lang/Object;)V

    return-void

    .line 155
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->newBuilder()Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object p1

    .line 156
    sget-object v0, Lnicoid/network238/okhttp3/EventListener;->NONE:Lnicoid/network238/okhttp3/EventListener;

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->eventListener(Lnicoid/network238/okhttp3/EventListener;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object p1

    .line 157
    sget-object v0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->ONLY_HTTP1:Ljava/util/List;

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->protocols(Ljava/util/List;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object p1

    .line 158
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->build()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object p1

    .line 160
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->originalRequest:Lnicoid/network238/okhttp3/Request;

    .line 161
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->newBuilder()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 162
    const-string v2, "websocket"

    const-string v3, "Upgrade"

    invoke-virtual {v0, v3, v2}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 163
    const-string v2, "Connection"

    invoke-virtual {v0, v2, v3}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 164
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->key:Ljava/lang/String;

    const-string v3, "Sec-WebSocket-Key"

    invoke-virtual {v0, v3, v2}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 165
    const-string v2, "Sec-WebSocket-Version"

    const-string v3, "13"

    invoke-virtual {v0, v2, v3}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 166
    const-string v2, "permessage-deflate"

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 167
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    .line 168
    new-instance v1, Lnicoid/network238/okhttp3/internal/connection/RealCall;

    const/4 v2, 0x1

    invoke-direct {v1, p1, v0, v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;-><init>(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request;Z)V

    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->call:Lnicoid/network238/okhttp3/Call;

    .line 170
    new-instance p1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$connect$1;

    invoke-direct {p1, p0, v0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$connect$1;-><init>(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;Lnicoid/network238/okhttp3/Request;)V

    .line 169
    invoke-interface {v1, p1}, Lnicoid/network238/okhttp3/Call;->enqueue(Lnicoid/network238/okhttp3/Callback;)V

    return-void
.end method

.method public final failWebSocket(Ljava/lang/Exception;Lnicoid/network238/okhttp3/Response;Z)V
    .registers 16

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 623
    new-instance v1, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    invoke-direct {v1}, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 624
    monitor-enter p0

    .line 625
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_0

    .line 624
    monitor-exit p0

    return-void

    :cond_0
    nop

    .line 626
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failed:Z

    .line 628
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->socket:Lnicoid/network238/okio/Socket;

    .line 630
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->writer:Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;

    iput-object v0, v1, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 631
    const/4 v3, 0x0

    iput-object v3, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->writer:Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;

    if-nez p3, :cond_1

    if-eqz v0, :cond_1

    .line 635
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->taskQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->name:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " writer close"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v9, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$3;

    invoke-direct {v9, v1}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$3;-><init>(Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)V

    const/4 v10, 0x2

    const/4 v11, 0x0

    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    invoke-static/range {v4 .. v11}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    .line 640
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->taskQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->shutdown()V

    .line 641
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 624
    monitor-exit p0

    .line 644
    :try_start_2
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->listener:Lnicoid/network238/okhttp3/WebSocketListener;

    invoke-virtual {v0, p0, p1, p2}, Lnicoid/network238/okhttp3/WebSocketListener;->onFailure(Lnicoid/network238/okhttp3/WebSocket;Ljava/lang/Throwable;Lnicoid/network238/okhttp3/Response;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v2, :cond_2

    .line 646
    invoke-interface {v2}, Lnicoid/network238/okio/Socket;->cancel()V

    :cond_2
    if-eqz p3, :cond_3

    .line 650
    iget-object p1, v1, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast p1, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;

    if-eqz p1, :cond_3

    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    :cond_3
    return-void

    :catchall_0
    move-exception v0

    move-object p1, v0

    if-eqz v2, :cond_4

    .line 646
    invoke-interface {v2}, Lnicoid/network238/okio/Socket;->cancel()V

    :cond_4
    if-eqz p3, :cond_5

    .line 650
    iget-object p2, v1, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast p2, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;

    if-eqz p2, :cond_5

    invoke-static {p2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    :cond_5
    throw p1

    :catchall_1
    move-exception v0

    move-object p1, v0

    .line 624
    monitor-exit p0

    throw p1
.end method

.method public final finishReader()V
    .registers 14

    .line 349
    monitor-enter p0

    .line 350
    :try_start_0
    iget v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedCloseCode:I

    .line 351
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedCloseReason:Ljava/lang/String;

    .line 353
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->reader:Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;

    .line 354
    const/4 v3, 0x0

    iput-object v3, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->reader:Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;

    .line 356
    iget-boolean v4, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->enqueuedClose:Z

    if-eqz v4, :cond_1

    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v4}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 358
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->writer:Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;

    if-eqz v4, :cond_0

    .line 360
    iput-object v3, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->writer:Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;

    .line 361
    iget-object v5, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->taskQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->name:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, " writer close"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v10, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$1;

    invoke-direct {v10, v4}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$1;-><init>(Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;)V

    const/4 v11, 0x2

    const/4 v12, 0x0

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    invoke-static/range {v5 .. v12}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    .line 366
    :cond_0
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->taskQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->shutdown()V

    .line 369
    :cond_1
    iget-boolean v3, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failed:Z

    if-nez v3, :cond_2

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->writer:Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;

    if-nez v3, :cond_2

    iget v3, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedCloseCode:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_2

    const/4 v3, 0x1

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    .line 370
    :goto_0
    sget-object v4, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 349
    monitor-exit p0

    if-eqz v3, :cond_3

    .line 373
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->listener:Lnicoid/network238/okhttp3/WebSocketListener;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, p0, v0, v1}, Lnicoid/network238/okhttp3/WebSocketListener;->onClosed(Lnicoid/network238/okhttp3/WebSocket;ILjava/lang/String;)V

    :cond_3
    if-eqz v2, :cond_4

    .line 376
    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    :cond_4
    return-void

    :catchall_0
    move-exception v0

    .line 349
    monitor-exit p0

    throw v0
.end method

.method public final getCall$okhttp()Lnicoid/network238/okhttp3/Call;
    .registers 2

    .line 76
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->call:Lnicoid/network238/okhttp3/Call;

    return-object v0
.end method

.method public final getListener$okhttp()Lnicoid/network238/okhttp3/WebSocketListener;
    .registers 2

    .line 59
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->listener:Lnicoid/network238/okhttp3/WebSocketListener;

    return-object v0
.end method

.method public final initReaderAndWriter(Ljava/lang/String;Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;Z)V
    .registers 16

    move v1, p3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 274
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->extensions:Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 275
    monitor-enter p0

    .line 276
    :try_start_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->name:Ljava/lang/String;

    .line 277
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->socket:Lnicoid/network238/okio/Socket;

    .line 279
    new-instance v4, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;

    .line 281
    invoke-interface {p2}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v6

    .line 282
    iget-object v7, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->random:Ljava/util/Random;

    .line 283
    iget-boolean v8, v2, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->perMessageDeflate:Z

    .line 284
    invoke-virtual {v2, p3}, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->noContextTakeover(Z)Z

    move-result v9

    .line 285
    iget-wide v10, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->minimumDeflateSize:J

    .line 279
    move v5, v1

    invoke-direct/range {v4 .. v11}, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;-><init>(ZLnicoid/network238/okio/BufferedSink;Ljava/util/Random;ZZJ)V

    .line 278
    iput-object v4, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->writer:Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;

    .line 287
    new-instance v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$WriterTask;

    invoke-direct {v1, p0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$WriterTask;-><init>(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;)V

    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->writerTask:Lnicoid/network238/okhttp3/internal/concurrent/Task;

    .line 288
    iget-wide v4, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->pingIntervalMillis:J

    const-wide/16 v6, 0x0

    cmp-long v1, v4, v6

    if-eqz v1, :cond_0

    .line 289
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v4, v5}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v4

    .line 290
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->taskQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, " ping"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v6, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$2;

    invoke-direct {v6, p0, v4, v5}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$2;-><init>(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;J)V

    invoke-virtual {v1, v0, v4, v5, v6}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->schedule(Ljava/lang/String;JLnicoid/network238/kotlin/jvm/functions/Function0;)V

    .line 295
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 296
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->runWriter()V

    .line 298
    :cond_1
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 275
    monitor-exit p0

    .line 301
    new-instance v0, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;

    .line 303
    invoke-interface {p2}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSource()Lnicoid/network238/okio/BufferedSource;

    move-result-object v1

    .line 305
    iget-boolean v4, v2, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->perMessageDeflate:Z

    xor-int/lit8 v5, p3, 0x1

    .line 306
    invoke-virtual {v2, v5}, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->noContextTakeover(Z)Z

    move-result v5

    .line 301
    move-object v3, p0

    move-object v2, v1

    move v1, p3

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;-><init>(ZLnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/internal/ws/WebSocketReader$FrameCallback;ZZ)V

    .line 300
    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->reader:Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;

    return-void

    :catchall_0
    move-exception v0

    .line 275
    monitor-exit p0

    throw v0
.end method

.method public final loopReader(Lnicoid/network238/okhttp3/Response;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 314
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->listener:Lnicoid/network238/okhttp3/WebSocketListener;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/WebSocketListener;->onOpen(Lnicoid/network238/okhttp3/WebSocket;Lnicoid/network238/okhttp3/Response;)V

    .line 315
    :goto_0
    iget p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedCloseCode:I

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 317
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->reader:Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->processNextFrame()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 322
    :catch_0
    move-exception v0

    move-object p1, v0

    move-object v2, p1

    .line 320
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x6

    const/4 v6, 0x0

    move-object v1, p0

    :try_start_1
    invoke-static/range {v1 .. v6}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failWebSocket$default(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;Ljava/lang/Exception;Lnicoid/network238/okhttp3/Response;ZILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 322
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->finishReader()V

    return-void

    :catchall_0
    move-exception v0

    move-object p1, v0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->finishReader()V

    throw p1
.end method

.method public onReadClose(ILjava/lang/String;)V
    .registers 5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, -0x1

    if-eq p1, v0, :cond_1

    .line 423
    monitor-enter p0

    .line 424
    :try_start_0
    iget v1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedCloseCode:I

    if-ne v1, v0, :cond_0

    .line 425
    iput p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedCloseCode:I

    .line 426
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedCloseReason:Ljava/lang/String;

    .line 427
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 423
    monitor-exit p0

    .line 429
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->listener:Lnicoid/network238/okhttp3/WebSocketListener;

    invoke-virtual {v0, p0, p1, p2}, Lnicoid/network238/okhttp3/WebSocketListener;->onClosing(Lnicoid/network238/okhttp3/WebSocket;ILjava/lang/String;)V

    return-void

    .line 424
    :cond_0
    :try_start_1
    const-string p1, "already closed"

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 423
    monitor-exit p0

    throw p1

    .line 421
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Failed requirement."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onReadMessage(Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 394
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->listener:Lnicoid/network238/okhttp3/WebSocketListener;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/WebSocketListener;->onMessage(Lnicoid/network238/okhttp3/WebSocket;Ljava/lang/String;)V

    return-void
.end method

.method public onReadMessage(Lnicoid/network238/okio/ByteString;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 399
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->listener:Lnicoid/network238/okhttp3/WebSocketListener;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/WebSocketListener;->onMessage(Lnicoid/network238/okhttp3/WebSocket;Lnicoid/network238/okio/ByteString;)V

    return-void
.end method

.method public declared-synchronized onReadPing(Lnicoid/network238/okio/ByteString;)V
    .registers 3

    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 404
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failed:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->enqueuedClose:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 406
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->pongQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 407
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->runWriter()V

    .line 408
    iget p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedPingCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedPingCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    .line 403
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public declared-synchronized onReadPong(Lnicoid/network238/okio/ByteString;)V
    .registers 2

    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 413
    iget p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedPongCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedPongCount:I

    .line 414
    const/4 p1, 0x0

    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->awaitingPong:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 412
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public final declared-synchronized pong(Lnicoid/network238/okio/ByteString;)Z
    .registers 3

    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 460
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failed:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->enqueuedClose:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 462
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->pongQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 463
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->runWriter()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    const/4 p1, 0x1

    return p1

    :cond_1
    monitor-exit p0

    const/4 p1, 0x0

    return p1

    .line 459
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public final processNextFrame()Z
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 333
    const/4 v1, 0x0

    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->reader:Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;->processNextFrame()V

    .line 334
    iget v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedCloseCode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    return v1

    :catch_0
    move-exception v0

    move-object v3, v0

    .line 336
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x6

    const/4 v7, 0x0

    move-object v2, p0

    invoke-static/range {v2 .. v7}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failWebSocket$default(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;Ljava/lang/Exception;Lnicoid/network238/okhttp3/Response;ZILjava/lang/Object;)V

    return v1
.end method

.method public declared-synchronized queueSize()J
    .registers 3

    monitor-enter p0

    .line 141
    :try_start_0
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->queueSize:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    .line 141
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final declared-synchronized receivedPingCount()I
    .registers 2

    monitor-enter p0

    .line 388
    :try_start_0
    iget v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedPingCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 388
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final declared-synchronized receivedPongCount()I
    .registers 2

    monitor-enter p0

    .line 390
    :try_start_0
    iget v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedPongCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 390
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public request()Lnicoid/network238/okhttp3/Request;
    .registers 2

    .line 139
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->originalRequest:Lnicoid/network238/okhttp3/Request;

    return-object v0
.end method

.method public send(Ljava/lang/String;)Z
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 434
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->send(Lnicoid/network238/okio/ByteString;I)Z

    move-result p1

    return p1
.end method

.method public send(Lnicoid/network238/okio/ByteString;)Z
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 436
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->send(Lnicoid/network238/okio/ByteString;I)Z

    move-result p1

    return p1
.end method

.method public final declared-synchronized sentPingCount()I
    .registers 2

    monitor-enter p0

    .line 386
    :try_start_0
    iget v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->sentPingCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 386
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final setCall$okhttp(Lnicoid/network238/okhttp3/Call;)V
    .registers 2

    .line 76
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->call:Lnicoid/network238/okhttp3/Call;

    return-void
.end method

.method public final tearDown()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 382
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->taskQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->shutdown()V

    .line 383
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->taskQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->idleLatch()Ljava/util/concurrent/CountDownLatch;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0xa

    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    return-void
.end method

.method public final writeOneFrame$okhttp()Z
    .registers 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 530
    move-object/from16 v1, p0

    monitor-enter p0

    .line 531
    :try_start_0
    iget-boolean v0, v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failed:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 535
    :cond_0
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->writer:Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;

    .line 536
    iget-object v3, v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->pongQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, -0x1

    if-nez v3, :cond_5

    .line 538
    iget-object v7, v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v7}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v7

    .line 539
    instance-of v8, v7, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;

    if-eqz v8, :cond_3

    .line 540
    iget v8, v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedCloseCode:I

    .line 541
    iget-object v9, v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->receivedCloseReason:Ljava/lang/String;

    if-eq v8, v6, :cond_2

    .line 543
    iget-object v6, v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->writer:Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;

    .line 544
    iput-object v5, v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->writer:Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;

    if-eqz v6, :cond_1

    .line 545
    iget-object v5, v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->reader:Lnicoid/network238/okhttp3/internal/ws/WebSocketReader;

    if-nez v5, :cond_1

    move v2, v4

    goto :goto_0

    :cond_1
    nop

    .line 546
    :goto_0
    iget-object v5, v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->taskQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->shutdown()V

    move-object v5, v7

    goto :goto_3

    .line 549
    :cond_2
    move-object v6, v7

    check-cast v6, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;->getCancelAfterCloseMillis()J

    move-result-wide v10

    .line 550
    iget-object v12, v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->taskQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->name:Ljava/lang/String;

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v13, " cancel"

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v10, v11}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v14

    new-instance v6, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$0;

    invoke-direct {v6, v1}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$0;-><init>(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;)V

    const/16 v18, 0x4

    const/16 v19, 0x0

    const/16 v16, 0x0

    move-object/from16 v17, v6

    invoke-static/range {v12 .. v19}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    move-object v6, v5

    goto :goto_2

    :cond_3
    if-nez v7, :cond_4

    .line 530
    :goto_1
    monitor-exit p0

    return v2

    .line 550
    :cond_4
    move-object v9, v5

    move v8, v6

    move-object v6, v9

    :goto_2
    move-object v5, v7

    goto :goto_3

    .line 536
    :cond_5
    move-object v9, v5

    move v8, v6

    move-object v6, v9

    .line 558
    :goto_3
    :try_start_1
    sget-object v7, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 530
    monitor-exit p0

    if-eqz v3, :cond_6

    .line 562
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v3, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v0, v3}, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->writePong(Lnicoid/network238/okio/ByteString;)V

    goto :goto_4

    .line 563
    :cond_6
    instance-of v3, v5, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;

    if-eqz v3, :cond_7

    .line 565
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v2, v5

    check-cast v2, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;->getFormatOpcode()I

    move-result v2

    move-object v3, v5

    check-cast v3, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;->getData()Lnicoid/network238/okio/ByteString;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->writeMessageFrame(ILnicoid/network238/okio/ByteString;)V

    .line 566
    monitor-enter p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 567
    :try_start_3
    iget-wide v2, v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->queueSize:J

    check-cast v5, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Message;->getData()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    int-to-long v7, v0

    sub-long/2addr v2, v7

    iput-wide v2, v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->queueSize:J
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 566
    :try_start_4
    monitor-exit p0

    goto :goto_4

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 569
    :cond_7
    instance-of v3, v5, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;

    if-eqz v3, :cond_a

    .line 571
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v3, v5

    check-cast v3, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;->getCode()I

    move-result v3

    check-cast v5, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$Close;->getReason()Lnicoid/network238/okio/ByteString;

    move-result-object v5

    invoke-virtual {v0, v3, v5}, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->writeClose(ILnicoid/network238/okio/ByteString;)V

    if-eqz v2, :cond_8

    .line 575
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->listener:Lnicoid/network238/okhttp3/WebSocketListener;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1, v8, v9}, Lnicoid/network238/okhttp3/WebSocketListener;->onClosed(Lnicoid/network238/okhttp3/WebSocket;ILjava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :cond_8
    :goto_4
    if-eqz v6, :cond_9

    .line 583
    invoke-static {v6}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    :cond_9
    return v4

    .line 578
    :cond_a
    :try_start_5
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception v0

    if-eqz v6, :cond_b

    .line 581
    invoke-static {v6}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    :cond_b
    throw v0

    :catchall_2
    move-exception v0

    .line 530
    monitor-exit p0

    throw v0
.end method

.method public final writePingFrame$okhttp()V
    .registers 9

    .line 590
    monitor-enter p0

    .line 591
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failed:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 592
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->writer:Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_1

    .line 590
    :goto_0
    monitor-exit p0

    return-void

    .line 593
    :cond_1
    :try_start_1
    iget-boolean v2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->awaitingPong:Z

    const/4 v3, -0x1

    if-eqz v2, :cond_2

    iget v2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->sentPingCount:I

    goto :goto_1

    :cond_2
    move v2, v3

    .line 594
    :goto_1
    iget v4, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->sentPingCount:I

    const/4 v5, 0x1

    add-int/2addr v4, v5

    iput v4, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->sentPingCount:I

    .line 595
    iput-boolean v5, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->awaitingPong:Z

    .line 596
    sget-object v4, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 590
    monitor-exit p0

    if-eq v2, v3, :cond_3

    .line 601
    move v3, v2

    new-instance v2, Ljava/net/SocketTimeoutException;

    .line 602
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v4, "sent ping but didn\'t receive pong within "

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 603
    iget-wide v6, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->pingIntervalMillis:J

    .line 602
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "ms (after "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sub-int/2addr v3, v5

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " successful ping/pongs)"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 601
    invoke-direct {v2, v0}, Ljava/net/SocketTimeoutException;-><init>(Ljava/lang/String;)V

    .line 599
    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x2

    const/4 v6, 0x0

    move-object v1, p0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failWebSocket$default(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;Ljava/lang/Exception;Lnicoid/network238/okhttp3/Response;ZILjava/lang/Object;)V

    return-void

    .line 611
    :cond_3
    :try_start_2
    sget-object v1, Lnicoid/network238/okio/ByteString;->EMPTY:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/ws/WebSocketWriter;->writePing(Lnicoid/network238/okio/ByteString;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object v2, v0

    .line 613
    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x2

    const/4 v6, 0x0

    move-object v1, p0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failWebSocket$default(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;Ljava/lang/Exception;Lnicoid/network238/okhttp3/Response;ZILjava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    .line 590
    monitor-exit p0

    throw v0
.end method
