.class public final Lnicoid/network238/okhttp3/Cache$urls$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/Cache;->urls()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ljava/lang/String;",
        ">;",
        "Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000)\n\u0000\n\u0002\u0010)\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001J\t\u0010\t\u001a\u00020\u0008H\u0096\u0002J\t\u0010\n\u001a\u00020\u0002H\u0096\u0002J\u0008\u0010\u000b\u001a\u00020\u000cH\u0016R\u0018\u0010\u0003\u001a\u000c\u0012\u0008\u0012\u00060\u0004R\u00020\u00050\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0002X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "nicoid/network238/okhttp3/Cache$urls$1",
        "",
        "",
        "delegate",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;",
        "nextUrl",
        "canRemove",
        "",
        "hasNext",
        "next",
        "remove",
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
.field private canRemove:Z

.field private final delegate:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;",
            ">;"
        }
    .end annotation
.end field

.field private nextUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Lnicoid/network238/okhttp3/Cache;)V
    .registers 2

    .line 327
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 328
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Cache;->getCache$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->snapshots()Ljava/util/Iterator;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/Cache$urls$1;->delegate:Ljava/util/Iterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 6

    .line 333
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$urls$1;->nextUrl:Ljava/lang/String;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 335
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/Cache$urls$1;->canRemove:Z

    .line 336
    :goto_0
    iget-object v2, p0, Lnicoid/network238/okhttp3/Cache$urls$1;->delegate:Ljava/util/Iterator;

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 338
    :try_start_0
    iget-object v2, p0, Lnicoid/network238/okhttp3/Cache$urls$1;->delegate:Ljava/util/Iterator;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/Closeable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    move-object v3, v2

    check-cast v3, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    .line 339
    invoke-virtual {v3, v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->getSource(I)Lnicoid/network238/okio/Source;

    move-result-object v3

    invoke-static {v3}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v3

    .line 340
    invoke-interface {v3}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lnicoid/network238/okhttp3/Cache$urls$1;->nextUrl:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 338
    const/4 v3, 0x0

    :try_start_2
    invoke-static {v2, v3}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    return v1

    :catchall_0
    move-exception v3

    :try_start_3
    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v4

    :try_start_4
    invoke-static {v2, v3}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v4
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception v2

    goto :goto_0

    :cond_1
    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .line 327
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Cache$urls$1;->next()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/lang/String;
    .registers 3

    .line 353
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Cache$urls$1;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 354
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$urls$1;->nextUrl:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 355
    const/4 v1, 0x0

    iput-object v1, p0, Lnicoid/network238/okhttp3/Cache$urls$1;->nextUrl:Ljava/lang/String;

    .line 356
    const/4 v1, 0x1

    iput-boolean v1, p0, Lnicoid/network238/okhttp3/Cache$urls$1;->canRemove:Z

    return-object v0

    .line 353
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public remove()V
    .registers 3

    .line 361
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/Cache$urls$1;->canRemove:Z

    if-eqz v0, :cond_0

    .line 362
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$urls$1;->delegate:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    return-void

    .line 361
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "remove() before next()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
