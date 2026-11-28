.class public final Lnicoid/network238/okhttp3/Cache;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/io/Flushable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/Cache$CacheResponseBody;,
        Lnicoid/network238/okhttp3/Cache$Companion;,
        Lnicoid/network238/okhttp3/Cache$Entry;,
        Lnicoid/network238/okhttp3/Cache$RealCacheRequest;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0082\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u000b\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010)\n\u0002\u0010\u000e\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u0000 L2\u00020\u00012\u00020\u0002:\u0004IJKLB)\u0008\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u0012\u0006\u0010\t\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000b\u0010\u000cB!\u0008\u0016\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u000b\u0010\rB\u0019\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u000e\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u000b\u0010\u000fJ\u0017\u0010#\u001a\u0004\u0018\u00010$2\u0006\u0010%\u001a\u00020&H\u0000\u00a2\u0006\u0002\u0008\'J\u0017\u0010(\u001a\u0004\u0018\u00010)2\u0006\u0010*\u001a\u00020$H\u0000\u00a2\u0006\u0002\u0008+J\u0015\u0010,\u001a\u00020-2\u0006\u0010%\u001a\u00020&H\u0000\u00a2\u0006\u0002\u0008.J\u001d\u0010/\u001a\u00020-2\u0006\u00100\u001a\u00020$2\u0006\u00101\u001a\u00020$H\u0000\u00a2\u0006\u0002\u00082J\u0016\u00103\u001a\u00020-2\u000c\u00104\u001a\u0008\u0018\u000105R\u00020\u0011H\u0002J\u0006\u00106\u001a\u00020-J\u0006\u00107\u001a\u00020-J\u0006\u00108\u001a\u00020-J\u000c\u00109\u001a\u0008\u0012\u0004\u0012\u00020;0:J\u0006\u0010\u001a\u001a\u00020\u0015J\u0006\u0010\u0014\u001a\u00020\u0015J\u0006\u0010<\u001a\u00020\u0006J\u0006\u0010\u0005\u001a\u00020\u0006J\u0008\u0010=\u001a\u00020-H\u0016J\u0008\u0010>\u001a\u00020-H\u0016J\r\u0010\u0003\u001a\u00020\u000eH\u0007\u00a2\u0006\u0002\u0008BJ\u0015\u0010C\u001a\u00020-2\u0006\u0010D\u001a\u00020EH\u0000\u00a2\u0006\u0002\u0008FJ\r\u0010G\u001a\u00020-H\u0000\u00a2\u0006\u0002\u0008HJ\u0006\u0010\u001d\u001a\u00020\u0015J\u0006\u0010\u001e\u001a\u00020\u0015J\u0006\u0010\u001f\u001a\u00020\u0015R\u0014\u0010\u0010\u001a\u00020\u0011X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013R\u001a\u0010\u0014\u001a\u00020\u0015X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0016\u0010\u0017\"\u0004\u0008\u0018\u0010\u0019R\u001a\u0010\u001a\u001a\u00020\u0015X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001b\u0010\u0017\"\u0004\u0008\u001c\u0010\u0019R\u000e\u0010\u001d\u001a\u00020\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0011\u0010 \u001a\u00020!8F\u00a2\u0006\u0006\u001a\u0004\u0008 \u0010\"R\u0011\u0010\u0003\u001a\u00020\u000e8G\u00a2\u0006\u0006\u001a\u0004\u0008\u0003\u0010?R\u0011\u0010@\u001a\u00020\u00048G\u00a2\u0006\u0006\u001a\u0004\u0008@\u0010A\u00a8\u0006M"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Cache;",
        "Ljava/io/Closeable;",
        "Ljava/io/Flushable;",
        "directory",
        "Lnicoid/network238/okio/Path;",
        "maxSize",
        "",
        "fileSystem",
        "Lnicoid/network238/okio/FileSystem;",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "<init>",
        "(Lnicoid/network238/okio/Path;JLnicoid/network238/okio/FileSystem;Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V",
        "(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;J)V",
        "Ljava/io/File;",
        "(Ljava/io/File;J)V",
        "cache",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;",
        "getCache$okhttp",
        "()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;",
        "writeSuccessCount",
        "",
        "getWriteSuccessCount$okhttp",
        "()I",
        "setWriteSuccessCount$okhttp",
        "(I)V",
        "writeAbortCount",
        "getWriteAbortCount$okhttp",
        "setWriteAbortCount$okhttp",
        "networkCount",
        "hitCount",
        "requestCount",
        "isClosed",
        "",
        "()Z",
        "get",
        "Lnicoid/network238/okhttp3/Response;",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "get$okhttp",
        "put",
        "Lnicoid/network238/okhttp3/internal/cache/CacheRequest;",
        "response",
        "put$okhttp",
        "remove",
        "",
        "remove$okhttp",
        "update",
        "cached",
        "network",
        "update$okhttp",
        "abortQuietly",
        "editor",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;",
        "initialize",
        "delete",
        "evictAll",
        "urls",
        "",
        "",
        "size",
        "flush",
        "close",
        "()Ljava/io/File;",
        "directoryPath",
        "()Lnicoid/network238/okio/Path;",
        "-deprecated_directory",
        "trackResponse",
        "cacheStrategy",
        "Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;",
        "trackResponse$okhttp",
        "trackConditionalCacheHit",
        "trackConditionalCacheHit$okhttp",
        "RealCacheRequest",
        "Entry",
        "CacheResponseBody",
        "Companion",
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


# static fields
.field public static final Companion:Lnicoid/network238/okhttp3/Cache$Companion;

.field private static final ENTRY_BODY:I = 0x1

.field private static final ENTRY_COUNT:I = 0x2

.field private static final ENTRY_METADATA:I = 0x0

.field private static final VERSION:I = 0x31191


# instance fields
.field private final cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

.field private hitCount:I

.field private networkCount:I

.field private requestCount:I

.field private writeAbortCount:I

.field private writeSuccessCount:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/Cache$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/Cache$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/Cache;->Companion:Lnicoid/network238/okhttp3/Cache$Companion;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;J)V
    .registers 9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 168
    sget-object v0, Lnicoid/network238/okio/FileSystem;->SYSTEM:Lnicoid/network238/okio/FileSystem;

    .line 169
    sget-object v1, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v1, p1, v4, v2, v3}, Lnicoid/network238/okio/Path$Companion;->get$default(Lnicoid/network238/okio/Path$Companion;Ljava/io/File;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;

    move-result-object p1

    .line 167
    invoke-direct {p0, v0, p1, p2, p3}, Lnicoid/network238/okhttp3/Cache;-><init>(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;J)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;J)V
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 163
    sget-object v5, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->INSTANCE:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 159
    move-object v0, p0

    move-object v4, p1

    move-object v1, p2

    move-wide v2, p3

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/Cache;-><init>(Lnicoid/network238/okio/Path;JLnicoid/network238/okio/FileSystem;Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/Path;JLnicoid/network238/okio/FileSystem;Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V
    .registers 14

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 174
    new-instance v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    const v3, 0x31191

    const/4 v4, 0x2

    move-object v2, p1

    move-wide v5, p2

    move-object v1, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;-><init>(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;IIJLnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    return-void
.end method

.method private final abortQuietly(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V
    .registers 2

    if-eqz p1, :cond_0

    .line 277
    :try_start_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->abort()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    :cond_0
    :goto_0
    return-void
.end method

.method public static final key(Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;
    .registers 2

    sget-object v0, Lnicoid/network238/okhttp3/Cache;->Companion:Lnicoid/network238/okhttp3/Cache$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/Cache$Companion;->key(Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final -deprecated_directory()Ljava/io/File;
    .registers 2

    .line 401
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getDirectory()Lnicoid/network238/okio/Path;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/Path;->toFile()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 384
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->close()V

    return-void
.end method

.method public final delete()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 304
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->delete()V

    return-void
.end method

.method public final directory()Ljava/io/File;
    .registers 2

    .line 389
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getDirectory()Lnicoid/network238/okio/Path;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/Path;->toFile()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public final directoryPath()Lnicoid/network238/okio/Path;
    .registers 2

    .line 393
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getDirectory()Lnicoid/network238/okio/Path;

    move-result-object v0

    return-object v0
.end method

.method public final evictAll()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 313
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->evictAll()V

    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 379
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->flush()V

    return-void
.end method

.method public final get$okhttp(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 194
    sget-object v0, Lnicoid/network238/okhttp3/Cache;->Companion:Lnicoid/network238/okhttp3/Cache$Companion;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Cache$Companion;->key(Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;

    move-result-object v0

    .line 197
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v2, v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    if-nez v0, :cond_0

    goto :goto_0

    .line 204
    :cond_0
    :try_start_1
    new-instance v2, Lnicoid/network238/okhttp3/Cache$Entry;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->getSource(I)Lnicoid/network238/okio/Source;

    move-result-object v3

    invoke-direct {v2, v3}, Lnicoid/network238/okhttp3/Cache$Entry;-><init>(Lnicoid/network238/okio/Source;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 210
    invoke-virtual {v2, v0}, Lnicoid/network238/okhttp3/Cache$Entry;->response(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;)Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    .line 211
    invoke-virtual {v2, p1, v0}, Lnicoid/network238/okhttp3/Cache$Entry;->matches(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Response;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 212
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p1

    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    return-object v1

    :cond_1
    return-object v0

    :catch_0
    move-exception p1

    .line 206
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    return-object v1

    :catch_1
    move-exception p1

    :goto_0
    return-object v1
.end method

.method public final getCache$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;
    .registers 2

    .line 173
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    return-object v0
.end method

.method public final getWriteAbortCount$okhttp()I
    .registers 2

    .line 185
    iget v0, p0, Lnicoid/network238/okhttp3/Cache;->writeAbortCount:I

    return v0
.end method

.method public final getWriteSuccessCount$okhttp()I
    .registers 2

    .line 184
    iget v0, p0, Lnicoid/network238/okhttp3/Cache;->writeSuccessCount:I

    return v0
.end method

.method public final declared-synchronized hitCount()I
    .registers 2

    monitor-enter p0

    .line 421
    :try_start_0
    iget v0, p0, Lnicoid/network238/okhttp3/Cache;->hitCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 421
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final initialize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 295
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->initialize()V

    return-void
.end method

.method public final isClosed()Z
    .registers 2

    .line 191
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->isClosed()Z

    move-result v0

    return v0
.end method

.method public final maxSize()J
    .registers 3

    .line 375
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getMaxSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public final declared-synchronized networkCount()I
    .registers 2

    monitor-enter p0

    .line 419
    :try_start_0
    iget v0, p0, Lnicoid/network238/okhttp3/Cache;->networkCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 419
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final put$okhttp(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/internal/cache/CacheRequest;
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 220
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v0

    .line 222
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/http/HttpMethod;->invalidatesCache(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 224
    :try_start_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/Cache;->remove$okhttp(Lnicoid/network238/okhttp3/Request;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0

    .line 231
    :cond_0
    const-string v1, "GET"

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 237
    :cond_1
    sget-object v0, Lnicoid/network238/okhttp3/Cache;->Companion:Lnicoid/network238/okhttp3/Cache$Companion;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Cache$Companion;->hasVaryAll(Lnicoid/network238/okhttp3/Response;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    .line 241
    :cond_2
    new-instance v1, Lnicoid/network238/okhttp3/Cache$Entry;

    invoke-direct {v1, p1}, Lnicoid/network238/okhttp3/Cache$Entry;-><init>(Lnicoid/network238/okhttp3/Response;)V

    .line 244
    :try_start_1
    iget-object v3, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Cache$Companion;->key(Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x2

    const/4 v8, 0x0

    const-wide/16 v5, 0x0

    invoke-static/range {v3 .. v8}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->edit$default(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Ljava/lang/String;JILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object p1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    if-nez p1, :cond_3

    :goto_0
    return-object v2

    .line 245
    :cond_3
    :try_start_2
    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/Cache$Entry;->writeTo(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V

    .line 246
    new-instance v0, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/okhttp3/Cache$RealCacheRequest;-><init>(Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    return-object v0

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    .line 248
    move-object p1, v2

    :goto_1
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/Cache;->abortQuietly(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V

    return-object v2
.end method

.method public final remove$okhttp(Lnicoid/network238/okhttp3/Request;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 255
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    sget-object v1, Lnicoid/network238/okhttp3/Cache;->Companion:Lnicoid/network238/okhttp3/Cache$Companion;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/Cache$Companion;->key(Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->remove(Ljava/lang/String;)Z

    return-void
.end method

.method public final declared-synchronized requestCount()I
    .registers 2

    monitor-enter p0

    .line 423
    :try_start_0
    iget v0, p0, Lnicoid/network238/okhttp3/Cache;->requestCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 423
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final setWriteAbortCount$okhttp(I)V
    .registers 2

    .line 185
    iput p1, p0, Lnicoid/network238/okhttp3/Cache;->writeAbortCount:I

    return-void
.end method

.method public final setWriteSuccessCount$okhttp(I)V
    .registers 2

    .line 184
    iput p1, p0, Lnicoid/network238/okhttp3/Cache;->writeSuccessCount:I

    return-void
.end method

.method public final size()J
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 372
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache;->cache:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->size()J

    move-result-wide v0

    return-wide v0
.end method

.method public final declared-synchronized trackConditionalCacheHit$okhttp()V
    .registers 2

    monitor-enter p0

    .line 416
    :try_start_0
    iget v0, p0, Lnicoid/network238/okhttp3/Cache;->hitCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnicoid/network238/okhttp3/Cache;->hitCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 416
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final declared-synchronized trackResponse$okhttp(Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;)V
    .registers 3

    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 404
    iget v0, p0, Lnicoid/network238/okhttp3/Cache;->requestCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnicoid/network238/okhttp3/Cache;->requestCount:I

    .line 406
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;->getNetworkRequest()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 408
    iget p1, p0, Lnicoid/network238/okhttp3/Cache;->networkCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lnicoid/network238/okhttp3/Cache;->networkCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 409
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;->getCacheResponse()Lnicoid/network238/okhttp3/Response;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 411
    iget p1, p0, Lnicoid/network238/okhttp3/Cache;->hitCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lnicoid/network238/okhttp3/Cache;->hitCount:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    .line 403
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public final update$okhttp(Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Response;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 262
    new-instance v0, Lnicoid/network238/okhttp3/Cache$Entry;

    invoke-direct {v0, p2}, Lnicoid/network238/okhttp3/Cache$Entry;-><init>(Lnicoid/network238/okhttp3/Response;)V

    .line 263
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p1, Lnicoid/network238/okhttp3/Cache$CacheResponseBody;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Cache$CacheResponseBody;->getSnapshot()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    move-result-object p1

    .line 266
    :try_start_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->edit()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    if-nez p1, :cond_0

    return-void

    .line 267
    :cond_0
    :try_start_1
    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Cache$Entry;->writeTo(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V

    .line 268
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->commit()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p2

    goto :goto_0

    :catch_1
    move-exception p1

    const/4 p1, 0x0

    .line 270
    :goto_0
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/Cache;->abortQuietly(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V

    return-void
.end method

.method public final urls()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 327
    new-instance v0, Lnicoid/network238/okhttp3/Cache$urls$1;

    invoke-direct {v0, p0}, Lnicoid/network238/okhttp3/Cache$urls$1;-><init>(Lnicoid/network238/okhttp3/Cache;)V

    return-object v0
.end method

.method public final declared-synchronized writeAbortCount()I
    .registers 2

    monitor-enter p0

    .line 367
    :try_start_0
    iget v0, p0, Lnicoid/network238/okhttp3/Cache;->writeAbortCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 367
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final declared-synchronized writeSuccessCount()I
    .registers 2

    monitor-enter p0

    .line 369
    :try_start_0
    iget v0, p0, Lnicoid/network238/okhttp3/Cache;->writeSuccessCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 369
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method
