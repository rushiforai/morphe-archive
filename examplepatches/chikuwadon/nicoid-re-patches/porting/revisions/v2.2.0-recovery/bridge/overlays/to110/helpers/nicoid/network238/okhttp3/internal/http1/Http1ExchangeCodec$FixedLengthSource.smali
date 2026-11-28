.class final Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$FixedLengthSource;
.super Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "FixedLengthSource"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\u0008\u0082\u0004\u0018\u00002\u00060\u0001R\u00020\u0002B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0018\u0010\t\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u0006H\u0016J\u0008\u0010\r\u001a\u00020\u000eH\u0016R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000f"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$FixedLengthSource;",
        "Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;",
        "Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "bytesRemaining",
        "",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okhttp3/HttpUrl;J)V",
        "read",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "close",
        "",
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
.field private bytesRemaining:J

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okhttp3/HttpUrl;J)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/HttpUrl;",
            "J)V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 427
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$FixedLengthSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;-><init>(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okhttp3/HttpUrl;)V

    .line 429
    iput-wide p3, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$FixedLengthSource;->bytesRemaining:J

    const-wide/16 p1, 0x0

    cmp-long p1, p3, p1

    if-nez p1, :cond_0

    .line 433
    sget-object p1, Lnicoid/network238/okhttp3/Headers;->EMPTY:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->responseBodyComplete(Lnicoid/network238/okhttp3/Headers;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .registers 5

    .line 461
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->getClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 463
    :cond_0
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$FixedLengthSource;->bytesRemaining:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 464
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/16 v1, 0x64

    invoke-static {p0, v1, v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->discard(Lnicoid/network238/okio/Source;ILjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 466
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$FixedLengthSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;->noNewExchanges()V

    .line 467
    # getter for: Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->TRAILERS_RESPONSE_BODY_TRUNCATED:Lnicoid/network238/okhttp3/Headers;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$getTRAILERS_RESPONSE_BODY_TRUNCATED$cp()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->responseBodyComplete(Lnicoid/network238/okhttp3/Headers;)V

    :cond_1
    nop

    .line 470
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->setClosed(Z)V

    return-void
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_4

    .line 442
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->getClosed()Z

    move-result v2

    if-nez v2, :cond_3

    .line 443
    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$FixedLengthSource;->bytesRemaining:J

    cmp-long v4, v2, v0

    const-wide/16 v5, -0x1

    if-nez v4, :cond_0

    return-wide v5

    .line 445
    :cond_0
    invoke-static {v2, v3, p2, p3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    invoke-super {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide p1

    cmp-long p3, p1, v5

    if-eqz p3, :cond_2

    .line 453
    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$FixedLengthSource;->bytesRemaining:J

    sub-long/2addr v2, p1

    iput-wide v2, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$FixedLengthSource;->bytesRemaining:J

    cmp-long p3, v2, v0

    if-nez p3, :cond_1

    .line 455
    sget-object p3, Lnicoid/network238/okhttp3/Headers;->EMPTY:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {p0, p3}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->responseBodyComplete(Lnicoid/network238/okhttp3/Headers;)V

    :cond_1
    return-wide p1

    .line 447
    :cond_2
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$FixedLengthSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    move-result-object p1

    invoke-interface {p1}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;->noNewExchanges()V

    .line 448
    new-instance p1, Ljava/net/ProtocolException;

    const-string p2, "unexpected end of stream"

    invoke-direct {p1, p2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 449
    # getter for: Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->TRAILERS_RESPONSE_BODY_TRUNCATED:Lnicoid/network238/okhttp3/Headers;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$getTRAILERS_RESPONSE_BODY_TRUNCATED$cp()Lnicoid/network238/okhttp3/Headers;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->responseBodyComplete(Lnicoid/network238/okhttp3/Headers;)V

    .line 450
    throw p1

    .line 442
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 441
    :cond_4
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
