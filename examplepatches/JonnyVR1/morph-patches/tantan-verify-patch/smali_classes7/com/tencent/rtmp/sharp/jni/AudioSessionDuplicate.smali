.class public Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioSessionDuplicate"

.field private static _as:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;

.field private static _preDone:Z

.field private static _precon:Ljava/util/concurrent/locks/Condition;

.field private static _prelock:Ljava/util/concurrent/locks/ReentrantLock;

.field private static mDeviceList:[Ljava/lang/String;

.field private static playoutDeviceType:I

.field private static usingJava:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->_prelock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->_precon:Ljava/util/concurrent/locks/Condition;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    sput-boolean v0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->_preDone:Z

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    sput-boolean v1, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->usingJava:Z

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    sput-object v1, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->mDeviceList:[Ljava/lang/String;

    .line 22
    .line 23
    sput v0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->playoutDeviceType:I

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static DeleteAudioSessionDuplicate()V
    .locals 2

    .line 1
    const-string v0, "AudioSessionDuplicate"

    .line 2
    .line 3
    const-string v1, " DeleteAudioSessionDuplicate..."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->_as:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->voiceCallPostprocess()I

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->_as:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->release()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    sput-object v0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->_as:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;

    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static NewAudioSessionDuplicate(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "AudioSessionDuplicate"

    .line 2
    .line 3
    const-string v1, " NewAudioSessionDuplicate..."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->_as:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;

    .line 13
    .line 14
    new-instance v1, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate$1;

    .line 15
    .line 16
    invoke-direct {v1}, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate$1;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-direct {v0, p0, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;-><init>(Landroid/content/Context;Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->_as:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;

    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic access$000()Ljava/util/concurrent/locks/ReentrantLock;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->_prelock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$102(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->_preDone:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200()Ljava/util/concurrent/locks/Condition;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->_precon:Ljava/util/concurrent/locks/Condition;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$302([Ljava/lang/String;)[Ljava/lang/String;
    .locals 0

    .line 1
    sput-object p0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->mDeviceList:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->usingJava:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic access$500(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->onOutputChanage(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static onOutputChanage(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "device: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "AudioSessionDuplicate"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string v0, "DEVICE_EARPHONE"

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    sput p0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->playoutDeviceType:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string v0, "DEVICE_SPEAKERPHONE"

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    const/4 p0, 0x2

    .line 41
    sput p0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->playoutDeviceType:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const-string v0, "DEVICE_WIREDHEADSET"

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    const/4 p0, 0x3

    .line 53
    sput p0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->playoutDeviceType:I

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    const-string v0, "DEVICE_BLUETOOTHHEADSET"

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_3

    .line 63
    .line 64
    const/4 p0, 0x4

    .line 65
    sput p0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->playoutDeviceType:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    const/4 p0, 0x0

    .line 69
    sput p0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->playoutDeviceType:I

    .line 70
    .line 71
    :goto_0
    sget p0, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->playoutDeviceType:I

    .line 72
    .line 73
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetPlayoutDevice(I)V

    .line 74
    .line 75
    .line 76
    return-void
.end method
