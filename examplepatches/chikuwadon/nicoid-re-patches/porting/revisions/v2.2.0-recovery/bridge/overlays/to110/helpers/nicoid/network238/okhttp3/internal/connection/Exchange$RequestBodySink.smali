.class final Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;
.super Lnicoid/network238/okio/ForwardingSink;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/connection/Exchange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "RequestBodySink"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0018\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0005H\u0016J\u0008\u0010\u0013\u001a\u00020\u000fH\u0016J\u0008\u0010\u0014\u001a\u00020\u000fH\u0016J\u0014\u0010\u0015\u001a\u0004\u0018\u00010\u00162\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0016H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;",
        "Lnicoid/network238/okio/ForwardingSink;",
        "delegate",
        "Lnicoid/network238/okio/Sink;",
        "contentLength",
        "",
        "isSocket",
        "",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okio/Sink;JZ)V",
        "completed",
        "bytesReceived",
        "invokeStartEvent",
        "closed",
        "write",
        "",
        "source",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "flush",
        "close",
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
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okio/Sink;JZ)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/Sink;",
            "JZ)V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 251
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->this$0:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    invoke-direct {p0, p2}, Lnicoid/network238/okio/ForwardingSink;-><init>(Lnicoid/network238/okio/Sink;)V

    .line 254
    iput-wide p3, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->contentLength:J

    .line 255
    iput-boolean p5, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->isSocket:Z

    .line 259
    iput-boolean p5, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->invokeStartEvent:Z

    return-void
.end method

.method private final complete(Ljava/io/IOException;)Ljava/io/IOException;
    .registers 12

    .line 311
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->completed:Z

    if-eqz v0, :cond_0

    return-object p1

    .line 312
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->completed:Z

    .line 313
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->this$0:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    .line 314
    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->bytesReceived:J

    .line 315
    iget-boolean v4, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->isSocket:Z

    .line 313
    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v8, 0x4

    const/4 v9, 0x0

    move-object v7, p1

    invoke-static/range {v1 .. v9}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->bodyComplete$default(Lnicoid/network238/okhttp3/internal/connection/Exchange;JZZZLjava/io/IOException;ILjava/lang/Object;)Ljava/io/IOException;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public close()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 296
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->closed:Z

    if-eqz v0, :cond_0

    return-void

    .line 297
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->closed:Z

    .line 298
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->contentLength:J

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_1

    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->bytesReceived:J

    cmp-long v0, v2, v0

    if-eqz v0, :cond_1

    .line 299
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "unexpected end of stream"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 302
    :cond_1
    :try_start_0
    invoke-super {p0}, Lnicoid/network238/okio/ForwardingSink;->close()V

    .line 303
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->complete(Ljava/io/IOException;)Ljava/io/IOException;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 305
    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->complete(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    throw v0
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 288
    :try_start_0
    invoke-super {p0}, Lnicoid/network238/okio/ForwardingSink;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 290
    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->complete(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    throw v0
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 267
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->closed:Z

    if-nez v0, :cond_2

    .line 268
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->contentLength:J

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->bytesReceived:J

    add-long/2addr v2, p2

    cmp-long v0, v2, v0

    if-lez v0, :cond_0

    .line 269
    new-instance p1, Ljava/net/ProtocolException;

    .line 270
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "expected "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->contentLength:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " bytes but received "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->bytesReceived:J

    add-long/2addr v1, p2

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 269
    invoke-direct {p1, p2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 274
    :cond_0
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->invokeStartEvent:Z

    if-eqz v0, :cond_1

    .line 275
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->invokeStartEvent:Z

    .line 276
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->this$0:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getCall$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->this$0:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getCall$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/EventListener;->requestBodyStart(Lnicoid/network238/okhttp3/Call;)V

    .line 278
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lnicoid/network238/okio/ForwardingSink;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 279
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->bytesReceived:J

    add-long/2addr v0, p2

    iput-wide v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->bytesReceived:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 281
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;->complete(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    throw p1

    .line 267
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
