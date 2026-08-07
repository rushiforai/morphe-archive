.class Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/media/camera/CameraCapturer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDone(Lcom/ss/bytertc/base/media/camera/CameraSession;)V
    .locals 5

    .line 1
    const-string v0, "Create session done. Switch state: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$000(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$200(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Landroid/os/Handler;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 15
    .line 16
    invoke-static {v2}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Runnable;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 24
    .line 25
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    monitor-enter v1

    .line 30
    :try_start_0
    const-string v2, "CameraCapturer"

    .line 31
    .line 32
    new-instance v3, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$400(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    if-eqz p1, :cond_0

    .line 54
    .line 55
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$500(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-interface {p1, v0}, Lcom/ss/bytertc/base/media/camera/CameraSession;->setOrientationMode(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catchall_0
    move-exception p0

    .line 66
    goto/16 :goto_2

    .line 67
    .line 68
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 69
    .line 70
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$600(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const/4 v2, 0x1

    .line 75
    invoke-interface {v0, v2}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerStarted(Z)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 79
    .line 80
    const/4 v2, 0x0

    .line 81
    invoke-static {v0, v2}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$702(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Z)Z

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 85
    .line 86
    invoke-static {v0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$802(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraSession;)Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 90
    .line 91
    new-instance v0, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 92
    .line 93
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1000(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    iget-object v4, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 98
    .line 99
    invoke-static {v4}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    invoke-direct {v0, v3, v4}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;-><init>(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;)V

    .line 104
    .line 105
    .line 106
    invoke-static {p1, v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$902(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 110
    .line 111
    invoke-static {p1, v2}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1202(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Z)Z

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 115
    .line 116
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 124
    .line 125
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$400(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    sget-object v0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;->IN_PROGRESS:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    .line 131
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 132
    .line 133
    if-ne p1, v0, :cond_1

    .line 134
    .line 135
    :try_start_1
    sget-object p1, Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;->IDLE:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 136
    .line 137
    invoke-static {v2, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$402(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;)Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 141
    .line 142
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    if-eqz p1, :cond_2

    .line 147
    .line 148
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 149
    .line 150
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 155
    .line 156
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1500(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraEnumerator;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 161
    .line 162
    invoke-static {v2}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1400(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    invoke-interface {v0, v2}, Lcom/ss/bytertc/base/media/camera/CameraEnumerator;->isFrontFacing(Ljava/lang/String;)Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    invoke-interface {p1, v0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;->onCameraSwitchDone(Z)V

    .line 171
    .line 172
    .line 173
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 174
    .line 175
    const/4 p1, 0x0

    .line 176
    invoke-static {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1302(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;

    .line 177
    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_1
    invoke-static {v2}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$400(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    sget-object v0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;->PENDING:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 185
    .line 186
    if-ne p1, v0, :cond_2

    .line 187
    .line 188
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 189
    .line 190
    sget-object v0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;->IDLE:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 191
    .line 192
    invoke-static {p1, v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$402(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;)Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 193
    .line 194
    .line 195
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 196
    .line 197
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    invoke-static {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1600(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V

    .line 202
    .line 203
    .line 204
    :cond_2
    :goto_1
    monitor-exit v1

    .line 205
    return-void

    .line 206
    :goto_2
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 207
    throw p0
.end method

.method public onFailure(Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;Ljava/lang/String;)V
    .locals 5

    .line 1
    const-string v0, "Opening camera failed, retry: "

    .line 2
    .line 3
    const-string v1, "Opening camera failed, passing: "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 6
    .line 7
    invoke-static {v2}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$000(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 11
    .line 12
    invoke-static {v2}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$200(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Landroid/os/Handler;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget-object v3, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 17
    .line 18
    invoke-static {v3}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Runnable;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 26
    .line 27
    invoke-static {v2}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    monitor-enter v2

    .line 32
    :try_start_0
    iget-object v3, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 33
    .line 34
    invoke-static {v3}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$600(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const/4 v4, 0x0

    .line 39
    invoke-interface {v3, v4}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerStarted(Z)V

    .line 40
    .line 41
    .line 42
    iget-object v3, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 43
    .line 44
    invoke-static {v3}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1710(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)I

    .line 45
    .line 46
    .line 47
    iget-object v3, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 48
    .line 49
    invoke-static {v3}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1700(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-gtz v3, :cond_3

    .line 54
    .line 55
    const-string v0, "CameraCapturer"

    .line 56
    .line 57
    new-instance v3, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 73
    .line 74
    invoke-static {v0, v4}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$702(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Z)Z

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 78
    .line 79
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 87
    .line 88
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$400(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    sget-object v1, Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;->IDLE:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 93
    .line 94
    if-eq v0, v1, :cond_1

    .line 95
    .line 96
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 97
    .line 98
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    if-eqz v0, :cond_0

    .line 103
    .line 104
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 105
    .line 106
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-interface {v0, p2}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;->onCameraSwitchError(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 114
    .line 115
    const/4 v3, 0x0

    .line 116
    invoke-static {v0, v3}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1302(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :catchall_0
    move-exception p0

    .line 121
    goto :goto_2

    .line 122
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 123
    .line 124
    invoke-static {v0, v1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$402(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;)Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 125
    .line 126
    .line 127
    :cond_1
    sget-object v0, Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;->DISCONNECTED:Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    .line 129
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 130
    .line 131
    if-ne p1, v0, :cond_2

    .line 132
    .line 133
    :try_start_1
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-interface {p0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;->onCameraDisconnected()V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_2
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-interface {p0, p2}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;->onCameraError(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_3
    const-string p1, "CameraCapturer"

    .line 150
    .line 151
    new-instance v1, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p2

    .line 163
    invoke-static {p1, p2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 167
    .line 168
    const/16 p1, 0x1f4

    .line 169
    .line 170
    invoke-static {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1800(Lcom/ss/bytertc/base/media/camera/CameraCapturer;I)V

    .line 171
    .line 172
    .line 173
    :goto_1
    monitor-exit v2

    .line 174
    return-void

    .line 175
    :goto_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 176
    throw p0
.end method
