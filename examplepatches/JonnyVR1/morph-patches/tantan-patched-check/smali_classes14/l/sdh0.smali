.class public Ll/sdh0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()V
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SvgaInit:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 8
    .line 9
    .line 10
    :try_start_0
    new-instance v0, Lcom/tantan/library/svga/SVGAConfig$Builder;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/tantan/library/svga/SVGAConfig$Builder;-><init>()V

    .line 13
    .line 14
    .line 15
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 16
    .line 17
    const-wide/32 v2, 0x3200000

    .line 18
    .line 19
    .line 20
    const/16 v4, 0x1a

    .line 21
    .line 22
    if-lt v1, v4, :cond_0

    .line 23
    .line 24
    move-wide v5, v2

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-wide/32 v5, 0x1900000

    .line 27
    .line 28
    .line 29
    :goto_0
    invoke-virtual {v0, v5, v6}, Lcom/tantan/library/svga/SVGAConfig$Builder;->setMemoryCacheSize(J)Lcom/tantan/library/svga/SVGAConfig$Builder;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    invoke-virtual {v5, v2, v3}, Lcom/tantan/library/svga/SVGAConfig$Builder;->setDiskCacheSize(J)Lcom/tantan/library/svga/SVGAConfig$Builder;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    if-lt v1, v4, :cond_1

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    const/4 v1, 0x2

    .line 42
    :goto_1
    invoke-virtual {v2, v1}, Lcom/tantan/library/svga/SVGAConfig$Builder;->setInSampleSize(I)Lcom/tantan/library/svga/SVGAConfig$Builder;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    sget-object v2, Lcom/p1/mobile/android/rx/rxthread/FastIoScheduler;->a:Ljava/util/concurrent/ExecutorService;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGAConfig$Builder;->setFastIoExecutor(Ljava/util/concurrent/ExecutorService;)Lcom/tantan/library/svga/SVGAConfig$Builder;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-static {}, Ll/whi0;->i()Ll/whi0;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2}, Ll/whi0;->a()Ljava/util/concurrent/ThreadPoolExecutor;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGAConfig$Builder;->setIoExecutor(Ljava/util/concurrent/ExecutorService;)Lcom/tantan/library/svga/SVGAConfig$Builder;

    .line 61
    .line 62
    .line 63
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 64
    .line 65
    new-instance v2, Ll/sdh0$b;

    .line 66
    .line 67
    invoke-direct {v2}, Ll/sdh0$b;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGAConfig$Builder;->setLoadResourceListener(Lcom/tantan/library/svga/LoadResourceListener;)Lcom/tantan/library/svga/SVGAConfig$Builder;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v2, Ll/sdh0$a;

    .line 75
    .line 76
    invoke-direct {v2}, Ll/sdh0$a;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGAConfig$Builder;->setTrackerListener(Lcom/tantan/library/svga/tracker/CacheTrackerListener;)Lcom/tantan/library/svga/SVGAConfig$Builder;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 84
    .line 85
    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGAConfig$Builder;->setDiskCacheDir(Ljava/io/File;)Lcom/tantan/library/svga/SVGAConfig$Builder;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const/4 v2, 0x0

    .line 94
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGAConfig$Builder;->enableCacheTrace(Z)Lcom/tantan/library/svga/SVGAConfig$Builder;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGAConfig$Builder;->setDebug(Z)Lcom/tantan/library/svga/SVGAConfig$Builder;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAConfig$Builder;->build()Lcom/tantan/library/svga/SVGAConfig;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v1, v0}, Lcom/tantan/library/svga/SVGA;->init(Landroid/app/Application;Lcom/tantan/library/svga/SVGAConfig;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    .line 108
    .line 109
    goto :goto_2

    .line 110
    :catch_0
    move-exception v0

    .line 111
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 112
    .line 113
    .line 114
    :goto_2
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SvgaInit:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 115
    .line 116
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method
