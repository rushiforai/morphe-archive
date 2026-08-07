.class public Lcom/ss/bytertc/engine/ui/VideoFrameRender;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;
.implements Lcom/bytedance/realx/video/RendererCommon$RendererEvents;
.implements Lcom/ss/bytertc/base/media/EglRenderer$FirstVideoFrameRenderListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;,
        Lcom/ss/bytertc/engine/ui/VideoFrameRender$FirstVideoFrameRenderListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoFrameRender"


# instance fields
.field private enableFixedSize:Z

.field private final frameConverter:Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;

.field private volatile mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

.field private final mEglSurfaceCreatedAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mFirstFrameListenerLock:Ljava/lang/Object;

.field private final mFirstVideoFrameListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/ss/bytertc/engine/ui/VideoFrameRender$FirstVideoFrameRenderListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mHasReceivedFirstFrame:Z

.field private final mHasRenderViewAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mReceiveFirstTimeStampMs:J

.field private final mRenderLock:Ljava/lang/Object;

.field private final mRenderName:Ljava/lang/String;

.field private volatile mSurface:Landroid/view/Surface;

.field private final mSurfaceLifecycleCallbackCallback:Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;

.field private volatile mSurfaceView:Landroid/view/SurfaceView;

.field private final mTextureProcessLock:Ljava/lang/Object;

.field private mTextureProcessLooper:Landroid/os/Looper;

.field private volatile mTextureView:Landroid/view/TextureView;

.field private rotatedFrameHeight:I

.field private rotatedFrameWidth:I

.field private surfaceHeight:I

.field private surfaceWidth:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mReceiveFirstTimeStampMs:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mHasReceivedFirstFrame:Z

    .line 10
    .line 11
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 17
    .line 18
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 19
    .line 20
    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mHasRenderViewAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 24
    .line 25
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 26
    .line 27
    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglSurfaceCreatedAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 31
    .line 32
    new-instance v0, Ljava/lang/Object;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderLock:Ljava/lang/Object;

    .line 38
    .line 39
    new-instance v0, Ljava/lang/Object;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureProcessLock:Ljava/lang/Object;

    .line 45
    .line 46
    new-instance v0, Ljava/lang/Object;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mFirstFrameListenerLock:Ljava/lang/Object;

    .line 52
    .line 53
    new-instance v0, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mFirstVideoFrameListeners:Ljava/util/ArrayList;

    .line 59
    .line 60
    iput-object p1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderName:Ljava/lang/String;

    .line 61
    .line 62
    new-instance p1, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;

    .line 63
    .line 64
    const/4 v0, 0x1

    .line 65
    invoke-direct {p1, v0}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;-><init>(Z)V

    .line 66
    .line 67
    .line 68
    iput-object p1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->frameConverter:Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;

    .line 69
    .line 70
    new-instance p1, Lcom/ss/bytertc/engine/ui/VideoFrameRender$1;

    .line 71
    .line 72
    invoke-direct {p1, p0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender$1;-><init>(Lcom/ss/bytertc/engine/ui/VideoFrameRender;)V

    .line 73
    .line 74
    .line 75
    iput-object p1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceLifecycleCallbackCallback:Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;

    .line 76
    .line 77
    return-void
.end method

.method public static synthetic a(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/utils/ByteBufferUtils;->nativeReleaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/ss/bytertc/engine/utils/ByteBufferUtils;->nativeReleaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p2}, Lcom/ss/bytertc/engine/utils/ByteBufferUtils;->nativeReleaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/engine/ui/VideoFrameRender;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglSurfaceCreatedAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/engine/ui/VideoFrameRender;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/ss/bytertc/engine/ui/VideoFrameRender;Lcom/bytedance/realx/video/EglBase$Context;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 2
    .line 3
    sget-object v0, Lcom/bytedance/realx/video/EglBase;->CONFIG_PLAIN:[I

    .line 4
    .line 5
    new-instance v1, Lcom/bytedance/realx/video/GlRectDrawer;

    .line 6
    .line 7
    invoke-direct {v1}, Lcom/bytedance/realx/video/GlRectDrawer;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1, v0, v1}, Lcom/ss/bytertc/base/media/EglRenderer;->init(Lcom/bytedance/realx/video/EglBase$Context;[ILcom/bytedance/realx/video/RendererCommon$GlDrawer;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private createYUV([BII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    array-length v1, p1

    .line 5
    if-eqz v1, :cond_5

    .line 6
    .line 7
    add-int/lit8 v1, p3, 0x1

    .line 8
    .line 9
    div-int/lit8 v1, v1, 0x2

    .line 10
    .line 11
    add-int/lit8 v2, p2, 0x1

    .line 12
    .line 13
    div-int/lit8 v8, v2, 0x2

    .line 14
    .line 15
    mul-int v2, p2, p3

    .line 16
    .line 17
    mul-int/2addr v1, v8

    .line 18
    invoke-static {v2}, Lcom/ss/bytertc/engine/utils/ByteBufferUtils;->nativeAllocateBuffer(I)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    invoke-static {v1}, Lcom/ss/bytertc/engine/utils/ByteBufferUtils;->nativeAllocateBuffer(I)Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    .line 25
    move-result-object v7

    .line 26
    invoke-static {v1}, Lcom/ss/bytertc/engine/utils/ByteBufferUtils;->nativeAllocateBuffer(I)Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    .line 29
    move-result-object v9

    .line 30
    if-eqz v5, :cond_2

    .line 31
    .line 32
    if-eqz v7, :cond_2

    .line 33
    .line 34
    if-nez v9, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 v0, 0x0

    .line 38
    invoke-virtual {v5, p1, v0, v2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v7, p1, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    .line 44
    add-int/2addr v2, v1

    .line 45
    invoke-virtual {v9, p1, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v5, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v7, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v9, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 58
    .line 59
    instance-of p0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;

    .line 60
    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    new-instance v11, Ll/pel0;

    .line 64
    .line 65
    invoke-direct {v11, v5, v7, v9}, Ll/pel0;-><init>(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    .line 66
    .line 67
    .line 68
    move v6, p2

    .line 69
    move v10, v8

    .line 70
    move v3, p2

    .line 71
    move v4, p3

    .line 72
    invoke-static/range {v3 .. v11}, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0

    .line 77
    :cond_1
    move v3, p2

    .line 78
    move v4, p3

    .line 79
    new-instance v11, Ll/qel0;

    .line 80
    .line 81
    invoke-direct {v11, v5, v7, v9}, Ll/qel0;-><init>(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    .line 82
    .line 83
    .line 84
    move v6, v3

    .line 85
    move v10, v8

    .line 86
    invoke-static/range {v3 .. v11}, Lcom/bytedance/realx/video/JavaI420Buffer;->wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_2
    :goto_0
    if-eqz v5, :cond_3

    .line 92
    .line 93
    invoke-static {v5}, Lcom/ss/bytertc/engine/utils/ByteBufferUtils;->nativeReleaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 94
    .line 95
    .line 96
    :cond_3
    if-eqz v7, :cond_4

    .line 97
    .line 98
    invoke-static {v7}, Lcom/ss/bytertc/engine/utils/ByteBufferUtils;->nativeReleaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 99
    .line 100
    .line 101
    :cond_4
    if-eqz v9, :cond_5

    .line 102
    .line 103
    invoke-static {v9}, Lcom/ss/bytertc/engine/utils/ByteBufferUtils;->nativeReleaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 104
    .line 105
    .line 106
    :cond_5
    return-object v0
.end method

.method public static synthetic d(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/ss/bytertc/engine/utils/ByteBufferUtils;->nativeReleaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/ss/bytertc/engine/utils/ByteBufferUtils;->nativeReleaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p2}, Lcom/ss/bytertc/engine/utils/ByteBufferUtils;->nativeReleaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic e(Lcom/ss/bytertc/engine/ui/VideoFrameRender;II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->rotatedFrameWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->rotatedFrameHeight:I

    .line 4
    .line 5
    return-void
.end method

.method private initSurfaceView()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderLock:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v0

    .line 17
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 18
    .line 19
    instance-of v1, v1, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 24
    .line 25
    check-cast v1, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->bind(Landroid/view/SurfaceView;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 33
    .line 34
    invoke-virtual {v1, p0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    :goto_0
    monitor-exit v0

    .line 41
    return-void

    .line 42
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    throw p0

    .line 44
    :cond_2
    :goto_2
    return-void
.end method

.method private initTextureView()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureView:Landroid/view/TextureView;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderLock:Ljava/lang/Object;

    .line 19
    .line 20
    monitor-enter v0

    .line 21
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 22
    .line 23
    instance-of v1, v1, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;

    .line 24
    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 28
    .line 29
    check-cast v1, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureView:Landroid/view/TextureView;

    .line 32
    .line 33
    iget-object v3, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceLifecycleCallbackCallback:Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;

    .line 34
    .line 35
    invoke-virtual {v1, v2, v3}, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->bind(Landroid/view/TextureView;Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureView:Landroid/view/TextureView;

    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/view/View;->isShown()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    iget-object v2, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureView:Landroid/view/TextureView;

    .line 47
    .line 48
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    int-to-float v2, v2

    .line 53
    iget-object v3, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureView:Landroid/view/TextureView;

    .line 54
    .line 55
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    int-to-float v3, v3

    .line 60
    div-float/2addr v2, v3

    .line 61
    invoke-virtual {v1, v2}, Lcom/ss/bytertc/base/media/EglRenderer;->setLayoutAspectRatio(F)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catchall_0
    move-exception p0

    .line 66
    goto :goto_1

    .line 67
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureView:Landroid/view/TextureView;

    .line 68
    .line 69
    invoke-virtual {v1, p0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    monitor-exit v0

    .line 73
    return-void

    .line 74
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    throw p0

    .line 76
    :cond_3
    :goto_2
    return-void
.end method

.method private notifyFristRenderCallback()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mFirstFrameListenerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mFirstVideoFrameListeners:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    monitor-exit v0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    iget-wide v3, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mReceiveFirstTimeStampMs:J

    .line 21
    .line 22
    sub-long/2addr v1, v3

    .line 23
    long-to-int v1, v1

    .line 24
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mFirstVideoFrameListeners:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Lcom/ss/bytertc/engine/ui/VideoFrameRender$FirstVideoFrameRenderListener;

    .line 41
    .line 42
    invoke-interface {v2, v1}, Lcom/ss/bytertc/engine/ui/VideoFrameRender$FirstVideoFrameRenderListener;->onFirstVideoFrameRender(I)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    monitor-exit v0

    .line 47
    return-void

    .line 48
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw p0
.end method

.method private onVideoFrame(Lcom/bytedance/realx/video/VideoFrame;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglSurfaceCreatedAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_2

    .line 11
    .line 12
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mHasReceivedFirstFrame:Z

    .line 18
    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    iput-wide v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mReceiveFirstTimeStampMs:J

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    iput-boolean v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mHasReceivedFirstFrame:Z

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_2

    .line 33
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/base/media/EglRenderer;->onFrame(Lcom/bytedance/realx/video/VideoFrame;)V

    .line 36
    .line 37
    .line 38
    monitor-exit v0

    .line 39
    return-void

    .line 40
    :cond_2
    :goto_1
    monitor-exit v0

    .line 41
    return-void

    .line 42
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    throw p0
.end method

.method private postOrRun(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private renderI420Frame(Ljava/nio/ByteBuffer;IIIJ)V
    .locals 2

    if-eqz p1, :cond_1

    .line 41
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->frameConverter:Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;

    if-eqz v0, :cond_1

    .line 42
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    instance-of v1, v1, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    .line 43
    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->convertToJavaI420Buffer(Ljava/nio/ByteBuffer;IIZ)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 44
    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->convertToJavaI420Buffer(Ljava/nio/ByteBuffer;IIZ)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_1

    .line 45
    new-instance p2, Lcom/bytedance/realx/video/VideoFrame;

    invoke-direct {p2, p1, p4, p5, p6}, Lcom/bytedance/realx/video/VideoFrame;-><init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;IJ)V

    .line 46
    invoke-direct {p0, p2}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->onVideoFrame(Lcom/bytedance/realx/video/VideoFrame;)V

    .line 47
    invoke-virtual {p2}, Lcom/bytedance/realx/video/VideoFrame;->release()V

    :cond_1
    return-void
.end method

.method private renderI420Frame([BIIIJ)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-lez v0, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->frameConverter:Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 11
    .line 12
    instance-of v1, v1, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->convertToJavaI420Buffer([BIIZ)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->convertToJavaI420Buffer([BIIZ)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_0
    if-eqz p1, :cond_1

    .line 28
    .line 29
    new-instance p2, Lcom/bytedance/realx/video/VideoFrame;

    .line 30
    .line 31
    invoke-direct {p2, p1, p4, p5, p6}, Lcom/bytedance/realx/video/VideoFrame;-><init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;IJ)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0, p2}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->onVideoFrame(Lcom/bytedance/realx/video/VideoFrame;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2}, Lcom/bytedance/realx/video/VideoFrame;->release()V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method private renderTextureFrame(ILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;IIIJ[FLandroid/os/Looper;)V
    .locals 9

    .line 1
    invoke-static/range {p8 .. p8}, Lcom/bytedance/realx/video/RendererCommon;->convertMatrixToAndroidGraphicsMatrix([F)Landroid/graphics/Matrix;

    .line 2
    .line 3
    .line 4
    move-result-object v5

    .line 5
    new-instance v0, Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 6
    .line 7
    new-instance v6, Landroid/os/Handler;

    .line 8
    .line 9
    move-object/from16 v1, p9

    .line 10
    .line 11
    invoke-direct {v6, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 12
    .line 13
    .line 14
    new-instance v7, Lcom/bytedance/realx/video/YuvConverter;

    .line 15
    .line 16
    invoke-direct {v7}, Lcom/bytedance/realx/video/YuvConverter;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v8, Ll/rel0;

    .line 20
    .line 21
    invoke-direct {v8}, Ll/rel0;-><init>()V

    .line 22
    .line 23
    .line 24
    move v4, p1

    .line 25
    move-object v3, p2

    .line 26
    move v1, p3

    .line 27
    move v2, p4

    .line 28
    invoke-direct/range {v0 .. v8}, Lcom/bytedance/realx/video/TextureBufferImpl;-><init>(IILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lcom/bytedance/realx/video/YuvConverter;Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    new-instance p1, Lcom/bytedance/realx/video/VideoFrame;

    .line 32
    .line 33
    move-wide p2, p6

    .line 34
    invoke-direct {p1, v0, p5, p2, p3}, Lcom/bytedance/realx/video/VideoFrame;-><init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;IJ)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0, p1}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->onVideoFrame(Lcom/bytedance/realx/video/VideoFrame;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->release()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private runOnUIThread(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance p0, Landroid/os/Handler;

    .line 20
    .line 21
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private updateSurfaceSize()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ThreadUtils;->checkIsOnMainThread()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->enableFixedSize:Z

    .line 5
    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->rotatedFrameWidth:I

    .line 9
    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    iget v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->rotatedFrameHeight:I

    .line 13
    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    int-to-float v0, v0

    .line 39
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 40
    .line 41
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    int-to-float v1, v1

    .line 46
    div-float/2addr v0, v1

    .line 47
    iget v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->rotatedFrameWidth:I

    .line 48
    .line 49
    int-to-float v2, v1

    .line 50
    iget v3, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->rotatedFrameHeight:I

    .line 51
    .line 52
    int-to-float v4, v3

    .line 53
    div-float/2addr v2, v4

    .line 54
    cmpl-float v2, v2, v0

    .line 55
    .line 56
    if-lez v2, :cond_0

    .line 57
    .line 58
    int-to-float v1, v3

    .line 59
    mul-float/2addr v1, v0

    .line 60
    float-to-int v1, v1

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    int-to-float v2, v1

    .line 63
    div-float/2addr v2, v0

    .line 64
    float-to-int v3, v2

    .line 65
    :goto_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 76
    .line 77
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    new-instance v2, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v3, "updateSurfaceSize. Layout size: "

    .line 88
    .line 89
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object v3, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 93
    .line 94
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v3, "x"

    .line 102
    .line 103
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget-object v4, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 107
    .line 108
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v4, ", frame size: "

    .line 116
    .line 117
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    iget v4, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->rotatedFrameWidth:I

    .line 121
    .line 122
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget v4, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->rotatedFrameHeight:I

    .line 129
    .line 130
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v4, ", requested surface size: "

    .line 134
    .line 135
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v4, ", old surface size: "

    .line 148
    .line 149
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget v4, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->surfaceWidth:I

    .line 153
    .line 154
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    iget v3, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->surfaceHeight:I

    .line 161
    .line 162
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    const-string v3, "VideoFrameRender"

    .line 170
    .line 171
    invoke-static {v3, v2}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    iget v2, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->surfaceWidth:I

    .line 175
    .line 176
    if-ne v0, v2, :cond_2

    .line 177
    .line 178
    iget v2, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->surfaceHeight:I

    .line 179
    .line 180
    if-eq v1, v2, :cond_1

    .line 181
    .line 182
    goto :goto_1

    .line 183
    :cond_1
    return-void

    .line 184
    :cond_2
    :goto_1
    iput v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->surfaceWidth:I

    .line 185
    .line 186
    iput v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->surfaceHeight:I

    .line 187
    .line 188
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 189
    .line 190
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-interface {p0, v0, v1}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    :cond_3
    const/4 v0, 0x0

    .line 199
    iput v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->surfaceHeight:I

    .line 200
    .line 201
    iput v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->surfaceWidth:I

    .line 202
    .line 203
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 204
    .line 205
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-interface {p0}, Landroid/view/SurfaceHolder;->setSizeFromLayout()V

    .line 210
    .line 211
    .line 212
    return-void
.end method


# virtual methods
.method public consumeByteArrayFrame([BLjava/nio/ByteBuffer;IIIIJ)V
    .locals 7
    .param p2    # Ljava/nio/ByteBuffer;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object p2, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->I420:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eq p3, p2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    move-object v0, p0

    .line 11
    move-object v1, p1

    .line 12
    move v2, p4

    .line 13
    move v3, p5

    .line 14
    move v4, p6

    .line 15
    move-wide v5, p7

    .line 16
    invoke-direct/range {v0 .. v6}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->renderI420Frame([BIIIJ)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public consumeByteBufferFrame(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIJ)V
    .locals 7
    .param p2    # Ljava/nio/ByteBuffer;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object p2, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->I420:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eq p3, p2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    move-object v0, p0

    .line 11
    move-object v1, p1

    .line 12
    move v2, p4

    .line 13
    move v3, p5

    .line 14
    move v4, p6

    .line 15
    move-wide v5, p7

    .line 16
    invoke-direct/range {v0 .. v6}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->renderI420Frame(Ljava/nio/ByteBuffer;IIIJ)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public consumeTextureFrame(ILjava/nio/ByteBuffer;IIIIJ[F)V
    .locals 10
    .param p2    # Ljava/nio/ByteBuffer;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object p2, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->I420:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eq p3, p2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p2, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureProcessLock:Ljava/lang/Object;

    .line 11
    .line 12
    monitor-enter p2

    .line 13
    :try_start_0
    iget-object p3, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureProcessLooper:Landroid/os/Looper;

    .line 14
    .line 15
    if-nez p3, :cond_1

    .line 16
    .line 17
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    iput-object p3, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureProcessLooper:Landroid/os/Looper;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception v0

    .line 25
    move-object p0, v0

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    :goto_0
    sget-object v2, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->RGB:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 28
    .line 29
    iget-object v9, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureProcessLooper:Landroid/os/Looper;

    .line 30
    .line 31
    move-object v0, p0

    .line 32
    move v1, p1

    .line 33
    move v3, p4

    .line 34
    move v4, p5

    .line 35
    move/from16 v5, p6

    .line 36
    .line 37
    move-wide/from16 v6, p7

    .line 38
    .line 39
    move-object/from16 v8, p9

    .line 40
    .line 41
    invoke-direct/range {v0 .. v9}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->renderTextureFrame(ILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;IIIJ[FLandroid/os/Looper;)V

    .line 42
    .line 43
    .line 44
    monitor-exit p2

    .line 45
    return-void

    .line 46
    :goto_1
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    throw p0
.end method

.method public consumeVideoFrame(Lcom/ss/bytertc/engine/video/IVideoFrame;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Lcom/ss/bytertc/engine/video/IVideoFrame;->bufferType()Lcom/ss/bytertc/engine/data/VideoBufferType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoBufferType;->GL_TEXTURE:Lcom/ss/bytertc/engine/data/VideoBufferType;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureProcessLooper:Landroid/os/Looper;

    .line 10
    .line 11
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/video/converter/WebRTCConverter;->convertByteTexFrame2WebrtcTexFrame(Lcom/ss/bytertc/engine/video/IVideoFrame;Landroid/os/Looper;)Lcom/bytedance/realx/video/VideoFrame;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-interface {p1}, Lcom/ss/bytertc/engine/video/IVideoFrame;->pixelFormat()Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->I420:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 21
    .line 22
    if-ne v0, v1, :cond_1

    .line 23
    .line 24
    invoke-static {p1}, Lcom/ss/bytertc/engine/video/converter/WebRTCConverter;->convertByteI420Frame2WebrtcI420Frame(Lcom/ss/bytertc/engine/video/IVideoFrame;)Lcom/bytedance/realx/video/VideoFrame;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-interface {p1}, Lcom/ss/bytertc/engine/video/IVideoFrame;->pixelFormat()Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->RGBA:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 34
    .line 35
    if-ne v0, v1, :cond_2

    .line 36
    .line 37
    invoke-static {p1}, Lcom/ss/bytertc/engine/video/converter/WebRTCConverter;->convertByteRGBAFrame2WebrtcI420Frame(Lcom/ss/bytertc/engine/video/IVideoFrame;)Lcom/bytedance/realx/video/VideoFrame;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    goto :goto_0

    .line 42
    :cond_2
    const/4 p1, 0x0

    .line 43
    :goto_0
    if-eqz p1, :cond_3

    .line 44
    .line 45
    invoke-direct {p0, p1}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->onVideoFrame(Lcom/bytedance/realx/video/VideoFrame;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->release()V

    .line 49
    .line 50
    .line 51
    :cond_3
    return-void
.end method

.method public consumeYUVByteArrayFrame([B[B[BIIIIIIJLjava/nio/ByteBuffer;)V
    .locals 9
    .param p12    # Ljava/nio/ByteBuffer;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->frameConverter:Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;

    .line 2
    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move v4, p4

    .line 7
    move v5, p5

    .line 8
    move v6, p6

    .line 9
    move/from16 v7, p7

    .line 10
    .line 11
    move/from16 v8, p8

    .line 12
    .line 13
    invoke-virtual/range {v0 .. v8}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->convertRawYUV2ByteArray([B[B[BIIIII)Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    move-object v1, p0

    .line 18
    move/from16 v5, p9

    .line 19
    .line 20
    move v3, v7

    .line 21
    move v4, v8

    .line 22
    move-wide/from16 v6, p10

    .line 23
    .line 24
    invoke-direct/range {v1 .. v7}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->renderI420Frame(Ljava/nio/ByteBuffer;IIIJ)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public disableFpsReduction()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/EglRenderer;->disableFpsReduction()V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method

.method public init(Lcom/bytedance/realx/video/EglBase$Context;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderLock:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter v0

    .line 14
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurface:Landroid/view/Surface;

    .line 19
    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureView:Landroid/view/TextureView;

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 27
    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    monitor-exit v0

    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    iput v2, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->rotatedFrameWidth:I

    .line 35
    .line 36
    iput v2, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->rotatedFrameHeight:I

    .line 37
    .line 38
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 39
    .line 40
    instance-of v1, v1, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    new-instance v1, Landroid/os/Handler;

    .line 45
    .line 46
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 51
    .line 52
    .line 53
    new-instance v2, Ll/oel0;

    .line 54
    .line 55
    invoke-direct {v2, p0, p1}, Ll/oel0;-><init>(Lcom/ss/bytertc/engine/ui/VideoFrameRender;Lcom/bytedance/realx/video/EglBase$Context;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 63
    .line 64
    sget-object v1, Lcom/bytedance/realx/video/EglBase;->CONFIG_PLAIN:[I

    .line 65
    .line 66
    new-instance v2, Lcom/bytedance/realx/video/GlRectDrawer;

    .line 67
    .line 68
    invoke-direct {v2}, Lcom/bytedance/realx/video/GlRectDrawer;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p1, v1, v2}, Lcom/ss/bytertc/base/media/EglRenderer;->init(Lcom/bytedance/realx/video/EglBase$Context;[ILcom/bytedance/realx/video/RendererCommon$GlDrawer;)V

    .line 72
    .line 73
    .line 74
    :goto_0
    monitor-exit v0

    .line 75
    return-void

    .line 76
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    throw p0

    .line 78
    :cond_2
    const-string p0, "Already initialized"

    .line 79
    .line 80
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public onDispose()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderLock:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter v0

    .line 14
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/ss/bytertc/base/media/EglRenderer;->release()V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 25
    .line 26
    invoke-virtual {v1, v3}, Lcom/ss/bytertc/base/media/EglRenderer;->createEglSurface(Landroid/view/Surface;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_2

    .line 32
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 37
    .line 38
    invoke-virtual {v1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureView:Landroid/view/TextureView;

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureView:Landroid/view/TextureView;

    .line 47
    .line 48
    invoke-virtual {v1, v3}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureView:Landroid/view/TextureView;

    .line 52
    .line 53
    invoke-virtual {v1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglSurfaceCreatedAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 59
    .line 60
    .line 61
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mFirstFrameListenerLock:Ljava/lang/Object;

    .line 63
    .line 64
    monitor-enter v1

    .line 65
    :try_start_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mFirstVideoFrameListeners:Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 68
    .line 69
    .line 70
    monitor-exit v1

    .line 71
    return-void

    .line 72
    :catchall_1
    move-exception p0

    .line 73
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 74
    throw p0

    .line 75
    :goto_2
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 76
    throw p0

    .line 77
    :cond_3
    const-string p0, "Try to dispose an not initialized VideoFrameRender"

    .line 78
    .line 79
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public onFirstFrameRendered()V
    .locals 0

    return-void
.end method

.method public onFirstVideoFrameRender()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->notifyFristRenderCallback()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFrameResolutionChanged(III)V
    .locals 2

    .line 1
    const/16 v0, 0xb4

    .line 2
    .line 3
    if-eqz p3, :cond_1

    .line 4
    .line 5
    if-ne p3, v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v1, p2

    .line 9
    goto :goto_1

    .line 10
    :cond_1
    :goto_0
    move v1, p1

    .line 11
    :goto_1
    if-eqz p3, :cond_2

    .line 12
    .line 13
    if-ne p3, v0, :cond_3

    .line 14
    .line 15
    :cond_2
    move p1, p2

    .line 16
    :cond_3
    new-instance p2, Ll/nel0;

    .line 17
    .line 18
    invoke-direct {p2, p0, v1, p1}, Ll/nel0;-><init>(Lcom/ss/bytertc/engine/ui/VideoFrameRender;II)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, p2}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->postOrRun(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ThreadUtils;->checkIsOnMainThread()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderLock:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter p1

    .line 7
    :try_start_0
    iget-object p6, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 8
    .line 9
    if-eqz p6, :cond_0

    .line 10
    .line 11
    iget-object p6, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 12
    .line 13
    sub-int/2addr p4, p2

    .line 14
    int-to-float p2, p4

    .line 15
    sub-int/2addr p5, p3

    .line 16
    int-to-float p3, p5

    .line 17
    div-float/2addr p2, p3

    .line 18
    invoke-virtual {p6, p2}, Lcom/ss/bytertc/base/media/EglRenderer;->setLayoutAspectRatio(F)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    iget-object p2, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 25
    .line 26
    if-eqz p2, :cond_1

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->updateSurfaceSize()V

    .line 29
    .line 30
    .line 31
    :cond_1
    monitor-exit p1

    .line 32
    return-void

    .line 33
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    throw p0
.end method

.method public onStart()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mHasRenderViewAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureView:Landroid/view/TextureView;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-direct {p0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->initTextureView()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->initSurfaceView()V

    .line 31
    .line 32
    .line 33
    :cond_2
    :goto_0
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->onDispose()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setEnableHardwareScaler(Z)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ThreadUtils;->checkIsOnMainThread()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->enableFixedSize:Z

    .line 5
    .line 6
    iget-object p1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->updateSurfaceSize()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setFpsReduction(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/base/media/EglRenderer;->setFpsReduction(F)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method

.method public setFristVideoFrameRenderListener(Lcom/ss/bytertc/engine/ui/VideoFrameRender$FirstVideoFrameRenderListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mFirstFrameListenerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mFirstVideoFrameListeners:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public setMirror(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/base/media/EglRenderer;->setMirror(Z)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method

.method public setProcessTextureLopper(Landroid/os/Looper;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureProcessLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureProcessLooper:Landroid/os/Looper;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public setRenderView(Landroid/view/Surface;)V
    .locals 5

    .line 55
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglSurfaceCreatedAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mHasRenderViewAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 56
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderLock:Ljava/lang/Object;

    monitor-enter v0

    .line 58
    :try_start_0
    iput-object p1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurface:Landroid/view/Surface;

    .line 59
    new-instance v3, Lcom/ss/bytertc/base/media/EglRenderer;

    iget-object v4, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderName:Ljava/lang/String;

    invoke-direct {v3, v4}, Lcom/ss/bytertc/base/media/EglRenderer;-><init>(Ljava/lang/String;)V

    .line 60
    invoke-virtual {v3, p1}, Lcom/ss/bytertc/base/media/EglRenderer;->createEglSurface(Landroid/view/Surface;)V

    .line 61
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglSurfaceCreatedAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    return-void

    :catchall_0
    move-exception p0

    .line 63
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :cond_1
    :goto_0
    return-void
.end method

.method public setRenderView(Landroid/view/SurfaceView;Landroid/view/SurfaceHolder$Callback;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglSurfaceCreatedAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mHasRenderViewAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iput-object p1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceView:Landroid/view/SurfaceView;

    .line 23
    .line 24
    iget-object p1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderLock:Ljava/lang/Object;

    .line 25
    .line 26
    monitor-enter p1

    .line 27
    :try_start_0
    new-instance v0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderName:Ljava/lang/String;

    .line 30
    .line 31
    invoke-direct {v0, v1}, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p2}, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->setSurfaceHolderCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 35
    .line 36
    .line 37
    iget-object p2, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mSurfaceLifecycleCallbackCallback:Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;

    .line 38
    .line 39
    invoke-virtual {v0, p2}, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->setSurfaceLifecycleLisenter(Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 43
    .line 44
    iget-object p2, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 45
    .line 46
    invoke-virtual {p2, p0}, Lcom/ss/bytertc/base/media/EglRenderer;->addFristFrameListener(Lcom/ss/bytertc/base/media/EglRenderer$FirstVideoFrameRenderListener;)V

    .line 47
    .line 48
    .line 49
    monitor-exit p1

    .line 50
    return-void

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    throw p0

    .line 54
    :cond_1
    :goto_0
    return-void
.end method

.method public setRenderView(Landroid/view/TextureView;Landroid/view/TextureView$SurfaceTextureListener;)V
    .locals 3

    .line 64
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglSurfaceCreatedAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mHasRenderViewAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 65
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderLock:Ljava/lang/Object;

    monitor-enter v0

    .line 67
    :try_start_0
    iput-object p1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mTextureView:Landroid/view/TextureView;

    .line 68
    new-instance p1, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;

    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderName:Ljava/lang/String;

    invoke-direct {p1, v1}, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;-><init>(Ljava/lang/String;)V

    .line 69
    invoke-virtual {p1, p2}, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 70
    iput-object p1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 71
    iget-object p1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    invoke-virtual {p1, p0}, Lcom/ss/bytertc/base/media/EglRenderer;->addFristFrameListener(Lcom/ss/bytertc/base/media/EglRenderer$FirstVideoFrameRenderListener;)V

    .line 72
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    return-void
.end method

.method public setScalingType(Lcom/bytedance/realx/video/RendererCommon$ScalingType;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mRenderLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->mEglRenderer:Lcom/ss/bytertc/base/media/EglRenderer;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/base/media/EglRenderer;->setRenderModel(Lcom/bytedance/realx/video/RendererCommon$ScalingType;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method
