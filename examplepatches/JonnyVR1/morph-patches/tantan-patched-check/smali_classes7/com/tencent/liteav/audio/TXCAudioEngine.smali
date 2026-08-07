.class public Lcom/tencent/liteav/audio/TXCAudioEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/audio/impl/b;
.implements Lcom/tencent/liteav/audio/impl/earmonitor/a;


# static fields
.field private static final EVT_AUDIO_DEVICE_RESTART_WHEN_USING_STABLE_SAMPLERATE:I = 0x2748

.field private static final EVT_AUDIO_DEVICE_ROLLBACK_TO_STABLE_SAMPLERATE:I = 0x2747

.field private static final SYSTEM_AUDIO_KIT_RESTART_INTERVAL:J

.field private static final TAG:Ljava/lang/String; = "AudioEngine :TXCAudioEngine_java"

.field private static volatile has_init:Z

.field private static has_trae:Z

.field private static mAudioCoreDataListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/audio/e;",
            ">;"
        }
    .end annotation
.end field

.field protected static mContext:Landroid/content/Context;

.field protected static final mJitterDataListenerMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/audio/e;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final mJitterDataListenerMapLock:Ljava/lang/Object;

.field protected static final mJitterEventListenerMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/audio/d;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final mJitterEventListenerMapLock:Ljava/lang/Object;

.field static sInstance:Lcom/tencent/liteav/audio/TXCAudioEngine;


# instance fields
.field private mAudioKit:Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;

.field private final mCallbackList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/b/a;",
            ">;>;"
        }
    .end annotation
.end field

.field protected mDeviceIsRecording:Z

.field protected mIsCallComed:Z

.field protected mIsCustomRecord:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x7d0

    .line 2
    .line 3
    sput-wide v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->SYSTEM_AUDIO_KIT_RESTART_INTERVAL:J

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->sInstance:Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    sput-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mContext:Landroid/content/Context;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    sput-boolean v1, Lcom/tencent/liteav/audio/TXCAudioEngine;->has_trae:Z

    .line 17
    .line 18
    sput-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mAudioCoreDataListener:Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    new-instance v0, Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mJitterDataListenerMap:Ljava/util/HashMap;

    .line 26
    .line 27
    new-instance v0, Ljava/lang/Object;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 30
    .line 31
    .line 32
    sput-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mJitterDataListenerMapLock:Ljava/lang/Object;

    .line 33
    .line 34
    new-instance v0, Ljava/util/HashMap;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mJitterEventListenerMap:Ljava/util/HashMap;

    .line 40
    .line 41
    new-instance v0, Ljava/lang/Object;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 44
    .line 45
    .line 46
    sput-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mJitterEventListenerMapLock:Ljava/lang/Object;

    .line 47
    .line 48
    sput-boolean v1, Lcom/tencent/liteav/audio/TXCAudioEngine;->has_init:Z

    .line 49
    .line 50
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mCallbackList:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mDeviceIsRecording:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mIsCustomRecord:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mIsCallComed:Z

    .line 17
    .line 18
    return-void
.end method

.method public static declared-synchronized CreateInstance(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-class v0, Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {p0, p1}, Lcom/tencent/liteav/audio/TXCAudioEngine;->CreateInstanceWithoutInitDevice(Landroid/content/Context;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeInitAudioDevice()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    monitor-exit v0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw p0
.end method

.method public static declared-synchronized CreateInstanceWithoutInitDevice(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-class v0, Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    const-string v1, "AudioEngine :TXCAudioEngine_java"

    .line 5
    .line 6
    const-string v2, "CreateInstance: "

    .line 7
    .line 8
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sput-object v1, Lcom/tencent/liteav/audio/TXCAudioEngine;->mContext:Landroid/content/Context;

    .line 16
    .line 17
    sget-boolean v1, Lcom/tencent/liteav/audio/TXCAudioEngine;->has_init:Z

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const-string p0, "AudioEngine :TXCAudioEngine_java"

    .line 22
    .line 23
    const-string p1, "CreateInstance already created~ "

    .line 24
    .line 25
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :try_start_1
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeCheckTraeEngine(Landroid/content/Context;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/4 v2, 0x1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    sput-boolean v2, Lcom/tencent/liteav/audio/TXCAudioEngine;->has_trae:Z

    .line 40
    .line 41
    :cond_1
    sget-boolean v1, Lcom/tencent/liteav/audio/TXCAudioEngine;->has_trae:Z

    .line 42
    .line 43
    xor-int/2addr v1, v2

    .line 44
    invoke-static {v1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeUseSysAudioDevice(Z)V

    .line 45
    .line 46
    .line 47
    sget-boolean v1, Lcom/tencent/liteav/audio/TXCAudioEngine;->has_trae:Z

    .line 48
    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->InitTraeEngineLibrary(Landroid/content/Context;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetTRAEConfig(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeInitBeforeEngineCreate(Landroid/content/Context;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Lcom/tencent/liteav/audio/impl/a;->a()Lcom/tencent/liteav/audio/impl/a;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/audio/impl/a;->a(Landroid/content/Context;)V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Lcom/tencent/liteav/audio/impl/a;->a()Lcom/tencent/liteav/audio/impl/a;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    sget-object p1, Lcom/tencent/liteav/audio/TXCAudioEngine;->sInstance:Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/audio/impl/a;->a(Lcom/tencent/liteav/audio/impl/b;)V

    .line 78
    .line 79
    .line 80
    sget-object p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mContext:Landroid/content/Context;

    .line 81
    .line 82
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeNewAudioSessionDuplicate(Landroid/content/Context;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    invoke-static {}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->getInstance()Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 87
    .line 88
    .line 89
    invoke-static {}, Lcom/tencent/liteav/audio/impl/Record/TXCAudioSysRecord;->getInstance()Lcom/tencent/liteav/audio/impl/Record/TXCAudioSysRecord;

    .line 90
    .line 91
    .line 92
    :goto_0
    sput-boolean v2, Lcom/tencent/liteav/audio/TXCAudioEngine;->has_init:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    .line 94
    monitor-exit v0

    .line 95
    return-void

    .line 96
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 97
    throw p0
.end method

.method public static synthetic access$000(Lcom/tencent/liteav/audio/TXCAudioEngine;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->startSystemAudioKit()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static buildTRAEConfig(Landroid/content/Context;Ljava/lang/Boolean;ZJ)Ljava/lang/String;
    .locals 4

    .line 1
    const-string p0, "sharp {\n"

    .line 2
    .line 3
    const-string v0, "  os android\n"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "  trae {\n"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "    dev {\n"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string p0, "  closeOpensl "

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    const-string p0, "n"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const-string p0, "y"

    .line 46
    .line 47
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string p0, "\n"

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    :cond_1
    invoke-static {}, Lcom/tencent/liteav/audio/b;->a()Lcom/tencent/liteav/audio/b;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const-string v0, "timestamp_rollback_to_stable_samplerate"

    .line 64
    .line 65
    const-wide/16 v1, 0x0

    .line 66
    .line 67
    invoke-virtual {p1, v0, v1, v2}, Lcom/tencent/liteav/audio/b;->b(Ljava/lang/String;J)J

    .line 68
    .line 69
    .line 70
    move-result-wide v0

    .line 71
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 72
    .line 73
    .line 74
    move-result-wide v2

    .line 75
    sub-long/2addr v2, v0

    .line 76
    cmp-long p1, v2, p3

    .line 77
    .line 78
    if-gez p1, :cond_2

    .line 79
    .line 80
    const/4 p1, 0x1

    .line 81
    goto :goto_1

    .line 82
    :cond_2
    const/4 p1, 0x0

    .line 83
    :goto_1
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    filled-new-array {v0, v1, p3}, [Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p3

    .line 99
    const-string p4, "AudioEngine :TXCAudioEngine_java"

    .line 100
    .line 101
    const-string v0, "low latency samplerate, enable: %b, isBlocked: %b, blockTime: %d"

    .line 102
    .line 103
    invoke-static {p4, v0, p3}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    const-string p3, "  }\n"

    .line 107
    .line 108
    if-nez p1, :cond_3

    .line 109
    .line 110
    if-eqz p2, :cond_3

    .line 111
    .line 112
    const-string p1, "  component 1\n"

    .line 113
    .line 114
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    const-string p1, "  cap {\n"

    .line 119
    .line 120
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    const-string p1, "    hw_sr 48000\n"

    .line 125
    .line 126
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p0, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    const-string p2, "  play {\n"

    .line 135
    .line 136
    invoke-virtual {p0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    const-string p1, "  }"

    .line 145
    .line 146
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    :cond_3
    const-string p1, "    }\n"

    .line 151
    .line 152
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p0, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    const-string p1, "}"

    .line 161
    .line 162
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    return-object p0
.end method

.method private createManufacturerAudioKit(Landroid/content/Context;)Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;
    .locals 0

    .line 1
    sget-object p0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 2
    .line 3
    const-string p1, "huawei"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;-><init>()V

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public static enableAudioEarMonitoring(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "enableAudioEarMonitoring: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "AudioEngine :TXCAudioEngine_java"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeEnableAudioEarMonitoring(Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static enableAudioVolumeEvaluation(ZI)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "enableAudioVolumeEvaluation : "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "interval:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "AudioEngine :TXCAudioEngine_java"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p0, p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeEnableAudioVolumeEvaluation(ZI)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public static getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->sInstance:Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 2
    .line 3
    return-object v0
.end method

.method private static getLowLatencySampleRate(Landroid/content/Context;)I
    .locals 2

    .line 1
    const-string v0, "audio"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/media/AudioManager;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    :try_start_0
    const-string v0, "android.media.property.OUTPUT_SAMPLE_RATE"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    return p0

    .line 22
    :catch_0
    move-exception p0

    .line 23
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 24
    .line 25
    const-string v1, "can\'t parse low latency samplerate"

    .line 26
    .line 27
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 p0, -0x1

    .line 31
    return p0
.end method

.method public static getMixingPlayoutVolumeLevel()I
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeGetMixingPlayoutVolumeLevel()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method private handleAudioEvent(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    const/16 p0, 0x2747

    .line 2
    .line 3
    const-string p1, "timestamp_rollback_to_stable_samplerate"

    .line 4
    .line 5
    if-ne p2, p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/tencent/liteav/audio/b;->a()Lcom/tencent/liteav/audio/b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide p2

    .line 15
    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/liteav/audio/b;->a(Ljava/lang/String;J)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/16 p0, 0x2748

    .line 20
    .line 21
    if-ne p2, p0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Lcom/tencent/liteav/audio/b;->a()Lcom/tencent/liteav/audio/b;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-wide/16 p2, 0x0

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/liteav/audio/b;->a(Ljava/lang/String;J)V

    .line 30
    .line 31
    .line 32
    const-string p0, "AudioEngine :TXCAudioEngine_java"

    .line 33
    .line 34
    const-string p1, "audio device restart when using stable samplerate"

    .line 35
    .line 36
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public static hasTrae()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->has_trae:Z

    .line 2
    .line 3
    return v0
.end method

.method public static onAudioJitterBufferNotify(Ljava/lang/String;ILjava/lang/String;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mJitterEventListenerMapLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/tencent/liteav/audio/TXCAudioEngine;->mJitterEventListenerMap:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/tencent/liteav/audio/d;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    const/4 v1, 0x0

    .line 28
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 32
    .line 33
    new-instance v2, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v3, "onAudioJitterBufferNotify  cur state "

    .line 36
    .line 37
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {v0, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-interface {v1, p0, p1, p2}, Lcom/tencent/liteav/audio/d;->onAudioJitterBufferNotify(Ljava/lang/String;ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void

    .line 54
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    throw p0
.end method

.method public static onAudioPlayPcmData(Ljava/lang/String;[BJII)V
    .locals 9

    .line 1
    sget-object v1, Lcom/tencent/liteav/audio/TXCAudioEngine;->mJitterDataListenerMapLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    sget-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mJitterDataListenerMap:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/tencent/liteav/audio/e;

    .line 23
    .line 24
    :goto_0
    move-object v2, v0

    .line 25
    goto :goto_1

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    move-object p0, v0

    .line 28
    goto :goto_2

    .line 29
    :cond_0
    const/4 v0, 0x0

    .line 30
    goto :goto_0

    .line 31
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    move-object v3, p0

    .line 35
    move-object v4, p1

    .line 36
    move-wide v5, p2

    .line 37
    move v7, p4

    .line 38
    move v8, p5

    .line 39
    invoke-interface/range {v2 .. v8}, Lcom/tencent/liteav/audio/e;->onAudioPlayPcmData(Ljava/lang/String;[BJII)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void

    .line 43
    :goto_2
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    throw p0
.end method

.method public static onCorePlayPcmData([BJII)V
    .locals 8

    .line 1
    sget-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mAudioCoreDataListener:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    move-object v1, v0

    .line 10
    check-cast v1, Lcom/tencent/liteav/audio/e;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    move-object v3, p0

    .line 16
    move-wide v4, p1

    .line 17
    move v6, p3

    .line 18
    move v7, p4

    .line 19
    invoke-interface/range {v1 .. v7}, Lcom/tencent/liteav/audio/e;->onAudioPlayPcmData(Ljava/lang/String;[BJII)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static setAudioEarMonitoringVolume(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setAudioEarMonitoringVolume: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "AudioEngine :TXCAudioEngine_java"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetAudioEarMonitoringVolume(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static setAudioRoute(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setAudioRoute: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "AudioEngine :TXCAudioEngine_java"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetAudioRoute(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static setPlayoutDataListener(Lcom/tencent/liteav/audio/e;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mAudioCoreDataListener:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x1

    .line 13
    :goto_0
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetPlayoutDataListener(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static setSystemVolumeType(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setSystemVolumeType: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "AudioEngine :TXCAudioEngine_java"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetSystemVolumeType(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private startSystemAudioKit()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mAudioKit:Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    sget-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-direct {p0, v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->createManufacturerAudioKit(Landroid/content/Context;)Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mAudioKit:Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeNotifySystemEarMonitoringInitializing()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mAudioKit:Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;

    .line 22
    .line 23
    sget-object v1, Lcom/tencent/liteav/audio/TXCAudioEngine;->mContext:Landroid/content/Context;

    .line 24
    .line 25
    invoke-interface {v0, v1, p0}, Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;->initialize(Landroid/content/Context;Lcom/tencent/liteav/audio/impl/earmonitor/a;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetSystemEarMonitoring(Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public EnableMixMode(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeEnableMixMode(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public addEventCallback(Ljava/lang/ref/WeakReference;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/b/a;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mCallbackList:Ljava/util/ArrayList;

    .line 5
    .line 6
    monitor-enter v0

    .line 7
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mCallbackList:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetEventCallbackEnabled(Z)V

    .line 14
    .line 15
    .line 16
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public clean()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeClean()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public enableAutoRestartDevice(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeEnableAutoRestartDevice(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public enableCaptureEOSMode(Z)Z
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "enableEosMode "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 16
    .line 17
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeEnableCaptureEOSMode(Z)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public enableEncodedDataCallback(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeEnableEncodedDataCallback(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public enableEncodedDataPackWithTRAEHeaderCallback(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeEnableEncodedDataPackWithTRAEHeaderCallback(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public enableSoftAEC(ZI)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "enableSoftAEC: enable = "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, " level = "

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 24
    .line 25
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    const/4 p2, 0x0

    .line 31
    :cond_0
    invoke-static {p2}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetSoftAEC(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public enableSoftAGC(ZI)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "enableSoftAGC: enable = "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, " level = "

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 24
    .line 25
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    const/4 p2, 0x0

    .line 31
    :cond_0
    invoke-static {p2}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetSoftAGC(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public enableSoftANS(ZI)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "enableSoftANS: enable = "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, " level = "

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 24
    .line 25
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    const/4 p2, 0x0

    .line 31
    :cond_0
    invoke-static {p2}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetSoftANS(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public forceCallbackMixedPlayAudioFrame(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeForceCallbackMixedPlayAudioFrame(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getAECType()I
    .locals 0

    const/4 p0, 0x2

    return p0
.end method

.method public getAudioEncoderConfig()Lcom/tencent/liteav/audio/TXCAudioEncoderConfig;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeGetEncoderConfig()Lcom/tencent/liteav/audio/TXCAudioEncoderConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getEncoderChannels()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeGetEncoderChannels()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getEncoderSampleRate()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeGetEncoderSampleRate()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getPlayAECType()I
    .locals 0

    .line 1
    sget-boolean p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->has_trae:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public getPlayChannels()I
    .locals 0

    const/4 p0, 0x2

    return p0
.end method

.method public getPlaySampleRate()I
    .locals 0

    const p0, 0xbb80

    return p0
.end method

.method public getRemotePlayoutVolumeLevel(Ljava/lang/String;)I
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeGetRemotePlayoutVolumeLevel(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getSoftwareCaptureVolumeLevel()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeGetSoftwareCaptureVolumeLevel()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getStatus(I)Lcom/tencent/liteav/basic/module/StatusBucket;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->getStatus(I)Lcom/tencent/liteav/basic/module/StatusBucket;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public isAudioDeviceCapturing()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeIsAudioDeviceCapturing()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "isRecording: "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "AudioEngine :TXCAudioEngine_java"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return p0
.end method

.method public isRemoteAudioPlaying(Ljava/lang/String;)Z
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeIsRemoteAudioPlaying(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public muteLocalAudio(Z)Z
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "setRecordMute: "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 16
    .line 17
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeMuteLocalAudio(Z)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public muteRemoteAudio(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p1, p2}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeMuteRemoteAudio(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public muteRemoteAudioInSpeaker(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p1, p2}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeMuteRemoteAudioInSpeaker(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onAudioKitError(Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mAudioKit:Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p1, "AudioEngine :TXCAudioEngine_java"

    .line 7
    .line 8
    const-string v0, "onAudioKitError"

    .line 9
    .line 10
    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mAudioKit:Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-interface {p1}, Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;->stopSystemEarMonitoring()V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mAudioKit:Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;

    .line 21
    .line 22
    invoke-interface {p1}, Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;->uninitialize()V

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput-object p1, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mAudioKit:Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;

    .line 27
    .line 28
    :cond_1
    new-instance p1, Landroid/os/Handler;

    .line 29
    .line 30
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Lcom/tencent/liteav/audio/TXCAudioEngine$1;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Lcom/tencent/liteav/audio/TXCAudioEngine$1;-><init>(Lcom/tencent/liteav/audio/TXCAudioEngine;)V

    .line 40
    .line 41
    .line 42
    sget-wide v1, Lcom/tencent/liteav/audio/TXCAudioEngine;->SYSTEM_AUDIO_KIT_RESTART_INTERVAL:J

    .line 43
    .line 44
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onAudioKitInitFinished(Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mAudioKit:Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;

    .line 2
    .line 3
    if-eq p0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p1, "AudioEngine :TXCAudioEngine_java"

    .line 15
    .line 16
    const-string v0, "system audio kit init finished, ret: %b."

    .line 17
    .line 18
    invoke-static {p1, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    if-nez p2, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetSystemEarMonitoring(Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public onCallStateChanged(I)V
    .locals 3

    .line 1
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq p1, v1, :cond_1

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    if-eq p1, v2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p1, "TelephonyManager.CALL_STATE_OFFHOOK!"

    .line 13
    .line 14
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->pauseAudioCapture(Z)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->getInstance()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->interruptAllMusics()V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->getCacheInstance()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->interruptAllMusics()V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->getAutoCacheHolder()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->interruptAllMusics()V

    .line 39
    .line 40
    .line 41
    iput-boolean v1, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mIsCallComed:Z

    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    const-string p0, "TelephonyManager.CALL_STATE_RINGING!"

    .line 45
    .line 46
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    const-string p1, "TelephonyManager.CALL_STATE_IDLE!"

    .line 51
    .line 52
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-boolean p1, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mIsCallComed:Z

    .line 56
    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    const/4 p1, 0x0

    .line 60
    iput-boolean p1, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mIsCallComed:Z

    .line 61
    .line 62
    invoke-static {}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->resumeAudioCapture()V

    .line 63
    .line 64
    .line 65
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->getInstance()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->recoverAllMusics()V

    .line 70
    .line 71
    .line 72
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->getCacheInstance()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->recoverAllMusics()V

    .line 77
    .line 78
    .line 79
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->getAutoCacheHolder()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->recoverAllMusics()V

    .line 84
    .line 85
    .line 86
    :cond_3
    :goto_0
    return-void
.end method

.method public onEarMonitoringInitialized(Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mAudioKit:Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 15
    .line 16
    const-string v1, "onEarMonitoringInitialized result: %b"

    .line 17
    .line 18
    invoke-static {v0, v1, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mAudioKit:Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetSystemEarMonitoring(Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetSystemEarMonitoring(Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public onError(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mCallbackList:Ljava/util/ArrayList;

    .line 7
    .line 8
    monitor-enter v1

    .line 9
    :try_start_0
    iget-object v2, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mCallbackList:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-gtz v2, :cond_0

    .line 16
    .line 17
    monitor-exit v1

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_2

    .line 21
    :cond_0
    iget-object v2, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mCallbackList:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_2

    .line 32
    .line 33
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Ljava/lang/ref/WeakReference;

    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Lcom/tencent/liteav/basic/b/a;

    .line 44
    .line 45
    if-eqz v3, :cond_1

    .line 46
    .line 47
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    iget-object p0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mCallbackList:Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-gtz p0, :cond_3

    .line 62
    .line 63
    const/4 p0, 0x0

    .line 64
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetEventCallbackEnabled(Z)V

    .line 65
    .line 66
    .line 67
    :cond_3
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lcom/tencent/liteav/basic/b/a;

    .line 83
    .line 84
    invoke-interface {v0, p1, p2, p3, p4}, Lcom/tencent/liteav/basic/b/a;->onError(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    return-void

    .line 89
    :goto_2
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 90
    throw p0
.end method

.method public onEvent(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/audio/TXCAudioEngine;->handleAudioEvent(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mCallbackList:Ljava/util/ArrayList;

    .line 10
    .line 11
    monitor-enter v1

    .line 12
    :try_start_0
    iget-object v2, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mCallbackList:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-gtz v2, :cond_0

    .line 19
    .line 20
    monitor-exit v1

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_2

    .line 24
    :cond_0
    iget-object v2, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mCallbackList:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-eqz v3, :cond_2

    .line 35
    .line 36
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Ljava/lang/ref/WeakReference;

    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Lcom/tencent/liteav/basic/b/a;

    .line 47
    .line 48
    if-eqz v3, :cond_1

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    iget-object p0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mCallbackList:Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-gtz p0, :cond_3

    .line 65
    .line 66
    const/4 p0, 0x0

    .line 67
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetEventCallbackEnabled(Z)V

    .line 68
    .line 69
    .line 70
    :cond_3
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_4

    .line 80
    .line 81
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Lcom/tencent/liteav/basic/b/a;

    .line 86
    .line 87
    invoke-interface {v0, p1, p2, p3, p4}, Lcom/tencent/liteav/basic/b/a;->onEvent(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_4
    return-void

    .line 92
    :goto_2
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    throw p0
.end method

.method public pauseAudioCapture(Z)I
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "pauseAudioCapture: "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 16
    .line 17
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->pauseAudioCapture(Z)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public pauseLocalAudio()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativePauseLocalAudio()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public resumeAudioCapture()I
    .locals 1

    .line 1
    const-string p0, "AudioEngine :TXCAudioEngine_java"

    .line 2
    .line 3
    const-string v0, "resumeRecord"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->resumeAudioCapture()V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public resumeLocalAudio()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeResumeLocalAudio()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public sendCustomPCMData(Lcom/tencent/liteav/basic/structs/a;)V
    .locals 0

    .line 5
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->sendCustomPCMData(Lcom/tencent/liteav/basic/structs/a;)V

    return-void
.end method

.method public sendCustomPCMData([BII)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->sendCustomPCMData([BII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setAudioCaptureDataListener(Lcom/tencent/liteav/audio/f;)Z
    .locals 1

    .line 1
    const-string p0, "AudioEngine :TXCAudioEngine_java"

    .line 2
    .line 3
    const-string v0, "setRecordListener "

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->setAudioCaptureDataListener(Ljava/lang/ref/WeakReference;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    new-instance p0, Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->setAudioCaptureDataListener(Ljava/lang/ref/WeakReference;)V

    .line 21
    .line 22
    .line 23
    :goto_0
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public setAudioDumpingListener(Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI$a;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->SetAudioDumpingListener(Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setAudioEncoderParam(II)Z
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetAudioEncoderParam(II)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public setAudioQuality(II)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetAudioQuality(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setCaptureDataCallbackFormat(III)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "setCaptureDataCallbackFormat: sampleRate-"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, " channels-"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v0, " length-"

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 32
    .line 33
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, p2, p3}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetCaptureDataCallbackFormat(III)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public setEncoderChannels(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetEncoderChannels(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setEncoderFECPercent(F)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetEncoderFECPercent(F)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public setEncoderSampleRate(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetEncoderSampleRate(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setMaxSelectedPlayStreams(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetMaxSelectedPlayStreams(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setMixingPlayoutVolume(F)Z
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "setPlayoutVolume: "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 16
    .line 17
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetMixingPlayoutVolume(F)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public setPlayoutDataCallbackFormat(III)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "setPlayoutDataCallbackFormat: sampleRate-"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, " channels-"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v0, " length-"

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 32
    .line 33
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, p2, p3}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetPlayoutDataCallbackFormat(III)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public setRemoteAudioCacheParams(Ljava/lang/String;ZIII)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetRemoteAudioCacheParams(Ljava/lang/String;ZIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setRemoteAudioStreamEventListener(Ljava/lang/String;Lcom/tencent/liteav/audio/d;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sget-object p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mJitterEventListenerMapLock:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter p0

    .line 7
    :try_start_0
    sget-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mJitterEventListenerMap:Ljava/util/HashMap;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-direct {v1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw p1
.end method

.method public setRemotePlayoutVolume(Ljava/lang/String;I)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p1, p2}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetRemotePlayoutVolume(Ljava/lang/String;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setRemoteStreamDataCallbackFormat(Ljava/lang/String;III)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "setRemoteStreamDataCallbackFormat: id-"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, " sampleRate-"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v0, " channels-"

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, " length-"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 40
    .line 41
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p1, p2, p3, p4}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetRemoteStreamDataCallbackFormat(Ljava/lang/String;III)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public setReverbType(Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;)Z
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "setReverbType: "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->getNativeValue()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 20
    .line 21
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->getNativeValue()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetRecordReverb(I)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public setSetAudioEngineRemoteStreamDataListener(Ljava/lang/String;Lcom/tencent/liteav/audio/e;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sget-object p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mJitterDataListenerMapLock:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter p0

    .line 7
    :try_start_0
    sget-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mJitterDataListenerMap:Ljava/util/HashMap;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-direct {v1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    if-nez p2, :cond_1

    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p0, 0x1

    .line 23
    :goto_0
    invoke-static {p1, p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetAudioEngineRemoteStreamDataListener(Ljava/lang/String;Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw p1
.end method

.method public setSoftwareCaptureVolume(F)Z
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "setRecordVolume: "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 16
    .line 17
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetSoftwareCaptureVolume(F)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public setSystemAudioKitEnabled()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->startSystemAudioKit()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setVoiceChangerType(Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;)Z
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "setVoiceChangerType "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->getNativeValue()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 20
    .line 21
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->getNativeValue()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetCaptureVoiceChanger(I)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public startLocalAudio(IZ)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "startLocalAudio audioFormat:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "AudioEngine :TXCAudioEngine_java"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mContext:Landroid/content/Context;

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    const-string p0, "Please call CreateInstance fisrt!!!"

    .line 25
    .line 26
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/16 p0, -0x385

    .line 30
    .line 31
    return p0

    .line 32
    :cond_0
    invoke-static {v0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->InitTraeEngineLibrary(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1, p2}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeStartLocalAudio(IZ)V

    .line 36
    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    iput-boolean p1, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mDeviceIsRecording:Z

    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public startLocalAudioDumping(IILjava/lang/String;)I
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeStartLocalAudioDumping(IILjava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public startRemoteAudio(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    sget-object p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->sInstance:Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 2
    .line 3
    invoke-static {p0, p2, p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeStartRemoteAudio(Lcom/tencent/liteav/audio/TXCAudioEngine;ZLjava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/tencent/liteav/basic/d/c;->a()Lcom/tencent/liteav/basic/d/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string p2, "LIVE_JitterCycle"

    .line 11
    .line 12
    const-string v0, "Audio"

    .line 13
    .line 14
    invoke-virtual {p0, v0, p2}, Lcom/tencent/liteav/basic/d/c;->a(Ljava/lang/String;Ljava/lang/String;)J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    invoke-static {p1, v1, v2}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetRemoteAudioJitterCycle(Ljava/lang/String;J)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcom/tencent/liteav/basic/d/c;->a()Lcom/tencent/liteav/basic/d/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p2, "LoadingThreshold"

    .line 26
    .line 27
    invoke-virtual {p0, v0, p2}, Lcom/tencent/liteav/basic/d/c;->a(Ljava/lang/String;Ljava/lang/String;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    invoke-static {p1, v0, v1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetRemoteAudioBlockThreshold(Ljava/lang/String;J)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public stopLocalAudio()I
    .locals 2

    .line 1
    const-string v0, "AudioEngine :TXCAudioEngine_java"

    .line 2
    .line 3
    const-string v1, "stopLocalAudio"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeStopLocalAudio()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/tencent/liteav/audio/TXCAudioEngine;->mDeviceIsRecording:Z

    .line 13
    .line 14
    return v0
.end method

.method public stopLocalAudioDumping()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeStopLocalAudioDumping()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public stopRemoteAudio(Ljava/lang/String;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p1}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeStopRemoteAudio(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
