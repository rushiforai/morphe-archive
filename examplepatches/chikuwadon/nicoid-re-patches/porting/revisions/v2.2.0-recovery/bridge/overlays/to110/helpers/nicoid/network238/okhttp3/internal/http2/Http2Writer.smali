.class public final Lnicoid/network238/okhttp3/internal/http2/Http2Writer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;
.implements Lnicoid/network238/okhttp3/internal/concurrent/Lockable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/http2/Http2Writer$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0010\n\u0002\u0010\u0012\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\t\u0018\u0000 <2\u00020\u00012\u00020\u0002:\u0001<B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0006\u0010\u0012\u001a\u00020\u0013J\u000e\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0015\u001a\u00020\u0016J$\u0010\u0017\u001a\u00020\u00132\u0006\u0010\u0018\u001a\u00020\u000c2\u0006\u0010\u0019\u001a\u00020\u000c2\u000c\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001bJ\u0006\u0010\u001d\u001a\u00020\u0013J\u0016\u0010\u001e\u001a\u00020\u00132\u0006\u0010\u0018\u001a\u00020\u000c2\u0006\u0010\u001f\u001a\u00020 J\u0006\u0010!\u001a\u00020\u000cJ(\u0010\"\u001a\u00020\u00132\u0006\u0010#\u001a\u00020\u00062\u0006\u0010\u0018\u001a\u00020\u000c2\u0008\u0010$\u001a\u0004\u0018\u00010\n2\u0006\u0010%\u001a\u00020\u000cJ(\u0010&\u001a\u00020\u00132\u0006\u0010\u0018\u001a\u00020\u000c2\u0006\u0010\'\u001a\u00020\u000c2\u0008\u0010(\u001a\u0004\u0018\u00010\n2\u0006\u0010%\u001a\u00020\u000cJ\u000e\u0010)\u001a\u00020\u00132\u0006\u0010)\u001a\u00020\u0016J\u001e\u0010*\u001a\u00020\u00132\u0006\u0010+\u001a\u00020\u00062\u0006\u0010,\u001a\u00020\u000c2\u0006\u0010-\u001a\u00020\u000cJ\u001e\u0010.\u001a\u00020\u00132\u0006\u0010/\u001a\u00020\u000c2\u0006\u0010\u001f\u001a\u00020 2\u0006\u00100\u001a\u000201J\u0016\u00102\u001a\u00020\u00132\u0006\u0010\u0018\u001a\u00020\u000c2\u0006\u00103\u001a\u000204J&\u00105\u001a\u00020\u00132\u0006\u0010\u0018\u001a\u00020\u000c2\u0006\u00106\u001a\u00020\u000c2\u0006\u00107\u001a\u00020\u000c2\u0006\u0010\'\u001a\u00020\u000cJ\u0008\u00108\u001a\u00020\u0013H\u0016J\u0018\u00109\u001a\u00020\u00132\u0006\u0010\u0018\u001a\u00020\u000c2\u0006\u0010%\u001a\u000204H\u0002J$\u0010:\u001a\u00020\u00132\u0006\u0010#\u001a\u00020\u00062\u0006\u0010\u0018\u001a\u00020\u000c2\u000c\u0010;\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001bR\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u000e\u001a\u00020\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006="
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Http2Writer;",
        "Ljava/io/Closeable;",
        "Lnicoid/network238/okhttp3/internal/concurrent/Lockable;",
        "sink",
        "Lnicoid/network238/okio/BufferedSink;",
        "client",
        "",
        "<init>",
        "(Lnicoid/network238/okio/BufferedSink;Z)V",
        "hpackBuffer",
        "Lnicoid/network238/okio/Buffer;",
        "maxFrameSize",
        "",
        "closed",
        "hpackWriter",
        "Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;",
        "getHpackWriter",
        "()Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;",
        "connectionPreface",
        "",
        "applyAndAckSettings",
        "peerSettings",
        "Lnicoid/network238/okhttp3/internal/http2/Settings;",
        "pushPromise",
        "streamId",
        "promisedStreamId",
        "requestHeaders",
        "",
        "Lnicoid/network238/okhttp3/internal/http2/Header;",
        "flush",
        "rstStream",
        "errorCode",
        "Lnicoid/network238/okhttp3/internal/http2/ErrorCode;",
        "maxDataLength",
        "data",
        "outFinished",
        "source",
        "byteCount",
        "dataFrame",
        "flags",
        "buffer",
        "settings",
        "ping",
        "ack",
        "payload1",
        "payload2",
        "goAway",
        "lastGoodStreamId",
        "debugData",
        "",
        "windowUpdate",
        "windowSizeIncrement",
        "",
        "frameHeader",
        "length",
        "type",
        "close",
        "writeContinuationFrames",
        "headers",
        "headerBlock",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/http2/Http2Writer$Companion;

.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private final client:Z

.field private closed:Z

.field private final hpackBuffer:Lnicoid/network238/okio/Buffer;

.field private final hpackWriter:Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;

.field private maxFrameSize:I

.field private final sink:Lnicoid/network238/okio/BufferedSink;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->Companion:Lnicoid/network238/okhttp3/internal/http2/Http2Writer$Companion;

    .line 381
    const-class v0, Lnicoid/network238/okhttp3/internal/http2/Http2;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/BufferedSink;Z)V
    .registers 9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    .line 50
    iput-boolean p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->client:Z

    .line 53
    new-instance v3, Lnicoid/network238/okio/Buffer;

    invoke-direct {v3}, Lnicoid/network238/okio/Buffer;-><init>()V

    iput-object v3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->hpackBuffer:Lnicoid/network238/okio/Buffer;

    .line 54
    const/16 p1, 0x4000

    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->maxFrameSize:I

    .line 56
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;-><init>(IZLnicoid/network238/okio/Buffer;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->hpackWriter:Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;

    return-void
.end method

.method private final writeContinuationFrames(IJ)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-lez v2, :cond_1

    .line 342
    iget v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->maxFrameSize:I

    int-to-long v2, v2

    invoke-static {v2, v3, p2, p3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    sub-long/2addr p2, v2

    long-to-int v4, v2

    cmp-long v0, p2, v0

    if-nez v0, :cond_0

    const/4 v0, 0x4

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    .line 344
    :goto_1
    const/16 v1, 0x9

    invoke-virtual {p0, p1, v4, v1, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->frameHeader(IIII)V

    .line 350
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->hpackBuffer:Lnicoid/network238/okio/Buffer;

    invoke-interface {v0, v1, v2, v3}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public final applyAndAckSettings(Lnicoid/network238/okhttp3/internal/http2/Settings;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 386
    monitor-enter p0

    .line 75
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->closed:Z

    if-nez v0, :cond_1

    .line 76
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->maxFrameSize:I

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/internal/http2/Settings;->getMaxFrameSize(I)I

    move-result v0

    iput v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->maxFrameSize:I

    .line 77
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Settings;->getHeaderTableSize()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 78
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->hpackWriter:Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Settings;->getHeaderTableSize()I

    move-result p1

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->resizeHeaderTable(I)V

    :cond_0
    nop

    .line 80
    const/4 p1, 0x0

    const/4 v0, 0x4

    const/4 v1, 0x1

    invoke-virtual {p0, p1, p1, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->frameHeader(IIII)V

    .line 86
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSink;->flush()V

    .line 87
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 386
    monitor-exit p0

    return-void

    .line 75
    :cond_1
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 386
    monitor-exit p0

    throw p1
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 396
    monitor-enter p0

    .line 330
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->closed:Z

    .line 331
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {v0}, Lnicoid/network238/okio/Sink;->close()V

    .line 332
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 396
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final connectionPreface()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 60
    const-string v0, ">> CONNECTION "

    .line 385
    monitor-enter p0

    .line 61
    :try_start_0
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->closed:Z

    if-nez v1, :cond_2

    .line 62
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->client:Z

    if-nez v1, :cond_0

    .line 385
    goto :goto_0

    .line 63
    :cond_0
    sget-object v1, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->logger:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 64
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2;->CONNECTION_PREFACE:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 66
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    sget-object v1, Lnicoid/network238/okhttp3/internal/http2/Http2;->CONNECTION_PREFACE:Lnicoid/network238/okio/ByteString;

    invoke-interface {v0, v1}, Lnicoid/network238/okio/BufferedSink;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/BufferedSink;

    .line 67
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSink;->flush()V

    .line 68
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 385
    :goto_0
    monitor-exit p0

    return-void

    .line 61
    :cond_2
    :try_start_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    .line 385
    monitor-exit p0

    throw v0
.end method

.method public final data(ZILnicoid/network238/okio/Buffer;I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 390
    monitor-enter p0

    .line 173
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->closed:Z

    if-nez v0, :cond_0

    .line 176
    invoke-virtual {p0, p2, p1, p3, p4}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->dataFrame(IILnicoid/network238/okio/Buffer;I)V

    .line 177
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 390
    monitor-exit p0

    return-void

    .line 173
    :cond_0
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 390
    monitor-exit p0

    throw p1
.end method

.method public final dataFrame(IILnicoid/network238/okio/Buffer;I)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 187
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p4, v0, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->frameHeader(IIII)V

    if-lez p4, :cond_0

    .line 194
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    int-to-long v0, p4

    invoke-interface {p1, p3, v0, v1}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    :cond_0
    return-void
.end method

.method public final flush()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 388
    monitor-enter p0

    .line 130
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->closed:Z

    if-nez v0, :cond_0

    .line 131
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSink;->flush()V

    .line 132
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 388
    monitor-exit p0

    return-void

    .line 130
    :cond_0
    :try_start_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    .line 388
    monitor-exit p0

    throw v0
.end method

.method public final frameHeader(IIII)V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x8

    if-eq p3, v0, :cond_1

    .line 316
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 317
    sget-object v2, Lnicoid/network238/okhttp3/internal/http2/Http2;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Http2;

    const/4 v3, 0x0

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-virtual/range {v2 .. v7}, Lnicoid/network238/okhttp3/internal/http2/Http2;->frameLog(ZIIII)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    goto :goto_0

    .line 316
    :cond_0
    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    goto :goto_0

    .line 0
    :cond_1
    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    .line 319
    :goto_0
    iget p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->maxFrameSize:I

    if-gt v5, p1, :cond_3

    const/high16 p1, -0x80000000

    and-int/2addr p1, v4

    if-nez p1, :cond_2

    .line 321
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-static {p1, v5}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->writeMedium(Lnicoid/network238/okio/BufferedSink;I)V

    .line 322
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    and-int/lit16 p3, v6, 0xff

    invoke-interface {p1, p3}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 323
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    and-int/lit16 p4, v7, 0xff

    invoke-interface {p1, p4}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 324
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    const p2, 0x7fffffff

    and-int/2addr p2, v4

    invoke-interface {p1, p2}, Lnicoid/network238/okio/BufferedSink;->writeInt(I)Lnicoid/network238/okio/BufferedSink;

    return-void

    .line 320
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "reserved bit set: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 319
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "FRAME_SIZE_ERROR length > "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->maxFrameSize:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ": "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final getHpackWriter()Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;
    .registers 2

    .line 56
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->hpackWriter:Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;

    return-object v0
.end method

.method public final goAway(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;[B)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 393
    monitor-enter p0

    .line 257
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->closed:Z

    if-nez v0, :cond_3

    .line 258
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->getHttpCode()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 261
    array-length v0, p3

    add-int/lit8 v0, v0, 0x8

    .line 259
    const/4 v1, 0x0

    const/4 v2, 0x7

    invoke-virtual {p0, v1, v0, v2, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->frameHeader(IIII)V

    .line 265
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {v0, p1}, Lnicoid/network238/okio/BufferedSink;->writeInt(I)Lnicoid/network238/okio/BufferedSink;

    .line 266
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->getHttpCode()I

    move-result p2

    invoke-interface {p1, p2}, Lnicoid/network238/okio/BufferedSink;->writeInt(I)Lnicoid/network238/okio/BufferedSink;

    .line 267
    array-length p1, p3

    if-nez p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    if-nez v1, :cond_1

    .line 268
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {p1, p3}, Lnicoid/network238/okio/BufferedSink;->write([B)Lnicoid/network238/okio/BufferedSink;

    .line 270
    :cond_1
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSink;->flush()V

    .line 271
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 393
    monitor-exit p0

    return-void

    .line 258
    :cond_2
    :try_start_1
    const-string p1, "errorCode.httpCode == -1"

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 257
    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 393
    monitor-exit p0

    throw p1
.end method

.method public final headers(ZILjava/util/List;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZI",
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

    .line 397
    monitor-enter p0

    .line 361
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->closed:Z

    if-nez v0, :cond_3

    .line 362
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->hpackWriter:Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;

    invoke-virtual {v0, p3}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->writeHeaders(Ljava/util/List;)V

    .line 364
    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->hpackBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p3}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    .line 365
    iget p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->maxFrameSize:I

    int-to-long v2, p3

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    cmp-long p3, v0, v2

    if-nez p3, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    if-eqz p1, :cond_1

    or-int/lit8 v4, v4, 0x1

    :cond_1
    long-to-int p1, v2

    .line 368
    const/4 v5, 0x1

    invoke-virtual {p0, p2, p1, v5, v4}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->frameHeader(IIII)V

    .line 374
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->hpackBuffer:Lnicoid/network238/okio/Buffer;

    invoke-interface {p1, v4, v2, v3}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    if-lez p3, :cond_2

    sub-long/2addr v0, v2

    .line 376
    invoke-direct {p0, p2, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->writeContinuationFrames(IJ)V

    .line 377
    :cond_2
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 397
    monitor-exit p0

    return-void

    .line 361
    :cond_3
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 397
    monitor-exit p0

    throw p1
.end method

.method public final maxDataLength()I
    .registers 2

    .line 156
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->maxFrameSize:I

    return v0
.end method

.method public final ping(ZII)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 392
    monitor-enter p0

    .line 229
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->closed:Z

    if-nez v0, :cond_0

    .line 230
    const/4 v0, 0x0

    const/16 v1, 0x8

    const/4 v2, 0x6

    invoke-virtual {p0, v0, v1, v2, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->frameHeader(IIII)V

    .line 236
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {p1, p2}, Lnicoid/network238/okio/BufferedSink;->writeInt(I)Lnicoid/network238/okio/BufferedSink;

    .line 237
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {p1, p3}, Lnicoid/network238/okio/BufferedSink;->writeInt(I)Lnicoid/network238/okio/BufferedSink;

    .line 238
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSink;->flush()V

    .line 239
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 392
    monitor-exit p0

    return-void

    .line 229
    :cond_0
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 392
    monitor-exit p0

    throw p1
.end method

.method public final pushPromise(IILjava/util/List;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
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

    .line 387
    monitor-enter p0

    .line 109
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->closed:Z

    if-nez v0, :cond_2

    .line 110
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->hpackWriter:Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;

    invoke-virtual {v0, p3}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->writeHeaders(Ljava/util/List;)V

    .line 112
    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->hpackBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p3}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    .line 113
    iget p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->maxFrameSize:I

    int-to-long v2, p3

    const-wide/16 v4, 0x4

    sub-long/2addr v2, v4

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int p3, v2

    add-int/lit8 v2, p3, 0x4

    int-to-long v3, p3

    cmp-long p3, v0, v3

    if-nez p3, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    .line 114
    :goto_0
    const/4 v6, 0x5

    invoke-virtual {p0, p1, v2, v6, v5}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->frameHeader(IIII)V

    .line 120
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    const v5, 0x7fffffff

    and-int/2addr p2, v5

    invoke-interface {v2, p2}, Lnicoid/network238/okio/BufferedSink;->writeInt(I)Lnicoid/network238/okio/BufferedSink;

    .line 121
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->hpackBuffer:Lnicoid/network238/okio/Buffer;

    invoke-interface {p2, v2, v3, v4}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    if-lez p3, :cond_1

    sub-long/2addr v0, v3

    .line 123
    invoke-direct {p0, p1, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->writeContinuationFrames(IJ)V

    .line 124
    :cond_1
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 387
    monitor-exit p0

    return-void

    .line 109
    :cond_2
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 387
    monitor-exit p0

    throw p1
.end method

.method public final rstStream(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 389
    monitor-enter p0

    .line 141
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->closed:Z

    if-nez v0, :cond_1

    .line 142
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->getHttpCode()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 144
    const/4 v0, 0x4

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->frameHeader(IIII)V

    .line 150
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->getHttpCode()I

    move-result p2

    invoke-interface {p1, p2}, Lnicoid/network238/okio/BufferedSink;->writeInt(I)Lnicoid/network238/okio/BufferedSink;

    .line 151
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSink;->flush()V

    .line 152
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 389
    monitor-exit p0

    return-void

    .line 142
    :cond_0
    :try_start_1
    const-string p1, "Failed requirement."

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 141
    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 389
    monitor-exit p0

    throw p1
.end method

.method public final settings(Lnicoid/network238/okhttp3/internal/http2/Settings;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 391
    monitor-enter p0

    .line 202
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->closed:Z

    if-nez v0, :cond_2

    .line 205
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Settings;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x6

    .line 203
    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-virtual {p0, v1, v0, v2, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->frameHeader(IIII)V

    :goto_0
    const/16 v0, 0xa

    if-ge v1, v0, :cond_1

    .line 210
    invoke-virtual {p1, v1}, Lnicoid/network238/okhttp3/internal/http2/Settings;->isSet(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 211
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {v0, v1}, Lnicoid/network238/okio/BufferedSink;->writeShort(I)Lnicoid/network238/okio/BufferedSink;

    .line 212
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-virtual {p1, v1}, Lnicoid/network238/okhttp3/internal/http2/Settings;->get(I)I

    move-result v2

    invoke-interface {v0, v2}, Lnicoid/network238/okio/BufferedSink;->writeInt(I)Lnicoid/network238/okio/BufferedSink;

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 214
    :cond_1
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSink;->flush()V

    .line 215
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 391
    monitor-exit p0

    return-void

    .line 202
    :cond_2
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 391
    monitor-exit p0

    throw p1
.end method

.method public final windowUpdate(IJ)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 283
    const-string v0, "windowSizeIncrement == 0 || windowSizeIncrement > 0x7fffffffL: "

    .line 395
    monitor-enter p0

    .line 284
    :try_start_0
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->closed:Z

    if-nez v1, :cond_2

    const-wide/16 v1, 0x0

    cmp-long v1, p2, v1

    if-eqz v1, :cond_1

    const-wide/32 v1, 0x7fffffff

    cmp-long v1, p2, v1

    if-gtz v1, :cond_1

    .line 288
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 290
    sget-object v2, Lnicoid/network238/okhttp3/internal/http2/Http2;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Http2;

    const/4 v3, 0x0

    const/4 v5, 0x4

    move v4, p1

    move-wide v6, p2

    invoke-virtual/range {v2 .. v7}, Lnicoid/network238/okhttp3/internal/http2/Http2;->frameLogWindowUpdate(ZIIJ)Ljava/lang/String;

    move-result-object p1

    .line 289
    invoke-virtual {v0, p1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    goto :goto_0

    .line 288
    :cond_0
    move v4, p1

    move-wide v6, p2

    .line 289
    :goto_0
    nop

    .line 298
    const/4 p1, 0x4

    const/16 p2, 0x8

    const/4 p3, 0x0

    invoke-virtual {p0, v4, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->frameHeader(IIII)V

    .line 304
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    long-to-int p2, v6

    invoke-interface {p1, p2}, Lnicoid/network238/okio/BufferedSink;->writeInt(I)Lnicoid/network238/okio/BufferedSink;

    .line 305
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSink;->flush()V

    .line 306
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 395
    monitor-exit p0

    return-void

    .line 284
    :cond_1
    move-wide v6, p2

    .line 286
    :try_start_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 285
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 284
    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 395
    monitor-exit p0

    throw p1
.end method
