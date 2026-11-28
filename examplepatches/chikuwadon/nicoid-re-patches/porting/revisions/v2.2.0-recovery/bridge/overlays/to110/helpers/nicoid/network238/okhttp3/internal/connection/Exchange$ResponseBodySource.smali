.class public final Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;
.super Lnicoid/network238/okio/ForwardingSource;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/connection/Exchange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ResponseBodySource"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0080\u0004\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0018\u0010\u000e\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0005H\u0016J\u0008\u0010\u0012\u001a\u00020\u0013H\u0016J\u0012\u0010\u0014\u001a\u0004\u0018\u00010\u00152\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0015R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0017"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;",
        "Lnicoid/network238/okio/ForwardingSource;",
        "delegate",
        "Lnicoid/network238/okio/Source;",
        "contentLength",
        "",
        "isSocket",
        "",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okio/Source;JZ)V",
        "bytesReceived",
        "invokeStartEvent",
        "completed",
        "closed",
        "read",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "close",
        "",
        "complete",
        "Ljava/io/IOException;",
        "e",
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
.field private bytesReceived:J

.field private closed:Z

.field private completed:Z

.field private final contentLength:J

.field private invokeStartEvent:Z

.field private final isSocket:Z

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/connection/Exchange;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okio/Source;JZ)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/Source;",
            "JZ)V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 323
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->this$0:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    invoke-direct {p0, p2}, Lnicoid/network238/okio/ForwardingSource;-><init>(Lnicoid/network238/okio/Source;)V

    .line 325
    iput-wide p3, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->contentLength:J

    .line 326
    iput-boolean p5, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->isSocket:Z

    .line 329
    const/4 p1, 0x1

    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->invokeStartEvent:Z

    const-wide/16 p1, 0x0

    cmp-long p1, p3, p1

    if-nez p1, :cond_0

    .line 335
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->complete(Ljava/io/IOException;)Ljava/io/IOException;

    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 376
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->closed:Z

    if-eqz v0, :cond_0

    return-void

    .line 377
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->closed:Z

    .line 379
    :try_start_0
    invoke-super {p0}, Lnicoid/network238/okio/ForwardingSource;->close()V

    .line 380
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->complete(Ljava/io/IOException;)Ljava/io/IOException;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 382
    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->complete(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    throw v0
.end method

.method public final complete(Ljava/io/IOException;)Ljava/io/IOException;
    .registers 13

    .line 388
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->completed:Z

    if-eqz v0, :cond_0

    return-object p1

    .line 389
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->completed:Z

    if-nez p1, :cond_1

    .line 391
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->invokeStartEvent:Z

    if-eqz v0, :cond_1

    .line 392
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->invokeStartEvent:Z

    .line 393
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->this$0:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getCall$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->this$0:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getCall$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/EventListener;->responseBodyStart(Lnicoid/network238/okhttp3/Call;)V

    .line 395
    :cond_1
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->this$0:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    .line 396
    iget-wide v3, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->bytesReceived:J

    .line 397
    iget-boolean v5, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->isSocket:Z

    .line 395
    const/4 v6, 0x1

    const/4 v7, 0x0

    const/16 v9, 0x8

    const/4 v10, 0x0

    move-object v8, p1

    invoke-static/range {v2 .. v10}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->bodyComplete$default(Lnicoid/network238/okhttp3/internal/connection/Exchange;JZZZLjava/io/IOException;ILjava/lang/Object;)Ljava/io/IOException;

    move-result-object p1

    return-object p1
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "expected "

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 344
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->closed:Z

    if-nez v1, :cond_4

    .line 346
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okio/ForwardingSource;->delegate()Lnicoid/network238/okio/Source;

    move-result-object v1

    invoke-interface {v1, p1, p2, p3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide p1

    .line 348
    iget-boolean p3, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->invokeStartEvent:Z

    if-eqz p3, :cond_0

    .line 349
    const/4 p3, 0x0

    iput-boolean p3, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->invokeStartEvent:Z

    .line 350
    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->this$0:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    invoke-virtual {p3}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getCall$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object p3

    invoke-virtual {p3}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object p3

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->this$0:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getCall$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object v1

    invoke-virtual {p3, v1}, Lnicoid/network238/okhttp3/EventListener;->responseBodyStart(Lnicoid/network238/okhttp3/Call;)V

    :cond_0
    const-wide/16 v1, -0x1

    cmp-long p3, p1, v1

    const/4 v3, 0x0

    if-nez p3, :cond_1

    .line 354
    invoke-virtual {p0, v3}, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->complete(Ljava/io/IOException;)Ljava/io/IOException;

    return-wide v1

    .line 358
    :cond_1
    iget-wide v4, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->bytesReceived:J

    add-long/2addr v4, p1

    .line 359
    iget-wide v6, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->contentLength:J

    cmp-long p3, v6, v1

    if-eqz p3, :cond_2

    cmp-long p3, v4, v6

    if-lez p3, :cond_2

    .line 360
    new-instance p1, Ljava/net/ProtocolException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->contentLength:J

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " bytes but received "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 363
    :cond_2
    iput-wide v4, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->bytesReceived:J

    .line 364
    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->this$0:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    # getter for: Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;
    invoke-static {p3}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->access$getCodec$p(Lnicoid/network238/okhttp3/internal/connection/Exchange;)Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    move-result-object p3

    invoke-interface {p3}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->isResponseComplete()Z

    move-result p3

    if-eqz p3, :cond_3

    .line 365
    invoke-virtual {p0, v3}, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->complete(Ljava/io/IOException;)Ljava/io/IOException;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_3
    return-wide p1

    :catch_0
    move-exception p1

    .line 370
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;->complete(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    throw p1

    .line 344
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
