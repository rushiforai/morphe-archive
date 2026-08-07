.class public Lcom/momocv/flowextent/FlowExtent;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mOBJPtr:J


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
    const-string v1, "mmcv_api_flowextent"

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
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momocv/flowextent/FlowExtent;->mOBJPtr:J

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momocv/flowextent/FlowExtent;->Create()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private native nativeCreate()J
.end method

.method private native nativeProcessFrame(JLcom/momocv/MMFrame;Lcom/momocv/BaseParams;Lcom/momocv/flowextent/FlowExtentInfo;)Z
.end method

.method private native nativeRelease(J)V
.end method


# virtual methods
.method public declared-synchronized Create()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/momocv/flowextent/FlowExtent;->Release()V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/momocv/flowextent/FlowExtent;->nativeCreate()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iput-wide v0, p0, Lcom/momocv/flowextent/FlowExtent;->mOBJPtr:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw v0
.end method

.method public declared-synchronized ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/BaseParams;Lcom/momocv/flowextent/FlowExtentInfo;)Z
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v2, p0, Lcom/momocv/flowextent/FlowExtent;->mOBJPtr:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v0, v2, v0

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    move-object v1, p0

    .line 11
    move-object v4, p1

    .line 12
    move-object v5, p2

    .line 13
    move-object v6, p3

    .line 14
    :try_start_1
    invoke-direct/range {v1 .. v6}, Lcom/momocv/flowextent/FlowExtent;->nativeProcessFrame(JLcom/momocv/MMFrame;Lcom/momocv/BaseParams;Lcom/momocv/flowextent/FlowExtentInfo;)Z

    .line 15
    .line 16
    .line 17
    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    monitor-exit v1

    .line 19
    return p0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    :goto_0
    move-object p0, v0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    move-object v1, p0

    .line 24
    monitor-exit v1

    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :catchall_1
    move-exception v0

    .line 28
    move-object v1, p0

    .line 29
    goto :goto_0

    .line 30
    :goto_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 31
    throw p0
.end method

.method public declared-synchronized Release()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momocv/flowextent/FlowExtent;->mOBJPtr:J

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
    invoke-direct {p0, v0, v1}, Lcom/momocv/flowextent/FlowExtent;->nativeRelease(J)V

    .line 11
    .line 12
    .line 13
    iput-wide v2, p0, Lcom/momocv/flowextent/FlowExtent;->mOBJPtr:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
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
    invoke-virtual {p0}, Lcom/momocv/flowextent/FlowExtent;->Release()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
