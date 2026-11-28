.class final Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$UnknownLengthSource;
.super Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "UnknownLengthSource"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\u0008\u0082\u0004\u0018\u00002\u00060\u0001R\u00020\u0002B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0018\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\nH\u0016J\u0008\u0010\u000e\u001a\u00020\u000fH\u0016R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$UnknownLengthSource;",
        "Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;",
        "Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okhttp3/HttpUrl;)V",
        "inputExhausted",
        "",
        "read",
        "",
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
.field private inputExhausted:Z

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

    .line 543
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$UnknownLengthSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;-><init>(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okhttp3/HttpUrl;)V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    .line 566
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->getClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 567
    :cond_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$UnknownLengthSource;->inputExhausted:Z

    if-nez v0, :cond_1

    .line 568
    # getter for: Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->TRAILERS_RESPONSE_BODY_TRUNCATED:Lnicoid/network238/okhttp3/Headers;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$getTRAILERS_RESPONSE_BODY_TRUNCATED$cp()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->responseBodyComplete(Lnicoid/network238/okhttp3/Headers;)V

    :cond_1
    nop

    .line 570
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->setClosed(Z)V

    return-void
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_3

    .line 553
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->getClosed()Z

    move-result v0

    if-nez v0, :cond_2

    .line 554
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$UnknownLengthSource;->inputExhausted:Z

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_0

    return-wide v1

    .line 556
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide p1

    cmp-long p3, p1, v1

    if-nez p3, :cond_1

    .line 558
    const/4 p1, 0x1

    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$UnknownLengthSource;->inputExhausted:Z

    .line 559
    sget-object p1, Lnicoid/network238/okhttp3/Headers;->EMPTY:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->responseBodyComplete(Lnicoid/network238/okhttp3/Headers;)V

    return-wide v1

    :cond_1
    return-wide p1

    .line 553
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 552
    :cond_3
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
