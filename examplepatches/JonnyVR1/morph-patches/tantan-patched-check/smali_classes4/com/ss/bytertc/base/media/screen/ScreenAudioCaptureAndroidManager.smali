.class public Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;
.super Landroid/media/projection/MediaProjection$Callback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager$HOLDER;
    }
.end annotation


# static fields
.field private static final NUM_SAMPLES_PER_READ:I = 0x400

.field private static final SAMPLE_RATE:I = 0xbb80


# instance fields
.field private mAudioMode:I

.field private mAudioRecord:Landroid/media/AudioRecord;

.field private mCaptureObserver:Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureObserver;

.field private mContextRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private mIsDisposed:Z

.field private volatile mIsRecording:Z

.field private mMediaProjection:Landroid/media/projection/MediaProjection;

.field private mRecordingThread:Ljava/lang/Thread;

.field private sHandler:Landroid/os/Handler;

.field private sHandlerThread:Landroid/os/HandlerThread;


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/media/projection/MediaProjection$Callback;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/HandlerThread;

    .line 5
    .line 6
    const-string v1, "sdk-audio-share"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->sHandlerThread:Landroid/os/HandlerThread;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 14
    .line 15
    .line 16
    new-instance v0, Landroid/os/Handler;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->sHandlerThread:Landroid/os/HandlerThread;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->sHandler:Landroid/os/Handler;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mIsRecording:Z

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    iput-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mCaptureObserver:Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureObserver;

    .line 34
    .line 35
    iput-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mAudioRecord:Landroid/media/AudioRecord;

    .line 36
    .line 37
    iput-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mRecordingThread:Ljava/lang/Thread;

    .line 38
    .line 39
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mIsDisposed:Z

    .line 40
    .line 41
    return-void
.end method

.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager$1;)V
    .locals 0

    .line 42
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;-><init>()V

    return-void
.end method

.method public static INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager$HOLDER;->access$100()Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic a(Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->doRun()V

    return-void
.end method

.method public static synthetic b(Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;Landroid/media/projection/MediaProjection;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->startAudioCapture_(Landroid/media/projection/MediaProjection;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->stopAudioCapture_()V

    return-void
.end method

.method private checkNotDisposed()V
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mIsDisposed:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "screen audio capturer is disposed."

    .line 7
    .line 8
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private doRun()V
    .locals 6

    .line 1
    const/16 v0, 0x400

    .line 2
    .line 3
    new-array v1, v0, [S

    .line 4
    .line 5
    :goto_0
    iget-boolean v2, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mIsRecording:Z

    .line 6
    .line 7
    if-eqz v2, :cond_3

    .line 8
    .line 9
    iget-object v2, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mAudioRecord:Landroid/media/AudioRecord;

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    const/4 v3, 0x0

    .line 15
    invoke-virtual {v2, v1, v3, v0}, Landroid/media/AudioRecord;->read([SII)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-gez v2, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-direct {p0, v1}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->short2byte([S)[B

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v3, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mCaptureObserver:Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureObserver;

    .line 27
    .line 28
    if-nez v3, :cond_2

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_2
    const v4, 0xbb80

    .line 32
    .line 33
    .line 34
    const/4 v5, 0x1

    .line 35
    invoke-interface {v3, v2, v0, v4, v5}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureObserver;->onAudioFrameCapture([BIII)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_3
    :goto_1
    return-void
.end method

.method private static varargs hasPermissions(Landroid/content/Context;[Ljava/lang/String;)Z
    .locals 4

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v2, v0, :cond_1

    .line 5
    .line 6
    aget-object v3, p1, v2

    .line 7
    .line 8
    invoke-static {p0, v3}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->selfPermissionGranted(Landroid/content/Context;Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-nez v3, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method private static selfPermissionGranted(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 6
    .line 7
    const/16 v1, 0x17

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x1

    .line 11
    if-lt v0, v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    return v3

    .line 20
    :cond_0
    return v2

    .line 21
    :cond_1
    invoke-static {p0, p1}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_2

    .line 26
    .line 27
    return v3

    .line 28
    :cond_2
    return v2
.end method

.method private setMusicMode(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/content/Context;

    .line 8
    .line 9
    const-string v1, "audio"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/media/AudioManager;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    :try_start_0
    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mAudioMode:I

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    invoke-virtual {v0, p0}, Landroid/media/AudioManager;->setMode(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catch_0
    move-exception p0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mAudioMode:I

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Landroid/media/AudioManager;->setMode(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p1, ", "

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p1, "ScreenAudioCapture"

    .line 63
    .line 64
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method private short2byte([S)[B
    .locals 6

    .line 1
    array-length p0, p1

    .line 2
    mul-int/lit8 v0, p0, 0x2

    .line 3
    .line 4
    new-array v0, v0, [B

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    if-ge v2, p0, :cond_0

    .line 9
    .line 10
    mul-int/lit8 v3, v2, 0x2

    .line 11
    .line 12
    aget-short v4, p1, v2

    .line 13
    .line 14
    and-int/lit16 v5, v4, 0xff

    .line 15
    .line 16
    int-to-byte v5, v5

    .line 17
    aput-byte v5, v0, v3

    .line 18
    .line 19
    add-int/lit8 v3, v3, 0x1

    .line 20
    .line 21
    shr-int/lit8 v4, v4, 0x8

    .line 22
    .line 23
    int-to-byte v4, v4

    .line 24
    aput-byte v4, v0, v3

    .line 25
    .line 26
    aput-short v1, p1, v2

    .line 27
    .line 28
    add-int/lit8 v2, v2, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-object v0
.end method

.method private startAudioCapture_(Landroid/media/projection/MediaProjection;)V
    .locals 5

    .line 1
    const-string v0, "ScreenAudioCapture"

    .line 2
    .line 3
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 4
    .line 5
    const/16 v2, 0x1c

    .line 6
    .line 7
    if-gt v1, v2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mIsRecording:Z

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 16
    .line 17
    if-nez p1, :cond_2

    .line 18
    .line 19
    :goto_0
    return-void

    .line 20
    :cond_2
    invoke-static {}, Ll/xce0;->a()V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 24
    .line 25
    invoke-static {p1}, Ll/wce0;->a(Landroid/media/projection/MediaProjection;)Landroid/media/AudioPlaybackCaptureConfiguration$Builder;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-static {p1, v1}, Ll/tce0;->a(Landroid/media/AudioPlaybackCaptureConfiguration$Builder;I)Landroid/media/AudioPlaybackCaptureConfiguration$Builder;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const/16 v2, 0xe

    .line 35
    .line 36
    invoke-static {p1, v2}, Ll/tce0;->a(Landroid/media/AudioPlaybackCaptureConfiguration$Builder;I)Landroid/media/AudioPlaybackCaptureConfiguration$Builder;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const/4 v2, 0x0

    .line 41
    invoke-static {p1, v2}, Ll/tce0;->a(Landroid/media/AudioPlaybackCaptureConfiguration$Builder;I)Landroid/media/AudioPlaybackCaptureConfiguration$Builder;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p1}, Ll/uce0;->a(Landroid/media/AudioPlaybackCaptureConfiguration$Builder;)Landroid/media/AudioPlaybackCaptureConfiguration;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    new-instance v3, Landroid/media/AudioFormat$Builder;

    .line 50
    .line 51
    invoke-direct {v3}, Landroid/media/AudioFormat$Builder;-><init>()V

    .line 52
    .line 53
    .line 54
    const/4 v4, 0x2

    .line 55
    invoke-virtual {v3, v4}, Landroid/media/AudioFormat$Builder;->setEncoding(I)Landroid/media/AudioFormat$Builder;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    const v4, 0xbb80

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3, v4}, Landroid/media/AudioFormat$Builder;->setSampleRate(I)Landroid/media/AudioFormat$Builder;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    const/16 v4, 0x10

    .line 67
    .line 68
    invoke-virtual {v3, v4}, Landroid/media/AudioFormat$Builder;->setChannelMask(I)Landroid/media/AudioFormat$Builder;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-virtual {v3}, Landroid/media/AudioFormat$Builder;->build()Landroid/media/AudioFormat;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    :try_start_0
    new-instance v4, Landroid/media/AudioRecord$Builder;

    .line 77
    .line 78
    invoke-direct {v4}, Landroid/media/AudioRecord$Builder;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v4, v3}, Landroid/media/AudioRecord$Builder;->setAudioFormat(Landroid/media/AudioFormat;)Landroid/media/AudioRecord$Builder;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    const/16 v4, 0x800

    .line 86
    .line 87
    invoke-virtual {v3, v4}, Landroid/media/AudioRecord$Builder;->setBufferSizeInBytes(I)Landroid/media/AudioRecord$Builder;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-static {v3, p1}, Ll/vce0;->a(Landroid/media/AudioRecord$Builder;Landroid/media/AudioPlaybackCaptureConfiguration;)Landroid/media/AudioRecord$Builder;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1}, Landroid/media/AudioRecord$Builder;->build()Landroid/media/AudioRecord;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mAudioRecord:Landroid/media/AudioRecord;
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/media/AudioRecord;->getState()I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_3

    .line 106
    .line 107
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 108
    .line 109
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    check-cast p1, Landroid/content/Context;

    .line 114
    .line 115
    const-string v1, "android.permission.RECORD_AUDIO"

    .line 116
    .line 117
    filled-new-array {v1}, [Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-static {p1, v1}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->hasPermissions(Landroid/content/Context;[Ljava/lang/String;)Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    new-instance v1, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    const-string v2, "audioRecord init fail, permission: "

    .line 128
    .line 129
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    const/4 p1, 0x0

    .line 143
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mAudioRecord:Landroid/media/AudioRecord;

    .line 144
    .line 145
    return-void

    .line 146
    :cond_3
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 147
    .line 148
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->sHandler:Landroid/os/Handler;

    .line 149
    .line 150
    invoke-virtual {p1, p0, v0}, Landroid/media/projection/MediaProjection;->registerCallback(Landroid/media/projection/MediaProjection$Callback;Landroid/os/Handler;)V

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mCaptureObserver:Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureObserver;

    .line 154
    .line 155
    invoke-interface {p1}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureObserver;->onCapturerStarted()V

    .line 156
    .line 157
    .line 158
    invoke-direct {p0, v1}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->setMusicMode(Z)V

    .line 159
    .line 160
    .line 161
    iput-boolean v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mIsRecording:Z

    .line 162
    .line 163
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mAudioRecord:Landroid/media/AudioRecord;

    .line 164
    .line 165
    invoke-virtual {p1}, Landroid/media/AudioRecord;->startRecording()V

    .line 166
    .line 167
    .line 168
    new-instance p1, Ljava/lang/Thread;

    .line 169
    .line 170
    new-instance v0, Ll/yce0;

    .line 171
    .line 172
    invoke-direct {v0, p0}, Ll/yce0;-><init>(Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;)V

    .line 173
    .line 174
    .line 175
    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 176
    .line 177
    .line 178
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mRecordingThread:Ljava/lang/Thread;

    .line 179
    .line 180
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 181
    .line 182
    .line 183
    invoke-direct {p0, v2}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->setMusicMode(Z)V

    .line 184
    .line 185
    .line 186
    return-void

    .line 187
    :catch_0
    move-exception p0

    .line 188
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method private stopAudioCapture_()V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mIsRecording:Z

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mIsRecording:Z

    .line 15
    .line 16
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mAudioRecord:Landroid/media/AudioRecord;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mAudioRecord:Landroid/media/AudioRecord;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mAudioRecord:Landroid/media/AudioRecord;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mCaptureObserver:Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureObserver;

    .line 32
    .line 33
    invoke-interface {v0}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureObserver;->onCapturerStopped()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mIsDisposed:Z

    .line 3
    .line 4
    return-void
.end method

.method public initialize(Landroid/content/Context;Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureObserver;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mCaptureObserver:Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureObserver;

    .line 4
    .line 5
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mIsDisposed:Z

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string p0, "audio capture observer not set."

    .line 17
    .line 18
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/media/projection/MediaProjection$Callback;->onStop()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->stopAudioCapture_()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public startAudioCapture(Landroid/media/projection/MediaProjection;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->checkNotDisposed()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->sHandler:Landroid/os/Handler;

    .line 5
    .line 6
    new-instance v1, Ll/ade0;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1}, Ll/ade0;-><init>(Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;Landroid/media/projection/MediaProjection;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public stopAudioCapture()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->checkNotDisposed()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Landroid/media/projection/MediaProjection;->unregisterCallback(Landroid/media/projection/MediaProjection$Callback;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->sHandler:Landroid/os/Handler;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->sHandler:Landroid/os/Handler;

    .line 18
    .line 19
    new-instance v1, Ll/zce0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/zce0;-><init>(Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method
