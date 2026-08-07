.class public Lcom/momocv/objecttracker/ObjectTracker;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public N:I

.field public enable_detect_loss:Z

.field public enable_detect_scale:Z

.field private mOBJ:J

.field public n:I

.field public num_orientation:I

.field public update_model:Z


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
    const-string v1, "mmcv_api_objecttracker"

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
    const/4 v0, 0x5

    .line 5
    iput v0, p0, Lcom/momocv/objecttracker/ObjectTracker;->num_orientation:I

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    iput v0, p0, Lcom/momocv/objecttracker/ObjectTracker;->n:I

    .line 9
    .line 10
    const/16 v0, 0xa

    .line 11
    .line 12
    iput v0, p0, Lcom/momocv/objecttracker/ObjectTracker;->N:I

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/momocv/objecttracker/ObjectTracker;->enable_detect_scale:Z

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput-boolean v1, p0, Lcom/momocv/objecttracker/ObjectTracker;->enable_detect_loss:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Lcom/momocv/objecttracker/ObjectTracker;->update_model:Z

    .line 21
    .line 22
    const-wide/16 v0, 0x0

    .line 23
    .line 24
    iput-wide v0, p0, Lcom/momocv/objecttracker/ObjectTracker;->mOBJ:J

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/momocv/objecttracker/ObjectTracker;->Create()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private native nativeCreate(JIIIZZZ)J
.end method

.method private static native nativeReInit(JLcom/momocv/MMFrame;Lcom/momocv/objecttracker/ObjectTrackerParams;)Z
.end method

.method private native nativeRelease(J)V
.end method

.method private static native nativeUpdate(JLcom/momocv/MMFrame;Lcom/momocv/objecttracker/ObjectTrackerParams;Lcom/momocv/objecttracker/ObjectTrackerInfo;)Z
.end method


# virtual methods
.method public declared-synchronized Create()V
    .locals 10

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/momocv/objecttracker/ObjectTracker;->Release()V

    .line 3
    .line 4
    .line 5
    iget-wide v2, p0, Lcom/momocv/objecttracker/ObjectTracker;->mOBJ:J

    .line 6
    .line 7
    iget v4, p0, Lcom/momocv/objecttracker/ObjectTracker;->num_orientation:I

    .line 8
    .line 9
    iget v5, p0, Lcom/momocv/objecttracker/ObjectTracker;->n:I

    .line 10
    .line 11
    iget v6, p0, Lcom/momocv/objecttracker/ObjectTracker;->N:I

    .line 12
    .line 13
    iget-boolean v7, p0, Lcom/momocv/objecttracker/ObjectTracker;->enable_detect_scale:Z

    .line 14
    .line 15
    iget-boolean v8, p0, Lcom/momocv/objecttracker/ObjectTracker;->enable_detect_loss:Z

    .line 16
    .line 17
    iget-boolean v9, p0, Lcom/momocv/objecttracker/ObjectTracker;->update_model:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 18
    .line 19
    move-object v1, p0

    .line 20
    :try_start_1
    invoke-direct/range {v1 .. v9}, Lcom/momocv/objecttracker/ObjectTracker;->nativeCreate(JIIIZZZ)J

    .line 21
    .line 22
    .line 23
    move-result-wide v2

    .line 24
    iput-wide v2, v1, Lcom/momocv/objecttracker/ObjectTracker;->mOBJ:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    .line 26
    monitor-exit v1

    .line 27
    return-void

    .line 28
    :catchall_0
    move-exception v0

    .line 29
    :goto_0
    move-object p0, v0

    .line 30
    goto :goto_1

    .line 31
    :catchall_1
    move-exception v0

    .line 32
    move-object v1, p0

    .line 33
    goto :goto_0

    .line 34
    :goto_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    throw p0
.end method

.method public declared-synchronized ReInit(Lcom/momocv/MMFrame;Lcom/momocv/objecttracker/ObjectTrackerParams;)Z
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momocv/objecttracker/ObjectTracker;->mOBJ:J

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
    invoke-static {v0, v1, p1, p2}, Lcom/momocv/objecttracker/ObjectTracker;->nativeReInit(JLcom/momocv/MMFrame;Lcom/momocv/objecttracker/ObjectTrackerParams;)Z

    .line 11
    .line 12
    .line 13
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    monitor-exit p0

    .line 15
    return p1

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    monitor-exit p0

    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw p1
.end method

.method public declared-synchronized Release()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momocv/objecttracker/ObjectTracker;->mOBJ:J

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
    invoke-direct {p0, v0, v1}, Lcom/momocv/objecttracker/ObjectTracker;->nativeRelease(J)V

    .line 11
    .line 12
    .line 13
    iput-wide v2, p0, Lcom/momocv/objecttracker/ObjectTracker;->mOBJ:J
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

.method public declared-synchronized Update(Lcom/momocv/MMFrame;Lcom/momocv/objecttracker/ObjectTrackerParams;Lcom/momocv/objecttracker/ObjectTrackerInfo;)Z
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momocv/objecttracker/ObjectTracker;->mOBJ:J

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
    invoke-static {v0, v1, p1, p2, p3}, Lcom/momocv/objecttracker/ObjectTracker;->nativeUpdate(JLcom/momocv/MMFrame;Lcom/momocv/objecttracker/ObjectTrackerParams;Lcom/momocv/objecttracker/ObjectTrackerInfo;)Z

    .line 11
    .line 12
    .line 13
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    monitor-exit p0

    .line 15
    return p1

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    monitor-exit p0

    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw p1
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
    invoke-virtual {p0}, Lcom/momocv/objecttracker/ObjectTracker;->Release()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
