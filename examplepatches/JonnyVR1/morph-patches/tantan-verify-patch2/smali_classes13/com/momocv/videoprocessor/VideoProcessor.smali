.class public Lcom/momocv/videoprocessor/VideoProcessor;
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
    invoke-static {}, Lcom/momocv/videoprocessor/VideoProcessor;->init()Z

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
    iput-wide v0, p0, Lcom/momocv/videoprocessor/VideoProcessor;->mOBJPtr:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/momocv/videoprocessor/VideoProcessor;->inited:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/momocv/videoprocessor/VideoProcessor;->Create()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static init()Z
    .locals 11

    .line 1
    invoke-static {}, Lcom/momocv/OsUtils;->isWindows()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const-string v2, "mmcv_api_videoprocessor"

    .line 7
    .line 8
    const-string v3, "mmcv_api_faceprocessor"

    .line 9
    .line 10
    const-string v4, "mmcv_api_facefeatures"

    .line 11
    .line 12
    const-string v5, "mmcv_api_imagequality"

    .line 13
    .line 14
    const-string v6, "mmcv_api_beauty"

    .line 15
    .line 16
    const-string v7, "mmcv_api_faceattributes"

    .line 17
    .line 18
    const-string v8, "mmcv_api_facerecognition"

    .line 19
    .line 20
    const-string v9, "mmcv_api_base"

    .line 21
    .line 22
    const-string v10, "mmcv_base"

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-static {v10}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v9}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v8}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v7}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v6}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v5}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return v1

    .line 54
    :cond_0
    :try_start_0
    const-string v0, "c++_shared"

    .line 55
    .line 56
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const-string v0, "MNN"

    .line 60
    .line 61
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const-string v0, "MNN_CL"

    .line 65
    .line 66
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const-string v0, "MNN_Express"

    .line 70
    .line 71
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v10}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v9}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v8}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v7}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v6}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v5}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    .line 100
    .line 101
    return v1

    .line 102
    :catchall_0
    move-exception v0

    .line 103
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 104
    .line 105
    .line 106
    new-instance v1, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    const-string v2, "failed to load native library"

    .line 109
    .line 110
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    const-string v1, "mmcv"

    .line 125
    .line 126
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    const/4 v0, 0x0

    .line 130
    sput-boolean v0, Lcom/momocv/videoprocessor/VideoProcessor;->initok:Z

    .line 131
    .line 132
    return v0
.end method

.method public static native nativCalcRTMatrixByLandmarks(Lcom/momocv/FacePoseParams;Lcom/momocv/FacePoseInfo;)Z
.end method

.method private static native nativeCreate()J
.end method

.method private static native nativeLoadModel(J[B[B)Z
.end method

.method private static native nativeProcessFrame(JLcom/momocv/MMFrame;Lcom/momocv/videoprocessor/VideoParams;Lcom/momocv/videoprocessor/VideoInfo;)Z
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
    sget-boolean v0, Lcom/momocv/videoprocessor/VideoProcessor;->initok:Z
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
    invoke-virtual {p0}, Lcom/momocv/videoprocessor/VideoProcessor;->Release()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/momocv/videoprocessor/VideoProcessor;->nativeCreate()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Lcom/momocv/videoprocessor/VideoProcessor;->mOBJPtr:J
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
    sget-boolean v0, Lcom/momocv/videoprocessor/VideoProcessor;->initok:Z
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
    iget-wide v0, p0, Lcom/momocv/videoprocessor/VideoProcessor;->mOBJPtr:J

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
    iget-boolean v0, p0, Lcom/momocv/videoprocessor/VideoProcessor;->inited:Z

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
    iget-wide v0, p0, Lcom/momocv/videoprocessor/VideoProcessor;->mOBJPtr:J

    .line 30
    .line 31
    invoke-static {v0, v1, p1, p2}, Lcom/momocv/videoprocessor/VideoProcessor;->nativeLoadModel(J[B[B)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput-boolean p1, p0, Lcom/momocv/videoprocessor/VideoProcessor;->inited:Z

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
    iget-boolean p1, p0, Lcom/momocv/videoprocessor/VideoProcessor;->inited:Z
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
    sget-boolean v0, Lcom/momocv/videoprocessor/VideoProcessor;->initok:Z
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
    iget-wide v0, p0, Lcom/momocv/videoprocessor/VideoProcessor;->mOBJPtr:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Lcom/momocv/videoprocessor/VideoProcessor;->inited:Z

    if-nez v2, :cond_1

    .line 49
    invoke-static {v0, v1, p1, p2}, Lcom/momocv/videoprocessor/VideoProcessor;->nativeLoadModel(J[B[B)Z

    move-result p1

    iput-boolean p1, p0, Lcom/momocv/videoprocessor/VideoProcessor;->inited:Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 50
    :cond_1
    :goto_0
    iget-boolean p1, p0, Lcom/momocv/videoprocessor/VideoProcessor;->inited:Z
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

.method public declared-synchronized ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/videoprocessor/VideoParams;Lcom/momocv/videoprocessor/VideoInfo;)Z
    .locals 11

    .line 1
    const-string v0, "crop_rect("

    .line 2
    .line 3
    const-string v1, "_frame.data_len_ < _frame.height_ * _frame.step_ / 2 * 3frame.width_ "

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    sget-boolean v2, Lcom/momocv/videoprocessor/VideoProcessor;->initok:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return v3

    .line 13
    :cond_0
    :try_start_1
    iget-wide v4, p0, Lcom/momocv/videoprocessor/VideoProcessor;->mOBJPtr:J

    .line 14
    .line 15
    const-wide/16 v6, 0x0

    .line 16
    .line 17
    cmp-long v2, v4, v6

    .line 18
    .line 19
    if-eqz v2, :cond_4

    .line 20
    .line 21
    iget-boolean v2, p0, Lcom/momocv/videoprocessor/VideoProcessor;->inited:Z

    .line 22
    .line 23
    const/4 v6, 0x1

    .line 24
    if-ne v2, v6, :cond_4

    .line 25
    .line 26
    iget v2, p1, Lcom/momocv/MMFrame;->format_:I

    .line 27
    .line 28
    const/16 v7, 0x11

    .line 29
    .line 30
    const/4 v8, 0x2

    .line 31
    const/4 v9, 0x3

    .line 32
    if-ne v2, v7, :cond_1

    .line 33
    .line 34
    iget v2, p1, Lcom/momocv/MMFrame;->data_len_:I

    .line 35
    .line 36
    iget v7, p1, Lcom/momocv/MMFrame;->height_:I

    .line 37
    .line 38
    iget v10, p1, Lcom/momocv/MMFrame;->width_:I

    .line 39
    .line 40
    mul-int/2addr v7, v10

    .line 41
    mul-int/2addr v7, v9

    .line 42
    div-int/2addr v7, v8

    .line 43
    if-eq v2, v7, :cond_1

    .line 44
    .line 45
    const-string p2, "mmcv"

    .line 46
    .line 47
    new-instance p3, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget v0, p1, Lcom/momocv/MMFrame;->width_:I

    .line 53
    .line 54
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v0, "frame.height_"

    .line 58
    .line 59
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget v0, p1, Lcom/momocv/MMFrame;->height_:I

    .line 63
    .line 64
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v0, "frame.data_len_"

    .line 68
    .line 69
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget p1, p1, Lcom/momocv/MMFrame;->data_len_:I

    .line 73
    .line 74
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    .line 83
    .line 84
    monitor-exit p0

    .line 85
    return v3

    .line 86
    :catchall_0
    move-exception p1

    .line 87
    goto/16 :goto_0

    .line 88
    .line 89
    :cond_1
    :try_start_2
    iget-object v1, p2, Lcom/momocv/BaseParams;->crop_rect:[I

    .line 90
    .line 91
    if-eqz v1, :cond_3

    .line 92
    .line 93
    array-length v2, v1

    .line 94
    const/4 v7, 0x4

    .line 95
    if-ne v2, v7, :cond_3

    .line 96
    .line 97
    aget v2, v1, v3

    .line 98
    .line 99
    aget v6, v1, v6

    .line 100
    .line 101
    aget v7, v1, v8

    .line 102
    .line 103
    aget v1, v1, v9

    .line 104
    .line 105
    if-ltz v2, :cond_2

    .line 106
    .line 107
    iget v8, p1, Lcom/momocv/MMFrame;->width_:I

    .line 108
    .line 109
    if-gt v2, v8, :cond_2

    .line 110
    .line 111
    if-ltz v6, :cond_2

    .line 112
    .line 113
    iget v9, p1, Lcom/momocv/MMFrame;->height_:I

    .line 114
    .line 115
    if-gt v6, v9, :cond_2

    .line 116
    .line 117
    add-int v10, v2, v7

    .line 118
    .line 119
    if-ltz v10, :cond_2

    .line 120
    .line 121
    if-gt v10, v8, :cond_2

    .line 122
    .line 123
    add-int v8, v6, v1

    .line 124
    .line 125
    if-ltz v8, :cond_2

    .line 126
    .line 127
    if-gt v8, v9, :cond_2

    .line 128
    .line 129
    if-lez v7, :cond_2

    .line 130
    .line 131
    if-gtz v1, :cond_3

    .line 132
    .line 133
    :cond_2
    const-string p2, "mmcv"

    .line 134
    .line 135
    new-instance p3, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v0, ","

    .line 144
    .line 145
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v0, ","

    .line 152
    .line 153
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string v0, ","

    .line 160
    .line 161
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string v0, ") out of frame("

    .line 168
    .line 169
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    iget v0, p1, Lcom/momocv/MMFrame;->width_:I

    .line 173
    .line 174
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    const-string v0, ","

    .line 178
    .line 179
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    iget p1, p1, Lcom/momocv/MMFrame;->height_:I

    .line 183
    .line 184
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string p1, ")"

    .line 188
    .line 189
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 197
    .line 198
    .line 199
    monitor-exit p0

    .line 200
    return v3

    .line 201
    :cond_3
    :try_start_3
    invoke-static {v4, v5, p1, p2, p3}, Lcom/momocv/videoprocessor/VideoProcessor;->nativeProcessFrame(JLcom/momocv/MMFrame;Lcom/momocv/videoprocessor/VideoParams;Lcom/momocv/videoprocessor/VideoInfo;)Z

    .line 202
    .line 203
    .line 204
    move-result p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 205
    monitor-exit p0

    .line 206
    return p1

    .line 207
    :cond_4
    monitor-exit p0

    .line 208
    return v3

    .line 209
    :goto_0
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 210
    throw p1
.end method

.method public declared-synchronized Release()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momocv/videoprocessor/VideoProcessor;->mOBJPtr:J

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
    invoke-static {v0, v1}, Lcom/momocv/videoprocessor/VideoProcessor;->nativeRelease(J)V

    .line 11
    .line 12
    .line 13
    iput-wide v2, p0, Lcom/momocv/videoprocessor/VideoProcessor;->mOBJPtr:J

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/momocv/videoprocessor/VideoProcessor;->inited:Z
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
    invoke-virtual {p0}, Lcom/momocv/videoprocessor/VideoProcessor;->Release()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
