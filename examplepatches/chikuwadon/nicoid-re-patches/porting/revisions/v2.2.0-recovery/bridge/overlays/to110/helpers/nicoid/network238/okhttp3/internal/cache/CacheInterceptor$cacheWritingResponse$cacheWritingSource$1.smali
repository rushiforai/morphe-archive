.class public final Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor;->cacheWritingResponse(Lnicoid/network238/okhttp3/internal/cache/CacheRequest;Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000+\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u0005H\u0016J\u0008\u0010\t\u001a\u00020\nH\u0016J\u0008\u0010\u000b\u001a\u00020\u000cH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1",
        "Lnicoid/network238/okio/Source;",
        "cacheRequestClosed",
        "",
        "read",
        "",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
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
.field final synthetic $cacheBody:Lnicoid/network238/okio/BufferedSink;

.field final synthetic $cacheRequest:Lnicoid/network238/okhttp3/internal/cache/CacheRequest;

.field final synthetic $source:Lnicoid/network238/okio/BufferedSource;

.field private cacheRequestClosed:Z


# direct methods
.method constructor <init>(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/internal/cache/CacheRequest;Lnicoid/network238/okio/BufferedSink;)V
    .registers 4

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->$source:Lnicoid/network238/okio/BufferedSource;

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->$cacheRequest:Lnicoid/network238/okhttp3/internal/cache/CacheRequest;

    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->$cacheBody:Lnicoid/network238/okio/BufferedSink;

    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 220
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->cacheRequestClosed:Z

    if-nez v0, :cond_0

    .line 221
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/16 v1, 0x64

    invoke-static {p0, v1, v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->discard(Lnicoid/network238/okio/Source;ILjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 223
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->cacheRequestClosed:Z

    .line 224
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->$cacheRequest:Lnicoid/network238/okhttp3/internal/cache/CacheRequest;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/cache/CacheRequest;->abort()V

    .line 226
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->$source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->close()V

    return-void
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 194
    const/4 v1, 0x1

    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->$source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0, p1, p2, p3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const-wide/16 p2, -0x1

    cmp-long v0, v6, p2

    if-nez v0, :cond_1

    .line 204
    iget-boolean p1, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->cacheRequestClosed:Z

    if-nez p1, :cond_0

    .line 205
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->cacheRequestClosed:Z

    .line 206
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->$cacheBody:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {p1}, Lnicoid/network238/okio/Sink;->close()V

    :cond_0
    return-wide p2

    .line 211
    :cond_1
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->$cacheBody:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {p2}, Lnicoid/network238/okio/BufferedSink;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v3

    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p2

    sub-long v4, p2, v6

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Lnicoid/network238/okio/Buffer;->copyTo(Lnicoid/network238/okio/Buffer;JJ)Lnicoid/network238/okio/Buffer;

    .line 212
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->$cacheBody:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    return-wide v6

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 196
    iget-boolean p2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->cacheRequestClosed:Z

    if-nez p2, :cond_2

    .line 197
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->cacheRequestClosed:Z

    .line 198
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->$cacheRequest:Lnicoid/network238/okhttp3/internal/cache/CacheRequest;

    invoke-interface {p2}, Lnicoid/network238/okhttp3/internal/cache/CacheRequest;->abort()V

    .line 200
    :cond_2
    throw p1
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 216
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;->$source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    return-object v0
.end method
