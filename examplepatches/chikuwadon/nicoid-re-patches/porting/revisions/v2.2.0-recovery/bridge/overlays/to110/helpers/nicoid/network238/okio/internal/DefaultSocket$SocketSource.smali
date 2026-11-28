.class public final Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/internal/DefaultSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "SocketSource"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0086\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0018\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\nH\u0016J\u0008\u0010\u000e\u001a\u00020\u000fH\u0016J\u0008\u0010\u0007\u001a\u00020\u0008H\u0016J\u0008\u0010\u0010\u001a\u00020\u0011H\u0016R\u0016\u0010\u0004\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;",
        "Lnicoid/network238/okio/Source;",
        "<init>",
        "(Lnicoid/network238/okio/internal/DefaultSocket;)V",
        "inputStream",
        "Ljava/io/InputStream;",
        "nicoid.network238.kotlin.jvm.PlatformType",
        "timeout",
        "Lnicoid/network238/okio/internal/SocketAsyncTimeout;",
        "read",
        "",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "close",
        "",
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
.field private final inputStream:Ljava/io/InputStream;

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

    .line 112
    iput-object p1, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;->this$0:Lnicoid/network238/okio/internal/DefaultSocket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    invoke-virtual {p1}, Lnicoid/network238/okio/internal/DefaultSocket;->getSocket()Ljava/net/Socket;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;->inputStream:Ljava/io/InputStream;

    .line 114
    new-instance v0, Lnicoid/network238/okio/internal/SocketAsyncTimeout;

    invoke-virtual {p1}, Lnicoid/network238/okio/internal/DefaultSocket;->getSocket()Ljava/net/Socket;

    move-result-object p1

    invoke-direct {v0, p1}, Lnicoid/network238/okio/internal/SocketAsyncTimeout;-><init>(Ljava/net/Socket;)V

    iput-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;->timeout:Lnicoid/network238/okio/internal/SocketAsyncTimeout;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 5

    .line 144
    iget-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;->timeout:Lnicoid/network238/okio/internal/SocketAsyncTimeout;

    iget-object v1, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;->this$0:Lnicoid/network238/okio/internal/DefaultSocket;

    .line 191
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->enter()V

    .line 145
    :try_start_0
    # getter for: Lnicoid/network238/okio/internal/DefaultSocket;->closeBits:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v1}, Lnicoid/network238/okio/internal/DefaultSocket;->access$getCloseBits$p(Lnicoid/network238/okio/internal/DefaultSocket;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v2

    const/4 v3, 0x2

    invoke-static {v2, v3}, Lnicoid/network238/okio/internal/_AtomicKt;->setBitsOrZero(Ljava/util/concurrent/atomic/AtomicInteger;I)I

    move-result v2

    if-eqz v2, :cond_2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_0

    .line 154
    invoke-virtual {v1}, Lnicoid/network238/okio/internal/DefaultSocket;->getSocket()Ljava/net/Socket;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/Socket;->isClosed()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v1}, Lnicoid/network238/okio/internal/DefaultSocket;->getSocket()Ljava/net/Socket;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/Socket;->isInputShutdown()Z

    move-result v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_2

    .line 156
    :try_start_1
    invoke-virtual {v1}, Lnicoid/network238/okio/internal/DefaultSocket;->getSocket()Ljava/net/Socket;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/Socket;->shutdownInput()V
    :try_end_1
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 160
    :try_start_2
    iget-object v1, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    goto :goto_0

    .line 150
    :cond_0
    invoke-virtual {v1}, Lnicoid/network238/okio/internal/DefaultSocket;->getSocket()Ljava/net/Socket;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/Socket;->close()V

    .line 164
    :goto_0
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 199
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v1

    if-nez v1, :cond_1

    return-void

    .line 200
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 199
    :cond_2
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    return-void

    :catch_1
    move-exception v1

    .line 197
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

    .line 199
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    .line 200
    throw v1
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-nez v2, :cond_0

    return-wide v0

    :cond_0
    if-ltz v2, :cond_6

    .line 119
    iget-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;->timeout:Lnicoid/network238/okio/internal/SocketAsyncTimeout;

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->throwIfReached()V

    .line 120
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v0

    .line 121
    iget v1, v0, Lnicoid/network238/okio/Segment;->limit:I

    rsub-int v1, v1, 0x2000

    int-to-long v1, v1

    .line 178
    invoke-static {p2, p3, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    long-to-int p2, p2

    .line 123
    :try_start_0
    iget-object p3, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;->timeout:Lnicoid/network238/okio/internal/SocketAsyncTimeout;

    .line 180
    invoke-virtual {p3}, Lnicoid/network238/okio/AsyncTimeout;->enter()V
    :try_end_0
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_1

    .line 124
    :try_start_1
    iget-object v1, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;->inputStream:Ljava/io/InputStream;

    iget-object v2, v0, Lnicoid/network238/okio/Segment;->data:[B

    iget v3, v0, Lnicoid/network238/okio/Segment;->limit:I

    invoke-virtual {v1, v2, v3, p2}, Ljava/io/InputStream;->read([BII)I

    move-result p2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 188
    :try_start_2
    invoke-virtual {p3}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v1
    :try_end_2
    .catch Ljava/lang/AssertionError; {:try_start_2 .. :try_end_2} :catch_1

    if-nez v1, :cond_3

    const/4 p3, -0x1

    if-ne p2, p3, :cond_2

    .line 131
    iget p2, v0, Lnicoid/network238/okio/Segment;->pos:I

    iget p3, v0, Lnicoid/network238/okio/Segment;->limit:I

    if-ne p2, p3, :cond_1

    .line 133
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object p2

    iput-object p2, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 134
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_1
    const-wide/16 p1, -0x1

    return-wide p1

    .line 138
    :cond_2
    iget p3, v0, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr p3, p2

    iput p3, v0, Lnicoid/network238/okio/Segment;->limit:I

    .line 139
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    int-to-long p2, p2

    add-long/2addr v0, p2

    invoke-virtual {p1, v0, v1}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-wide p2

    :cond_3
    nop

    .line 189
    const/4 p1, 0x0

    :try_start_3
    invoke-virtual {p3, p1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1
    :try_end_3
    .catch Ljava/lang/AssertionError; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 186
    :try_start_4
    invoke-virtual {p3}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-virtual {p3, p1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    :cond_4
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception p1

    .line 188
    :try_start_5
    invoke-virtual {p3}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    .line 189
    :goto_0
    throw p1
    :try_end_5
    .catch Ljava/lang/AssertionError; {:try_start_5 .. :try_end_5} :catch_1

    :catch_1
    move-exception p1

    .line 127
    invoke-static {p1}, Lnicoid/network238/okio/internal/_JavaIoKt;->isAndroidGetsocknameError(Ljava/lang/AssertionError;)Z

    move-result p2

    if-eqz p2, :cond_5

    new-instance p2, Ljava/io/IOException;

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    .line 128
    :cond_5
    throw p1

    .line 118
    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "byteCount < 0: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public bridge synthetic timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 112
    invoke-virtual {p0}, Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;->timeout()Lnicoid/network238/okio/internal/SocketAsyncTimeout;

    move-result-object v0

    return-object v0
.end method

.method public timeout()Lnicoid/network238/okio/internal/SocketAsyncTimeout;
    .registers 2

    .line 167
    iget-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;->timeout:Lnicoid/network238/okio/internal/SocketAsyncTimeout;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 169
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "source("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;->this$0:Lnicoid/network238/okio/internal/DefaultSocket;

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
