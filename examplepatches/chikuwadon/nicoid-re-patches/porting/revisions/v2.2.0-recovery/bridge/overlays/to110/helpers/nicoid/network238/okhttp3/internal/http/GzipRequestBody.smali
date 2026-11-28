.class public final Lnicoid/network238/okhttp3/internal/http/GzipRequestBody;
.super Lnicoid/network238/okhttp3/RequestBody;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\u0008\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\n\u0010\u0007\u001a\u0004\u0018\u00010\u0008H\u0016J\u0008\u0010\t\u001a\u00020\nH\u0016J\u0010\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000eH\u0016J\u0008\u0010\u000f\u001a\u00020\u0010H\u0016R\u0011\u0010\u0002\u001a\u00020\u0001\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0011"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http/GzipRequestBody;",
        "Lnicoid/network238/okhttp3/RequestBody;",
        "delegate",
        "<init>",
        "(Lnicoid/network238/okhttp3/RequestBody;)V",
        "getDelegate",
        "()Lnicoid/network238/okhttp3/RequestBody;",
        "contentType",
        "Lnicoid/network238/okhttp3/MediaType;",
        "contentLength",
        "",
        "writeTo",
        "",
        "sink",
        "Lnicoid/network238/okio/BufferedSink;",
        "isOneShot",
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
.field private final delegate:Lnicoid/network238/okhttp3/RequestBody;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/RequestBody;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    invoke-direct {p0}, Lnicoid/network238/okhttp3/RequestBody;-><init>()V

    .line 24
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http/GzipRequestBody;->delegate:Lnicoid/network238/okhttp3/RequestBody;

    return-void
.end method


# virtual methods
.method public contentLength()J
    .registers 3

    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public contentType()Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    .line 26
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/GzipRequestBody;->delegate:Lnicoid/network238/okhttp3/RequestBody;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/RequestBody;->contentType()Lnicoid/network238/okhttp3/MediaType;

    move-result-object v0

    return-object v0
.end method

.method public final getDelegate()Lnicoid/network238/okhttp3/RequestBody;
    .registers 2

    .line 24
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/GzipRequestBody;->delegate:Lnicoid/network238/okhttp3/RequestBody;

    return-object v0
.end method

.method public isOneShot()Z
    .registers 2

    .line 35
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/GzipRequestBody;->delegate:Lnicoid/network238/okhttp3/RequestBody;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/RequestBody;->isOneShot()Z

    move-result v0

    return v0
.end method

.method public writeTo(Lnicoid/network238/okio/BufferedSink;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    new-instance v0, Lnicoid/network238/okio/GzipSink;

    invoke-direct {v0, p1}, Lnicoid/network238/okio/GzipSink;-><init>(Lnicoid/network238/okio/Sink;)V

    invoke-static {v0}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/GzipRequestBody;->delegate:Lnicoid/network238/okhttp3/RequestBody;

    :try_start_0
    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/RequestBody;->writeTo(Lnicoid/network238/okio/BufferedSink;)V

    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception v1

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v1
.end method
