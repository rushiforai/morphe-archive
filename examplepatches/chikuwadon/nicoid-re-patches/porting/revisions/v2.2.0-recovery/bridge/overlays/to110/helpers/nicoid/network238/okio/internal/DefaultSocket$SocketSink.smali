.class public final Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/internal/DefaultSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "SocketSink"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\u0008\u0086\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0018\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000eH\u0016J\u0008\u0010\u000f\u001a\u00020\nH\u0016J\u0008\u0010\u0010\u001a\u00020\nH\u0016J\u0008\u0010\u0007\u001a\u00020\u0008H\u0016J\u0008\u0010\u0011\u001a\u00020\u0012H\u0016R\u0016\u0010\u0004\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0013"
    }
    d2 = {
        "Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;",
        "Lnicoid/network238/okio/Sink;",
        "<init>",
        "(Lnicoid/network238/okio/internal/DefaultSocket;)V",
        "outputStream",
        "Ljava/io/OutputStream;",
        "nicoid.network238.kotlin.jvm.PlatformType",
        "timeout",
        "Lnicoid/network238/okio/internal/SocketAsyncTimeout;",
        "write",
        "",
        "source",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "",
        "flush",
        "close",
        "toString",
        "",
        "okio"
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
.field private final outputStream:Ljava/io/OutputStream;

.field final synthetic this$0:Lnicoid/network238/okio/internal/DefaultSocket;

.field private final timeout:Lnicoid/network238/okio/internal/SocketAsyncTimeout;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/internal/DefaultSocket;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 50
    iput-object p1, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;->this$0:Lnicoid/network238/okio/internal/DefaultSocket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    invoke-virtual {p1}, Lnicoid/network238/okio/internal/DefaultSocket;->getSocket()Ljava/net/Socket;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;->outputStream:Ljava/io/OutputStream;

    .line 52
    new-instance v0, Lnicoid/network238/okio/internal/SocketAsyncTimeout;

    invoke-virtual {p1}, Lnicoid/network238/okio/internal/DefaultSocket;->getSocket()Ljava/net/Socket;

    move-result-object p1

    invoke-direct {v0, p1}, Lnicoid/network238/okio/internal/SocketAsyncTimeout;-><init>(Ljava/net/Socket;)V

    iput-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;->timeout:Lnicoid/network238/okio/internal/SocketAsyncTimeout;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 5

    .line 83
    iget-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;->timeout:Lnicoid/network238/okio/internal/SocketAsyncTimeout;

    iget-object v1, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;->this$0:Lnicoid/network238/okio/internal/DefaultSocket;

    .line 201
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->enter()V

    .line 84
    :try_start_0
    # getter for: Lnicoid/network238/okio/internal/DefaultSocket;->closeBits:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v1}, Lnicoid/network238/okio/internal/DefaultSocket;->access$getCloseBits$p(Lnicoid/network238/okio/internal/DefaultSocket;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lnicoid/network238/okio/internal/_AtomicKt;->setBitsOrZero(Ljava/util/concurrent/atomic/AtomicInteger;I)I

    move-result v2

    if-eqz v2, :cond_2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_0

    .line 93
    invoke-virtual {v1}, Lnicoid/network238/okio/internal/DefaultSocket;->getSocket()Ljava/net/Socket;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/Socket;->isClosed()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v1}, Lnicoid/network238/okio/internal/DefaultSocket;->getSocket()Ljava/net/Socket;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/Socket;->isOutputShutdown()Z

    move-result v2

    if-nez v2, :cond_2

    .line 94
    iget-object v2, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    :try_start_1
    invoke-virtual {v1}, Lnicoid/network238/okio/internal/DefaultSocket;->getSocket()Ljava/net/Socket;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/Socket;->shutdownOutput()V
    :try_end_1
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 100
    :try_start_2
    iget-object v1, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    goto :goto_0

    .line 89
    :cond_0
    invoke-virtual {v1}, Lnicoid/network238/okio/internal/DefaultSocket;->getSocket()Ljava/net/Socket;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/Socket;->close()V

    .line 104
    :goto_0
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 209
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v1

    if-nez v1, :cond_1

    return-void

    .line 210
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 209
    :cond_2
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    return-void

    :catch_1
    move-exception v1

    .line 207
    :try_start_3
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v1

    :cond_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception v1

    .line 209
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    .line 210
    throw v1
.end method

.method public flush()V
    .registers 4

    .line 77
    iget-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;->timeout:Lnicoid/network238/okio/internal/SocketAsyncTimeout;

    .line 190
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->enter()V

    .line 78
    :try_start_0
    iget-object v1, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 79
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 198
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 199
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :catch_0
    move-exception v1

    .line 196
    :try_start_1
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v1

    :cond_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v1

    .line 198
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    .line 199
    throw v1
.end method

.method public bridge synthetic timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 50
    invoke-virtual {p0}, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;->timeout()Lnicoid/network238/okio/internal/SocketAsyncTimeout;

    move-result-object v0

    return-object v0
.end method

.method public timeout()Lnicoid/network238/okio/internal/SocketAsyncTimeout;
    .registers 2

    .line 107
    iget-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;->timeout:Lnicoid/network238/okio/internal/SocketAsyncTimeout;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "sink("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;->this$0:Lnicoid/network238/okio/internal/DefaultSocket;

    invoke-virtual {v1}, Lnicoid/network238/okio/internal/DefaultSocket;->getSocket()Ljava/net/Socket;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_3

    .line 58
    iget-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;->timeout:Lnicoid/network238/okio/internal/SocketAsyncTimeout;

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->throwIfReached()V

    .line 59
    iget-object v0, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    iget v1, v0, Lnicoid/network238/okio/Segment;->limit:I

    iget v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v1, v2

    int-to-long v1, v1

    .line 177
    invoke-static {p2, p3, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v1, v1

    .line 61
    iget-object v2, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;->timeout:Lnicoid/network238/okio/internal/SocketAsyncTimeout;

    .line 179
    invoke-virtual {v2}, Lnicoid/network238/okio/AsyncTimeout;->enter()V

    .line 62
    :try_start_0
    iget-object v3, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;->outputStream:Ljava/io/OutputStream;

    iget-object v4, v0, Lnicoid/network238/okio/Segment;->data:[B

    iget v5, v0, Lnicoid/network238/okio/Segment;->pos:I

    invoke-virtual {v3, v4, v5, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 63
    sget-object v3, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 187
    invoke-virtual {v2}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v3

    if-nez v3, :cond_1

    .line 65
    iget v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr v2, v1

    iput v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v1, v1

    sub-long/2addr p2, v1

    .line 67
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    sub-long/2addr v3, v1

    invoke-virtual {p1, v3, v4}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 69
    iget v1, v0, Lnicoid/network238/okio/Segment;->pos:I

    iget v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v1, v2, :cond_0

    .line 70
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v1

    iput-object v1, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 71
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_0
    goto :goto_0

    :cond_1
    nop

    .line 188
    const/4 p1, 0x0

    invoke-virtual {v2, p1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    throw p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 185
    :try_start_1
    invoke-virtual {v2}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-virtual {v2, p1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    :cond_2
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 187
    invoke-virtual {v2}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    .line 188
    throw p1

    :cond_3
    return-void
.end method
