.class public Lcom/p1/mobile/android/media/AudioPlayer;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/SensorEventListener;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/media/AudioPlayer$State;
    }
.end annotation


# static fields
.field private static final STANDARD_FAR_VALUE:F = 5.0f

.field public static final TAG:Ljava/lang/String; = "AudioPlayer"


# instance fields
.field private final audioManager:Landroid/media/AudioManager;

.field private final context:Landroid/content/Context;

.field private currentUri:Ljava/lang/String;

.field private errCallBack:Ljava/lang/Runnable;

.field private farValue:F

.field private headsetOn:Z

.field private isProximity:Z

.field private mediaPlayer:Landroid/media/MediaPlayer;

.field private needToPlayNext:Z

.field private pendingSeekTo:I

.field private final proximitySensor:Landroid/hardware/Sensor;

.field proximitySensorActivated:Z

.field private final proximityWakeLock:Landroid/os/PowerManager$WakeLock;

.field private final sensorManager:Landroid/hardware/SensorManager;

.field speakerOn:I

.field private state:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/android/media/AudioPlayer$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->headsetOn:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->isProximity:Z

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-object v1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->currentUri:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v2, -0x1

    .line 13
    iput v2, p0, Lcom/p1/mobile/android/media/AudioPlayer;->pendingSeekTo:I

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->needToPlayNext:Z

    .line 16
    .line 17
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iput-object v2, p0, Lcom/p1/mobile/android/media/AudioPlayer;->state:Lrx/subjects/a;

    .line 22
    .line 23
    sget-object v3, Lcom/p1/mobile/android/media/AudioPlayer$State;->stopped:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    const/high16 v2, 0x40a00000    # 5.0f

    .line 29
    .line 30
    iput v2, p0, Lcom/p1/mobile/android/media/AudioPlayer;->farValue:F

    .line 31
    .line 32
    iput v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->speakerOn:I

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->proximitySensorActivated:Z

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->context:Landroid/content/Context;

    .line 37
    .line 38
    const-string v3, "audio"

    .line 39
    .line 40
    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Landroid/media/AudioManager;

    .line 45
    .line 46
    iput-object v3, p0, Lcom/p1/mobile/android/media/AudioPlayer;->audioManager:Landroid/media/AudioManager;

    .line 47
    .line 48
    const-string v3, "power"

    .line 49
    .line 50
    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    check-cast v3, Landroid/os/PowerManager;

    .line 55
    .line 56
    const-string v4, "sensor"

    .line 57
    .line 58
    invoke-virtual {p1, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    check-cast v4, Landroid/hardware/SensorManager;

    .line 63
    .line 64
    iput-object v4, p0, Lcom/p1/mobile/android/media/AudioPlayer;->sensorManager:Landroid/hardware/SensorManager;

    .line 65
    .line 66
    const/16 v5, 0x8

    .line 67
    .line 68
    invoke-virtual {v4, v5}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    iput-object v4, p0, Lcom/p1/mobile/android/media/AudioPlayer;->proximitySensor:Landroid/hardware/Sensor;

    .line 73
    .line 74
    if-nez v4, :cond_0

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    invoke-direct {p0, v3}, Lcom/p1/mobile/android/media/AudioPlayer;->createProximityWakeLock(Landroid/os/PowerManager;)Landroid/os/PowerManager$WakeLock;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    :goto_0
    iput-object v1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->proximityWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 82
    .line 83
    if-eqz v4, :cond_2

    .line 84
    .line 85
    invoke-virtual {v4}, Landroid/hardware/Sensor;->getMaximumRange()F

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    iput v1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->farValue:F

    .line 90
    .line 91
    const/high16 v3, 0x40900000    # 4.5f

    .line 92
    .line 93
    cmpl-float v3, v1, v3

    .line 94
    .line 95
    if-ltz v3, :cond_1

    .line 96
    .line 97
    const/high16 v3, 0x41200000    # 10.0f

    .line 98
    .line 99
    cmpg-float v1, v1, v3

    .line 100
    .line 101
    if-gtz v1, :cond_1

    .line 102
    .line 103
    iput v2, p0, Lcom/p1/mobile/android/media/AudioPlayer;->farValue:F

    .line 104
    .line 105
    :cond_1
    invoke-static {}, Ll/hzd;->c()Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_2

    .line 110
    .line 111
    iget v1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->farValue:F

    .line 112
    .line 113
    cmpl-float v1, v1, v2

    .line 114
    .line 115
    if-lez v1, :cond_2

    .line 116
    .line 117
    iput v2, p0, Lcom/p1/mobile/android/media/AudioPlayer;->farValue:F

    .line 118
    .line 119
    :cond_2
    new-instance v1, Landroid/content/IntentFilter;

    .line 120
    .line 121
    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 122
    .line 123
    .line 124
    const-string v2, "android.bluetooth.device.action.ACL_CONNECTED"

    .line 125
    .line 126
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    const-string v2, "android.bluetooth.device.action.ACL_DISCONNECTED"

    .line 130
    .line 131
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    const-string v2, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 135
    .line 136
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    const-string v2, "android.intent.action.HEADSET_PLUG"

    .line 140
    .line 141
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-static {p1, p0, v1}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 145
    .line 146
    .line 147
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->isHeadsetOn()Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    iput-boolean p1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->headsetOn:Z

    .line 152
    .line 153
    iput-boolean v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->isProximity:Z

    .line 154
    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->changeState()V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/media/AudioPlayer;ILandroid/media/MediaPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/android/media/AudioPlayer;->lambda$playAndSeekTo$0(ILandroid/media/MediaPlayer;)V

    return-void
.end method

.method private acquireProximityWakeLock()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->proximityWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->proximityWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/media/AudioPlayer;Landroid/media/MediaPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/media/AudioPlayer;->lambda$playAndSeekTo$1(Landroid/media/MediaPlayer;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/media/AudioPlayer;Ljava/lang/String;Landroid/media/MediaPlayer;II)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/p1/mobile/android/media/AudioPlayer;->lambda$playAndSeekTo$2(Ljava/lang/String;Landroid/media/MediaPlayer;II)Z

    move-result p0

    return p0
.end method

.method private createProximityWakeLock(Landroid/os/PowerManager;)Landroid/os/PowerManager$WakeLock;
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InvalidWakeLockTag"
        }
    .end annotation

    .line 1
    const/16 p0, 0x20

    .line 2
    .line 3
    const-string v0, "AudioPlayer"

    .line 4
    .line 5
    invoke-virtual {p1, p0, v0}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private isHeadsetOn()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->audioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->audioManager:Landroid/media/AudioManager;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->audioManager:Landroid/media/AudioManager;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/media/AudioManager;->isBluetoothA2dpOn()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method private isStarted()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->state:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/media/AudioPlayer$State;->preparing:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 10
    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/android/media/AudioPlayer$State;->playing:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method private synthetic lambda$playAndSeekTo$0(ILandroid/media/MediaPlayer;)V
    .locals 0

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 4
    .line 5
    invoke-virtual {p2, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 6
    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    iput p1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->pendingSeekTo:I

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->changeState()V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->onPlaying()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic lambda$playAndSeekTo$1(Landroid/media/MediaPlayer;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->needToPlayNext:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->setScreenOn()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->resetStateOnFinishOrStop()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->onFinished()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic lambda$playAndSeekTo$2(Ljava/lang/String;Landroid/media/MediaPlayer;II)Z
    .locals 2

    .line 1
    new-instance p2, Ljava/lang/NullPointerException;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "audio except what = "

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p3, " extra = "

    .line 14
    .line 15
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p3, " uri = "

    .line 22
    .line 23
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-direct {p2, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->errCallBack:Ljava/lang/Runnable;

    .line 40
    .line 41
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->errCallBack:Ljava/lang/Runnable;

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 50
    .line 51
    .line 52
    :cond_0
    invoke-static {}, Ll/ecj;->E()V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x0

    .line 56
    return p0
.end method

.method private onFinished()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->state:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/media/AudioPlayer$State;->finished:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/android/media/a;->a()Lcom/p1/mobile/android/media/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->currentUri:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/android/media/a;->d(Lcom/p1/mobile/android/media/AudioPlayer$State;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private onPlaying()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->state:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/media/AudioPlayer$State;->playing:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/android/media/a;->a()Lcom/p1/mobile/android/media/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->currentUri:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/android/media/a;->d(Lcom/p1/mobile/android/media/AudioPlayer$State;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private onPreparing()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->state:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/media/AudioPlayer$State;->preparing:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/android/media/a;->a()Lcom/p1/mobile/android/media/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->currentUri:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/android/media/a;->d(Lcom/p1/mobile/android/media/AudioPlayer$State;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private onStopped()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->state:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/media/AudioPlayer$State;->stopped:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/android/media/a;->a()Lcom/p1/mobile/android/media/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->currentUri:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/android/media/a;->d(Lcom/p1/mobile/android/media/AudioPlayer$State;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private playAndSeekTo(Ljava/lang/String;I)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->currentUri:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/android/media/AudioPlayer;->pendingSeekTo:I

    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Landroid/media/MediaPlayer;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catch_0
    move-exception p1

    .line 21
    goto :goto_3

    .line 22
    :cond_1
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->isProximity:Z

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    const/4 v2, 0x3

    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->isHeadsetOn()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_3

    .line 36
    .line 37
    invoke-static {}, Ll/hzd;->a()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->audioManager:Landroid/media/AudioManager;

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->setMode(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 49
    .line 50
    const/high16 v2, 0x3f800000    # 1.0f

    .line 51
    .line 52
    invoke-virtual {v0, v2, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 53
    .line 54
    .line 55
    :cond_2
    invoke-direct {p0, v1}, Lcom/p1/mobile/android/media/AudioPlayer;->setAudioStreamType(I)V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_3
    invoke-static {}, Ll/hzd;->a()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->audioManager:Landroid/media/AudioManager;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    .line 68
    .line 69
    .line 70
    :cond_4
    invoke-direct {p0, v2}, Lcom/p1/mobile/android/media/AudioPlayer;->setAudioStreamType(I)V

    .line 71
    .line 72
    .line 73
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 74
    .line 75
    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 79
    .line 80
    new-instance v1, Ll/tb1;

    .line 81
    .line 82
    invoke-direct {v1, p0, p2}, Ll/tb1;-><init>(Lcom/p1/mobile/android/media/AudioPlayer;I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 86
    .line 87
    .line 88
    iget-object p2, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 89
    .line 90
    new-instance v0, Ll/ub1;

    .line 91
    .line 92
    invoke-direct {v0, p0}, Ll/ub1;-><init>(Lcom/p1/mobile/android/media/AudioPlayer;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p2, v0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 96
    .line 97
    .line 98
    iget-object p2, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 99
    .line 100
    new-instance v0, Ll/vb1;

    .line 101
    .line 102
    invoke-direct {v0, p0, p1}, Ll/vb1;-><init>(Lcom/p1/mobile/android/media/AudioPlayer;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p2, v0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 106
    .line 107
    .line 108
    invoke-static {}, Ll/hzd;->b()Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-eqz p1, :cond_5

    .line 113
    .line 114
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->context:Landroid/content/Context;

    .line 118
    .line 119
    const-wide/16 v0, 0x12c

    .line 120
    .line 121
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 122
    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 126
    .line 127
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 128
    .line 129
    .line 130
    :goto_2
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->onPreparing()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :goto_3
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->state:Lrx/subjects/a;

    .line 138
    .line 139
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onError(Ljava/lang/Throwable;)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method private replayAtCurrentPosition()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->currentPosition()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->getDuration()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/android/media/AudioPlayer;->currentUri:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->resetMediaPlayerAndUri()V

    .line 12
    .line 13
    .line 14
    const/16 v3, 0x2710

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    if-ge v1, v3, :cond_0

    .line 18
    .line 19
    invoke-direct {p0, v2, v4}, Lcom/p1/mobile/android/media/AudioPlayer;->playAndSeekTo(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/16 v1, 0x1388

    .line 24
    .line 25
    if-ge v0, v1, :cond_1

    .line 26
    .line 27
    invoke-direct {p0, v2, v4}, Lcom/p1/mobile/android/media/AudioPlayer;->playAndSeekTo(Ljava/lang/String;I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    sub-int/2addr v0, v1

    .line 32
    invoke-direct {p0, v2, v0}, Lcom/p1/mobile/android/media/AudioPlayer;->playAndSeekTo(Ljava/lang/String;I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private resetMediaPlayerAndUri()V
    .locals 2

    .line 1
    invoke-static {}, Ll/hzd;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->audioManager:Landroid/media/AudioManager;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 23
    .line 24
    .line 25
    :cond_1
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->currentUri:Ljava/lang/String;

    .line 27
    .line 28
    return-void
.end method

.method private setAudioStreamType(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->context:Landroid/content/Context;

    .line 6
    .line 7
    instance-of v1, v0, Landroid/app/Activity;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    check-cast v0, Landroid/app/Activity;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method


# virtual methods
.method public activateProximitySensorAndDisplayLock()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->proximitySensorActivated:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->proximitySensorActivated:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->proximitySensor:Landroid/hardware/Sensor;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->sensorManager:Landroid/hardware/SensorManager;

    .line 13
    .line 14
    const/4 v2, 0x3

    .line 15
    invoke-virtual {v1, p0, v0, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public changeState()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->isHeadsetOn()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->currentUri:Ljava/lang/String;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->activateProximitySensorAndDisplayLock()V

    .line 13
    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->setScreenOn()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->deactivateProximitySensorAndScreenLock()V

    .line 20
    .line 21
    .line 22
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->audioManager:Landroid/media/AudioManager;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroid/media/AudioManager;->setWiredHeadsetOn(Z)V

    .line 25
    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    iget-boolean v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->isProximity:Z

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_2
    const/4 v0, 0x1

    .line 35
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/media/AudioPlayer;->setSpeakerOn(Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_3
    :goto_2
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/media/AudioPlayer;->setSpeakerOn(Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public currentPosition()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->pendingSeekTo:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public deactivateProximitySensorAndScreenLock()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->proximitySensorActivated:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->proximitySensorActivated:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->proximitySensor:Landroid/hardware/Sensor;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->sensorManager:Landroid/hardware/SensorManager;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->stop()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/media/AudioPlayer;->setSpeakerOn(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->context:Landroid/content/Context;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public finish()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->resetStateOnFinishOrStop()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->onFinished()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public getDuration()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getDuration()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public obs()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/android/media/AudioPlayer$State;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->state:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    const/4 v0, -0x1

    .line 13
    sparse-switch p2, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :sswitch_0
    const-string p2, "android.bluetooth.device.action.ACL_DISCONNECTED"

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v0, 0x3

    .line 27
    goto :goto_0

    .line 28
    :sswitch_1
    const-string p2, "android.bluetooth.device.action.ACL_CONNECTED"

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v0, 0x2

    .line 38
    goto :goto_0

    .line 39
    :sswitch_2
    const-string p2, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 40
    .line 41
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 v0, 0x1

    .line 49
    goto :goto_0

    .line 50
    :sswitch_3
    const-string p2, "android.intent.action.HEADSET_PLUG"

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_3

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    const/4 v0, 0x0

    .line 60
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :pswitch_0
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->isHeadsetOn()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    iget-boolean p2, p0, Lcom/p1/mobile/android/media/AudioPlayer;->headsetOn:Z

    .line 69
    .line 70
    if-eq p2, p1, :cond_4

    .line 71
    .line 72
    iput-boolean p1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->headsetOn:Z

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->changeState()V

    .line 75
    .line 76
    .line 77
    :cond_4
    :goto_1
    return-void

    .line 78
    nop

    .line 79
    :sswitch_data_0
    .sparse-switch
        -0x63ecb970 -> :sswitch_3
        -0x5b36f014 -> :sswitch_2
        -0x11f77b4b -> :sswitch_1
        0x6c9330ef -> :sswitch_0
    .end sparse-switch

    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 2

    .line 1
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget p1, p1, v0

    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->farValue:F

    .line 7
    .line 8
    cmpg-float p1, p1, v1

    .line 9
    .line 10
    if-gez p1, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->isProximity:Z

    .line 14
    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iput-boolean v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->isProximity:Z

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->isHeadsetOn()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_4

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->isStarted()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_2

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    if-eqz v0, :cond_3

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->changeState()V

    .line 36
    .line 37
    .line 38
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->replayAtCurrentPosition()V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->acquireProximityWakeLock()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->setScreenOn()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->changeState()V

    .line 49
    .line 50
    .line 51
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->replayAtCurrentPosition()V

    .line 52
    .line 53
    .line 54
    :cond_4
    :goto_0
    return-void
.end method

.method public play(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/android/media/AudioPlayer;->playAndSeekTo(Ljava/lang/String;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public resetStateOnFinishOrStop()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/media/AudioPlayer;->setSpeakerOn(Z)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->resetMediaPlayerAndUri()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->deactivateProximitySensorAndScreenLock()V

    .line 9
    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->isProximity:Z

    .line 12
    .line 13
    const/4 v0, -0x1

    .line 14
    iput v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->pendingSeekTo:I

    .line 15
    .line 16
    return-void
.end method

.method public run()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    return-void

    .line 12
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->state:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onError(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setError(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->errCallBack:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public setNeedToPlayNext(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->needToPlayNext:Z

    .line 2
    .line 3
    return-void
.end method

.method public setScreenOn()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->proximitySensorActivated:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->proximityWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->proximityWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setSpeakerOn(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    move p1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, -0x1

    .line 7
    :goto_0
    iget v1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->speakerOn:I

    .line 8
    .line 9
    if-eq p1, v1, :cond_2

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->audioManager:Landroid/media/AudioManager;

    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_1
    const/4 v0, 0x0

    .line 17
    :goto_1
    invoke-virtual {v1, v0}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 18
    .line 19
    .line 20
    iput p1, p0, Lcom/p1/mobile/android/media/AudioPlayer;->speakerOn:I

    .line 21
    .line 22
    :cond_2
    return-void
.end method

.method public stop()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->resetStateOnFinishOrStop()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->onStopped()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public stopIfNotInProximityMode()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/media/AudioPlayer;->isProximity:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->isStarted()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->stop()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
