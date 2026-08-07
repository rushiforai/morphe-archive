.class public Lcom/momocv/beauty/BeautyProcessor;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static initok:Z = true


# instance fields
.field private inited:Z

.field private mOBJPtr:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/momocv/beauty/BeautyProcessor;->init()Z

    .line 2
    .line 3
    .line 4
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
    iput-wide v0, p0, Lcom/momocv/beauty/BeautyProcessor;->mOBJPtr:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/momocv/beauty/BeautyProcessor;->inited:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/momocv/beauty/BeautyProcessor;->Create()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static drawChangeFace([F[FIIII)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Lcom/momocv/beauty/BeautyProcessor;->nativeDrawChangeFace([F[FIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static init()Z
    .locals 7

    .line 1
    invoke-static {}, Lcom/momocv/OsUtils;->isWindows()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const-string v2, "mmcv_api_beauty"

    .line 7
    .line 8
    const-string v3, "mmcv_api_faceattributes"

    .line 9
    .line 10
    const-string v4, "mmcv_api_facerecognition"

    .line 11
    .line 12
    const-string v5, "mmcv_api_base"

    .line 13
    .line 14
    const-string v6, "mmcv_base"

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-static {v6}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v5}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return v1

    .line 34
    :cond_0
    :try_start_0
    const-string v0, "c++_shared"

    .line 35
    .line 36
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string v0, "MNN"

    .line 40
    .line 41
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string v0, "MNN_CL"

    .line 45
    .line 46
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const-string v0, "MNN_Express"

    .line 50
    .line 51
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v6}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v5}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    .line 69
    return v1

    .line 70
    :catch_0
    move-exception v0

    .line 71
    new-instance v1, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v2, "failed to load native library"

    .line 74
    .line 75
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const-string v1, "mmcv"

    .line 90
    .line 91
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    const/4 v0, 0x0

    .line 95
    sput-boolean v0, Lcom/momocv/beauty/BeautyProcessor;->initok:Z

    .line 96
    .line 97
    return v0
.end method

.method private static native nativeCreate()J
.end method

.method private static native nativeDrawChangeFace([F[FIIII)V
.end method

.method private static native nativeGetWarpKeyPoints(JLcom/momocv/beauty/BeautyWarpParams;Lcom/momocv/beauty/BeautyWarpInfo;)Z
.end method

.method private static native nativeGetWarpedBodyPoints(JLcom/momocv/beauty/BodyWarpParams;Lcom/momocv/beauty/BodyWarpInfo;)Z
.end method

.method private static native nativeLoadWarpConfig(JLjava/lang/String;)Z
.end method

.method private static native nativeRelease(J)V
.end method


# virtual methods
.method public declared-synchronized Create()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-boolean v0, Lcom/momocv/beauty/BeautyProcessor;->initok:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/momocv/beauty/BeautyProcessor;->Release()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/momocv/beauty/BeautyProcessor;->nativeCreate()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Lcom/momocv/beauty/BeautyProcessor;->mOBJPtr:J

    .line 16
    .line 17
    const-wide/16 v2, 0x0

    .line 18
    .line 19
    cmp-long v0, v0, v2

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/momocv/beauty/BeautyProcessor;->inited:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    :goto_0
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 32
    throw v0
.end method

.method public declared-synchronized GetWarpKeyPoints(Lcom/momocv/beauty/BeautyWarpParams;Lcom/momocv/beauty/BeautyWarpInfo;)Z
    .locals 10

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-boolean v0, Lcom/momocv/beauty/BeautyProcessor;->initok:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return v1

    .line 9
    :cond_0
    :try_start_1
    iget-wide v2, p0, Lcom/momocv/beauty/BeautyProcessor;->mOBJPtr:J

    .line 10
    .line 11
    const-wide/16 v4, 0x0

    .line 12
    .line 13
    cmp-long v0, v2, v4

    .line 14
    .line 15
    if-eqz v0, :cond_4

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/momocv/beauty/BeautyProcessor;->inited:Z

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    if-ne v0, v2, :cond_4

    .line 21
    .line 22
    iget-object v0, p1, Lcom/momocv/beauty/BeautyWarpParams;->warp_level_group_:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    array-length v3, v0

    .line 27
    move v4, v1

    .line 28
    :goto_0
    if-ge v4, v3, :cond_2

    .line 29
    .line 30
    aget-object v5, v0, v4

    .line 31
    .line 32
    new-instance v6, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 35
    .line 36
    .line 37
    :try_start_2
    iget-object v7, v5, Lcom/momocv/beauty/XCameraWarpLevelParams;->params:Ljava/util/HashMap;

    .line 38
    .line 39
    if-eqz v7, :cond_1

    .line 40
    .line 41
    invoke-virtual {v7}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result v8

    .line 53
    if-eqz v8, :cond_1

    .line 54
    .line 55
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v8

    .line 59
    check-cast v8, Ljava/util/Map$Entry;

    .line 60
    .line 61
    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v9

    .line 65
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v8

    .line 69
    invoke-virtual {v6, v9, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :catchall_0
    move-exception v7

    .line 74
    :try_start_3
    const-string v8, "beautyProcessor"

    .line 75
    .line 76
    const-string v9, "warp params map clone error"

    .line 77
    .line 78
    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    invoke-virtual {v7}, Ljava/lang/Throwable;->printStackTrace()V

    .line 82
    .line 83
    .line 84
    :cond_1
    iput-object v6, v5, Lcom/momocv/beauty/XCameraWarpLevelParams;->params:Ljava/util/HashMap;

    .line 85
    .line 86
    add-int/lit8 v4, v4, 0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :catchall_1
    move-exception p1

    .line 90
    goto :goto_2

    .line 91
    :cond_2
    iget-wide v3, p0, Lcom/momocv/beauty/BeautyProcessor;->mOBJPtr:J

    .line 92
    .line 93
    invoke-static {v3, v4, p1, p2}, Lcom/momocv/beauty/BeautyProcessor;->nativeGetWarpKeyPoints(JLcom/momocv/beauty/BeautyWarpParams;Lcom/momocv/beauty/BeautyWarpInfo;)Z

    .line 94
    .line 95
    .line 96
    move-result p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 97
    if-eqz p1, :cond_3

    .line 98
    .line 99
    monitor-exit p0

    .line 100
    return v2

    .line 101
    :cond_3
    monitor-exit p0

    .line 102
    return v1

    .line 103
    :cond_4
    monitor-exit p0

    .line 104
    return v1

    .line 105
    :goto_2
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 106
    throw p1
.end method

.method public GetWarpedBodyPoints(Lcom/momocv/beauty/BodyWarpParams;Lcom/momocv/beauty/BodyWarpInfo;)Z
    .locals 6

    .line 1
    sget-boolean v0, Lcom/momocv/beauty/BeautyProcessor;->initok:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-wide v2, p0, Lcom/momocv/beauty/BeautyProcessor;->mOBJPtr:J

    .line 8
    .line 9
    const-wide/16 v4, 0x0

    .line 10
    .line 11
    cmp-long v0, v2, v4

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-boolean p0, p0, Lcom/momocv/beauty/BeautyProcessor;->inited:Z

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    if-ne p0, v0, :cond_1

    .line 19
    .line 20
    invoke-static {v2, v3, p1, p2}, Lcom/momocv/beauty/BeautyProcessor;->nativeGetWarpedBodyPoints(JLcom/momocv/beauty/BodyWarpParams;Lcom/momocv/beauty/BodyWarpInfo;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    return v0

    .line 27
    :cond_1
    return v1
.end method

.method public LoadWarpConfig(Ljava/lang/String;)Z
    .locals 6

    .line 1
    sget-boolean v0, Lcom/momocv/beauty/BeautyProcessor;->initok:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-wide v2, p0, Lcom/momocv/beauty/BeautyProcessor;->mOBJPtr:J

    .line 8
    .line 9
    const-wide/16 v4, 0x0

    .line 10
    .line 11
    cmp-long v0, v2, v4

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-boolean p0, p0, Lcom/momocv/beauty/BeautyProcessor;->inited:Z

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    if-ne p0, v0, :cond_1

    .line 19
    .line 20
    invoke-static {v2, v3, p1}, Lcom/momocv/beauty/BeautyProcessor;->nativeLoadWarpConfig(JLjava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    return v0

    .line 27
    :cond_1
    return v1
.end method

.method public declared-synchronized Release()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momocv/beauty/BeautyProcessor;->mOBJPtr:J

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
    invoke-static {v0, v1}, Lcom/momocv/beauty/BeautyProcessor;->nativeRelease(J)V

    .line 11
    .line 12
    .line 13
    iput-wide v2, p0, Lcom/momocv/beauty/BeautyProcessor;->mOBJPtr:J

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/momocv/beauty/BeautyProcessor;->inited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

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
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :goto_1
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
    invoke-virtual {p0}, Lcom/momocv/beauty/BeautyProcessor;->Release()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
