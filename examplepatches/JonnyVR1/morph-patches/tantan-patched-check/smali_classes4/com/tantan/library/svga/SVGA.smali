.class public final Lcom/tantan/library/svga/SVGA;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\n\u0010\u0003\u001a\u0004\u0018\u00010\u0004H\u0007J\u0018\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0007J\u0018\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0002J\u0018\u0010\u000c\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0002J\u0010\u0010\r\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\nH\u0002\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/tantan/library/svga/SVGA;",
        "",
        "()V",
        "getCache",
        "Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;",
        "init",
        "",
        "app",
        "Landroid/app/Application;",
        "config",
        "Lcom/tantan/library/svga/SVGAConfig;",
        "initCacheProvider",
        "initExecutor",
        "initGlobalMonitor",
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
.field public static final INSTANCE:Lcom/tantan/library/svga/SVGA;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/tantan/library/svga/SVGA;

    invoke-direct {v0}, Lcom/tantan/library/svga/SVGA;-><init>()V

    sput-object v0, Lcom/tantan/library/svga/SVGA;->INSTANCE:Lcom/tantan/library/svga/SVGA;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final getCache()Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/tantan/library/svga/data/cache/CacheProvider;->INSTANCE:Lcom/tantan/library/svga/data/cache/CacheProvider;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantan/library/svga/data/cache/CacheProvider;->getMemoryLruCache()Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static final init(Landroid/app/Application;Lcom/tantan/library/svga/SVGAConfig;)V
    .locals 2
    .param p0    # Landroid/app/Application;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Lcom/tantan/library/svga/SVGAConfig;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/tantan/library/svga/utils/Log;->INSTANCE:Lcom/tantan/library/svga/utils/Log;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAConfig;->getDebug()Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/utils/Log;->setDebug(Z)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/tantan/library/svga/SVGALoader;->INSTANCE:Lcom/tantan/library/svga/SVGALoader;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAConfig;->getInSampleSize()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader;->setInSampleSize(I)V

    .line 31
    .line 32
    .line 33
    sget-object v0, Lcom/tantan/library/svga/SVGA;->INSTANCE:Lcom/tantan/library/svga/SVGA;

    .line 34
    .line 35
    invoke-direct {v0, p0, p1}, Lcom/tantan/library/svga/SVGA;->initExecutor(Landroid/app/Application;Lcom/tantan/library/svga/SVGAConfig;)V

    .line 36
    .line 37
    .line 38
    invoke-direct {v0, p0, p1}, Lcom/tantan/library/svga/SVGA;->initCacheProvider(Landroid/app/Application;Lcom/tantan/library/svga/SVGAConfig;)V

    .line 39
    .line 40
    .line 41
    invoke-direct {v0, p1}, Lcom/tantan/library/svga/SVGA;->initGlobalMonitor(Lcom/tantan/library/svga/SVGAConfig;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private final initCacheProvider(Landroid/app/Application;Lcom/tantan/library/svga/SVGAConfig;)V
    .locals 4

    .line 1
    new-instance p0, Lcom/tantan/library/svga/SVGA$initCacheProvider$directoryGetter$1;

    .line 2
    .line 3
    invoke-direct {p0, p2, p1}, Lcom/tantan/library/svga/SVGA$initCacheProvider$directoryGetter$1;-><init>(Lcom/tantan/library/svga/SVGAConfig;Landroid/app/Application;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/tantan/library/svga/data/cache/CacheProvider;->INSTANCE:Lcom/tantan/library/svga/data/cache/CacheProvider;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/data/cache/CacheProvider;->setAssetsProvider(Landroid/content/res/AssetManager;)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory;

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/tantan/library/svga/SVGAConfig;->getDiskCacheSize()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    invoke-direct {v1, p0, v2, v3}, Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory;-><init>(Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory$CacheDirectoryGetter;J)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory;->build()Lcom/tantan/library/svga/data/cache/disk/DiskCache;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/data/cache/CacheProvider;->setDiskCache(Lcom/tantan/library/svga/data/cache/disk/DiskCache;)V

    .line 29
    .line 30
    .line 31
    new-instance p0, Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;

    .line 32
    .line 33
    invoke-virtual {p2}, Lcom/tantan/library/svga/SVGAConfig;->getMemoryCacheSize()J

    .line 34
    .line 35
    .line 36
    move-result-wide v1

    .line 37
    invoke-direct {p0, v1, v2}, Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;-><init>(J)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/data/cache/CacheProvider;->setMemoryLruCache(Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;)V

    .line 41
    .line 42
    .line 43
    sget-object p0, Lcom/tantan/library/svga/utils/SVGASoundManager;->INSTANCE:Lcom/tantan/library/svga/utils/SVGASoundManager;

    .line 44
    .line 45
    new-instance v0, Ljava/io/File;

    .line 46
    .line 47
    invoke-virtual {p2}, Lcom/tantan/library/svga/SVGAConfig;->getDiskCacheDir()Ljava/io/File;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    if-nez p2, :cond_0

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    :cond_0
    const-string p1, "audio"

    .line 58
    .line 59
    invoke-direct {v0, p2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/utils/SVGASoundManager;->init(Ljava/io/File;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method private final initExecutor(Landroid/app/Application;Lcom/tantan/library/svga/SVGAConfig;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/tantan/library/svga/utils/SVGAExecutors;->Companion:Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/tantan/library/svga/SVGAConfig;->getIoExecutor()Ljava/util/concurrent/ExecutorService;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    new-instance p1, Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;

    .line 10
    .line 11
    invoke-direct {p1}, Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;->calculateBestThreadCount$svga_lib_release()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;->setThreadCount(I)Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "svga-io"

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;->setName(Ljava/lang/String;)Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;->build()Lcom/tantan/library/svga/utils/SVGAExecutors;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    new-instance p1, Lcom/tantan/library/svga/utils/SVGAExecutors;

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/tantan/library/svga/SVGAConfig;->getIoExecutor()Ljava/util/concurrent/ExecutorService;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-direct {p1, v0}, Lcom/tantan/library/svga/utils/SVGAExecutors;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;->setIo$svga_lib_release(Lcom/tantan/library/svga/utils/SVGAExecutors;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/tantan/library/svga/SVGAConfig;->getFastIoExecutor()Ljava/util/concurrent/ExecutorService;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-nez p1, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;->getIo$svga_lib_release()Lcom/tantan/library/svga/utils/SVGAExecutors;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    new-instance p1, Lcom/tantan/library/svga/utils/SVGAExecutors;

    .line 57
    .line 58
    invoke-virtual {p2}, Lcom/tantan/library/svga/SVGAConfig;->getFastIoExecutor()Ljava/util/concurrent/ExecutorService;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-direct {p1, p2}, Lcom/tantan/library/svga/utils/SVGAExecutors;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 63
    .line 64
    .line 65
    :goto_1
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;->setFastIo$svga_lib_release(Lcom/tantan/library/svga/utils/SVGAExecutors;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private final initGlobalMonitor(Lcom/tantan/library/svga/SVGAConfig;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->Companion:Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAConfig;->getListener()Lcom/tantan/library/svga/LoadResourceListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/tantan/library/svga/SVGA$initGlobalMonitor$1;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/tantan/library/svga/SVGA$initGlobalMonitor$1;-><init>()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;->register(Lcom/tantan/library/svga/LoadResourceListener;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAConfig;->getTrackerListener()Lcom/tantan/library/svga/tracker/CacheTrackerListener;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAConfig;->getEnableCacheTrace()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    :goto_0
    if-eqz p0, :cond_2

    .line 32
    .line 33
    sget-object p1, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->INSTANCE:Lcom/tantan/library/svga/tracker/CacheTrackerManager;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->register(Lcom/tantan/library/svga/tracker/CacheTrackerListener;)V

    .line 36
    .line 37
    .line 38
    :cond_2
    return-void
.end method
