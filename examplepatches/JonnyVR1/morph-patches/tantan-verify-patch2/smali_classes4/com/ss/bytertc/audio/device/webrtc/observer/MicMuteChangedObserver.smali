.class public Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$MicMuteBroadCastReceiver;,
        Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$OnMicMuteChangedListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MicMuteChangedObserver"


# instance fields
.field private mMicMuteBroadCastReceiver:Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$MicMuteBroadCastReceiver;

.field private mOnMicMuteChangedListener:Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$OnMicMuteChangedListener;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$OnMicMuteChangedListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;->mOnMicMuteChangedListener:Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$OnMicMuteChangedListener;

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;->registerReceiver()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;)Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$OnMicMuteChangedListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;->mOnMicMuteChangedListener:Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$OnMicMuteChangedListener;

    .line 2
    .line 3
    return-object p0
.end method

.method private registerReceiver()V
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
    const-string p0, "MicMuteChangedObserver"

    .line 8
    .line 9
    const-string v0, "registerReceiver, context is null. unable to register broadcast receiver."

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance v1, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$MicMuteBroadCastReceiver;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-direct {v1, p0, v2}, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$MicMuteBroadCastReceiver;-><init>(Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$1;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;->mMicMuteBroadCastReceiver:Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$MicMuteBroadCastReceiver;

    .line 22
    .line 23
    new-instance p0, Landroid/content/IntentFilter;

    .line 24
    .line 25
    const-string v2, "android.media.action.MICROPHONE_MUTE_CHANGED"

    .line 26
    .line 27
    invoke-direct {p0, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1, p0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private unregisterReceiver()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "MicMuteChangedObserver"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "unregisterReceiver, context is null. unable to register broadcast receiver."

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;->mMicMuteBroadCastReceiver:Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$MicMuteBroadCastReceiver;

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;->mMicMuteBroadCastReceiver:Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$MicMuteBroadCastReceiver;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    return-void

    .line 26
    :catch_0
    move-exception p0

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return-void

    .line 29
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v2, "unregisterReceiver, exception: "

    .line 32
    .line 33
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public release()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;->unregisterReceiver()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;->mOnMicMuteChangedListener:Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$OnMicMuteChangedListener;

    .line 6
    .line 7
    return-void
.end method
