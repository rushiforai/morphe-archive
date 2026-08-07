.class public Lcom/momocv/pickercover/PickerCover;
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
    invoke-static {}, Lcom/momocv/pickercover/PickerCover;->init()Z

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
    iput-wide v0, p0, Lcom/momocv/pickercover/PickerCover;->mOBJPtr:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/momocv/pickercover/PickerCover;->inited:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/momocv/pickercover/PickerCover;->Create()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static init()Z
    .locals 12

    .line 1
    invoke-static {}, Lcom/momocv/OsUtils;->isWindows()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const-string v2, "mmcv_api_pickercover"

    .line 7
    .line 8
    const-string v3, "mmcv_api_videoprocessor"

    .line 9
    .line 10
    const-string v4, "mmcv_api_faceprocessor"

    .line 11
    .line 12
    const-string v5, "mmcv_api_facefeatures"

    .line 13
    .line 14
    const-string v6, "mmcv_api_imagequality"

    .line 15
    .line 16
    const-string v7, "mmcv_api_beauty"

    .line 17
    .line 18
    const-string v8, "mmcv_api_faceattributes"

    .line 19
    .line 20
    const-string v9, "mmcv_api_facerecognition"

    .line 21
    .line 22
    const-string v10, "mmcv_api_base"

    .line 23
    .line 24
    const-string v11, "mmcv_base"

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-static {v11}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v10}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v9}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v8}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v7}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v6}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v5}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return v1

    .line 59
    :cond_0
    :try_start_0
    const-string v0, "c++_shared"

    .line 60
    .line 61
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const-string v0, "MNN"

    .line 65
    .line 66
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const-string v0, "MNN_CL"

    .line 70
    .line 71
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    const-string v0, "MNN_Express"

    .line 75
    .line 76
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v11}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v10}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v9}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v8}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v7}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v6}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-static {v5}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    .line 108
    .line 109
    return v1

    .line 110
    :catchall_0
    move-exception v0

    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    const-string v2, "failed to load native library"

    .line 114
    .line 115
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    const-string v1, "mmcv"

    .line 130
    .line 131
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    .line 133
    .line 134
    const/4 v0, 0x0

    .line 135
    sput-boolean v0, Lcom/momocv/pickercover/PickerCover;->initok:Z

    .line 136
    .line 137
    return v0
.end method

.method private native nativeCreate()J
.end method

.method private static native nativeLoadModel(J[B[B)Z
.end method

.method private native nativeProcessFrame(JLcom/momocv/MMFrame;Lcom/momocv/videoprocessor/VideoParams;Lcom/momocv/pickercover/PickerCoverInfo;)Z
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
    sget-boolean v0, Lcom/momocv/pickercover/PickerCover;->initok:Z
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
    invoke-virtual {p0}, Lcom/momocv/pickercover/PickerCover;->Release()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/momocv/pickercover/PickerCover;->nativeCreate()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Lcom/momocv/pickercover/PickerCover;->mOBJPtr:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 21
    throw v0
.end method

.method public declared-synchronized LoadModel(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-boolean v0, Lcom/momocv/pickercover/PickerCover;->initok:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/momocv/pickercover/PickerCover;->mOBJPtr:J

    .line 10
    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/momocv/pickercover/PickerCover;->inited:Z

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-static {p1}, Lcom/momocv/ReadFile2Bytes;->StringPath2Bytes(Ljava/lang/String;)[B

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p2}, Lcom/momocv/ReadFile2Bytes;->StringPath2Bytes(Ljava/lang/String;)[B

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    iget-wide v0, p0, Lcom/momocv/pickercover/PickerCover;->mOBJPtr:J

    .line 30
    .line 31
    invoke-static {v0, v1, p1, p2}, Lcom/momocv/pickercover/PickerCover;->nativeLoadModel(J[B[B)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput-boolean p1, p0, Lcom/momocv/pickercover/PickerCover;->inited:Z

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    :goto_0
    iget-boolean p1, p0, Lcom/momocv/pickercover/PickerCover;->inited:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    .line 42
    monitor-exit p0

    .line 43
    return p1

    .line 44
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 45
    throw p1
.end method

.method public declared-synchronized LoadModel([B[B)Z
    .locals 4

    monitor-enter p0

    .line 46
    :try_start_0
    sget-boolean v0, Lcom/momocv/pickercover/PickerCover;->initok:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 47
    monitor-exit p0

    const/4 p0, 0x0

    return p0

    .line 48
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/momocv/pickercover/PickerCover;->mOBJPtr:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Lcom/momocv/pickercover/PickerCover;->inited:Z

    if-nez v2, :cond_1

    .line 49
    invoke-static {v0, v1, p1, p2}, Lcom/momocv/pickercover/PickerCover;->nativeLoadModel(J[B[B)Z

    move-result p1

    iput-boolean p1, p0, Lcom/momocv/pickercover/PickerCover;->inited:Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 50
    :cond_1
    :goto_0
    iget-boolean p1, p0, Lcom/momocv/pickercover/PickerCover;->inited:Z
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

.method public declared-synchronized ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/videoprocessor/VideoParams;Lcom/momocv/pickercover/PickerCoverInfo;)Z
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-boolean v0, Lcom/momocv/pickercover/PickerCover;->initok:Z
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
    iget-wide v3, p0, Lcom/momocv/pickercover/PickerCover;->mOBJPtr:J

    .line 10
    .line 11
    const-wide/16 v5, 0x0

    .line 12
    .line 13
    cmp-long v0, v3, v5

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/momocv/pickercover/PickerCover;->inited:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    move-object v2, p0

    .line 22
    move-object v5, p1

    .line 23
    move-object v6, p2

    .line 24
    move-object v7, p3

    .line 25
    :try_start_2
    invoke-direct/range {v2 .. v7}, Lcom/momocv/pickercover/PickerCover;->nativeProcessFrame(JLcom/momocv/MMFrame;Lcom/momocv/videoprocessor/VideoParams;Lcom/momocv/pickercover/PickerCoverInfo;)Z

    .line 26
    .line 27
    .line 28
    move-result v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 29
    goto :goto_1

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    :goto_0
    move-object p0, v0

    .line 32
    goto :goto_2

    .line 33
    :cond_1
    move-object v2, p0

    .line 34
    goto :goto_1

    .line 35
    :catchall_1
    move-exception v0

    .line 36
    move-object v2, p0

    .line 37
    goto :goto_0

    .line 38
    :goto_1
    monitor-exit v2

    .line 39
    return v1

    .line 40
    :goto_2
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 41
    throw p0
.end method

.method public declared-synchronized Release()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momocv/pickercover/PickerCover;->mOBJPtr:J

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
    invoke-direct {p0, v0, v1}, Lcom/momocv/pickercover/PickerCover;->nativeRelease(J)V

    .line 11
    .line 12
    .line 13
    iput-wide v2, p0, Lcom/momocv/pickercover/PickerCover;->mOBJPtr:J

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/momocv/pickercover/PickerCover;->inited:Z
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
    invoke-virtual {p0}, Lcom/momocv/pickercover/PickerCover;->Release()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
