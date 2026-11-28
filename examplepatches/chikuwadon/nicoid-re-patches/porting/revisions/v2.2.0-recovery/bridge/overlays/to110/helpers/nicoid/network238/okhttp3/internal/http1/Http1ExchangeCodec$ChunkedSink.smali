.class final Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ChunkedSink"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0003\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u0004\u001a\u00020\u0008H\u0016J\u0018\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000eH\u0016J\u0008\u0010\u000f\u001a\u00020\nH\u0016J\u0008\u0010\u0010\u001a\u00020\nH\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0011"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;",
        "Lnicoid/network238/okio/Sink;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;)V",
        "timeout",
        "Lnicoid/network238/okio/ForwardingTimeout;",
        "closed",
        "",
        "Lnicoid/network238/okio/Timeout;",
        "write",
        "",
        "source",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "",
        "flush",
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

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

.field private final timeout:Lnicoid/network238/okio/ForwardingTimeout;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 349
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 350
    new-instance v0, Lnicoid/network238/okio/ForwardingTimeout;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object p1

    invoke-interface {p1}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    invoke-interface {p1}, Lnicoid/network238/okio/Sink;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object p1

    invoke-direct {v0, p1}, Lnicoid/network238/okio/ForwardingTimeout;-><init>(Lnicoid/network238/okio/Timeout;)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;->timeout:Lnicoid/network238/okio/ForwardingTimeout;

    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .registers 3

    monitor-enter p0

    .line 378
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    .line 379
    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;->closed:Z

    .line 380
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    const-string v1, "0\r\n\r\n"

    invoke-interface {v0, v1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    .line 382
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSink;->flush()V

    .line 383
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;->timeout:Lnicoid/network238/okio/ForwardingTimeout;

    # invokes: Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->detachTimeout(Lnicoid/network238/okio/ForwardingTimeout;)V
    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$detachTimeout(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okio/ForwardingTimeout;)V

    .line 384
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$setState$p(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    .line 377
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public declared-synchronized flush()V
    .registers 2

    monitor-enter p0

    .line 372
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    .line 373
    :cond_0
    :try_start_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSink;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    .line 371
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 353
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;->timeout:Lnicoid/network238/okio/ForwardingTimeout;

    return-object v0
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 359
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;->closed:Z

    if-nez v0, :cond_1

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-nez v0, :cond_0

    return-void

    .line 362
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    .line 363
    invoke-interface {v0, p2, p3}, Lnicoid/network238/okio/BufferedSink;->writeHexadecimalUnsignedLong(J)Lnicoid/network238/okio/BufferedSink;

    .line 364
    const-string v1, "\r\n"

    invoke-interface {v0, v1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    .line 365
    invoke-interface {v0, p1, p2, p3}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 366
    invoke-interface {v0, v1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    return-void

    .line 359
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
