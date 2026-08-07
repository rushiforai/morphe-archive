.class public Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;,
        Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$VolumeBroadcastReceiver;
    }
.end annotation


# static fields
.field private static final EXTRA_VOLUME_STREAM_TYPE:Ljava/lang/String; = "android.media.EXTRA_VOLUME_STREAM_TYPE"

.field private static final EXTRA_VOLUME_STREAM_VALUE:Ljava/lang/String; = "android.media.EXTRA_VOLUME_STREAM_VALUE"

.field private static final STREAM_BLUETOOTH_SCO:I = 0x6

.field private static final TAG:Ljava/lang/String; = "VolumeChangedObserver"

.field private static final VOLUME_CHANGED_ACTION:Ljava/lang/String; = "android.media.VOLUME_CHANGED_ACTION"


# instance fields
.field private mVolumeBroadcastReceiver:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$VolumeBroadcastReceiver;

.field private onVolumeChangedListener:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->onVolumeChangedListener:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->registerVolumeChangeAction()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;)Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->onVolumeChangedListener:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;

    .line 2
    .line 3
    return-object p0
.end method

.method private registerVolumeChangeAction()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "VolumeChangedObserver"

    .line 8
    .line 9
    const-string v0, "context is null. unable to register broadcast receiver."

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance v1, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$VolumeBroadcastReceiver;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$VolumeBroadcastReceiver;-><init>(Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->mVolumeBroadcastReceiver:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$VolumeBroadcastReceiver;

    .line 21
    .line 22
    new-instance v1, Landroid/content/IntentFilter;

    .line 23
    .line 24
    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v2, "android.media.VOLUME_CHANGED_ACTION"

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->mVolumeBroadcastReceiver:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$VolumeBroadcastReceiver;

    .line 33
    .line 34
    invoke-static {v0, p0, v1}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private unregisterReceiver()V
    .locals 5

    .line 1
    const-string v0, "unregisterReceiver failed. msg: "

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->mVolumeBroadcastReceiver:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$VolumeBroadcastReceiver;

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-virtual {v2, v3}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->mVolumeBroadcastReceiver:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$VolumeBroadcastReceiver;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    goto :goto_2

    .line 20
    :catch_0
    move-exception v2

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->onVolumeChangedListener:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->onVolumeChangedListener:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;

    .line 27
    .line 28
    :cond_1
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->mVolumeBroadcastReceiver:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$VolumeBroadcastReceiver;

    .line 29
    .line 30
    return-void

    .line 31
    :goto_1
    :try_start_1
    const-string v3, "VolumeChangedObserver"

    .line 32
    .line 33
    new-instance v4, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->onVolumeChangedListener:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->onVolumeChangedListener:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;

    .line 57
    .line 58
    :cond_2
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->mVolumeBroadcastReceiver:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$VolumeBroadcastReceiver;

    .line 59
    .line 60
    return-void

    .line 61
    :goto_2
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->onVolumeChangedListener:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;

    .line 62
    .line 63
    if-eqz v2, :cond_3

    .line 64
    .line 65
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->onVolumeChangedListener:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;

    .line 66
    .line 67
    :cond_3
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->mVolumeBroadcastReceiver:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$VolumeBroadcastReceiver;

    .line 68
    .line 69
    throw v0
.end method


# virtual methods
.method public release()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->unregisterReceiver()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->onVolumeChangedListener:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;

    .line 6
    .line 7
    return-void
.end method
