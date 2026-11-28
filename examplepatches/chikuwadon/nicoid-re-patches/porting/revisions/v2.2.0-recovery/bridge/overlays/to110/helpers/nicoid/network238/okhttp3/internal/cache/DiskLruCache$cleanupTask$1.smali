.class public final Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$cleanupTask$1;
.super Lnicoid/network238/okhttp3/internal/concurrent/Task;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;-><init>(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;IIJLnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/cache/DiskLruCache$cleanupTask$1",
        "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
        "runOnce",
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
.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;


# direct methods
.method constructor <init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Ljava/lang/String;)V
    .registers 5

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$cleanupTask$1;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    .line 189
    const/4 p1, 0x0

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p0, p2, p1, v0, v1}, Lnicoid/network238/okhttp3/internal/concurrent/Task;-><init>(Ljava/lang/String;ZILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method


# virtual methods
.method public runOnce()J
    .registers 4

    .line 191
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$cleanupTask$1;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    monitor-enter v0

    .line 192
    :try_start_0
    # getter for: Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->initialized:Z
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->access$getInitialized$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getClosed$okhttp()Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_1

    .line 197
    const/4 v1, 0x1

    :try_start_1
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->trimToSize()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v2

    .line 199
    :try_start_2
    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->access$setMostRecentTrimFailed$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 203
    :goto_0
    :try_start_3
    # invokes: Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalRebuildRequired()Z
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->access$journalRebuildRequired(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 204
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->rebuildJournal$okhttp()V

    .line 205
    const/4 v2, 0x0

    invoke-static {v0, v2}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->access$setRedundantOpCount$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;I)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :catch_1
    move-exception v2

    .line 208
    :try_start_4
    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->access$setMostRecentRebuildFailed$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Z)V

    .line 209
    # getter for: Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->access$getJournalWriter$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    .line 210
    :cond_0
    invoke-static {}, Lnicoid/network238/okio/Okio;->blackhole()Lnicoid/network238/okio/Sink;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->access$setJournalWriter$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Lnicoid/network238/okio/BufferedSink;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 191
    :cond_1
    :goto_1
    monitor-exit v0

    const-wide/16 v0, -0x1

    return-wide v0

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
