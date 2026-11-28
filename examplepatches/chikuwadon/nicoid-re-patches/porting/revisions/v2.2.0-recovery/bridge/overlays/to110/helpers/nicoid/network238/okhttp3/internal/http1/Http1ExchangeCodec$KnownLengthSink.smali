.class final Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;
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
    name = "KnownLengthSink"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0003\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u0004\u001a\u00020\u0008H\u0016J\u0018\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000eH\u0016J\u0008\u0010\u000f\u001a\u00020\nH\u0016J\u0008\u0010\u0010\u001a\u00020\nH\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0011"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;",
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

    .line 315
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 316
    new-instance v0, Lnicoid/network238/okio/ForwardingTimeout;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object p1

    invoke-interface {p1}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    invoke-interface {p1}, Lnicoid/network238/okio/Sink;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object p1

    invoke-direct {v0, p1}, Lnicoid/network238/okio/ForwardingTimeout;-><init>(Lnicoid/network238/okio/Timeout;)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;->timeout:Lnicoid/network238/okio/ForwardingTimeout;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 3

    .line 336
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;->closed:Z

    if-eqz v0, :cond_0

    return-void

    .line 337
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;->closed:Z

    .line 339
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSink;->flush()V

    .line 340
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;->timeout:Lnicoid/network238/okio/ForwardingTimeout;

    # invokes: Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->detachTimeout(Lnicoid/network238/okio/ForwardingTimeout;)V
    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$detachTimeout(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okio/ForwardingTimeout;)V

    .line 341
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$setState$p(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;I)V

    return-void
.end method

.method public flush()V
    .registers 2

    .line 331
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;->closed:Z

    if-eqz v0, :cond_0

    return-void

    .line 332
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSink;->flush()V

    return-void
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 319
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;->timeout:Lnicoid/network238/okio/ForwardingTimeout;

    return-object v0
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 325
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;->closed:Z

    if-nez v0, :cond_0

    .line 326
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    move-wide v5, p2

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->checkOffsetAndCount(JJJ)V

    .line 327
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object p2

    invoke-interface {p2}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object p2

    invoke-interface {p2, p1, v5, v6}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    return-void

    .line 325
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
