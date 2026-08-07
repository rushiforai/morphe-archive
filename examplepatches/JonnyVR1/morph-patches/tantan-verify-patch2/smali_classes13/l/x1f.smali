.class public Ll/x1f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile c:Ll/x1f;


# instance fields
.field private a:Lio/agora/rtc2/RtcEngine;

.field private b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b()Ll/x1f;
    .locals 2

    .line 1
    sget-object v0, Ll/x1f;->c:Ll/x1f;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/x1f;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/x1f;->c:Ll/x1f;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/x1f;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/x1f;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/x1f;->c:Ll/x1f;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/x1f;->c:Ll/x1f;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a(Lio/agora/rtc2/IRtcEngineEventHandler;Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    invoke-static {}, Lio/agora/rtc2/RtcEngine;->destroy()V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p2, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 11
    .line 12
    invoke-virtual {p2, p1}, Lio/agora/rtc2/RtcEngine;->removeHandler(Lio/agora/rtc2/IRtcEngineEventHandler;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lio/agora/rtc2/RtcEngine;->registerVideoFrameObserver(Lio/agora/rtc2/video/IVideoFrameObserver;)I

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 26
    .line 27
    const/4 p2, 0x2

    .line 28
    invoke-virtual {p1, p2}, Lio/agora/rtc2/RtcEngine;->setClientRole(I)I

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 32
    .line 33
    const/4 p2, 0x3

    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-virtual {p1, v0, p2, v0}, Lio/agora/rtc2/RtcEngine;->enableAudioVolumeIndication(IIZ)I

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lio/agora/rtc2/RtcEngine;->enableDualStreamMode(Z)I

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 44
    .line 45
    const/16 p2, 0x64

    .line 46
    .line 47
    invoke-virtual {p1, p2}, Lio/agora/rtc2/RtcEngine;->adjustRecordingSignalVolume(I)I

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Lio/agora/rtc2/RtcEngine;->adjustPlaybackSignalVolume(I)I

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Lio/agora/rtc2/RtcEngine;->adjustAudioMixingVolume(I)I

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 61
    .line 62
    sget-object p2, Lio/agora/rtc2/Constants$AudioMixingDualMonoMode;->AUDIO_MIXING_DUAL_MONO_AUTO:Lio/agora/rtc2/Constants$AudioMixingDualMonoMode;

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Lio/agora/rtc2/RtcEngine;->setAudioMixingDualMonoMode(Lio/agora/rtc2/Constants$AudioMixingDualMonoMode;)I

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 68
    .line 69
    const-wide/high16 v1, 0x4059000000000000L    # 100.0

    .line 70
    .line 71
    invoke-virtual {p1, v1, v2}, Lio/agora/rtc2/RtcEngine;->setEffectsVolume(D)I

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Lio/agora/rtc2/RtcEngine;->setAudioEffectPreset(I)I

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Lio/agora/rtc2/RtcEngine;->muteLocalAudioStream(Z)I

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Lio/agora/rtc2/RtcEngine;->muteLocalVideoStream(Z)I

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Lio/agora/rtc2/RtcEngine;->muteAllRemoteAudioStreams(Z)I

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Lio/agora/rtc2/RtcEngine;->muteAllRemoteVideoStreams(Z)I

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public c(Landroid/content/Context;Ljava/lang/String;Lio/agora/rtc2/IRtcEngineEventHandler;Z)Lio/agora/rtc2/RtcEngine;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_4

    .line 3
    .line 4
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    iget-object v1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 12
    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    if-nez p4, :cond_1

    .line 16
    .line 17
    iget-object p4, p0, Ll/x1f;->b:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p4, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p4

    .line 23
    if-nez p4, :cond_2

    .line 24
    .line 25
    :cond_1
    iget-object p4, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 26
    .line 27
    invoke-virtual {p4}, Lio/agora/rtc2/RtcEngine;->leaveChannel()I

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lio/agora/rtc2/RtcEngine;->destroy()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 34
    .line 35
    :cond_2
    iget-object p4, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 36
    .line 37
    if-nez p4, :cond_3

    .line 38
    .line 39
    new-instance p4, Lio/agora/rtc2/RtcEngineConfig;

    .line 40
    .line 41
    invoke-direct {p4}, Lio/agora/rtc2/RtcEngineConfig;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p4, Lio/agora/rtc2/RtcEngineConfig;->mContext:Landroid/content/Context;

    .line 45
    .line 46
    iput-object p2, p4, Lio/agora/rtc2/RtcEngineConfig;->mAppId:Ljava/lang/String;

    .line 47
    .line 48
    iput-object p3, p4, Lio/agora/rtc2/RtcEngineConfig;->mEventHandler:Lio/agora/rtc2/IRtcEngineEventHandler;

    .line 49
    .line 50
    invoke-static {p4}, Lio/agora/rtc2/RtcEngine;->create(Lio/agora/rtc2/RtcEngineConfig;)Lio/agora/rtc2/RtcEngine;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    invoke-virtual {p4}, Lio/agora/rtc2/RtcEngine;->leaveChannel()I

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 61
    .line 62
    invoke-virtual {p1, p3}, Lio/agora/rtc2/RtcEngine;->addHandler(Lio/agora/rtc2/IRtcEngineEventHandler;)V

    .line 63
    .line 64
    .line 65
    :goto_0
    iput-object p2, p0, Ll/x1f;->b:Ljava/lang/String;

    .line 66
    .line 67
    iget-object p0, p0, Ll/x1f;->a:Lio/agora/rtc2/RtcEngine;

    .line 68
    .line 69
    return-object p0

    .line 70
    :cond_4
    :goto_1
    return-object v0
.end method
