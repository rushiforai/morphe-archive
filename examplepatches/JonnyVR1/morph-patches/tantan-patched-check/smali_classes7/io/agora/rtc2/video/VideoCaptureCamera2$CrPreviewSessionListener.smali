.class Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;
.super Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/video/VideoCaptureCamera2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CrPreviewSessionListener"
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;


# direct methods
.method private constructor <init>(Lio/agora/rtc2/video/VideoCaptureCamera2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lio/agora/rtc2/video/VideoCaptureCamera2;Lio/agora/rtc2/video/VideoCaptureCamera2$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;-><init>(Lio/agora/rtc2/video/VideoCaptureCamera2;)V

    return-void
.end method


# virtual methods
.method public onClosed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 2
    .line 3
    invoke-static {p1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$000(Lio/agora/rtc2/video/VideoCaptureCamera2;)Lio/agora/base/internal/ThreadUtils$ThreadChecker;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lio/agora/base/internal/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v0, "CrPreviewSessionListener.onClosed"

    .line 15
    .line 16
    invoke-static {p1, v0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-static {p0, p1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$802(Lio/agora/rtc2/video/VideoCaptureCamera2;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onConfigureFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 2
    .line 3
    invoke-static {p1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$000(Lio/agora/rtc2/video/VideoCaptureCamera2;)Lio/agora/base/internal/ThreadUtils$ThreadChecker;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lio/agora/base/internal/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v0, "CrPreviewSessionListener.onConfigureFailed"

    .line 15
    .line 16
    invoke-static {p1, v0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 20
    .line 21
    const/4 v0, 0x4

    .line 22
    invoke-static {p1, v0}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$600(Lio/agora/rtc2/video/VideoCaptureCamera2;I)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-static {p1, v0}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$802(Lio/agora/rtc2/video/VideoCaptureCamera2;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 32
    .line 33
    const/16 p1, 0x65

    .line 34
    .line 35
    const-string v0, "Camera session configuration error"

    .line 36
    .line 37
    invoke-virtual {p0, p1, v0}, Lio/agora/rtc2/video/VideoCapture;->onError(ILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 9

    .line 1
    const-string v0, "Fail to setup capture session"

    .line 2
    .line 3
    const-string v1, "setRepeatingRequest: "

    .line 4
    .line 5
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 6
    .line 7
    invoke-static {v2}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$000(Lio/agora/rtc2/video/VideoCaptureCamera2;)Lio/agora/base/internal/ThreadUtils$ThreadChecker;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Lio/agora/base/internal/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const-string v3, "CrPreviewSessionListener.onConfigured"

    .line 19
    .line 20
    invoke-static {v2, v3}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 24
    .line 25
    invoke-static {v2, p1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$802(Lio/agora/rtc2/video/VideoCaptureCamera2;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 26
    .line 27
    .line 28
    const/16 p1, 0x66

    .line 29
    .line 30
    :try_start_0
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 31
    .line 32
    invoke-static {v2}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$1000(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 39
    .line 40
    invoke-static {v2}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$800(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    if-eqz v2, :cond_0

    .line 45
    .line 46
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 47
    .line 48
    invoke-static {v2}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$1000(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    iget-object v4, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 53
    .line 54
    invoke-static {v4}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$1300(Lio/agora/rtc2/video/VideoCaptureCamera2;)I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    invoke-static {v2, v3, v4}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$1400(Lio/agora/rtc2/video/VideoCaptureCamera2;Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 62
    .line 63
    invoke-static {v2}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$800(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-object v3, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 68
    .line 69
    invoke-static {v3}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$1000(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    iget-object v4, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 78
    .line 79
    invoke-static {v4}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$1100(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    iget-object v5, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 84
    .line 85
    invoke-static {v5}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$1200(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/os/Handler;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    invoke-virtual {v2, v3, v4, v5}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :catch_0
    move-exception v2

    .line 94
    goto/16 :goto_2

    .line 95
    .line 96
    :catch_1
    move-exception v2

    .line 97
    goto/16 :goto_3

    .line 98
    .line 99
    :catch_2
    move-exception v2

    .line 100
    goto/16 :goto_4

    .line 101
    .line 102
    :catch_3
    move-exception v2

    .line 103
    goto/16 :goto_5

    .line 104
    .line 105
    :catch_4
    move-exception v2

    .line 106
    goto/16 :goto_6

    .line 107
    .line 108
    :cond_0
    :goto_0
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 109
    .line 110
    iget-boolean v3, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsCameraTorchStarted:Z

    .line 111
    .line 112
    const/4 v4, 0x0

    .line 113
    const/4 v5, 0x1

    .line 114
    if-nez v3, :cond_2

    .line 115
    .line 116
    iget v3, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mTorchMode:I

    .line 117
    .line 118
    if-eqz v3, :cond_2

    .line 119
    .line 120
    if-ne v3, v5, :cond_1

    .line 121
    .line 122
    move v3, v5

    .line 123
    goto :goto_1

    .line 124
    :cond_1
    move v3, v4

    .line 125
    :goto_1
    invoke-virtual {v2, v3}, Lio/agora/rtc2/video/VideoCaptureCamera2;->setTorchMode(Z)I

    .line 126
    .line 127
    .line 128
    :cond_2
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 129
    .line 130
    iget-boolean v3, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsmCameraExposureStarted:Z

    .line 131
    .line 132
    const/4 v6, 0x0

    .line 133
    if-nez v3, :cond_3

    .line 134
    .line 135
    iget-object v3, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraExposurePositions:[F

    .line 136
    .line 137
    aget v7, v3, v4

    .line 138
    .line 139
    cmpl-float v8, v7, v6

    .line 140
    .line 141
    if-lez v8, :cond_3

    .line 142
    .line 143
    aget v3, v3, v5

    .line 144
    .line 145
    cmpl-float v8, v3, v6

    .line 146
    .line 147
    if-lez v8, :cond_3

    .line 148
    .line 149
    invoke-virtual {v2, v7, v3}, Lio/agora/rtc2/video/VideoCaptureCamera2;->setExposure(FF)I

    .line 150
    .line 151
    .line 152
    :cond_3
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 153
    .line 154
    iget-boolean v3, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsmCameraFocusStarted:Z

    .line 155
    .line 156
    if-nez v3, :cond_4

    .line 157
    .line 158
    iget-object v3, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraFocusPositions:[F

    .line 159
    .line 160
    aget v4, v3, v4

    .line 161
    .line 162
    cmpl-float v7, v4, v6

    .line 163
    .line 164
    if-lez v7, :cond_4

    .line 165
    .line 166
    aget v3, v3, v5

    .line 167
    .line 168
    cmpl-float v5, v3, v6

    .line 169
    .line 170
    if-lez v5, :cond_4

    .line 171
    .line 172
    invoke-virtual {v2, v4, v3}, Lio/agora/rtc2/video/VideoCaptureCamera2;->setFocus(FF)I

    .line 173
    .line 174
    .line 175
    :cond_4
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 176
    .line 177
    iget-boolean v3, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsmCameraZoomStarted:Z

    .line 178
    .line 179
    if-nez v3, :cond_5

    .line 180
    .line 181
    iget v3, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraZoomFactor:F

    .line 182
    .line 183
    cmpl-float v4, v3, v6

    .line 184
    .line 185
    if-lez v4, :cond_5

    .line 186
    .line 187
    invoke-virtual {v2, v3}, Lio/agora/rtc2/video/VideoCaptureCamera2;->setZoom(F)I

    .line 188
    .line 189
    .line 190
    :cond_5
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 191
    .line 192
    iget-boolean v3, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsExposureCompensationStarted:Z

    .line 193
    .line 194
    if-nez v3, :cond_6

    .line 195
    .line 196
    iget v3, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraExposureCompensation:I

    .line 197
    .line 198
    if-eqz v3, :cond_6

    .line 199
    .line 200
    invoke-virtual {v2, v3}, Lio/agora/rtc2/video/VideoCaptureCamera2;->setExposureCompensation(I)I

    .line 201
    .line 202
    .line 203
    :cond_6
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 204
    .line 205
    iget-boolean v3, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsNoiseReducationStarted:Z

    .line 206
    .line 207
    if-nez v3, :cond_7

    .line 208
    .line 209
    iget v3, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraNoiseReduction:I

    .line 210
    .line 211
    if-eqz v3, :cond_7

    .line 212
    .line 213
    invoke-virtual {v2, v3}, Lio/agora/rtc2/video/VideoCaptureCamera2;->setNoiseReductionMode(I)I

    .line 214
    .line 215
    .line 216
    :cond_7
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 217
    .line 218
    iget-boolean v3, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mAutoFaceDetectFocusStarted:Z

    .line 219
    .line 220
    if-nez v3, :cond_8

    .line 221
    .line 222
    iget-boolean v3, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraAutoFaceFocus:Z

    .line 223
    .line 224
    if-eqz v3, :cond_8

    .line 225
    .line 226
    invoke-virtual {v2, v3}, Lio/agora/rtc2/video/VideoCaptureCamera2;->setAutoFaceFocus(Z)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    .line 228
    .line 229
    :cond_8
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 230
    .line 231
    const/4 v0, 0x2

    .line 232
    invoke-static {p1, v0}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$600(Lio/agora/rtc2/video/VideoCaptureCamera2;I)V

    .line 233
    .line 234
    .line 235
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 236
    .line 237
    invoke-virtual {p0}, Lio/agora/rtc2/video/VideoCapture;->onStarted()V

    .line 238
    .line 239
    .line 240
    return-void

    .line 241
    :goto_2
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v3

    .line 245
    new-instance v4, Ljava/lang/StringBuilder;

    .line 246
    .line 247
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    invoke-static {v3, v1}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 265
    .line 266
    invoke-virtual {p0, p1, v0}, Lio/agora/rtc2/video/VideoCapture;->onError(ILjava/lang/String;)V

    .line 267
    .line 268
    .line 269
    return-void

    .line 270
    :goto_3
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v3

    .line 274
    new-instance v4, Ljava/lang/StringBuilder;

    .line 275
    .line 276
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    invoke-static {v3, v1}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 294
    .line 295
    invoke-virtual {p0, p1, v0}, Lio/agora/rtc2/video/VideoCapture;->onError(ILjava/lang/String;)V

    .line 296
    .line 297
    .line 298
    return-void

    .line 299
    :goto_4
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v3

    .line 303
    new-instance v4, Ljava/lang/StringBuilder;

    .line 304
    .line 305
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v1

    .line 312
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    .line 314
    .line 315
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    invoke-static {v3, v1}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 323
    .line 324
    invoke-virtual {p0, p1, v0}, Lio/agora/rtc2/video/VideoCapture;->onError(ILjava/lang/String;)V

    .line 325
    .line 326
    .line 327
    return-void

    .line 328
    :goto_5
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object v3

    .line 332
    new-instance v4, Ljava/lang/StringBuilder;

    .line 333
    .line 334
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v1

    .line 341
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v1

    .line 348
    invoke-static {v3, v1}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 352
    .line 353
    invoke-virtual {p0, p1, v0}, Lio/agora/rtc2/video/VideoCapture;->onError(ILjava/lang/String;)V

    .line 354
    .line 355
    .line 356
    return-void

    .line 357
    :goto_6
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object v3

    .line 361
    new-instance v4, Ljava/lang/StringBuilder;

    .line 362
    .line 363
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 364
    .line 365
    .line 366
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v1

    .line 377
    invoke-static {v3, v1}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    .line 379
    .line 380
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$CrPreviewSessionListener;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 381
    .line 382
    invoke-virtual {p0, p1, v0}, Lio/agora/rtc2/video/VideoCapture;->onError(ILjava/lang/String;)V

    .line 383
    .line 384
    .line 385
    return-void
.end method
