.class public Lcom/momocv/datarecycle/DataRecycle;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private inited:Z

.field private mOBJPtr:J


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    invoke-static {}, Lcom/momocv/OsUtils;->isWindows()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "mmcv_api_datarecycle"

    .line 6
    .line 7
    const-string v2, "mmcv_api_videoprocessor"

    .line 8
    .line 9
    const-string v3, "mmcv_api_faceprocessor"

    .line 10
    .line 11
    const-string v4, "mmcv_api_facefeatures"

    .line 12
    .line 13
    const-string v5, "mmcv_api_imagequality"

    .line 14
    .line 15
    const-string v6, "mmcv_api_beauty"

    .line 16
    .line 17
    const-string v7, "mmcv_api_faceattributes"

    .line 18
    .line 19
    const-string v8, "mmcv_api_facerecognition"

    .line 20
    .line 21
    const-string v9, "mmcv_api_base"

    .line 22
    .line 23
    const-string v10, "mmcv_base"

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {v10}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v9}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v8}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v7}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v6}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v5}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    const-string v0, "c++_shared"

    .line 59
    .line 60
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const-string v0, "MNN"

    .line 64
    .line 65
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    const-string v0, "MNN_CL"

    .line 69
    .line 70
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    const-string v0, "MNN_Express"

    .line 74
    .line 75
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v10}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v9}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v8}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v7}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v6}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v5}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momocv/datarecycle/DataRecycle;->inited:Z

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/momocv/datarecycle/DataRecycle;->mOBJPtr:J

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/momocv/datarecycle/DataRecycle;->Create()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private Create()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momocv/datarecycle/DataRecycle;->mOBJPtr:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/momocv/datarecycle/DataRecycle;->nativeRelease(J)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-static {}, Lcom/momocv/datarecycle/DataRecycle;->nativeCreate()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    iput-wide v0, p0, Lcom/momocv/datarecycle/DataRecycle;->mOBJPtr:J

    .line 17
    .line 18
    return-void
.end method

.method private static native nativeCreate()J
.end method

.method private static native nativeLoadModel(J[B)Z
.end method

.method private static native nativeProcessFrame(JLcom/momocv/MMFrame;Lcom/momocv/BaseParams;Lcom/momocv/datarecycle/DataRecycleInfo;)Z
.end method

.method private static native nativeRelease(J)V
.end method


# virtual methods
.method public declared-synchronized LoadModel(Ljava/lang/String;)Z
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momocv/datarecycle/DataRecycle;->mOBJPtr:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v0, v0, v2

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/momocv/datarecycle/DataRecycle;->inited:Z

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-static {p1}, Lcom/momocv/ReadFile2Bytes;->StringPath2Bytes(Ljava/lang/String;)[B

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-wide v0, p0, Lcom/momocv/datarecycle/DataRecycle;->mOBJPtr:J

    .line 19
    .line 20
    invoke-static {v0, v1, p1}, Lcom/momocv/datarecycle/DataRecycle;->nativeLoadModel(J[B)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput-boolean p1, p0, Lcom/momocv/datarecycle/DataRecycle;->inited:Z

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    iget-boolean p1, p0, Lcom/momocv/datarecycle/DataRecycle;->inited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    monitor-exit p0

    .line 32
    return p1

    .line 33
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw p1
.end method

.method public declared-synchronized LoadModel([B)Z
    .locals 4

    monitor-enter p0

    .line 35
    :try_start_0
    iget-wide v0, p0, Lcom/momocv/datarecycle/DataRecycle;->mOBJPtr:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/momocv/datarecycle/DataRecycle;->inited:Z

    if-nez v2, :cond_0

    .line 36
    invoke-static {v0, v1, p1}, Lcom/momocv/datarecycle/DataRecycle;->nativeLoadModel(J[B)Z

    move-result p1

    iput-boolean p1, p0, Lcom/momocv/datarecycle/DataRecycle;->inited:Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 37
    :cond_0
    :goto_0
    iget-boolean p1, p0, Lcom/momocv/datarecycle/DataRecycle;->inited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/BaseParams;Lcom/momocv/datarecycle/DataRecycleInfo;)Z
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momocv/datarecycle/DataRecycle;->mOBJPtr:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    iget-boolean v2, p0, Lcom/momocv/datarecycle/DataRecycle;->inited:Z

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    invoke-static {v0, v1, p1, p2, p3}, Lcom/momocv/datarecycle/DataRecycle;->nativeProcessFrame(JLcom/momocv/MMFrame;Lcom/momocv/BaseParams;Lcom/momocv/datarecycle/DataRecycleInfo;)Z

    .line 15
    .line 16
    .line 17
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    const/4 p1, 0x0

    .line 22
    :goto_0
    monitor-exit p0

    .line 23
    return p1

    .line 24
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw p1
.end method

.method public declared-synchronized Release()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momocv/datarecycle/DataRecycle;->mOBJPtr:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v4, v0, v2

    .line 7
    .line 8
    if-eqz v4, :cond_0

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/momocv/datarecycle/DataRecycle;->nativeRelease(J)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    iput-wide v2, p0, Lcom/momocv/datarecycle/DataRecycle;->mOBJPtr:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
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
    invoke-virtual {p0}, Lcom/momocv/datarecycle/DataRecycle;->Release()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
