.class public final Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http2/Http2Stream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "FramingSource"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0004\u0018\u00002\u00020\u0001B\u0019\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0018\u0010\u001b\u001a\u00020\u00032\u0006\u0010\u001c\u001a\u00020\r2\u0006\u0010\u001d\u001a\u00020\u0003H\u0016J\u0010\u0010\u001e\u001a\u00020\u001f2\u0006\u0010\u001b\u001a\u00020\u0003H\u0002J\u001d\u0010 \u001a\u00020\u001f2\u0006\u0010!\u001a\u00020\"2\u0006\u0010\u001d\u001a\u00020\u0003H\u0000\u00a2\u0006\u0002\u0008#J\u0008\u0010$\u001a\u00020%H\u0016J\u0008\u0010&\u001a\u00020\u001fH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0004\u001a\u00020\u0005X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0008\u0010\t\"\u0004\u0008\n\u0010\u000bR\u0011\u0010\u000c\u001a\u00020\r\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u0011\u0010\u0010\u001a\u00020\r\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u000fR\u001c\u0010\u0012\u001a\u0004\u0018\u00010\u0013X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015\"\u0004\u0008\u0016\u0010\u0017R\u001a\u0010\u0018\u001a\u00020\u0005X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0019\u0010\t\"\u0004\u0008\u001a\u0010\u000b\u00a8\u0006\'"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;",
        "Lnicoid/network238/okio/Source;",
        "maxByteCount",
        "",
        "finished",
        "",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;JZ)V",
        "getFinished$okhttp",
        "()Z",
        "setFinished$okhttp",
        "(Z)V",
        "receiveBuffer",
        "Lnicoid/network238/okio/Buffer;",
        "getReceiveBuffer",
        "()Lnicoid/network238/okio/Buffer;",
        "readBuffer",
        "getReadBuffer",
        "trailers",
        "Lnicoid/network238/okhttp3/Headers;",
        "getTrailers",
        "()Lnicoid/network238/okhttp3/Headers;",
        "setTrailers",
        "(Lnicoid/network238/okhttp3/Headers;)V",
        "closed",
        "getClosed$okhttp",
        "setClosed$okhttp",
        "read",
        "sink",
        "byteCount",
        "updateConnectionFlowControl",
        "",
        "receive",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "receive$okhttp",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "close",
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
.field private closed:Z

.field private finished:Z

.field private final maxByteCount:J

.field private final readBuffer:Lnicoid/network238/okio/Buffer;

.field private final receiveBuffer:Lnicoid/network238/okio/Buffer;

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

.field private trailers:Lnicoid/network238/okhttp3/Headers;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;JZ)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JZ)V"
        }
    .end annotation

    .line 352
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 354
    iput-wide p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->maxByteCount:J

    .line 359
    iput-boolean p4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->finished:Z

    .line 362
    new-instance p1, Lnicoid/network238/okio/Buffer;

    invoke-direct {p1}, Lnicoid/network238/okio/Buffer;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->receiveBuffer:Lnicoid/network238/okio/Buffer;

    .line 365
    new-instance p1, Lnicoid/network238/okio/Buffer;

    invoke-direct {p1}, Lnicoid/network238/okio/Buffer;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->readBuffer:Lnicoid/network238/okio/Buffer;

    return-void
.end method

.method private final updateConnectionFlowControl(J)V
    .registers 5

    .line 453
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    .line 746
    sget-boolean v1, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v1, :cond_0

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 747
    new-instance p1, Ljava/lang/AssertionError;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "Thread "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v1, " MUST NOT hold lock on "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 455
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getConnection()Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->updateConnectionFlowControl$okhttp(J)V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 528
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    .line 757
    monitor-enter v0

    .line 529
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->closed:Z

    .line 530
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->readBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    .line 531
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->readBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v3}, Lnicoid/network238/okio/Buffer;->clear()V

    .line 758
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 533
    sget-object v3, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 757
    monitor-exit v0

    const-wide/16 v3, 0x0

    cmp-long v0, v1, v3

    if-lez v0, :cond_0

    .line 535
    invoke-direct {p0, v1, v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->updateConnectionFlowControl(J)V

    .line 537
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->cancelStreamIfNecessary$okhttp()V

    return-void

    :catchall_0
    move-exception v1

    .line 757
    monitor-exit v0

    throw v1
.end method

.method public final getClosed$okhttp()Z
    .registers 2

    .line 374
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->closed:Z

    return v0
.end method

.method public final getFinished$okhttp()Z
    .registers 2

    .line 359
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->finished:Z

    return v0
.end method

.method public final getReadBuffer()Lnicoid/network238/okio/Buffer;
    .registers 2

    .line 365
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->readBuffer:Lnicoid/network238/okio/Buffer;

    return-object v0
.end method

.method public final getReceiveBuffer()Lnicoid/network238/okio/Buffer;
    .registers 2

    .line 362
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->receiveBuffer:Lnicoid/network238/okio/Buffer;

    return-object v0
.end method

.method public final getTrailers()Lnicoid/network238/okhttp3/Headers;
    .registers 2

    .line 371
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->trailers:Lnicoid/network238/okhttp3/Headers;

    return-object v0
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 29
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-wide/from16 v2, p2

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-ltz v0, :cond_c

    .line 390
    :goto_0
    iget-object v6, v1, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    .line 745
    monitor-enter v6

    .line 391
    :try_start_0
    # invokes: Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->doReadTimeout()Z
    invoke-static {v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->access$doReadTimeout(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 393
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getReadTimeout$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->enter()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 396
    :cond_0
    :try_start_1
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getErrorCode$okhttp()Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-boolean v0, v1, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->finished:Z

    if-nez v0, :cond_1

    .line 398
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getErrorException$okhttp()Ljava/io/IOException;

    move-result-object v0

    if-nez v0, :cond_2

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/StreamResetException;

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getErrorCode$okhttp()Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, v8}, Lnicoid/network238/okhttp3/internal/http2/StreamResetException;-><init>(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    goto :goto_1

    .line 401
    :cond_1
    const/4 v0, 0x0

    :cond_2
    :goto_1
    iget-boolean v8, v1, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->closed:Z

    if-nez v8, :cond_a

    .line 403
    iget-object v8, v1, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->readBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v8}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v8

    cmp-long v8, v8, v4

    const-wide/16 v9, -0x1

    const/4 v11, 0x0

    if-lez v8, :cond_3

    .line 405
    iget-object v8, v1, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->readBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v8}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v12

    invoke-static {v2, v3, v12, v13}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v12

    move-object/from16 v14, p1

    invoke-virtual {v8, v14, v12, v13}, Lnicoid/network238/okio/Buffer;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v16

    .line 406
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getReadBytes()Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

    move-result-object v15

    const/16 v20, 0x2

    const/16 v21, 0x0

    const-wide/16 v18, 0x0

    invoke-static/range {v15 .. v21}, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->update$default(Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;JJILjava/lang/Object;)V

    .line 408
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getReadBytes()Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

    move-result-object v8

    invoke-virtual {v8}, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->getUnacknowledged()J

    move-result-wide v12

    if-nez v0, :cond_5

    .line 410
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getConnection()Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    move-result-object v8

    invoke-virtual {v8}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getOkHttpSettings()Lnicoid/network238/okhttp3/internal/http2/Settings;

    move-result-object v8

    invoke-virtual {v8}, Lnicoid/network238/okhttp3/internal/http2/Settings;->getInitialWindowSize()I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    int-to-long v4, v8

    cmp-long v4, v12, v4

    if-ltz v4, :cond_5

    .line 414
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getConnection()Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    move-result-object v4

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getId()I

    move-result v5

    invoke-virtual {v4, v5, v12, v13}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeWindowUpdateLater$okhttp(IJ)V

    .line 415
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getReadBytes()Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

    move-result-object v18

    const/16 v23, 0x1

    const/16 v24, 0x0

    const-wide/16 v19, 0x0

    move-wide/from16 v21, v12

    invoke-static/range {v18 .. v24}, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->update$default(Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;JJILjava/lang/Object;)V

    goto :goto_2

    .line 417
    :cond_3
    move-object/from16 v14, p1

    iget-boolean v4, v1, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->finished:Z

    if-nez v4, :cond_4

    if-nez v0, :cond_4

    .line 419
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->waitForIo$okhttp()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v11, 0x1

    :cond_4
    move-wide/from16 v16, v9

    :cond_5
    :goto_2
    if-eqz v7, :cond_6

    .line 424
    :try_start_2
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getReadTimeout$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    move-result-object v4

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    .line 427
    :cond_6
    sget-object v4, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 745
    monitor-exit v6

    .line 428
    iget-object v4, v1, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getConnection()Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    move-result-object v4

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getFlowControlListener$okhttp()Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;

    move-result-object v4

    iget-object v5, v1, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getId()I

    move-result v5

    iget-object v6, v1, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getReadBytes()Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

    move-result-object v6

    iget-object v7, v1, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->readBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v7}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v7

    invoke-interface {v4, v5, v6, v7, v8}, Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;->receivingStreamWindowChanged(ILnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;J)V

    if-eqz v11, :cond_7

    const-wide/16 v4, 0x0

    goto/16 :goto_0

    :cond_7
    cmp-long v2, v16, v9

    if-eqz v2, :cond_8

    return-wide v16

    :cond_8
    if-nez v0, :cond_9

    return-wide v9

    .line 445
    :cond_9
    throw v0

    .line 402
    :cond_a
    :try_start_3
    new-instance v0, Ljava/io/IOException;

    const-string v2, "stream closed"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception v0

    if-eqz v7, :cond_b

    .line 424
    :try_start_4
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getReadTimeout$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    :cond_b
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v0

    .line 745
    monitor-exit v6

    throw v0

    .line 381
    :cond_c
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v4, "byteCount < 0: "

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public final receive$okhttp(Lnicoid/network238/okio/BufferedSource;J)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 467
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    .line 750
    sget-boolean v1, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v1, :cond_0

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

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

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    :cond_0
    move-wide v0, p2

    :goto_0
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_8

    .line 474
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    .line 754
    monitor-enter v4

    .line 475
    :try_start_0
    iget-boolean v5, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->finished:Z

    .line 476
    iget-object v6, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->readBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v6}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v6

    add-long/2addr v6, v0

    iget-wide v8, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->maxByteCount:J

    cmp-long v6, v6, v8

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-lez v6, :cond_1

    move v6, v7

    goto :goto_1

    :cond_1
    move v6, v8

    .line 477
    :goto_1
    sget-object v9, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 754
    monitor-exit v4

    if-eqz v6, :cond_2

    .line 481
    invoke-interface {p1, v0, v1}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    .line 482
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    sget-object p2, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->FLOW_CONTROL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->closeLater(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    return-void

    :cond_2
    if-eqz v5, :cond_3

    .line 488
    invoke-interface {p1, v0, v1}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    return-void

    .line 493
    :cond_3
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->receiveBuffer:Lnicoid/network238/okio/Buffer;

    invoke-interface {p1, v4, v0, v1}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v4

    const-wide/16 v9, -0x1

    cmp-long v6, v4, v9

    if-eqz v6, :cond_7

    sub-long/2addr v0, v4

    .line 500
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    .line 755
    monitor-enter v4

    .line 501
    :try_start_1
    iget-boolean v5, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->closed:Z

    if-eqz v5, :cond_4

    .line 502
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->receiveBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->clear()V

    goto :goto_2

    .line 504
    :cond_4
    iget-object v5, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->readBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v5}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v5

    cmp-long v2, v5, v2

    if-eqz v2, :cond_5

    move v7, v8

    .line 505
    :cond_5
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->readBuffer:Lnicoid/network238/okio/Buffer;

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->receiveBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v2, v3}, Lnicoid/network238/okio/Buffer;->writeAll(Lnicoid/network238/okio/Source;)J

    if-eqz v7, :cond_6

    .line 756
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 755
    :cond_6
    :goto_2
    monitor-exit v4

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v4

    throw p1

    .line 494
    :cond_7
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    :catchall_1
    move-exception p1

    .line 754
    monitor-exit v4

    throw p1

    .line 517
    :cond_8
    invoke-direct {p0, p2, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->updateConnectionFlowControl(J)V

    .line 520
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getConnection()Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getFlowControlListener$okhttp()Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;

    move-result-object p1

    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getId()I

    move-result p2

    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getReadBytes()Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;

    move-result-object p3

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->readBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    invoke-interface {p1, p2, p3, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;->receivingStreamWindowChanged(ILnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;J)V

    return-void
.end method

.method public final setClosed$okhttp(Z)V
    .registers 2

    .line 374
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->closed:Z

    return-void
.end method

.method public final setFinished$okhttp(Z)V
    .registers 2

    .line 359
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->finished:Z

    return-void
.end method

.method public final setTrailers(Lnicoid/network238/okhttp3/Headers;)V
    .registers 2

    .line 371
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->trailers:Lnicoid/network238/okhttp3/Headers;

    return-void
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 523
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getReadTimeout$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    move-result-object v0

    return-object v0
.end method
