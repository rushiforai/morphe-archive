.class public final Lnicoid/network238/okhttp3/internal/http2/Http2Connection;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;
.implements Lnicoid/network238/okhttp3/internal/concurrent/Lockable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;,
        Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Companion;,
        Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;,
        Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u00c6\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010%\n\u0002\u0010\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010#\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0013\n\u0002\u0018\u0002\n\u0002\u0008\u0014\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u0000 \u00a1\u00012\u00020\u00012\u00020\u0002:\u0008\u009e\u0001\u009f\u0001\u00a0\u0001\u00a1\u0001B\u0011\u0008\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0006\u0010V\u001a\u00020\u0011J\u0010\u0010W\u001a\u0004\u0018\u00010\u00122\u0006\u0010X\u001a\u00020\u0011J\u0017\u0010Y\u001a\u0004\u0018\u00010\u00122\u0006\u0010Z\u001a\u00020\u0011H\u0000\u00a2\u0006\u0002\u0008[J\u0015\u0010\\\u001a\u00020]2\u0006\u0010^\u001a\u00020+H\u0000\u00a2\u0006\u0002\u0008_J$\u0010`\u001a\u00020\u00122\u0006\u0010a\u001a\u00020\u00112\u000c\u0010b\u001a\u0008\u0012\u0004\u0012\u00020d0c2\u0006\u0010e\u001a\u00020\u0008J\u001c\u0010f\u001a\u00020\u00122\u000c\u0010b\u001a\u0008\u0012\u0004\u0012\u00020d0c2\u0006\u0010e\u001a\u00020\u0008J&\u0010f\u001a\u00020\u00122\u0006\u0010a\u001a\u00020\u00112\u000c\u0010b\u001a\u0008\u0012\u0004\u0012\u00020d0c2\u0006\u0010e\u001a\u00020\u0008H\u0002J+\u0010g\u001a\u00020]2\u0006\u0010Z\u001a\u00020\u00112\u0006\u0010h\u001a\u00020\u00082\u000c\u0010i\u001a\u0008\u0012\u0004\u0012\u00020d0cH\u0000\u00a2\u0006\u0002\u0008jJ(\u0010k\u001a\u00020]2\u0006\u0010Z\u001a\u00020\u00112\u0006\u0010h\u001a\u00020\u00082\u0008\u0010l\u001a\u0004\u0018\u00010m2\u0006\u0010n\u001a\u00020+J\u001d\u0010o\u001a\u00020]2\u0006\u0010Z\u001a\u00020\u00112\u0006\u0010p\u001a\u00020qH\u0000\u00a2\u0006\u0002\u0008rJ\u001d\u0010s\u001a\u00020]2\u0006\u0010Z\u001a\u00020\u00112\u0006\u0010t\u001a\u00020qH\u0000\u00a2\u0006\u0002\u0008uJ\u001d\u0010v\u001a\u00020]2\u0006\u0010Z\u001a\u00020\u00112\u0006\u0010w\u001a\u00020+H\u0000\u00a2\u0006\u0002\u0008xJ\u001e\u0010y\u001a\u00020]2\u0006\u0010z\u001a\u00020\u00082\u0006\u0010{\u001a\u00020\u00112\u0006\u0010|\u001a\u00020\u0011J\u0006\u0010}\u001a\u00020]J\u0006\u0010y\u001a\u00020]J\u0006\u0010~\u001a\u00020]J\u0006\u0010\u007f\u001a\u00020]J\u000f\u0010\u0080\u0001\u001a\u00020]2\u0006\u0010t\u001a\u00020qJ\t\u0010\u0081\u0001\u001a\u00020]H\u0016J-\u0010\u0081\u0001\u001a\u00020]2\u0007\u0010\u0082\u0001\u001a\u00020q2\u0007\u0010\u0083\u0001\u001a\u00020q2\n\u0010\u0084\u0001\u001a\u0005\u0018\u00010\u0085\u0001H\u0000\u00a2\u0006\u0003\u0008\u0086\u0001J\u0015\u0010\u0087\u0001\u001a\u00020]2\n\u0010\u0088\u0001\u001a\u0005\u0018\u00010\u0085\u0001H\u0002J\u0014\u0010\u0089\u0001\u001a\u00020]2\t\u0008\u0002\u0010\u008a\u0001\u001a\u00020\u0008H\u0007J\u0010\u0010\u008b\u0001\u001a\u00020]2\u0007\u0010\u008c\u0001\u001a\u000207J\u0010\u0010\u008d\u0001\u001a\u00020\u00082\u0007\u0010\u008e\u0001\u001a\u00020+J\u000f\u0010\u008f\u0001\u001a\u00020]H\u0000\u00a2\u0006\u0003\u0008\u0090\u0001J\u0017\u0010\u0091\u0001\u001a\u00020\u00082\u0006\u0010Z\u001a\u00020\u0011H\u0000\u00a2\u0006\u0003\u0008\u0092\u0001J%\u0010\u0093\u0001\u001a\u00020]2\u0006\u0010Z\u001a\u00020\u00112\u000c\u0010b\u001a\u0008\u0012\u0004\u0012\u00020d0cH\u0000\u00a2\u0006\u0003\u0008\u0094\u0001J.\u0010\u0095\u0001\u001a\u00020]2\u0006\u0010Z\u001a\u00020\u00112\u000c\u0010b\u001a\u0008\u0012\u0004\u0012\u00020d0c2\u0007\u0010\u0096\u0001\u001a\u00020\u0008H\u0000\u00a2\u0006\u0003\u0008\u0097\u0001J2\u0010\u0098\u0001\u001a\u00020]2\u0006\u0010Z\u001a\u00020\u00112\u0008\u0010\u0099\u0001\u001a\u00030\u009a\u00012\u0006\u0010n\u001a\u00020\u00112\u0007\u0010\u0096\u0001\u001a\u00020\u0008H\u0000\u00a2\u0006\u0003\u0008\u009b\u0001J\u001f\u0010\u009c\u0001\u001a\u00020]2\u0006\u0010Z\u001a\u00020\u00112\u0006\u0010p\u001a\u00020qH\u0000\u00a2\u0006\u0003\u0008\u009d\u0001R\u0014\u0010\u0007\u001a\u00020\u0008X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0014\u0010\u000b\u001a\u00020\u000cX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000eR \u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u00120\u0010X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u0016X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0018R\u001a\u0010\u0019\u001a\u00020\u0011X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001a\u0010\u001b\"\u0004\u0008\u001c\u0010\u001dR\u001a\u0010\u001e\u001a\u00020\u0011X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001f\u0010\u001b\"\u0004\u0008 \u0010\u001dR\u000e\u0010!\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020#X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010$\u001a\u00020%X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010&\u001a\u00020%X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\'\u001a\u00020%X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010(\u001a\u00020)X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010*\u001a\u00020+X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010,\u001a\u00020+X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010-\u001a\u00020+X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010.\u001a\u00020+X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010/\u001a\u00020+X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00100\u001a\u00020+X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00101\u001a\u00020+X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u00102\u001a\u000203X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00084\u00105R\u0011\u00106\u001a\u000207\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00088\u00109R\u001a\u0010:\u001a\u000207X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008;\u00109\"\u0004\u0008<\u0010=R\u0011\u0010>\u001a\u00020?\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008@\u0010AR\u001e\u0010C\u001a\u00020+2\u0006\u0010B\u001a\u00020+@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008D\u0010ER\u001e\u0010F\u001a\u00020+2\u0006\u0010B\u001a\u00020+@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008G\u0010ER\u0014\u0010H\u001a\u00020IX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008J\u0010KR\u0011\u0010L\u001a\u00020M\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008N\u0010OR\u0015\u0010P\u001a\u00060QR\u00020\u0000\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008R\u0010SR\u0014\u0010T\u001a\u0008\u0012\u0004\u0012\u00020\u00110UX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u00a2\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Http2Connection;",
        "Ljava/io/Closeable;",
        "Lnicoid/network238/okhttp3/internal/concurrent/Lockable;",
        "builder",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;)V",
        "client",
        "",
        "getClient$okhttp",
        "()Z",
        "listener",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;",
        "getListener$okhttp",
        "()Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;",
        "streams",
        "",
        "",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Stream;",
        "getStreams$okhttp",
        "()Ljava/util/Map;",
        "connectionName",
        "",
        "getConnectionName$okhttp",
        "()Ljava/lang/String;",
        "lastGoodStreamId",
        "getLastGoodStreamId$okhttp",
        "()I",
        "setLastGoodStreamId$okhttp",
        "(I)V",
        "nextStreamId",
        "getNextStreamId$okhttp",
        "setNextStreamId$okhttp",
        "isShutdown",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "writerQueue",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;",
        "pushQueue",
        "settingsListenerQueue",
        "pushObserver",
        "Lnicoid/network238/okhttp3/internal/http2/PushObserver;",
        "intervalPingsSent",
        "",
        "intervalPongsReceived",
        "degradedPingsSent",
        "degradedPongsReceived",
        "awaitPingsSent",
        "awaitPongsReceived",
        "degradedPongDeadlineNs",
        "flowControlListener",
        "Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;",
        "getFlowControlListener$okhttp",
        "()Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;",
        "okHttpSettings",
        "Lnicoid/network238/okhttp3/internal/http2/Settings;",
        "getOkHttpSettings",
        "()Lnicoid/network238/okhttp3/internal/http2/Settings;",
        "peerSettings",
        "getPeerSettings",
        "setPeerSettings",
        "(Lnicoid/network238/okhttp3/internal/http2/Settings;)V",
        "readBytes",
        "Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;",
        "getReadBytes",
        "()Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;",
        "value",
        "writeBytesTotal",
        "getWriteBytesTotal",
        "()J",
        "writeBytesMaximum",
        "getWriteBytesMaximum",
        "socket",
        "Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;",
        "getSocket$okhttp",
        "()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;",
        "writer",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Writer;",
        "getWriter",
        "()Lnicoid/network238/okhttp3/internal/http2/Http2Writer;",
        "readerRunnable",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;",
        "getReaderRunnable",
        "()Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;",
        "currentPushRequests",
        "",
        "openStreamCount",
        "getStream",
        "id",
        "removeStream",
        "streamId",
        "removeStream$okhttp",
        "updateConnectionFlowControl",
        "",
        "read",
        "updateConnectionFlowControl$okhttp",
        "pushStream",
        "associatedStreamId",
        "requestHeaders",
        "",
        "Lnicoid/network238/okhttp3/internal/http2/Header;",
        "out",
        "newStream",
        "writeHeaders",
        "outFinished",
        "alternating",
        "writeHeaders$okhttp",
        "writeData",
        "buffer",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "writeSynResetLater",
        "errorCode",
        "Lnicoid/network238/okhttp3/internal/http2/ErrorCode;",
        "writeSynResetLater$okhttp",
        "writeSynReset",
        "statusCode",
        "writeSynReset$okhttp",
        "writeWindowUpdateLater",
        "unacknowledgedBytesRead",
        "writeWindowUpdateLater$okhttp",
        "writePing",
        "reply",
        "payload1",
        "payload2",
        "writePingAndAwaitPong",
        "awaitPong",
        "flush",
        "shutdown",
        "close",
        "connectionCode",
        "streamCode",
        "cause",
        "Ljava/io/IOException;",
        "close$okhttp",
        "failConnection",
        "e",
        "start",
        "sendConnectionPreface",
        "setSettings",
        "settings",
        "isHealthy",
        "nowNs",
        "sendDegradedPingLater",
        "sendDegradedPingLater$okhttp",
        "pushedStream",
        "pushedStream$okhttp",
        "pushRequestLater",
        "pushRequestLater$okhttp",
        "pushHeadersLater",
        "inFinished",
        "pushHeadersLater$okhttp",
        "pushDataLater",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "pushDataLater$okhttp",
        "pushResetLater",
        "pushResetLater$okhttp",
        "Builder",
        "ReaderRunnable",
        "Listener",
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
.field public static final AWAIT_PING:I = 0x3

.field public static final Companion:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Companion;

.field private static final DEFAULT_SETTINGS:Lnicoid/network238/okhttp3/internal/http2/Settings;

.field public static final DEGRADED_PING:I = 0x2

.field public static final DEGRADED_PONG_TIMEOUT_NS:I = 0x3b9aca00

.field public static final INTERVAL_PING:I = 0x1

.field public static final OKHTTP_CLIENT_WINDOW_SIZE:I = 0x1000000


# instance fields
.field private awaitPingsSent:J

.field private awaitPongsReceived:J

.field private final client:Z

.field private final connectionName:Ljava/lang/String;

.field private final currentPushRequests:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private degradedPingsSent:J

.field private degradedPongDeadlineNs:J

.field private degradedPongsReceived:J

.field private final flowControlListener:Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;

.field private intervalPingsSent:J

.field private intervalPongsReceived:J

.field private isShutdown:Z

.field private lastGoodStreamId:I

.field private final listener:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;

.field private nextStreamId:I

.field private final okHttpSettings:Lnicoid/network238/okhttp3/internal/http2/Settings;

.field private peerSettings:Lnicoid/network238/okhttp3/internal/http2/Settings;

.field private final pushObserver:Lnicoid/network238/okhttp3/internal/http2/PushObserver;

.field private final pushQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

.field private final readBytes:Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

.field private final readerRunnable:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;

.field private final settingsListenerQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

.field private final socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

.field private final streams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lnicoid/network238/okhttp3/internal/http2/Http2Stream;",
            ">;"
        }
    .end annotation
.end field

.field private final taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

.field private writeBytesMaximum:J

.field private writeBytesTotal:J

.field private final writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

.field private final writerQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->Companion:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Companion;

    .line 1036
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Settings;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/http2/Settings;-><init>()V

    .line 1037
    const/4 v1, 0x4

    const v2, 0xffff

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okhttp3/internal/http2/Settings;->set(II)Lnicoid/network238/okhttp3/internal/http2/Settings;

    .line 1038
    const/4 v1, 0x5

    const/16 v2, 0x4000

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okhttp3/internal/http2/Settings;->set(II)Lnicoid/network238/okhttp3/internal/http2/Settings;

    .line 1036
    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->DEFAULT_SETTINGS:Lnicoid/network238/okhttp3/internal/http2/Settings;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;)V
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->getClient$okhttp()Z

    move-result v0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->client:Z

    .line 72
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->getListener$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;

    move-result-object v1

    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->listener:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;

    .line 73
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    .line 74
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->getConnectionName$okhttp()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->connectionName:Ljava/lang/String;

    .line 78
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->getClient$okhttp()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x3

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    :goto_0
    iput v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->nextStreamId:I

    .line 83
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->getTaskRunner$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    move-result-object v2

    iput-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 86
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->newQueue()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v3

    iput-object v3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writerQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    .line 89
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->newQueue()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v4

    iput-object v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    .line 92
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->newQueue()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v2

    iput-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->settingsListenerQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    .line 95
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->getPushObserver$okhttp()Lnicoid/network238/okhttp3/internal/http2/PushObserver;

    move-result-object v2

    iput-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushObserver:Lnicoid/network238/okhttp3/internal/http2/PushObserver;

    .line 108
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->getFlowControlListener$okhttp()Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;

    move-result-object v2

    iput-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->flowControlListener:Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;

    .line 112
    new-instance v2, Lnicoid/network238/okhttp3/internal/http2/Settings;

    invoke-direct {v2}, Lnicoid/network238/okhttp3/internal/http2/Settings;-><init>()V

    .line 116
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->getClient$okhttp()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 117
    const/4 v4, 0x4

    const/high16 v5, 0x1000000

    invoke-virtual {v2, v4, v5}, Lnicoid/network238/okhttp3/internal/http2/Settings;->set(II)Lnicoid/network238/okhttp3/internal/http2/Settings;

    .line 112
    :cond_1
    iput-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->okHttpSettings:Lnicoid/network238/okhttp3/internal/http2/Settings;

    .line 125
    sget-object v2, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->DEFAULT_SETTINGS:Lnicoid/network238/okhttp3/internal/http2/Settings;

    iput-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->peerSettings:Lnicoid/network238/okhttp3/internal/http2/Settings;

    .line 128
    new-instance v2, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;-><init>(I)V

    iput-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->readBytes:Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

    .line 135
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->peerSettings:Lnicoid/network238/okhttp3/internal/http2/Settings;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/http2/Settings;->getInitialWindowSize()I

    move-result v2

    int-to-long v4, v2

    iput-wide v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeBytesMaximum:J

    .line 138
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->getSocket$okhttp()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v2

    iput-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    .line 139
    new-instance v4, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    invoke-interface {v2}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;-><init>(Lnicoid/network238/okio/BufferedSink;Z)V

    iput-object v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    .line 142
    new-instance v4, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;

    new-instance v5, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;

    invoke-interface {v2}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSource()Lnicoid/network238/okio/BufferedSource;

    move-result-object v2

    invoke-direct {v5, v2, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;-><init>(Lnicoid/network238/okio/BufferedSource;Z)V

    invoke-direct {v4, p0, v5}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/okhttp3/internal/http2/Http2Reader;)V

    iput-object v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->readerRunnable:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;

    .line 145
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->currentPushRequests:Ljava/util/Set;

    .line 148
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->getPingIntervalMillis$okhttp()I

    move-result v0

    if-eqz v0, :cond_2

    .line 149
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->getPingIntervalMillis$okhttp()I

    move-result p1

    int-to-long v4, p1

    invoke-virtual {v0, v4, v5}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v4

    .line 150
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " ping"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$1;

    invoke-direct {v0, p0, v4, v5}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$1;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;J)V

    invoke-virtual {v3, p1, v4, v5, v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->schedule(Ljava/lang/String;JLnicoid/network238/kotlin/jvm/functions/Function0;)V

    :cond_2
    return-void
.end method

.method static final _init_$lambda$0(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;J)J
    .registers 10

    .line 1097
    monitor-enter p0

    .line 153
    :try_start_0
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->intervalPongsReceived:J

    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->intervalPingsSent:J

    cmp-long v0, v0, v2

    const/4 v1, 0x1

    const/4 v4, 0x0

    if-gez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const-wide/16 v5, 0x1

    add-long/2addr v2, v5

    .line 156
    iput-wide v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->intervalPingsSent:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v0, v4

    .line 1097
    :goto_0
    monitor-exit p0

    if-eqz v0, :cond_1

    .line 161
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->failConnection(Ljava/io/IOException;)V

    const-wide/16 p0, -0x1

    return-wide p0

    :cond_1
    nop

    .line 164
    invoke-virtual {p0, v4, v1, v4}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writePing(ZII)V

    return-wide p1

    :catchall_0
    move-exception p1

    .line 1097
    monitor-exit p0

    throw p1
.end method

.method public static final synthetic access$failConnection(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Ljava/io/IOException;)V
    .registers 2

    .line 52
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->failConnection(Ljava/io/IOException;)V

    return-void
.end method

.method public static final synthetic access$getAwaitPongsReceived$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)J
    .registers 3

    .line 52
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->awaitPongsReceived:J

    return-wide v0
.end method

.method public static final synthetic access$getDEFAULT_SETTINGS$cp()Lnicoid/network238/okhttp3/internal/http2/Settings;
    .registers 1

    .line 52
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->DEFAULT_SETTINGS:Lnicoid/network238/okhttp3/internal/http2/Settings;

    return-object v0
.end method

.method public static final synthetic access$getDegradedPongsReceived$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)J
    .registers 3

    .line 52
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->degradedPongsReceived:J

    return-wide v0
.end method

.method public static final synthetic access$getIntervalPongsReceived$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)J
    .registers 3

    .line 52
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->intervalPongsReceived:J

    return-wide v0
.end method

.method public static final synthetic access$getSettingsListenerQueue$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;
    .registers 1

    .line 52
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->settingsListenerQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    return-object p0
.end method

.method public static final synthetic access$getTaskRunner$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;
    .registers 1

    .line 52
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    return-object p0
.end method

.method public static final synthetic access$getWriterQueue$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;
    .registers 1

    .line 52
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writerQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    return-object p0
.end method

.method public static final synthetic access$isShutdown$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)Z
    .registers 1

    .line 52
    iget-boolean p0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->isShutdown:Z

    return p0
.end method

.method public static final synthetic access$setAwaitPongsReceived$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;J)V
    .registers 3

    .line 52
    iput-wide p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->awaitPongsReceived:J

    return-void
.end method

.method public static final synthetic access$setDegradedPongsReceived$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;J)V
    .registers 3

    .line 52
    iput-wide p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->degradedPongsReceived:J

    return-void
.end method

.method public static final synthetic access$setIntervalPongsReceived$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;J)V
    .registers 3

    .line 52
    iput-wide p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->intervalPongsReceived:J

    return-void
.end method

.method public static final synthetic access$setShutdown$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Z)V
    .registers 2

    .line 52
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->isShutdown:Z

    return-void
.end method

.method public static final synthetic access$setWriteBytesMaximum$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;J)V
    .registers 3

    .line 52
    iput-wide p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeBytesMaximum:J

    return-void
.end method

.method private final failConnection(Ljava/io/IOException;)V
    .registers 3

    .line 489
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->PROTOCOL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-virtual {p0, v0, v0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->close$okhttp(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V

    return-void
.end method

.method private final newStream(ILjava/util/List;Z)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;Z)",
            "Lnicoid/network238/okhttp3/internal/http2/Http2Stream;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    xor-int/lit8 v3, p3, 0x1

    .line 242
    iget-object v6, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    .line 1054
    monitor-enter v6

    .line 1055
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 244
    :try_start_1
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->nextStreamId:I

    const v1, 0x3fffffff    # 1.9999999f

    if-le v0, v1, :cond_0

    .line 245
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->REFUSED_STREAM:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->shutdown(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    .line 247
    :cond_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->isShutdown:Z

    if-nez v0, :cond_6

    .line 250
    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->nextStreamId:I

    add-int/lit8 v0, v1, 0x2

    .line 251
    iput v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->nextStreamId:I

    .line 252
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    const/4 v5, 0x0

    const/4 v4, 0x0

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;-><init>(ILnicoid/network238/okhttp3/internal/http2/Http2Connection;ZZLnicoid/network238/okhttp3/Headers;)V

    if-eqz p3, :cond_1

    .line 254
    iget-wide v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeBytesTotal:J

    iget-wide v7, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeBytesMaximum:J

    cmp-long p3, v4, v7

    if-gez p3, :cond_1

    .line 255
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getWriteBytesTotal()J

    move-result-wide v4

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getWriteBytesMaximum()J

    move-result-wide v7

    cmp-long p3, v4, v7

    if-gez p3, :cond_1

    const/4 p3, 0x0

    goto :goto_0

    :cond_1
    const/4 p3, 0x1

    .line 256
    :goto_0
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->isOpen()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 257
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    :cond_2
    sget-object v2, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1055
    :try_start_2
    monitor-exit p0

    if-nez p1, :cond_3

    .line 261
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    invoke-virtual {p1, v3, v1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->headers(ZILjava/util/List;)V

    goto :goto_1

    .line 263
    :cond_3
    iget-boolean v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->client:Z

    if-nez v2, :cond_5

    .line 265
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    invoke-virtual {v2, p1, v1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->pushPromise(IILjava/util/List;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1054
    :goto_1
    monitor-exit v6

    if-eqz p3, :cond_4

    .line 270
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->flush()V

    :cond_4
    return-object v0

    .line 263
    :cond_5
    :try_start_3
    const-string p1, "client streams shouldn\'t have associated stream IDs"

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 248
    :cond_6
    :try_start_4
    new-instance p1, Lnicoid/network238/okhttp3/internal/http2/ConnectionShutdownException;

    invoke-direct {p1}, Lnicoid/network238/okhttp3/internal/http2/ConnectionShutdownException;-><init>()V

    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 1055
    :try_start_5
    monitor-exit p0

    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception v0

    move-object p1, v0

    .line 1054
    monitor-exit v6

    throw p1
.end method

.method static final pushDataLater$lambda$0(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ILnicoid/network238/okio/Buffer;IZ)Lnicoid/network238/kotlin/Unit;
    .registers 6

    .line 973
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushObserver:Lnicoid/network238/okhttp3/internal/http2/PushObserver;

    invoke-interface {v0, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/internal/http2/PushObserver;->onData(ILnicoid/network238/okio/BufferedSource;IZ)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 974
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    sget-object p3, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->CANCEL:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-virtual {p2, p1, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->rstStream(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    goto :goto_0

    :cond_0
    if-eqz p4, :cond_1

    .line 1112
    :goto_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 977
    :try_start_1
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->currentPushRequests:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 978
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1112
    :try_start_2
    monitor-exit p0

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p0

    .line 981
    :cond_1
    :goto_1
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method static final pushHeadersLater$lambda$0(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ILjava/util/List;Z)Lnicoid/network238/kotlin/Unit;
    .registers 5

    .line 945
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushObserver:Lnicoid/network238/okhttp3/internal/http2/PushObserver;

    invoke-interface {v0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http2/PushObserver;->onHeaders(ILjava/util/List;Z)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 947
    :try_start_0
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    sget-object p3, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->CANCEL:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-virtual {p2, p1, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->rstStream(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    goto :goto_0

    :cond_0
    if-eqz p3, :cond_1

    .line 1106
    :goto_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 950
    :try_start_1
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->currentPushRequests:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 951
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1106
    :try_start_2
    monitor-exit p0

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p0

    .line 954
    :cond_1
    :goto_1
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method static final pushRequestLater$lambda$1(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ILjava/util/List;)Lnicoid/network238/kotlin/Unit;
    .registers 4

    .line 927
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushObserver:Lnicoid/network238/okhttp3/internal/http2/PushObserver;

    invoke-interface {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/PushObserver;->onRequest(ILjava/util/List;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 930
    :try_start_0
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->CANCEL:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-virtual {p2, p1, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->rstStream(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    .line 1100
    monitor-enter p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 932
    :try_start_1
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->currentPushRequests:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 933
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1100
    :try_start_2
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p0

    .line 936
    :cond_0
    :goto_0
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method static final pushResetLater$lambda$0(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)Lnicoid/network238/kotlin/Unit;
    .registers 4

    .line 989
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushObserver:Lnicoid/network238/okhttp3/internal/http2/PushObserver;

    invoke-interface {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/PushObserver;->onReset(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    .line 1116
    monitor-enter p0

    .line 991
    :try_start_0
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->currentPushRequests:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1116
    monitor-exit p0

    .line 993
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0

    :catchall_0
    move-exception p1

    .line 1116
    monitor-exit p0

    throw p1
.end method

.method static final sendDegradedPingLater$lambda$1(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)Lnicoid/network238/kotlin/Unit;
    .registers 3

    .line 563
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writePing(ZII)V

    .line 564
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method public static synthetic start$default(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ZILjava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 p3, 0x1

    and-int/2addr p2, p3

    if-eqz p2, :cond_0

    move p1, p3

    .line 502
    :cond_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->start(Z)V

    return-void
.end method

.method static final writeSynResetLater$lambda$0(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)Lnicoid/network238/kotlin/Unit;
    .registers 3

    .line 344
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeSynReset$okhttp(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 346
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->failConnection(Ljava/io/IOException;)V

    .line 348
    :goto_0
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method static final writeWindowUpdateLater$lambda$0(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;IJ)Lnicoid/network238/kotlin/Unit;
    .registers 5

    .line 365
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->windowUpdate(IJ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 367
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->failConnection(Ljava/io/IOException;)V

    .line 369
    :goto_0
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method


# virtual methods
.method public final awaitPong()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1059
    monitor-enter p0

    .line 406
    :goto_0
    :try_start_0
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->awaitPongsReceived:J

    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->awaitPingsSent:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 1060
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    goto :goto_0

    .line 409
    :cond_0
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1059
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public close()V
    .registers 4

    .line 444
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->NO_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v1, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->CANCEL:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->close$okhttp(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V

    return-void
.end method

.method public final close$okhttp(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1063
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1064
    new-instance p1, Ljava/lang/AssertionError;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Thread "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " MUST NOT hold lock on "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 455
    :cond_0
    :try_start_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->shutdown(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 1072
    :goto_0
    monitor-enter p0

    .line 460
    :try_start_1
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_1

    .line 461
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    .line 1074
    new-array v1, v0, [Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-interface {p1, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    .line 462
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    goto :goto_1

    .line 460
    :cond_1
    const/4 p1, 0x0

    .line 464
    :goto_1
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1072
    monitor-exit p0

    .line 466
    check-cast p1, [Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    if-eqz p1, :cond_2

    .line 1075
    array-length v1, p1

    :goto_2
    if-ge v0, v1, :cond_2

    aget-object v2, p1, v0

    .line 468
    :try_start_2
    invoke-virtual {v2, p2, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->close(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    :catch_1
    move-exception v2

    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 474
    :cond_2
    :try_start_3
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_4

    :catch_2
    move-exception p1

    .line 479
    :goto_4
    :try_start_4
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    invoke-interface {p1}, Lnicoid/network238/okio/Socket;->cancel()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_5

    :catch_3
    move-exception p1

    .line 483
    :goto_5
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writerQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->shutdown()V

    .line 484
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->shutdown()V

    .line 485
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->settingsListenerQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->shutdown()V

    return-void

    :catchall_0
    move-exception p1

    .line 1072
    monitor-exit p0

    throw p1
.end method

.method public final flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 414
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->flush()V

    return-void
.end method

.method public final getClient$okhttp()Z
    .registers 2

    .line 69
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->client:Z

    return v0
.end method

.method public final getConnectionName$okhttp()Ljava/lang/String;
    .registers 2

    .line 74
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->connectionName:Ljava/lang/String;

    return-object v0
.end method

.method public final getFlowControlListener$okhttp()Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;
    .registers 2

    .line 108
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->flowControlListener:Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;

    return-object v0
.end method

.method public final getLastGoodStreamId$okhttp()I
    .registers 2

    .line 75
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->lastGoodStreamId:I

    return v0
.end method

.method public final getListener$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;
    .registers 2

    .line 72
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->listener:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;

    return-object v0
.end method

.method public final getNextStreamId$okhttp()I
    .registers 2

    .line 78
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->nextStreamId:I

    return v0
.end method

.method public final getOkHttpSettings()Lnicoid/network238/okhttp3/internal/http2/Settings;
    .registers 2

    .line 111
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->okHttpSettings:Lnicoid/network238/okhttp3/internal/http2/Settings;

    return-object v0
.end method

.method public final getPeerSettings()Lnicoid/network238/okhttp3/internal/http2/Settings;
    .registers 2

    .line 125
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->peerSettings:Lnicoid/network238/okhttp3/internal/http2/Settings;

    return-object v0
.end method

.method public final getReadBytes()Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;
    .registers 2

    .line 128
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->readBytes:Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

    return-object v0
.end method

.method public final getReaderRunnable()Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;
    .registers 2

    .line 142
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->readerRunnable:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;

    return-object v0
.end method

.method public final getSocket$okhttp()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;
    .registers 2

    .line 138
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    return-object v0
.end method

.method public final getStream(I)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;
    .registers 3

    .line 1049
    monitor-enter p0

    .line 176
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1049
    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final getStreams$okhttp()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lnicoid/network238/okhttp3/internal/http2/Http2Stream;",
            ">;"
        }
    .end annotation

    .line 73
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    return-object v0
.end method

.method public final getWriteBytesMaximum()J
    .registers 3

    .line 135
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeBytesMaximum:J

    return-wide v0
.end method

.method public final getWriteBytesTotal()J
    .registers 3

    .line 131
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeBytesTotal:J

    return-wide v0
.end method

.method public final getWriter()Lnicoid/network238/okhttp3/internal/http2/Http2Writer;
    .registers 2

    .line 139
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    return-object v0
.end method

.method public final isHealthy(J)Z
    .registers 7

    .line 1094
    monitor-enter p0

    .line 532
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->isShutdown:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 535
    :cond_0
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->degradedPongsReceived:J

    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->degradedPingsSent:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->degradedPongDeadlineNs:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmp-long p1, p1, v0

    if-ltz p1, :cond_1

    .line 1094
    :goto_0
    monitor-exit p0

    const/4 p1, 0x0

    return p1

    :cond_1
    monitor-exit p0

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final newStream(Ljava/util/List;Z)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;Z)",
            "Lnicoid/network238/okhttp3/internal/http2/Http2Stream;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 228
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->newStream(ILjava/util/List;Z)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    move-result-object p1

    return-object p1
.end method

.method public final openStreamCount()I
    .registers 2

    .line 1048
    monitor-enter p0

    .line 174
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1048
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final pushDataLater$okhttp(ILnicoid/network238/okio/BufferedSource;IZ)V
    .registers 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 968
    new-instance v3, Lnicoid/network238/okio/Buffer;

    invoke-direct {v3}, Lnicoid/network238/okio/Buffer;-><init>()V

    int-to-long v1, p3

    .line 969
    invoke-interface {p2, v1, v2}, Lnicoid/network238/okio/BufferedSource;->require(J)V

    .line 970
    invoke-interface {p2, v3, v1, v2}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    .line 971
    iget-object v6, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->connectionName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] onData"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$0;

    move-object v1, p0

    move v2, p1

    move v4, p3

    move/from16 v5, p4

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$0;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ILnicoid/network238/okio/Buffer;IZ)V

    const/4 v10, 0x6

    const/4 v11, 0x0

    move-object v4, v6

    move-object v5, v7

    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    move-object v9, v0

    invoke-static/range {v4 .. v11}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    return-void
.end method

.method public final pushHeadersLater$okhttp(ILjava/util/List;Z)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;Z)V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 944
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->connectionName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5b

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] onHeaders"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v5, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$6;

    invoke-direct {v5, p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$6;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ILjava/util/List;Z)V

    const/4 v6, 0x6

    const/4 v7, 0x0

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    invoke-static/range {v0 .. v7}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    return-void
.end method

.method public final pushRequestLater$okhttp(ILjava/util/List;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1096
    monitor-enter p0

    .line 920
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->currentPushRequests:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 921
    sget-object p2, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->PROTOCOL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeSynResetLater$okhttp(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1096
    monitor-exit p0

    return-void

    .line 924
    :cond_0
    :try_start_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->currentPushRequests:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1096
    monitor-exit p0

    .line 926
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->connectionName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] onRequest"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v7, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$5;

    invoke-direct {v7, p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$5;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ILjava/util/List;)V

    const/4 v8, 0x6

    const/4 v9, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v9}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 1096
    monitor-exit p0

    throw p1
.end method

.method public final pushResetLater$okhttp(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V
    .registers 11

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 988
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->connectionName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5b

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] onReset"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v5, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$7;

    invoke-direct {v5, p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$7;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    const/4 v6, 0x6

    const/4 v7, 0x0

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    invoke-static/range {v0 .. v7}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    return-void
.end method

.method public final pushStream(ILjava/util/List;Z)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;Z)",
            "Lnicoid/network238/okhttp3/internal/http2/Http2Stream;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 214
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->client:Z

    if-nez v0, :cond_0

    .line 215
    invoke-direct {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->newStream(ILjava/util/List;Z)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    move-result-object p1

    return-object p1

    .line 214
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Client cannot push requests."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final pushedStream$okhttp(I)Z
    .registers 3

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    and-int/2addr p1, v0

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final removeStream$okhttp(I)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;
    .registers 3

    .line 1050
    monitor-enter p0

    .line 180
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    .line 1051
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1050
    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    .line 185
    monitor-exit p0

    throw p1
.end method

.method public final sendDegradedPingLater$okhttp()V
    .registers 10

    .line 1095
    monitor-enter p0

    .line 558
    :try_start_0
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->degradedPongsReceived:J

    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->degradedPingsSent:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 1095
    monitor-exit p0

    return-void

    :cond_0
    const-wide/16 v0, 0x1

    add-long/2addr v2, v0

    .line 559
    :try_start_1
    iput-wide v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->degradedPingsSent:J

    .line 560
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const-wide/32 v2, 0x3b9aca00

    add-long/2addr v0, v2

    iput-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->degradedPongDeadlineNs:J

    .line 561
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1095
    monitor-exit p0

    .line 562
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writerQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->connectionName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " ping"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v6, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$3;

    invoke-direct {v6, p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$3;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)V

    const/4 v7, 0x6

    const/4 v8, 0x0

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    invoke-static/range {v1 .. v8}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    .line 1095
    monitor-exit p0

    throw v0
.end method

.method public final setLastGoodStreamId$okhttp(I)V
    .registers 2

    .line 75
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->lastGoodStreamId:I

    return-void
.end method

.method public final setNextStreamId$okhttp(I)V
    .registers 2

    .line 78
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->nextStreamId:I

    return-void
.end method

.method public final setPeerSettings(Lnicoid/network238/okhttp3/internal/http2/Settings;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 125
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->peerSettings:Lnicoid/network238/okhttp3/internal/http2/Settings;

    return-void
.end method

.method public final setSettings(Lnicoid/network238/okhttp3/internal/http2/Settings;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 519
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    .line 1092
    monitor-enter v0

    .line 1093
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 521
    :try_start_1
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->isShutdown:Z

    if-nez v1, :cond_0

    .line 524
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->okHttpSettings:Lnicoid/network238/okhttp3/internal/http2/Settings;

    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/internal/http2/Settings;->merge(Lnicoid/network238/okhttp3/internal/http2/Settings;)V

    .line 525
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1093
    :try_start_2
    monitor-exit p0

    .line 526
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->settings(Lnicoid/network238/okhttp3/internal/http2/Settings;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1092
    monitor-exit v0

    return-void

    .line 522
    :cond_0
    :try_start_3
    new-instance p1, Lnicoid/network238/okhttp3/internal/http2/ConnectionShutdownException;

    invoke-direct {p1}, Lnicoid/network238/okhttp3/internal/http2/ConnectionShutdownException;-><init>()V

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception p1

    .line 1093
    :try_start_4
    monitor-exit p0

    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception p1

    .line 1092
    monitor-exit v0

    throw p1
.end method

.method public final shutdown(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 424
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    .line 1061
    monitor-enter v0

    .line 1062
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 427
    :try_start_1
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->isShutdown:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_0

    .line 1062
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :cond_0
    nop

    .line 430
    const/4 v1, 0x1

    :try_start_3
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->isShutdown:Z

    .line 431
    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->lastGoodStreamId:I

    .line 432
    sget-object v2, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1062
    :try_start_4
    monitor-exit p0

    .line 435
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    sget-object v3, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->EMPTY_BYTE_ARRAY:[B

    invoke-virtual {v2, v1, p1, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->goAway(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;[B)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1061
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    .line 1062
    :try_start_5
    monitor-exit p0

    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception p1

    .line 1061
    monitor-exit v0

    throw p1
.end method

.method public final start()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->start$default(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ZILjava/lang/Object;)V

    return-void
.end method

.method public final start(Z)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 504
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->connectionPreface()V

    .line 505
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->okHttpSettings:Lnicoid/network238/okhttp3/internal/http2/Settings;

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->settings(Lnicoid/network238/okhttp3/internal/http2/Settings;)V

    .line 506
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->okHttpSettings:Lnicoid/network238/okhttp3/internal/http2/Settings;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Settings;->getInitialWindowSize()I

    move-result p1

    const v0, 0xffff

    if-eq p1, v0, :cond_0

    .line 508
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    sub-int/2addr p1, v0

    int-to-long v2, p1

    const/4 p1, 0x0

    invoke-virtual {v1, p1, v2, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->windowUpdate(IJ)V

    .line 513
    :cond_0
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->newQueue()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->connectionName:Ljava/lang/String;

    iget-object v5, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->readerRunnable:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;

    const/4 v6, 0x6

    const/4 v7, 0x0

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    invoke-static/range {v0 .. v7}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    return-void
.end method

.method public final updateConnectionFlowControl$okhttp(J)V
    .registers 10

    .line 1052
    monitor-enter p0

    .line 191
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->readBytes:Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

    const/4 v5, 0x2

    const/4 v6, 0x0

    const-wide/16 v3, 0x0

    move-wide v1, p1

    invoke-static/range {v0 .. v6}, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->update$default(Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;JJILjava/lang/Object;)V

    .line 192
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->readBytes:Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->getUnacknowledged()J

    move-result-wide v3

    .line 193
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->okHttpSettings:Lnicoid/network238/okhttp3/internal/http2/Settings;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Settings;->getInitialWindowSize()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    int-to-long p1, p1

    cmp-long p1, v3, p1

    if-ltz p1, :cond_0

    .line 194
    const/4 p1, 0x0

    invoke-virtual {p0, p1, v3, v4}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeWindowUpdateLater$okhttp(IJ)V

    .line 195
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->readBytes:Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

    const/4 v5, 0x1

    const/4 v6, 0x0

    const-wide/16 v1, 0x0

    invoke-static/range {v0 .. v6}, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->update$default(Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;JJILjava/lang/Object;)V

    .line 197
    :cond_0
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->flowControlListener:Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;

    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->readBytes:Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

    invoke-interface {p1, p2}, Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;->receivingConnectionWindowChanged(Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;)V

    .line 198
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1052
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    move-object p1, v0

    monitor-exit p0

    throw p1
.end method

.method public final writeData(IZLnicoid/network238/okio/Buffer;J)V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v2, p4, v0

    const/4 v3, 0x0

    if-nez v2, :cond_0

    .line 306
    iget-object p4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    invoke-virtual {p4, p2, p1, p3, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->data(ZILnicoid/network238/okio/Buffer;I)V

    return-void

    :cond_0
    :goto_0
    cmp-long v2, p4, v0

    if-lez v2, :cond_4

    .line 1056
    monitor-enter p0

    .line 315
    :goto_1
    :try_start_0
    iget-wide v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeBytesTotal:J

    iget-wide v6, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeBytesMaximum:J

    cmp-long v2, v4, v6

    if-ltz v2, :cond_2

    .line 318
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->streams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1057
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    goto :goto_1

    .line 319
    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "stream closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    sub-long/2addr v6, v4

    .line 328
    :try_start_1
    invoke-static {p4, p5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v2, v4

    .line 329
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->maxDataLength()I

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 330
    iget-wide v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeBytesTotal:J

    int-to-long v6, v2

    add-long/2addr v4, v6

    iput-wide v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeBytesTotal:J

    .line 331
    sget-object v4, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1056
    monitor-exit p0

    sub-long/2addr p4, v6

    .line 334
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    if-eqz p2, :cond_3

    cmp-long v5, p4, v0

    if-nez v5, :cond_3

    const/4 v5, 0x1

    goto :goto_2

    :cond_3
    move v5, v3

    :goto_2
    invoke-virtual {v4, v5, p1, p3, v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->data(ZILnicoid/network238/okio/Buffer;I)V

    goto :goto_0

    :catch_0
    move-exception p1

    .line 324
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 325
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V

    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p1

    .line 1056
    monitor-exit p0

    throw p1

    :cond_4
    return-void
.end method

.method public final writeHeaders$okhttp(IZLjava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 282
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    invoke-virtual {v0, p2, p1, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->headers(ZILjava/util/List;)V

    return-void
.end method

.method public final writePing()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1058
    monitor-enter p0

    .line 395
    :try_start_0
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->awaitPingsSent:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->awaitPingsSent:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1058
    monitor-exit p0

    .line 399
    const/4 v0, 0x0

    const/4 v1, 0x3

    const v2, 0x4f4b6f6b

    invoke-virtual {p0, v0, v1, v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writePing(ZII)V

    return-void

    :catchall_0
    move-exception v0

    .line 1058
    monitor-exit p0

    throw v0
.end method

.method public final writePing(ZII)V
    .registers 5

    .line 378
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->ping(ZII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 380
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->failConnection(Ljava/io/IOException;)V

    return-void
.end method

.method public final writePingAndAwaitPong()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 387
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writePing()V

    .line 388
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->awaitPong()V

    return-void
.end method

.method public final writeSynReset$okhttp(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 356
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writer:Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->rstStream(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    return-void
.end method

.method public final writeSynResetLater$okhttp(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V
    .registers 11

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 342
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writerQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->connectionName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5b

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] writeSynReset"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v5, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$4;

    invoke-direct {v5, p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$4;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    const/4 v6, 0x6

    const/4 v7, 0x0

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    invoke-static/range {v0 .. v7}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    return-void
.end method

.method public final writeWindowUpdateLater$okhttp(IJ)V
    .registers 12

    .line 363
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writerQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->connectionName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5b

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] windowUpdate"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v5, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$2;

    invoke-direct {v5, p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$2;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;IJ)V

    const/4 v6, 0x6

    const/4 v7, 0x0

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    invoke-static/range {v0 .. v7}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    return-void
.end method
