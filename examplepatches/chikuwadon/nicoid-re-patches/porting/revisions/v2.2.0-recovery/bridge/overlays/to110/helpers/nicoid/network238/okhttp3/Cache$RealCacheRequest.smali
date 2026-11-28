.class final Lnicoid/network238/okhttp3/Cache$RealCacheRequest;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/cache/CacheRequest;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Cache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "RealCacheRequest"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\u0013\u0012\n\u0010\u0002\u001a\u00060\u0003R\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0008\u0010\u0010\u001a\u00020\u0011H\u0016J\u0008\u0010\t\u001a\u00020\u0008H\u0016R\u0012\u0010\u0002\u001a\u00060\u0003R\u00020\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\n\u001a\u00020\u000bX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000c\u0010\r\"\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0012"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Cache$RealCacheRequest;",
        "Lnicoid/network238/okhttp3/internal/cache/CacheRequest;",
        "editor",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;",
        "<init>",
        "(Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V",
        "cacheOut",
        "Lnicoid/network238/okio/Sink;",
        "body",
        "done",
        "",
        "getDone",
        "()Z",
        "setDone",
        "(Z)V",
        "abort",
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
.field private final body:Lnicoid/network238/okio/Sink;

.field private final cacheOut:Lnicoid/network238/okio/Sink;

.field private done:Z

.field private final editor:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

.field final synthetic this$0:Lnicoid/network238/okhttp3/Cache;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;",
            ")V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 425
    iput-object p1, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->this$0:Lnicoid/network238/okhttp3/Cache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 426
    iput-object p2, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->editor:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    .line 428
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->newSink(I)Lnicoid/network238/okio/Sink;

    move-result-object p2

    iput-object p2, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->cacheOut:Lnicoid/network238/okio/Sink;

    .line 434
    new-instance v0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest$1;

    invoke-direct {v0, p1, p0, p2}, Lnicoid/network238/okhttp3/Cache$RealCacheRequest$1;-><init>(Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/Cache$RealCacheRequest;Lnicoid/network238/okio/Sink;)V

    .line 433
    iput-object v0, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->body:Lnicoid/network238/okio/Sink;

    return-void
.end method

.method public static final synthetic access$getEditor$p(Lnicoid/network238/okhttp3/Cache$RealCacheRequest;)Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;
    .registers 1

    .line 425
    iget-object p0, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->editor:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    return-object p0
.end method


# virtual methods
.method public abort()V
    .registers 4

    .line 449
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->this$0:Lnicoid/network238/okhttp3/Cache;

    monitor-enter v0

    .line 450
    :try_start_0
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->done:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 449
    monitor-exit v0

    return-void

    :cond_0
    nop

    .line 451
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->done:Z

    .line 452
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cache;->getWriteAbortCount$okhttp()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/Cache;->setWriteAbortCount$okhttp(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 449
    monitor-exit v0

    .line 454
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->cacheOut:Lnicoid/network238/okio/Sink;

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    .line 456
    :try_start_2
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->editor:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->abort()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    return-void

    :catchall_0
    move-exception v1

    .line 449
    monitor-exit v0

    throw v1
.end method

.method public body()Lnicoid/network238/okio/Sink;
    .registers 2

    .line 461
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->body:Lnicoid/network238/okio/Sink;

    return-object v0
.end method

.method public final getDone()Z
    .registers 2

    .line 430
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->done:Z

    return v0
.end method

.method public final setDone(Z)V
    .registers 2

    .line 430
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->done:Z

    return-void
.end method
