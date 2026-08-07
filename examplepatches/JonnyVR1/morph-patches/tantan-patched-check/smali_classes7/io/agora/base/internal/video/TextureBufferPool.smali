.class public Lio/agora/base/internal/video/TextureBufferPool;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;
    }
.end annotation


# static fields
.field private static MAX_SYNC_OUT_TIME:I = 0x0

.field private static final TAG:Ljava/lang/String; = "TextureBufferPool"

.field private static final VERBOSE:Z

.field public static fenceCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static forceGlFinish:Z

.field private static glFlushBuggyDevices:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final nextSeq:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static useGlFence:Z


# instance fields
.field private final drawer:Lio/agora/base/internal/video/GlRectDrawer;

.field private dropCount:I

.field private final eglBase:Lio/agora/base/internal/video/EglBase;

.field private final eglContext:Lio/agora/base/internal/video/EglBase$Context;

.field private final glPixelFormat:I

.field private final handler:Landroid/os/Handler;

.field private isQuitting:Z

.field private final keepBufferCnt:I

.field private final maxBufferCnt:I

.field private final name:Ljava/lang/String;

.field private final ownGlThread:Z

.field private poolBufferReleaseCallback:Ljava/lang/Runnable;

.field private shrinkPool:Z

.field private final textureInfoList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final yuvConverter:Lio/agora/base/internal/video/YuvConverter;

.field private final yuvConverterInternal:Lio/agora/base/internal/video/YuvConverter;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lio/agora/base/internal/video/TextureBufferPool;->nextSeq:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 8
    .line 9
    const v0, 0x989680

    .line 10
    .line 11
    .line 12
    sput v0, Lio/agora/base/internal/video/TextureBufferPool;->MAX_SYNC_OUT_TIME:I

    .line 13
    .line 14
    const-string v0, "Redmi 5A"

    .line 15
    .line 16
    const-string v2, "V2231A"

    .line 17
    .line 18
    const-string v3, "Pixel 7"

    .line 19
    .line 20
    const-string v4, "Redmi 4A"

    .line 21
    .line 22
    filled-new-array {v3, v4, v0, v2}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lio/agora/base/internal/video/TextureBufferPool;->glFlushBuggyDevices:Ljava/util/List;

    .line 31
    .line 32
    sput-boolean v1, Lio/agora/base/internal/video/TextureBufferPool;->forceGlFinish:Z

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    sput-boolean v0, Lio/agora/base/internal/video/TextureBufferPool;->useGlFence:Z

    .line 36
    .line 37
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 38
    .line 39
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 40
    .line 41
    .line 42
    sput-object v0, Lio/agora/base/internal/video/TextureBufferPool;->fenceCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 43
    .line 44
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILandroid/os/Handler;ZLio/agora/base/internal/video/EglBase;Lio/agora/base/internal/video/EglBase$Context;Lio/agora/base/internal/video/YuvConverter;)V
    .locals 10

    const/4 v9, 0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    .line 129
    invoke-direct/range {v0 .. v9}, Lio/agora/base/internal/video/TextureBufferPool;-><init>(Ljava/lang/String;IILandroid/os/Handler;ZLio/agora/base/internal/video/EglBase;Lio/agora/base/internal/video/EglBase$Context;Lio/agora/base/internal/video/YuvConverter;Z)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;IILandroid/os/Handler;ZLio/agora/base/internal/video/EglBase;Lio/agora/base/internal/video/EglBase$Context;Lio/agora/base/internal/video/YuvConverter;Lio/agora/base/internal/video/TextureBufferPool$1;)V
    .locals 0

    .line 128
    invoke-direct/range {p0 .. p8}, Lio/agora/base/internal/video/TextureBufferPool;-><init>(Ljava/lang/String;IILandroid/os/Handler;ZLio/agora/base/internal/video/EglBase;Lio/agora/base/internal/video/EglBase$Context;Lio/agora/base/internal/video/YuvConverter;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILandroid/os/Handler;ZLio/agora/base/internal/video/EglBase;Lio/agora/base/internal/video/EglBase$Context;Lio/agora/base/internal/video/YuvConverter;Z)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lio/agora/base/internal/video/YuvConverter;

    .line 5
    .line 6
    invoke-direct {v0}, Lio/agora/base/internal/video/YuvConverter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool;->yuvConverterInternal:Lio/agora/base/internal/video/YuvConverter;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, p0, Lio/agora/base/internal/video/TextureBufferPool;->shrinkPool:Z

    .line 13
    .line 14
    new-instance v2, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v2, p0, Lio/agora/base/internal/video/TextureBufferPool;->textureInfoList:Ljava/util/ArrayList;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    iput-object v2, p0, Lio/agora/base/internal/video/TextureBufferPool;->poolBufferReleaseCallback:Ljava/lang/Runnable;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    iput-boolean v2, p0, Lio/agora/base/internal/video/TextureBufferPool;->isQuitting:Z

    .line 26
    .line 27
    iput v2, p0, Lio/agora/base/internal/video/TextureBufferPool;->dropCount:I

    .line 28
    .line 29
    iput-object p1, p0, Lio/agora/base/internal/video/TextureBufferPool;->name:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iput v1, p0, Lio/agora/base/internal/video/TextureBufferPool;->maxBufferCnt:I

    .line 36
    .line 37
    iput-boolean p9, p0, Lio/agora/base/internal/video/TextureBufferPool;->shrinkPool:Z

    .line 38
    .line 39
    if-eqz p9, :cond_0

    .line 40
    .line 41
    const/4 p9, 0x3

    .line 42
    invoke-static {v1, p9}, Ljava/lang/Math;->min(II)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    :cond_0
    iput v1, p0, Lio/agora/base/internal/video/TextureBufferPool;->keepBufferCnt:I

    .line 47
    .line 48
    iput p3, p0, Lio/agora/base/internal/video/TextureBufferPool;->glPixelFormat:I

    .line 49
    .line 50
    iput-object p4, p0, Lio/agora/base/internal/video/TextureBufferPool;->handler:Landroid/os/Handler;

    .line 51
    .line 52
    iput-boolean p5, p0, Lio/agora/base/internal/video/TextureBufferPool;->ownGlThread:Z

    .line 53
    .line 54
    iput-object p6, p0, Lio/agora/base/internal/video/TextureBufferPool;->eglBase:Lio/agora/base/internal/video/EglBase;

    .line 55
    .line 56
    if-eqz p8, :cond_1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    move-object p8, v0

    .line 60
    :goto_0
    iput-object p8, p0, Lio/agora/base/internal/video/TextureBufferPool;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 61
    .line 62
    if-eqz p7, :cond_2

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    invoke-interface {p6}, Lio/agora/base/internal/video/EglBase;->getEglBaseContext()Lio/agora/base/internal/video/EglBase$Context;

    .line 66
    .line 67
    .line 68
    move-result-object p7

    .line 69
    :goto_1
    iput-object p7, p0, Lio/agora/base/internal/video/TextureBufferPool;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 70
    .line 71
    new-instance p3, Lio/agora/base/internal/video/GlRectDrawer;

    .line 72
    .line 73
    invoke-direct {p3}, Lio/agora/base/internal/video/GlRectDrawer;-><init>()V

    .line 74
    .line 75
    .line 76
    iput-object p3, p0, Lio/agora/base/internal/video/TextureBufferPool;->drawer:Lio/agora/base/internal/video/GlRectDrawer;

    .line 77
    .line 78
    sget-object p3, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 79
    .line 80
    new-instance p4, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string p1, " init buffer pool, ownGlThread: "

    .line 89
    .line 90
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string p1, " cnt: "

    .line 97
    .line 98
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string p1, " sharedContext: "

    .line 105
    .line 106
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p4, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string p1, " "

    .line 113
    .line 114
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {p3, p0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public static synthetic access$000(Lio/agora/base/internal/video/EglBase$Context;)Lio/agora/base/internal/video/EglBase;
    .locals 0

    .line 1
    invoke-static {p0}, Lio/agora/base/internal/video/TextureBufferPool;->createEglAndMakeCurrent(Lio/agora/base/internal/video/EglBase$Context;)Lio/agora/base/internal/video/EglBase;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$200()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$300(Lio/agora/base/internal/video/TextureBufferPool;ILio/agora/base/VideoFrame$TextureBuffer$Type;IIILandroid/graphics/Matrix;JLjava/lang/Runnable;)Lio/agora/base/VideoFrame$TextureBuffer;
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p9}, Lio/agora/base/internal/video/TextureBufferPool;->doTextureCopy(ILio/agora/base/VideoFrame$TextureBuffer$Type;IIILandroid/graphics/Matrix;JLjava/lang/Runnable;)Lio/agora/base/VideoFrame$TextureBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$400(Lio/agora/base/internal/video/TextureBufferPool;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lio/agora/base/internal/video/TextureBufferPool;->isQuitting:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$402(Lio/agora/base/internal/video/TextureBufferPool;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lio/agora/base/internal/video/TextureBufferPool;->isQuitting:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$500(Lio/agora/base/internal/video/TextureBufferPool;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/TextureBufferPool;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lio/agora/base/internal/video/TextureBufferPool;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/video/TextureBufferPool;->release()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$700(Lio/agora/base/internal/video/TextureBufferPool;Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lio/agora/base/internal/video/TextureBufferPool;->releaseTextureFramebuffer(Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$800(Lio/agora/base/internal/video/TextureBufferPool;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/TextureBufferPool;->poolBufferReleaseCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$900(Lio/agora/base/internal/video/TextureBufferPool;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/TextureBufferPool;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method private acquireTextureFramebuffer()Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;
    .locals 5

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool;->textureInfoList:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;

    .line 19
    .line 20
    iget-boolean v3, v1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->inUse:Z

    .line 21
    .line 22
    if-nez v3, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    move-object v1, v2

    .line 26
    :goto_0
    const/4 v0, 0x1

    .line 27
    if-nez v1, :cond_3

    .line 28
    .line 29
    iget-object v1, p0, Lio/agora/base/internal/video/TextureBufferPool;->textureInfoList:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iget v3, p0, Lio/agora/base/internal/video/TextureBufferPool;->maxBufferCnt:I

    .line 36
    .line 37
    if-lt v1, v3, :cond_2

    .line 38
    .line 39
    iget v1, p0, Lio/agora/base/internal/video/TextureBufferPool;->dropCount:I

    .line 40
    .line 41
    add-int/2addr v1, v0

    .line 42
    iput v1, p0, Lio/agora/base/internal/video/TextureBufferPool;->dropCount:I

    .line 43
    .line 44
    const-string p0, "Drop@TexPool"

    .line 45
    .line 46
    invoke-static {p0, v1}, Lio/agora/base/internal/ATrace;->traceCounter(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    return-object v2

    .line 50
    :cond_2
    const/16 v1, 0xde1

    .line 51
    .line 52
    invoke-static {v1}, Lio/agora/base/internal/video/GlUtil;->generateTexture(I)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    new-array v2, v0, [I

    .line 57
    .line 58
    const/4 v3, 0x0

    .line 59
    invoke-static {v0, v2, v3}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 60
    .line 61
    .line 62
    new-instance v4, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;

    .line 63
    .line 64
    aget v2, v2, v3

    .line 65
    .line 66
    invoke-direct {v4, v1, v2}, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;-><init>(II)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lio/agora/base/internal/video/TextureBufferPool;->textureInfoList:Ljava/util/ArrayList;

    .line 70
    .line 71
    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-object v1, v4

    .line 75
    :cond_3
    iput-boolean v0, v1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->inUse:Z

    .line 76
    .line 77
    return-object v1
.end method

.method public static create(Ljava/lang/String;Lio/agora/base/internal/video/EglBase$Context;I)Lio/agora/base/internal/video/TextureBufferPool;
    .locals 7
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Landroid/os/HandlerThread;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 7
    .line 8
    .line 9
    new-instance v6, Landroid/os/Handler;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {v6, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    filled-new-array {v0}, [Lio/agora/base/internal/video/TextureBufferPool;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    :try_start_0
    new-instance v1, Lio/agora/base/internal/video/TextureBufferPool$1;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 24
    .line 25
    move-object v4, p0

    .line 26
    move-object v2, p1

    .line 27
    move v5, p2

    .line 28
    :try_start_1
    invoke-direct/range {v1 .. v6}, Lio/agora/base/internal/video/TextureBufferPool$1;-><init>(Lio/agora/base/internal/video/EglBase$Context;[Lio/agora/base/internal/video/TextureBufferPool;Ljava/lang/String;ILandroid/os/Handler;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v6, v1}, Lio/agora/base/internal/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 32
    .line 33
    .line 34
    goto :goto_2

    .line 35
    :catch_0
    move-exception v0

    .line 36
    :goto_0
    move-object p0, v0

    .line 37
    goto :goto_1

    .line 38
    :catch_1
    move-exception v0

    .line 39
    move-object v4, p0

    .line 40
    goto :goto_0

    .line 41
    :goto_1
    sget-object p1, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 42
    .line 43
    new-instance p2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v0, " failed to initialize egl"

    .line 52
    .line 53
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-static {p1, p2, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    :goto_2
    const/4 p0, 0x0

    .line 64
    aget-object p0, v3, p0

    .line 65
    .line 66
    return-object p0
.end method

.method private static createEglAndMakeCurrent(Lio/agora/base/internal/video/EglBase$Context;)Lio/agora/base/internal/video/EglBase;
    .locals 1

    .line 1
    sget-object v0, Lio/agora/base/internal/video/EglBase;->CONFIG_PIXEL_BUFFER:[I

    .line 2
    .line 3
    invoke-static {p0, v0}, Lio/agora/base/internal/video/EglBaseFactory;->create(Lio/agora/base/internal/video/EglBase$Context;[I)Lio/agora/base/internal/video/EglBase;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :try_start_0
    invoke-interface {p0}, Lio/agora/base/internal/video/EglBase;->createDummyPbufferSurface()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Lio/agora/base/internal/video/EglBase;->makeCurrent()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-object p0

    .line 14
    :catch_0
    move-exception v0

    .line 15
    invoke-interface {p0}, Lio/agora/base/internal/video/EglBase;->release()V

    .line 16
    .line 17
    .line 18
    throw v0
.end method

.method public static createWithinGlThread(Ljava/lang/String;IILandroid/os/Handler;Lio/agora/base/internal/video/EglBase;Lio/agora/base/internal/video/EglBase$Context;Lio/agora/base/internal/video/YuvConverter;)Lio/agora/base/internal/video/TextureBufferPool;
    .locals 9

    .line 18
    new-instance v0, Lio/agora/base/internal/video/TextureBufferPool;

    const/4 v5, 0x0

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move-object v6, p4

    move-object v7, p5

    move-object v8, p6

    invoke-direct/range {v0 .. v8}, Lio/agora/base/internal/video/TextureBufferPool;-><init>(Ljava/lang/String;IILandroid/os/Handler;ZLio/agora/base/internal/video/EglBase;Lio/agora/base/internal/video/EglBase$Context;Lio/agora/base/internal/video/YuvConverter;)V

    return-object v0
.end method

.method public static createWithinGlThread(Ljava/lang/String;IILandroid/os/Handler;Lio/agora/base/internal/video/EglBase;Lio/agora/base/internal/video/EglBase$Context;Lio/agora/base/internal/video/YuvConverter;Z)Lio/agora/base/internal/video/TextureBufferPool;
    .locals 10

    .line 1
    new-instance v0, Lio/agora/base/internal/video/TextureBufferPool;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    move-object v1, p0

    .line 5
    move v2, p1

    .line 6
    move v3, p2

    .line 7
    move-object v4, p3

    .line 8
    move-object v6, p4

    .line 9
    move-object v7, p5

    .line 10
    move-object/from16 v8, p6

    .line 11
    .line 12
    move/from16 v9, p7

    .line 13
    .line 14
    invoke-direct/range {v0 .. v9}, Lio/agora/base/internal/video/TextureBufferPool;-><init>(Ljava/lang/String;IILandroid/os/Handler;ZLio/agora/base/internal/video/EglBase;Lio/agora/base/internal/video/EglBase$Context;Lio/agora/base/internal/video/YuvConverter;Z)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public static deleteFenceObject(JLjava/lang/String;)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p2, p0, v0

    .line 4
    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    sget-object p2, Lio/agora/base/internal/video/EglBase;->lock:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter p2

    .line 10
    :try_start_0
    invoke-static {p0, p1}, Landroid/opengl/GLES30;->glIsSync(J)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {p0, p1}, Landroid/opengl/GLES30;->glDeleteSync(J)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit p2

    .line 23
    return-void

    .line 24
    :goto_1
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    return-void
.end method

.method private doTextureCopy(ILio/agora/base/VideoFrame$TextureBuffer$Type;IIILandroid/graphics/Matrix;JLjava/lang/Runnable;)Lio/agora/base/VideoFrame$TextureBuffer;
    .locals 17

    .line 1
    move-object/from16 v10, p0

    .line 2
    .line 3
    move-wide/from16 v0, p7

    .line 4
    .line 5
    iget-object v2, v10, Lio/agora/base/internal/video/TextureBufferPool;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 6
    .line 7
    instance-of v3, v2, Lio/agora/base/internal/video/EglBase10$Context;

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    check-cast v2, Lio/agora/base/internal/video/EglBase10$Context;

    .line 13
    .line 14
    invoke-virtual {v2}, Lio/agora/base/internal/video/EglBase10$Context;->getEglContext()Ljavax/microedition/khronos/egl/EGLContext;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 19
    .line 20
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    return-object v4

    .line 27
    :cond_0
    iget-object v2, v10, Lio/agora/base/internal/video/TextureBufferPool;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 28
    .line 29
    instance-of v3, v2, Lio/agora/base/internal/video/EglBase14$Context;

    .line 30
    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    check-cast v2, Lio/agora/base/internal/video/EglBase14$Context;

    .line 34
    .line 35
    invoke-virtual {v2}, Lio/agora/base/internal/video/EglBase14$Context;->getEglContext()Landroid/opengl/EGLContext;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Landroid/opengl/EGLContext;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    return-object v4

    .line 48
    :cond_1
    const-wide/16 v2, 0x0

    .line 49
    .line 50
    cmp-long v5, v0, v2

    .line 51
    .line 52
    if-eqz v5, :cond_2

    .line 53
    .line 54
    iget-object v5, v10, Lio/agora/base/internal/video/TextureBufferPool;->name:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v0, v1, v5}, Lio/agora/base/internal/video/TextureBufferPool;->waitFenceSignal2(JLjava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    :cond_2
    invoke-direct {v10}, Lio/agora/base/internal/video/TextureBufferPool;->acquireTextureFramebuffer()Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    sget-object v0, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 66
    .line 67
    new-instance v1, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    iget-object v2, v10, Lio/agora/base/internal/video/TextureBufferPool;->name:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v2, "acquireTextureFramebuffer failed!"

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-object v4

    .line 90
    :cond_3
    const-string v1, "setupTextureFrameBuffer"

    .line 91
    .line 92
    invoke-static {v1}, Lio/agora/base/internal/ATrace;->beginSection(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    move/from16 v1, p3

    .line 96
    .line 97
    move-wide v5, v2

    .line 98
    move/from16 v3, p4

    .line 99
    .line 100
    move/from16 v2, p5

    .line 101
    .line 102
    invoke-direct {v10, v0, v1, v3, v2}, Lio/agora/base/internal/video/TextureBufferPool;->setupTextureFrameBuffer(Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;III)Z

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    invoke-static {}, Lio/agora/base/internal/ATrace;->endSection()V

    .line 107
    .line 108
    .line 109
    if-nez v7, :cond_4

    .line 110
    .line 111
    sget-object v1, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 112
    .line 113
    new-instance v2, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    iget-object v3, v10, Lio/agora/base/internal/video/TextureBufferPool;->name:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v3, "setupTextureFrameBuffer failed!"

    .line 124
    .line 125
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-static {v1, v2}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-direct {v10, v0}, Lio/agora/base/internal/video/TextureBufferPool;->releaseTextureFramebuffer(Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;)V

    .line 136
    .line 137
    .line 138
    return-object v4

    .line 139
    :cond_4
    iget v4, v0, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->frameBufferId:I

    .line 140
    .line 141
    const v7, 0x8d40

    .line 142
    .line 143
    .line 144
    invoke-static {v7, v4}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 145
    .line 146
    .line 147
    const-string v4, "drawTexture"

    .line 148
    .line 149
    invoke-static {v4}, Lio/agora/base/internal/ATrace;->beginSection(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-direct/range {p0 .. p5}, Lio/agora/base/internal/video/TextureBufferPool;->drawTexture(ILio/agora/base/VideoFrame$TextureBuffer$Type;III)V

    .line 153
    .line 154
    .line 155
    invoke-static {}, Lio/agora/base/internal/ATrace;->endSection()V

    .line 156
    .line 157
    .line 158
    const-string v4, "flush"

    .line 159
    .line 160
    invoke-static {v4}, Lio/agora/base/internal/ATrace;->beginSection(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    const/4 v15, 0x0

    .line 164
    invoke-static {v7, v15}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 165
    .line 166
    .line 167
    sget-object v4, Lio/agora/base/internal/video/EglBase;->lock:Ljava/lang/Object;

    .line 168
    .line 169
    monitor-enter v4

    .line 170
    :try_start_0
    invoke-static {v15}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 171
    .line 172
    .line 173
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 174
    sget-boolean v4, Lio/agora/base/internal/video/TextureBufferPool;->useGlFence:Z

    .line 175
    .line 176
    if-eqz v4, :cond_5

    .line 177
    .line 178
    invoke-static {}, Lio/agora/base/internal/video/TextureBufferPool;->getGLFenceObject()J

    .line 179
    .line 180
    .line 181
    move-result-wide v7

    .line 182
    move-wide v11, v7

    .line 183
    goto :goto_0

    .line 184
    :cond_5
    move-wide v11, v5

    .line 185
    :goto_0
    cmp-long v4, v11, v5

    .line 186
    .line 187
    if-nez v4, :cond_6

    .line 188
    .line 189
    invoke-static {}, Landroid/opengl/GLES20;->glFlush()V

    .line 190
    .line 191
    .line 192
    :cond_6
    iput-wide v11, v0, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->fenceObject:J

    .line 193
    .line 194
    invoke-static {}, Lio/agora/base/internal/video/TextureBufferPool;->isGlFlushBuggyDevice()Z

    .line 195
    .line 196
    .line 197
    move-result v4

    .line 198
    if-eqz v4, :cond_7

    .line 199
    .line 200
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 201
    .line 202
    .line 203
    :cond_7
    invoke-static {}, Lio/agora/base/internal/ATrace;->endSection()V

    .line 204
    .line 205
    .line 206
    const/4 v4, 0x1

    .line 207
    new-array v4, v4, [Lio/agora/base/TextureBuffer;

    .line 208
    .line 209
    new-instance v5, Lio/agora/base/TextureBuffer;

    .line 210
    .line 211
    iget-object v1, v10, Lio/agora/base/internal/video/TextureBufferPool;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 212
    .line 213
    sget-object v6, Lio/agora/base/VideoFrame$TextureBuffer$Type;->RGB:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 214
    .line 215
    move-object v7, v5

    .line 216
    iget v5, v0, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->textureId:I

    .line 217
    .line 218
    move-object v8, v7

    .line 219
    iget-object v7, v10, Lio/agora/base/internal/video/TextureBufferPool;->handler:Landroid/os/Handler;

    .line 220
    .line 221
    move-object v9, v8

    .line 222
    iget-object v8, v10, Lio/agora/base/internal/video/TextureBufferPool;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 223
    .line 224
    move-object v13, v9

    .line 225
    new-instance v9, Lio/agora/base/internal/video/TextureBufferPool$6;

    .line 226
    .line 227
    move-object/from16 v14, p9

    .line 228
    .line 229
    invoke-direct {v9, v10, v4, v0, v14}, Lio/agora/base/internal/video/TextureBufferPool$6;-><init>(Lio/agora/base/internal/video/TextureBufferPool;[Lio/agora/base/TextureBuffer;Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;Ljava/lang/Runnable;)V

    .line 230
    .line 231
    .line 232
    sget-object v0, Lio/agora/base/internal/video/TextureBufferPool;->nextSeq:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 233
    .line 234
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    invoke-static {v2}, Lio/agora/base/internal/video/HdrUtil;->is10BitLumaDepth(I)Z

    .line 239
    .line 240
    .line 241
    move-result v14

    .line 242
    move-object v2, v13

    .line 243
    move v13, v0

    .line 244
    move-object v0, v2

    .line 245
    move/from16 v2, p3

    .line 246
    .line 247
    move-object/from16 v16, v4

    .line 248
    .line 249
    move-object v4, v6

    .line 250
    move-object/from16 v6, p6

    .line 251
    .line 252
    invoke-direct/range {v0 .. v14}, Lio/agora/base/TextureBuffer;-><init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;Lio/agora/base/internal/video/TextureBufferPool;JIZ)V

    .line 253
    .line 254
    .line 255
    move-object v7, v0

    .line 256
    aput-object v7, v16, v15

    .line 257
    .line 258
    return-object v7

    .line 259
    :catchall_0
    move-exception v0

    .line 260
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 261
    throw v0
.end method

.method private drawTexture(ILio/agora/base/VideoFrame$TextureBuffer$Type;III)V
    .locals 14

    .line 1
    const/16 v0, 0x4000

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lio/agora/base/internal/video/TextureBufferPool$7;->$SwitchMap$io$agora$base$VideoFrame$TextureBuffer$Type:[I

    .line 7
    .line 8
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Enum;->ordinal()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    aget v0, v0, v1

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    iget-object v2, p0, Lio/agora/base/internal/video/TextureBufferPool;->drawer:Lio/agora/base/internal/video/GlRectDrawer;

    .line 21
    .line 22
    sget-object v5, Lio/agora/base/internal/video/GlUtil;->IDENTITY_MATRIX:[F

    .line 23
    .line 24
    sget-object p0, Lio/agora/base/VideoFrame$AlphaStitchMode;->ALPHA_NO_STITCH:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 25
    .line 26
    invoke-virtual {p0}, Lio/agora/base/VideoFrame$AlphaStitchMode;->value()I

    .line 27
    .line 28
    .line 29
    move-result v13

    .line 30
    const/4 v4, 0x0

    .line 31
    const/4 v8, 0x0

    .line 32
    const/4 v9, 0x0

    .line 33
    move/from16 v10, p3

    .line 34
    .line 35
    move/from16 v11, p4

    .line 36
    .line 37
    move v3, p1

    .line 38
    move/from16 v6, p3

    .line 39
    .line 40
    move/from16 v7, p4

    .line 41
    .line 42
    move/from16 v12, p5

    .line 43
    .line 44
    invoke-virtual/range {v2 .. v13}, Lio/agora/base/internal/video/GlGenericDrawer;->drawRgb(II[FIIIIIIII)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const-string p0, "Unknown texture type."

    .line 49
    .line 50
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool;->drawer:Lio/agora/base/internal/video/GlRectDrawer;

    .line 55
    .line 56
    sget-object v3, Lio/agora/base/internal/video/GlUtil;->IDENTITY_MATRIX:[F

    .line 57
    .line 58
    sget-object p0, Lio/agora/base/VideoFrame$AlphaStitchMode;->ALPHA_NO_STITCH:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 59
    .line 60
    invoke-virtual {p0}, Lio/agora/base/VideoFrame$AlphaStitchMode;->value()I

    .line 61
    .line 62
    .line 63
    move-result v11

    .line 64
    const/4 v2, 0x0

    .line 65
    const/4 v6, 0x0

    .line 66
    const/4 v7, 0x0

    .line 67
    move/from16 v8, p3

    .line 68
    .line 69
    move/from16 v9, p4

    .line 70
    .line 71
    move v1, p1

    .line 72
    move/from16 v4, p3

    .line 73
    .line 74
    move/from16 v5, p4

    .line 75
    .line 76
    move/from16 v10, p5

    .line 77
    .line 78
    invoke-virtual/range {v0 .. v11}, Lio/agora/base/internal/video/GlGenericDrawer;->drawOes(II[FIIIIIIII)V

    .line 79
    .line 80
    .line 81
    :goto_0
    const-string p0, "TextureBufferPool.drawFrameBuffer"

    .line 82
    .line 83
    invoke-static {p0}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public static getGLFenceObject()J
    .locals 4

    .line 1
    const v0, 0x9117

    .line 2
    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-static {v0, v1}, Landroid/opengl/GLES30;->glFenceSync(II)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long v2, v0, v2

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/opengl/GLES20;->glFlush()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-wide v0
.end method

.method public static isGlFlushBuggyDevice()Z
    .locals 3
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    sget-object v0, Lio/agora/base/internal/video/TextureBufferPool;->glFlushBuggyDevices:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/lang/String;

    .line 18
    .line 19
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    return v0

    .line 29
    :cond_1
    sget-boolean v0, Lio/agora/base/internal/video/TextureBufferPool;->forceGlFinish:Z

    .line 30
    .line 31
    return v0
.end method

.method private release()V
    .locals 8

    .line 1
    sget-object v0, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Lio/agora/base/internal/video/TextureBufferPool;->name:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, " release()"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool;->textureInfoList:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool;->textureInfoList:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    new-array v1, v0, [I

    .line 40
    .line 41
    new-array v2, v0, [I

    .line 42
    .line 43
    const/4 v3, 0x0

    .line 44
    move v4, v3

    .line 45
    :goto_0
    if-ge v4, v0, :cond_0

    .line 46
    .line 47
    iget-object v5, p0, Lio/agora/base/internal/video/TextureBufferPool;->textureInfoList:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    check-cast v5, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;

    .line 54
    .line 55
    iget v6, v5, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->textureId:I

    .line 56
    .line 57
    aput v6, v1, v4

    .line 58
    .line 59
    iget v6, v5, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->frameBufferId:I

    .line 60
    .line 61
    aput v6, v2, v4

    .line 62
    .line 63
    iget-wide v5, v5, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->fenceObject:J

    .line 64
    .line 65
    iget-object v7, p0, Lio/agora/base/internal/video/TextureBufferPool;->name:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v5, v6, v7}, Lio/agora/base/internal/video/TextureBufferPool;->deleteFenceObject(JLjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    add-int/lit8 v4, v4, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    sget-object v4, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 74
    .line 75
    new-instance v5, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    iget-object v6, p0, Lio/agora/base/internal/video/TextureBufferPool;->name:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v6, ": delete textures "

    .line 86
    .line 87
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v6, " framebuffers:"

    .line 98
    .line 99
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-static {v2}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    invoke-static {v4, v5}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-static {v0, v1, v3}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 117
    .line 118
    .line 119
    invoke-static {v0, v2, v3}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool;->textureInfoList:Ljava/util/ArrayList;

    .line 123
    .line 124
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 125
    .line 126
    .line 127
    :cond_1
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool;->yuvConverterInternal:Lio/agora/base/internal/video/YuvConverter;

    .line 128
    .line 129
    invoke-virtual {v0}, Lio/agora/base/internal/video/YuvConverter;->release()V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool;->drawer:Lio/agora/base/internal/video/GlRectDrawer;

    .line 133
    .line 134
    invoke-virtual {v0}, Lio/agora/base/internal/video/GlGenericDrawer;->release()V

    .line 135
    .line 136
    .line 137
    iget-boolean v0, p0, Lio/agora/base/internal/video/TextureBufferPool;->ownGlThread:Z

    .line 138
    .line 139
    if-eqz v0, :cond_3

    .line 140
    .line 141
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool;->eglBase:Lio/agora/base/internal/video/EglBase;

    .line 142
    .line 143
    if-eqz v0, :cond_2

    .line 144
    .line 145
    invoke-interface {v0}, Lio/agora/base/internal/video/EglBase;->release()V

    .line 146
    .line 147
    .line 148
    :cond_2
    iget-object p0, p0, Lio/agora/base/internal/video/TextureBufferPool;->handler:Landroid/os/Handler;

    .line 149
    .line 150
    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p0}, Landroid/os/Looper;->quit()V

    .line 155
    .line 156
    .line 157
    :cond_3
    return-void
.end method

.method private releaseTextureFramebuffer(Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->inUse:Z

    .line 3
    .line 4
    iget-boolean v1, p0, Lio/agora/base/internal/video/TextureBufferPool;->shrinkPool:Z

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    iget-object v1, p0, Lio/agora/base/internal/video/TextureBufferPool;->textureInfoList:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-gez v1, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v0, " texture info not found!"

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, " texInfo.textureId: "

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget v0, p1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->textureId:I

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget-object v1, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v1, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    iget v2, p0, Lio/agora/base/internal/video/TextureBufferPool;->keepBufferCnt:I

    .line 71
    .line 72
    if-lt v1, v2, :cond_1

    .line 73
    .line 74
    iget v2, p1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->textureId:I

    .line 75
    .line 76
    filled-new-array {v2}, [I

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    const/4 v3, 0x1

    .line 81
    invoke-static {v3, v2, v0}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 82
    .line 83
    .line 84
    iget v2, p1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->frameBufferId:I

    .line 85
    .line 86
    filled-new-array {v2}, [I

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-static {v3, v2, v0}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool;->textureInfoList:Ljava/util/ArrayList;

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    :cond_1
    :goto_0
    iget-wide v0, p1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->fenceObject:J

    .line 99
    .line 100
    iget-object p0, p0, Lio/agora/base/internal/video/TextureBufferPool;->name:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v0, v1, p0}, Lio/agora/base/internal/video/TextureBufferPool;->deleteFenceObject(JLjava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public static setForceGlFinish(Z)V
    .locals 3
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    sget-object v0, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setForceGlFinish "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sput-boolean p0, Lio/agora/base/internal/video/TextureBufferPool;->forceGlFinish:Z

    .line 21
    .line 22
    return-void
.end method

.method public static setUseGlFence(Z)V
    .locals 3
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    sget-object v0, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setUseGlFence "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sput-boolean p0, Lio/agora/base/internal/video/TextureBufferPool;->useGlFence:Z

    .line 21
    .line 22
    return-void
.end method

.method private setupTextureFrameBuffer(Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;III)Z
    .locals 12

    .line 1
    const/4 v9, 0x0

    .line 2
    if-lez p2, :cond_4

    .line 3
    .line 4
    if-gtz p3, :cond_0

    .line 5
    .line 6
    goto/16 :goto_1

    .line 7
    .line 8
    :cond_0
    iget-boolean v0, p1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->specified:Z

    .line 9
    .line 10
    const/4 v10, 0x1

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget v0, p1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->width:I

    .line 14
    .line 15
    if-ne v0, p2, :cond_1

    .line 16
    .line 17
    iget v0, p1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->height:I

    .line 18
    .line 19
    if-ne v0, p3, :cond_1

    .line 20
    .line 21
    return v10

    .line 22
    :cond_1
    const v0, 0x84c0

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 26
    .line 27
    .line 28
    iget v0, p1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->textureId:I

    .line 29
    .line 30
    const/16 v11, 0xde1

    .line 31
    .line 32
    invoke-static {v11, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 33
    .line 34
    .line 35
    const-string v0, "glTexImage2D"

    .line 36
    .line 37
    invoke-static {v0}, Lio/agora/base/internal/ATrace;->beginSection(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-static/range {p4 .. p4}, Lio/agora/base/internal/video/HdrUtil;->is10BitLumaDepth(I)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    invoke-static {}, Lio/agora/base/internal/video/HdrUtil;->isSupportedEGL3()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    const/16 v7, 0x140b

    .line 53
    .line 54
    const/4 v8, 0x0

    .line 55
    const/16 v0, 0xde1

    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    const v2, 0x881a

    .line 59
    .line 60
    .line 61
    const/4 v5, 0x0

    .line 62
    const/16 v6, 0x1908

    .line 63
    .line 64
    move v3, p2

    .line 65
    move v4, p3

    .line 66
    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    iget v2, p0, Lio/agora/base/internal/video/TextureBufferPool;->glPixelFormat:I

    .line 71
    .line 72
    const/16 v7, 0x1401

    .line 73
    .line 74
    const/4 v8, 0x0

    .line 75
    const/16 v0, 0xde1

    .line 76
    .line 77
    const/4 v1, 0x0

    .line 78
    const/4 v5, 0x0

    .line 79
    move v6, v2

    .line 80
    move v3, p2

    .line 81
    move v4, p3

    .line 82
    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 83
    .line 84
    .line 85
    :goto_0
    invoke-static {}, Lio/agora/base/internal/ATrace;->endSection()V

    .line 86
    .line 87
    .line 88
    const-string p0, "TextureBufferPool.glTexImage2D"

    .line 89
    .line 90
    invoke-static {p0}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v11, v9}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 94
    .line 95
    .line 96
    iget p0, p1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->frameBufferId:I

    .line 97
    .line 98
    const v0, 0x8d40

    .line 99
    .line 100
    .line 101
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 102
    .line 103
    .line 104
    const-string p0, "glFramebufferTexture2D"

    .line 105
    .line 106
    invoke-static {p0}, Lio/agora/base/internal/ATrace;->beginSection(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    const p0, 0x8ce0

    .line 110
    .line 111
    .line 112
    iget v1, p1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->textureId:I

    .line 113
    .line 114
    invoke-static {v0, p0, v11, v1, v9}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 115
    .line 116
    .line 117
    invoke-static {}, Lio/agora/base/internal/ATrace;->endSection()V

    .line 118
    .line 119
    .line 120
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    invoke-static {v0, v9}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 125
    .line 126
    .line 127
    const v0, 0x8cd5

    .line 128
    .line 129
    .line 130
    if-eq p0, v0, :cond_3

    .line 131
    .line 132
    sget-object p1, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 133
    .line 134
    new-instance p2, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    const-string v0, "Framebuffer not complete, status: "

    .line 137
    .line 138
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-static {p1, p0}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    return v9

    .line 152
    :cond_3
    iput-boolean v10, p1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->specified:Z

    .line 153
    .line 154
    iput p2, p1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->width:I

    .line 155
    .line 156
    iput p3, p1, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->height:I

    .line 157
    .line 158
    return v10

    .line 159
    :cond_4
    :goto_1
    sget-object p0, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 160
    .line 161
    new-instance p1, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    const-string v0, "Invalid size: "

    .line 164
    .line 165
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    const-string p2, "x"

    .line 172
    .line 173
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-static {p0, p1}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    return v9
.end method

.method public static waitFenceSignal(JLjava/lang/String;)Z
    .locals 3

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long p2, p0, v0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/opengl/GLES30;->glIsSync(J)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    sget p2, Lio/agora/base/internal/video/TextureBufferPool;->MAX_SYNC_OUT_TIME:I

    .line 18
    .line 19
    int-to-long v1, p2

    .line 20
    const/4 p2, 0x1

    .line 21
    invoke-static {p0, p1, p2, v1, v2}, Landroid/opengl/GLES30;->glClientWaitSync(JIJ)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    packed-switch p0, :pswitch_data_0

    .line 26
    .line 27
    .line 28
    :pswitch_0
    return v0

    .line 29
    :pswitch_1
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    sget-object p1, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 34
    .line 35
    new-instance p2, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v1, "waitFenceSignal error:"

    .line 38
    .line 39
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p1, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :pswitch_2
    return p2

    .line 54
    :cond_0
    :goto_0
    return v0

    .line 55
    :pswitch_data_0
    .packed-switch 0x911a
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static waitFenceSignal2(JLjava/lang/String;)Z
    .locals 3

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long p2, p0, v0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    sget-object p2, Lio/agora/base/internal/video/EglBase;->lock:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter p2

    .line 14
    :try_start_0
    invoke-static {p0, p1}, Landroid/opengl/GLES30;->glIsSync(J)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    const-wide/16 v1, -0x1

    .line 21
    .line 22
    invoke-static {p0, p1, v0, v1, v2}, Landroid/opengl/GLES30;->glWaitSync(JIJ)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit p2

    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :goto_1
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0

    .line 33
    :cond_1
    return v0
.end method


# virtual methods
.method public anyTextureInUse()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/TextureBufferPool;->textureInfoList:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;

    .line 18
    .line 19
    iget-boolean v0, v0, Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;->inUse:Z

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public deleteGlFenceIfNeeded(J)V
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lio/agora/base/internal/video/TextureBufferPool$5;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lio/agora/base/internal/video/TextureBufferPool$5;-><init>(Lio/agora/base/internal/video/TextureBufferPool;J)V

    .line 6
    .line 7
    .line 8
    const-wide/16 p0, 0x3e8

    .line 9
    .line 10
    invoke-static {v0, p0, p1, v1}, Lio/agora/base/internal/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;JLjava/util/concurrent/Callable;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    :catch_0
    return-void
.end method

.method public dispose()V
    .locals 3
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    sget-object v0, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Lio/agora/base/internal/video/TextureBufferPool;->name:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, " dispose()"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :try_start_0
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool;->handler:Landroid/os/Handler;

    .line 26
    .line 27
    new-instance v1, Lio/agora/base/internal/video/TextureBufferPool$3;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Lio/agora/base/internal/video/TextureBufferPool$3;-><init>(Lio/agora/base/internal/video/TextureBufferPool;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v1}, Lio/agora/base/internal/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :catch_0
    move-exception v0

    .line 37
    sget-object v1, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 38
    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lio/agora/base/internal/video/TextureBufferPool;->name:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string p0, " dispose fail: "

    .line 50
    .line 51
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {v1, p0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public setPoolBufferReleaseCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/TextureBufferPool;->poolBufferReleaseCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public textureCopy(ILio/agora/base/VideoFrame$TextureBuffer$Type;IILandroid/graphics/Matrix;JILjava/lang/Runnable;)Lio/agora/base/VideoFrame$TextureBuffer;
    .locals 12
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 64
    :try_start_0
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool;->handler:Landroid/os/Handler;

    new-instance v1, Lio/agora/base/internal/video/TextureBufferPool$2;

    move-object v2, p0

    move v3, p1

    move-object v4, p2

    move v5, p3

    move/from16 v6, p4

    move-object/from16 v8, p5

    move-wide/from16 v9, p6

    move/from16 v7, p8

    move-object/from16 v11, p9

    invoke-direct/range {v1 .. v11}, Lio/agora/base/internal/video/TextureBufferPool$2;-><init>(Lio/agora/base/internal/video/TextureBufferPool;ILio/agora/base/VideoFrame$TextureBuffer$Type;IIILandroid/graphics/Matrix;JLjava/lang/Runnable;)V

    invoke-static {v0, v1}, Lio/agora/base/internal/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lio/agora/base/VideoFrame$TextureBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 65
    sget-object p1, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "textureCopy faile: "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public textureCopy(Lio/agora/base/VideoFrame$TextureBuffer;ILjava/lang/Runnable;)Lio/agora/base/VideoFrame$TextureBuffer;
    .locals 10

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lio/agora/base/internal/video/TextureBufferPool;->TAG:Ljava/lang/String;

    .line 4
    .line 5
    new-instance p2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string p3, "textureCopy: "

    .line 8
    .line 9
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lio/agora/base/internal/video/TextureBufferPool;->name:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p0, " textureBuffer null"

    .line 18
    .line 19
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p1, p0}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return-object p0

    .line 31
    :cond_0
    invoke-interface {p1}, Lio/agora/base/VideoFrame$TextureBuffer;->getTextureId()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-interface {p1}, Lio/agora/base/VideoFrame$TextureBuffer;->getType()Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-interface {p1}, Lio/agora/base/VideoFrame$Buffer;->getWidth()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-interface {p1}, Lio/agora/base/VideoFrame$Buffer;->getHeight()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    invoke-interface {p1}, Lio/agora/base/VideoFrame$TextureBuffer;->getTransformMatrix()Landroid/graphics/Matrix;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-interface {p1}, Lio/agora/base/VideoFrame$TextureBuffer;->getFenceObject()J

    .line 52
    .line 53
    .line 54
    move-result-wide v6

    .line 55
    move-object v0, p0

    .line 56
    move v8, p2

    .line 57
    move-object v9, p3

    .line 58
    invoke-virtual/range {v0 .. v9}, Lio/agora/base/internal/video/TextureBufferPool;->textureCopy(ILio/agora/base/VideoFrame$TextureBuffer$Type;IILandroid/graphics/Matrix;JILjava/lang/Runnable;)Lio/agora/base/VideoFrame$TextureBuffer;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public textureCopy(Lio/agora/base/VideoFrame$TextureBuffer;Ljava/lang/Runnable;)Lio/agora/base/VideoFrame$TextureBuffer;
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    const/4 v0, 0x0

    .line 63
    invoke-virtual {p0, p1, v0, p2}, Lio/agora/base/internal/video/TextureBufferPool;->textureCopy(Lio/agora/base/VideoFrame$TextureBuffer;ILjava/lang/Runnable;)Lio/agora/base/VideoFrame$TextureBuffer;

    move-result-object p0

    return-object p0
.end method

.method public waitGlFenceIfNeeded(J)V
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lio/agora/base/internal/video/TextureBufferPool$4;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lio/agora/base/internal/video/TextureBufferPool$4;-><init>(Lio/agora/base/internal/video/TextureBufferPool;J)V

    .line 6
    .line 7
    .line 8
    const-wide/16 p0, 0x3e8

    .line 9
    .line 10
    invoke-static {v0, p0, p1, v1}, Lio/agora/base/internal/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;JLjava/util/concurrent/Callable;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    :catch_0
    return-void
.end method
