.class public Lio/agora/meta/internal/MetaSceneImpl;
.super Lio/agora/meta/IMetaScene;


# static fields
.field private static final TAG:Ljava/lang/String; = "MetaSceneImpl"


# instance fields
.field private final mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mLocalUserAvatar:Lio/agora/meta/ILocalUserAvatar;

.field private mNativeHandle:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(J)V
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-direct {p0}, Lio/agora/meta/IMetaScene;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-wide p1, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    new-instance v0, Lio/agora/meta/internal/LocalUserAvatarImpl;

    invoke-direct {p0, p1, p2}, Lio/agora/meta/internal/MetaSceneImpl;->nativeGetLocalUserAvatar(J)J

    move-result-wide p1

    invoke-direct {v0, p1, p2}, Lio/agora/meta/internal/LocalUserAvatarImpl;-><init>(J)V

    iput-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mLocalUserAvatar:Lio/agora/meta/ILocalUserAvatar;

    return-void
.end method

.method private native nativeAddEventHandler(JLjava/lang/Object;)I
.end method

.method private native nativeAddSceneView(JLandroid/view/TextureView;Lio/agora/meta/SceneDisplayConfig;)I
.end method

.method private static native nativeDestroy(J)I
.end method

.method private native nativeEnableFaceCapture(JZ)I
.end method

.method private native nativeEnableSceneVideoCapture(JLandroid/view/TextureView;Z)I
.end method

.method private native nativeEnableVideoDisplay(JLjava/lang/String;Z)I
.end method

.method private native nativeEnterScene(JLio/agora/meta/EnterSceneConfig;)I
.end method

.method private native nativeGetLocalUserAvatar(J)J
.end method

.method private native nativeLeaveScene(J)I
.end method

.method private native nativePushAgoraVideoFrameToDisplay(JLjava/lang/String;I[BIIJ)I
.end method

.method private native nativePushVideoFrameToDisplay(JLjava/lang/String;Lio/agora/base/VideoFrame;)I
.end method

.method private native nativeRemoveEventHandler(JLjava/lang/Object;)I
.end method

.method private native nativeRemoveSceneView(JLandroid/view/TextureView;)I
.end method

.method private native nativeSendSceneMessage(J[B)I
.end method

.method private native nativeSetSceneParameters(JLjava/lang/String;)I
.end method


# virtual methods
.method public addEventHandler(Lio/agora/meta/IMetaSceneEventHandler;)I
    .locals 4

    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p1, "MetaScene is destroying(addEventHandler)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x8

    return p0

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    sget-object p1, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string v0, "MetaScene does not initialize or it may be destroyed (addEventHandler)"

    invoke-static {p1, v0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x7

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0, v1, p1}, Lio/agora/meta/internal/MetaSceneImpl;->nativeAddEventHandler(JLjava/lang/Object;)I

    move-result p1

    monitor-exit p0

    return p1

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public addSceneView(Landroid/view/TextureView;Lio/agora/meta/SceneDisplayConfig;)I
    .locals 4

    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p1, "MetaScene is destroying(addSceneView)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x8

    return p0

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    sget-object p1, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p2, "MetaScene does not initialize or it may be destroyed (addSceneView)"

    invoke-static {p1, p2}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x7

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0, v1, p1, p2}, Lio/agora/meta/internal/MetaSceneImpl;->nativeAddSceneView(JLandroid/view/TextureView;Lio/agora/meta/SceneDisplayConfig;)I

    move-result p1

    monitor-exit p0

    return p1

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public enableFaceCapture(Z)I
    .locals 4

    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p1, "MetaScene is destroying(enableFaceCapture)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x8

    return p0

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    sget-object p1, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string v0, "MetaScene does not initialize or it may be destroyed (enableFaceCapture)"

    invoke-static {p1, v0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x7

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0, v1, p1}, Lio/agora/meta/internal/MetaSceneImpl;->nativeEnableFaceCapture(JZ)I

    move-result p1

    monitor-exit p0

    return p1

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public enableSceneVideoCapture(Landroid/view/TextureView;Z)I
    .locals 4

    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p1, "MetaScene is destroying(enableSceneVideoCapture)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x8

    return p0

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    sget-object p1, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p2, "MetaScene does not initialize or it may be destroyed (enableSceneVideoCapture)"

    invoke-static {p1, p2}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x7

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0, v1, p1, p2}, Lio/agora/meta/internal/MetaSceneImpl;->nativeEnableSceneVideoCapture(JLandroid/view/TextureView;Z)I

    move-result p1

    monitor-exit p0

    return p1

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public enableVideoDisplay(Ljava/lang/String;Z)I
    .locals 4

    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p1, "MetaScene is destroying(enableVideoDisplay)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x8

    return p0

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    sget-object p1, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p2, "MetaScene does not initialize or it may be destroyed (enableVideoDisplay)"

    invoke-static {p1, p2}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x7

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0, v1, p1, p2}, Lio/agora/meta/internal/MetaSceneImpl;->nativeEnableVideoDisplay(JLjava/lang/String;Z)I

    move-result p1

    monitor-exit p0

    return p1

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public enterScene(Lio/agora/meta/EnterSceneConfig;)I
    .locals 4

    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p1, "MetaScene is destroying(enterScene)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x8

    return p0

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    sget-object p1, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string v0, "MetaScene does not initialize or it may be destroyed (enterScene)"

    invoke-static {p1, v0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x7

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0, v1, p1}, Lio/agora/meta/internal/MetaSceneImpl;->nativeEnterScene(JLio/agora/meta/EnterSceneConfig;)I

    move-result p1

    monitor-exit p0

    return p1

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getLocalUserAvatar()Lio/agora/meta/ILocalUserAvatar;
    .locals 6

    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-object p0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string v0, "MetaScene is destroying(getLocalUserAvatar)"

    invoke-static {p0, v0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-nez v0, :cond_1

    sget-object v0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string v2, "MetaScene does not initialize or it may be destroyed (getLocalUserAvatar)"

    invoke-static {v0, v2}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit p0

    return-object v1

    :catchall_0
    move-exception v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mLocalUserAvatar:Lio/agora/meta/ILocalUserAvatar;

    monitor-exit p0

    return-object v0

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public leaveScene()I
    .locals 4

    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string v0, "MetaScene is destroying(leaveScene)"

    invoke-static {p0, v0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x8

    return p0

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    sget-object v0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string v1, "MetaScene does not initialize or it may be destroyed (leaveScene)"

    invoke-static {v0, v1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, -0x7

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0, v1}, Lio/agora/meta/internal/MetaSceneImpl;->nativeLeaveScene(J)I

    move-result v0

    monitor-exit p0

    return v0

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public pushVideoFrameToDisplay(Ljava/lang/String;Lio/agora/base/VideoFrame;)I
    .locals 4

    .line 2
    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p1, "MetaScene is destroying(pushVideoFrameToDisplay(VideoFrame))"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x8

    return p0

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    sget-object p1, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p2, "MetaScene does not initialize or it may be destroyed (pushVideoFrameToDisplay)"

    invoke-static {p1, p2}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x7

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0, v1, p1, p2}, Lio/agora/meta/internal/MetaSceneImpl;->nativePushVideoFrameToDisplay(JLjava/lang/String;Lio/agora/base/VideoFrame;)I

    move-result p1

    monitor-exit p0

    return p1

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public pushVideoFrameToDisplay(Ljava/lang/String;Lio/agora/rtc2/video/AgoraVideoFrame;)I
    .locals 11

    .line 1
    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p1, "MetaScene is destroying(pushVideoFrameToDisplay(AgoraVideoFrame))"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x8

    return p0

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const-wide/16 v0, 0x0

    cmp-long v0, v2, v0

    if-nez v0, :cond_1

    :try_start_1
    sget-object p1, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p2, "MetaScene does not initialize or it may be destroyed (pushVideoFrameToDisplay)"

    invoke-static {p1, p2}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x7

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return p1

    :catchall_0
    move-exception v0

    move-object p1, v0

    move-object v1, p0

    goto :goto_1

    :cond_1
    :try_start_2
    iget v5, p2, Lio/agora/rtc2/video/AgoraVideoFrame;->format:I

    iget-object v6, p2, Lio/agora/rtc2/video/AgoraVideoFrame;->buf:[B

    iget v7, p2, Lio/agora/rtc2/video/AgoraVideoFrame;->stride:I

    iget v8, p2, Lio/agora/rtc2/video/AgoraVideoFrame;->height:I

    iget-wide v9, p2, Lio/agora/rtc2/video/AgoraVideoFrame;->timeStamp:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-object v1, p0

    move-object v4, p1

    :try_start_3
    invoke-direct/range {v1 .. v10}, Lio/agora/meta/internal/MetaSceneImpl;->nativePushAgoraVideoFrameToDisplay(JLjava/lang/String;I[BIIJ)I

    move-result p0

    monitor-exit v1

    return p0

    :catchall_1
    move-exception v0

    :goto_0
    move-object p1, v0

    goto :goto_1

    :catchall_2
    move-exception v0

    move-object v1, p0

    goto :goto_0

    :goto_1
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1
.end method

.method public release()I
    .locals 6

    iget-wide v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-wide v4, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    invoke-static {v4, v5}, Lio/agora/meta/internal/MetaSceneImpl;->nativeDestroy(J)I

    iput-wide v2, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    iget-object p0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_0
    return v1
.end method

.method public removeEventHandler(Lio/agora/meta/IMetaSceneEventHandler;)I
    .locals 4

    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p1, "MetaScene is destroying(removeEventHandler)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x8

    return p0

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    sget-object p1, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string v0, "MetaScene does not initialize or it may be destroyed (removeEventHandler)"

    invoke-static {p1, v0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x7

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0, v1, p1}, Lio/agora/meta/internal/MetaSceneImpl;->nativeRemoveEventHandler(JLjava/lang/Object;)I

    move-result p1

    monitor-exit p0

    return p1

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public removeSceneView(Landroid/view/TextureView;)I
    .locals 4

    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p1, "MetaScene is destroying(removeSceneView)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x8

    return p0

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    sget-object p1, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string v0, "MetaScene does not initialize or it may be destroyed (removeSceneView)"

    invoke-static {p1, v0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x7

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0, v1, p1}, Lio/agora/meta/internal/MetaSceneImpl;->nativeRemoveSceneView(JLandroid/view/TextureView;)I

    move-result p1

    monitor-exit p0

    return p1

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public sendSceneMessage([B)I
    .locals 4

    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p1, "MetaScene is destroying(sendSceneMessage)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x8

    return p0

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    sget-object p1, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string v0, "MetaScene does not initialize or it may be destroyed (sendSceneMessage)"

    invoke-static {p1, v0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x7

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0, v1, p1}, Lio/agora/meta/internal/MetaSceneImpl;->nativeSendSceneMessage(J[B)I

    move-result p1

    monitor-exit p0

    return p1

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setSceneParameters(Ljava/lang/String;)I
    .locals 4

    iget-object v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string p1, "MetaScene is destroying(setSceneParameters)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x8

    return p0

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lio/agora/meta/internal/MetaSceneImpl;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    sget-object p1, Lio/agora/meta/internal/MetaSceneImpl;->TAG:Ljava/lang/String;

    const-string v0, "MetaScene does not initialize or it may be destroyed (setSceneParameters)"

    invoke-static {p1, v0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x7

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0, v1, p1}, Lio/agora/meta/internal/MetaSceneImpl;->nativeSetSceneParameters(JLjava/lang/String;)I

    move-result p1

    monitor-exit p0

    return p1

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
