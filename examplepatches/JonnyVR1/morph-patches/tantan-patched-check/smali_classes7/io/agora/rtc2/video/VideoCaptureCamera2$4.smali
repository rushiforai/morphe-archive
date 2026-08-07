.class Lio/agora/rtc2/video/VideoCaptureCamera2$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/rtc2/video/VideoCaptureCamera2;->stopCaptureAndBlockUntilStopped()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/video/VideoCaptureCamera2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 257
    invoke-virtual {p0}, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->call()Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public call()Ljava/lang/Void;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 2
    .line 3
    invoke-static {v0}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$200(Lio/agora/rtc2/video/VideoCaptureCamera2;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :goto_0
    :try_start_0
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 9
    .line 10
    invoke-static {v1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$300(Lio/agora/rtc2/video/VideoCaptureCamera2;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x2

    .line 15
    const/4 v3, 0x3

    .line 16
    const/4 v4, 0x4

    .line 17
    if-eq v1, v2, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 20
    .line 21
    invoke-static {v1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$300(Lio/agora/rtc2/video/VideoCaptureCamera2;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eq v1, v4, :cond_0

    .line 26
    .line 27
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 28
    .line 29
    invoke-static {v1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$300(Lio/agora/rtc2/video/VideoCaptureCamera2;)I

    .line 30
    .line 31
    .line 32
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    if-eq v1, v3, :cond_0

    .line 34
    .line 35
    :try_start_1
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 36
    .line 37
    invoke-static {v1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$200(Lio/agora/rtc2/video/VideoCaptureCamera2;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto/16 :goto_8

    .line 47
    .line 48
    :catch_0
    move-exception v1

    .line 49
    :try_start_2
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    new-instance v3, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string v4, "CaptureStartedEvent: "

    .line 59
    .line 60
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-static {v2, v1}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 79
    .line 80
    invoke-static {v1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$300(Lio/agora/rtc2/video/VideoCaptureCamera2;)I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    const/4 v2, 0x0

    .line 85
    if-eq v1, v4, :cond_5

    .line 86
    .line 87
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 88
    .line 89
    invoke-static {v1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$300(Lio/agora/rtc2/video/VideoCaptureCamera2;)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-ne v1, v3, :cond_1

    .line 94
    .line 95
    goto/16 :goto_7

    .line 96
    .line 97
    :cond_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 98
    :try_start_3
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 99
    .line 100
    invoke-static {v0}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$1000(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    const/4 v3, 0x0

    .line 105
    invoke-static {v0, v1, v3}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$1400(Lio/agora/rtc2/video/VideoCaptureCamera2;Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 109
    .line 110
    invoke-static {v0}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$1200(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/os/Handler;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    new-instance v1, Lio/agora/rtc2/video/VideoCaptureCamera2$StopCaptureTask;

    .line 115
    .line 116
    iget-object v3, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 117
    .line 118
    invoke-direct {v1, v3, v2}, Lio/agora/rtc2/video/VideoCaptureCamera2$StopCaptureTask;-><init>(Lio/agora/rtc2/video/VideoCaptureCamera2;Lio/agora/rtc2/video/VideoCaptureCamera2$1;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v1}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 125
    .line 126
    invoke-static {v0}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$500(Lio/agora/rtc2/video/VideoCaptureCamera2;)Lio/agora/base/internal/ThreadUtils$ConditionVariable;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0}, Lio/agora/base/internal/ThreadUtils$ConditionVariable;->opened()Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-nez v0, :cond_2

    .line 135
    .line 136
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 137
    .line 138
    invoke-static {v0}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$500(Lio/agora/rtc2/video/VideoCaptureCamera2;)Lio/agora/base/internal/ThreadUtils$ConditionVariable;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {v0}, Lio/agora/base/internal/ThreadUtils$ConditionVariable;->block()V

    .line 143
    .line 144
    .line 145
    goto :goto_1

    .line 146
    :catchall_1
    move-exception v0

    .line 147
    goto :goto_6

    .line 148
    :catch_1
    move-exception v0

    .line 149
    goto :goto_3

    .line 150
    :cond_2
    :goto_1
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    const-string v1, "releaseCamera done!"

    .line 155
    .line 156
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 160
    .line 161
    iget-object v0, v0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 162
    .line 163
    if-eqz v0, :cond_3

    .line 164
    .line 165
    :goto_2
    invoke-interface {v0}, Lio/agora/base/internal/video/ISurfaceTextureHelper;->stopListening()V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 169
    .line 170
    iget-object v0, v0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 171
    .line 172
    invoke-interface {v0}, Lio/agora/base/internal/video/ISurfaceTextureHelper;->dispose()V

    .line 173
    .line 174
    .line 175
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 176
    .line 177
    iput-object v2, p0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 178
    .line 179
    goto :goto_5

    .line 180
    :goto_3
    :try_start_4
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 181
    .line 182
    invoke-static {v1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$400(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/hardware/camera2/CameraDevice;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 187
    .line 188
    .line 189
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 190
    .line 191
    invoke-static {v1, v2}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$402(Lio/agora/rtc2/video/VideoCaptureCamera2;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 192
    .line 193
    .line 194
    goto :goto_4

    .line 195
    :catch_2
    :try_start_5
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    const-string v3, "cameraDevice close error"

    .line 200
    .line 201
    invoke-static {v1, v3, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 202
    .line 203
    .line 204
    :goto_4
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 205
    .line 206
    iget-object v0, v0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 207
    .line 208
    if-eqz v0, :cond_3

    .line 209
    .line 210
    goto :goto_2

    .line 211
    :cond_3
    :goto_5
    return-object v2

    .line 212
    :goto_6
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 213
    .line 214
    iget-object v1, v1, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 215
    .line 216
    if-eqz v1, :cond_4

    .line 217
    .line 218
    invoke-interface {v1}, Lio/agora/base/internal/video/ISurfaceTextureHelper;->stopListening()V

    .line 219
    .line 220
    .line 221
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 222
    .line 223
    iget-object v1, v1, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 224
    .line 225
    invoke-interface {v1}, Lio/agora/base/internal/video/ISurfaceTextureHelper;->dispose()V

    .line 226
    .line 227
    .line 228
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 229
    .line 230
    iput-object v2, p0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 231
    .line 232
    :cond_4
    throw v0

    .line 233
    :cond_5
    :goto_7
    :try_start_6
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 234
    .line 235
    iget-object v1, v1, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 236
    .line 237
    if-eqz v1, :cond_6

    .line 238
    .line 239
    invoke-interface {v1}, Lio/agora/base/internal/video/ISurfaceTextureHelper;->stopListening()V

    .line 240
    .line 241
    .line 242
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 243
    .line 244
    iget-object v1, v1, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 245
    .line 246
    invoke-interface {v1}, Lio/agora/base/internal/video/ISurfaceTextureHelper;->dispose()V

    .line 247
    .line 248
    .line 249
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$4;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 250
    .line 251
    iput-object v2, p0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 252
    .line 253
    :cond_6
    monitor-exit v0

    .line 254
    return-object v2

    .line 255
    :goto_8
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 256
    throw p0
.end method
