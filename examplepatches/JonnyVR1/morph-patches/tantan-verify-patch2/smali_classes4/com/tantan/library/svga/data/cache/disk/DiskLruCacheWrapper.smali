.class public final Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/cache/disk/DiskCache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u0000 \u00172\u00020\u0001:\u0001\u0017B\u0017\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0008\u0010\u000c\u001a\u00020\rH\u0016J\u0010\u0010\u000e\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\u0010H\u0016J\u0013\u0010\u0011\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u000f\u001a\u00020\u0010H\u0096\u0002J\u001a\u0010\u0012\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0014H\u0016J\u000f\u0010\u0015\u001a\u0004\u0018\u00010\u0005H\u0016\u00a2\u0006\u0002\u0010\u0016R\u0010\u0010\u0002\u001a\u0004\u0018\u00010\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0007\u001a\u00020\u00088BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\t\u0010\nR\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;",
        "Lcom/tantan/library/svga/data/cache/disk/DiskCache;",
        "directory",
        "Ljava/io/File;",
        "maxSize",
        "",
        "(Ljava/io/File;J)V",
        "diskCache",
        "Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;",
        "getDiskCache",
        "()Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;",
        "diskLruCache",
        "clear",
        "",
        "delete",
        "key",
        "",
        "get",
        "put",
        "writer",
        "Lcom/tantan/library/svga/data/cache/disk/DiskCache$Writer;",
        "size",
        "()Ljava/lang/Long;",
        "Companion",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field private static final APP_VERSION:I = 0x1

.field public static final Companion:Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final VALUE_COUNT:I = 0x1


# instance fields
.field private final directory:Ljava/io/File;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private diskLruCache:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final maxSize:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->Companion:Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper$Companion;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;J)V
    .locals 0
    .param p1    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->directory:Ljava/io/File;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->maxSize:J

    .line 7
    .line 8
    return-void
.end method

.method private final declared-synchronized getDiskCache()Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->diskLruCache:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->directory:Ljava/io/File;

    .line 7
    .line 8
    iget-wide v1, p0, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->maxSize:J

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    invoke-static {v0, v3, v3, v1, v2}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;->open(Ljava/io/File;IIJ)Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->diskLruCache:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->diskLruCache:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return-object v0

    .line 27
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw v0
.end method


# virtual methods
.method public declared-synchronized clear()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    invoke-direct {p0}, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->getDiskCache()Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;->delete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 8
    .line 9
    .line 10
    :try_start_1
    iput-object v0, p0, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->diskLruCache:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    goto :goto_0

    .line 16
    :catchall_1
    move-exception v1

    .line 17
    :try_start_2
    iput-object v0, p0, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->diskLruCache:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 18
    .line 19
    throw v1

    .line 20
    :goto_0
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 21
    throw v0
.end method

.method public delete(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->getDiskCache()Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;->remove(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/io/File;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->getDiskCache()Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;->get(Ljava/lang/String;)Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;->getFile(I)Ljava/io/File;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public put(Ljava/lang/String;Lcom/tantan/library/svga/data/cache/disk/DiskCache$Writer;)Ljava/io/File;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/disk/DiskCache$Writer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->getDiskCache()Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;->get(Ljava/lang/String;)Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Value;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->get(Ljava/lang/String;)Ljava/io/File;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-direct {p0}, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->getDiskCache()Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;->edit(Ljava/lang/String;)Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz p0, :cond_2

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->getFile(I)Ljava/io/File;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    invoke-interface {p2, p1}, Lcom/tantan/library/svga/data/cache/disk/DiskCache$Writer;->write(Ljava/io/File;)Z

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    if-eqz p2, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->commit()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catchall_0
    move-exception p1

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->abortUnlessCommitted()V

    .line 53
    .line 54
    .line 55
    return-object p1

    .line 56
    :goto_1
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->abortUnlessCommitted()V

    .line 57
    .line 58
    .line 59
    throw p1

    .line 60
    :cond_2
    const/4 p0, 0x0

    .line 61
    return-object p0
.end method

.method public size()Ljava/lang/Long;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->diskLruCache:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;->size()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method
