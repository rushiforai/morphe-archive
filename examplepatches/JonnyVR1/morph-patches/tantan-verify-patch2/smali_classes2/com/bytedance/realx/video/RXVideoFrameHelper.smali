.class public Lcom/bytedance/realx/video/RXVideoFrameHelper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;


# instance fields
.field protected nativeHandle:J

.field refCounted:Lcom/bytedance/realx/video/memory/RefObject;


# direct methods
.method private constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/bytedance/realx/video/RXVideoFrameHelper;->nativeHandle:J

    .line 5
    .line 6
    new-instance p1, Lcom/bytedance/realx/video/memory/RefObject;

    .line 7
    .line 8
    new-instance p2, Ll/xjc0;

    .line 9
    .line 10
    invoke-direct {p2, p0}, Ll/xjc0;-><init>(Lcom/bytedance/realx/video/RXVideoFrameHelper;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p1, p2}, Lcom/bytedance/realx/video/memory/RefObject;-><init>(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/bytedance/realx/video/RXVideoFrameHelper;->refCounted:Lcom/bytedance/realx/video/memory/RefObject;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Lcom/bytedance/realx/video/RXVideoFrameHelper;)V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/RXVideoFrameHelper;->nativeHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/RXVideoFrameHelper;->nativeReleaseVideoFrameHelper(J)V

    .line 10
    .line 11
    .line 12
    iput-wide v2, p0, Lcom/bytedance/realx/video/RXVideoFrameHelper;->nativeHandle:J

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static createRXVideoFrameHelperOpenGL(Landroid/opengl/EGLContext;)Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/bytedance/realx/video/EglBaseUtils;->getNativeEGLContext(Landroid/opengl/EGLContext;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/RXVideoFrameHelper;->nativeCreateRXVideoFrameHelperOpenGL(J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    new-instance p0, Lcom/bytedance/realx/video/RXVideoFrameHelper;

    .line 10
    .line 11
    invoke-direct {p0, v0, v1}, Lcom/bytedance/realx/video/RXVideoFrameHelper;-><init>(J)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method private static native nativeCreateRXVideoFrameHelperOpenGL(J)J
.end method

.method private static native nativeReleaseVideoFrameHelper(J)V
.end method


# virtual methods
.method public getNativeHandle()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/RXVideoFrameHelper;->nativeHandle:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public declared-synchronized release()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/realx/video/RXVideoFrameHelper;->refCounted:Lcom/bytedance/realx/video/memory/RefObject;

    .line 3
    .line 4
    invoke-virtual {v0}, Lcom/bytedance/realx/video/memory/RefObject;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw v0
.end method

.method public declared-synchronized retain()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/realx/video/RXVideoFrameHelper;->refCounted:Lcom/bytedance/realx/video/memory/RefObject;

    .line 3
    .line 4
    invoke-virtual {v0}, Lcom/bytedance/realx/video/memory/RefObject;->retain()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw v0
.end method
