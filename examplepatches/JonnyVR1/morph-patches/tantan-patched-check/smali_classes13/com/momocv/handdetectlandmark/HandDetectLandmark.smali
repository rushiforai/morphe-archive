.class public Lcom/momocv/handdetectlandmark/HandDetectLandmark;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private inited:Z

.field private mOBJPtr:J

.field private releasing:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/momocv/OsUtils;->isWindows()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "mmcv_api_handdetectlandmark"

    .line 6
    .line 7
    const-string v2, "mmcv_api_base"

    .line 8
    .line 9
    const-string v3, "mmcv_base"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string v0, "c++_shared"

    .line 24
    .line 25
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const-string v0, "MNN"

    .line 29
    .line 30
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string v0, "MNN_CL"

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const-string v0, "MNN_Express"

    .line 39
    .line 40
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->releasing:Z

    .line 6
    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    iput-wide v1, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->mOBJPtr:J

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->inited:Z

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->Create()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private declared-synchronized ReleaseFunctor()V
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->mOBJPtr:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v4, v0, v2

    .line 7
    .line 8
    const/4 v5, 0x0

    .line 9
    if-eqz v4, :cond_0

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->nativeRelease(J)V

    .line 12
    .line 13
    .line 14
    iput-wide v2, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->mOBJPtr:J

    .line 15
    .line 16
    iput-boolean v5, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->inited:Z

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    iput-boolean v5, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->releasing:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    monitor-exit p0

    .line 24
    return-void

    .line 25
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw v0
.end method

.method public static synthetic access$000(Lcom/momocv/handdetectlandmark/HandDetectLandmark;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->ReleaseFunctor()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static native nativeCreate()J
.end method

.method private static native nativeLoadModel(J[B)Z
.end method

.method private static native nativeProcessFrame(JLcom/momocv/MMFrame;Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;)Z
.end method

.method private static native nativeRelease(J)V
.end method


# virtual methods
.method public declared-synchronized Create()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->releasing:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-static {}, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->nativeCreate()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iput-wide v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->mOBJPtr:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v0
.end method

.method public declared-synchronized LoadModel(Ljava/lang/String;)Z
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Lcom/momocv/OsUtils;->maceSyncLoading()Z

    .line 3
    .line 4
    .line 5
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    monitor-exit p0

    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->mOBJPtr:J

    .line 12
    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-boolean v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->inited:Z

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    invoke-static {p1}, Lcom/momocv/ReadFile2Bytes;->StringPath2Bytes(Ljava/lang/String;)[B

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-wide v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->mOBJPtr:J

    .line 28
    .line 29
    invoke-static {v0, v1, p1}, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->nativeLoadModel(J[B)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput-boolean p1, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->inited:Z

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    :goto_0
    iget-boolean p1, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->inited:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    .line 40
    monitor-exit p0

    .line 41
    return p1

    .line 42
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 43
    throw p1
.end method

.method public declared-synchronized LoadModel([B)Z
    .locals 4

    monitor-enter p0

    .line 44
    :try_start_0
    invoke-static {}, Lcom/momocv/OsUtils;->maceSyncLoading()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    const/4 p0, 0x0

    return p0

    .line 45
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->mOBJPtr:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->inited:Z

    if-nez v2, :cond_1

    .line 46
    invoke-static {v0, v1, p1}, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->nativeLoadModel(J[B)Z

    move-result p1

    iput-boolean p1, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->inited:Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 47
    :cond_1
    :goto_0
    iget-boolean p1, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->inited:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public declared-synchronized ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;)Z
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Lcom/momocv/OsUtils;->maceSyncLoading()Z

    .line 3
    .line 4
    .line 5
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return v1

    .line 11
    :cond_0
    :try_start_1
    iget-wide v2, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->mOBJPtr:J

    .line 12
    .line 13
    const-wide/16 v4, 0x0

    .line 14
    .line 15
    cmp-long v0, v2, v4

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-boolean v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->inited:Z

    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    if-ne v0, v4, :cond_1

    .line 23
    .line 24
    invoke-static {v2, v3, p1, p2, p3}, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->nativeProcessFrame(JLcom/momocv/MMFrame;Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;)Z

    .line 25
    .line 26
    .line 27
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    monitor-exit p0

    .line 29
    return p1

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    monitor-exit p0

    .line 33
    return v1

    .line 34
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    throw p1
.end method

.method public declared-synchronized Release()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput-boolean v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->releasing:Z

    .line 4
    .line 5
    new-instance v0, Ljava/lang/Thread;

    .line 6
    .line 7
    new-instance v1, Lcom/momocv/handdetectlandmark/HandDetectLandmark$1;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Lcom/momocv/handdetectlandmark/HandDetectLandmark$1;-><init>(Lcom/momocv/handdetectlandmark/HandDetectLandmark;)V

    .line 10
    .line 11
    .line 12
    const-string v2, "HandDetectLandmarkRelease"

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    .line 20
    monitor-exit p0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw v0
.end method

.method public finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->Release()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
