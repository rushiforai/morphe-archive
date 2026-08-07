.class public final Lcom/tantan/library/svga/SVGAConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/SVGAConfig$Builder;,
        Lcom/tantan/library/svga/SVGAConfig$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 *2\u00020\u0001:\u0002)*B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\n\n\u0002\u0010\t\u001a\u0004\u0008\u0007\u0010\u0008R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u000e\u001a\u00020\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011R\u0011\u0010\u0012\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014R\u0013\u0010\u0015\u001a\u0004\u0018\u00010\u0016\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0018R\u0011\u0010\u0019\u001a\u00020\u001a\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001b\u0010\u001cR\u0013\u0010\u001d\u001a\u0004\u0018\u00010\u0016\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001e\u0010\u0018R\u0013\u0010\u001f\u001a\u0004\u0018\u00010 \u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008!\u0010\"R\u0011\u0010#\u001a\u00020\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008$\u0010\u0011R\u0013\u0010%\u001a\u0004\u0018\u00010&\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\'\u0010(\u00a8\u0006+"
    }
    d2 = {
        "Lcom/tantan/library/svga/SVGAConfig;",
        "",
        "builder",
        "Lcom/tantan/library/svga/SVGAConfig$Builder;",
        "(Lcom/tantan/library/svga/SVGAConfig$Builder;)V",
        "debug",
        "",
        "getDebug",
        "()Ljava/lang/Boolean;",
        "Ljava/lang/Boolean;",
        "diskCacheDir",
        "Ljava/io/File;",
        "getDiskCacheDir",
        "()Ljava/io/File;",
        "diskCacheSize",
        "",
        "getDiskCacheSize",
        "()J",
        "enableCacheTrace",
        "getEnableCacheTrace",
        "()Z",
        "fastIoExecutor",
        "Ljava/util/concurrent/ExecutorService;",
        "getFastIoExecutor",
        "()Ljava/util/concurrent/ExecutorService;",
        "inSampleSize",
        "",
        "getInSampleSize",
        "()I",
        "ioExecutor",
        "getIoExecutor",
        "listener",
        "Lcom/tantan/library/svga/LoadResourceListener;",
        "getListener",
        "()Lcom/tantan/library/svga/LoadResourceListener;",
        "memoryCacheSize",
        "getMemoryCacheSize",
        "trackerListener",
        "Lcom/tantan/library/svga/tracker/CacheTrackerListener;",
        "getTrackerListener",
        "()Lcom/tantan/library/svga/tracker/CacheTrackerListener;",
        "Builder",
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


# static fields
.field public static final Companion:Lcom/tantan/library/svga/SVGAConfig$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final MB:J = 0x100000L


# instance fields
.field private final debug:Ljava/lang/Boolean;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final diskCacheDir:Ljava/io/File;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final diskCacheSize:J

.field private final enableCacheTrace:Z

.field private final fastIoExecutor:Ljava/util/concurrent/ExecutorService;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final inSampleSize:I

.field private final ioExecutor:Ljava/util/concurrent/ExecutorService;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final listener:Lcom/tantan/library/svga/LoadResourceListener;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final memoryCacheSize:J

.field private final trackerListener:Lcom/tantan/library/svga/tracker/CacheTrackerListener;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/tantan/library/svga/SVGAConfig$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/tantan/library/svga/SVGAConfig$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/tantan/library/svga/SVGAConfig;->Companion:Lcom/tantan/library/svga/SVGAConfig$Companion;

    return-void
.end method

.method private constructor <init>(Lcom/tantan/library/svga/SVGAConfig$Builder;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAConfig$Builder;->getEnableCacheTrace$svga_lib_release()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput-boolean v0, p0, Lcom/tantan/library/svga/SVGAConfig;->enableCacheTrace:Z

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAConfig$Builder;->getDiskCacheDir$svga_lib_release()Ljava/io/File;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/tantan/library/svga/SVGAConfig;->diskCacheDir:Ljava/io/File;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAConfig$Builder;->getDiskCacheSize$svga_lib_release()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    iput-wide v0, p0, Lcom/tantan/library/svga/SVGAConfig;->diskCacheSize:J

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAConfig$Builder;->getMemoryCacheSize$svga_lib_release()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    iput-wide v0, p0, Lcom/tantan/library/svga/SVGAConfig;->memoryCacheSize:J

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAConfig$Builder;->getListener$svga_lib_release()Lcom/tantan/library/svga/LoadResourceListener;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/tantan/library/svga/SVGAConfig;->listener:Lcom/tantan/library/svga/LoadResourceListener;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAConfig$Builder;->getTrackerListener$svga_lib_release()Lcom/tantan/library/svga/tracker/CacheTrackerListener;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/tantan/library/svga/SVGAConfig;->trackerListener:Lcom/tantan/library/svga/tracker/CacheTrackerListener;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAConfig$Builder;->getDebug$svga_lib_release()Ljava/lang/Boolean;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/tantan/library/svga/SVGAConfig;->debug:Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAConfig$Builder;->getIoExecutor$svga_lib_release()Ljava/util/concurrent/ExecutorService;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/tantan/library/svga/SVGAConfig;->ioExecutor:Ljava/util/concurrent/ExecutorService;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAConfig$Builder;->getFastIoExecutor$svga_lib_release()Ljava/util/concurrent/ExecutorService;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Lcom/tantan/library/svga/SVGAConfig;->fastIoExecutor:Ljava/util/concurrent/ExecutorService;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAConfig$Builder;->getInSampleSize$svga_lib_release()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    iput p1, p0, Lcom/tantan/library/svga/SVGAConfig;->inSampleSize:I

    .line 63
    .line 64
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tantan/library/svga/SVGAConfig$Builder;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 65
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/SVGAConfig;-><init>(Lcom/tantan/library/svga/SVGAConfig$Builder;)V

    return-void
.end method


# virtual methods
.method public final getDebug()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAConfig;->debug:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getDiskCacheDir()Ljava/io/File;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAConfig;->diskCacheDir:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getDiskCacheSize()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantan/library/svga/SVGAConfig;->diskCacheSize:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final getEnableCacheTrace()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantan/library/svga/SVGAConfig;->enableCacheTrace:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getFastIoExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAConfig;->fastIoExecutor:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getInSampleSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/SVGAConfig;->inSampleSize:I

    .line 2
    .line 3
    return p0
.end method

.method public final getIoExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAConfig;->ioExecutor:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getListener()Lcom/tantan/library/svga/LoadResourceListener;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAConfig;->listener:Lcom/tantan/library/svga/LoadResourceListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMemoryCacheSize()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantan/library/svga/SVGAConfig;->memoryCacheSize:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final getTrackerListener()Lcom/tantan/library/svga/tracker/CacheTrackerListener;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAConfig;->trackerListener:Lcom/tantan/library/svga/tracker/CacheTrackerListener;

    .line 2
    .line 3
    return-object p0
.end method
