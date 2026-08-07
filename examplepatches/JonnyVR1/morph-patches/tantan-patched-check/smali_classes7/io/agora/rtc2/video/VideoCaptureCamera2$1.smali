.class Lio/agora/rtc2/video/VideoCaptureCamera2$1;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/video/VideoCaptureCamera2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private mLastFocusedTs:J

.field final synthetic this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/video/VideoCaptureCamera2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private addRegionsToCaptureRequestBuilder(Landroid/hardware/camera2/CaptureRequest$Builder;[Landroid/hardware/camera2/params/MeteringRectangle;)V
    .locals 1

    .line 1
    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p1, p0, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 12
    .line 13
    invoke-virtual {p1, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 17
    .line 18
    invoke-virtual {p1, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p1, p2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    const/4 p2, 0x0

    .line 32
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p1, p0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p0, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private notifyCameraFocusAreaChanged(Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Landroid/graphics/RectF;

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    invoke-direct {v1, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Rect;->width()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Rect;->height()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    iget-object v4, v0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 19
    .line 20
    iget-object v4, v4, Lio/agora/rtc2/video/VideoCapture;->mCaptureFormat:Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 21
    .line 22
    iget v5, v4, Lio/agora/rtc2/video/VideoCaptureFormat;->mWidth:I

    .line 23
    .line 24
    iget v4, v4, Lio/agora/rtc2/video/VideoCaptureFormat;->mHeight:I

    .line 25
    .line 26
    const/4 v6, 0x1

    .line 27
    move v15, v5

    .line 28
    move v5, v4

    .line 29
    move v4, v15

    .line 30
    invoke-static/range {v1 .. v6}, Lio/agora/rtc2/video/CoordinatesTransform;->sensorToNormalized(Landroid/graphics/RectF;IIIIZ)Landroid/graphics/RectF;

    .line 31
    .line 32
    .line 33
    move-result-object v7

    .line 34
    iget-object v1, v0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 35
    .line 36
    iget-object v1, v1, Lio/agora/rtc2/video/VideoCaptureCamera;->mRenderView:Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;

    .line 37
    .line 38
    invoke-virtual {v1}, Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result v8

    .line 42
    iget-object v1, v0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 43
    .line 44
    iget-object v1, v1, Lio/agora/rtc2/video/VideoCaptureCamera;->mRenderView:Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;

    .line 45
    .line 46
    invoke-virtual {v1}, Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v9

    .line 50
    iget-object v1, v0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 51
    .line 52
    iget-object v1, v1, Lio/agora/rtc2/video/VideoCapture;->mCaptureFormat:Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 53
    .line 54
    invoke-virtual {v1}, Lio/agora/rtc2/video/VideoCaptureFormat;->getWidth()I

    .line 55
    .line 56
    .line 57
    move-result v10

    .line 58
    iget-object v1, v0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 59
    .line 60
    iget-object v1, v1, Lio/agora/rtc2/video/VideoCapture;->mCaptureFormat:Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 61
    .line 62
    invoke-virtual {v1}, Lio/agora/rtc2/video/VideoCaptureFormat;->getHeight()I

    .line 63
    .line 64
    .line 65
    move-result v11

    .line 66
    iget-object v1, v0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 67
    .line 68
    iget v2, v1, Lio/agora/rtc2/video/VideoCaptureCamera;->mId:I

    .line 69
    .line 70
    const/4 v3, 0x1

    .line 71
    if-ne v2, v3, :cond_0

    .line 72
    .line 73
    move v12, v3

    .line 74
    goto :goto_0

    .line 75
    :cond_0
    const/4 v4, 0x0

    .line 76
    move v12, v4

    .line 77
    :goto_0
    if-ne v2, v3, :cond_1

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_1
    const/4 v3, -0x1

    .line 81
    :goto_1
    invoke-virtual {v1}, Lio/agora/rtc2/video/VideoCapture;->getCameraRotation()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    mul-int v13, v3, v1

    .line 86
    .line 87
    iget-object v1, v0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 88
    .line 89
    iget v14, v1, Lio/agora/rtc2/video/VideoCaptureCamera;->mRenderMode:I

    .line 90
    .line 91
    invoke-static/range {v7 .. v14}, Lio/agora/rtc2/video/CoordinatesTransform;->normalizedToView(Landroid/graphics/RectF;IIIIZII)Landroid/graphics/RectF;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    if-nez v1, :cond_2

    .line 96
    .line 97
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    const-string v1, "Failed to translate coordinate from normalized to view!!"

    .line 102
    .line 103
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_2
    new-instance v2, Landroid/graphics/Rect;

    .line 108
    .line 109
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v1, v2}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, v0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 116
    .line 117
    invoke-virtual {v0, v2}, Lio/agora/rtc2/video/VideoCaptureCamera;->notifyCameraFocusAreaChanged(Landroid/graphics/Rect;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method private notifyFaceDetection(Landroid/graphics/Rect;[Landroid/hardware/camera2/params/Face;)V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    new-instance v2, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v3, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    array-length v4, v1

    .line 16
    const/4 v5, 0x0

    .line 17
    move v6, v5

    .line 18
    :goto_0
    if-ge v6, v4, :cond_5

    .line 19
    .line 20
    aget-object v7, v1, v6

    .line 21
    .line 22
    new-instance v8, Landroid/graphics/RectF;

    .line 23
    .line 24
    invoke-virtual {v7}, Landroid/hardware/camera2/params/Face;->getBounds()Landroid/graphics/Rect;

    .line 25
    .line 26
    .line 27
    move-result-object v7

    .line 28
    invoke-direct {v8, v7}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Rect;->width()I

    .line 32
    .line 33
    .line 34
    move-result v9

    .line 35
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Rect;->height()I

    .line 36
    .line 37
    .line 38
    move-result v10

    .line 39
    iget-object v7, v0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 40
    .line 41
    iget-object v7, v7, Lio/agora/rtc2/video/VideoCapture;->mCaptureFormat:Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 42
    .line 43
    iget v11, v7, Lio/agora/rtc2/video/VideoCaptureFormat;->mWidth:I

    .line 44
    .line 45
    iget v12, v7, Lio/agora/rtc2/video/VideoCaptureFormat;->mHeight:I

    .line 46
    .line 47
    const/4 v13, 0x1

    .line 48
    invoke-static/range {v8 .. v13}, Lio/agora/rtc2/video/CoordinatesTransform;->sensorToNormalized(Landroid/graphics/RectF;IIIIZ)Landroid/graphics/RectF;

    .line 49
    .line 50
    .line 51
    move-result-object v14

    .line 52
    if-nez v14, :cond_0

    .line 53
    .line 54
    goto/16 :goto_5

    .line 55
    .line 56
    :cond_0
    iget-object v7, v0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 57
    .line 58
    iget v7, v7, Lio/agora/rtc2/video/VideoCaptureCamera;->mId:I

    .line 59
    .line 60
    const/4 v8, 0x1

    .line 61
    if-ne v7, v8, :cond_1

    .line 62
    .line 63
    invoke-virtual {v14}, Landroid/graphics/RectF;->width()F

    .line 64
    .line 65
    .line 66
    move-result v7

    .line 67
    float-to-double v9, v7

    .line 68
    const-wide v11, -0x40115810624dd2f2L    # -0.958

    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->pow(DD)D

    .line 74
    .line 75
    .line 76
    move-result-wide v9

    .line 77
    const-wide v11, 0x4026795810624dd3L    # 11.237

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    :goto_1
    mul-double/2addr v9, v11

    .line 83
    goto :goto_2

    .line 84
    :cond_1
    invoke-virtual {v14}, Landroid/graphics/RectF;->height()F

    .line 85
    .line 86
    .line 87
    move-result v7

    .line 88
    float-to-double v9, v7

    .line 89
    const-wide v11, -0x4010ed916872b021L    # -0.971

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->pow(DD)D

    .line 95
    .line 96
    .line 97
    move-result-wide v9

    .line 98
    const-wide v11, 0x402d7020c49ba5e3L    # 14.719

    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    goto :goto_1

    .line 104
    :goto_2
    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    iget-object v7, v0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 112
    .line 113
    iget-object v7, v7, Lio/agora/rtc2/video/VideoCaptureCamera;->mRenderView:Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;

    .line 114
    .line 115
    invoke-virtual {v7}, Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;->getWidth()I

    .line 116
    .line 117
    .line 118
    move-result v15

    .line 119
    iget-object v7, v0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 120
    .line 121
    iget-object v7, v7, Lio/agora/rtc2/video/VideoCaptureCamera;->mRenderView:Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;

    .line 122
    .line 123
    invoke-virtual {v7}, Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;->getHeight()I

    .line 124
    .line 125
    .line 126
    move-result v16

    .line 127
    iget-object v7, v0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 128
    .line 129
    iget-object v9, v7, Lio/agora/rtc2/video/VideoCapture;->mCaptureFormat:Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 130
    .line 131
    iget v10, v9, Lio/agora/rtc2/video/VideoCaptureFormat;->mWidth:I

    .line 132
    .line 133
    iget v9, v9, Lio/agora/rtc2/video/VideoCaptureFormat;->mHeight:I

    .line 134
    .line 135
    iget v11, v7, Lio/agora/rtc2/video/VideoCaptureCamera;->mId:I

    .line 136
    .line 137
    if-ne v11, v8, :cond_2

    .line 138
    .line 139
    move/from16 v19, v8

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :cond_2
    move/from16 v19, v5

    .line 143
    .line 144
    :goto_3
    if-ne v11, v8, :cond_3

    .line 145
    .line 146
    move v11, v8

    .line 147
    goto :goto_4

    .line 148
    :cond_3
    const/4 v11, -0x1

    .line 149
    :goto_4
    invoke-virtual {v7}, Lio/agora/rtc2/video/VideoCapture;->getCameraRotation()I

    .line 150
    .line 151
    .line 152
    move-result v7

    .line 153
    mul-int v20, v11, v7

    .line 154
    .line 155
    iget-object v7, v0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 156
    .line 157
    iget v7, v7, Lio/agora/rtc2/video/VideoCaptureCamera;->mRenderMode:I

    .line 158
    .line 159
    move/from16 v21, v7

    .line 160
    .line 161
    move/from16 v18, v9

    .line 162
    .line 163
    move/from16 v17, v10

    .line 164
    .line 165
    invoke-static/range {v14 .. v21}, Lio/agora/rtc2/video/CoordinatesTransform;->normalizedToView(Landroid/graphics/RectF;IIIIZII)Landroid/graphics/RectF;

    .line 166
    .line 167
    .line 168
    move-result-object v7

    .line 169
    if-nez v7, :cond_4

    .line 170
    .line 171
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 172
    .line 173
    .line 174
    move-result v7

    .line 175
    sub-int/2addr v7, v8

    .line 176
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    goto :goto_5

    .line 180
    :cond_4
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    :goto_5
    add-int/lit8 v6, v6, 0x1

    .line 184
    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :cond_5
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    if-eqz v1, :cond_6

    .line 192
    .line 193
    return-void

    .line 194
    :cond_6
    iget-object v0, v0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 195
    .line 196
    iget-object v1, v0, Lio/agora/rtc2/video/VideoCapture;->mCaptureFormat:Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 197
    .line 198
    iget v4, v1, Lio/agora/rtc2/video/VideoCaptureFormat;->mWidth:I

    .line 199
    .line 200
    iget v1, v1, Lio/agora/rtc2/video/VideoCaptureFormat;->mHeight:I

    .line 201
    .line 202
    invoke-virtual {v0, v4, v1, v2, v3}, Lio/agora/rtc2/video/VideoCaptureCamera;->notifyFaceDetection(IILjava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 203
    .line 204
    .line 205
    return-void
.end method

.method private process(Landroid/hardware/camera2/CaptureResult;)V
    .locals 7

    .line 1
    const-string v0, "capture size wxh = "

    .line 2
    .line 3
    const-string v1, "cropRegion = "

    .line 4
    .line 5
    sget-object v2, Landroid/hardware/camera2/CaptureResult;->STATISTICS_FACES:Landroid/hardware/camera2/CaptureResult$Key;

    .line 6
    .line 7
    invoke-virtual {p1, v2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, [Landroid/hardware/camera2/params/Face;

    .line 12
    .line 13
    if-eqz v2, :cond_5

    .line 14
    .line 15
    array-length v3, v2

    .line 16
    if-lez v3, :cond_5

    .line 17
    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    iget-wide v5, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->mLastFocusedTs:J

    .line 23
    .line 24
    sub-long/2addr v3, v5

    .line 25
    const-wide/16 v5, 0xbb8

    .line 26
    .line 27
    cmp-long v3, v3, v5

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    if-gez v3, :cond_1

    .line 31
    .line 32
    aget-object v0, v2, v4

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/hardware/camera2/params/Face;->getScore()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/16 v1, 0x14

    .line 39
    .line 40
    if-le v0, v1, :cond_5

    .line 41
    .line 42
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureResult$Key;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Landroid/graphics/Rect;

    .line 49
    .line 50
    aget-object v0, v2, v4

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/hardware/camera2/params/Face;->getBounds()Landroid/graphics/Rect;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    if-eqz v0, :cond_0

    .line 57
    .line 58
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 59
    .line 60
    iget-object v1, v1, Lio/agora/rtc2/video/VideoCaptureCamera;->lastFocusAreaRect:Landroid/graphics/Rect;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_0

    .line 67
    .line 68
    invoke-direct {p0, p1, v0}, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->notifyCameraFocusAreaChanged(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 72
    .line 73
    iput-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->lastFocusAreaRect:Landroid/graphics/Rect;

    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    aget-object v3, v2, v4

    .line 77
    .line 78
    invoke-virtual {v3}, Landroid/hardware/camera2/params/Face;->getScore()I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    const/16 v5, 0x32

    .line 83
    .line 84
    if-gt v3, v5, :cond_2

    .line 85
    .line 86
    goto/16 :goto_0

    .line 87
    .line 88
    :cond_2
    iget-object v3, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 89
    .line 90
    aget-object v2, v2, v4

    .line 91
    .line 92
    invoke-virtual {v2}, Landroid/hardware/camera2/params/Face;->getBounds()Landroid/graphics/Rect;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v3, v2}, Lio/agora/rtc2/video/VideoCaptureCamera2;->clampFace(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-lez v3, :cond_5

    .line 105
    .line 106
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    if-gtz v3, :cond_3

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :cond_3
    iget-object v3, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 115
    .line 116
    invoke-static {v3}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$1000(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    new-instance v4, Landroid/hardware/camera2/params/MeteringRectangle;

    .line 121
    .line 122
    const/16 v5, 0x3e8

    .line 123
    .line 124
    invoke-direct {v4, v2, v5}, Landroid/hardware/camera2/params/MeteringRectangle;-><init>(Landroid/graphics/Rect;I)V

    .line 125
    .line 126
    .line 127
    filled-new-array {v4}, [Landroid/hardware/camera2/params/MeteringRectangle;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    invoke-direct {p0, v3, v4}, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->addRegionsToCaptureRequestBuilder(Landroid/hardware/camera2/CaptureRequest$Builder;[Landroid/hardware/camera2/params/MeteringRectangle;)V

    .line 132
    .line 133
    .line 134
    iget-object v3, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 135
    .line 136
    invoke-static {v3}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$300(Lio/agora/rtc2/video/VideoCaptureCamera2;)I

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    const/4 v4, 0x2

    .line 141
    if-eq v3, v4, :cond_4

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :cond_4
    :try_start_0
    sget-object v3, Landroid/hardware/camera2/CaptureResult;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureResult$Key;

    .line 146
    .line 147
    invoke-virtual {p1, v3}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    check-cast p1, Landroid/graphics/Rect;

    .line 152
    .line 153
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    new-instance v4, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-static {v3, v1}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    new-instance v3, Ljava/lang/StringBuilder;

    .line 177
    .line 178
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 182
    .line 183
    iget-object v0, v0, Lio/agora/rtc2/video/VideoCapture;->mCaptureFormat:Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 184
    .line 185
    invoke-virtual {v0}, Lio/agora/rtc2/video/VideoCaptureFormat;->getWidth()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    const-string v0, " x "

    .line 193
    .line 194
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 198
    .line 199
    iget-object v0, v0, Lio/agora/rtc2/video/VideoCapture;->mCaptureFormat:Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 200
    .line 201
    invoke-virtual {v0}, Lio/agora/rtc2/video/VideoCaptureFormat;->getHeight()I

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    invoke-static {v1, v0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    invoke-direct {p0, p1, v2}, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->notifyCameraFocusAreaChanged(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 216
    .line 217
    .line 218
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 219
    .line 220
    invoke-static {p1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$800(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 225
    .line 226
    invoke-static {v0}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$1000(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 235
    .line 236
    invoke-static {v1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$1100(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    const/4 v2, 0x0

    .line 241
    invoke-virtual {p1, v0, v1, v2}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 242
    .line 243
    .line 244
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 245
    .line 246
    .line 247
    move-result-wide v0

    .line 248
    iput-wide v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->mLastFocusedTs:J

    .line 249
    .line 250
    return-void

    .line 251
    :catch_0
    move-exception p0

    .line 252
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    new-instance v0, Ljava/lang/StringBuilder;

    .line 257
    .line 258
    const-string v1, "capture: "

    .line 259
    .line 260
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    invoke-static {p1, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    :cond_5
    :goto_0
    return-void
.end method


# virtual methods
.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 2

    .line 1
    sget-object p1, Landroid/hardware/camera2/CaptureResult;->SENSOR_EXPOSURE_TIME:Landroid/hardware/camera2/CaptureResult$Key;

    .line 2
    .line 3
    invoke-virtual {p3, p1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Long;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {p2, v0, v1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$902(Lio/agora/rtc2/video/VideoCaptureCamera2;J)J

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 21
    .line 22
    iget-boolean p2, p1, Lio/agora/rtc2/video/VideoCaptureCamera;->mEnableAutoFaceFocus:Z

    .line 23
    .line 24
    if-eqz p2, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->isAutoFaceFocusSupported()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    invoke-direct {p0, p3}, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->process(Landroid/hardware/camera2/CaptureResult;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 36
    .line 37
    iget-boolean p1, p1, Lio/agora/rtc2/video/VideoCaptureCamera;->mEnableFaceDetection:Z

    .line 38
    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    sget-object p1, Landroid/hardware/camera2/CaptureResult;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureResult$Key;

    .line 42
    .line 43
    invoke-virtual {p3, p1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Landroid/graphics/Rect;

    .line 48
    .line 49
    sget-object p2, Landroid/hardware/camera2/CaptureResult;->STATISTICS_FACES:Landroid/hardware/camera2/CaptureResult$Key;

    .line 50
    .line 51
    invoke-virtual {p3, p2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    check-cast p2, [Landroid/hardware/camera2/params/Face;

    .line 56
    .line 57
    invoke-direct {p0, p1, p2}, Lio/agora/rtc2/video/VideoCaptureCamera2$1;->notifyFaceDetection(Landroid/graphics/Rect;[Landroid/hardware/camera2/params/Face;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void
.end method
