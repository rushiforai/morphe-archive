.class public final Lnicoid/network238/okhttp3/Cache$RealCacheRequest$1;
.super Lnicoid/network238/okio/ForwardingSink;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/Cache$RealCacheRequest;-><init>(Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004"
    }
    d2 = {
        "nicoid/network238/okhttp3/Cache$RealCacheRequest$1",
        "Lnicoid/network238/okio/ForwardingSink;",
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
.field final synthetic this$0:Lnicoid/network238/okhttp3/Cache;

.field final synthetic this$1:Lnicoid/network238/okhttp3/Cache$RealCacheRequest;


# direct methods
.method constructor <init>(Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/Cache$RealCacheRequest;Lnicoid/network238/okio/Sink;)V
    .registers 4

    iput-object p1, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest$1;->this$0:Lnicoid/network238/okhttp3/Cache;

    iput-object p2, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest$1;->this$1:Lnicoid/network238/okhttp3/Cache$RealCacheRequest;

    .line 434
    invoke-direct {p0, p3}, Lnicoid/network238/okio/ForwardingSink;-><init>(Lnicoid/network238/okio/Sink;)V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 437
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest$1;->this$0:Lnicoid/network238/okhttp3/Cache;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest$1;->this$1:Lnicoid/network238/okhttp3/Cache$RealCacheRequest;

    monitor-enter v0

    .line 438
    :try_start_0
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->getDone()Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 437
    monitor-exit v0

    return-void

    :cond_0
    nop

    .line 439
    const/4 v2, 0x1

    :try_start_1
    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->setDone(Z)V

    .line 440
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cache;->getWriteSuccessCount$okhttp()I

    move-result v1

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Cache;->setWriteSuccessCount$okhttp(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 437
    monitor-exit v0

    .line 442
    invoke-super {p0}, Lnicoid/network238/okio/ForwardingSink;->close()V

    .line 443
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest$1;->this$1:Lnicoid/network238/okhttp3/Cache$RealCacheRequest;

    # getter for: Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->editor:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;
    invoke-static {v0}, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;->access$getEditor$p(Lnicoid/network238/okhttp3/Cache$RealCacheRequest;)Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->commit()V

    return-void

    :catchall_0
    move-exception v1

    .line 437
    monitor-exit v0

    throw v1
.end method
