.class public Lcom/immomo/mediacore/audio/audio_Indicator;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/mediacore/audio/audio_Indicator$AudioIndicatorHT;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "audio_Indicator"


# instance fields
.field private abs_max_:S

.field private count_:S

.field private current_level_:C

.field kPermutation:[I

.field private kUpdateFrequency:S

.field private mAudioFrames:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "[S>;"
        }
    .end annotation
.end field

.field private volatile mHandler:Landroid/os/Handler;

.field private volatile mHandlerThread:Landroid/os/HandlerThread;

.field private mInterval:I

.field private mMute:Z

.field private mNotifySync:Ljava/lang/Object;

.field private mRtcAudioEventHandler:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

.field protected mRtcAudioHandlerCallbackSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/immomo/mediacore/coninf/MRtcAudioHandler;",
            ">;"
        }
    .end annotation
.end field

.field private mUserID:I


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-short v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->abs_max_:S

    .line 6
    .line 7
    iput-short v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->count_:S

    .line 8
    .line 9
    iput-char v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->current_level_:C

    .line 10
    .line 11
    iput-short v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->kUpdateFrequency:S

    .line 12
    .line 13
    new-instance v1, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mAudioFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    iput-object v1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mRtcAudioEventHandler:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 22
    .line 23
    iput-object v1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandlerThread:Landroid/os/HandlerThread;

    .line 24
    .line 25
    iput-object v1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandler:Landroid/os/Handler;

    .line 26
    .line 27
    const/16 v1, 0x64

    .line 28
    .line 29
    iput v1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mInterval:I

    .line 30
    .line 31
    iput v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mUserID:I

    .line 32
    .line 33
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mMute:Z

    .line 34
    .line 35
    new-instance v2, Ljava/lang/Object;

    .line 36
    .line 37
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mNotifySync:Ljava/lang/Object;

    .line 41
    .line 42
    const/16 v2, 0x21

    .line 43
    .line 44
    new-array v2, v2, [I

    .line 45
    .line 46
    fill-array-data v2, :array_0

    .line 47
    .line 48
    .line 49
    iput-object v2, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->kPermutation:[I

    .line 50
    .line 51
    new-instance v2, Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 52
    .line 53
    invoke-direct {v2}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v2, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mRtcAudioHandlerCallbackSet:Ljava/util/Set;

    .line 57
    .line 58
    iget-object v2, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandlerThread:Landroid/os/HandlerThread;

    .line 59
    .line 60
    if-nez v2, :cond_0

    .line 61
    .line 62
    new-instance v2, Landroid/os/HandlerThread;

    .line 63
    .line 64
    const-string v3, "audio_Indicator"

    .line 65
    .line 66
    const/4 v4, -0x4

    .line 67
    invoke-direct {v2, v3, v4}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    iput-object v2, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandlerThread:Landroid/os/HandlerThread;

    .line 71
    .line 72
    iget-object v2, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandlerThread:Landroid/os/HandlerThread;

    .line 73
    .line 74
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 75
    .line 76
    .line 77
    :cond_0
    iget-object v2, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandler:Landroid/os/Handler;

    .line 78
    .line 79
    if-nez v2, :cond_1

    .line 80
    .line 81
    new-instance v2, Lcom/immomo/mediacore/audio/audio_Indicator$AudioIndicatorHT;

    .line 82
    .line 83
    iget-object v3, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandlerThread:Landroid/os/HandlerThread;

    .line 84
    .line 85
    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-direct {v2, p0, p0, v3}, Lcom/immomo/mediacore/audio/audio_Indicator$AudioIndicatorHT;-><init>(Lcom/immomo/mediacore/audio/audio_Indicator;Lcom/immomo/mediacore/audio/audio_Indicator;Landroid/os/Looper;)V

    .line 90
    .line 91
    .line 92
    iput-object v2, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandler:Landroid/os/Handler;

    .line 93
    .line 94
    :cond_1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v2}, Ll/csx;->w0()Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-eqz v2, :cond_2

    .line 103
    .line 104
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {v2}, Ll/csx;->x0()I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    const/4 v3, 0x1

    .line 113
    if-ne v2, v3, :cond_2

    .line 114
    .line 115
    invoke-static {}, Lcom/immomo/mediacore/audio/AudioNcDynamic;->getInstance()Lcom/immomo/mediacore/audio/AudioNcDynamic;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-virtual {p0, v2}, Lcom/immomo/mediacore/audio/audio_Indicator;->addMRtcAudioHandler(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 120
    .line 121
    .line 122
    iget-object v2, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandler:Landroid/os/Handler;

    .line 123
    .line 124
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    invoke-virtual {v2, v1, v0, v0, v3}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iget-object p0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandler:Landroid/os/Handler;

    .line 133
    .line 134
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 135
    .line 136
    .line 137
    :cond_2
    return-void

    .line 138
    nop

    .line 139
    :array_0
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
        0x4
        0x5
        0x5
        0x5
        0x5
        0x6
        0x6
        0x6
        0x6
        0x6
        0x7
        0x7
        0x7
        0x7
        0x8
        0x8
        0x8
        0x9
        0x9
        0x9
        0x9
        0x9
        0x9
        0x9
        0x9
        0x9
        0x9
        0x9
    .end array-data
.end method

.method private ComputeLevel([SI)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/mediacore/audio/audio_Indicator;->WebRtcSpl_MaxAbsValueW16([SI)S

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-short p2, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->abs_max_:S

    .line 6
    .line 7
    if-le p1, p2, :cond_0

    .line 8
    .line 9
    iput-short p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->abs_max_:S

    .line 10
    .line 11
    :cond_0
    iget-short p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->count_:S

    .line 12
    .line 13
    add-int/lit8 p2, p1, 0x1

    .line 14
    .line 15
    int-to-short p2, p2

    .line 16
    iput-short p2, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->count_:S

    .line 17
    .line 18
    iget-short p2, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->kUpdateFrequency:S

    .line 19
    .line 20
    if-ne p1, p2, :cond_2

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput-short p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->count_:S

    .line 24
    .line 25
    iget-short p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->abs_max_:S

    .line 26
    .line 27
    div-int/lit16 p2, p1, 0x3e8

    .line 28
    .line 29
    if-nez p2, :cond_1

    .line 30
    .line 31
    const/16 v0, 0xfa

    .line 32
    .line 33
    if-le p1, v0, :cond_1

    .line 34
    .line 35
    const/4 p2, 0x1

    .line 36
    :cond_1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->kPermutation:[I

    .line 37
    .line 38
    aget p2, v0, p2

    .line 39
    .line 40
    int-to-char p2, p2

    .line 41
    iput-char p2, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->current_level_:C

    .line 42
    .line 43
    shr-int/lit8 p1, p1, 0x2

    .line 44
    .line 45
    int-to-short p1, p1

    .line 46
    iput-short p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->abs_max_:S

    .line 47
    .line 48
    :cond_2
    return-void
.end method

.method private WebRtcSpl_MaxAbsValueW16([SI)S
    .locals 2

    .line 1
    const/16 p0, -0x8000

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    if-gtz p2, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    if-ge v0, p2, :cond_2

    .line 10
    .line 11
    aget-short v1, p1, v0

    .line 12
    .line 13
    if-le v1, p0, :cond_1

    .line 14
    .line 15
    move p0, v1

    .line 16
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_2
    :goto_1
    return p0
.end method

.method public static synthetic access$000(Lcom/immomo/mediacore/audio/audio_Indicator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/audio_Indicator;->notifyVolumeIndication()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(Lcom/immomo/mediacore/audio/audio_Indicator;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/immomo/mediacore/audio/audio_Indicator;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mInterval:I

    .line 2
    .line 3
    return p0
.end method

.method private notifyVolumeIndication()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mAudioFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_1

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/audio_Indicator;->take()[S

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    array-length v4, v3

    .line 18
    invoke-direct {p0, v3, v4}, Lcom/immomo/mediacore/audio/audio_Indicator;->ComputeLevel([SI)V

    .line 19
    .line 20
    .line 21
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget-object v2, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mNotifySync:Ljava/lang/Object;

    .line 25
    .line 26
    monitor-enter v2

    .line 27
    if-lez v0, :cond_3

    .line 28
    .line 29
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mRtcAudioHandlerCallbackSet:Ljava/util/Set;

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_3

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    new-array v3, v0, [Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 39
    .line 40
    new-instance v4, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 41
    .line 42
    invoke-direct {v4}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 43
    .line 44
    .line 45
    iget v5, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mUserID:I

    .line 46
    .line 47
    iput v5, v4, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 48
    .line 49
    iget-boolean v5, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mMute:Z

    .line 50
    .line 51
    if-eqz v5, :cond_2

    .line 52
    .line 53
    const/4 v5, 0x0

    .line 54
    iput v5, v4, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    goto :goto_3

    .line 59
    :cond_2
    iget-char v5, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->current_level_:C

    .line 60
    .line 61
    int-to-float v5, v5

    .line 62
    const/high16 v6, 0x3f800000    # 1.0f

    .line 63
    .line 64
    mul-float/2addr v5, v6

    .line 65
    const/high16 v6, 0x41100000    # 9.0f

    .line 66
    .line 67
    div-float/2addr v5, v6

    .line 68
    iput v5, v4, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 69
    .line 70
    :goto_1
    aput-object v4, v3, v1

    .line 71
    .line 72
    iget-object p0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mRtcAudioHandlerCallbackSet:Ljava/util/Set;

    .line 73
    .line 74
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_3

    .line 83
    .line 84
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 89
    .line 90
    invoke-interface {v1, v3, v0}, Lcom/immomo/mediacore/coninf/MRtcAudioHandler;->onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V

    .line 91
    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_3
    monitor-exit v2

    .line 95
    return-void

    .line 96
    :goto_3
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    throw p0
.end method

.method private take()[S
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mAudioFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, [S
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    return-object p0

    .line 13
    :catch_0
    move-exception p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-object v0

    .line 16
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method


# virtual methods
.method public addMRtcAudioHandler(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mNotifySync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mRtcAudioHandlerCallbackSet:Ljava/util/Set;

    .line 5
    .line 6
    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mRtcAudioHandlerCallbackSet:Ljava/util/Set;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandler:Landroid/os/Handler;

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandler:Landroid/os/Handler;

    .line 22
    .line 23
    const/16 p1, 0x64

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeMessages(I)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    :goto_0
    monitor-exit v0

    .line 32
    return-void

    .line 33
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    throw p0
.end method

.method public enableAudioVolumeIndication(II)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mInterval:I

    .line 2
    .line 3
    iget-object p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandler:Landroid/os/Handler;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandlerThread:Landroid/os/HandlerThread;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandler:Landroid/os/Handler;

    .line 12
    .line 13
    const/16 p2, 0x64

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeMessages(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandler:Landroid/os/Handler;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p1, p2, v0, v0, v1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandler:Landroid/os/Handler;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public muteAudio(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mMute:Z

    .line 2
    .line 3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v0, "muteAudio: "

    .line 6
    .line 7
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "audio_Indicator"

    .line 18
    .line 19
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public putAudioData([B)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mNotifySync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mRtcAudioHandlerCallbackSet:Ljava/util/Set;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    iget-object v1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mAudioFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/16 v2, 0xa

    .line 19
    .line 20
    if-le v1, v2, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    array-length v0, p1

    .line 25
    div-int/lit8 v0, v0, 0x2

    .line 26
    .line 27
    new-array v0, v0, [S

    .line 28
    .line 29
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, v0}, Ljava/nio/ShortBuffer;->get([S)Ljava/nio/ShortBuffer;

    .line 44
    .line 45
    .line 46
    :try_start_1
    iget-object p0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mAudioFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :catch_0
    move-exception p0

    .line 53
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    :goto_0
    :try_start_2
    monitor-exit v0

    .line 60
    return-void

    .line 61
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 62
    throw p0
.end method

.method public release()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mNotifySync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput-object v1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mRtcAudioEventHandler:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mRtcAudioHandlerCallbackSet:Ljava/util/Set;

    .line 8
    .line 9
    invoke-interface {v2}, Ljava/util/Set;->clear()V

    .line 10
    .line 11
    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    iget-object v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandler:Landroid/os/Handler;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandler:Landroid/os/Handler;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandlerThread:Landroid/os/HandlerThread;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mHandlerThread:Landroid/os/HandlerThread;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 34
    .line 35
    .line 36
    :cond_1
    :try_start_1
    iget-object p0, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mAudioFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :catch_0
    move-exception p0

    .line 43
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 49
    throw p0
.end method

.method public setUserID(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator;->mUserID:I

    .line 2
    .line 3
    return-void
.end method
