.class Lcom/momo/rtcbase/CameraCapturer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/CameraCapturer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/rtcbase/CameraCapturer;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/CameraCapturer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDone(Lcom/momo/rtcbase/CameraSession;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/rtcbase/CameraCapturer;->access$000(Lcom/momo/rtcbase/CameraCapturer;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "CameraCapturer"

    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "Create session done. Switch state: "

    .line 11
    .line 12
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 16
    .line 17
    invoke-static {v2}, Lcom/momo/rtcbase/CameraCapturer;->access$100(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/momo/rtcbase/CameraCapturer;->access$300(Lcom/momo/rtcbase/CameraCapturer;)Landroid/os/Handler;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 38
    .line 39
    invoke-static {v1}, Lcom/momo/rtcbase/CameraCapturer;->access$200(Lcom/momo/rtcbase/CameraCapturer;)Ljava/lang/Runnable;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/momo/rtcbase/CameraCapturer;->access$400(Lcom/momo/rtcbase/CameraCapturer;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    monitor-enter v0

    .line 53
    :try_start_0
    iget-object v1, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 54
    .line 55
    invoke-static {v1}, Lcom/momo/rtcbase/CameraCapturer;->access$500(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CapturerObserver;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const/4 v2, 0x1

    .line 60
    invoke-interface {v1, v2}, Lcom/momo/rtcbase/CapturerObserver;->onCapturerStarted(Z)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 64
    .line 65
    const/4 v2, 0x0

    .line 66
    invoke-static {v1, v2}, Lcom/momo/rtcbase/CameraCapturer;->access$602(Lcom/momo/rtcbase/CameraCapturer;Z)Z

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 70
    .line 71
    invoke-static {v1, p1}, Lcom/momo/rtcbase/CameraCapturer;->access$702(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraSession;)Lcom/momo/rtcbase/CameraSession;

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 75
    .line 76
    new-instance v1, Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;

    .line 77
    .line 78
    invoke-static {p1}, Lcom/momo/rtcbase/CameraCapturer;->access$900(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    iget-object v4, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 83
    .line 84
    invoke-static {v4}, Lcom/momo/rtcbase/CameraCapturer;->access$1000(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraEventsHandler;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-direct {v1, v3, v4}, Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;-><init>(Lcom/momo/rtcbase/SurfaceTextureHelper;Lcom/momo/rtcbase/CameraVideoCapturer$CameraEventsHandler;)V

    .line 89
    .line 90
    .line 91
    invoke-static {p1, v1}, Lcom/momo/rtcbase/CameraCapturer;->access$802(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 95
    .line 96
    invoke-static {p1, v2}, Lcom/momo/rtcbase/CameraCapturer;->access$1102(Lcom/momo/rtcbase/CameraCapturer;Z)Z

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 100
    .line 101
    invoke-static {p1}, Lcom/momo/rtcbase/CameraCapturer;->access$400(Lcom/momo/rtcbase/CameraCapturer;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 109
    .line 110
    invoke-static {p1}, Lcom/momo/rtcbase/CameraCapturer;->access$100(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    sget-object v1, Lcom/momo/rtcbase/CameraCapturer$SwitchState;->IN_PROGRESS:Lcom/momo/rtcbase/CameraCapturer$SwitchState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    .line 116
    iget-object v2, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 117
    .line 118
    if-ne p1, v1, :cond_0

    .line 119
    .line 120
    :try_start_1
    sget-object p1, Lcom/momo/rtcbase/CameraCapturer$SwitchState;->IDLE:Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 121
    .line 122
    invoke-static {v2, p1}, Lcom/momo/rtcbase/CameraCapturer;->access$102(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraCapturer$SwitchState;)Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 126
    .line 127
    invoke-static {p1}, Lcom/momo/rtcbase/CameraCapturer;->access$1200(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    if-eqz p1, :cond_1

    .line 132
    .line 133
    iget-object p1, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 134
    .line 135
    invoke-static {p1}, Lcom/momo/rtcbase/CameraCapturer;->access$1200(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    iget-object v1, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 140
    .line 141
    invoke-static {v1}, Lcom/momo/rtcbase/CameraCapturer;->access$1400(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraEnumerator;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    iget-object v2, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 146
    .line 147
    invoke-static {v2}, Lcom/momo/rtcbase/CameraCapturer;->access$1300(Lcom/momo/rtcbase/CameraCapturer;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-interface {v1, v2}, Lcom/momo/rtcbase/CameraEnumerator;->isFrontFacing(Ljava/lang/String;)Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    invoke-interface {p1, v1}, Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;->onCameraSwitchDone(Z)V

    .line 156
    .line 157
    .line 158
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 159
    .line 160
    const/4 p1, 0x0

    .line 161
    invoke-static {p0, p1}, Lcom/momo/rtcbase/CameraCapturer;->access$1202(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;

    .line 162
    .line 163
    .line 164
    goto :goto_0

    .line 165
    :catchall_0
    move-exception p0

    .line 166
    goto :goto_1

    .line 167
    :cond_0
    invoke-static {v2}, Lcom/momo/rtcbase/CameraCapturer;->access$100(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    sget-object v1, Lcom/momo/rtcbase/CameraCapturer$SwitchState;->PENDING:Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 172
    .line 173
    if-ne p1, v1, :cond_1

    .line 174
    .line 175
    iget-object p1, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 176
    .line 177
    sget-object v1, Lcom/momo/rtcbase/CameraCapturer$SwitchState;->IDLE:Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 178
    .line 179
    invoke-static {p1, v1}, Lcom/momo/rtcbase/CameraCapturer;->access$102(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraCapturer$SwitchState;)Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 180
    .line 181
    .line 182
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 183
    .line 184
    invoke-static {p0}, Lcom/momo/rtcbase/CameraCapturer;->access$1200(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-static {p0, p1}, Lcom/momo/rtcbase/CameraCapturer;->access$1500(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)V

    .line 189
    .line 190
    .line 191
    :cond_1
    :goto_0
    monitor-exit v0

    .line 192
    return-void

    .line 193
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 194
    throw p0
.end method

.method public onFailure(Lcom/momo/rtcbase/CameraSession$FailureType;Ljava/lang/String;)V
    .locals 5

    .line 1
    const-string v0, "Opening camera failed, retry: "

    .line 2
    .line 3
    const-string v1, "Opening camera failed, passing: "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 6
    .line 7
    invoke-static {v2}, Lcom/momo/rtcbase/CameraCapturer;->access$000(Lcom/momo/rtcbase/CameraCapturer;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 11
    .line 12
    invoke-static {v2}, Lcom/momo/rtcbase/CameraCapturer;->access$300(Lcom/momo/rtcbase/CameraCapturer;)Landroid/os/Handler;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget-object v3, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 17
    .line 18
    invoke-static {v3}, Lcom/momo/rtcbase/CameraCapturer;->access$200(Lcom/momo/rtcbase/CameraCapturer;)Ljava/lang/Runnable;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 26
    .line 27
    invoke-static {v2}, Lcom/momo/rtcbase/CameraCapturer;->access$400(Lcom/momo/rtcbase/CameraCapturer;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    monitor-enter v2

    .line 32
    :try_start_0
    iget-object v3, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 33
    .line 34
    invoke-static {v3}, Lcom/momo/rtcbase/CameraCapturer;->access$500(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CapturerObserver;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const/4 v4, 0x0

    .line 39
    invoke-interface {v3, v4}, Lcom/momo/rtcbase/CapturerObserver;->onCapturerStarted(Z)V

    .line 40
    .line 41
    .line 42
    iget-object v3, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 43
    .line 44
    invoke-static {v3}, Lcom/momo/rtcbase/CameraCapturer;->access$1610(Lcom/momo/rtcbase/CameraCapturer;)I

    .line 45
    .line 46
    .line 47
    iget-object v3, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 48
    .line 49
    invoke-static {v3}, Lcom/momo/rtcbase/CameraCapturer;->access$1600(Lcom/momo/rtcbase/CameraCapturer;)I

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
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 73
    .line 74
    invoke-static {v0, v4}, Lcom/momo/rtcbase/CameraCapturer;->access$602(Lcom/momo/rtcbase/CameraCapturer;Z)Z

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 78
    .line 79
    invoke-static {v0}, Lcom/momo/rtcbase/CameraCapturer;->access$400(Lcom/momo/rtcbase/CameraCapturer;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 87
    .line 88
    invoke-static {v0}, Lcom/momo/rtcbase/CameraCapturer;->access$100(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    sget-object v1, Lcom/momo/rtcbase/CameraCapturer$SwitchState;->IDLE:Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 93
    .line 94
    if-eq v0, v1, :cond_1

    .line 95
    .line 96
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 97
    .line 98
    invoke-static {v0}, Lcom/momo/rtcbase/CameraCapturer;->access$1200(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    if-eqz v0, :cond_0

    .line 103
    .line 104
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 105
    .line 106
    invoke-static {v0}, Lcom/momo/rtcbase/CameraCapturer;->access$1200(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-interface {v0, p2}, Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;->onCameraSwitchError(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 114
    .line 115
    const/4 v3, 0x0

    .line 116
    invoke-static {v0, v3}, Lcom/momo/rtcbase/CameraCapturer;->access$1202(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;

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
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 123
    .line 124
    invoke-static {v0, v1}, Lcom/momo/rtcbase/CameraCapturer;->access$102(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraCapturer$SwitchState;)Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 125
    .line 126
    .line 127
    :cond_1
    sget-object v0, Lcom/momo/rtcbase/CameraSession$FailureType;->DISCONNECTED:Lcom/momo/rtcbase/CameraSession$FailureType;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    .line 129
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 130
    .line 131
    if-ne p1, v0, :cond_2

    .line 132
    .line 133
    :try_start_1
    invoke-static {p0}, Lcom/momo/rtcbase/CameraCapturer;->access$1000(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraEventsHandler;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-interface {p0}, Lcom/momo/rtcbase/CameraVideoCapturer$CameraEventsHandler;->onCameraDisconnected()V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_2
    invoke-static {p0}, Lcom/momo/rtcbase/CameraCapturer;->access$1000(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraEventsHandler;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-interface {p0, p2}, Lcom/momo/rtcbase/CameraVideoCapturer$CameraEventsHandler;->onCameraError(Ljava/lang/String;)V

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
    invoke-static {p1, p2}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer$1;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 167
    .line 168
    const/16 p1, 0x1f4

    .line 169
    .line 170
    invoke-static {p0, p1}, Lcom/momo/rtcbase/CameraCapturer;->access$1700(Lcom/momo/rtcbase/CameraCapturer;I)V

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
