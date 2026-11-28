.class final Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;
.super Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ChunkedSource"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0008\u0082\u0004\u0018\u00002\u00060\u0001R\u00020\u0002B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0018\u0010\u000b\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u0008H\u0016J\u0008\u0010\u000f\u001a\u00020\u0010H\u0002J\u0008\u0010\u0011\u001a\u00020\u0010H\u0016R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;",
        "Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;",
        "Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okhttp3/HttpUrl;)V",
        "bytesRemainingInChunk",
        "",
        "hasMoreChunks",
        "",
        "read",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "readChunkSize",
        "",
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
.field private bytesRemainingInChunk:J

.field private hasMoreChunks:Z

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okhttp3/HttpUrl;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/HttpUrl;",
            ")V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 475
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;-><init>(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okhttp3/HttpUrl;)V

    .line 478
    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->bytesRemainingInChunk:J

    .line 479
    const/4 p1, 0x1

    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->hasMoreChunks:Z

    return-void
.end method

.method private final readChunkSize()V
    .registers 9

    .line 507
    const-string v0, "expected chunk size and optional extensions but was \""

    iget-wide v1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->bytesRemainingInChunk:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 508
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v1

    invoke-interface {v1}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSource()Lnicoid/network238/okio/BufferedSource;

    move-result-object v1

    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 511
    :cond_0
    :try_start_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v1

    invoke-interface {v1}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSource()Lnicoid/network238/okio/BufferedSource;

    move-result-object v1

    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readHexadecimalUnsignedLong()J

    move-result-wide v1

    iput-wide v1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->bytesRemainingInChunk:J

    .line 512
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v1

    invoke-interface {v1}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSource()Lnicoid/network238/okio/BufferedSource;

    move-result-object v1

    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/kotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 513
    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->bytesRemainingInChunk:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-ltz v2, :cond_3

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    const/4 v3, 0x0

    if-lez v2, :cond_1

    const-string v2, ";"

    const/4 v6, 0x2

    const/4 v7, 0x0

    invoke-static {v1, v2, v3, v6, v7}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v2, :cond_3

    .line 523
    :cond_1
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->bytesRemainingInChunk:J

    cmp-long v0, v0, v4

    if-nez v0, :cond_2

    .line 524
    iput-boolean v3, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->hasMoreChunks:Z

    .line 525
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    # getter for: Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->headersReader:Lnicoid/network238/okhttp3/internal/http1/HeadersReader;
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$getHeadersReader$p(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;)Lnicoid/network238/okhttp3/internal/http1/HeadersReader;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;->readHeaders()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    .line 526
    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->responseBodyComplete(Lnicoid/network238/okhttp3/Headers;)V

    :cond_2
    return-void

    .line 514
    :cond_3
    :try_start_1
    new-instance v2, Ljava/net/ProtocolException;

    .line 515
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 516
    iget-wide v4, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->bytesRemainingInChunk:J

    .line 515
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 514
    invoke-direct {v2, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception v0

    .line 520
    new-instance v1, Ljava/net/ProtocolException;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public close()V
    .registers 3

    .line 531
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->getClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 532
    :cond_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->hasMoreChunks:Z

    if-eqz v0, :cond_1

    .line 533
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/16 v1, 0x64

    invoke-static {p0, v1, v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->discard(Lnicoid/network238/okio/Source;ILjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 535
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;->noNewExchanges()V

    .line 536
    # getter for: Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->TRAILERS_RESPONSE_BODY_TRUNCATED:Lnicoid/network238/okhttp3/Headers;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$getTRAILERS_RESPONSE_BODY_TRUNCATED$cp()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->responseBodyComplete(Lnicoid/network238/okhttp3/Headers;)V

    :cond_1
    nop

    .line 538
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->setClosed(Z)V

    return-void
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_5

    .line 486
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->getClosed()Z

    move-result v2

    if-nez v2, :cond_4

    .line 487
    iget-boolean v2, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->hasMoreChunks:Z

    const-wide/16 v3, -0x1

    if-nez v2, :cond_0

    goto :goto_0

    .line 489
    :cond_0
    iget-wide v5, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->bytesRemainingInChunk:J

    cmp-long v0, v5, v0

    if-eqz v0, :cond_1

    cmp-long v0, v5, v3

    if-eqz v0, :cond_1

    goto :goto_1

    .line 490
    :cond_1
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->readChunkSize()V

    .line 491
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->hasMoreChunks:Z

    if-nez v0, :cond_2

    :goto_0
    return-wide v3

    .line 494
    :cond_2
    :goto_1
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->bytesRemainingInChunk:J

    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    invoke-super {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide p1

    cmp-long p3, p1, v3

    if-eqz p3, :cond_3

    .line 501
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->bytesRemainingInChunk:J

    sub-long/2addr v0, p1

    iput-wide v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->bytesRemainingInChunk:J

    return-wide p1

    .line 496
    :cond_3
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    move-result-object p1

    invoke-interface {p1}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;->noNewExchanges()V

    .line 497
    new-instance p1, Ljava/net/ProtocolException;

    const-string p2, "unexpected end of stream"

    invoke-direct {p1, p2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 498
    # getter for: Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->TRAILERS_RESPONSE_BODY_TRUNCATED:Lnicoid/network238/okhttp3/Headers;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$getTRAILERS_RESPONSE_BODY_TRUNCATED$cp()Lnicoid/network238/okhttp3/Headers;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->responseBodyComplete(Lnicoid/network238/okhttp3/Headers;)V

    .line 499
    throw p1

    .line 486
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 485
    :cond_5
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
