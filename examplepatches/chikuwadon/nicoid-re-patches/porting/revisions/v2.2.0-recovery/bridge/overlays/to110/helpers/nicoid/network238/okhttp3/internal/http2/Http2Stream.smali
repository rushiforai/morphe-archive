.class public final Lnicoid/network238/okhttp3/internal/http2/Http2Stream;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/concurrent/Lockable;
.implements Lnicoid/network238/okio/Socket;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/http2/Http2Stream$Companion;,
        Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;,
        Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;,
        Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u008c\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0011\u0018\u0000 b2\u00020\u00012\u00020\u0002:\u0004`abcB3\u0008\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u0012\u0006\u0010\t\u001a\u00020\u0008\u0012\u0008\u0010\n\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0010\u0010A\u001a\u00020\u000b2\u0008\u0008\u0002\u0010B\u001a\u00020\u0008J\u0008\u0010C\u001a\u0004\u0018\u00010\u000bJ$\u0010D\u001a\u00020E2\u000c\u0010F\u001a\u0008\u0012\u0004\u0012\u00020H0G2\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010I\u001a\u00020\u0008J\u000e\u0010J\u001a\u00020E2\u0006\u0010K\u001a\u00020\u000bJ\u0006\u0010+\u001a\u00020LJ\u0006\u0010/\u001a\u00020LJ\u0018\u0010M\u001a\u00020E2\u0006\u0010N\u001a\u0002022\u0008\u00107\u001a\u0004\u0018\u000108J\u0008\u0010O\u001a\u00020EH\u0016J\u000e\u0010P\u001a\u00020E2\u0006\u00101\u001a\u000202J\u001a\u0010Q\u001a\u00020\u00082\u0006\u00101\u001a\u0002022\u0008\u00107\u001a\u0004\u0018\u000108H\u0002J\u0016\u0010R\u001a\u00020E2\u0006\u0010#\u001a\u00020S2\u0006\u0010T\u001a\u00020\u0004J\u0016\u0010U\u001a\u00020E2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\t\u001a\u00020\u0008J\u000e\u0010V\u001a\u00020E2\u0006\u00101\u001a\u000202J\u0008\u0010W\u001a\u00020\u0008H\u0002J\r\u0010X\u001a\u00020EH\u0000\u00a2\u0006\u0002\u0008YJ\u000e\u0010Z\u001a\u00020E2\u0006\u0010[\u001a\u00020\u0017J\r\u0010\\\u001a\u00020EH\u0000\u00a2\u0006\u0002\u0008]J\r\u0010^\u001a\u00020EH\u0000\u00a2\u0006\u0002\u0008_R\u0011\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011R\u0011\u0010\u0012\u001a\u00020\u0013\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015R$\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0016\u001a\u00020\u0017@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0019\u0010\u001a\"\u0004\u0008\u001b\u0010\u001cR$\u0010\u001d\u001a\u00020\u00172\u0006\u0010\u0016\u001a\u00020\u0017@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001e\u0010\u001a\"\u0004\u0008\u001f\u0010\u001cR\u0014\u0010 \u001a\u0008\u0012\u0004\u0012\u00020\u000b0!X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0018\u0010#\u001a\u00060$R\u00020\u0000X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008%\u0010&R\u0018\u0010\'\u001a\u00060(R\u00020\u0000X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008)\u0010*R\u0018\u0010+\u001a\u00060,R\u00020\u0000X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008-\u0010.R\u0018\u0010/\u001a\u00060,R\u00020\u0000X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00080\u0010.R\u001e\u00101\u001a\u0004\u0018\u0001028@X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00083\u00104\"\u0004\u00085\u00106R\u001c\u00107\u001a\u0004\u0018\u000108X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00089\u0010:\"\u0004\u0008;\u0010<R\u0011\u0010=\u001a\u00020\u00088F\u00a2\u0006\u0006\u001a\u0004\u0008=\u0010>R\u0011\u0010?\u001a\u00020\u00088F\u00a2\u0006\u0006\u001a\u0004\u0008?\u0010>R\u0011\u0010@\u001a\u00020\u00088F\u00a2\u0006\u0006\u001a\u0004\u0008@\u0010>\u00a8\u0006d"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Http2Stream;",
        "Lnicoid/network238/okhttp3/internal/concurrent/Lockable;",
        "Lnicoid/network238/okio/Socket;",
        "id",
        "",
        "connection",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Connection;",
        "outFinished",
        "",
        "inFinished",
        "headers",
        "Lnicoid/network238/okhttp3/Headers;",
        "<init>",
        "(ILnicoid/network238/okhttp3/internal/http2/Http2Connection;ZZLnicoid/network238/okhttp3/Headers;)V",
        "getId",
        "()I",
        "getConnection",
        "()Lnicoid/network238/okhttp3/internal/http2/Http2Connection;",
        "readBytes",
        "Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;",
        "getReadBytes",
        "()Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;",
        "value",
        "",
        "writeBytesTotal",
        "getWriteBytesTotal",
        "()J",
        "setWriteBytesTotal$okhttp",
        "(J)V",
        "writeBytesMaximum",
        "getWriteBytesMaximum",
        "setWriteBytesMaximum$okhttp",
        "headersQueue",
        "Ljava/util/ArrayDeque;",
        "hasResponseHeaders",
        "source",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;",
        "getSource",
        "()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;",
        "sink",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;",
        "getSink",
        "()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;",
        "readTimeout",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;",
        "getReadTimeout$okhttp",
        "()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;",
        "writeTimeout",
        "getWriteTimeout$okhttp",
        "errorCode",
        "Lnicoid/network238/okhttp3/internal/http2/ErrorCode;",
        "getErrorCode$okhttp",
        "()Lnicoid/network238/okhttp3/internal/http2/ErrorCode;",
        "setErrorCode$okhttp",
        "(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V",
        "errorException",
        "Ljava/io/IOException;",
        "getErrorException$okhttp",
        "()Ljava/io/IOException;",
        "setErrorException$okhttp",
        "(Ljava/io/IOException;)V",
        "isOpen",
        "()Z",
        "isLocallyInitiated",
        "isSourceComplete",
        "takeHeaders",
        "callerIsIdle",
        "peekTrailers",
        "writeHeaders",
        "",
        "responseHeaders",
        "",
        "Lnicoid/network238/okhttp3/internal/http2/Header;",
        "flushHeaders",
        "enqueueTrailers",
        "trailers",
        "Lnicoid/network238/okio/Timeout;",
        "close",
        "rstStatusCode",
        "cancel",
        "closeLater",
        "closeInternal",
        "receiveData",
        "Lnicoid/network238/okio/BufferedSource;",
        "length",
        "receiveHeaders",
        "receiveRstStream",
        "doReadTimeout",
        "cancelStreamIfNecessary",
        "cancelStreamIfNecessary$okhttp",
        "addBytesToWriteWindow",
        "delta",
        "checkOutNotClosed",
        "checkOutNotClosed$okhttp",
        "waitForIo",
        "waitForIo$okhttp",
        "FramingSource",
        "FramingSink",
        "Companion",
        "StreamTimeout",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$Companion;

.field public static final EMIT_BUFFER_SIZE:J = 0x4000L


# instance fields
.field private final connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

.field private errorCode:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

.field private errorException:Ljava/io/IOException;

.field private hasResponseHeaders:Z

.field private final headersQueue:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Lnicoid/network238/okhttp3/Headers;",
            ">;"
        }
    .end annotation
.end field

.field private final id:I

.field private final readBytes:Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

.field private final readTimeout:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

.field private final sink:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

.field private final source:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

.field private writeBytesMaximum:J

.field private writeBytesTotal:J

.field private final writeTimeout:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->Companion:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$Companion;

    return-void
.end method

.method public constructor <init>(ILnicoid/network238/okhttp3/internal/http2/Http2Connection;ZZLnicoid/network238/okhttp3/Headers;)V
    .registers 9

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->id:I

    .line 43
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    .line 53
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

    invoke-direct {v0, p1}, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;-><init>(I)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->readBytes:Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

    .line 60
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getPeerSettings()Lnicoid/network238/okhttp3/internal/http2/Settings;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Settings;->getInitialWindowSize()I

    move-result p1

    int-to-long v0, p1

    iput-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->writeBytesMaximum:J

    .line 64
    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->headersQueue:Ljava/util/ArrayDeque;

    .line 70
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    .line 71
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getOkHttpSettings()Lnicoid/network238/okhttp3/internal/http2/Settings;

    move-result-object p2

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/http2/Settings;->getInitialWindowSize()I

    move-result p2

    int-to-long v1, p2

    .line 70
    invoke-direct {v0, p0, v1, v2, p4}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;JZ)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->source:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    .line 75
    new-instance p2, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    invoke-direct {p2, p0, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;Z)V

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->sink:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    .line 78
    new-instance p2, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-direct {p2, p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;)V

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->readTimeout:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    .line 79
    new-instance p2, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-direct {p2, p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;)V

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->writeTimeout:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    if-eqz p5, :cond_1

    .line 96
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->isLocallyInitiated()Z

    move-result p2

    if-nez p2, :cond_0

    .line 97
    invoke-interface {p1, p5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    return-void

    .line 96
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "locally-initiated streams shouldn\'t have headers yet"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 99
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->isLocallyInitiated()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "remotely-initiated streams should have headers"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static final synthetic access$doReadTimeout(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;)Z
    .registers 1

    .line 40
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->doReadTimeout()Z

    move-result p0

    return p0
.end method

.method private final closeInternal(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)Z
    .registers 4

    .line 758
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 759
    new-instance p1, Ljava/lang/AssertionError;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Thread "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " MUST NOT hold lock on "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 762
    :cond_0
    monitor-enter p0

    .line 275
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getErrorCode$okhttp()Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 278
    :cond_1
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->errorCode:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 279
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->errorException:Ljava/io/IOException;

    .line 763
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 281
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->getFinished$okhttp()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->getFinished()Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_2

    .line 762
    :goto_0
    monitor-exit p0

    const/4 p1, 0x0

    return p1

    .line 284
    :cond_2
    :try_start_1
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 762
    monitor-exit p0

    .line 285
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    iget p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->id:I

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->removeStream$okhttp(I)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    .line 762
    monitor-exit p0

    throw p1
.end method

.method private final doReadTimeout()Z
    .registers 2

    .line 345
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getClient$okhttp()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->getClosed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->getFinished()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public static synthetic takeHeaders$default(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;ZILjava/lang/Object;)Lnicoid/network238/okhttp3/Headers;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 148
    :cond_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->takeHeaders(Z)Lnicoid/network238/okhttp3/Headers;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final addBytesToWriteWindow(J)V
    .registers 5

    .line 691
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->writeBytesMaximum:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->writeBytesMaximum:J

    const-wide/16 v0, 0x0

    cmp-long p1, p1, v0

    if-lez p1, :cond_0

    .line 781
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    :cond_0
    return-void
.end method

.method public cancel()V
    .registers 2

    .line 254
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->CANCEL:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->closeLater(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    return-void
.end method

.method public final cancelStreamIfNecessary$okhttp()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 776
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 777
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

    const-string v2, " MUST NOT hold lock on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 780
    :cond_0
    monitor-enter p0

    .line 548
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->getFinished$okhttp()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->getClosed$okhttp()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->getFinished()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->getClosed()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 549
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->isOpen()Z

    move-result v1

    .line 550
    sget-object v2, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 780
    monitor-exit p0

    if-eqz v0, :cond_3

    .line 555
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->CANCEL:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->close(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V

    return-void

    :cond_3
    if-nez v1, :cond_4

    .line 557
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->id:I

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->removeStream$okhttp(I)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    :cond_4
    return-void

    :catchall_0
    move-exception v0

    .line 780
    monitor-exit p0

    throw v0
.end method

.method public final checkOutNotClosed$okhttp()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 700
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->getClosed()Z

    move-result v0

    if-nez v0, :cond_3

    .line 701
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->getFinished()Z

    move-result v0

    if-nez v0, :cond_2

    .line 702
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getErrorCode$okhttp()Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->errorException:Ljava/io/IOException;

    if-nez v0, :cond_0

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/StreamResetException;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getErrorCode$okhttp()Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/StreamResetException;-><init>(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    :cond_0
    throw v0

    :cond_1
    return-void

    .line 701
    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v1, "stream finished"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 700
    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "stream closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final close(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 247
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->closeInternal(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)Z

    move-result p2

    if-nez p2, :cond_0

    return-void

    .line 250
    :cond_0
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->id:I

    invoke-virtual {p2, v0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeSynReset$okhttp(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    return-void
.end method

.method public final closeLater(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 261
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->closeInternal(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 264
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->id:I

    invoke-virtual {v0, v1, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeSynResetLater$okhttp(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    return-void
.end method

.method public final enqueueTrailers(Lnicoid/network238/okhttp3/Headers;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 757
    monitor-enter p0

    .line 228
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->getFinished()Z

    move-result v0

    if-nez v0, :cond_1

    .line 229
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 230
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object v0

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->setTrailers(Lnicoid/network238/okhttp3/Headers;)V

    .line 231
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 757
    monitor-exit p0

    return-void

    .line 229
    :cond_0
    :try_start_1
    const-string p1, "trailers.size() == 0"

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 228
    :cond_1
    const-string p1, "already finished"

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 757
    monitor-exit p0

    throw p1
.end method

.method public final getConnection()Lnicoid/network238/okhttp3/internal/http2/Http2Connection;
    .registers 2

    .line 43
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    return-object v0
.end method

.method public final getErrorCode$okhttp()Lnicoid/network238/okhttp3/internal/http2/ErrorCode;
    .registers 2

    .line 745
    monitor-enter p0

    .line 89
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->errorCode:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 745
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final getErrorException$okhttp()Ljava/io/IOException;
    .registers 2

    .line 92
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->errorException:Ljava/io/IOException;

    return-object v0
.end method

.method public final getId()I
    .registers 2

    .line 42
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->id:I

    return v0
.end method

.method public final getReadBytes()Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;
    .registers 2

    .line 53
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->readBytes:Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

    return-object v0
.end method

.method public final getReadTimeout$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;
    .registers 2

    .line 78
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->readTimeout:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    return-object v0
.end method

.method public getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;
    .registers 2

    .line 74
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->sink:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    return-object v0
.end method

.method public bridge synthetic getSink()Lnicoid/network238/okio/Sink;
    .registers 2

    .line 40
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object v0

    return-object v0
.end method

.method public getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;
    .registers 2

    .line 69
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->source:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    return-object v0
.end method

.method public bridge synthetic getSource()Lnicoid/network238/okio/Source;
    .registers 2

    .line 40
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object v0

    return-object v0
.end method

.method public final getWriteBytesMaximum()J
    .registers 3

    .line 60
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->writeBytesMaximum:J

    return-wide v0
.end method

.method public final getWriteBytesTotal()J
    .registers 3

    .line 56
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->writeBytesTotal:J

    return-wide v0
.end method

.method public final getWriteTimeout$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;
    .registers 2

    .line 79
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->writeTimeout:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    return-object v0
.end method

.method public final isLocallyInitiated()Z
    .registers 5

    .line 131
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->id:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 132
    :goto_0
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getClient$okhttp()Z

    move-result v3

    if-ne v3, v0, :cond_1

    return v1

    :cond_1
    return v2
.end method

.method public final isOpen()Z
    .registers 2

    .line 746
    monitor-enter p0

    .line 115
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getErrorCode$okhttp()Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 118
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->getFinished$okhttp()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->getClosed$okhttp()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    .line 119
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->getFinished()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->getClosed()Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_1

    .line 120
    :cond_2
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->hasResponseHeaders:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_3

    .line 746
    :goto_0
    monitor-exit p0

    const/4 v0, 0x0

    return v0

    :cond_3
    :goto_1
    monitor-exit p0

    const/4 v0, 0x1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final isSourceComplete()Z
    .registers 2

    .line 747
    monitor-enter p0

    .line 136
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->getFinished$okhttp()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->getReadBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->exhausted()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 747
    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final peekTrailers()Lnicoid/network238/okhttp3/Headers;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 749
    monitor-enter p0

    .line 176
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->getFinished$okhttp()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->getReceiveBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->exhausted()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->getReadBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->exhausted()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 177
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->getTrailers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lnicoid/network238/okhttp3/Headers;->EMPTY:Lnicoid/network238/okhttp3/Headers;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 749
    :cond_0
    monitor-exit p0

    return-object v0

    .line 179
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getErrorCode$okhttp()Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 180
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->errorException:Ljava/io/IOException;

    if-nez v0, :cond_2

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/StreamResetException;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getErrorCode$okhttp()Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/StreamResetException;-><init>(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    :cond_2
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 749
    :cond_3
    monitor-exit p0

    const/4 v0, 0x0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final readTimeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 234
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->readTimeout:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    return-object v0
.end method

.method public final receiveData(Lnicoid/network238/okio/BufferedSource;I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 764
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 765
    new-instance p1, Ljava/lang/AssertionError;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Thread "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " MUST NOT hold lock on "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 296
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object v0

    int-to-long v1, p2

    invoke-virtual {v0, p1, v1, v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->receive$okhttp(Lnicoid/network238/okio/BufferedSource;J)V

    return-void
.end method

.method public final receiveHeaders(Lnicoid/network238/okhttp3/Headers;Z)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 768
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 769
    new-instance p1, Ljava/lang/AssertionError;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Thread "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " MUST NOT hold lock on "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 772
    :cond_0
    monitor-enter p0

    .line 308
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->hasResponseHeaders:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    .line 309
    const-string v0, ":status"

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 310
    const-string v0, ":method"

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 315
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object v0

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->setTrailers(Lnicoid/network238/okhttp3/Headers;)V

    goto :goto_1

    :cond_2
    :goto_0
    nop

    .line 312
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->hasResponseHeaders:Z

    .line 313
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->headersQueue:Ljava/util/ArrayDeque;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :goto_1
    if-eqz p2, :cond_3

    .line 318
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object p1

    invoke-virtual {p1, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->setFinished$okhttp(Z)V

    .line 320
    :cond_3
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->isOpen()Z

    move-result p1

    .line 773
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 322
    sget-object p2, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 772
    monitor-exit p0

    if-nez p1, :cond_4

    .line 324
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    iget p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->id:I

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->removeStream$okhttp(I)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    :cond_4
    return-void

    :catchall_0
    move-exception p1

    .line 772
    monitor-exit p0

    throw p1
.end method

.method public final receiveRstStream(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 774
    monitor-enter p0

    .line 330
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getErrorCode$okhttp()Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object v0

    if-nez v0, :cond_0

    .line 331
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->errorCode:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 775
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 334
    :cond_0
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 774
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final setErrorCode$okhttp(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V
    .registers 2

    .line 88
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->errorCode:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    return-void
.end method

.method public final setErrorException$okhttp(Ljava/io/IOException;)V
    .registers 2

    .line 92
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->errorException:Ljava/io/IOException;

    return-void
.end method

.method public final setWriteBytesMaximum$okhttp(J)V
    .registers 3

    .line 61
    iput-wide p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->writeBytesMaximum:J

    return-void
.end method

.method public final setWriteBytesTotal$okhttp(J)V
    .registers 3

    .line 57
    iput-wide p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->writeBytesTotal:J

    return-void
.end method

.method public final takeHeaders(Z)Lnicoid/network238/okhttp3/Headers;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 748
    monitor-enter p0

    .line 150
    :cond_0
    :goto_0
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->headersQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getErrorCode$okhttp()Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object v0

    if-nez v0, :cond_4

    if-nez p1, :cond_1

    .line 151
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->doReadTimeout()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_2

    .line 153
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->readTimeout:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-virtual {v1}, Lnicoid/network238/okio/AsyncTimeout;->enter()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 156
    :cond_2
    :try_start_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->waitForIo$okhttp()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_0

    .line 159
    :try_start_2
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->readTimeout:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    goto :goto_0

    :catchall_0
    move-exception p1

    if-eqz v0, :cond_3

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->readTimeout:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    :cond_3
    throw p1

    .line 163
    :cond_4
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->headersQueue:Ljava/util/ArrayDeque;

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_5

    .line 164
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->headersQueue:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p1, Lnicoid/network238/okhttp3/Headers;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 748
    monitor-exit p0

    return-object p1

    .line 166
    :cond_5
    :try_start_3
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->errorException:Ljava/io/IOException;

    if-nez p1, :cond_6

    new-instance p1, Lnicoid/network238/okhttp3/internal/http2/StreamResetException;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getErrorCode$okhttp()Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p1, v0}, Lnicoid/network238/okhttp3/internal/http2/StreamResetException;-><init>(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    :cond_6
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final waitForIo$okhttp()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InterruptedIOException;
        }
    .end annotation

    .line 782
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 715
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 716
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    throw v0
.end method

.method public final writeHeaders(Ljava/util/List;ZZ)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;ZZ)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 750
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 751
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

    .line 754
    :cond_0
    monitor-enter p0

    .line 204
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->hasResponseHeaders:Z

    if-eqz p2, :cond_1

    .line 206
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object v1

    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->setFinished(Z)V

    .line 755
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 209
    :cond_1
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 754
    monitor-exit p0

    if-nez p3, :cond_3

    .line 756
    monitor-enter p0

    .line 215
    :try_start_1
    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getWriteBytesTotal()J

    move-result-wide v1

    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getWriteBytesMaximum()J

    move-result-wide v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    cmp-long p3, v1, v3

    if-ltz p3, :cond_2

    move p3, v0

    goto :goto_0

    :cond_2
    const/4 p3, 0x0

    .line 756
    :goto_0
    monitor-exit p0

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    .line 219
    :cond_3
    :goto_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->id:I

    invoke-virtual {v0, v1, p2, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeHeaders$okhttp(IZLjava/util/List;)V

    if-eqz p3, :cond_4

    .line 222
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->flush()V

    :cond_4
    return-void

    :catchall_1
    move-exception p1

    .line 754
    monitor-exit p0

    throw p1
.end method

.method public final writeTimeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 236
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->writeTimeout:Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    return-object v0
.end method
