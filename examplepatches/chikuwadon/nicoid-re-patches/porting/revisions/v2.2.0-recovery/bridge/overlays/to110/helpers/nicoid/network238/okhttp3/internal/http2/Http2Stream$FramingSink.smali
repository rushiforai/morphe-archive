.class public final Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http2/Http2Stream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "FramingSink"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0004\u0018\u00002\u00020\u0001B\u0011\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0018\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u000b2\u0006\u0010\u0018\u001a\u00020\u0019H\u0016J\u0010\u0010\u001a\u001a\u00020\u00162\u0006\u0010\u001b\u001a\u00020\u0003H\u0002J\u0008\u0010\u001c\u001a\u00020\u0016H\u0016J\u0008\u0010\u001d\u001a\u00020\u001eH\u0016J\u0008\u0010\u001f\u001a\u00020\u0016H\u0016R\u001a\u0010\u0002\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\"\u0004\u0008\u0008\u0010\tR\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001c\u0010\u000c\u001a\u0004\u0018\u00010\rX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\"\u0004\u0008\u0010\u0010\u0011R\u001a\u0010\u0012\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0013\u0010\u0007\"\u0004\u0008\u0014\u0010\t\u00a8\u0006 "
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;",
        "Lnicoid/network238/okio/Sink;",
        "finished",
        "",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;Z)V",
        "getFinished",
        "()Z",
        "setFinished",
        "(Z)V",
        "sendBuffer",
        "Lnicoid/network238/okio/Buffer;",
        "trailers",
        "Lnicoid/network238/okhttp3/Headers;",
        "getTrailers",
        "()Lnicoid/network238/okhttp3/Headers;",
        "setTrailers",
        "(Lnicoid/network238/okhttp3/Headers;)V",
        "closed",
        "getClosed",
        "setClosed",
        "write",
        "",
        "source",
        "byteCount",
        "",
        "emitFrame",
        "outFinishedOnLastFrame",
        "flush",
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

.field private final sendBuffer:Lnicoid/network238/okio/Buffer;

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

.field private trailers:Lnicoid/network238/okhttp3/Headers;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;Z)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)V"
        }
    .end annotation

    .line 562
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 564
    iput-boolean p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->finished:Z

    .line 570
    new-instance p1, Lnicoid/network238/okio/Buffer;

    invoke-direct {p1}, Lnicoid/network238/okio/Buffer;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->sendBuffer:Lnicoid/network238/okio/Buffer;

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;ZILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 5

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 562
    :cond_0
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;Z)V

    return-void
.end method

.method private final emitFrame(Z)V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 598
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    .line 748
    monitor-enter v1

    .line 599
    :try_start_0
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getWriteTimeout$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->enter()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 601
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getWriteBytesTotal()J

    move-result-wide v2

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getWriteBytesMaximum()J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-ltz v0, :cond_0

    .line 602
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->finished:Z

    if-nez v0, :cond_0

    .line 603
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->closed:Z

    if-nez v0, :cond_0

    .line 604
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getErrorCode$okhttp()Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object v0

    if-nez v0, :cond_0

    .line 606
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->waitForIo$okhttp()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 609
    :cond_0
    :try_start_2
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getWriteTimeout$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    .line 612
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->checkOutNotClosed$okhttp()V

    .line 613
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getWriteBytesMaximum()J

    move-result-wide v2

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getWriteBytesTotal()J

    move-result-wide v4

    sub-long/2addr v2, v4

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->sendBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v10

    .line 614
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getWriteBytesTotal()J

    move-result-wide v2

    add-long/2addr v2, v10

    invoke-virtual {v1, v2, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->setWriteBytesTotal$okhttp(J)V

    if-eqz p1, :cond_1

    .line 615
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->sendBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    cmp-long p1, v10, v2

    if-nez p1, :cond_1

    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    move v8, p1

    .line 616
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 748
    monitor-exit v1

    .line 618
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getWriteTimeout$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okio/AsyncTimeout;->enter()V

    .line 620
    :try_start_3
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getConnection()Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    move-result-object v6

    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getId()I

    move-result v7

    iget-object v9, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->sendBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual/range {v6 .. v11}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeData(IZLnicoid/network238/okio/Buffer;J)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 622
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getWriteTimeout$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    return-void

    :catchall_0
    move-exception v0

    move-object p1, v0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getWriteTimeout$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    throw p1

    :catchall_1
    move-exception v0

    move-object p1, v0

    .line 609
    :try_start_4
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getWriteTimeout$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;->exitAndThrowIfTimedOut()V

    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception v0

    move-object p1, v0

    .line 748
    monitor-exit v1

    throw p1
.end method


# virtual methods
.method public close()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 644
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    .line 754
    sget-boolean v1, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v1, :cond_0

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 755
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

    const-string v3, " MUST NOT hold lock on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 647
    :cond_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    .line 758
    monitor-enter v1

    .line 648
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_1

    .line 758
    monitor-exit v1

    return-void

    .line 649
    :cond_1
    :try_start_1
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getErrorCode$okhttp()Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_2

    move v0, v3

    goto :goto_0

    :cond_2
    move v0, v2

    .line 650
    :goto_0
    sget-object v4, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 758
    monitor-exit v1

    .line 651
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object v1

    iget-boolean v1, v1, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->finished:Z

    if-nez v1, :cond_7

    .line 655
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->sendBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v1, v4, v6

    if-lez v1, :cond_3

    move v1, v3

    goto :goto_1

    :cond_3
    move v1, v2

    .line 656
    :goto_1
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->trailers:Lnicoid/network238/okhttp3/Headers;

    if-eqz v4, :cond_5

    .line 659
    :goto_2
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->sendBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    cmp-long v1, v4, v6

    if-lez v1, :cond_4

    .line 660
    invoke-direct {p0, v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->emitFrame(Z)V

    goto :goto_2

    .line 662
    :cond_4
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getConnection()Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    move-result-object v1

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getId()I

    move-result v2

    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->trailers:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toHeaderList(Lnicoid/network238/okhttp3/Headers;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v1, v2, v0, v4}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeHeaders$okhttp(IZLjava/util/List;)V

    goto :goto_4

    :cond_5
    if-eqz v1, :cond_6

    .line 666
    :goto_3
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->sendBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    cmp-long v0, v0, v6

    if-lez v0, :cond_7

    .line 667
    invoke-direct {p0, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->emitFrame(Z)V

    goto :goto_3

    :cond_6
    if-eqz v0, :cond_7

    .line 672
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getConnection()Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    move-result-object v4

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getId()I

    move-result v5

    const/4 v7, 0x0

    const-wide/16 v8, 0x0

    const/4 v6, 0x1

    invoke-virtual/range {v4 .. v9}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeData(IZLnicoid/network238/okio/Buffer;J)V

    .line 676
    :cond_7
    :goto_4
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    .line 759
    monitor-enter v1

    .line 677
    :try_start_2
    iput-boolean v3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->closed:Z

    .line 760
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 679
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 759
    monitor-exit v1

    .line 680
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getConnection()Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->flush()V

    .line 681
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->cancelStreamIfNecessary$okhttp()V

    return-void

    :catchall_0
    move-exception v0

    .line 759
    monitor-exit v1

    throw v0

    :catchall_1
    move-exception v0

    .line 758
    monitor-exit v1

    throw v0
.end method

.method public flush()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 628
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    .line 749
    sget-boolean v1, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v1, :cond_0

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 750
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

    const-string v3, " MUST NOT hold lock on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 630
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    .line 753
    monitor-enter v0

    .line 631
    :try_start_0
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->checkOutNotClosed$okhttp()V

    .line 632
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 753
    monitor-exit v0

    .line 634
    :goto_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->sendBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 635
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->emitFrame(Z)V

    .line 636
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getConnection()Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->flush()V

    goto :goto_0

    :cond_1
    return-void

    :catchall_0
    move-exception v1

    .line 753
    monitor-exit v0

    throw v1
.end method

.method public final getClosed()Z
    .registers 2

    .line 575
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->closed:Z

    return v0
.end method

.method public final getFinished()Z
    .registers 2

    .line 564
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->finished:Z

    return v0
.end method

.method public final getTrailers()Lnicoid/network238/okhttp3/Headers;
    .registers 2

    .line 573
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->trailers:Lnicoid/network238/okhttp3/Headers;

    return-object v0
.end method

.method public final setClosed(Z)V
    .registers 2

    .line 575
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->closed:Z

    return-void
.end method

.method public final setFinished(Z)V
    .registers 2

    .line 564
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->finished:Z

    return-void
.end method

.method public final setTrailers(Lnicoid/network238/okhttp3/Headers;)V
    .registers 2

    .line 573
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->trailers:Lnicoid/network238/okhttp3/Headers;

    return-void
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 640
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getWriteTimeout$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;

    move-result-object v0

    return-object v0
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 582
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    .line 744
    sget-boolean v1, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v1, :cond_0

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 745
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

    .line 584
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->sendBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 585
    :goto_0
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->sendBuffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p1

    const-wide/16 v0, 0x4000

    cmp-long p1, p1, v0

    if-ltz p1, :cond_1

    .line 586
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->emitFrame(Z)V

    goto :goto_0

    :cond_1
    return-void
.end method
