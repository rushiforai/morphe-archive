.class public final Lcom/tantan/library/svga/SVGAConfig$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/SVGAConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\t\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\r\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0006\u00109\u001a\u00020:J\u000e\u0010\u0016\u001a\u00020\u00002\u0006\u0010;\u001a\u00020\u0004J\u000e\u0010<\u001a\u00020\u00002\u0006\u0010=\u001a\u00020\u0004J\u000e\u0010>\u001a\u00020\u00002\u0006\u0010?\u001a\u00020\u000bJ\u000e\u0010@\u001a\u00020\u00002\u0006\u0010\u0010\u001a\u00020\u0011J\u0010\u0010A\u001a\u00020\u00002\u0008\u0010\u001b\u001a\u0004\u0018\u00010\u001cJ\u000e\u0010B\u001a\u00020\u00002\u0006\u0010!\u001a\u00020\"J\u0010\u0010C\u001a\u00020\u00002\u0008\u0010\'\u001a\u0004\u0018\u00010\u001cJ\u0010\u0010D\u001a\u00020\u00002\u0008\u0010*\u001a\u0004\u0018\u00010+J\u000e\u0010E\u001a\u00020\u00002\u0006\u00100\u001a\u00020\u0011J\u0010\u0010F\u001a\u00020\u00002\u0008\u00103\u001a\u0004\u0018\u000104R\u001e\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0080\u000e\u00a2\u0006\u0010\n\u0002\u0010\t\u001a\u0004\u0008\u0005\u0010\u0006\"\u0004\u0008\u0007\u0010\u0008R\u001c\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000c\u0010\r\"\u0004\u0008\u000e\u0010\u000fR\u001a\u0010\u0010\u001a\u00020\u0011X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013\"\u0004\u0008\u0014\u0010\u0015R\u001a\u0010\u0016\u001a\u00020\u0004X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0017\u0010\u0018\"\u0004\u0008\u0019\u0010\u001aR\u001c\u0010\u001b\u001a\u0004\u0018\u00010\u001cX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001d\u0010\u001e\"\u0004\u0008\u001f\u0010 R\u001a\u0010!\u001a\u00020\"X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008#\u0010$\"\u0004\u0008%\u0010&R\u001c\u0010\'\u001a\u0004\u0018\u00010\u001cX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008(\u0010\u001e\"\u0004\u0008)\u0010 R\u001c\u0010*\u001a\u0004\u0018\u00010+X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008,\u0010-\"\u0004\u0008.\u0010/R\u001a\u00100\u001a\u00020\u0011X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00081\u0010\u0013\"\u0004\u00082\u0010\u0015R\u001c\u00103\u001a\u0004\u0018\u000104X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00085\u00106\"\u0004\u00087\u00108\u00a8\u0006G"
    }
    d2 = {
        "Lcom/tantan/library/svga/SVGAConfig$Builder;",
        "",
        "()V",
        "debug",
        "",
        "getDebug$svga_lib_release",
        "()Ljava/lang/Boolean;",
        "setDebug$svga_lib_release",
        "(Ljava/lang/Boolean;)V",
        "Ljava/lang/Boolean;",
        "diskCacheDir",
        "Ljava/io/File;",
        "getDiskCacheDir$svga_lib_release",
        "()Ljava/io/File;",
        "setDiskCacheDir$svga_lib_release",
        "(Ljava/io/File;)V",
        "diskCacheSize",
        "",
        "getDiskCacheSize$svga_lib_release",
        "()J",
        "setDiskCacheSize$svga_lib_release",
        "(J)V",
        "enableCacheTrace",
        "getEnableCacheTrace$svga_lib_release",
        "()Z",
        "setEnableCacheTrace$svga_lib_release",
        "(Z)V",
        "fastIoExecutor",
        "Ljava/util/concurrent/ExecutorService;",
        "getFastIoExecutor$svga_lib_release",
        "()Ljava/util/concurrent/ExecutorService;",
        "setFastIoExecutor$svga_lib_release",
        "(Ljava/util/concurrent/ExecutorService;)V",
        "inSampleSize",
        "",
        "getInSampleSize$svga_lib_release",
        "()I",
        "setInSampleSize$svga_lib_release",
        "(I)V",
        "ioExecutor",
        "getIoExecutor$svga_lib_release",
        "setIoExecutor$svga_lib_release",
        "listener",
        "Lcom/tantan/library/svga/LoadResourceListener;",
        "getListener$svga_lib_release",
        "()Lcom/tantan/library/svga/LoadResourceListener;",
        "setListener$svga_lib_release",
        "(Lcom/tantan/library/svga/LoadResourceListener;)V",
        "memoryCacheSize",
        "getMemoryCacheSize$svga_lib_release",
        "setMemoryCacheSize$svga_lib_release",
        "trackerListener",
        "Lcom/tantan/library/svga/tracker/CacheTrackerListener;",
        "getTrackerListener$svga_lib_release",
        "()Lcom/tantan/library/svga/tracker/CacheTrackerListener;",
        "setTrackerListener$svga_lib_release",
        "(Lcom/tantan/library/svga/tracker/CacheTrackerListener;)V",
        "build",
        "Lcom/tantan/library/svga/SVGAConfig;",
        "enable",
        "setDebug",
        "boolean",
        "setDiskCacheDir",
        "dir",
        "setDiskCacheSize",
        "setFastIoExecutor",
        "setInSampleSize",
        "setIoExecutor",
        "setLoadResourceListener",
        "setMemoryCacheSize",
        "setTrackerListener",
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


# instance fields
.field private debug:Ljava/lang/Boolean;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private diskCacheDir:Ljava/io/File;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private diskCacheSize:J

.field private enableCacheTrace:Z

.field private fastIoExecutor:Ljava/util/concurrent/ExecutorService;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private inSampleSize:I

.field private ioExecutor:Ljava/util/concurrent/ExecutorService;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private listener:Lcom/tantan/library/svga/LoadResourceListener;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private memoryCacheSize:J

.field private trackerListener:Lcom/tantan/library/svga/tracker/CacheTrackerListener;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/32 v0, 0x3200000

    .line 5
    .line 6
    .line 7
    iput-wide v0, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->diskCacheSize:J

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->memoryCacheSize:J

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput v0, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->inSampleSize:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final build()Lcom/tantan/library/svga/SVGAConfig;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/tantan/library/svga/SVGAConfig;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/tantan/library/svga/SVGAConfig;-><init>(Lcom/tantan/library/svga/SVGAConfig$Builder;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public final enableCacheTrace(Z)Lcom/tantan/library/svga/SVGAConfig$Builder;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->enableCacheTrace:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public final getDebug$svga_lib_release()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->debug:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getDiskCacheDir$svga_lib_release()Ljava/io/File;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->diskCacheDir:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getDiskCacheSize$svga_lib_release()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->diskCacheSize:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final getEnableCacheTrace$svga_lib_release()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->enableCacheTrace:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getFastIoExecutor$svga_lib_release()Ljava/util/concurrent/ExecutorService;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->fastIoExecutor:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getInSampleSize$svga_lib_release()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->inSampleSize:I

    .line 2
    .line 3
    return p0
.end method

.method public final getIoExecutor$svga_lib_release()Ljava/util/concurrent/ExecutorService;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->ioExecutor:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getListener$svga_lib_release()Lcom/tantan/library/svga/LoadResourceListener;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->listener:Lcom/tantan/library/svga/LoadResourceListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMemoryCacheSize$svga_lib_release()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->memoryCacheSize:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final getTrackerListener$svga_lib_release()Lcom/tantan/library/svga/tracker/CacheTrackerListener;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->trackerListener:Lcom/tantan/library/svga/tracker/CacheTrackerListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setDebug(Z)Lcom/tantan/library/svga/SVGAConfig$Builder;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->debug:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public final setDebug$svga_lib_release(Ljava/lang/Boolean;)V
    .locals 0
    .param p1    # Ljava/lang/Boolean;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->debug:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-void
.end method

.method public final setDiskCacheDir(Ljava/io/File;)Lcom/tantan/library/svga/SVGAConfig$Builder;
    .locals 1
    .param p1    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->diskCacheDir:Ljava/io/File;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const-string p0, "cache file must be a directory"

    .line 14
    .line 15
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public final setDiskCacheDir$svga_lib_release(Ljava/io/File;)V
    .locals 0
    .param p1    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->diskCacheDir:Ljava/io/File;

    .line 2
    .line 3
    return-void
.end method

.method public final setDiskCacheSize(J)Lcom/tantan/library/svga/SVGAConfig$Builder;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-wide/32 v0, 0x100000

    .line 2
    .line 3
    .line 4
    cmp-long v0, p1, v0

    .line 5
    .line 6
    if-ltz v0, :cond_0

    .line 7
    .line 8
    iput-wide p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->diskCacheSize:J

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const-string p0, "cache size must be > 1MB"

    .line 12
    .line 13
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public final setDiskCacheSize$svga_lib_release(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->diskCacheSize:J

    .line 2
    .line 3
    return-void
.end method

.method public final setEnableCacheTrace$svga_lib_release(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->enableCacheTrace:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setFastIoExecutor(Ljava/util/concurrent/ExecutorService;)Lcom/tantan/library/svga/SVGAConfig$Builder;
    .locals 0
    .param p1    # Ljava/util/concurrent/ExecutorService;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->fastIoExecutor:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setFastIoExecutor$svga_lib_release(Ljava/util/concurrent/ExecutorService;)V
    .locals 0
    .param p1    # Ljava/util/concurrent/ExecutorService;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->fastIoExecutor:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    return-void
.end method

.method public final setInSampleSize(I)Lcom/tantan/library/svga/SVGAConfig$Builder;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->inSampleSize:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final setInSampleSize$svga_lib_release(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->inSampleSize:I

    .line 2
    .line 3
    return-void
.end method

.method public final setIoExecutor(Ljava/util/concurrent/ExecutorService;)Lcom/tantan/library/svga/SVGAConfig$Builder;
    .locals 0
    .param p1    # Ljava/util/concurrent/ExecutorService;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->ioExecutor:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setIoExecutor$svga_lib_release(Ljava/util/concurrent/ExecutorService;)V
    .locals 0
    .param p1    # Ljava/util/concurrent/ExecutorService;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->ioExecutor:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    return-void
.end method

.method public final setListener$svga_lib_release(Lcom/tantan/library/svga/LoadResourceListener;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/LoadResourceListener;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->listener:Lcom/tantan/library/svga/LoadResourceListener;

    .line 2
    .line 3
    return-void
.end method

.method public final setLoadResourceListener(Lcom/tantan/library/svga/LoadResourceListener;)Lcom/tantan/library/svga/SVGAConfig$Builder;
    .locals 0
    .param p1    # Lcom/tantan/library/svga/LoadResourceListener;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->listener:Lcom/tantan/library/svga/LoadResourceListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setMemoryCacheSize(J)Lcom/tantan/library/svga/SVGAConfig$Builder;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-wide/32 v0, 0x100000

    .line 2
    .line 3
    .line 4
    cmp-long v0, p1, v0

    .line 5
    .line 6
    if-ltz v0, :cond_0

    .line 7
    .line 8
    iput-wide p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->memoryCacheSize:J

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const-string p0, "cache size must be > 1MB"

    .line 12
    .line 13
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public final setMemoryCacheSize$svga_lib_release(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->memoryCacheSize:J

    .line 2
    .line 3
    return-void
.end method

.method public final setTrackerListener(Lcom/tantan/library/svga/tracker/CacheTrackerListener;)Lcom/tantan/library/svga/SVGAConfig$Builder;
    .locals 0
    .param p1    # Lcom/tantan/library/svga/tracker/CacheTrackerListener;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->trackerListener:Lcom/tantan/library/svga/tracker/CacheTrackerListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setTrackerListener$svga_lib_release(Lcom/tantan/library/svga/tracker/CacheTrackerListener;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/tracker/CacheTrackerListener;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAConfig$Builder;->trackerListener:Lcom/tantan/library/svga/tracker/CacheTrackerListener;

    .line 2
    .line 3
    return-void
.end method
