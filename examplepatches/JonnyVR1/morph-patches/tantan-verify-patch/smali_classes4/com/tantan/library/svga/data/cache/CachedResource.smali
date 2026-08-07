.class public final Lcom/tantan/library/svga/data/cache/CachedResource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/cache/Resource;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/tantan/library/svga/data/cache/Resource<",
        "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0004\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\r\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0002\u0010\u0004J\u0008\u0010\u0013\u001a\u00020\u0014H\u0016J\u0008\u0010\u0015\u001a\u00020\u0016H\u0016J\u0008\u0010\u0017\u001a\u00020\u0002H\u0016J\n\u0010\u0018\u001a\u0004\u0018\u00010\u0019H\u0016J\u0006\u0010\u001a\u001a\u00020\u0014J\u0008\u0010\u001b\u001a\u00020\u0014H\u0016J\u0008\u0010\u001c\u001a\u00020\u0014H\u0016R\u001a\u0010\u0005\u001a\u00020\u0006X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\"\u0004\u0008\t\u0010\nR\u000e\u0010\u0003\u001a\u00020\u0002X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u000c8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u00108VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0011\u0010\u0012\u00a8\u0006\u001d"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/cache/CachedResource;",
        "Lcom/tantan/library/svga/data/cache/Resource;",
        "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
        "entity",
        "(Lcom/tantan/library/svga/compose/SVGAVideoEntity;)V",
        "acquired",
        "",
        "getAcquired$svga_lib_release",
        "()I",
        "setAcquired$svga_lib_release",
        "(I)V",
        "resourceClass",
        "Ljava/lang/Class;",
        "getResourceClass",
        "()Ljava/lang/Class;",
        "size",
        "",
        "getSize",
        "()J",
        "acquire",
        "",
        "cacheable",
        "",
        "get",
        "getAbsolutePath",
        "",
        "loadData",
        "release",
        "tryRecycle",
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


# instance fields
.field private volatile acquired:I

.field private final entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/compose/SVGAVideoEntity;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/compose/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public declared-synchronized acquire()V
    .locals 3

    .line 1
    const-string v0, "after acquire:"

    .line 2
    .line 3
    const-string v1, "before acquire:"

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->acquired:I

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ",key:"

    .line 17
    .line 18
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getKey()Lcom/tantan/library/svga/ResourceKey;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Lcom/tantan/library/svga/utils/Log;->e(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget v1, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->acquired:I

    .line 42
    .line 43
    const/4 v2, 0x1

    .line 44
    add-int/2addr v1, v2

    .line 45
    iput v1, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->acquired:I

    .line 46
    .line 47
    iget v1, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->acquired:I

    .line 48
    .line 49
    if-ne v1, v2, :cond_0

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/cache/CachedResource;->loadData()V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catchall_0
    move-exception v0

    .line 56
    goto :goto_1

    .line 57
    :cond_0
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget v0, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->acquired:I

    .line 63
    .line 64
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const/16 v0, 0x20

    .line 68
    .line 69
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Lcom/tantan/library/svga/utils/Log;->e(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    .line 78
    .line 79
    monitor-exit p0

    .line 80
    return-void

    .line 81
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    throw v0
.end method

.method public cacheable()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getKey()Lcom/tantan/library/svga/ResourceKey;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/tantan/library/svga/ResourceKey;->isCacheable$svga_lib_release()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public get()Lcom/tantan/library/svga/compose/SVGAVideoEntity;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 6
    iget-object p0, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/cache/CachedResource;->get()Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getAbsolutePath()Ljava/lang/String;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/tantan/library/svga/data/cache/CacheProvider;->INSTANCE:Lcom/tantan/library/svga/data/cache/CacheProvider;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantan/library/svga/data/cache/CacheProvider;->getDiskCache()Lcom/tantan/library/svga/data/cache/disk/DiskCache;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getKey()Lcom/tantan/library/svga/ResourceKey;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/tantan/library/svga/ResourceKey;->cacheKey()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {v0, p0}, Lcom/tantan/library/svga/data/cache/disk/DiskCache;->get(Ljava/lang/String;)Ljava/io/File;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public final getAcquired$svga_lib_release()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->acquired:I

    .line 2
    .line 3
    return p0
.end method

.method public getResourceClass()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-class p0, Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    return-object p0
.end method

.method public getSize()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->memorySize()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final declared-synchronized loadData()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-object v0, Lcom/tantan/library/svga/data/cache/CacheProvider;->INSTANCE:Lcom/tantan/library/svga/data/cache/CacheProvider;

    .line 3
    .line 4
    invoke-virtual {v0}, Lcom/tantan/library/svga/data/cache/CacheProvider;->getActiveResource()Lcom/tantan/library/svga/data/cache/active/ActiveResource;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iget-object v2, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 9
    .line 10
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getKey()Lcom/tantan/library/svga/ResourceKey;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Lcom/tantan/library/svga/ResourceKey;->cacheKey()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/data/cache/active/ActiveResource;->get(Ljava/lang/String;)Lcom/tantan/library/svga/data/cache/Resource;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->load()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/tantan/library/svga/data/cache/CacheProvider;->getActiveResource()Lcom/tantan/library/svga/data/cache/active/ActiveResource;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getKey()Lcom/tantan/library/svga/ResourceKey;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lcom/tantan/library/svga/ResourceKey;->cacheKey()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1, p0}, Lcom/tantan/library/svga/data/cache/active/ActiveResource;->activate(Ljava/lang/String;Lcom/tantan/library/svga/data/cache/Resource;)V

    .line 44
    .line 45
    .line 46
    sget-object v0, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->INSTANCE:Lcom/tantan/library/svga/tracker/CacheTrackerManager;

    .line 47
    .line 48
    sget-object v1, Lcom/tantan/library/svga/tracker/CacheType;->ACTIVE:Lcom/tantan/library/svga/tracker/CacheType;

    .line 49
    .line 50
    iget-object v2, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 51
    .line 52
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getKey()Lcom/tantan/library/svga/ResourceKey;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    new-instance v3, Lcom/tantan/library/svga/data/cache/CachedResource$loadData$1;

    .line 57
    .line 58
    invoke-direct {v3, p0}, Lcom/tantan/library/svga/data/cache/CachedResource$loadData$1;-><init>(Lcom/tantan/library/svga/data/cache/CachedResource;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1, v2, v3}, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->onCachePut(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;Lkotlin/jvm/functions/Function0;)V

    .line 62
    .line 63
    .line 64
    const-string v0, "loadAndCache"

    .line 65
    .line 66
    invoke-static {v0}, Lcom/tantan/library/svga/utils/Log;->e(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :catchall_0
    move-exception v0

    .line 71
    goto :goto_1

    .line 72
    :cond_0
    const-string v0, "hit active cache "

    .line 73
    .line 74
    invoke-static {v0}, Lcom/tantan/library/svga/utils/Log;->e(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    .line 76
    .line 77
    :goto_0
    monitor-exit p0

    .line 78
    return-void

    .line 79
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    throw v0
.end method

.method public declared-synchronized release()V
    .locals 3

    .line 1
    const-string v0, "after release:"

    .line 2
    .line 3
    const-string v1, "before release:"

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->acquired:I

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const/16 v1, 0x20

    .line 17
    .line 18
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v2}, Lcom/tantan/library/svga/utils/Log;->e(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget v2, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->acquired:I

    .line 29
    .line 30
    add-int/lit8 v2, v2, -0x1

    .line 31
    .line 32
    iput v2, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->acquired:I

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/cache/CachedResource;->tryRecycle()V

    .line 35
    .line 36
    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget v0, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->acquired:I

    .line 43
    .line 44
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v0}, Lcom/tantan/library/svga/utils/Log;->e(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .line 56
    .line 57
    monitor-exit p0

    .line 58
    return-void

    .line 59
    :catchall_0
    move-exception v0

    .line 60
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    throw v0
.end method

.method public final setAcquired$svga_lib_release(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->acquired:I

    .line 2
    .line 3
    return-void
.end method

.method public declared-synchronized tryRecycle()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->acquired:I

    .line 3
    .line 4
    if-gtz v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->acquired:I

    .line 8
    .line 9
    sget-object v0, Lcom/tantan/library/svga/data/cache/CacheProvider;->INSTANCE:Lcom/tantan/library/svga/data/cache/CacheProvider;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantan/library/svga/data/cache/CacheProvider;->getActiveResource()Lcom/tantan/library/svga/data/cache/active/ActiveResource;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getKey()Lcom/tantan/library/svga/ResourceKey;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Lcom/tantan/library/svga/ResourceKey;->cacheKey()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/data/cache/active/ActiveResource;->deactivate(Ljava/lang/String;)Lcom/tantan/library/svga/data/cache/Resource;

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->clear()V

    .line 31
    .line 32
    .line 33
    sget-object v0, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->INSTANCE:Lcom/tantan/library/svga/tracker/CacheTrackerManager;

    .line 34
    .line 35
    sget-object v1, Lcom/tantan/library/svga/tracker/CacheType;->ACTIVE:Lcom/tantan/library/svga/tracker/CacheType;

    .line 36
    .line 37
    iget-object v2, p0, Lcom/tantan/library/svga/data/cache/CachedResource;->entity:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getKey()Lcom/tantan/library/svga/ResourceKey;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v0, v1, v2}, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->onCacheRemoved(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    :goto_0
    monitor-exit p0

    .line 50
    return-void

    .line 51
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    throw v0
.end method
