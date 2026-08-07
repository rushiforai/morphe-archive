.class public Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;
.super Lcom/tencent/trtc/TRTCCloud;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Lcom/tencent/liteav/TXCRenderAndDec$b;
.implements Lcom/tencent/liteav/audio/c;
.implements Lcom/tencent/liteav/audio/d;
.implements Lcom/tencent/liteav/audio/e;
.implements Lcom/tencent/liteav/audio/f;
.implements Lcom/tencent/liteav/audio/g;
.implements Lcom/tencent/liteav/basic/b/b;
.implements Lcom/tencent/liteav/d$a;
.implements Lcom/tencent/liteav/o;
.implements Lcom/tencent/liteav/screencapture/a$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;,
        Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;,
        Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$DisplayOrientationDetector;,
        Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$StatusTask;,
        Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask;
    }
.end annotation


# static fields
.field private static final DEFAULT_FPS_FOR_SCREEN_CAPTURE:I = 0xa

.field private static final DEFAULT_GOP_FOR_SCREEN_CAPTURE:I = 0x3

.field private static final KEY_CONFIG_ADJUST_RESOLUTION:Ljava/lang/String; = "config_adjust_resolution"

.field private static final KEY_CONFIG_FPS:Ljava/lang/String; = "config_fps"

.field private static final KEY_CONFIG_GOP:Ljava/lang/String; = "config_gop"

.field private static final MIN_VOLUME_EVALUATION_INTERVAL_MS:I = 0x64

.field private static final RECV_MODE_AUTO_AUDIO_ONLY:I = 0x2

.field private static final RECV_MODE_AUTO_AUDIO_VIDEO:I = 0x1

.field private static final RECV_MODE_AUTO_VIDEO_ONLY:I = 0x3

.field private static final RECV_MODE_MANUAL:I = 0x4

.field private static final RECV_MODE_UNKNOWN:I = 0x0

.field protected static final ROOM_STATE_ENTRING:I = 0x1

.field private static final ROOM_STATE_IN:I = 0x2

.field protected static final ROOM_STATE_OUT:I = 0x0

.field private static final STATE_INTERVAL:I = 0x7d0

.field private static final TAG:Ljava/lang/String; = "TRTCCloudImpl"

.field private static sInstance:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;


# instance fields
.field protected mAppScene:I

.field private mAudioCaptureVolume:I

.field protected mAudioFrameListener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

.field private mAudioPlayoutVolume:I

.field protected mAudioVolumeEvalInterval:I

.field private mBGMNotify:Lcom/tencent/trtc/TRTCCloud$BGMNotify;

.field private mBackground:I

.field private mCallback:Lcom/tencent/liteav/basic/b/a;

.field protected mCaptureAndEnc:Lcom/tencent/liteav/d;

.field private mCaptureFrameCount:J

.field private mCodecType:I

.field protected mConfig:Lcom/tencent/liteav/g;

.field protected mContext:Landroid/content/Context;

.field private mCurrentOrientation:I

.field protected mCurrentPublishClouds:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;",
            ">;"
        }
    .end annotation
.end field

.field protected mCurrentRole:I

.field private mCustomRemoteRender:Z

.field private mCustomVideoUtil:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

.field protected mDebugType:I

.field private mDisplay:Landroid/view/Display;

.field private mEnableCustomAudioCapture:Z

.field private mEnableCustomVideoCapture:Z

.field protected mEnableEosMode:Z

.field private mEnableSmallStream:Z

.field private mEnableSoftAEC:Z

.field private mEnableSoftAGC:Z

.field private mEnableSoftANS:Z

.field private mFloatingWindow:Landroid/view/View;

.field private mFramework:I

.field private mIsAudioCapturing:Z

.field protected mIsExitOldRoom:Z

.field private mIsVideoCapturing:Z

.field private mLastCaptureCalculateTS:J

.field private mLastCaptureFrameCount:J

.field private mLastLogCustomCmdMsgTs:J

.field private mLastLogSEIMsgTs:J

.field private mLastSendMsgTimeMs:J

.field protected mLastStateTimeMs:J

.field private final mLatestParamsOfBigEncoder:Landroid/os/Bundle;

.field private final mLatestParamsOfSmallEncoder:Landroid/os/Bundle;

.field private mListenerHandler:Landroid/os/Handler;

.field private mMainHandler:Lcom/tencent/liteav/basic/util/e;

.field protected mNativeLock:Ljava/lang/Object;

.field protected mNativeRtcContext:J

.field private mNetType:I

.field private mOrientationEventListener:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$DisplayOrientationDetector;

.field private mOverrideFPSFromUser:Z

.field protected mPerformanceMode:I

.field protected mPriorStreamType:I

.field private mQosMode:I

.field private mQosPreference:I

.field private mRecvCustomCmdMsgCountInPeriod:J

.field protected mRecvMode:I

.field private mRecvSEIMsgCountInPeriod:J

.field protected mRenderListenerMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;",
            ">;"
        }
    .end annotation
.end field

.field protected mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

.field protected mRoomState:I

.field protected mSDKHandler:Lcom/tencent/liteav/basic/util/e;

.field private mSendMsgCount:I

.field private mSendMsgSize:I

.field private mSensorMode:I

.field private final mSmallEncParam:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

.field private mSoftAECLevel:I

.field private mSoftAGCLevel:I

.field private mSoftANSLevel:I

.field private mStatusNotifyTask:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$StatusTask;

.field private mStreamTypes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected mSubClouds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;",
            ">;>;"
        }
    .end annotation
.end field

.field protected mTRTCListener:Lcom/tencent/trtc/TRTCCloudListener;

.field protected mTargetRole:I

.field private mVideoRenderMirror:I

.field private mVideoServerConfig:Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

.field private mVideoSourceType:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

.field private mVolumeLevelNotifyTask:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask;

.field final reverbTypes:[Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

.field final voiceChangerTypes:[Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->f()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 13

    .line 1
    invoke-direct {p0}, Lcom/tencent/trtc/TRTCCloud;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_0:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    .line 5
    .line 6
    sget-object v1, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_1:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    .line 7
    .line 8
    sget-object v2, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_2:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    .line 9
    .line 10
    sget-object v3, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_3:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    .line 11
    .line 12
    sget-object v4, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_4:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    .line 13
    .line 14
    sget-object v5, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_5:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    .line 15
    .line 16
    sget-object v6, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_6:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    .line 17
    .line 18
    sget-object v7, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_7:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    .line 19
    .line 20
    filled-new-array/range {v0 .. v7}, [Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->reverbTypes:[Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    .line 25
    .line 26
    sget-object v1, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_0:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    .line 27
    .line 28
    sget-object v2, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_1:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    .line 29
    .line 30
    sget-object v3, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_2:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    .line 31
    .line 32
    sget-object v4, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_3:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    .line 33
    .line 34
    sget-object v5, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_4:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    .line 35
    .line 36
    sget-object v6, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_5:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    .line 37
    .line 38
    sget-object v7, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_6:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    .line 39
    .line 40
    sget-object v8, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_7:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    .line 41
    .line 42
    sget-object v9, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_8:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    .line 43
    .line 44
    sget-object v10, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_9:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    .line 45
    .line 46
    sget-object v11, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_10:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    .line 47
    .line 48
    sget-object v12, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_11:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    .line 49
    .line 50
    filled-new-array/range {v1 .. v12}, [Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->voiceChangerTypes:[Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    .line 55
    .line 56
    new-instance v0, Ljava/lang/Object;

    .line 57
    .line 58
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeLock:Ljava/lang/Object;

    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioFrameListener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

    .line 65
    .line 66
    const/4 v1, 0x2

    .line 67
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mPriorStreamType:I

    .line 68
    .line 69
    const/4 v2, 0x0

    .line 70
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSmallStream:Z

    .line 71
    .line 72
    iput v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoRenderMirror:I

    .line 73
    .line 74
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCustomRemoteRender:Z

    .line 75
    .line 76
    iput v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioVolumeEvalInterval:I

    .line 77
    .line 78
    new-instance v3, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 79
    .line 80
    invoke-direct {v3}, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSmallEncParam:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 84
    .line 85
    const/4 v3, 0x1

    .line 86
    iput v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mQosMode:I

    .line 87
    .line 88
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableEosMode:Z

    .line 89
    .line 90
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCodecType:I

    .line 91
    .line 92
    iput-boolean v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftAEC:Z

    .line 93
    .line 94
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftANS:Z

    .line 95
    .line 96
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftAGC:Z

    .line 97
    .line 98
    const/16 v4, 0x64

    .line 99
    .line 100
    iput v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSoftAECLevel:I

    .line 101
    .line 102
    iput v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSoftANSLevel:I

    .line 103
    .line 104
    iput v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSoftAGCLevel:I

    .line 105
    .line 106
    iput v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioCaptureVolume:I

    .line 107
    .line 108
    iput v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioPlayoutVolume:I

    .line 109
    .line 110
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCustomVideoUtil:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 111
    .line 112
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableCustomAudioCapture:Z

    .line 113
    .line 114
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableCustomVideoCapture:Z

    .line 115
    .line 116
    const/16 v5, 0x14

    .line 117
    .line 118
    iput v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentRole:I

    .line 119
    .line 120
    iput v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTargetRole:I

    .line 121
    .line 122
    const-wide/16 v5, 0x0

    .line 123
    .line 124
    iput-wide v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastCaptureCalculateTS:J

    .line 125
    .line 126
    iput-wide v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureFrameCount:J

    .line 127
    .line 128
    iput-wide v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastCaptureFrameCount:J

    .line 129
    .line 130
    iput v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mPerformanceMode:I

    .line 131
    .line 132
    const/4 v5, -0x1

    .line 133
    iput v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentOrientation:I

    .line 134
    .line 135
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mFloatingWindow:Landroid/view/View;

    .line 136
    .line 137
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mOverrideFPSFromUser:Z

    .line 138
    .line 139
    new-instance v6, Landroid/os/Bundle;

    .line 140
    .line 141
    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 142
    .line 143
    .line 144
    iput-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLatestParamsOfBigEncoder:Landroid/os/Bundle;

    .line 145
    .line 146
    new-instance v6, Landroid/os/Bundle;

    .line 147
    .line 148
    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 149
    .line 150
    .line 151
    iput-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLatestParamsOfSmallEncoder:Landroid/os/Bundle;

    .line 152
    .line 153
    iput v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mFramework:I

    .line 154
    .line 155
    new-instance v6, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$1;

    .line 156
    .line 157
    invoke-direct {v6, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 158
    .line 159
    .line 160
    iput-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCallback:Lcom/tencent/liteav/basic/b/a;

    .line 161
    .line 162
    new-instance v6, Ljava/util/ArrayList;

    .line 163
    .line 164
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 165
    .line 166
    .line 167
    iput-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSubClouds:Ljava/util/ArrayList;

    .line 168
    .line 169
    new-instance v6, Ljava/util/HashMap;

    .line 170
    .line 171
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 172
    .line 173
    .line 174
    iput-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 175
    .line 176
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVolumeLevelNotifyTask:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask;

    .line 177
    .line 178
    iput v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mDebugType:I

    .line 179
    .line 180
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mStatusNotifyTask:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$StatusTask;

    .line 181
    .line 182
    iput v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNetType:I

    .line 183
    .line 184
    iput v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mBackground:I

    .line 185
    .line 186
    invoke-direct {p0, p1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->init(Landroid/content/Context;Lcom/tencent/liteav/basic/util/e;)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 190
    .line 191
    invoke-static {v0}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->setAppContext(Landroid/content/Context;)V

    .line 192
    .line 193
    .line 194
    invoke-static {}, Lcom/tencent/liteav/basic/log/TXCLog;->init()Z

    .line 195
    .line 196
    .line 197
    invoke-static {p1}, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->loadFromSharedPreferences(Landroid/content/Context;)Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    const-string v2, "audio config from shared preference: %s"

    .line 202
    .line 203
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v5

    .line 207
    const-string v6, "TRTCCloudImpl"

    .line 208
    .line 209
    invoke-static {v6, v2, v5}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 210
    .line 211
    .line 212
    iget-boolean v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->enableOpenSL:Z

    .line 213
    .line 214
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    iget-boolean v5, v0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->isLowLatencySampleRateSupported:Z

    .line 219
    .line 220
    iget-wide v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->lowLatencySampleRateBlockTime:J

    .line 221
    .line 222
    invoke-static {p1, v2, v5, v6, v7}, Lcom/tencent/liteav/audio/TXCAudioEngine;->buildTRAEConfig(Landroid/content/Context;Ljava/lang/Boolean;ZJ)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 227
    .line 228
    invoke-static {v5, v2}, Lcom/tencent/liteav/audio/TXCAudioEngine;->CreateInstanceWithoutInitDevice(Landroid/content/Context;Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    invoke-virtual {v2}, Lcom/tencent/liteav/audio/TXCAudioEngine;->clean()V

    .line 236
    .line 237
    .line 238
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    invoke-virtual {v2, p0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setAudioCaptureDataListener(Lcom/tencent/liteav/audio/f;)Z

    .line 243
    .line 244
    .line 245
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    new-instance v5, Ljava/lang/ref/WeakReference;

    .line 250
    .line 251
    iget-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCallback:Lcom/tencent/liteav/basic/b/a;

    .line 252
    .line 253
    invoke-direct {v5, v6}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v2, v5}, Lcom/tencent/liteav/audio/TXCAudioEngine;->addEventCallback(Ljava/lang/ref/WeakReference;)V

    .line 257
    .line 258
    .line 259
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    iget-boolean v5, v0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->enableAutoRestartDevice:Z

    .line 264
    .line 265
    invoke-virtual {v2, v5}, Lcom/tencent/liteav/audio/TXCAudioEngine;->enableAutoRestartDevice(Z)V

    .line 266
    .line 267
    .line 268
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    iget v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->maxSelectedPlayStreams:I

    .line 273
    .line 274
    invoke-virtual {v2, v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setMaxSelectedPlayStreams(I)V

    .line 275
    .line 276
    .line 277
    invoke-static {v3}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetAudioPlayoutTunnelEnabled(Z)V

    .line 278
    .line 279
    .line 280
    new-instance v0, Lcom/tencent/liteav/d;

    .line 281
    .line 282
    invoke-direct {v0, p1}, Lcom/tencent/liteav/d;-><init>(Landroid/content/Context;)V

    .line 283
    .line 284
    .line 285
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 286
    .line 287
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/d;->i(I)V

    .line 288
    .line 289
    .line 290
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 291
    .line 292
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 293
    .line 294
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/g;)V

    .line 295
    .line 296
    .line 297
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 298
    .line 299
    invoke-virtual {p1, v3}, Lcom/tencent/liteav/d;->h(Z)V

    .line 300
    .line 301
    .line 302
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 303
    .line 304
    invoke-virtual {p1, v3}, Lcom/tencent/liteav/d;->f(Z)V

    .line 305
    .line 306
    .line 307
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 308
    .line 309
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/basic/b/b;)V

    .line 310
    .line 311
    .line 312
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 313
    .line 314
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/d$a;)V

    .line 315
    .line 316
    .line 317
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 318
    .line 319
    const-string v0, "18446744073709551615"

    .line 320
    .line 321
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/d;->setID(Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 325
    .line 326
    invoke-virtual {p1, v3}, Lcom/tencent/liteav/d;->g(Z)V

    .line 327
    .line 328
    .line 329
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 330
    .line 331
    invoke-static {p1}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(Landroid/content/Context;)V

    .line 332
    .line 333
    .line 334
    const-string p1, "reset audio volume"

    .line 335
    .line 336
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 337
    .line 338
    .line 339
    invoke-virtual {p0, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setAudioCaptureVolume(I)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {p0, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setAudioPlayoutVolume(I)V

    .line 343
    .line 344
    .line 345
    invoke-static {}, Lcom/tencent/liteav/audio/TXCSoundEffectPlayer;->getInstance()Lcom/tencent/liteav/audio/TXCSoundEffectPlayer;

    .line 346
    .line 347
    .line 348
    move-result-object p1

    .line 349
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/audio/TXCSoundEffectPlayer;->setSoundEffectListener(Lcom/tencent/liteav/audio/c;)V

    .line 350
    .line 351
    .line 352
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/tencent/liteav/basic/util/e;)V
    .locals 13

    .line 353
    invoke-direct {p0}, Lcom/tencent/trtc/TRTCCloud;-><init>()V

    .line 354
    sget-object v0, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_0:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    sget-object v1, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_1:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    sget-object v2, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_2:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    sget-object v3, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_3:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    sget-object v4, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_4:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    sget-object v5, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_5:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    sget-object v6, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_6:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    sget-object v7, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;->TXLiveVoiceReverbType_7:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    filled-new-array/range {v0 .. v7}, [Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->reverbTypes:[Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;

    .line 355
    sget-object v1, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_0:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    sget-object v2, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_1:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    sget-object v3, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_2:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    sget-object v4, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_3:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    sget-object v5, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_4:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    sget-object v6, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_5:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    sget-object v7, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_6:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    sget-object v8, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_7:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    sget-object v9, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_8:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    sget-object v10, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_9:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    sget-object v11, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_10:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    sget-object v12, Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;->TXLiveVoiceChangerType_11:Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    filled-new-array/range {v1 .. v12}, [Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->voiceChangerTypes:[Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;

    .line 356
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeLock:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 357
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioFrameListener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

    const/4 v1, 0x2

    .line 358
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mPriorStreamType:I

    const/4 v2, 0x0

    .line 359
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSmallStream:Z

    .line 360
    iput v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoRenderMirror:I

    .line 361
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCustomRemoteRender:Z

    .line 362
    iput v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioVolumeEvalInterval:I

    .line 363
    new-instance v3, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    invoke-direct {v3}, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;-><init>()V

    iput-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSmallEncParam:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    const/4 v3, 0x1

    .line 364
    iput v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mQosMode:I

    .line 365
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableEosMode:Z

    .line 366
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCodecType:I

    .line 367
    iput-boolean v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftAEC:Z

    .line 368
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftANS:Z

    .line 369
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftAGC:Z

    const/16 v1, 0x64

    .line 370
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSoftAECLevel:I

    .line 371
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSoftANSLevel:I

    .line 372
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSoftAGCLevel:I

    .line 373
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioCaptureVolume:I

    .line 374
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioPlayoutVolume:I

    .line 375
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCustomVideoUtil:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 376
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableCustomAudioCapture:Z

    .line 377
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableCustomVideoCapture:Z

    const/16 v1, 0x14

    .line 378
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentRole:I

    .line 379
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTargetRole:I

    const-wide/16 v4, 0x0

    .line 380
    iput-wide v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastCaptureCalculateTS:J

    .line 381
    iput-wide v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureFrameCount:J

    .line 382
    iput-wide v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastCaptureFrameCount:J

    .line 383
    iput v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mPerformanceMode:I

    const/4 v1, -0x1

    .line 384
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentOrientation:I

    .line 385
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mFloatingWindow:Landroid/view/View;

    .line 386
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mOverrideFPSFromUser:Z

    .line 387
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    iput-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLatestParamsOfBigEncoder:Landroid/os/Bundle;

    .line 388
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    iput-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLatestParamsOfSmallEncoder:Landroid/os/Bundle;

    .line 389
    iput v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mFramework:I

    .line 390
    new-instance v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$1;

    invoke-direct {v3, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    iput-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCallback:Lcom/tencent/liteav/basic/b/a;

    .line 391
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSubClouds:Ljava/util/ArrayList;

    .line 392
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 393
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVolumeLevelNotifyTask:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask;

    .line 394
    iput v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mDebugType:I

    .line 395
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mStatusNotifyTask:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$StatusTask;

    .line 396
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNetType:I

    .line 397
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mBackground:I

    .line 398
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->init(Landroid/content/Context;Lcom/tencent/liteav/basic/util/e;)V

    const/16 p1, 0x15

    .line 399
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentRole:I

    .line 400
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTargetRole:I

    return-void
.end method

.method public static synthetic access$000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mListenerHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCodecType:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mFramework:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mStreamTypes:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->addUpStreamType(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableCustomAudioCapture:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1302(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableCustomAudioCapture:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mIsAudioCapturing:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1402(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mIsAudioCapturing:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoSourceType:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1502(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoSourceType:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JLjava/lang/String;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeConnectOtherRoom(JLjava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$1700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeDisconnectOtherRoom(J)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$1800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JI)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeChangeRole(JI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->isNumericRoom(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mQosMode:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$2000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mIsVideoCapturing:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$2002(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mIsVideoCapturing:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$202(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mQosMode:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$2100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$DisplayOrientationDetector;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mOrientationEventListener:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$DisplayOrientationDetector;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->updateOrientation()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnMainThreadAndWaitDone(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableCustomVideoCapture:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$2402(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableCustomVideoCapture:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$2500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->createUserInfo(Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$2600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->notifyLogByUserId(Ljava/lang/String;IILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/TXCRenderAndDec;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startRemoteRender(Lcom/tencent/liteav/TXCRenderAndDec;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeRequestDownStream(JJIZ)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$2900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeCancelDownStream(JJIZ)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mQosPreference:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$3000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopRemoteMainRender(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$302(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mQosPreference:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$3100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopRemoteSubRender(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->notifyCaptureStarted(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSensorMode:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$3302(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSensorMode:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$3400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mOverrideFPSFromUser:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$3402(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mOverrideFPSFromUser:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$3500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setVideoEncoderParamInternal(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ZIIIIZI)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->updateBigStreamEncoder(ZIIIIZI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;II)Lcom/tencent/liteav/g$a;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getSizeByResolution(II)Lcom/tencent/liteav/g$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$3800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIII)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->updateSmallStreamEncoder(IIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->showFloatingWindow(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setVideoQuality(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->hideFloatingWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLatestParamsOfBigEncoder:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$4200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLatestParamsOfSmallEncoder:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$4300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteUpstream(IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->removeUpStreamType(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4502(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoRenderMirror:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$4600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setQoSParams()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopLocalAudioInternal()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;I)Lcom/tencent/liteav/renderer/e;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->internalGetRemoteUserRender(Ljava/lang/String;I)Lcom/tencent/liteav/renderer/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$4900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setAudioEncodeConfiguration()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIZI)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setVideoEncConfig(IIIIIZI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVolumeLevelNotifyTask:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$5102(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastCaptureCalculateTS:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$5200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCustomVideoUtil:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$5202(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;)Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCustomVideoUtil:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$5300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setLocalAudioMuteMode(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setVideoEncoderParamEx(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setAudioSampleRate(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableAudioAGC(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableAudioAEC(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableAudioANS(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setCustomRenderMode(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSmallStream:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$6000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setMediaCodecConfig(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$602(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSmallStream:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$6100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setFramework(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->forceCallbackMixedPlayAudioFrame(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6302(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCustomRemoteRender:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$6400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)Lcom/tencent/liteav/basic/a/b;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getPixelFormat(I)Lcom/tencent/liteav/basic/a/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$6500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloud$BGMNotify;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mBGMNotify:Lcom/tencent/trtc/TRTCCloud$BGMNotify;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$6502(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloud$BGMNotify;)Lcom/tencent/trtc/TRTCCloud$BGMNotify;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mBGMNotify:Lcom/tencent/trtc/TRTCCloud$BGMNotify;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$6600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeStartSpeedTest(JILjava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeStopSpeedTest(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JLcom/tencent/trtc/TRTCCloudDef$TRTCPublishCDNParam;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeStartPublishCDNStream(JLcom/tencent/trtc/TRTCCloudDef$TRTCPublishCDNParam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeStopPublishing(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSmallEncParam:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$7000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeStopPublishCDNStream(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JLjava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeStartPublishing(JLjava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JILjava/lang/String;ZZ)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeSendCustomCmdMsg(JILjava/lang/String;ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J[BI)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeSendSEIMsg(J[BI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->notifyEventByUserId(Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJI)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeRequestKeyFrame(JJI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->notifyEvent(Ljava/lang/String;ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/Runnable;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onExitRoom(ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JI)Lcom/tencent/liteav/TXCRenderAndDec;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->createRender(JI)Lcom/tencent/liteav/TXCRenderAndDec;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIIZI)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p8}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setVideoEncoderConfiguration(IIIIIIZI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$8000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->appendDashboardLog(Ljava/lang/String;ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$8100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRecvSEIMsgCountInPeriod:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$8102(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRecvSEIMsgCountInPeriod:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$8108(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)J
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRecvSEIMsgCountInPeriod:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v2, v0

    .line 6
    iput-wide v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRecvSEIMsgCountInPeriod:J

    .line 7
    .line 8
    return-wide v0
.end method

.method public static synthetic access$8200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastLogSEIMsgTs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$8202(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastLogSEIMsgTs:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$8300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/TXCRenderAndDec;Lcom/tencent/liteav/h;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->applyRenderPlayStrategy(Lcom/tencent/liteav/TXCRenderAndDec;Lcom/tencent/liteav/h;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$8400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->translateStreamType(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$8500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoServerConfig:Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$8502(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;)Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoServerConfig:Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$8600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->appendDashboardLog(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$8700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNetType:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$8702(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNetType:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$8800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JI)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeReenterRoom(JI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$8900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mBackground:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$8902(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mBackground:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeSetDataReportDeviceInfo(Ljava/lang/String;Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$9000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->checkRTCState()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$9100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->collectCustomCaptureFps()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$9200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/TXCRenderAndDec;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;Lcom/tencent/trtc/TRTCStatistics;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->addRemoteStatistics(Lcom/tencent/liteav/TXCRenderAndDec;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;Lcom/tencent/trtc/TRTCStatistics;Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$9300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->checkRenderRotation(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$9400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->checkVideoEncRotation(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$9500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getDisplayRotation()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$9600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setOrientation(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private addRemoteStatistics(Lcom/tencent/liteav/TXCRenderAndDec;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;Lcom/tencent/trtc/TRTCStatistics;Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tencent/liteav/TXCRenderAndDec;",
            "Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;",
            "Lcom/tencent/trtc/TRTCStatistics;",
            "Ljava/util/ArrayList<",
            "Lcom/tencent/trtc/TRTCCloudDef$TRTCQuality;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getRemoteStatistics(Lcom/tencent/liteav/TXCRenderAndDec;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p3, Lcom/tencent/trtc/TRTCStatistics;->remoteArray:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-wide v0, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 11
    .line 12
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/16 v1, 0x3e82

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p3, Lcom/tencent/trtc/TRTCStatistics;->downLoss:I

    .line 23
    .line 24
    new-instance v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCQuality;

    .line 25
    .line 26
    invoke-direct {v0}, Lcom/tencent/trtc/TRTCCloudDef$TRTCQuality;-><init>()V

    .line 27
    .line 28
    .line 29
    iget-object p2, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->userID:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p2, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCQuality;->userId:Ljava/lang/String;

    .line 32
    .line 33
    iget p2, p3, Lcom/tencent/trtc/TRTCStatistics;->rtt:I

    .line 34
    .line 35
    iget p1, p1, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->finalLoss:I

    .line 36
    .line 37
    invoke-virtual {p0, p2, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getNetworkQuality(II)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    iput p0, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCQuality;->quality:I

    .line 42
    .line 43
    invoke-virtual {p4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private addUpStreamType(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mStreamTypes:Ljava/util/Set;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mStreamTypes:Ljava/util/Set;

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->addUpstream(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private addUpstream(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getNetworkContext()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-virtual {p0, v0, v1, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeAddUpstream(JI)I

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private appendDashboardLog(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1

    .line 74
    const-string v0, ""

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->appendDashboardLog(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private appendDashboardLog(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p4

    .line 16
    invoke-virtual {p0, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p4

    .line 23
    if-nez p4, :cond_3

    .line 24
    .line 25
    iget-object p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 26
    .line 27
    iget-object p4, p4, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->userId:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p4, :cond_0

    .line 30
    .line 31
    invoke-virtual {p1, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p4

    .line 35
    if-eqz p4, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 39
    .line 40
    invoke-virtual {p4, p1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUser(Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    const/4 p4, 0x7

    .line 47
    if-ne p2, p4, :cond_1

    .line 48
    .line 49
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    const/4 p1, 0x0

    .line 60
    goto :goto_1

    .line 61
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->localView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 64
    .line 65
    :goto_1
    new-instance p2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$169;

    .line 66
    .line 67
    invoke-direct {p2, p0, p1, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$169;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/rtmp/ui/TXCloudVideoView;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method private applyRenderConfig(Lcom/tencent/liteav/TXCRenderAndDec;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/tencent/liteav/h;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/liteav/h;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-boolean v1, v0, Lcom/tencent/liteav/h;->h:Z

    .line 8
    .line 9
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAppScene:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-ne v1, v2, :cond_0

    .line 13
    .line 14
    iput-boolean v2, v0, Lcom/tencent/liteav/h;->h:Z

    .line 15
    .line 16
    :cond_0
    const-string v1, "18446744073709551615"

    .line 17
    .line 18
    const/16 v2, 0x427c

    .line 19
    .line 20
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    const/16 v1, 0x258

    .line 27
    .line 28
    :cond_1
    iput v1, v0, Lcom/tencent/liteav/h;->d:I

    .line 29
    .line 30
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->decProperties:Lorg/json/JSONArray;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/tencent/liteav/h;->r:Lorg/json/JSONArray;

    .line 35
    .line 36
    invoke-direct {p0, p1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->applyRenderPlayStrategy(Lcom/tencent/liteav/TXCRenderAndDec;Lcom/tencent/liteav/h;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private applyRenderPlayStrategy(Lcom/tencent/liteav/TXCRenderAndDec;Lcom/tencent/liteav/h;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p2, Lcom/tencent/liteav/h;->g:Z

    .line 3
    .line 4
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentRole:I

    .line 5
    .line 6
    const/16 v0, 0x14

    .line 7
    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    sget p0, Lcom/tencent/liteav/basic/a/a;->a:F

    .line 11
    .line 12
    iput p0, p2, Lcom/tencent/liteav/h;->a:F

    .line 13
    .line 14
    sget p0, Lcom/tencent/liteav/basic/a/a;->b:F

    .line 15
    .line 16
    iput p0, p2, Lcom/tencent/liteav/h;->c:F

    .line 17
    .line 18
    sget p0, Lcom/tencent/liteav/basic/a/a;->c:F

    .line 19
    .line 20
    iput p0, p2, Lcom/tencent/liteav/h;->b:F

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/16 v0, 0x15

    .line 24
    .line 25
    if-ne p0, v0, :cond_1

    .line 26
    .line 27
    sget p0, Lcom/tencent/liteav/basic/a/a;->d:F

    .line 28
    .line 29
    iput p0, p2, Lcom/tencent/liteav/h;->a:F

    .line 30
    .line 31
    sget p0, Lcom/tencent/liteav/basic/a/a;->e:F

    .line 32
    .line 33
    iput p0, p2, Lcom/tencent/liteav/h;->c:F

    .line 34
    .line 35
    sget p0, Lcom/tencent/liteav/basic/a/a;->f:F

    .line 36
    .line 37
    iput p0, p2, Lcom/tencent/liteav/h;->b:F

    .line 38
    .line 39
    :cond_1
    :goto_0
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/TXCRenderAndDec;->setConfig(Lcom/tencent/liteav/h;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private checkRTCState()V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastStateTimeMs:J

    .line 6
    .line 7
    const-wide/16 v4, 0x7d0

    .line 8
    .line 9
    add-long/2addr v2, v4

    .line 10
    cmp-long v2, v0, v2

    .line 11
    .line 12
    if-gez v2, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iput-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastStateTimeMs:J

    .line 16
    .line 17
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->a()[I

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v2, Lcom/tencent/trtc/TRTCStatistics;

    .line 27
    .line 28
    invoke-direct {v2}, Lcom/tencent/trtc/TRTCStatistics;-><init>()V

    .line 29
    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    aget v3, v0, v3

    .line 33
    .line 34
    div-int/lit8 v3, v3, 0xa

    .line 35
    .line 36
    iput v3, v2, Lcom/tencent/trtc/TRTCStatistics;->appCpu:I

    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    aget v0, v0, v3

    .line 40
    .line 41
    div-int/lit8 v0, v0, 0xa

    .line 42
    .line 43
    iput v0, v2, Lcom/tencent/trtc/TRTCStatistics;->systemCpu:I

    .line 44
    .line 45
    const/16 v0, 0x2ee2

    .line 46
    .line 47
    const-string v3, "18446744073709551615"

    .line 48
    .line 49
    invoke-static {v3, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iput v0, v2, Lcom/tencent/trtc/TRTCStatistics;->rtt:I

    .line 54
    .line 55
    const/16 v0, 0x2ee4

    .line 56
    .line 57
    invoke-static {v3, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 58
    .line 59
    .line 60
    move-result-wide v4

    .line 61
    iput-wide v4, v2, Lcom/tencent/trtc/TRTCStatistics;->sendBytes:J

    .line 62
    .line 63
    const/16 v0, 0x3e84

    .line 64
    .line 65
    invoke-static {v3, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 66
    .line 67
    .line 68
    move-result-wide v4

    .line 69
    iput-wide v4, v2, Lcom/tencent/trtc/TRTCStatistics;->receiveBytes:J

    .line 70
    .line 71
    const/16 v0, 0x2ee3

    .line 72
    .line 73
    invoke-static {v3, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iput v0, v2, Lcom/tencent/trtc/TRTCStatistics;->upLoss:I

    .line 78
    .line 79
    new-instance v0, Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .line 83
    .line 84
    iput-object v0, v2, Lcom/tencent/trtc/TRTCStatistics;->localArray:Ljava/util/ArrayList;

    .line 85
    .line 86
    new-instance v0, Ljava/util/ArrayList;

    .line 87
    .line 88
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .line 90
    .line 91
    iput-object v0, v2, Lcom/tencent/trtc/TRTCStatistics;->remoteArray:Ljava/util/ArrayList;

    .line 92
    .line 93
    const/4 v0, 0x2

    .line 94
    invoke-direct {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getLocalStatistics(I)Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v4, v2, Lcom/tencent/trtc/TRTCStatistics;->localArray:Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    iget-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSmallStream:Z

    .line 104
    .line 105
    if-eqz v0, :cond_1

    .line 106
    .line 107
    const/4 v0, 0x3

    .line 108
    invoke-direct {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getLocalStatistics(I)Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget-object v4, v2, Lcom/tencent/trtc/TRTCStatistics;->localArray:Ljava/util/ArrayList;

    .line 113
    .line 114
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 118
    .line 119
    new-instance v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$177;

    .line 120
    .line 121
    invoke-direct {v4, p0, v2, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$177;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCStatistics;Ljava/util/ArrayList;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->forEachUser(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;)V

    .line 125
    .line 126
    .line 127
    new-instance v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCQuality;

    .line 128
    .line 129
    invoke-direct {v0}, Lcom/tencent/trtc/TRTCCloudDef$TRTCQuality;-><init>()V

    .line 130
    .line 131
    .line 132
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 133
    .line 134
    invoke-virtual {v4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    iput-object v4, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCQuality;->userId:Ljava/lang/String;

    .line 139
    .line 140
    const/16 v4, 0x2ee5

    .line 141
    .line 142
    invoke-static {v3, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    iput v3, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCQuality;->quality:I

    .line 147
    .line 148
    new-instance v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$178;

    .line 149
    .line 150
    invoke-direct {v3, p0, v2, v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$178;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCStatistics;Lcom/tencent/trtc/TRTCCloudDef$TRTCQuality;Ljava/util/ArrayList;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method private checkRenderRotation(I)V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getDisplayRotation()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    rsub-int v1, v0, 0x168

    .line 6
    .line 7
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 8
    .line 9
    iget v3, v2, Lcom/tencent/liteav/g;->l:I

    .line 10
    .line 11
    add-int/lit8 v4, v3, -0x1

    .line 12
    .line 13
    mul-int/lit8 v4, v4, 0x5a

    .line 14
    .line 15
    sub-int/2addr v1, v4

    .line 16
    rem-int/lit16 v1, v1, 0x168

    .line 17
    .line 18
    rem-int/lit8 v4, p1, 0x2

    .line 19
    .line 20
    rem-int/lit8 v5, v0, 0x2

    .line 21
    .line 22
    const/4 v6, 0x1

    .line 23
    if-ne v4, v5, :cond_0

    .line 24
    .line 25
    if-eq v3, v6, :cond_1

    .line 26
    .line 27
    :cond_0
    if-eq v4, v5, :cond_2

    .line 28
    .line 29
    if-nez v3, :cond_2

    .line 30
    .line 31
    :cond_1
    move v3, v6

    .line 32
    goto :goto_0

    .line 33
    :cond_2
    const/4 v3, 0x0

    .line 34
    :goto_0
    iget v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoRenderMirror:I

    .line 35
    .line 36
    if-ne v4, v6, :cond_3

    .line 37
    .line 38
    iget-boolean v2, v2, Lcom/tencent/liteav/g;->m:Z

    .line 39
    .line 40
    if-nez v2, :cond_4

    .line 41
    .line 42
    if-eqz v3, :cond_4

    .line 43
    .line 44
    :goto_1
    add-int/lit16 v1, v1, 0xb4

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_3
    const/4 v5, 0x2

    .line 48
    if-ne v4, v5, :cond_4

    .line 49
    .line 50
    iget-boolean v2, v2, Lcom/tencent/liteav/g;->m:Z

    .line 51
    .line 52
    if-eqz v2, :cond_4

    .line 53
    .line 54
    if-eqz v3, :cond_4

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_4
    :goto_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 67
    .line 68
    iget v3, v3, Lcom/tencent/liteav/g;->l:I

    .line 69
    .line 70
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 83
    .line 84
    iget v5, v5, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->localRenderRotation:I

    .line 85
    .line 86
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    filled-new-array {p1, v3, v0, v4, v5}, [Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    const-string v0, "vrotation rotation-change %d-%d-%d ======= renderRotation %d-%d"

    .line 95
    .line 96
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string p1, " self:"

    .line 104
    .line 105
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    const-string v0, "TRTCCloudImpl"

    .line 120
    .line 121
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 125
    .line 126
    iget p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->localRenderRotation:I

    .line 127
    .line 128
    add-int/2addr p1, v1

    .line 129
    rem-int/lit16 p1, p1, 0x168

    .line 130
    .line 131
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 132
    .line 133
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/d;->g(I)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method private checkVideoEncRotation(I)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 2
    .line 3
    iget v1, v0, Lcom/tencent/liteav/g;->l:I

    .line 4
    .line 5
    const/16 v2, 0x10e

    .line 6
    .line 7
    const/16 v3, 0x5a

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    const/4 v5, 0x1

    .line 11
    if-eq v1, v5, :cond_3

    .line 12
    .line 13
    iget-boolean v1, v0, Lcom/tencent/liteav/g;->S:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-boolean v6, v0, Lcom/tencent/liteav/g;->m:Z

    .line 18
    .line 19
    if-nez v6, :cond_1

    .line 20
    .line 21
    :cond_0
    if-nez v1, :cond_2

    .line 22
    .line 23
    iget-boolean v1, v0, Lcom/tencent/liteav/g;->m:Z

    .line 24
    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    :cond_1
    move v1, v3

    .line 28
    goto :goto_0

    .line 29
    :cond_2
    move v1, v2

    .line 30
    goto :goto_0

    .line 31
    :cond_3
    move v1, v4

    .line 32
    :goto_0
    if-eqz p1, :cond_8

    .line 33
    .line 34
    if-eq p1, v5, :cond_7

    .line 35
    .line 36
    const/4 v3, 0x2

    .line 37
    if-eq p1, v3, :cond_5

    .line 38
    .line 39
    const/4 v0, 0x3

    .line 40
    if-eq p1, v0, :cond_4

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_4
    add-int/lit16 v1, v1, 0xb4

    .line 44
    .line 45
    rem-int/lit16 v4, v1, 0x168

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_5
    add-int/2addr v1, v2

    .line 49
    rem-int/lit16 v1, v1, 0x168

    .line 50
    .line 51
    iget-boolean v2, v0, Lcom/tencent/liteav/g;->m:Z

    .line 52
    .line 53
    if-nez v2, :cond_6

    .line 54
    .line 55
    add-int/lit16 v1, v1, 0xb4

    .line 56
    .line 57
    rem-int/lit16 v1, v1, 0x168

    .line 58
    .line 59
    :cond_6
    move v4, v1

    .line 60
    iget-boolean v0, v0, Lcom/tencent/liteav/g;->S:Z

    .line 61
    .line 62
    if-eqz v0, :cond_a

    .line 63
    .line 64
    add-int/lit16 v4, v4, 0xb4

    .line 65
    .line 66
    rem-int/lit16 v4, v4, 0x168

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_7
    rem-int/lit16 v4, v1, 0x168

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_8
    add-int/2addr v1, v3

    .line 73
    rem-int/lit16 v1, v1, 0x168

    .line 74
    .line 75
    iget-boolean v2, v0, Lcom/tencent/liteav/g;->m:Z

    .line 76
    .line 77
    if-nez v2, :cond_9

    .line 78
    .line 79
    add-int/lit16 v1, v1, 0xb4

    .line 80
    .line 81
    rem-int/lit16 v1, v1, 0x168

    .line 82
    .line 83
    :cond_9
    move v4, v1

    .line 84
    iget-boolean v0, v0, Lcom/tencent/liteav/g;->S:Z

    .line 85
    .line 86
    if-eqz v0, :cond_a

    .line 87
    .line 88
    add-int/lit16 v4, v4, 0xb4

    .line 89
    .line 90
    rem-int/lit16 v4, v4, 0x168

    .line 91
    .line 92
    :cond_a
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 102
    .line 103
    iget v2, v2, Lcom/tencent/liteav/g;->l:I

    .line 104
    .line 105
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    filled-new-array {v1, v2, v3}, [Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    const-string v2, "vrotation rotation-change %d-%d ======= encRotation %d"

    .line 118
    .line 119
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v1, " self:"

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    const-string v1, "TRTCCloudImpl"

    .line 143
    .line 144
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentOrientation:I

    .line 148
    .line 149
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 150
    .line 151
    invoke-virtual {p0, v4}, Lcom/tencent/liteav/d;->a(I)V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method private collectCustomCaptureFps()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoSourceType:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 2
    .line 3
    sget-object v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->CUSTOM:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget-wide v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastCaptureCalculateTS:J

    .line 12
    .line 13
    sub-long v2, v0, v2

    .line 14
    .line 15
    const-wide/16 v4, 0x3e8

    .line 16
    .line 17
    cmp-long v4, v2, v4

    .line 18
    .line 19
    if-ltz v4, :cond_0

    .line 20
    .line 21
    iget-wide v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureFrameCount:J

    .line 22
    .line 23
    iget-wide v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastCaptureFrameCount:J

    .line 24
    .line 25
    sub-long v6, v4, v6

    .line 26
    .line 27
    long-to-double v6, v6

    .line 28
    const-wide v8, 0x408f400000000000L    # 1000.0

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    mul-double/2addr v6, v8

    .line 34
    long-to-double v2, v2

    .line 35
    div-double/2addr v6, v2

    .line 36
    iput-wide v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastCaptureFrameCount:J

    .line 37
    .line 38
    iput-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastCaptureCalculateTS:J

    .line 39
    .line 40
    const/4 p0, 0x2

    .line 41
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "18446744073709551615"

    .line 46
    .line 47
    const/16 v2, 0x3e9

    .line 48
    .line 49
    invoke-static {v1, v2, p0, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method private static createAudioServerConfigFromNative()Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private createRender(JI)Lcom/tencent/liteav/TXCRenderAndDec;
    .locals 2

    .line 1
    new-instance v0, Lcom/tencent/liteav/TXCRenderAndDec;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/tencent/liteav/TXCRenderAndDec;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/TXCRenderAndDec;->setID(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Lcom/tencent/liteav/renderer/a;

    .line 16
    .line 17
    invoke-direct {p1}, Lcom/tencent/liteav/renderer/a;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/TXCRenderAndDec;->setVideoRender(Lcom/tencent/liteav/renderer/e;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p3}, Lcom/tencent/liteav/TXCRenderAndDec;->setStreamType(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/TXCRenderAndDec;->setNotifyListener(Lcom/tencent/liteav/basic/b/b;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/TXCRenderAndDec;->setRenderAndDecDelegate(Lcom/tencent/liteav/TXCRenderAndDec$b;)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/TXCRenderAndDec;->setRenderMode(I)V

    .line 34
    .line 35
    .line 36
    iget p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mPerformanceMode:I

    .line 37
    .line 38
    const/4 p3, 0x1

    .line 39
    if-eq p2, p3, :cond_0

    .line 40
    .line 41
    move p1, p3

    .line 42
    :cond_0
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/TXCRenderAndDec;->enableDecoderChange(Z)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 46
    .line 47
    iget-boolean p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->enableRestartDecoder:Z

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/TXCRenderAndDec;->enableRestartDecoder(Z)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoServerConfig:Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

    .line 53
    .line 54
    iget-boolean p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;->enableHWVUI:Z

    .line 55
    .line 56
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/TXCRenderAndDec;->enableLimitDecCache(Z)V

    .line 57
    .line 58
    .line 59
    invoke-direct {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->applyRenderConfig(Lcom/tencent/liteav/TXCRenderAndDec;)V

    .line 60
    .line 61
    .line 62
    return-object v0
.end method

.method private createUserInfo(Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;
    .locals 6

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 2
    .line 3
    const/4 v4, 0x0

    .line 4
    const/4 v5, 0x0

    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    move-object v3, p1

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;-><init>(JLjava/lang/String;II)V

    .line 9
    .line 10
    .line 11
    iget-object p1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 14
    .line 15
    iget-boolean v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->muteRemoteVideo:Z

    .line 16
    .line 17
    iput-boolean v1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->muteVideo:Z

    .line 18
    .line 19
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->muteRemoteAudio:Z

    .line 20
    .line 21
    iput-boolean p0, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->muteAudio:Z

    .line 22
    .line 23
    return-object v0
.end method

.method private static createVideoServerConfigFromNative()Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static destroySharedInstance()V
    .locals 4

    .line 1
    const-string v0, "trtc_api destroy instance self:"

    .line 2
    .line 3
    const-class v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    sget-object v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sInstance:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    const-string v2, "TRTCCloudImpl"

    .line 11
    .line 12
    new-instance v3, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sInstance:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sget-object v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sInstance:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->destroy()V

    .line 36
    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    sput-object v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sInstance:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception v0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    :goto_0
    monitor-exit v1

    .line 45
    return-void

    .line 46
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    throw v0
.end method

.method private enableAudioAEC(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    const-string v0, "enable"

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    :cond_0
    const-string v1, "enableAudioAEC[lack parameter or illegal type]: enable"

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftAEC:Z

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftAEC:Z

    .line 28
    .line 29
    :goto_0
    const-string v0, "level"

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_3

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSoftAECLevel:I

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_3
    const/16 p1, 0x64

    .line 45
    .line 46
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSoftAECLevel:I

    .line 47
    .line 48
    :goto_1
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftAEC:Z

    .line 53
    .line 54
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSoftAECLevel:I

    .line 55
    .line 56
    invoke-virtual {p1, v0, p0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->enableSoftAEC(ZI)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method private enableAudioAGC(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    const-string v0, "enable"

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    :cond_0
    const-string v1, "enableAudioAGC[lack parameter or illegal type]: enable"

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftAGC:Z

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftAGC:Z

    .line 28
    .line 29
    :goto_0
    const-string v0, "level"

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_3

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSoftAGCLevel:I

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_3
    const/16 p1, 0x64

    .line 45
    .line 46
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSoftAGCLevel:I

    .line 47
    .line 48
    :goto_1
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftAGC:Z

    .line 53
    .line 54
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSoftAGCLevel:I

    .line 55
    .line 56
    invoke-virtual {p1, v0, p0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->enableSoftAGC(ZI)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method private enableAudioANS(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    const-string v0, "enable"

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    :cond_0
    const-string v1, "enableAudioANS[lack parameter or illegal type]: enable"

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftANS:Z

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftANS:Z

    .line 28
    .line 29
    :goto_0
    const-string v0, "level"

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_3

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSoftANSLevel:I

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_3
    const/16 p1, 0x64

    .line 45
    .line 46
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSoftANSLevel:I

    .line 47
    .line 48
    :goto_1
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftANS:Z

    .line 53
    .line 54
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSoftANSLevel:I

    .line 55
    .line 56
    invoke-virtual {p1, v0, p0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->enableSoftANS(ZI)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method private forceCallbackMixedPlayAudioFrame(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "forceCallbackMixedPlayAudioFrame param is null"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "enable"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    const-string p1, "forceCallbackMixedPlayAudioFrame[lack parameter]: enable"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    invoke-virtual {p1, v0, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    :cond_2
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->forceCallbackMixedPlayAudioFrame(Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private getDisplayRotation()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mDisplay:Landroid/view/Display;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p0, :cond_3

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    if-eq p0, v1, :cond_2

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    if-eq p0, v1, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x3

    .line 17
    if-eq p0, v1, :cond_0

    .line 18
    .line 19
    return v0

    .line 20
    :cond_0
    const/16 p0, 0x10e

    .line 21
    .line 22
    return p0

    .line 23
    :cond_1
    const/16 p0, 0xb4

    .line 24
    .line 25
    return p0

    .line 26
    :cond_2
    const/16 p0, 0x5a

    .line 27
    .line 28
    return p0

    .line 29
    :cond_3
    return v0
.end method

.method private getDownloadStreamInfo(Lcom/tencent/liteav/TXCRenderAndDec;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)Ljava/lang/CharSequence;
    .locals 21

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 4
    .line 5
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->a()[I

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual/range {p1 .. p1}, Lcom/tencent/liteav/TXCRenderAndDec;->getStreamType()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/16 v4, 0x4276

    .line 18
    .line 19
    invoke-static {v1, v4, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;II)J

    .line 20
    .line 21
    .line 22
    move-result-wide v4

    .line 23
    const/16 v6, 0x138b

    .line 24
    .line 25
    invoke-static {v1, v6, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    const/4 v7, 0x3

    .line 30
    const/4 v8, 0x1

    .line 31
    const/4 v9, 0x7

    .line 32
    if-ne v3, v7, :cond_0

    .line 33
    .line 34
    const-string v7, "S"

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    if-ne v3, v9, :cond_1

    .line 38
    .line 39
    const-string v7, "Sub"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    if-ne v3, v8, :cond_2

    .line 43
    .line 44
    const-string v7, "A"

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    const-string v7, "B"

    .line 48
    .line 49
    :goto_0
    new-instance v10, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->userID:Ljava/lang/String;

    .line 55
    .line 56
    const-string v11, "18446744073709551615"

    .line 57
    .line 58
    const/16 v12, 0x2ee2

    .line 59
    .line 60
    invoke-static {v11, v12}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 61
    .line 62
    .line 63
    move-result v11

    .line 64
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v11

    .line 68
    filled-new-array {v0, v7, v11}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v7, "REMOTE: [%s]%s RTT:%dms\n"

    .line 73
    .line 74
    invoke-static {v7, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    sget-object v0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 82
    .line 83
    const/16 v7, 0x4269

    .line 84
    .line 85
    invoke-static {v1, v7, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 86
    .line 87
    .line 88
    move-result v7

    .line 89
    const/16 v11, 0x4651

    .line 90
    .line 91
    invoke-static {v1, v11}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 92
    .line 93
    .line 94
    move-result v11

    .line 95
    add-int/2addr v7, v11

    .line 96
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object v11

    .line 100
    const/16 v7, 0x4272

    .line 101
    .line 102
    invoke-static {v1, v7, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object v12

    .line 110
    const/16 v7, 0x426d

    .line 111
    .line 112
    invoke-static {v1, v7, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 113
    .line 114
    .line 115
    move-result v13

    .line 116
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 117
    .line 118
    .line 119
    move-result-object v13

    .line 120
    const/16 v14, 0x4273

    .line 121
    .line 122
    invoke-static {v1, v14, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 123
    .line 124
    .line 125
    move-result v14

    .line 126
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 127
    .line 128
    .line 129
    move-result-object v14

    .line 130
    const/16 v15, 0x465d

    .line 131
    .line 132
    invoke-static {v1, v15}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 133
    .line 134
    .line 135
    move-result v15

    .line 136
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object v15

    .line 140
    move/from16 p0, v8

    .line 141
    .line 142
    const/16 v8, 0x4657

    .line 143
    .line 144
    invoke-static {v1, v8}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 145
    .line 146
    .line 147
    move-result v16

    .line 148
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object v16

    .line 152
    move/from16 p1, v9

    .line 153
    .line 154
    const/16 v9, 0x465e

    .line 155
    .line 156
    invoke-static {v1, v9}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 157
    .line 158
    .line 159
    move-result v9

    .line 160
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 161
    .line 162
    .line 163
    move-result-object v17

    .line 164
    const/16 v9, 0x3e82

    .line 165
    .line 166
    invoke-static {v1, v9}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 167
    .line 168
    .line 169
    move-result v9

    .line 170
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 171
    .line 172
    .line 173
    move-result-object v18

    .line 174
    filled-new-array/range {v11 .. v18}, [Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v9

    .line 178
    const-string v11, "RECV:%dkbps LOSS:%d-%d-%d%%|%d-%d-%d%%|%d%%\n"

    .line 179
    .line 180
    invoke-static {v0, v11, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v9

    .line 184
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const/16 v9, 0x426a

    .line 188
    .line 189
    invoke-static {v1, v9, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 190
    .line 191
    .line 192
    move-result v9

    .line 193
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 194
    .line 195
    .line 196
    move-result-object v11

    .line 197
    const/16 v9, 0x4652

    .line 198
    .line 199
    invoke-static {v1, v9}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 200
    .line 201
    .line 202
    move-result v9

    .line 203
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 204
    .line 205
    .line 206
    move-result-object v12

    .line 207
    shr-int/lit8 v9, v6, 0x10

    .line 208
    .line 209
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 210
    .line 211
    .line 212
    move-result-object v13

    .line 213
    const v9, 0xffff

    .line 214
    .line 215
    .line 216
    and-int/2addr v6, v9

    .line 217
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 218
    .line 219
    .line 220
    move-result-object v14

    .line 221
    const/16 v6, 0x1772

    .line 222
    .line 223
    invoke-static {v1, v6, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;II)D

    .line 224
    .line 225
    .line 226
    move-result-wide v8

    .line 227
    double-to-int v6, v8

    .line 228
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 229
    .line 230
    .line 231
    move-result-object v15

    .line 232
    const/16 v6, 0x426b

    .line 233
    .line 234
    invoke-static {v1, v6, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;II)D

    .line 235
    .line 236
    .line 237
    move-result-wide v8

    .line 238
    double-to-int v6, v8

    .line 239
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 240
    .line 241
    .line 242
    move-result-object v16

    .line 243
    filled-new-array/range {v11 .. v16}, [Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v6

    .line 247
    const-string v8, "BIT:%d|%dkbps RES:%dx%d FPS:%d-%d\n"

    .line 248
    .line 249
    invoke-static {v0, v8, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v6

    .line 253
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    .line 255
    .line 256
    const/16 v6, 0x426f

    .line 257
    .line 258
    invoke-static {v1, v6, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 259
    .line 260
    .line 261
    move-result v6

    .line 262
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 263
    .line 264
    .line 265
    move-result-object v11

    .line 266
    invoke-static {v1, v7, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 267
    .line 268
    .line 269
    move-result v6

    .line 270
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 271
    .line 272
    .line 273
    move-result-object v12

    .line 274
    const/16 v6, 0x426e

    .line 275
    .line 276
    invoke-static {v1, v6, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 277
    .line 278
    .line 279
    move-result v6

    .line 280
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 281
    .line 282
    .line 283
    move-result-object v13

    .line 284
    const/16 v6, 0x4659

    .line 285
    .line 286
    invoke-static {v1, v6}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 287
    .line 288
    .line 289
    move-result v6

    .line 290
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 291
    .line 292
    .line 293
    move-result-object v14

    .line 294
    const/16 v6, 0x4657

    .line 295
    .line 296
    invoke-static {v1, v6}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 297
    .line 298
    .line 299
    move-result v6

    .line 300
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 301
    .line 302
    .line 303
    move-result-object v15

    .line 304
    const/16 v6, 0x4658

    .line 305
    .line 306
    invoke-static {v1, v6}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 307
    .line 308
    .line 309
    move-result v6

    .line 310
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 311
    .line 312
    .line 313
    move-result-object v16

    .line 314
    const/16 v6, 0x4271

    .line 315
    .line 316
    invoke-static {v1, v6, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 317
    .line 318
    .line 319
    move-result v6

    .line 320
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 321
    .line 322
    .line 323
    move-result-object v17

    .line 324
    const/16 v6, 0x4270

    .line 325
    .line 326
    invoke-static {v1, v6, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 327
    .line 328
    .line 329
    move-result v6

    .line 330
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 331
    .line 332
    .line 333
    move-result-object v18

    .line 334
    const/16 v6, 0x465c

    .line 335
    .line 336
    invoke-static {v1, v6}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 337
    .line 338
    .line 339
    move-result v6

    .line 340
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 341
    .line 342
    .line 343
    move-result-object v19

    .line 344
    const/16 v6, 0x465a

    .line 345
    .line 346
    invoke-static {v1, v6}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 347
    .line 348
    .line 349
    move-result v6

    .line 350
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 351
    .line 352
    .line 353
    move-result-object v20

    .line 354
    filled-new-array/range {v11 .. v20}, [Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    move-result-object v6

    .line 358
    const-string v7, "FEC:%d-%d-%d%%|%d-%d-%d%%    ARQ:%d-%d|%d-%d\n"

    .line 359
    .line 360
    invoke-static {v0, v7, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v6

    .line 364
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    const/4 v6, 0x0

    .line 368
    aget v6, v2, v6

    .line 369
    .line 370
    div-int/lit8 v6, v6, 0xa

    .line 371
    .line 372
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 373
    .line 374
    .line 375
    move-result-object v6

    .line 376
    aget v2, v2, p0

    .line 377
    .line 378
    div-int/lit8 v2, v2, 0xa

    .line 379
    .line 380
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 381
    .line 382
    .line 383
    move-result-object v2

    .line 384
    const/16 v7, 0x4274

    .line 385
    .line 386
    invoke-static {v1, v7, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 387
    .line 388
    .line 389
    move-result v7

    .line 390
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 391
    .line 392
    .line 393
    move-result-object v7

    .line 394
    const/16 v8, 0x4275

    .line 395
    .line 396
    invoke-static {v1, v8, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 397
    .line 398
    .line 399
    move-result v8

    .line 400
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 401
    .line 402
    .line 403
    move-result-object v8

    .line 404
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 405
    .line 406
    .line 407
    move-result-object v9

    .line 408
    filled-new-array {v6, v2, v7, v8, v9}, [Ljava/lang/Object;

    .line 409
    .line 410
    .line 411
    move-result-object v2

    .line 412
    const-string v6, "CPU:%d%%|%d%%  RPS:%d  LFR:%d  DERR:%d\n"

    .line 413
    .line 414
    invoke-static {v0, v6, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object v2

    .line 418
    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 419
    .line 420
    .line 421
    const/16 v2, 0x7d7

    .line 422
    .line 423
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 424
    .line 425
    .line 426
    move-result v2

    .line 427
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 428
    .line 429
    .line 430
    move-result-object v11

    .line 431
    const/16 v2, 0x177a

    .line 432
    .line 433
    invoke-static {v1, v2, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 434
    .line 435
    .line 436
    move-result v2

    .line 437
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 438
    .line 439
    .line 440
    move-result-object v12

    .line 441
    const/16 v2, 0x177b

    .line 442
    .line 443
    invoke-static {v1, v2, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 444
    .line 445
    .line 446
    move-result v2

    .line 447
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 448
    .line 449
    .line 450
    move-result-object v13

    .line 451
    const/16 v2, 0x177c

    .line 452
    .line 453
    invoke-static {v1, v2, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 454
    .line 455
    .line 456
    move-result v2

    .line 457
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 458
    .line 459
    .line 460
    move-result-object v14

    .line 461
    const/16 v2, 0x7e5

    .line 462
    .line 463
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 464
    .line 465
    .line 466
    move-result v2

    .line 467
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 468
    .line 469
    .line 470
    move-result-object v15

    .line 471
    const/16 v2, 0x467a

    .line 472
    .line 473
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 474
    .line 475
    .line 476
    move-result v2

    .line 477
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 478
    .line 479
    .line 480
    move-result-object v16

    .line 481
    const/16 v2, 0x465f

    .line 482
    .line 483
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 484
    .line 485
    .line 486
    move-result v2

    .line 487
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 488
    .line 489
    .line 490
    move-result-object v17

    .line 491
    filled-new-array/range {v11 .. v17}, [Ljava/lang/Object;

    .line 492
    .line 493
    .line 494
    move-result-object v2

    .line 495
    const-string v3, "Jitter: %d,%d|%d,%d|%d  p2pDelay: %d  ADROP: %d\n"

    .line 496
    .line 497
    invoke-static {v0, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 498
    .line 499
    .line 500
    move-result-object v2

    .line 501
    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 502
    .line 503
    .line 504
    const/16 v2, 0x4667

    .line 505
    .line 506
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 507
    .line 508
    .line 509
    move-result v2

    .line 510
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 511
    .line 512
    .line 513
    move-result-object v2

    .line 514
    const/16 v3, 0x4660

    .line 515
    .line 516
    invoke-static {v1, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 517
    .line 518
    .line 519
    move-result v1

    .line 520
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 521
    .line 522
    .line 523
    move-result-object v1

    .line 524
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 525
    .line 526
    .line 527
    move-result-object v1

    .line 528
    const-string v2, "QUALITY: %d   LEN: %d\n"

    .line 529
    .line 530
    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 531
    .line 532
    .line 533
    move-result-object v0

    .line 534
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 535
    .line 536
    .line 537
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 538
    .line 539
    .line 540
    move-result-object v0

    .line 541
    new-instance v1, Landroid/text/SpannableString;

    .line 542
    .line 543
    invoke-direct {v1, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 544
    .line 545
    .line 546
    const-string v2, "DECERR:"

    .line 547
    .line 548
    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 549
    .line 550
    .line 551
    move-result v2

    .line 552
    const/4 v3, -0x1

    .line 553
    if-eq v3, v2, :cond_3

    .line 554
    .line 555
    const-wide/16 v6, 0x0

    .line 556
    .line 557
    cmp-long v3, v4, v6

    .line 558
    .line 559
    if-lez v3, :cond_3

    .line 560
    .line 561
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    .line 562
    .line 563
    const/high16 v4, -0x10000

    .line 564
    .line 565
    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 566
    .line 567
    .line 568
    add-int/lit8 v2, v2, 0x7

    .line 569
    .line 570
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 571
    .line 572
    .line 573
    move-result v0

    .line 574
    const/16 v4, 0x21

    .line 575
    .line 576
    invoke-virtual {v1, v3, v2, v0, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 577
    .line 578
    .line 579
    :cond_3
    return-object v1
.end method

.method private getLocalStatistics(I)Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;
    .locals 7

    .line 1
    const/16 v0, 0xfa3

    .line 2
    .line 3
    const-string v1, "18446744073709551615"

    .line 4
    .line 5
    invoke-static {v1, v0, p1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    new-instance v2, Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;

    .line 10
    .line 11
    invoke-direct {v2}, Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;-><init>()V

    .line 12
    .line 13
    .line 14
    shr-int/lit8 v3, v0, 0x10

    .line 15
    .line 16
    iput v3, v2, Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;->width:I

    .line 17
    .line 18
    const v3, 0xffff

    .line 19
    .line 20
    .line 21
    and-int/2addr v0, v3

    .line 22
    iput v0, v2, Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;->height:I

    .line 23
    .line 24
    const/16 v0, 0xfa1

    .line 25
    .line 26
    invoke-static {v1, v0, p1}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;II)D

    .line 27
    .line 28
    .line 29
    move-result-wide v3

    .line 30
    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    .line 31
    .line 32
    add-double/2addr v3, v5

    .line 33
    double-to-int v0, v3

    .line 34
    iput v0, v2, Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;->frameRate:I

    .line 35
    .line 36
    const/16 v0, 0x32ca

    .line 37
    .line 38
    invoke-static {v1, v0, p1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, v2, Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;->videoBitrate:I

    .line 43
    .line 44
    const/16 v0, 0x36b3

    .line 45
    .line 46
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, v2, Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;->audioSampleRate:I

    .line 51
    .line 52
    const/16 v0, 0x36b2

    .line 53
    .line 54
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput v0, v2, Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;->audioBitrate:I

    .line 59
    .line 60
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->translateStreamType(I)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    iput p0, v2, Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;->streamType:I

    .line 65
    .line 66
    return-object v2
.end method

.method private getPixelFormat(I)Lcom/tencent/liteav/basic/a/b;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_3

    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    if-eq p1, p0, :cond_2

    .line 6
    .line 7
    const/4 p0, 0x3

    .line 8
    if-eq p1, p0, :cond_1

    .line 9
    .line 10
    const/4 p0, 0x4

    .line 11
    if-eq p1, p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/tencent/liteav/basic/a/b;->a:Lcom/tencent/liteav/basic/a/b;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    sget-object p0, Lcom/tencent/liteav/basic/a/b;->e:Lcom/tencent/liteav/basic/a/b;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    sget-object p0, Lcom/tencent/liteav/basic/a/b;->d:Lcom/tencent/liteav/basic/a/b;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    sget-object p0, Lcom/tencent/liteav/basic/a/b;->c:Lcom/tencent/liteav/basic/a/b;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_3
    sget-object p0, Lcom/tencent/liteav/basic/a/b;->b:Lcom/tencent/liteav/basic/a/b;

    .line 26
    .line 27
    return-object p0
.end method

.method private getQosValue(I)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    if-eq p1, p0, :cond_1

    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    if-eq p1, p0, :cond_0

    .line 8
    .line 9
    const-string p0, "ERR"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "DOWN"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    const-string p0, "UP"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_2
    const-string p0, "HOLD"

    .line 19
    .line 20
    return-object p0
.end method

.method private getRemoteStatistics(Lcom/tencent/liteav/TXCRenderAndDec;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;
    .locals 11

    .line 1
    iget-wide v0, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Lcom/tencent/liteav/TXCRenderAndDec;->getStreamType()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/16 v1, 0x138b

    .line 12
    .line 13
    invoke-static {v0, v1, p1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/16 v2, 0x4273

    .line 18
    .line 19
    invoke-static {v0, v2, p1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/16 v3, 0x467f

    .line 24
    .line 25
    invoke-static {v0, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    new-instance v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;

    .line 30
    .line 31
    invoke-direct {v4}, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object p2, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->userID:Ljava/lang/String;

    .line 35
    .line 36
    iput-object p2, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->userId:Ljava/lang/String;

    .line 37
    .line 38
    iput v2, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->videoPacketLoss:I

    .line 39
    .line 40
    iput v3, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->audioPacketLoss:I

    .line 41
    .line 42
    if-le v3, v2, :cond_0

    .line 43
    .line 44
    move v2, v3

    .line 45
    :cond_0
    iput v2, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->finalLoss:I

    .line 46
    .line 47
    shr-int/lit8 p2, v1, 0x10

    .line 48
    .line 49
    iput p2, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->width:I

    .line 50
    .line 51
    const p2, 0xffff

    .line 52
    .line 53
    .line 54
    and-int/2addr p2, v1

    .line 55
    iput p2, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->height:I

    .line 56
    .line 57
    const/16 p2, 0x1772

    .line 58
    .line 59
    invoke-static {v0, p2, p1}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;II)D

    .line 60
    .line 61
    .line 62
    move-result-wide v1

    .line 63
    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    .line 64
    .line 65
    add-double/2addr v1, v5

    .line 66
    double-to-int p2, v1

    .line 67
    iput p2, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->frameRate:I

    .line 68
    .line 69
    const/16 p2, 0x426a

    .line 70
    .line 71
    invoke-static {v0, p2, p1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    iput p2, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->videoBitrate:I

    .line 76
    .line 77
    const/16 p2, 0x4653

    .line 78
    .line 79
    invoke-static {v0, p2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    iput p2, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->audioSampleRate:I

    .line 84
    .line 85
    const/16 p2, 0x4652

    .line 86
    .line 87
    invoke-static {v0, p2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    iput p2, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->audioBitrate:I

    .line 92
    .line 93
    const/16 p2, 0x7d7

    .line 94
    .line 95
    invoke-static {v0, p2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    iput p2, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->jitterBufferDelay:I

    .line 100
    .line 101
    const/16 p2, 0x467a

    .line 102
    .line 103
    invoke-static {v0, p2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    iput p2, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->point2PointDelay:I

    .line 108
    .line 109
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->translateStreamType(I)I

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    iput p0, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->streamType:I

    .line 114
    .line 115
    const/16 p0, 0x466f

    .line 116
    .line 117
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    iput p0, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->audioTotalBlockTime:I

    .line 122
    .line 123
    const/16 p0, 0x466e

    .line 124
    .line 125
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    const/4 p2, 0x0

    .line 130
    const-wide v1, 0x3feccccccccccccdL    # 0.9

    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    const-wide/high16 v5, 0x4059000000000000L    # 100.0

    .line 136
    .line 137
    if-lez p0, :cond_1

    .line 138
    .line 139
    iget v3, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->audioTotalBlockTime:I

    .line 140
    .line 141
    int-to-double v7, v3

    .line 142
    mul-double/2addr v7, v5

    .line 143
    int-to-double v9, p0

    .line 144
    div-double/2addr v7, v9

    .line 145
    add-double/2addr v7, v1

    .line 146
    double-to-int p0, v7

    .line 147
    goto :goto_0

    .line 148
    :cond_1
    move p0, p2

    .line 149
    :goto_0
    iput p0, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->audioBlockRate:I

    .line 150
    .line 151
    const/16 p0, 0x1776

    .line 152
    .line 153
    invoke-static {v0, p0, p1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 154
    .line 155
    .line 156
    move-result p0

    .line 157
    iput p0, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->videoTotalBlockTime:I

    .line 158
    .line 159
    const/16 p0, 0x1784

    .line 160
    .line 161
    invoke-static {v0, p0, p1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-lez p0, :cond_2

    .line 166
    .line 167
    iget p1, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->videoTotalBlockTime:I

    .line 168
    .line 169
    int-to-double p1, p1

    .line 170
    mul-double/2addr p1, v5

    .line 171
    int-to-double v5, p0

    .line 172
    div-double/2addr p1, v5

    .line 173
    add-double/2addr p1, v1

    .line 174
    double-to-int p2, p1

    .line 175
    :cond_2
    iput p2, v4, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->videoBlockRate:I

    .line 176
    .line 177
    return-object v4
.end method

.method private getSizeByResolution(II)Lcom/tencent/liteav/g$a;
    .locals 9

    .line 1
    const/16 p0, 0xb0

    .line 2
    .line 3
    const/16 v0, 0x100

    .line 4
    .line 5
    const/16 v1, 0xc0

    .line 6
    .line 7
    const/16 v2, 0x3c0

    .line 8
    .line 9
    const/16 v3, 0x2d0

    .line 10
    .line 11
    const/16 v4, 0x80

    .line 12
    .line 13
    const/16 v5, 0x110

    .line 14
    .line 15
    const/16 v6, 0x170

    .line 16
    .line 17
    const/16 v7, 0x280

    .line 18
    .line 19
    const/16 v8, 0x1e0

    .line 20
    .line 21
    sparse-switch p1, :sswitch_data_0

    .line 22
    .line 23
    .line 24
    :sswitch_0
    move v1, v6

    .line 25
    move p0, v7

    .line 26
    goto :goto_3

    .line 27
    :sswitch_1
    const/16 p0, 0x780

    .line 28
    .line 29
    const/16 v1, 0x440

    .line 30
    .line 31
    goto :goto_3

    .line 32
    :sswitch_2
    const/16 p0, 0x500

    .line 33
    .line 34
    :goto_0
    move v1, v3

    .line 35
    goto :goto_3

    .line 36
    :sswitch_3
    const/16 v1, 0x220

    .line 37
    .line 38
    move p0, v2

    .line 39
    goto :goto_3

    .line 40
    :sswitch_4
    move v1, v5

    .line 41
    :goto_1
    move p0, v8

    .line 42
    goto :goto_3

    .line 43
    :sswitch_5
    const/16 p0, 0x150

    .line 44
    .line 45
    goto :goto_3

    .line 46
    :sswitch_6
    const/16 v1, 0x90

    .line 47
    .line 48
    :sswitch_7
    move p0, v0

    .line 49
    goto :goto_3

    .line 50
    :sswitch_8
    const/16 v1, 0x60

    .line 51
    .line 52
    goto :goto_3

    .line 53
    :sswitch_9
    move p0, v2

    .line 54
    goto :goto_0

    .line 55
    :sswitch_a
    move p0, v7

    .line 56
    move v1, v8

    .line 57
    goto :goto_3

    .line 58
    :sswitch_b
    move v1, v6

    .line 59
    goto :goto_1

    .line 60
    :sswitch_c
    const/16 p0, 0x190

    .line 61
    .line 62
    const/16 v1, 0x130

    .line 63
    .line 64
    goto :goto_3

    .line 65
    :sswitch_d
    const/16 p0, 0x140

    .line 66
    .line 67
    const/16 v1, 0xf0

    .line 68
    .line 69
    goto :goto_3

    .line 70
    :sswitch_e
    const/16 p0, 0x120

    .line 71
    .line 72
    const/16 v1, 0xe0

    .line 73
    .line 74
    goto :goto_3

    .line 75
    :sswitch_f
    move v1, v4

    .line 76
    goto :goto_3

    .line 77
    :sswitch_10
    move p0, v8

    .line 78
    :goto_2
    move v1, p0

    .line 79
    goto :goto_3

    .line 80
    :sswitch_11
    move p0, v5

    .line 81
    goto :goto_2

    .line 82
    :sswitch_12
    const/16 p0, 0xa0

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :sswitch_13
    move p0, v4

    .line 86
    goto :goto_2

    .line 87
    :goto_3
    new-instance p1, Lcom/tencent/liteav/g$a;

    .line 88
    .line 89
    invoke-direct {p1}, Lcom/tencent/liteav/g$a;-><init>()V

    .line 90
    .line 91
    .line 92
    const/4 v0, 0x1

    .line 93
    if-ne p2, v0, :cond_0

    .line 94
    .line 95
    iput v1, p1, Lcom/tencent/liteav/g$a;->a:I

    .line 96
    .line 97
    iput p0, p1, Lcom/tencent/liteav/g$a;->b:I

    .line 98
    .line 99
    return-object p1

    .line 100
    :cond_0
    iput p0, p1, Lcom/tencent/liteav/g$a;->a:I

    .line 101
    .line 102
    iput v1, p1, Lcom/tencent/liteav/g$a;->b:I

    .line 103
    .line 104
    return-object p1

    .line 105
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_13
        0x3 -> :sswitch_12
        0x5 -> :sswitch_11
        0x7 -> :sswitch_10
        0x32 -> :sswitch_f
        0x34 -> :sswitch_7
        0x36 -> :sswitch_e
        0x38 -> :sswitch_d
        0x3a -> :sswitch_c
        0x3c -> :sswitch_b
        0x3e -> :sswitch_a
        0x40 -> :sswitch_9
        0x64 -> :sswitch_8
        0x66 -> :sswitch_6
        0x68 -> :sswitch_5
        0x6a -> :sswitch_4
        0x6c -> :sswitch_0
        0x6e -> :sswitch_3
        0x70 -> :sswitch_2
        0x72 -> :sswitch_1
    .end sparse-switch
.end method

.method private hideFloatingWindow()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mFloatingWindow:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "window"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Landroid/view/WindowManager;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mFloatingWindow:Landroid/view/View;

    .line 19
    .line 20
    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeViewImmediate(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mFloatingWindow:Landroid/view/View;

    .line 25
    .line 26
    return-void
.end method

.method private identifyTRTCFrameworkType()V
    .locals 6

    .line 1
    const-string v0, "TRTCCloudImpl"

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    :goto_0
    array-length v3, v1

    .line 13
    if-ge v2, v3, :cond_4

    .line 14
    .line 15
    aget-object v3, v1, v2

    .line 16
    .line 17
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v4, "TUIKitImpl"

    .line 22
    .line 23
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    const-string v5, "identifyTRTCFrameworkType callName:"

    .line 28
    .line 29
    if-eqz v4, :cond_0

    .line 30
    .line 31
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const/4 v1, 0x6

    .line 50
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mFramework:I

    .line 51
    .line 52
    return-void

    .line 53
    :catch_0
    move-exception p0

    .line 54
    goto :goto_1

    .line 55
    :cond_0
    const-string v4, "WXTRTCCloud"

    .line 56
    .line 57
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-eqz v4, :cond_1

    .line 62
    .line 63
    new-instance v1, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    const/4 v1, 0x3

    .line 82
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mFramework:I

    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    const-string v4, "TRTCMeetingImpl"

    .line 86
    .line 87
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    if-nez v4, :cond_2

    .line 92
    .line 93
    const-string v4, "TRTCLiveRoomImpl"

    .line 94
    .line 95
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    if-nez v4, :cond_2

    .line 100
    .line 101
    const-string v4, "TRTCAudioCallImpl"

    .line 102
    .line 103
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    if-nez v4, :cond_2

    .line 108
    .line 109
    const-string v4, "TRTCVideoCallImpl"

    .line 110
    .line 111
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    if-nez v4, :cond_2

    .line 116
    .line 117
    const-string v4, "TRTCVoiceRoomImpl"

    .line 118
    .line 119
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result v4

    .line 123
    if-nez v4, :cond_2

    .line 124
    .line 125
    const-string v4, "TRTCAVCallImpl"

    .line 126
    .line 127
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 128
    .line 129
    .line 130
    move-result v4

    .line 131
    if-eqz v4, :cond_3

    .line 132
    .line 133
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-static {v0, v3}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    const/4 v3, 0x5

    .line 152
    iput v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mFramework:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 153
    .line 154
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :cond_4
    return-void

    .line 159
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    const-string v2, "identifyTRTCFrameworkType catch exception:"

    .line 162
    .line 163
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    return-void
.end method

.method private init(Landroid/content/Context;Lcom/tencent/liteav/basic/util/e;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {v0, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 12
    .line 13
    const/4 v2, 0x3

    .line 14
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v0, v3, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 22
    .line 23
    const/4 v3, 0x7

    .line 24
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v0, v3, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {v0, v4, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 46
    .line 47
    new-instance v0, Lcom/tencent/liteav/g;

    .line 48
    .line 49
    invoke-direct {v0}, Lcom/tencent/liteav/g;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 53
    .line 54
    sget-object v4, Lcom/tencent/liteav/basic/a/c;->e:Lcom/tencent/liteav/basic/a/c;

    .line 55
    .line 56
    iput-object v4, v0, Lcom/tencent/liteav/g;->k:Lcom/tencent/liteav/basic/a/c;

    .line 57
    .line 58
    const/16 v4, 0x5a

    .line 59
    .line 60
    iput v4, v0, Lcom/tencent/liteav/g;->X:I

    .line 61
    .line 62
    const/4 v4, 0x0

    .line 63
    iput v4, v0, Lcom/tencent/liteav/g;->j:I

    .line 64
    .line 65
    iput-boolean v3, v0, Lcom/tencent/liteav/g;->P:Z

    .line 66
    .line 67
    const/16 v5, 0xf

    .line 68
    .line 69
    iput v5, v0, Lcom/tencent/liteav/g;->h:I

    .line 70
    .line 71
    iput-boolean v4, v0, Lcom/tencent/liteav/g;->K:Z

    .line 72
    .line 73
    iput-boolean v4, v0, Lcom/tencent/liteav/g;->T:Z

    .line 74
    .line 75
    iput-boolean v4, v0, Lcom/tencent/liteav/g;->U:Z

    .line 76
    .line 77
    const/16 v5, 0x170

    .line 78
    .line 79
    iput v5, v0, Lcom/tencent/liteav/g;->a:I

    .line 80
    .line 81
    const/16 v6, 0x280

    .line 82
    .line 83
    iput v6, v0, Lcom/tencent/liteav/g;->b:I

    .line 84
    .line 85
    const/16 v7, 0x2ee

    .line 86
    .line 87
    iput v7, v0, Lcom/tencent/liteav/g;->c:I

    .line 88
    .line 89
    iput v4, v0, Lcom/tencent/liteav/g;->e:I

    .line 90
    .line 91
    iput-boolean v4, v0, Lcom/tencent/liteav/g;->W:Z

    .line 92
    .line 93
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 94
    .line 95
    invoke-direct {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;-><init>()V

    .line 96
    .line 97
    .line 98
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 99
    .line 100
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->bigEncSize:Lcom/tencent/liteav/g$a;

    .line 101
    .line 102
    iput v5, v0, Lcom/tencent/liteav/g$a;->a:I

    .line 103
    .line 104
    iput v6, v0, Lcom/tencent/liteav/g$a;->b:I

    .line 105
    .line 106
    new-instance v0, Lcom/tencent/liteav/basic/util/e;

    .line 107
    .line 108
    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    invoke-direct {v0, v5}, Lcom/tencent/liteav/basic/util/e;-><init>(Landroid/os/Looper;)V

    .line 113
    .line 114
    .line 115
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mMainHandler:Lcom/tencent/liteav/basic/util/e;

    .line 116
    .line 117
    new-instance v0, Landroid/os/Handler;

    .line 118
    .line 119
    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    invoke-direct {v0, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 124
    .line 125
    .line 126
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mListenerHandler:Landroid/os/Handler;

    .line 127
    .line 128
    if-eqz p2, :cond_0

    .line 129
    .line 130
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_0
    new-instance p2, Landroid/os/HandlerThread;

    .line 134
    .line 135
    const-string v0, "TRTCCloudApi"

    .line 136
    .line 137
    invoke-direct {p2, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 141
    .line 142
    .line 143
    new-instance v0, Lcom/tencent/liteav/basic/util/e;

    .line 144
    .line 145
    invoke-virtual {p2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    invoke-direct {v0, p2}, Lcom/tencent/liteav/basic/util/e;-><init>(Landroid/os/Looper;)V

    .line 150
    .line 151
    .line 152
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 153
    .line 154
    :goto_0
    new-instance p2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$StatusTask;

    .line 155
    .line 156
    invoke-direct {p2, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$StatusTask;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 157
    .line 158
    .line 159
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mStatusNotifyTask:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$StatusTask;

    .line 160
    .line 161
    const-wide/16 v5, 0x0

    .line 162
    .line 163
    iput-wide v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastSendMsgTimeMs:J

    .line 164
    .line 165
    iput v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSendMsgCount:I

    .line 166
    .line 167
    iput v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSendMsgSize:I

    .line 168
    .line 169
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSensorMode:I

    .line 170
    .line 171
    iput v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAppScene:I

    .line 172
    .line 173
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mQosPreference:I

    .line 174
    .line 175
    iput v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mQosMode:I

    .line 176
    .line 177
    new-instance p2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$DisplayOrientationDetector;

    .line 178
    .line 179
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 180
    .line 181
    invoke-direct {p2, v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$DisplayOrientationDetector;-><init>(Landroid/content/Context;Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 182
    .line 183
    .line 184
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mOrientationEventListener:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$DisplayOrientationDetector;

    .line 185
    .line 186
    const-string p2, "window"

    .line 187
    .line 188
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    check-cast p2, Landroid/view/WindowManager;

    .line 193
    .line 194
    invoke-interface {p2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 195
    .line 196
    .line 197
    move-result-object p2

    .line 198
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mDisplay:Landroid/view/Display;

    .line 199
    .line 200
    new-instance p2, Ljava/util/HashMap;

    .line 201
    .line 202
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 203
    .line 204
    .line 205
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRenderListenerMap:Ljava/util/HashMap;

    .line 206
    .line 207
    new-instance p2, Ljava/util/HashSet;

    .line 208
    .line 209
    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    .line 210
    .line 211
    .line 212
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mStreamTypes:Ljava/util/Set;

    .line 213
    .line 214
    iget-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeLock:Ljava/lang/Object;

    .line 215
    .line 216
    monitor-enter p2

    .line 217
    :try_start_0
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getSDKVersion()[I

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    array-length v5, v0

    .line 222
    if-lt v5, v3, :cond_1

    .line 223
    .line 224
    aget v5, v0, v4

    .line 225
    .line 226
    goto :goto_1

    .line 227
    :catchall_0
    move-exception p0

    .line 228
    goto :goto_4

    .line 229
    :cond_1
    move v5, v4

    .line 230
    :goto_1
    array-length v6, v0

    .line 231
    if-lt v6, v1, :cond_2

    .line 232
    .line 233
    aget v6, v0, v3

    .line 234
    .line 235
    goto :goto_2

    .line 236
    :cond_2
    move v6, v4

    .line 237
    :goto_2
    array-length v7, v0

    .line 238
    if-lt v7, v2, :cond_3

    .line 239
    .line 240
    aget v0, v0, v1

    .line 241
    .line 242
    goto :goto_3

    .line 243
    :cond_3
    move v0, v4

    .line 244
    :goto_3
    invoke-virtual {p0, v5, v6, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeCreateContext(III)J

    .line 245
    .line 246
    .line 247
    move-result-wide v0

    .line 248
    iput-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 249
    .line 250
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 251
    const-string p2, "trtc cloud create"

    .line 252
    .line 253
    invoke-virtual {p0, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    iput v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomState:I

    .line 257
    .line 258
    sget-object p2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->NONE:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 259
    .line 260
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoSourceType:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 261
    .line 262
    iput-boolean v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mIsAudioCapturing:Z

    .line 263
    .line 264
    iput-boolean v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mIsVideoCapturing:Z

    .line 265
    .line 266
    const/16 p2, 0x14

    .line 267
    .line 268
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentRole:I

    .line 269
    .line 270
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTargetRole:I

    .line 271
    .line 272
    iput v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRecvMode:I

    .line 273
    .line 274
    iget-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLatestParamsOfBigEncoder:Landroid/os/Bundle;

    .line 275
    .line 276
    const-string v0, "config_gop"

    .line 277
    .line 278
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 279
    .line 280
    iget v1, v1, Lcom/tencent/liteav/g;->i:I

    .line 281
    .line 282
    invoke-virtual {p2, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 283
    .line 284
    .line 285
    iget-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLatestParamsOfSmallEncoder:Landroid/os/Bundle;

    .line 286
    .line 287
    const-string v0, "config_gop"

    .line 288
    .line 289
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 290
    .line 291
    iget v1, v1, Lcom/tencent/liteav/g;->i:I

    .line 292
    .line 293
    invoke-virtual {p2, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 294
    .line 295
    .line 296
    invoke-direct {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->identifyTRTCFrameworkType()V

    .line 297
    .line 298
    .line 299
    invoke-static {p1}, Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;->loadFromSharedPreferences(Landroid/content/Context;)Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoServerConfig:Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

    .line 304
    .line 305
    return-void

    .line 306
    :goto_4
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 307
    throw p0
.end method

.method private internalGetRemoteUserRender(Ljava/lang/String;I)Lcom/tencent/liteav/renderer/e;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUser(Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "TRTCCloudImpl"

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const-string p0, "user no exist"

    .line 13
    .line 14
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-object v1

    .line 18
    :cond_0
    const/4 v2, 0x2

    .line 19
    if-ne p2, v2, :cond_1

    .line 20
    .line 21
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 22
    .line 23
    :goto_0
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :goto_1
    if-nez p1, :cond_2

    .line 30
    .line 31
    const-string p0, "render no exist"

    .line 32
    .line 33
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-object v1

    .line 37
    :cond_2
    invoke-virtual {p1}, Lcom/tencent/liteav/TXCRenderAndDec;->getVideoRender()Lcom/tencent/liteav/renderer/e;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    if-nez p1, :cond_3

    .line 42
    .line 43
    const-string p1, "videoRender no exist"

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-object v1

    .line 49
    :cond_3
    return-object p1
.end method

.method private isNumericRoom(I)Z
    .locals 0

    if-eqz p1, :cond_1

    const/4 p0, -0x1

    if-ne p1, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method private muteUpstream(IZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getNetworkContext()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeMuteUpstream(JIZ)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private native nativeCancelDownStream(JJIZ)I
.end method

.method private native nativeChangeRole(JI)V
.end method

.method private native nativeConnectOtherRoom(JLjava/lang/String;)I
.end method

.method private native nativeDisconnectOtherRoom(J)I
.end method

.method private native nativeEnableBlackStream(JZ)V
.end method

.method private native nativeEnableSmallStream(JZ)V
.end method

.method private native nativeMuteUpstream(JIZ)V
.end method

.method private native nativePushVideo(JIII[BJJJJJ)V
.end method

.method private native nativeReenterRoom(JI)V
.end method

.method private native nativeRemoveUpstream(JI)I
.end method

.method private native nativeRequestDownStream(JJIZ)I
.end method

.method private native nativeRequestKeyFrame(JJI)V
.end method

.method private native nativeSendCustomCmdMsg(JILjava/lang/String;ZZ)V
.end method

.method private native nativeSendJsonCmd(JLjava/lang/String;Ljava/lang/String;)V
.end method

.method private native nativeSendSEIMsg(J[BI)V
.end method

.method private native nativeSetAudioEncodeConfiguration(JIIII)V
.end method

.method private native nativeSetDataReportDeviceInfo(Ljava/lang/String;Ljava/lang/String;I)V
.end method

.method private native nativeSetEncodedDataProcessingListener(JJ)V
.end method

.method private native nativeSetSEIPayloadType(JI)Z
.end method

.method private native nativeSetVideoEncoderConfiguration(JIIIIIIZI)V
.end method

.method private native nativeSetVideoQuality(JII)V
.end method

.method private native nativeStartPublishCDNStream(JLcom/tencent/trtc/TRTCCloudDef$TRTCPublishCDNParam;)V
.end method

.method private native nativeStartPublishing(JLjava/lang/String;I)V
.end method

.method private native nativeStartSpeedTest(JILjava/lang/String;Ljava/lang/String;)V
.end method

.method private native nativeStopPublishCDNStream(J)V
.end method

.method private native nativeStopPublishing(J)V
.end method

.method private native nativeStopSpeedTest(J)V
.end method

.method private native nativeUpdatePrivateMapKey(JLjava/lang/String;)V
.end method

.method private notifyCaptureStarted(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$180;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$180;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private notifyEvent(Ljava/lang/String;ILjava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "EVT_ID"

    .line 7
    .line 8
    int-to-long v2, p2

    .line 9
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 10
    .line 11
    .line 12
    const-string v1, "EVT_TIME"

    .line 13
    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 19
    .line 20
    .line 21
    const-string v1, "EVT_MSG"

    .line 22
    .line 23
    invoke-virtual {v0, v1, p3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1, p2, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->notifyEvent(Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private notifyEventByUserId(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 7
    .line 8
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$168;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$168;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->forEachUser(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    :goto_0
    return-void
.end method

.method private notifyLogByUserId(Ljava/lang/String;IILjava/lang/String;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p4, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "EVT_ID"

    .line 12
    .line 13
    int-to-long v2, p3

    .line 14
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 15
    .line 16
    .line 17
    const-string v1, "EVT_TIME"

    .line 18
    .line 19
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 24
    .line 25
    .line 26
    const-string v1, "EVT_MSG"

    .line 27
    .line 28
    invoke-virtual {v0, v1, p4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string p4, "EVT_STREAM_TYPE"

    .line 32
    .line 33
    invoke-virtual {v0, p4, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0, p1, p3, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->notifyEventByUserId(Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method

.method private onAVMemberChange(JLjava/lang/String;III)V
    .locals 8

    .line 1
    new-instance v2, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;

    .line 7
    .line 8
    move-object v1, p0

    .line 9
    move-wide v3, p1

    .line 10
    move-object v5, p3

    .line 11
    move v7, p5

    .line 12
    move v6, p6

    .line 13
    invoke-direct/range {v0 .. v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/ref/WeakReference;JLjava/lang/String;II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private onCallExperimentalAPI(ILjava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onCallExperimentalAPI "

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
    const-string p1, ", "

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$135;

    .line 27
    .line 28
    invoke-direct {p1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$135;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private onChangeRole(ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$162;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$162;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private onConnectOtherRoom(Ljava/lang/String;ILjava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onConnectOtherRoom "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    filled-new-array {p1, v1, p3}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "onConnectOtherRoom userId:%s err:%d, msg:%s"

    .line 46
    .line 47
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, " self:"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v1, ""

    .line 71
    .line 72
    const/4 v2, 0x0

    .line 73
    const/4 v3, 0x1

    .line 74
    invoke-static {v3, v0, v1, v2}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 75
    .line 76
    .line 77
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$132;

    .line 78
    .line 79
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$132;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILjava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method private onConnectionLost()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->networkStatus:I

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v2, "Network anomaly."

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-direct {p0, v0, v3, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->notifyEvent(Ljava/lang/String;ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v2, "onConnectionLost self:"

    .line 19
    .line 20
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v2, ""

    .line 35
    .line 36
    invoke-static {v1, v0, v2, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$147;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$147;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private onConnectionRecovery()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    iput v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->networkStatus:I

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "Network recovered. Successfully re-enter room"

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-direct {p0, v0, v2, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->notifyEvent(Ljava/lang/String;ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "onConnectionRecovery self:"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, ""

    .line 35
    .line 36
    const/4 v3, 0x1

    .line 37
    invoke-static {v3, v0, v1, v2}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$149;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$149;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private onDisConnectOtherRoom(ILjava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onDisConnectOtherRoom "

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
    const-string v1, ", "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    filled-new-array {v1, p2}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, "onDisConnectOtherRoom err:%d, msg:%s"

    .line 40
    .line 41
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v1, " self:"

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v1, ""

    .line 65
    .line 66
    const/4 v2, 0x0

    .line 67
    const/4 v3, 0x1

    .line 68
    invoke-static {v3, v0, v1, v2}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$133;

    .line 72
    .line 73
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$133;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private onExitRoom(ILjava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onExitRoom "

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
    const-string v1, ", "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    filled-new-array {v1, p2}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    const-string v1, "onExitRoom err:%d msg:%s"

    .line 40
    .line 41
    invoke-static {v1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p2, " self:"

    .line 49
    .line 50
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    const-string v0, ""

    .line 65
    .line 66
    const/4 v1, 0x0

    .line 67
    const/4 v2, 0x1

    .line 68
    invoke-static {v2, p2, v0, v1}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 69
    .line 70
    .line 71
    new-instance p2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;

    .line 72
    .line 73
    invoke-direct {p2, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private onKickOut(ILjava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onKickOut "

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
    const-string v1, ", "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$131;

    .line 27
    .line 28
    invoke-direct {v0, p0, p2, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$131;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private onNotify(JIILjava/lang/String;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, " event "

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ", "

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Landroid/os/Bundle;

    .line 37
    .line 38
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v2, "EVT_ID"

    .line 42
    .line 43
    int-to-long v3, p4

    .line 44
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 45
    .line 46
    .line 47
    const-string v2, "EVT_TIME"

    .line 48
    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 50
    .line 51
    .line 52
    move-result-wide v3

    .line 53
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 54
    .line 55
    .line 56
    const-string v2, "EVT_MSG"

    .line 57
    .line 58
    invoke-virtual {v1, v2, p5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const-string v2, "EVT_STREAM_TYPE"

    .line 62
    .line 63
    invoke-virtual {v1, v2, p3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-nez v2, :cond_1

    .line 71
    .line 72
    const-wide/16 v2, 0x0

    .line 73
    .line 74
    cmp-long v2, p1, v2

    .line 75
    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    const-string v2, "18446744073709551615"

    .line 79
    .line 80
    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-nez v2, :cond_1

    .line 85
    .line 86
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 87
    .line 88
    invoke-virtual {v2}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getTinyId()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_0

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-direct {p0, p1, p3, p4, p5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->notifyLogByUserId(Ljava/lang/String;IILjava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 108
    .line 109
    invoke-virtual {p1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p0, p1, p4, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->notifyEvent(Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method private onRecvAudioServerConfig(Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;)V
    .locals 3

    .line 1
    const-string v0, "on receive audio config: [%s]"

    .line 2
    .line 3
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "TRTCCloudImpl"

    .line 8
    .line 9
    invoke-static {v2, v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 13
    .line 14
    invoke-static {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->saveToSharedPreferences(Landroid/content/Context;Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-boolean v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->enableAutoRestartDevice:Z

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->enableAutoRestartDevice(Z)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCAudioServerConfig;->maxSelectedPlayStreams:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setMaxSelectedPlayStreams(I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private onRecvCustomCmdMsg(Ljava/lang/String;JIILjava/lang/String;ZIJ)V
    .locals 8

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRecvCustomCmdMsgCountInPeriod:J

    .line 6
    .line 7
    const-wide/16 v4, 0x1

    .line 8
    .line 9
    add-long/2addr v2, v4

    .line 10
    iput-wide v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRecvCustomCmdMsgCountInPeriod:J

    .line 11
    .line 12
    iget-wide v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastLogCustomCmdMsgTs:J

    .line 13
    .line 14
    sub-long v2, v0, v2

    .line 15
    .line 16
    const-wide/16 v4, 0x2710

    .line 17
    .line 18
    cmp-long v2, v2, v4

    .line 19
    .line 20
    if-lez v2, :cond_0

    .line 21
    .line 22
    new-instance v2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v3, "onRecvMsg. tinyId="

    .line 25
    .line 26
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string p2, ", streamId = "

    .line 33
    .line 34
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string p2, ", msg = "

    .line 41
    .line 42
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p2, ", recvTime = "

    .line 49
    .line 50
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    move-wide/from16 p2, p9

    .line 54
    .line 55
    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p2, ", recvCustomMsgCountInPeriod = "

    .line 59
    .line 60
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    iget-wide p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRecvCustomCmdMsgCountInPeriod:J

    .line 64
    .line 65
    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string p2, " self:"

    .line 69
    .line 70
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    const-string p3, "TRTCCloudImpl"

    .line 85
    .line 86
    invoke-static {p3, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iput-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastLogCustomCmdMsgTs:J

    .line 90
    .line 91
    const-wide/16 p2, 0x0

    .line 92
    .line 93
    iput-wide p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRecvCustomCmdMsgCountInPeriod:J

    .line 94
    .line 95
    :cond_0
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;

    .line 96
    .line 97
    move-object v1, p0

    .line 98
    move-object v2, p1

    .line 99
    move v3, p4

    .line 100
    move v4, p5

    .line 101
    move-object v5, p6

    .line 102
    move v6, p7

    .line 103
    move/from16 v7, p8

    .line 104
    .line 105
    invoke-direct/range {v0 .. v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$150;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;IILjava/lang/String;ZI)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method private onRecvFirstAudio(J)V
    .locals 0

    .line 1
    new-instance p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$154;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$154;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private onRecvFirstVideo(JI)V
    .locals 0

    .line 1
    new-instance p3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155;

    .line 2
    .line 3
    invoke-direct {p3, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private onRecvSEIMsg(J[B)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J[B)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private onRecvVideoServerConfig(Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private onRequestAccIP(ILjava/lang/String;Z)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onRequestAccIP err:"

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
    const-string v1, " "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p2, " isAcc:"

    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p0, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    if-eqz p3, :cond_0

    .line 37
    .line 38
    const-string p2, "connect ACC"

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const-string p2, "connect PROXY"

    .line 42
    .line 43
    :goto_0
    new-instance p3, Landroid/os/Bundle;

    .line 44
    .line 45
    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string v0, "EVT_ID"

    .line 49
    .line 50
    int-to-long v1, p1

    .line 51
    invoke-virtual {p3, v0, v1, v2}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 52
    .line 53
    .line 54
    const-string v0, "EVT_TIME"

    .line 55
    .line 56
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 57
    .line 58
    .line 59
    move-result-wide v1

    .line 60
    invoke-virtual {p3, v0, v1, v2}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 61
    .line 62
    .line 63
    const-string v0, "EVT_MSG"

    .line 64
    .line 65
    invoke-virtual {p3, v0, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    const-string p2, "EVT_STREAM_TYPE"

    .line 69
    .line 70
    const/4 v0, 0x2

    .line 71
    invoke-virtual {p3, p2, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 72
    .line 73
    .line 74
    iget-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 75
    .line 76
    invoke-virtual {p2}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-virtual {p0, p2, p1, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->notifyEvent(Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    return-void
.end method

.method private onRequestDownStream(ILjava/lang/String;JI)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance p3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$136;

    .line 4
    .line 5
    invoke-direct {p3, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$136;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;

    .line 13
    .line 14
    invoke-direct {p1, p0, p5, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IJ)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private onRequestToken(ILjava/lang/String;J[B)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onRequestToken "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ","

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
    const-string p1, ", "

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    new-instance p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$127;

    .line 35
    .line 36
    invoke-direct {p1, p0, p3, p4, p5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$127;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J[B)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private onSendCustomCmdMsgResult(IIILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method private onSpeedTest(Ljava/lang/String;IFFII)V
    .locals 8

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    move v6, p5

    .line 9
    move v7, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;IFFII)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private onStartPublishing(ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$156;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$156;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private onStopPublishing(ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$157;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$157;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private onStreamPublished(ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$158;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$158;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private onStreamUnpublished(ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$159;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$159;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private onSwitchRoom(ILjava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onSwitchRoom "

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
    const-string v1, ", "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    filled-new-array {v1, p2}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, "onSwitchRoom err:%d, msg:%s"

    .line 40
    .line 41
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v1, " self:"

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v1, ""

    .line 65
    .line 66
    const/4 v2, 0x0

    .line 67
    const/4 v3, 0x1

    .line 68
    invoke-static {v3, v0, v1, v2}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$134;

    .line 72
    .line 73
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$134;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private onTranscodingUpdated(ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$160;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$160;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private onTryToReconnect()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    iput v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->networkStatus:I

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "Retry enter room."

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-direct {p0, v0, v2, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->notifyEvent(Ljava/lang/String;ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "onTryToReconnect self:"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, ""

    .line 35
    .line 36
    const/4 v3, 0x1

    .line 37
    invoke-static {v3, v0, v1, v2}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$148;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$148;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private onVideoBlockThresholdChanged(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$146;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$146;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private onWholeMemberEnter(JLjava/lang/String;)V
    .locals 0

    .line 1
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$141;

    .line 7
    .line 8
    invoke-direct {p2, p0, p1, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$141;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/ref/WeakReference;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private onWholeMemberExit(JLjava/lang/String;I)V
    .locals 0

    .line 1
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$142;

    .line 7
    .line 8
    invoke-direct {p2, p0, p1, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$142;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/ref/WeakReference;Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private pushVideoFrame(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    :try_start_0
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 9
    .line 10
    iget v4, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->streamType:I

    .line 11
    .line 12
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    check-cast v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 21
    .line 22
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    invoke-virtual {v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getNetworkContext()J

    .line 26
    .line 27
    .line 28
    move-result-wide v2

    .line 29
    move-wide v4, v2

    .line 30
    iget v3, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->streamType:I

    .line 31
    .line 32
    move-wide v6, v4

    .line 33
    iget v5, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 34
    .line 35
    move-wide v7, v6

    .line 36
    iget-object v6, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    .line 37
    .line 38
    move-wide v9, v7

    .line 39
    iget-wide v7, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->gopIndex:J

    .line 40
    .line 41
    move-wide v11, v9

    .line 42
    iget-wide v9, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->gopFrameIndex:J

    .line 43
    .line 44
    move-wide v13, v11

    .line 45
    iget-wide v11, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->refFremeIndex:J

    .line 46
    .line 47
    move-wide v15, v13

    .line 48
    iget-wide v13, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 49
    .line 50
    iget-wide v1, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->dts:J

    .line 51
    .line 52
    const/4 v4, 0x1

    .line 53
    move-wide/from16 v17, v15

    .line 54
    .line 55
    move-wide v15, v1

    .line 56
    move-wide/from16 v1, v17

    .line 57
    .line 58
    invoke-direct/range {v0 .. v16}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativePushVideo(JIII[BJJJJJ)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void

    .line 62
    :catchall_0
    move-exception v0

    .line 63
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    throw v0
.end method

.method private removeUpStreamType(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mStreamTypes:Ljava/util/Set;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mStreamTypes:Ljava/util/Set;

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->removeUpstream(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private removeUpstream(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getNetworkContext()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeRemoveUpstream(JI)I

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private runOnListenerThread(Ljava/lang/Runnable;I)V
    .locals 3

    .line 43
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mListenerHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 44
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mMainHandler:Lcom/tencent/liteav/basic/util/e;

    int-to-long v0, p2

    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_0
    int-to-long v1, p2

    .line 45
    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private runOnMainThreadAndWaitDone(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mMainHandler:Lcom/tencent/liteav/basic/util/e;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/basic/util/e;->a(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private runOnSDKThread(Ljava/lang/Runnable;I)V
    .locals 2

    .line 27
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    if-eqz p0, :cond_0

    int-to-long v0, p2

    .line 28
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method private setAudioEncodeConfiguration()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setQoSParams()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private setAudioSampleRate(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    const-string v0, "sampleRate"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableCustomAudioCapture:Z

    .line 17
    .line 18
    if-nez v0, :cond_3

    .line 19
    .line 20
    iget-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mIsAudioCapturing:Z

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/16 v0, 0x3e80

    .line 26
    .line 27
    if-eq v0, p1, :cond_2

    .line 28
    .line 29
    const v0, 0xbb80

    .line 30
    .line 31
    .line 32
    if-eq v0, p1, :cond_2

    .line 33
    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v1, "muteRemoteAudioInSpeaker[illegal sampleRate]: "

    .line 37
    .line 38
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setEncoderSampleRate(I)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_3
    :goto_0
    const-string p1, "setAudioSampleRate[illegal state]"

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_4
    :goto_1
    const-string p1, "setAudioSampleRate[lack parameter or illegal type]: sampleRate"

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method private setCustomRenderMode(Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "setCustomRenderMode param is null"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "mode"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    const-string p1, "setCustomRenderMode[lack parameter]: mode"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const/4 v1, 0x0

    .line 24
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    if-ne p1, v2, :cond_2

    .line 32
    .line 33
    move v1, v2

    .line 34
    :cond_2
    iput-boolean v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->enableCustomPreprocessor:Z

    .line 35
    .line 36
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/d;->a(Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private setFramework(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "setFramework[lack parameter]"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "framework"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    const-string p1, "setFramework[lack parameter]: framework"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mFramework:I

    .line 28
    .line 29
    return-void
.end method

.method private setLocalAudioMuteMode(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    const-string v0, "mode"

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    :cond_0
    const-string v1, "setLocalAudioMuteMode[lack parameter or illegal type]: mode"

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_2

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput-boolean p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableEosMode:Z

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    const/4 p1, 0x1

    .line 27
    iput-boolean p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableEosMode:Z

    .line 28
    .line 29
    :goto_0
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableEosMode:Z

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->enableCaptureEOSMode(Z)Z

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private setMediaCodecConfig(Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "setMediaCodecConfig param is null"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "encProperties"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    move-object v0, v2

    .line 24
    :goto_0
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 25
    .line 26
    iput-object v0, v1, Lcom/tencent/liteav/g;->Y:Lorg/json/JSONArray;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/g;)V

    .line 31
    .line 32
    .line 33
    const-string v0, "decProperties"

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 46
    .line 47
    iput-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->decProperties:Lorg/json/JSONArray;

    .line 48
    .line 49
    const-string v0, "restartDecoder"

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/4 v2, 0x0

    .line 56
    if-eqz v1, :cond_3

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    goto :goto_1

    .line 63
    :cond_3
    move p1, v2

    .line 64
    :goto_1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 65
    .line 66
    if-eqz p1, :cond_4

    .line 67
    .line 68
    const/4 v2, 0x1

    .line 69
    :cond_4
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->enableRestartDecoder:Z

    .line 70
    .line 71
    return-void
.end method

.method private setOrientation(I)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    return-void

    .line 5
    :cond_0
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$179;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$179;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private setQoSParams()V
    .locals 9

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getAudioEncoderConfig()Lcom/tencent/liteav/audio/TXCAudioEncoderConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "setQoSParams:"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget v2, v0, Lcom/tencent/liteav/audio/TXCAudioEncoderConfig;->sampleRate:I

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, " "

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget v3, v0, Lcom/tencent/liteav/audio/TXCAudioEncoderConfig;->channels:I

    .line 27
    .line 28
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v3, v0, Lcom/tencent/liteav/audio/TXCAudioEncoderConfig;->minBitrate:I

    .line 35
    .line 36
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget v2, v0, Lcom/tencent/liteav/audio/TXCAudioEncoderConfig;->maxBitrate:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const-string v2, ""

    .line 52
    .line 53
    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 57
    .line 58
    const/4 v2, 0x1

    .line 59
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 68
    .line 69
    if-eqz v1, :cond_0

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getNetworkContext()J

    .line 72
    .line 73
    .line 74
    move-result-wide v3

    .line 75
    iget v5, v0, Lcom/tencent/liteav/audio/TXCAudioEncoderConfig;->minBitrate:I

    .line 76
    .line 77
    iget v6, v0, Lcom/tencent/liteav/audio/TXCAudioEncoderConfig;->maxBitrate:I

    .line 78
    .line 79
    iget v7, v0, Lcom/tencent/liteav/audio/TXCAudioEncoderConfig;->sampleRate:I

    .line 80
    .line 81
    iget v8, v0, Lcom/tencent/liteav/audio/TXCAudioEncoderConfig;->channels:I

    .line 82
    .line 83
    move-object v2, p0

    .line 84
    invoke-direct/range {v2 .. v8}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeSetAudioEncodeConfiguration(JIIII)V

    .line 85
    .line 86
    .line 87
    :cond_0
    return-void
.end method

.method private setVideoEncConfig(IIIIIZI)V
    .locals 9

    .line 1
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomState:I

    .line 2
    .line 3
    if-nez v1, :cond_0

    .line 4
    .line 5
    const-string v1, "setVideoEncConfig ignore when no in room"

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCodecType:I

    .line 12
    .line 13
    const/4 v2, 0x2

    .line 14
    if-eq v1, v2, :cond_1

    .line 15
    .line 16
    const/4 v6, 0x1

    .line 17
    move-object v0, p0

    .line 18
    move v1, p1

    .line 19
    move v2, p2

    .line 20
    move v3, p3

    .line 21
    move v4, p4

    .line 22
    move v5, p5

    .line 23
    move v7, p6

    .line 24
    move/from16 v8, p7

    .line 25
    .line 26
    invoke-direct/range {v0 .. v8}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setVideoEncoderConfiguration(IIIIIIZI)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAppScene:I

    .line 31
    .line 32
    move-object v0, p0

    .line 33
    move v1, p1

    .line 34
    move v2, p2

    .line 35
    move v3, p3

    .line 36
    move v4, p4

    .line 37
    move v5, p5

    .line 38
    move v7, p6

    .line 39
    move/from16 v8, p7

    .line 40
    .line 41
    invoke-direct/range {v0 .. v8}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setVideoEncoderConfiguration(IIIIIIZI)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private setVideoEncoderConfiguration(IIIIIIZI)V
    .locals 11

    .line 1
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getNetworkContext()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    move-object v0, p0

    .line 20
    move v3, p1

    .line 21
    move v4, p2

    .line 22
    move v5, p3

    .line 23
    move v6, p4

    .line 24
    move/from16 v7, p5

    .line 25
    .line 26
    move/from16 v8, p6

    .line 27
    .line 28
    move/from16 v9, p7

    .line 29
    .line 30
    move/from16 v10, p8

    .line 31
    .line 32
    invoke-direct/range {v0 .. v10}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeSetVideoEncoderConfiguration(JIIIIIIZI)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method private setVideoEncoderParamEx(Lorg/json/JSONObject;)V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "callExperimentalAPI[lack parameter or illegal type]: codecType"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "codecType"

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v2, 0x1

    .line 17
    const/4 v3, 0x0

    .line 18
    if-eq v0, v1, :cond_2

    .line 19
    .line 20
    iput v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCodecType:I

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    const-string v0, "softwareCodecParams"

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 33
    .line 34
    const-string v4, "enableRealTime"

    .line 35
    .line 36
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_1

    .line 41
    .line 42
    move v4, v2

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    move v4, v3

    .line 45
    :goto_0
    iput-boolean v4, v1, Lcom/tencent/liteav/g;->P:Z

    .line 46
    .line 47
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 48
    .line 49
    const-string v4, "profile"

    .line 50
    .line 51
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput v0, v1, Lcom/tencent/liteav/g;->n:I

    .line 56
    .line 57
    :cond_2
    const-string v0, "videoWidth"

    .line 58
    .line 59
    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    const-string v1, "videoHeight"

    .line 64
    .line 65
    invoke-virtual {p1, v1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    const-string v4, "videoFps"

    .line 70
    .line 71
    invoke-virtual {p1, v4, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 72
    .line 73
    .line 74
    move-result v8

    .line 75
    const-string v4, "videoBitrate"

    .line 76
    .line 77
    invoke-virtual {p1, v4, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 78
    .line 79
    .line 80
    move-result v9

    .line 81
    const-string v4, "minVideoBitrate"

    .line 82
    .line 83
    invoke-virtual {p1, v4, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 84
    .line 85
    .line 86
    move-result v10

    .line 87
    const-string v4, "rcMethod"

    .line 88
    .line 89
    invoke-virtual {p1, v4, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    if-lez v0, :cond_a

    .line 94
    .line 95
    if-lez v1, :cond_a

    .line 96
    .line 97
    const/16 v5, 0x780

    .line 98
    .line 99
    if-le v0, v5, :cond_3

    .line 100
    .line 101
    mul-int/lit16 v1, v1, 0x780

    .line 102
    .line 103
    div-int/2addr v1, v5

    .line 104
    move v0, v5

    .line 105
    :cond_3
    if-le v1, v5, :cond_4

    .line 106
    .line 107
    mul-int/lit16 v0, v0, 0x780

    .line 108
    .line 109
    div-int/2addr v0, v5

    .line 110
    goto :goto_1

    .line 111
    :cond_4
    move v5, v1

    .line 112
    :goto_1
    const/16 v1, 0x5a

    .line 113
    .line 114
    if-ge v0, v1, :cond_5

    .line 115
    .line 116
    mul-int/lit8 v5, v5, 0x5a

    .line 117
    .line 118
    div-int/2addr v5, v1

    .line 119
    move v0, v1

    .line 120
    :cond_5
    if-ge v5, v1, :cond_6

    .line 121
    .line 122
    mul-int/lit8 v0, v0, 0x5a

    .line 123
    .line 124
    div-int/2addr v0, v1

    .line 125
    goto :goto_2

    .line 126
    :cond_6
    move v1, v5

    .line 127
    :goto_2
    add-int/lit8 v0, v0, 0xf

    .line 128
    .line 129
    div-int/lit8 v0, v0, 0x10

    .line 130
    .line 131
    mul-int/lit8 v6, v0, 0x10

    .line 132
    .line 133
    add-int/lit8 v1, v1, 0xf

    .line 134
    .line 135
    div-int/lit8 v1, v1, 0x10

    .line 136
    .line 137
    mul-int/lit8 v7, v1, 0x10

    .line 138
    .line 139
    const-string v0, "streamType"

    .line 140
    .line 141
    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    const-string v0, "config_fps"

    .line 146
    .line 147
    if-nez p1, :cond_8

    .line 148
    .line 149
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLatestParamsOfBigEncoder:Landroid/os/Bundle;

    .line 150
    .line 151
    invoke-virtual {v1, v0, v8}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 152
    .line 153
    .line 154
    if-gt v6, v7, :cond_7

    .line 155
    .line 156
    goto :goto_3

    .line 157
    :cond_7
    move v2, v3

    .line 158
    :goto_3
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 159
    .line 160
    iget-boolean v11, v0, Lcom/tencent/liteav/g;->p:Z

    .line 161
    .line 162
    move-object v5, p0

    .line 163
    move v12, v10

    .line 164
    move v10, v9

    .line 165
    move v9, v8

    .line 166
    move v8, v7

    .line 167
    move v7, v6

    .line 168
    move v6, v2

    .line 169
    invoke-direct/range {v5 .. v12}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->updateBigStreamEncoder(ZIIIIZI)V

    .line 170
    .line 171
    .line 172
    move v8, v9

    .line 173
    move v9, v10

    .line 174
    iget-object p0, v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 175
    .line 176
    invoke-virtual {p0, v4}, Lcom/tencent/liteav/d;->m(I)V

    .line 177
    .line 178
    .line 179
    goto :goto_4

    .line 180
    :cond_8
    move-object v5, p0

    .line 181
    if-ne p1, v2, :cond_9

    .line 182
    .line 183
    iget-object p0, v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLatestParamsOfSmallEncoder:Landroid/os/Bundle;

    .line 184
    .line 185
    invoke-virtual {p0, v0, v8}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 186
    .line 187
    .line 188
    invoke-direct/range {v5 .. v10}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->updateSmallStreamEncoder(IIIII)V

    .line 189
    .line 190
    .line 191
    :cond_9
    :goto_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    const-string v0, "vsize setVideoEncoderParamEx->width:"

    .line 194
    .line 195
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    iget-object v0, v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 199
    .line 200
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->bigEncSize:Lcom/tencent/liteav/g$a;

    .line 201
    .line 202
    iget v0, v0, Lcom/tencent/liteav/g$a;->a:I

    .line 203
    .line 204
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v0, ", height:"

    .line 208
    .line 209
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    iget-object v0, v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 213
    .line 214
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->bigEncSize:Lcom/tencent/liteav/g$a;

    .line 215
    .line 216
    iget v0, v0, Lcom/tencent/liteav/g$a;->b:I

    .line 217
    .line 218
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    const-string v0, ", fps:"

    .line 222
    .line 223
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    const-string v0, ", bitrate:"

    .line 230
    .line 231
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {p0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    const-string v0, ", stream:"

    .line 238
    .line 239
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    invoke-virtual {v5, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    invoke-direct {v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->updateOrientation()V

    .line 253
    .line 254
    .line 255
    :cond_a
    return-void
.end method

.method private setVideoEncoderParamInternal(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)V
    .locals 12

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLatestParamsOfBigEncoder:Landroid/os/Bundle;

    .line 4
    .line 5
    const-string v1, "config_fps"

    .line 6
    .line 7
    iget v2, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLatestParamsOfBigEncoder:Landroid/os/Bundle;

    .line 13
    .line 14
    const-string v1, "config_adjust_resolution"

    .line 15
    .line 16
    iget-boolean v2, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->enableAdjustRes:Z

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    iget v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoResolution:I

    .line 22
    .line 23
    iget v1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoResolutionMode:I

    .line 24
    .line 25
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getSizeByResolution(II)Lcom/tencent/liteav/g$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget v1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoResolutionMode:I

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    const/4 v3, 0x1

    .line 33
    if-ne v1, v3, :cond_0

    .line 34
    .line 35
    move v5, v3

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move v5, v2

    .line 38
    :goto_0
    iget v6, v0, Lcom/tencent/liteav/g$a;->a:I

    .line 39
    .line 40
    iget v7, v0, Lcom/tencent/liteav/g$a;->b:I

    .line 41
    .line 42
    iget v8, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 43
    .line 44
    iget v9, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoBitrate:I

    .line 45
    .line 46
    iget-boolean v10, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->enableAdjustRes:Z

    .line 47
    .line 48
    iget v11, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->minVideoBitrate:I

    .line 49
    .line 50
    move-object v4, p0

    .line 51
    invoke-direct/range {v4 .. v11}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->updateBigStreamEncoder(ZIIIIZI)V

    .line 52
    .line 53
    .line 54
    new-instance p0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v0, "vsize setVideoEncoderParam->width:"

    .line 57
    .line 58
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->bigEncSize:Lcom/tencent/liteav/g$a;

    .line 64
    .line 65
    iget v0, v0, Lcom/tencent/liteav/g$a;->a:I

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v0, ", height:"

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget-object v0, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->bigEncSize:Lcom/tencent/liteav/g$a;

    .line 78
    .line 79
    iget v0, v0, Lcom/tencent/liteav/g$a;->b:I

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v0, ", fps:"

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 90
    .line 91
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v0, ", bitrate:"

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoBitrate:I

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v0, ", mode:"

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoResolutionMode:I

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v0, " minVideoBitrate:"

    .line 115
    .line 116
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    iget v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->minVideoBitrate:I

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {v4, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    new-instance p0, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .line 135
    .line 136
    iget-object v0, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 137
    .line 138
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->bigEncSize:Lcom/tencent/liteav/g$a;

    .line 139
    .line 140
    iget v0, v0, Lcom/tencent/liteav/g$a;->a:I

    .line 141
    .line 142
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    iget-object v0, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 147
    .line 148
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->bigEncSize:Lcom/tencent/liteav/g$a;

    .line 149
    .line 150
    iget v0, v0, Lcom/tencent/liteav/g$a;->b:I

    .line 151
    .line 152
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 153
    .line 154
    .line 155
    move-result-object v6

    .line 156
    iget v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 157
    .line 158
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 159
    .line 160
    .line 161
    move-result-object v7

    .line 162
    iget v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoBitrate:I

    .line 163
    .line 164
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 165
    .line 166
    .line 167
    move-result-object v8

    .line 168
    iget v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoResolutionMode:I

    .line 169
    .line 170
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 171
    .line 172
    .line 173
    move-result-object v9

    .line 174
    iget v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->minVideoBitrate:I

    .line 175
    .line 176
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 177
    .line 178
    .line 179
    move-result-object v10

    .line 180
    filled-new-array/range {v5 .. v10}, [Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    const-string v1, "setVideoEncoderParam width:%d, height:%d, fps:%d, bitrate:%d, mode:%d, minBitrate:%d"

    .line 185
    .line 186
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const-string v0, " self:"

    .line 194
    .line 195
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    const-string v0, ""

    .line 210
    .line 211
    invoke-static {v3, p0, v0, v2}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 212
    .line 213
    .line 214
    invoke-direct {v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->updateOrientation()V

    .line 215
    .line 216
    .line 217
    iget-object p0, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 218
    .line 219
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->bigEncSize:Lcom/tencent/liteav/g$a;

    .line 220
    .line 221
    iget v0, p0, Lcom/tencent/liteav/g$a;->a:I

    .line 222
    .line 223
    int-to-long v3, v0

    .line 224
    iget p0, p0, Lcom/tencent/liteav/g$a;->b:I

    .line 225
    .line 226
    int-to-long v5, p0

    .line 227
    const-string v7, ""

    .line 228
    .line 229
    const/4 v8, 0x2

    .line 230
    const-string v1, "18446744073709551615"

    .line 231
    .line 232
    const/16 v2, 0xfa7

    .line 233
    .line 234
    invoke-static/range {v1 .. v8}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 235
    .line 236
    .line 237
    iget p0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 238
    .line 239
    int-to-long v2, p0

    .line 240
    const-string v6, ""

    .line 241
    .line 242
    const/4 v7, 0x2

    .line 243
    const-string v0, "18446744073709551615"

    .line 244
    .line 245
    const/16 v1, 0xfa8

    .line 246
    .line 247
    const-wide/16 v4, -0x1

    .line 248
    .line 249
    invoke-static/range {v0 .. v7}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 250
    .line 251
    .line 252
    iget p0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoBitrate:I

    .line 253
    .line 254
    int-to-long v2, p0

    .line 255
    const-string v6, ""

    .line 256
    .line 257
    const-string v0, "18446744073709551615"

    .line 258
    .line 259
    const/16 v1, 0xfa9

    .line 260
    .line 261
    invoke-static/range {v0 .. v7}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :cond_1
    move-object v4, p0

    .line 266
    const-string p0, "setVideoEncoderParam param is null"

    .line 267
    .line 268
    invoke-virtual {v4, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    return-void
.end method

.method private setVideoQuality(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getNetworkContext()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeSetVideoQuality(JII)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static sharedInstance(Landroid/content/Context;)Lcom/tencent/trtc/TRTCCloud;
    .locals 2

    .line 1
    const-class v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sInstance:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sInstance:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sInstance:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object p0

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method private showFloatingWindow(Landroid/view/View;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    const-string p0, "TRTCCloudImpl"

    .line 15
    .line 16
    const-string p1, "can\'t show floating window for no drawing overlay permission"

    .line 17
    .line 18
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mFloatingWindow:Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "window"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Landroid/view/WindowManager;

    .line 35
    .line 36
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 37
    .line 38
    const/16 v1, 0x1a

    .line 39
    .line 40
    if-lt v0, v1, :cond_2

    .line 41
    .line 42
    const/16 v0, 0x7f6

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    const/16 v1, 0x18

    .line 46
    .line 47
    if-le v0, v1, :cond_3

    .line 48
    .line 49
    const/16 v0, 0x7d2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_3
    const/16 v0, 0x7d5

    .line 53
    .line 54
    :goto_0
    new-instance v1, Landroid/view/WindowManager$LayoutParams;

    .line 55
    .line 56
    invoke-direct {v1, v0}, Landroid/view/WindowManager$LayoutParams;-><init>(I)V

    .line 57
    .line 58
    .line 59
    const/16 v0, 0x8

    .line 60
    .line 61
    const/high16 v2, 0x40000

    .line 62
    .line 63
    or-int/2addr v0, v2

    .line 64
    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 65
    .line 66
    const/4 v0, -0x2

    .line 67
    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 68
    .line 69
    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 70
    .line 71
    const/4 v0, -0x3

    .line 72
    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 73
    .line 74
    invoke-interface {p0, p1, v1}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method private startRemoteRender(Lcom/tencent/liteav/TXCRenderAndDec;I)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/tencent/liteav/TXCRenderAndDec;->stopVideo()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/TXCRenderAndDec;->setStreamType(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tencent/liteav/TXCRenderAndDec;->startVideo()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private stopLocalAudioInternal()V
    .locals 12

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mIsAudioCapturing:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "stopLocalAudio when no capturing audio, ignore!!!"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string v0, "stopLocalAudio"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "stopLocalAudio self:"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, ""

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    const/4 v3, 0x0

    .line 38
    invoke-static {v2, v0, v1, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 39
    .line 40
    .line 41
    const-string v10, ""

    .line 42
    .line 43
    const/4 v11, 0x0

    .line 44
    const-string v4, "18446744073709551615"

    .line 45
    .line 46
    const/16 v5, 0xbb9

    .line 47
    .line 48
    const-wide/16 v6, 0x2

    .line 49
    .line 50
    const-wide/16 v8, -0x1

    .line 51
    .line 52
    invoke-static/range {v4 .. v11}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 53
    .line 54
    .line 55
    iput-boolean v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mIsAudioCapturing:Z

    .line 56
    .line 57
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->stopLocalAudio()I

    .line 62
    .line 63
    .line 64
    iget-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableCustomAudioCapture:Z

    .line 65
    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    invoke-virtual {p0, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableAudioStream(Z)V

    .line 69
    .line 70
    .line 71
    :cond_1
    const v0, 0x9c72

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v3, v2}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(III)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const-string v0, "TRTCCloudImpl"

    .line 90
    .line 91
    const-string v1, "(%d)stopLocalAudioInternal end"

    .line 92
    .line 93
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method private stopRemoteMainRender(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;Ljava/lang/Boolean;)V
    .locals 7

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->userID:Ljava/lang/String;

    .line 5
    .line 6
    iget-wide v2, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 7
    .line 8
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    iget v3, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 13
    .line 14
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    filled-new-array {v1, v2, v3}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "stopRemoteRender userID:%s tinyID:%d streamType:%d"

    .line 23
    .line 24
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-wide v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 32
    .line 33
    iget-wide v3, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 34
    .line 35
    const/4 v5, 0x2

    .line 36
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    move-object v0, p0

    .line 41
    invoke-direct/range {v0 .. v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeCancelDownStream(JJIZ)I

    .line 42
    .line 43
    .line 44
    iget-wide v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 45
    .line 46
    iget-wide v3, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 47
    .line 48
    const/4 v5, 0x3

    .line 49
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    invoke-direct/range {v0 .. v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeCancelDownStream(JJIZ)I

    .line 54
    .line 55
    .line 56
    iget-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 59
    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/tencent/liteav/TXCRenderAndDec;->stopVideo()V

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_0
    return-void
.end method

.method private stopRemoteSubRender(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->userID:Ljava/lang/String;

    .line 5
    .line 6
    iget-wide v1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 7
    .line 8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/4 v2, 0x7

    .line 13
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "stopRemoteRender userID:%s tinyID:%d streamType:%d"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-wide v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 31
    .line 32
    iget-wide v4, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 33
    .line 34
    const/4 v6, 0x7

    .line 35
    const/4 v7, 0x0

    .line 36
    move-object v1, p0

    .line 37
    invoke-direct/range {v1 .. v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeCancelDownStream(JJIZ)I

    .line 38
    .line 39
    .line 40
    iget-object p0, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 43
    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/tencent/liteav/TXCRenderAndDec;->stopVideo()V

    .line 47
    .line 48
    .line 49
    :cond_1
    :goto_0
    return-void
.end method

.method private translateStreamType(I)I
    .locals 0

    const/4 p0, 0x3

    if-eq p1, p0, :cond_1

    const/4 p0, 0x7

    if-eq p1, p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x2

    return p0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method private updateBigStreamEncoder(ZIIIIZI)V
    .locals 10

    .line 1
    move/from16 v5, p7

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    const/4 v8, 0x1

    .line 5
    if-lez p2, :cond_2

    .line 6
    .line 7
    if-lez p3, :cond_2

    .line 8
    .line 9
    iget-object v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 10
    .line 11
    iget-object v7, v7, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->bigEncSize:Lcom/tencent/liteav/g$a;

    .line 12
    .line 13
    iput p2, v7, Lcom/tencent/liteav/g$a;->a:I

    .line 14
    .line 15
    iput p3, v7, Lcom/tencent/liteav/g$a;->b:I

    .line 16
    .line 17
    iget-object v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoSourceType:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 18
    .line 19
    sget-object v9, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->SCREEN:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 20
    .line 21
    if-ne v7, v9, :cond_0

    .line 22
    .line 23
    iget-object v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 24
    .line 25
    iput v8, v7, Lcom/tencent/liteav/g;->l:I

    .line 26
    .line 27
    iput p2, v7, Lcom/tencent/liteav/g;->a:I

    .line 28
    .line 29
    iput p3, v7, Lcom/tencent/liteav/g;->b:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 33
    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iput v8, v7, Lcom/tencent/liteav/g;->l:I

    .line 37
    .line 38
    iput p2, v7, Lcom/tencent/liteav/g;->a:I

    .line 39
    .line 40
    iput p3, v7, Lcom/tencent/liteav/g;->b:I

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iput v6, v7, Lcom/tencent/liteav/g;->l:I

    .line 44
    .line 45
    iput p3, v7, Lcom/tencent/liteav/g;->a:I

    .line 46
    .line 47
    iput p2, v7, Lcom/tencent/liteav/g;->b:I

    .line 48
    .line 49
    :goto_0
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 50
    .line 51
    sget-object v2, Lcom/tencent/liteav/basic/a/c;->a:Lcom/tencent/liteav/basic/a/c;

    .line 52
    .line 53
    iput-object v2, v1, Lcom/tencent/liteav/g;->k:Lcom/tencent/liteav/basic/a/c;

    .line 54
    .line 55
    :cond_2
    if-lez p4, :cond_4

    .line 56
    .line 57
    const/16 v1, 0x1e

    .line 58
    .line 59
    if-le p4, v1, :cond_3

    .line 60
    .line 61
    const-string v2, "setVideoEncoderParam fps > 30, limit fps to 30"

    .line 62
    .line 63
    invoke-virtual {p0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 67
    .line 68
    iput v1, v2, Lcom/tencent/liteav/g;->h:I

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_3
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 72
    .line 73
    iput p4, v1, Lcom/tencent/liteav/g;->h:I

    .line 74
    .line 75
    :cond_4
    :goto_1
    if-lez p5, :cond_5

    .line 76
    .line 77
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 78
    .line 79
    iput p5, v1, Lcom/tencent/liteav/g;->c:I

    .line 80
    .line 81
    :cond_5
    if-ltz v5, :cond_6

    .line 82
    .line 83
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 84
    .line 85
    iput v5, v1, Lcom/tencent/liteav/g;->e:I

    .line 86
    .line 87
    :cond_6
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoSourceType:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 88
    .line 89
    sget-object v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->SCREEN:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 90
    .line 91
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 92
    .line 93
    if-ne v1, v2, :cond_7

    .line 94
    .line 95
    const/4 v1, 0x3

    .line 96
    iput v1, v3, Lcom/tencent/liteav/g;->i:I

    .line 97
    .line 98
    iput-boolean v6, v3, Lcom/tencent/liteav/g;->p:Z

    .line 99
    .line 100
    iget-boolean v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mOverrideFPSFromUser:Z

    .line 101
    .line 102
    if-eqz v1, :cond_8

    .line 103
    .line 104
    const/16 v1, 0xa

    .line 105
    .line 106
    iput v1, v3, Lcom/tencent/liteav/g;->h:I

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_7
    move/from16 v1, p6

    .line 110
    .line 111
    iput-boolean v1, v3, Lcom/tencent/liteav/g;->p:Z

    .line 112
    .line 113
    :cond_8
    :goto_2
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 114
    .line 115
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->bigEncSize:Lcom/tencent/liteav/g$a;

    .line 116
    .line 117
    iget v2, v1, Lcom/tencent/liteav/g$a;->a:I

    .line 118
    .line 119
    iget v3, v1, Lcom/tencent/liteav/g$a;->b:I

    .line 120
    .line 121
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 122
    .line 123
    iget v4, v1, Lcom/tencent/liteav/g;->h:I

    .line 124
    .line 125
    iget v5, v1, Lcom/tencent/liteav/g;->c:I

    .line 126
    .line 127
    iget-boolean v6, v1, Lcom/tencent/liteav/g;->p:Z

    .line 128
    .line 129
    iget v7, v1, Lcom/tencent/liteav/g;->e:I

    .line 130
    .line 131
    const/4 v1, 0x2

    .line 132
    move-object v0, p0

    .line 133
    invoke-direct/range {v0 .. v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setVideoEncConfig(IIIIIZI)V

    .line 134
    .line 135
    .line 136
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCodecType:I

    .line 137
    .line 138
    const/4 v2, 0x2

    .line 139
    if-ne v1, v2, :cond_9

    .line 140
    .line 141
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 142
    .line 143
    iget v2, v1, Lcom/tencent/liteav/g;->a:I

    .line 144
    .line 145
    iget v3, v1, Lcom/tencent/liteav/g;->b:I

    .line 146
    .line 147
    mul-int/2addr v2, v3

    .line 148
    const v3, 0x7e900

    .line 149
    .line 150
    .line 151
    if-lt v2, v3, :cond_9

    .line 152
    .line 153
    iput v8, v1, Lcom/tencent/liteav/g;->j:I

    .line 154
    .line 155
    :cond_9
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 156
    .line 157
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 158
    .line 159
    iget v2, v2, Lcom/tencent/liteav/g;->h:I

    .line 160
    .line 161
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/d;->e(I)V

    .line 162
    .line 163
    .line 164
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 165
    .line 166
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 167
    .line 168
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/g;)V

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method private updateEncType()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCodecType:I

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAppScene:I

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 14
    .line 15
    iput v1, p0, Lcom/tencent/liteav/g;->j:I

    .line 16
    .line 17
    :cond_1
    return-void

    .line 18
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 19
    .line 20
    iput v0, p0, Lcom/tencent/liteav/g;->j:I

    .line 21
    .line 22
    return-void
.end method

.method private updateOrientation()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoSourceType:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 2
    .line 3
    sget-object v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->CUSTOM:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 4
    .line 5
    if-eq v0, v1, :cond_3

    .line 6
    .line 7
    sget-object v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->SCREEN:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentOrientation:I

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    if-ne v0, v1, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mDisplay:Landroid/view/Display;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-ne v0, v1, :cond_1

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentOrientation:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentOrientation:I

    .line 31
    .line 32
    :cond_2
    :goto_0
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentOrientation:I

    .line 33
    .line 34
    invoke-direct {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setOrientation(I)V

    .line 35
    .line 36
    .line 37
    :cond_3
    :goto_1
    return-void
.end method

.method private updateSmallStreamEncoder(IIIII)V
    .locals 8

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    if-lez p2, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->smallEncSize:Lcom/tencent/liteav/g$a;

    .line 8
    .line 9
    iput p1, v0, Lcom/tencent/liteav/g$a;->a:I

    .line 10
    .line 11
    iput p2, v0, Lcom/tencent/liteav/g$a;->b:I

    .line 12
    .line 13
    :cond_0
    if-lez p3, :cond_2

    .line 14
    .line 15
    const/16 p1, 0x14

    .line 16
    .line 17
    if-le p3, p1, :cond_1

    .line 18
    .line 19
    const-string p2, "setVideoSmallEncoderParam fps > 20, limit fps to 20"

    .line 20
    .line 21
    invoke-virtual {p0, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSmallEncParam:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 25
    .line 26
    iput p1, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSmallEncParam:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 30
    .line 31
    iput p3, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 32
    .line 33
    :cond_2
    :goto_0
    if-lez p4, :cond_3

    .line 34
    .line 35
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSmallEncParam:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 36
    .line 37
    iput p4, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoBitrate:I

    .line 38
    .line 39
    :cond_3
    if-ltz p5, :cond_4

    .line 40
    .line 41
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSmallEncParam:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 42
    .line 43
    iput p5, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->minVideoBitrate:I

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 46
    .line 47
    iget p1, p1, Lcom/tencent/liteav/g;->i:I

    .line 48
    .line 49
    iget-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoSourceType:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 50
    .line 51
    sget-object p3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->SCREEN:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 52
    .line 53
    if-ne p2, p3, :cond_6

    .line 54
    .line 55
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSmallEncParam:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 56
    .line 57
    const/4 p2, 0x0

    .line 58
    iput-boolean p2, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->enableAdjustRes:Z

    .line 59
    .line 60
    iget-boolean p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mOverrideFPSFromUser:Z

    .line 61
    .line 62
    if-eqz p2, :cond_5

    .line 63
    .line 64
    const/16 p2, 0xa

    .line 65
    .line 66
    iput p2, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 67
    .line 68
    :cond_5
    const/4 p1, 0x3

    .line 69
    :cond_6
    move v6, p1

    .line 70
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 71
    .line 72
    iget-boolean v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSmallStream:Z

    .line 73
    .line 74
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 75
    .line 76
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->smallEncSize:Lcom/tencent/liteav/g$a;

    .line 77
    .line 78
    iget v2, p1, Lcom/tencent/liteav/g$a;->a:I

    .line 79
    .line 80
    iget v3, p1, Lcom/tencent/liteav/g$a;->b:I

    .line 81
    .line 82
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSmallEncParam:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 83
    .line 84
    iget v4, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 85
    .line 86
    iget v5, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoBitrate:I

    .line 87
    .line 88
    invoke-virtual/range {v0 .. v6}, Lcom/tencent/liteav/d;->a(ZIIIII)I

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 92
    .line 93
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->smallEncSize:Lcom/tencent/liteav/g$a;

    .line 94
    .line 95
    iget v2, p1, Lcom/tencent/liteav/g$a;->a:I

    .line 96
    .line 97
    iget v3, p1, Lcom/tencent/liteav/g$a;->b:I

    .line 98
    .line 99
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSmallEncParam:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 100
    .line 101
    iget v4, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 102
    .line 103
    iget v5, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoBitrate:I

    .line 104
    .line 105
    iget-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 106
    .line 107
    iget-boolean v6, p2, Lcom/tencent/liteav/g;->p:Z

    .line 108
    .line 109
    iget v7, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->minVideoBitrate:I

    .line 110
    .line 111
    const/4 v1, 0x3

    .line 112
    move-object v0, p0

    .line 113
    invoke-direct/range {v0 .. v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setVideoEncConfig(IIIIIZI)V

    .line 114
    .line 115
    .line 116
    return-void
.end method


# virtual methods
.method public ConnectOtherRoom(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$8;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$8;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public DisconnectOtherRoom()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$9;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$9;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public apiLog(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, ")trtc_api "

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "TRTCCloudImpl"

    .line 28
    .line 29
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public callExperimentalAPI(Ljava/lang/String;)V
    .locals 10

    .line 1
    const-string v0, "params"

    .line 2
    .line 3
    const-string v1, "api"

    .line 4
    .line 5
    const-string v2, "callExperimentalAPI[lack api or illegal type]: "

    .line 6
    .line 7
    const-string v3, ""

    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    new-instance v4, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v5, "callExperimentalAPI  "

    .line 14
    .line 15
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v5, ", roomid = "

    .line 22
    .line 23
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 27
    .line 28
    iget-wide v6, v5, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->roomId:J

    .line 29
    .line 30
    const-wide/16 v8, -0x1

    .line 31
    .line 32
    cmp-long v8, v6, v8

    .line 33
    .line 34
    if-eqz v8, :cond_0

    .line 35
    .line 36
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v5, v5, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->strRoomId:Ljava/lang/String;

    .line 42
    .line 43
    :goto_0
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-virtual {p0, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    new-instance v4, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string v5, "callExperimentalAPI:%s"

    .line 59
    .line 60
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v5, " self:"

    .line 72
    .line 73
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    const/4 v5, 0x0

    .line 88
    const/4 v6, 0x1

    .line 89
    invoke-static {v6, v4, v3, v5}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 90
    .line 91
    .line 92
    :cond_1
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    .line 93
    .line 94
    invoke-direct {v4, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v4, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    if-nez v5, :cond_2

    .line 102
    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_2
    invoke-virtual {v4, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-nez v1, :cond_3

    .line 128
    .line 129
    return-void

    .line 130
    :cond_3
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 131
    .line 132
    .line 133
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    goto :goto_1

    .line 135
    :catch_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    const-string v1, "callExperimentalAPI[failed]: "

    .line 138
    .line 139
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    const/4 v0, 0x0

    .line 153
    :goto_1
    const-string v1, "setEncodedDataProcessingListener"

    .line 154
    .line 155
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_4

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setEncodedDataProcessingListener(Lorg/json/JSONObject;)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :cond_4
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;

    .line 166
    .line 167
    invoke-direct {v1, p0, v3, v0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public checkDashBoard()V
    .locals 6

    .line 1
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mDebugType:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->localView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getUploadStreamInfo()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v3, "[STATUS]"

    .line 18
    .line 19
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const-string v4, "\n"

    .line 27
    .line 28
    const-string v5, ""

    .line 29
    .line 30
    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v3, " self:"

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v3, "TRTCCloudImpl"

    .line 54
    .line 55
    invoke-static {v3, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    new-instance v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$175;

    .line 59
    .line 60
    invoke-direct {v2, p0, v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$175;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/rtmp/ui/TXCloudVideoView;Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 67
    .line 68
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$176;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$176;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->forEachUser(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public checkRemoteDashBoard(Lcom/tencent/rtmp/ui/TXCloudVideoView;Lcom/tencent/liteav/TXCRenderAndDec;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/tencent/liteav/TXCRenderAndDec;->isRendering()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getDownloadStreamInfo(Lcom/tencent/liteav/TXCRenderAndDec;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    new-instance p3, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v0, "[STATUS]"

    .line 18
    .line 19
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "\n"

    .line 27
    .line 28
    const-string v2, ""

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v0, " self:"

    .line 38
    .line 39
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    const-string v0, "TRTCCloudImpl"

    .line 54
    .line 55
    invoke-static {v0, p3}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    new-instance p3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$174;

    .line 59
    .line 60
    invoke-direct {p3, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$174;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/rtmp/ui/TXCloudVideoView;Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method

.method public checkUserState(Ljava/lang/String;JII)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTRTCListener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 2
    .line 3
    if-eqz v0, :cond_d

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_d

    .line 10
    .line 11
    invoke-static {p4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasAudio(I)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x1

    .line 16
    const/4 v3, 0x0

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-static {p4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteAudio(I)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    move v1, v2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v1, v3

    .line 28
    :goto_0
    invoke-static {p5}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasAudio(I)Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-eqz v4, :cond_1

    .line 33
    .line 34
    invoke-static {p5}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteAudio(I)Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-nez v4, :cond_1

    .line 39
    .line 40
    move v4, v2

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    move v4, v3

    .line 43
    :goto_1
    const-string v5, ""

    .line 44
    .line 45
    const-string v6, " self:"

    .line 46
    .line 47
    const/4 v7, 0x2

    .line 48
    if-eq v4, v1, :cond_2

    .line 49
    .line 50
    new-instance v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$171;

    .line 51
    .line 52
    invoke-direct {v4, p0, v0, p1, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$171;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudListener;Ljava/lang/String;Z)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 59
    .line 60
    invoke-virtual {v4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 65
    .line 66
    .line 67
    move-result-object v8

    .line 68
    filled-new-array {p1, v8}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v8

    .line 72
    const-string v9, "[%s]audio Available[%b]"

    .line 73
    .line 74
    invoke-static {v9, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v8

    .line 78
    invoke-direct {p0, v4, v3, v8}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->appendDashboardLog(Ljava/lang/String;ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    new-instance v4, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    filled-new-array {p1, v1}, [Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const-string v8, "onUserAudioAvailable userID:%s, bAvailable:%b"

    .line 95
    .line 96
    invoke-static {v8, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-static {v7, v1, v5, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 118
    .line 119
    .line 120
    :cond_2
    invoke-static {p4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasMainVideo(I)Z

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    if-nez v1, :cond_3

    .line 125
    .line 126
    invoke-static {p4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasSmallVideo(I)Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-eqz v1, :cond_4

    .line 131
    .line 132
    :cond_3
    invoke-static {p4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteMainVideo(I)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-nez v1, :cond_4

    .line 137
    .line 138
    move v1, v2

    .line 139
    goto :goto_2

    .line 140
    :cond_4
    move v1, v3

    .line 141
    :goto_2
    invoke-static {p5}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasMainVideo(I)Z

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    if-nez v4, :cond_5

    .line 146
    .line 147
    invoke-static {p5}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasSmallVideo(I)Z

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    if-eqz v4, :cond_6

    .line 152
    .line 153
    :cond_5
    invoke-static {p5}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteMainVideo(I)Z

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    if-nez v4, :cond_6

    .line 158
    .line 159
    move v4, v2

    .line 160
    goto :goto_3

    .line 161
    :cond_6
    move v4, v3

    .line 162
    :goto_3
    if-eq v4, v1, :cond_7

    .line 163
    .line 164
    move v4, v2

    .line 165
    goto :goto_4

    .line 166
    :cond_7
    move v4, v3

    .line 167
    :goto_4
    iget v8, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRecvMode:I

    .line 168
    .line 169
    const/4 v9, 0x3

    .line 170
    if-eq v8, v9, :cond_8

    .line 171
    .line 172
    if-eq v8, v2, :cond_8

    .line 173
    .line 174
    move v8, v2

    .line 175
    goto :goto_5

    .line 176
    :cond_8
    move v8, v3

    .line 177
    :goto_5
    if-eqz v4, :cond_a

    .line 178
    .line 179
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 180
    .line 181
    invoke-virtual {v4, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasRecvFirstIFrame(J)Z

    .line 182
    .line 183
    .line 184
    move-result p2

    .line 185
    if-nez p2, :cond_9

    .line 186
    .line 187
    if-eqz v8, :cond_a

    .line 188
    .line 189
    :cond_9
    new-instance p2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$172;

    .line 190
    .line 191
    invoke-direct {p2, p0, v0, p1, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$172;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudListener;Ljava/lang/String;Z)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 195
    .line 196
    .line 197
    iget-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 198
    .line 199
    invoke-virtual {p2}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p2

    .line 203
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 204
    .line 205
    .line 206
    move-result-object p3

    .line 207
    filled-new-array {p1, p3}, [Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object p3

    .line 211
    const-string v4, "[%s]video Available[%b]"

    .line 212
    .line 213
    invoke-static {v4, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p3

    .line 217
    invoke-direct {p0, p2, v3, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->appendDashboardLog(Ljava/lang/String;ILjava/lang/String;)V

    .line 218
    .line 219
    .line 220
    new-instance p2, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 223
    .line 224
    .line 225
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 226
    .line 227
    .line 228
    move-result-object p3

    .line 229
    filled-new-array {p1, p3}, [Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object p3

    .line 233
    const-string v1, "onUserVideoAvailable userID:%s, bAvailable:%b"

    .line 234
    .line 235
    invoke-static {v1, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p3

    .line 239
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 246
    .line 247
    .line 248
    move-result p3

    .line 249
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object p2

    .line 256
    invoke-static {v7, p2, v5, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 257
    .line 258
    .line 259
    :cond_a
    invoke-static {p4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasSubVideo(I)Z

    .line 260
    .line 261
    .line 262
    move-result p2

    .line 263
    if-eqz p2, :cond_b

    .line 264
    .line 265
    invoke-static {p4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteSubVideo(I)Z

    .line 266
    .line 267
    .line 268
    move-result p2

    .line 269
    if-nez p2, :cond_b

    .line 270
    .line 271
    move p2, v2

    .line 272
    goto :goto_6

    .line 273
    :cond_b
    move p2, v3

    .line 274
    :goto_6
    invoke-static {p5}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasSubVideo(I)Z

    .line 275
    .line 276
    .line 277
    move-result p3

    .line 278
    if-eqz p3, :cond_c

    .line 279
    .line 280
    invoke-static {p5}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteSubVideo(I)Z

    .line 281
    .line 282
    .line 283
    move-result p3

    .line 284
    if-nez p3, :cond_c

    .line 285
    .line 286
    goto :goto_7

    .line 287
    :cond_c
    move v2, v3

    .line 288
    :goto_7
    if-eq v2, p2, :cond_d

    .line 289
    .line 290
    new-instance p3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$173;

    .line 291
    .line 292
    invoke-direct {p3, p0, v0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$173;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudListener;Ljava/lang/String;Z)V

    .line 293
    .line 294
    .line 295
    invoke-virtual {p0, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 296
    .line 297
    .line 298
    iget-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 299
    .line 300
    invoke-virtual {p3}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object p3

    .line 304
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 305
    .line 306
    .line 307
    move-result-object p4

    .line 308
    filled-new-array {p1, p4}, [Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object p4

    .line 312
    const-string p5, "[%s]subVideo Available[%b]"

    .line 313
    .line 314
    invoke-static {p5, p4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object p4

    .line 318
    invoke-direct {p0, p3, v3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->appendDashboardLog(Ljava/lang/String;ILjava/lang/String;)V

    .line 319
    .line 320
    .line 321
    new-instance p3, Ljava/lang/StringBuilder;

    .line 322
    .line 323
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 324
    .line 325
    .line 326
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 327
    .line 328
    .line 329
    move-result-object p2

    .line 330
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 331
    .line 332
    .line 333
    move-result-object p1

    .line 334
    const-string p2, "onUserSubStreamAvailable userID:%s, bAvailable:%b"

    .line 335
    .line 336
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object p1

    .line 340
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {p3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 347
    .line 348
    .line 349
    move-result p0

    .line 350
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object p0

    .line 357
    invoke-static {v7, p0, v5, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 358
    .line 359
    .line 360
    :cond_d
    return-void
.end method

.method public createSubCloud()Lcom/tencent/trtc/TRTCCloud;
    .locals 4

    .line 1
    new-instance v0, Lcom/tencent/trtc/TRTCSubCloud;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 11
    .line 12
    invoke-direct {v0, v1, v2, v3}, Lcom/tencent/trtc/TRTCSubCloud;-><init>(Landroid/content/Context;Ljava/lang/ref/WeakReference;Lcom/tencent/liteav/basic/util/e;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mListenerHandler:Landroid/os/Handler;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/tencent/trtc/TRTCSubCloud;->setListenerHandler(Landroid/os/Handler;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$12;

    .line 21
    .line 22
    invoke-direct {v1, p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$12;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCSubCloud;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public destroy()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$2;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$2;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroySubCloud(Lcom/tencent/trtc/TRTCCloud;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$13;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$13;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloud;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public enableAudioEarMonitoring(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$59;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$59;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public enableAudioStream(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    invoke-direct {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->addUpStreamType(I)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-direct {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->removeUpStreamType(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public enableAudioVolumeEvaluation(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$64;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$64;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public enableCustomAudioCapture(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public enableCustomVideoCapture(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public enableEncSmallVideoStream(ZLcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)I
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ZLcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public enableNetworkBlackStream(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getNetworkContext()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeEnableBlackStream(JZ)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public enableNetworkSmallStream(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getNetworkContext()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeEnableSmallStream(JZ)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public enableTorch(Z)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "enableTorch "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/d;->d(Z)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public enableVideoStream(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x3

    .line 2
    const/4 v1, 0x2

    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-direct {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->addUpStreamType(I)V

    .line 6
    .line 7
    .line 8
    iget-boolean p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSmallStream:Z

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->addUpStreamType(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void

    .line 16
    :cond_1
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/tencent/liteav/d;->h()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_2

    .line 23
    .line 24
    invoke-direct {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->removeUpStreamType(I)V

    .line 25
    .line 26
    .line 27
    :cond_2
    invoke-direct {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->removeUpStreamType(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public enterRoom(Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;I)V
    .locals 12

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "enter room, param nil!"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/16 p1, -0xcf4

    .line 9
    .line 10
    const-string p2, "enter room param null"

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onEnterRoom(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 17
    .line 18
    invoke-direct {v2, p1}, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;-><init>(Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;)V

    .line 19
    .line 20
    .line 21
    iget p1, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->sdkAppId:I

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p1, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    iget-object p1, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userSig:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    :cond_1
    move-object v1, p0

    .line 42
    goto/16 :goto_5

    .line 43
    .line 44
    :cond_2
    iget p1, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->roomId:I

    .line 45
    .line 46
    int-to-long v0, p1

    .line 47
    const-wide v3, 0xffffffffL

    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    and-long v4, v0, v3

    .line 53
    .line 54
    iget-object v0, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->businessInfo:Ljava/lang/String;

    .line 55
    .line 56
    const-wide/16 v6, 0x0

    .line 57
    .line 58
    cmp-long v1, v4, v6

    .line 59
    .line 60
    const/4 v3, -0x1

    .line 61
    const-string v6, ""

    .line 62
    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    if-ne p1, v3, :cond_3

    .line 66
    .line 67
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_3

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    move-object v9, v0

    .line 75
    move-object v3, v6

    .line 76
    goto :goto_4

    .line 77
    :cond_4
    :goto_0
    if-nez v1, :cond_5

    .line 78
    .line 79
    iget-object p1, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->strRoomId:Ljava/lang/String;

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_5
    move-object p1, v6

    .line 83
    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-nez v1, :cond_7

    .line 88
    .line 89
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 90
    .line 91
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    const-string v7, "strGroupId"

    .line 100
    .line 101
    invoke-virtual {p0, v1, v7, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->extractBizInfo(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 102
    .line 103
    .line 104
    iget v7, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->roomId:I

    .line 105
    .line 106
    if-ne v7, v3, :cond_6

    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    :cond_6
    invoke-virtual {v1}, Lorg/json/JSONObject;->length()I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_8

    .line 117
    .line 118
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    :cond_7
    :goto_2
    move-object v6, p1

    .line 123
    goto :goto_3

    .line 124
    :catch_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    const-string v1, "enter room, room id error, busInfo "

    .line 127
    .line 128
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    iget-object v1, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->businessInfo:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    :cond_8
    move-object v0, v6

    .line 144
    goto :goto_2

    .line 145
    :goto_3
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    if-eqz p1, :cond_3

    .line 150
    .line 151
    const/16 p1, -0xcf6

    .line 152
    .line 153
    const-string p2, "room id invalid."

    .line 154
    .line 155
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onEnterRoom(ILjava/lang/String;)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :goto_4
    const/16 p1, 0x7531

    .line 160
    .line 161
    invoke-static {p1}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(I)V

    .line 162
    .line 163
    .line 164
    iget v10, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->role:I

    .line 165
    .line 166
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 167
    .line 168
    .line 169
    move-result-wide v6

    .line 170
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;

    .line 171
    .line 172
    move-object v11, p0

    .line 173
    move-object v1, p0

    .line 174
    move v8, p2

    .line 175
    invoke-direct/range {v0 .. v11}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;Ljava/lang/String;JJILjava/lang/String;ILcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :goto_5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 183
    .line 184
    const-string p1, "enterRoom param invalid:"

    .line 185
    .line 186
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-virtual {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    iget p0, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->sdkAppId:I

    .line 200
    .line 201
    if-nez p0, :cond_9

    .line 202
    .line 203
    const/16 p0, -0xcf5

    .line 204
    .line 205
    const-string p1, "enter room sdkAppId invalid."

    .line 206
    .line 207
    invoke-virtual {v1, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onEnterRoom(ILjava/lang/String;)V

    .line 208
    .line 209
    .line 210
    :cond_9
    iget-object p0, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userSig:Ljava/lang/String;

    .line 211
    .line 212
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 213
    .line 214
    .line 215
    move-result p0

    .line 216
    if-eqz p0, :cond_a

    .line 217
    .line 218
    const/16 p0, -0xcf8

    .line 219
    .line 220
    const-string p1, "enter room userSig invalid."

    .line 221
    .line 222
    invoke-virtual {v1, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onEnterRoom(ILjava/lang/String;)V

    .line 223
    .line 224
    .line 225
    :cond_a
    iget-object p0, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userId:Ljava/lang/String;

    .line 226
    .line 227
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 228
    .line 229
    .line 230
    move-result p0

    .line 231
    if-eqz p0, :cond_b

    .line 232
    .line 233
    const/16 p0, -0xcf7

    .line 234
    .line 235
    const-string p1, "enter room userId invalid."

    .line 236
    .line 237
    invoke-virtual {v1, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onEnterRoom(ILjava/lang/String;)V

    .line 238
    .line 239
    .line 240
    :cond_b
    return-void
.end method

.method public exitRoom()V
    .locals 3

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$6;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$6;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x7d0

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThreadAndWaitDone(Ljava/lang/Runnable;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public exitRoomInternal(ZLjava/lang/String;)V
    .locals 5

    .line 1
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 2
    .line 3
    const-string v1, "exitRoom %s, self: %d, reason: %s"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getRoomId()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    filled-new-array {v2, v3, p2}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-static {v0, v1, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p0, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-string v0, ""

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-static {v1, p2, v0, v2}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 39
    .line 40
    .line 41
    iget p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomState:I

    .line 42
    .line 43
    if-nez p2, :cond_0

    .line 44
    .line 45
    invoke-static {}, Lcom/tencent/liteav/basic/module/Monitor;->a()V

    .line 46
    .line 47
    .line 48
    const-string p1, "exitRoom ignore when no in room."

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    iput v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomState:I

    .line 55
    .line 56
    iget-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 57
    .line 58
    invoke-virtual {p2}, Lcom/tencent/liteav/d;->e()V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lcom/tencent/liteav/audio/TXCSoundEffectPlayer;->getInstance()Lcom/tencent/liteav/audio/TXCSoundEffectPlayer;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-virtual {p2}, Lcom/tencent/liteav/audio/TXCSoundEffectPlayer;->stopAllEffect()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopCollectStatus()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startVolumeLevelCal(Z)V

    .line 72
    .line 73
    .line 74
    iget-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 75
    .line 76
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$7;

    .line 77
    .line 78
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$7;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p2, v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->forEachUser(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;)V

    .line 82
    .line 83
    .line 84
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 85
    .line 86
    .line 87
    const/4 p2, 0x0

    .line 88
    invoke-static {p2}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setPlayoutDataListener(Lcom/tencent/liteav/audio/e;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableVideoStream(Z)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableAudioStream(Z)V

    .line 95
    .line 96
    .line 97
    if-eqz p1, :cond_1

    .line 98
    .line 99
    iget-wide v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 100
    .line 101
    invoke-virtual {p0, v3, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeExitRoom(J)I

    .line 102
    .line 103
    .line 104
    :cond_1
    invoke-virtual {p0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableAudioEarMonitoring(Z)V

    .line 105
    .line 106
    .line 107
    invoke-direct {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopLocalAudioInternal()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopBGM()V

    .line 111
    .line 112
    .line 113
    const/16 p1, 0x791c

    .line 114
    .line 115
    invoke-static {p1}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(I)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopLocalPreview()V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopScreenCapture()V

    .line 122
    .line 123
    .line 124
    invoke-static {p1, v2}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->b(II)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 128
    .line 129
    iput-object p2, p1, Lcom/tencent/liteav/g;->A:Landroid/graphics/Bitmap;

    .line 130
    .line 131
    const/16 v0, 0xa

    .line 132
    .line 133
    iput v0, p1, Lcom/tencent/liteav/g;->C:I

    .line 134
    .line 135
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 136
    .line 137
    invoke-virtual {p1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->clear()V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRenderListenerMap:Ljava/util/HashMap;

    .line 141
    .line 142
    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    .line 143
    .line 144
    .line 145
    sget-object p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->NONE:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 146
    .line 147
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoSourceType:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 148
    .line 149
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSmallStream:Z

    .line 150
    .line 151
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableEosMode:Z

    .line 152
    .line 153
    const/4 p1, 0x2

    .line 154
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCodecType:I

    .line 155
    .line 156
    iput-boolean v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftAEC:Z

    .line 157
    .line 158
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftANS:Z

    .line 159
    .line 160
    iput-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableSoftAGC:Z

    .line 161
    .line 162
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 163
    .line 164
    invoke-virtual {p1, v2}, Lcom/tencent/liteav/d;->a(Z)V

    .line 165
    .line 166
    .line 167
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-virtual {p1, v2}, Lcom/tencent/liteav/audio/TXCAudioEngine;->muteLocalAudio(Z)Z

    .line 172
    .line 173
    .line 174
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-virtual {p1}, Lcom/tencent/liteav/audio/TXCAudioEngine;->clean()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableCustomAudioCapture(Z)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableCustomVideoCapture(Z)V

    .line 185
    .line 186
    .line 187
    monitor-enter p0

    .line 188
    :try_start_0
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCustomVideoUtil:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 189
    .line 190
    if-eqz p1, :cond_2

    .line 191
    .line 192
    invoke-virtual {p1}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->release()V

    .line 193
    .line 194
    .line 195
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCustomVideoUtil:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 196
    .line 197
    goto :goto_0

    .line 198
    :catchall_0
    move-exception p1

    .line 199
    goto :goto_1

    .line 200
    :cond_2
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 201
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 202
    .line 203
    invoke-virtual {p1, p2, v2}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/o;I)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopAudioRecording()V

    .line 207
    .line 208
    .line 209
    invoke-static {}, Lcom/tencent/liteav/audio/TXCSoundEffectPlayer;->getInstance()Lcom/tencent/liteav/audio/TXCSoundEffectPlayer;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    invoke-virtual {p1}, Lcom/tencent/liteav/audio/TXCSoundEffectPlayer;->clearCache()V

    .line 214
    .line 215
    .line 216
    invoke-static {}, Lcom/tencent/liteav/basic/module/Monitor;->a()V

    .line 217
    .line 218
    .line 219
    const-string p1, "TRTCCloudImpl"

    .line 220
    .line 221
    const-string p2, "(%d) exitRoomInternal end"

    .line 222
    .line 223
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 224
    .line 225
    .line 226
    move-result p0

    .line 227
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    invoke-static {p1, p2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 236
    .line 237
    .line 238
    return-void

    .line 239
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 240
    throw p1
.end method

.method public extractBizInfo(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .locals 2

    .line 1
    const-string v0, "strGroupId"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    const-string v0, "Role"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v0, "extractBizInfo: key"

    .line 31
    .line 32
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p2, " value:"

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->destroy()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/os/Looper;->quit()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    :catch_0
    :cond_0
    return-void
.end method

.method public getAudioCaptureVolume()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioCaptureVolume:I

    .line 2
    .line 3
    return p0
.end method

.method public getAudioEffectManager()Lcom/tencent/liteav/audio/TXAudioEffectManager;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->getAutoCacheHolder()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getAudioPlayoutVolume()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioPlayoutVolume:I

    .line 2
    .line 3
    return p0
.end method

.method public getBGMDuration(Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer;->getInstance()Lcom/tencent/liteav/audio/TXCLiveBGMPlayer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/audio/TXCLiveBGMPlayer;->getBGMDuration(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getBeautyManager()Lcom/tencent/liteav/beauty/TXBeautyManager;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/liteav/d;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Lcom/tencent/liteav/d;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->b()Lcom/tencent/liteav/beauty/TXBeautyManager;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public getNetworkContext()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getNetworkQuality(II)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tencent/liteav/basic/util/f;->d(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x6

    .line 10
    return p0

    .line 11
    :cond_0
    const/16 p0, 0x32

    .line 12
    .line 13
    if-gt p2, p0, :cond_a

    .line 14
    .line 15
    const/16 p0, 0x1f4

    .line 16
    .line 17
    if-le p1, p0, :cond_1

    .line 18
    .line 19
    goto :goto_4

    .line 20
    :cond_1
    const/16 p0, 0x1e

    .line 21
    .line 22
    if-gt p2, p0, :cond_9

    .line 23
    .line 24
    const/16 p0, 0x15e

    .line 25
    .line 26
    if-le p1, p0, :cond_2

    .line 27
    .line 28
    goto :goto_3

    .line 29
    :cond_2
    const/16 p0, 0x14

    .line 30
    .line 31
    if-gt p2, p0, :cond_8

    .line 32
    .line 33
    const/16 p0, 0xc8

    .line 34
    .line 35
    if-le p1, p0, :cond_3

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_3
    const/16 p0, 0xa

    .line 39
    .line 40
    if-gt p2, p0, :cond_7

    .line 41
    .line 42
    const/16 p0, 0x64

    .line 43
    .line 44
    if-le p1, p0, :cond_4

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_4
    if-gez p2, :cond_6

    .line 48
    .line 49
    if-ltz p1, :cond_5

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_5
    const/4 p0, 0x0

    .line 53
    return p0

    .line 54
    :cond_6
    :goto_0
    const/4 p0, 0x1

    .line 55
    return p0

    .line 56
    :cond_7
    :goto_1
    const/4 p0, 0x2

    .line 57
    return p0

    .line 58
    :cond_8
    :goto_2
    const/4 p0, 0x3

    .line 59
    return p0

    .line 60
    :cond_9
    :goto_3
    const/4 p0, 0x4

    .line 61
    return p0

    .line 62
    :cond_a
    :goto_4
    const/4 p0, 0x5

    .line 63
    return p0
.end method

.method public getUploadStreamInfo()Ljava/lang/CharSequence;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->a()[I

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/16 v2, 0xfa3

    .line 8
    .line 9
    const-string v3, "18446744073709551615"

    .line 10
    .line 11
    const/4 v4, 0x2

    .line 12
    invoke-static {v3, v2, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/16 v5, 0x2711

    .line 17
    .line 18
    invoke-static {v3, v5}, Lcom/tencent/liteav/basic/module/TXCStatus;->b(Ljava/lang/String;I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    new-instance v6, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v7, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 28
    .line 29
    invoke-virtual {v7}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    const/16 v8, 0x2ee2

    .line 34
    .line 35
    invoke-static {v3, v8}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 36
    .line 37
    .line 38
    move-result v8

    .line 39
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v8

    .line 43
    filled-new-array {v7, v8}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    const-string v8, "LOCAL: [%s] RTT:%dms\n"

    .line 48
    .line 49
    invoke-static {v8, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    sget-object v7, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 57
    .line 58
    const/16 v8, 0x2ee1

    .line 59
    .line 60
    invoke-static {v3, v8}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 61
    .line 62
    .line 63
    move-result v8

    .line 64
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v9

    .line 68
    const/16 v8, 0x32d3

    .line 69
    .line 70
    invoke-static {v3, v8, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 71
    .line 72
    .line 73
    move-result v8

    .line 74
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v10

    .line 78
    const/16 v8, 0x32d4

    .line 79
    .line 80
    invoke-static {v3, v8, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 81
    .line 82
    .line 83
    move-result v8

    .line 84
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object v11

    .line 88
    const/16 v8, 0x32d5

    .line 89
    .line 90
    invoke-static {v3, v8, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 91
    .line 92
    .line 93
    move-result v8

    .line 94
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v12

    .line 98
    const/16 v8, 0x32d2

    .line 99
    .line 100
    invoke-static {v3, v8, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 101
    .line 102
    .line 103
    move-result v8

    .line 104
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object v13

    .line 108
    const/16 v8, 0x36bb

    .line 109
    .line 110
    invoke-static {v3, v8}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 111
    .line 112
    .line 113
    move-result v8

    .line 114
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 115
    .line 116
    .line 117
    move-result-object v14

    .line 118
    const/16 v8, 0x36bc

    .line 119
    .line 120
    invoke-static {v3, v8}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 121
    .line 122
    .line 123
    move-result v8

    .line 124
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 125
    .line 126
    .line 127
    move-result-object v15

    .line 128
    const/16 v8, 0x36bd

    .line 129
    .line 130
    invoke-static {v3, v8}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 131
    .line 132
    .line 133
    move-result v8

    .line 134
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 135
    .line 136
    .line 137
    move-result-object v16

    .line 138
    const/16 v8, 0x36ba

    .line 139
    .line 140
    invoke-static {v3, v8}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 141
    .line 142
    .line 143
    move-result v8

    .line 144
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 145
    .line 146
    .line 147
    move-result-object v17

    .line 148
    const/16 v8, 0x2ee3

    .line 149
    .line 150
    invoke-static {v3, v8}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 151
    .line 152
    .line 153
    move-result v8

    .line 154
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 155
    .line 156
    .line 157
    move-result-object v18

    .line 158
    filled-new-array/range {v9 .. v18}, [Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v8

    .line 162
    const-string v9, "SEND:% 5dkbps LOSS:%d-%d-%d-%d|%d-%d-%d-%d|%d%%\n"

    .line 163
    .line 164
    invoke-static {v7, v9, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v8

    .line 168
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    const/16 v8, 0x32ca

    .line 172
    .line 173
    invoke-static {v3, v8, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 174
    .line 175
    .line 176
    move-result v9

    .line 177
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 178
    .line 179
    .line 180
    move-result-object v10

    .line 181
    const/4 v9, 0x3

    .line 182
    invoke-static {v3, v8, v9}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 183
    .line 184
    .line 185
    move-result v8

    .line 186
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 187
    .line 188
    .line 189
    move-result-object v11

    .line 190
    const/16 v8, 0x36b2

    .line 191
    .line 192
    invoke-static {v3, v8}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 193
    .line 194
    .line 195
    move-result v8

    .line 196
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 197
    .line 198
    .line 199
    move-result-object v12

    .line 200
    shr-int/lit8 v8, v2, 0x10

    .line 201
    .line 202
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 203
    .line 204
    .line 205
    move-result-object v13

    .line 206
    const v8, 0xffff

    .line 207
    .line 208
    .line 209
    and-int/2addr v2, v8

    .line 210
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 211
    .line 212
    .line 213
    move-result-object v14

    .line 214
    const/16 v2, 0xfa1

    .line 215
    .line 216
    invoke-static {v3, v2, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;II)D

    .line 217
    .line 218
    .line 219
    move-result-wide v8

    .line 220
    double-to-int v2, v8

    .line 221
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 222
    .line 223
    .line 224
    move-result-object v15

    .line 225
    const/16 v2, 0x32d6

    .line 226
    .line 227
    invoke-static {v3, v2, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;II)D

    .line 228
    .line 229
    .line 230
    move-result-wide v8

    .line 231
    double-to-int v2, v8

    .line 232
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 233
    .line 234
    .line 235
    move-result-object v16

    .line 236
    filled-new-array/range {v10 .. v16}, [Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    const-string v8, "BIT:%d|%d|%dkbps RES:%dx%d FPS:%d-%d\n"

    .line 241
    .line 242
    invoke-static {v7, v8, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    const/16 v2, 0x32cc

    .line 250
    .line 251
    invoke-static {v3, v2, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    const/16 v8, 0x36b6

    .line 260
    .line 261
    invoke-static {v3, v8}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 262
    .line 263
    .line 264
    move-result v8

    .line 265
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 266
    .line 267
    .line 268
    move-result-object v8

    .line 269
    const/16 v9, 0x32d0

    .line 270
    .line 271
    invoke-static {v3, v9, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 272
    .line 273
    .line 274
    move-result v9

    .line 275
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 276
    .line 277
    .line 278
    move-result-object v9

    .line 279
    const/16 v10, 0x36b8

    .line 280
    .line 281
    invoke-static {v3, v10}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 282
    .line 283
    .line 284
    move-result v10

    .line 285
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 286
    .line 287
    .line 288
    move-result-object v10

    .line 289
    const/16 v11, 0x32cf

    .line 290
    .line 291
    invoke-static {v3, v11, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 292
    .line 293
    .line 294
    move-result v11

    .line 295
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 296
    .line 297
    .line 298
    move-result-object v11

    .line 299
    filled-new-array {v2, v8, v9, v10, v11}, [Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object v2

    .line 303
    const-string v8, "FEC:%d%%|%d%%  ARQ:%d|%dkbps  RPS:%d\n"

    .line 304
    .line 305
    invoke-static {v7, v8, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    const/4 v2, 0x0

    .line 313
    aget v2, v1, v2

    .line 314
    .line 315
    div-int/lit8 v2, v2, 0xa

    .line 316
    .line 317
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 318
    .line 319
    .line 320
    move-result-object v8

    .line 321
    const/4 v2, 0x1

    .line 322
    aget v1, v1, v2

    .line 323
    .line 324
    div-int/lit8 v1, v1, 0xa

    .line 325
    .line 326
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 327
    .line 328
    .line 329
    move-result-object v9

    .line 330
    const/16 v1, 0x3aa1

    .line 331
    .line 332
    invoke-static {v3, v1, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 333
    .line 334
    .line 335
    move-result v1

    .line 336
    invoke-direct {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getQosValue(I)Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v10

    .line 340
    const/16 v0, 0x3a9a

    .line 341
    .line 342
    invoke-static {v3, v0, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 343
    .line 344
    .line 345
    move-result v0

    .line 346
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 347
    .line 348
    .line 349
    move-result-object v11

    .line 350
    const/16 v0, 0x3aa2

    .line 351
    .line 352
    invoke-static {v3, v0, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 353
    .line 354
    .line 355
    move-result v0

    .line 356
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 357
    .line 358
    .line 359
    move-result-object v12

    .line 360
    const/16 v0, 0x3a9d

    .line 361
    .line 362
    invoke-static {v3, v0, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 363
    .line 364
    .line 365
    move-result v0

    .line 366
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 367
    .line 368
    .line 369
    move-result-object v13

    .line 370
    filled-new-array/range {v8 .. v13}, [Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    const-string v1, "CPU:%d%%|%d%%    QOS:%s|%dkbps|%d-%d\n"

    .line 375
    .line 376
    invoke-static {v7, v1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 381
    .line 382
    .line 383
    const-string v0, "SVR:%s"

    .line 384
    .line 385
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    invoke-static {v7, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    .line 395
    .line 396
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    move-result-object v0

    .line 400
    return-object v0
.end method

.method public isCameraAutoFocusFaceModeSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->o()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isCameraFocusPositionInPreviewSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->n()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isCameraTorchSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->m()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isCameraZoomSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->l()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isPublishingInCloud(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 15
    .line 16
    if-ne p0, p1, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    monitor-exit v0

    .line 20
    return p0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    monitor-exit v0

    .line 24
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0
.end method

.method public muteAllRemoteAudio(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public muteAllRemoteVideoStreams(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public muteLocalAudio(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$53;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$53;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public muteLocalAudio(ZLcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 1

    .line 10
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;

    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ZLcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public muteLocalVideo(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$29;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$29;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public muteLocalVideo(ZLcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 1

    .line 10
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;

    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ZLcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public muteRemoteAudio(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$55;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$55;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public muteRemoteAudioInSpeaker(Lorg/json/JSONObject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "muteRemoteAudioInSpeaker[lack parameter]"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "userID"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    const-string p1, "muteRemoteAudioInSpeaker[lack parameter]: userID"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    const-string p1, "muteRemoteAudioInSpeaker[illegal type]: userID"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    const-string v1, "mute"

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-nez v2, :cond_3

    .line 42
    .line 43
    const-string p1, "muteRemoteAudioInSpeaker[lack parameter]: mute"

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 54
    .line 55
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUser(Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const/4 v2, 0x0

    .line 60
    const/4 v3, 0x1

    .line 61
    if-nez v1, :cond_5

    .line 62
    .line 63
    new-instance v1, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string v4, "muteRemoteAudioInSpeaker "

    .line 66
    .line 67
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v4, " no exist, create one."

    .line 74
    .line 75
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-direct {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->createUserInfo(Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    if-ne p1, v3, :cond_4

    .line 90
    .line 91
    move v2, v3

    .line 92
    :cond_4
    iput-boolean v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->muteAudioInSpeaker:Z

    .line 93
    .line 94
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 95
    .line 96
    invoke-virtual {p0, v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->addUserInfo(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_5
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    iget-wide v0, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 105
    .line 106
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    if-ne p1, v3, :cond_6

    .line 111
    .line 112
    move v2, v3

    .line 113
    :cond_6
    invoke-virtual {p0, v0, v2}, Lcom/tencent/liteav/audio/TXCAudioEngine;->muteRemoteAudioInSpeaker(Ljava/lang/String;Z)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public muteRemoteVideoStream(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public native nativeAddUpstream(JI)I
.end method

.method public native nativeCreateContext(III)J
.end method

.method public native nativeDestroyContext(J)V
.end method

.method public native nativeEnterRoom(JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIIILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)I
.end method

.method public native nativeExitRoom(J)I
.end method

.method public native nativeInit(JILjava/lang/String;Ljava/lang/String;[B)V
.end method

.method public native nativeSetMixTranscodingConfig(JLcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner;)V
.end method

.method public native nativeSetPriorRemoteVideoStreamType(JI)I
.end method

.method public native nativeSwitchRoom(JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public notifyEvent(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 1

    .line 30
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    invoke-direct {v0, p0, p1, p3, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;Landroid/os/Bundle;I)V

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onAVMemberEnter(JLjava/lang/String;II)V
    .locals 8

    .line 1
    new-instance v2, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;

    .line 7
    .line 8
    move-object v1, p0

    .line 9
    move-wide v4, p1

    .line 10
    move-object v3, p3

    .line 11
    move v6, p4

    .line 12
    move v7, p5

    .line 13
    invoke-direct/range {v0 .. v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/ref/WeakReference;Ljava/lang/String;JII)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onAVMemberExit(JLjava/lang/String;II)V
    .locals 7

    .line 1
    new-instance v2, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 7
    .line 8
    move-object v1, p0

    .line 9
    move-wide v4, p1

    .line 10
    move-object v3, p3

    .line 11
    move v6, p5

    .line 12
    invoke-direct/range {v0 .. v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/ref/WeakReference;Ljava/lang/String;JI)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "[%s]leave room"

    .line 25
    .line 26
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const/4 p2, 0x0

    .line 35
    invoke-direct {v1, p0, p2, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->notifyEvent(Ljava/lang/String;ILjava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public onAudioJitterBufferError(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onAudioJitterBufferNotify(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$123;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p3, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$123;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAudioPlayPcmData(Ljava/lang/String;[BJII)V
    .locals 8

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioFrameListener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;

    .line 8
    .line 9
    invoke-direct {p1}, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p2, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->data:[B

    .line 13
    .line 14
    iput-wide p3, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->timestamp:J

    .line 15
    .line 16
    iput p5, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->sampleRate:I

    .line 17
    .line 18
    iput p6, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->channel:I

    .line 19
    .line 20
    invoke-interface {p0, p1}, Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;->onMixedPlayAudioFrame(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void

    .line 24
    :cond_1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;

    .line 25
    .line 26
    move-object v1, p0

    .line 27
    move-object v7, p1

    .line 28
    move-object v2, p2

    .line 29
    move-wide v3, p3

    .line 30
    move v5, p5

    .line 31
    move v6, p6

    .line 32
    invoke-direct/range {v0 .. v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;[BJIILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public onAudioQosChanged(III)V
    .locals 0

    .line 18
    invoke-virtual {p0, p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onAudioQosChanged(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;III)V

    return-void
.end method

.method public onAudioQosChanged(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;III)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->isPublishingInCloud(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)Z

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$143;

    .line 10
    .line 11
    invoke-direct {p1, p0, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$143;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;III)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onBackgroudPushStop()V
    .locals 0

    return-void
.end method

.method public onCancelTranscoding(ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$161;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$161;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onEffectPlayFinish(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$99;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$99;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onEffectPlayStart(II)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$100;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$100;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;II)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onEncVideo(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeLock:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter v0

    .line 7
    :try_start_0
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->pushVideoFrame(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

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
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    throw p0
.end method

.method public onEncVideoFormat(Landroid/media/MediaFormat;)V
    .locals 0

    return-void
.end method

.method public onEnterRoom(ILjava/lang/String;)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    new-instance v3, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v4, "onEnterRoom "

    .line 10
    .line 11
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v4, ", "

    .line 18
    .line 19
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    new-instance v3, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    filled-new-array {v4, v2}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    const-string v5, "onEnterRoom err:%d msg:%s"

    .line 46
    .line 47
    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v4, " self:"

    .line 55
    .line 56
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    const-string v4, ""

    .line 71
    .line 72
    const/4 v5, 0x0

    .line 73
    const/4 v6, 0x1

    .line 74
    invoke-static {v6, v3, v4, v5}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 75
    .line 76
    .line 77
    if-nez v1, :cond_0

    .line 78
    .line 79
    const-string v13, ""

    .line 80
    .line 81
    const/4 v14, 0x0

    .line 82
    const-string v7, "18446744073709551615"

    .line 83
    .line 84
    const/16 v8, 0x138b

    .line 85
    .line 86
    const-wide/16 v9, 0x1

    .line 87
    .line 88
    const-wide/16 v11, -0x1

    .line 89
    .line 90
    invoke-static/range {v7 .. v14}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_0
    const-string v21, ""

    .line 95
    .line 96
    const/16 v22, 0x0

    .line 97
    .line 98
    const-string v15, "18446744073709551615"

    .line 99
    .line 100
    const/16 v16, 0x138b

    .line 101
    .line 102
    const-wide/16 v17, 0x0

    .line 103
    .line 104
    const-wide/16 v19, -0x1

    .line 105
    .line 106
    invoke-static/range {v15 .. v22}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 107
    .line 108
    .line 109
    :goto_0
    new-instance v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$128;

    .line 110
    .line 111
    invoke-direct {v3, v0, v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$128;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 115
    .line 116
    .line 117
    new-instance v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$129;

    .line 118
    .line 119
    invoke-direct {v2, v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$129;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public onIdrFpsChanged(I)V
    .locals 0

    .line 18
    invoke-virtual {p0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onIdrFpsChanged(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    return-void
.end method

.method public onIdrFpsChanged(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->isPublishingInCloud(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)Z

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$145;

    .line 10
    .line 11
    invoke-direct {p1, p0, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$145;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onNotifyEvent(ILandroid/os/Bundle;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$120;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$120;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Landroid/os/Bundle;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onPlayEnd(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$125;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$125;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onPlayProgress(JJ)V
    .locals 6

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$126;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move-wide v4, p3

    .line 6
    invoke-direct/range {v0 .. v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$126;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJ)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onPlayStart()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$124;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$124;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onRecordEncData([BJIII)V
    .locals 0

    return-void
.end method

.method public onRecordError(ILjava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "EVT_USERID"

    .line 7
    .line 8
    const-string v2, "18446744073709551615"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v1, "EVT_TIME"

    .line 14
    .line 15
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v2, "onRecordError code = "

    .line 25
    .line 26
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v2, ":"

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string p2, " self:"

    .line 41
    .line 42
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    const-string v1, "TRTCCloudImpl"

    .line 57
    .line 58
    invoke-static {v1, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const/4 p2, -0x1

    .line 62
    const-string v1, "EVT_ID"

    .line 63
    .line 64
    if-ne p1, p2, :cond_0

    .line 65
    .line 66
    const/16 p2, -0x516

    .line 67
    .line 68
    invoke-virtual {v0, v1, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p2, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onNotifyEvent(ILandroid/os/Bundle;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    const/4 p2, -0x6

    .line 75
    if-ne p1, p2, :cond_1

    .line 76
    .line 77
    const/16 p2, 0x7eb

    .line 78
    .line 79
    invoke-virtual {v0, v1, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, p2, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onNotifyEvent(ILandroid/os/Bundle;)V

    .line 83
    .line 84
    .line 85
    :cond_1
    const/4 p2, -0x7

    .line 86
    if-ne p1, p2, :cond_2

    .line 87
    .line 88
    const/16 p1, 0x7ed

    .line 89
    .line 90
    invoke-virtual {v0, v1, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onNotifyEvent(ILandroid/os/Bundle;)V

    .line 94
    .line 95
    .line 96
    :cond_2
    return-void
.end method

.method public onRecordPcmData([BJIII)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioFrameListener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance p6, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;

    .line 6
    .line 7
    invoke-direct {p6}, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p6, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->data:[B

    .line 11
    .line 12
    iput-wide p2, p6, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->timestamp:J

    .line 13
    .line 14
    iput p4, p6, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->sampleRate:I

    .line 15
    .line 16
    iput p5, p6, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->channel:I

    .line 17
    .line 18
    invoke-interface {p0, p6}, Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;->onLocalProcessedAudioFrame(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public onRecordRawPcmData([BJIIIZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioFrameListener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance p6, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;

    .line 6
    .line 7
    invoke-direct {p6}, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p6, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->data:[B

    .line 11
    .line 12
    iput-wide p2, p6, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->timestamp:J

    .line 13
    .line 14
    iput p4, p6, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->sampleRate:I

    .line 15
    .line 16
    iput p5, p6, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->channel:I

    .line 17
    .line 18
    invoke-interface {p0, p6}, Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;->onCapturedRawAudioFrame(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public onRenderVideoFrame(Ljava/lang/String;ILcom/tencent/liteav/basic/structs/TXSVideoFrame;)V
    .locals 8

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    goto/16 :goto_4

    .line 4
    .line 5
    :cond_0
    new-instance v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;-><init>()V

    .line 8
    .line 9
    .line 10
    iget v1, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->width:I

    .line 11
    .line 12
    iput v1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 13
    .line 14
    iget v1, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->height:I

    .line 15
    .line 16
    iput v1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 17
    .line 18
    iget v1, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->rotation:I

    .line 19
    .line 20
    iput v1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->rotation:I

    .line 21
    .line 22
    iget-wide v1, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->pts:J

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->timestamp:J

    .line 25
    .line 26
    invoke-direct {p0, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->translateStreamType(I)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/4 v2, 0x1

    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    const-string v1, "18446744073709551615"

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 46
    .line 47
    invoke-virtual {v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getTinyId()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    const/4 v1, 0x0

    .line 59
    goto :goto_1

    .line 60
    :cond_2
    :goto_0
    move v1, v2

    .line 61
    :goto_1
    if-eqz v1, :cond_3

    .line 62
    .line 63
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 70
    .line 71
    iget v4, v3, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->localPixelFormat:I

    .line 72
    .line 73
    iput v4, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->pixelFormat:I

    .line 74
    .line 75
    iget v4, v3, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->localBufferType:I

    .line 76
    .line 77
    iput v4, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->bufferType:I

    .line 78
    .line 79
    iget-object v3, v3, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->localListener:Lcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_3
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRenderListenerMap:Ljava/util/HashMap;

    .line 83
    .line 84
    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    :cond_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    if-eqz v4, :cond_5

    .line 97
    .line 98
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    check-cast v4, Ljava/util/Map$Entry;

    .line 103
    .line 104
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    check-cast v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;

    .line 109
    .line 110
    if-eqz v5, :cond_4

    .line 111
    .line 112
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    check-cast v6, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;

    .line 117
    .line 118
    iget-object v6, v6, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;->strTinyID:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {p1, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 121
    .line 122
    .line 123
    move-result v6

    .line 124
    if-eqz v6, :cond_4

    .line 125
    .line 126
    iget p1, v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;->pixelFormat:I

    .line 127
    .line 128
    iput p1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->pixelFormat:I

    .line 129
    .line 130
    iget p1, v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;->bufferType:I

    .line 131
    .line 132
    iput p1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->bufferType:I

    .line 133
    .line 134
    iget-object v3, v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;->listener:Lcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;

    .line 135
    .line 136
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Ljava/lang/String;

    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_5
    const/4 v3, 0x0

    .line 144
    const-string p1, ""

    .line 145
    .line 146
    :goto_2
    if-eqz v3, :cond_d

    .line 147
    .line 148
    iget v4, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->bufferType:I

    .line 149
    .line 150
    const/4 v5, 0x3

    .line 151
    const/4 v6, 0x2

    .line 152
    if-ne v4, v2, :cond_7

    .line 153
    .line 154
    iget-object v2, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->buffer:Ljava/nio/ByteBuffer;

    .line 155
    .line 156
    if-nez v2, :cond_6

    .line 157
    .line 158
    invoke-virtual {p3}, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->loadYUVBufferFromGL()V

    .line 159
    .line 160
    .line 161
    :cond_6
    iget-object v2, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->buffer:Ljava/nio/ByteBuffer;

    .line 162
    .line 163
    iput-object v2, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->buffer:Ljava/nio/ByteBuffer;

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_7
    if-ne v4, v6, :cond_8

    .line 167
    .line 168
    iget-object v2, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->data:[B

    .line 169
    .line 170
    iput-object v2, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->data:[B

    .line 171
    .line 172
    if-nez v2, :cond_b

    .line 173
    .line 174
    iget v2, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->width:I

    .line 175
    .line 176
    iget v4, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->height:I

    .line 177
    .line 178
    mul-int/2addr v2, v4

    .line 179
    mul-int/2addr v2, v5

    .line 180
    div-int/2addr v2, v6

    .line 181
    new-array v2, v2, [B

    .line 182
    .line 183
    iput-object v2, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->data:[B

    .line 184
    .line 185
    invoke-virtual {p3, v2}, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->loadYUVArray([B)V

    .line 186
    .line 187
    .line 188
    goto :goto_3

    .line 189
    :cond_8
    if-ne v4, v5, :cond_b

    .line 190
    .line 191
    iget-object v2, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->eglContext:Ljava/lang/Object;

    .line 192
    .line 193
    if-nez v2, :cond_9

    .line 194
    .line 195
    goto :goto_4

    .line 196
    :cond_9
    new-instance v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;

    .line 197
    .line 198
    invoke-direct {v2}, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;-><init>()V

    .line 199
    .line 200
    .line 201
    iput-object v2, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->texture:Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;

    .line 202
    .line 203
    iget v4, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->textureId:I

    .line 204
    .line 205
    iput v4, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->textureId:I

    .line 206
    .line 207
    iget-object v4, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->eglContext:Ljava/lang/Object;

    .line 208
    .line 209
    instance-of v7, v4, Ljavax/microedition/khronos/egl/EGLContext;

    .line 210
    .line 211
    if-eqz v7, :cond_a

    .line 212
    .line 213
    check-cast v4, Ljavax/microedition/khronos/egl/EGLContext;

    .line 214
    .line 215
    iput-object v4, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->eglContext10:Ljavax/microedition/khronos/egl/EGLContext;

    .line 216
    .line 217
    goto :goto_3

    .line 218
    :cond_a
    instance-of v7, v4, Landroid/opengl/EGLContext;

    .line 219
    .line 220
    if-eqz v7, :cond_b

    .line 221
    .line 222
    check-cast v4, Landroid/opengl/EGLContext;

    .line 223
    .line 224
    iput-object v4, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->eglContext14:Landroid/opengl/EGLContext;

    .line 225
    .line 226
    :cond_b
    :goto_3
    invoke-interface {v3, p1, p2, v0}, Lcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;->onRenderVideoFrame(Ljava/lang/String;ILcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V

    .line 227
    .line 228
    .line 229
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 230
    .line 231
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->enableCustomPreprocessor:Z

    .line 232
    .line 233
    if-eqz p0, :cond_d

    .line 234
    .line 235
    if-eqz v1, :cond_d

    .line 236
    .line 237
    iget p0, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->bufferType:I

    .line 238
    .line 239
    if-ne p0, v6, :cond_c

    .line 240
    .line 241
    iget-object p0, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->data:[B

    .line 242
    .line 243
    iput-object p0, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->data:[B

    .line 244
    .line 245
    return-void

    .line 246
    :cond_c
    if-ne p0, v5, :cond_d

    .line 247
    .line 248
    iget-object p0, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->texture:Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;

    .line 249
    .line 250
    iget p0, p0, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->textureId:I

    .line 251
    .line 252
    iput p0, p3, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->textureId:I

    .line 253
    .line 254
    :cond_d
    :goto_4
    return-void
.end method

.method public onRequestKeyFrame(Ljava/lang/String;I)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$121;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$121;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onScreenCapturePaused()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$62;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$62;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onScreenCaptureResumed()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$61;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$61;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onScreenCaptureStarted()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$60;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$60;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onScreenCaptureStopped(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$63;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$63;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onSendFirstLocalAudioFrame()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$164;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$164;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onSendFirstLocalVideoFrame(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$163;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$163;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onVideoConfigChanged(IZ)V
    .locals 0

    .line 17
    invoke-virtual {p0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onVideoConfigChanged(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IZ)V

    return-void
.end method

.method public onVideoConfigChanged(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->isPublishingInCloud(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$153;

    .line 9
    .line 10
    invoke-direct {p1, p0, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$153;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IZ)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onVideoQosChanged(IIIIIII)V
    .locals 9

    move-object v1, p0

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    move/from16 v8, p7

    .line 27
    invoke-virtual/range {v0 .. v8}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onVideoQosChanged(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIII)V

    return-void
.end method

.method public onVideoQosChanged(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIII)V
    .locals 9

    .line 1
    invoke-virtual/range {p0 .. p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->isPublishingInCloud(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;

    .line 9
    .line 10
    move-object v1, p0

    .line 11
    move v2, p2

    .line 12
    move v3, p3

    .line 13
    move v4, p4

    .line 14
    move v5, p5

    .line 15
    move v6, p6

    .line 16
    move/from16 v7, p7

    .line 17
    .line 18
    move/from16 v8, p8

    .line 19
    .line 20
    invoke-direct/range {v0 .. v8}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIII)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public pauseAudioEffect(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$106;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$106;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pauseBGM()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$90;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$90;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pauseScreenCapture()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$27;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$27;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public playAudioEffect(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$101;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$101;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public playBGM(Ljava/lang/String;Lcom/tencent/trtc/TRTCCloud$BGMNotify;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$88;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$88;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloud$BGMNotify;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public resumeAudioEffect(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$107;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$107;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public resumeBGM()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$91;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$91;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public resumeScreenCapture()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$28;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$28;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public runOnListenerThread(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mListenerHandler:Landroid/os/Handler;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mMainHandler:Lcom/tencent/liteav/basic/util/e;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    if-eq p0, v1, :cond_2

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public runOnMainThread(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mMainHandler:Lcom/tencent/liteav/basic/util/e;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public runOnSDKThread(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public runOnSDKThreadAndWaitDone(Ljava/lang/Runnable;J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/liteav/basic/util/e;->a(Ljava/lang/Runnable;J)Z

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public selectMotionTmpl(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$72;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$72;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public sendCustomAudioData(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "sendCustomAudioData parameter is null"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance v0, Lcom/tencent/liteav/basic/structs/a;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/tencent/liteav/basic/structs/a;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->data:[B

    .line 15
    .line 16
    array-length v2, v1

    .line 17
    new-array v2, v2, [B

    .line 18
    .line 19
    iput-object v2, v0, Lcom/tencent/liteav/basic/structs/a;->f:[B

    .line 20
    .line 21
    array-length v3, v1

    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 24
    .line 25
    .line 26
    iget v1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->sampleRate:I

    .line 27
    .line 28
    iput v1, v0, Lcom/tencent/liteav/basic/structs/a;->a:I

    .line 29
    .line 30
    iget v1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->channel:I

    .line 31
    .line 32
    iput v1, v0, Lcom/tencent/liteav/basic/structs/a;->b:I

    .line 33
    .line 34
    const/16 v1, 0x10

    .line 35
    .line 36
    iput v1, v0, Lcom/tencent/liteav/basic/structs/a;->c:I

    .line 37
    .line 38
    iget-wide v1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->timestamp:J

    .line 39
    .line 40
    const-wide/16 v3, 0x0

    .line 41
    .line 42
    cmp-long p1, v3, v1

    .line 43
    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->generatePtsMS()J

    .line 47
    .line 48
    .line 49
    move-result-wide v1

    .line 50
    iput-wide v1, v0, Lcom/tencent/liteav/basic/structs/a;->e:J

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iput-wide v1, v0, Lcom/tencent/liteav/basic/structs/a;->e:J

    .line 54
    .line 55
    :goto_0
    new-instance p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$87;

    .line 56
    .line 57
    invoke-direct {p1, p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$87;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/basic/structs/a;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public sendCustomCmdMsg(I[BZZ)Z
    .locals 11

    .line 1
    const-string v1, "TRTCCloudImpl"

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    return v2

    .line 7
    :cond_0
    :try_start_0
    new-instance v0, Ljava/lang/String;

    .line 8
    .line 9
    const-string v3, "UTF-8"

    .line 10
    .line 11
    invoke-direct {v0, p2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    :goto_0
    move-object v6, v0

    .line 15
    goto :goto_1

    .line 16
    :catch_0
    move-exception v0

    .line 17
    move-object p2, v0

    .line 18
    const-string v0, "invalid message data"

    .line 19
    .line 20
    invoke-static {v1, v0, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    goto :goto_0

    .line 25
    :goto_1
    iget p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentRole:I

    .line 26
    .line 27
    const/16 v0, 0x15

    .line 28
    .line 29
    if-ne p2, v0, :cond_1

    .line 30
    .line 31
    const-string p1, "ignore send custom cmd msg for audience"

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return v2

    .line 37
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 38
    .line 39
    .line 40
    move-result-wide v3

    .line 41
    iget-wide v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastSendMsgTimeMs:J

    .line 42
    .line 43
    const-wide/16 v9, 0x0

    .line 44
    .line 45
    cmp-long p2, v7, v9

    .line 46
    .line 47
    if-nez p2, :cond_2

    .line 48
    .line 49
    iput-wide v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastSendMsgTimeMs:J

    .line 50
    .line 51
    :cond_2
    iget-wide v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastSendMsgTimeMs:J

    .line 52
    .line 53
    sub-long v7, v3, v7

    .line 54
    .line 55
    const-wide/16 v9, 0x3e8

    .line 56
    .line 57
    cmp-long p2, v7, v9

    .line 58
    .line 59
    const/4 v0, 0x1

    .line 60
    if-gez p2, :cond_4

    .line 61
    .line 62
    iget p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSendMsgCount:I

    .line 63
    .line 64
    const/16 v3, 0x1e

    .line 65
    .line 66
    if-ge p2, v3, :cond_3

    .line 67
    .line 68
    iget v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSendMsgSize:I

    .line 69
    .line 70
    const/16 v4, 0x2000

    .line 71
    .line 72
    if-ge v3, v4, :cond_3

    .line 73
    .line 74
    add-int/2addr p2, v0

    .line 75
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSendMsgCount:I

    .line 76
    .line 77
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    add-int/2addr v3, p2

    .line 82
    iput v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSendMsgSize:I

    .line 83
    .line 84
    :goto_2
    move v2, v0

    .line 85
    goto :goto_3

    .line 86
    :cond_3
    new-instance p2, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v0, "send msg too more self:"

    .line 89
    .line 90
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-static {v1, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_4
    iput-wide v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastSendMsgTimeMs:J

    .line 109
    .line 110
    iput v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSendMsgCount:I

    .line 111
    .line 112
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSendMsgSize:I

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :goto_3
    if-eqz v2, :cond_5

    .line 120
    .line 121
    new-instance v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$117;

    .line 122
    .line 123
    move-object v4, p0

    .line 124
    move v5, p1

    .line 125
    move v7, p3

    .line 126
    move v8, p4

    .line 127
    invoke-direct/range {v3 .. v8}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$117;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;ZZ)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v4, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 131
    .line 132
    .line 133
    :cond_5
    return v2
.end method

.method public sendCustomVideoData(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "sendCustomVideoData parameter is null"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->pixelFormat:I

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    const/4 v2, 0x2

    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    const/4 v1, 0x4

    .line 16
    if-eq v0, v1, :cond_1

    .line 17
    .line 18
    if-eq v0, v2, :cond_1

    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v1, "sendCustomVideoData parameter error unsupported pixel format "

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget p1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->pixelFormat:I

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    iget v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->bufferType:I

    .line 41
    .line 42
    if-eq v0, v2, :cond_2

    .line 43
    .line 44
    iget-object v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->texture:Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;

    .line 45
    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v1, "sendCustomVideoData parameter error unsupported buffer type "

    .line 51
    .line 52
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget p1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->bufferType:I

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVideoSourceType:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 69
    .line 70
    sget-object v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->CUSTOM:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 71
    .line 72
    if-ne v0, v1, :cond_7

    .line 73
    .line 74
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomState:I

    .line 75
    .line 76
    if-ne v0, v2, :cond_7

    .line 77
    .line 78
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 79
    .line 80
    iget-boolean v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->muteLocalVideo:Z

    .line 81
    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    monitor-enter p0

    .line 86
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCustomVideoUtil:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 87
    .line 88
    if-nez v0, :cond_4

    .line 89
    .line 90
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 91
    .line 92
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 93
    .line 94
    invoke-direct {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;-><init>(Lcom/tencent/liteav/d;)V

    .line 95
    .line 96
    .line 97
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCustomVideoUtil:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :catchall_0
    move-exception p1

    .line 101
    goto :goto_1

    .line 102
    :cond_4
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCustomVideoUtil:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 103
    .line 104
    if-eqz v0, :cond_5

    .line 105
    .line 106
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->sendCustomTexture(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V

    .line 107
    .line 108
    .line 109
    :cond_5
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastCaptureCalculateTS:J

    .line 111
    .line 112
    const-wide/16 v2, 0x0

    .line 113
    .line 114
    cmp-long p1, v0, v2

    .line 115
    .line 116
    if-nez p1, :cond_6

    .line 117
    .line 118
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 119
    .line 120
    .line 121
    move-result-wide v0

    .line 122
    iput-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastCaptureCalculateTS:J

    .line 123
    .line 124
    iput-wide v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastCaptureFrameCount:J

    .line 125
    .line 126
    iput-wide v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureFrameCount:J

    .line 127
    .line 128
    return-void

    .line 129
    :cond_6
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureFrameCount:J

    .line 130
    .line 131
    const-wide/16 v2, 0x1

    .line 132
    .line 133
    add-long/2addr v0, v2

    .line 134
    iput-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureFrameCount:J

    .line 135
    .line 136
    return-void

    .line 137
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 138
    throw p1

    .line 139
    :cond_7
    :goto_2
    return-void
.end method

.method public sendJsonCmd(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const-string v0, "jsonParam"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    instance-of v1, v1, Lorg/json/JSONObject;

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 29
    .line 30
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeSendJsonCmd(JLjava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    :goto_0
    const-string p1, "callExperimentalAPI[lack parameter or illegal type]: sendJsonCMD"

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public sendSEIMsg([BI)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentRole:I

    .line 6
    .line 7
    const/16 v2, 0x15

    .line 8
    .line 9
    if-ne v1, v2, :cond_1

    .line 10
    .line 11
    const-string p1, "ignore send sei msg for audience"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return v0

    .line 17
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    iget-wide v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastSendMsgTimeMs:J

    .line 22
    .line 23
    const-wide/16 v5, 0x0

    .line 24
    .line 25
    cmp-long v3, v3, v5

    .line 26
    .line 27
    if-nez v3, :cond_2

    .line 28
    .line 29
    iput-wide v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastSendMsgTimeMs:J

    .line 30
    .line 31
    :cond_2
    iget-wide v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastSendMsgTimeMs:J

    .line 32
    .line 33
    sub-long v3, v1, v3

    .line 34
    .line 35
    const-wide/16 v5, 0x3e8

    .line 36
    .line 37
    cmp-long v3, v3, v5

    .line 38
    .line 39
    const/4 v4, 0x1

    .line 40
    if-gez v3, :cond_4

    .line 41
    .line 42
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSendMsgCount:I

    .line 43
    .line 44
    const/16 v2, 0x1e

    .line 45
    .line 46
    if-ge v1, v2, :cond_3

    .line 47
    .line 48
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSendMsgSize:I

    .line 49
    .line 50
    const/16 v3, 0x2000

    .line 51
    .line 52
    if-ge v2, v3, :cond_3

    .line 53
    .line 54
    add-int/2addr v1, v4

    .line 55
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSendMsgCount:I

    .line 56
    .line 57
    array-length v0, p1

    .line 58
    add-int/2addr v2, v0

    .line 59
    iput v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSendMsgSize:I

    .line 60
    .line 61
    :goto_0
    move v0, v4

    .line 62
    goto :goto_1

    .line 63
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string v2, "send msg too more self:"

    .line 66
    .line 67
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    const-string v2, "TRTCCloudImpl"

    .line 82
    .line 83
    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_4
    iput-wide v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastSendMsgTimeMs:J

    .line 88
    .line 89
    iput v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSendMsgCount:I

    .line 90
    .line 91
    array-length v0, p1

    .line 92
    iput v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSendMsgSize:I

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :goto_1
    if-eqz v0, :cond_5

    .line 96
    .line 97
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$118;

    .line 98
    .line 99
    invoke-direct {v1, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$118;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;[BI)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 103
    .line 104
    .line 105
    :cond_5
    return v0
.end method

.method public setAllAudioEffectsVolume(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$105;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$105;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setAudioCaptureVolume(I)V
    .locals 2

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    :cond_0
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioCaptureVolume:I

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "setAudioCaptureVolume:  volume="

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioCaptureVolume:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->getInstance()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->setVoiceCaptureVolume(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setAudioEffectVolume(II)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$102;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$102;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;II)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setAudioFrameListener(Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setAudioPlayoutVolume(I)V
    .locals 2

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    :cond_0
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioPlayoutVolume:I

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "setAudioPlayoutVolume:  volume="

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioPlayoutVolume:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->getInstance()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->setAudioPlayoutVolume(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setAudioQuality(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$46;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$46;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setAudioRoute(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$52;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$52;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setBGMPlayoutVolume(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$95;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$95;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setBGMPosition(I)I
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$92;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$92;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public setBGMPublishVolume(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$96;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$96;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setBGMVolume(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$94;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$94;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setBeautyStyle(IIII)V
    .locals 6

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move v2, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIII)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setChinLevel(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$79;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$79;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setDebugViewMargin(Ljava/lang/String;Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setDefaultStreamRecvMode(ZZ)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$10;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$10;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ZZ)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setEncodedDataProcessingListener(Lorg/json/JSONObject;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const-string v0, "listener"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :try_start_0
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 13
    .line 14
    .line 15
    move-result-wide v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception p1

    .line 18
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 19
    .line 20
    .line 21
    const-wide/16 v0, 0x0

    .line 22
    .line 23
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v2, "setEncodedDataProcessingListener:"

    .line 26
    .line 27
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-wide v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 45
    .line 46
    invoke-direct {p0, v2, v3, v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeSetEncodedDataProcessingListener(JJ)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    :goto_1
    const-string p1, "setEncodedDataProcessingListener [lack parameter or illegal type]: listener"

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public setEyeScaleLevel(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$75;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$75;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFaceShortLevel(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$78;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$78;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFaceSlimLevel(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$76;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$76;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFaceVLevel(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$77;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$77;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFilter(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$70;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$70;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFilterConcentration(F)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$71;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$71;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFocusPosition(II)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$68;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$68;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;II)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setGSensorMode(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$41;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$41;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setGreenScreenFile(Ljava/lang/String;)Z
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$74;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$74;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0
.end method

.method public setListener(Lcom/tencent/trtc/TRTCCloudListener;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$3;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$3;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudListener;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setListenerHandler(Landroid/os/Handler;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setListenerHandler "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    new-instance p1, Landroid/os/Handler;

    .line 21
    .line 22
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mListenerHandler:Landroid/os/Handler;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mListenerHandler:Landroid/os/Handler;

    .line 33
    .line 34
    :goto_0
    new-instance p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$4;

    .line 35
    .line 36
    invoke-direct {p1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$4;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public setLocalVideoRenderListener(IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eq p1, v1, :cond_0

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    if-eq p1, v2, :cond_0

    .line 7
    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    new-instance p2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string p3, "setLocalVideoRenderListener unsupported pixelFormat : "

    .line 13
    .line 14
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/16 p0, -0x52f

    .line 28
    .line 29
    return p0

    .line 30
    :cond_0
    if-eq p2, v1, :cond_1

    .line 31
    .line 32
    if-eq p2, v0, :cond_1

    .line 33
    .line 34
    const/4 v0, 0x3

    .line 35
    if-eq p2, v0, :cond_1

    .line 36
    .line 37
    new-instance p1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string p3, "setLocalVideoRenderListener unsupported bufferType : "

    .line 40
    .line 41
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/16 p0, -0x530

    .line 55
    .line 56
    return p0

    .line 57
    :cond_1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$84;

    .line 58
    .line 59
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$84;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x0

    .line 66
    return p0
.end method

.method public setLocalViewFillMode(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$36;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$36;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setLocalViewMirror(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$44;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$44;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setLocalViewRotation(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$38;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$38;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setMicVolumeOnMixing(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$93;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$93;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setMixTranscodingConfig(Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$116;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$116;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setMotionMute(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$73;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$73;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setNetworkQosParam(Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$35;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$35;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setNoseSlimLevel(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$80;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$80;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setPerformanceMode(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "setPerformanceMode[lack parameter]"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "mode"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    const-string p1, "setPerformanceMode[lack parameter]: mode"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    const/4 v0, 0x0

    .line 28
    const/4 v1, 0x1

    .line 29
    if-ne p1, v1, :cond_2

    .line 30
    .line 31
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mPerformanceMode:I

    .line 32
    .line 33
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->b()Lcom/tencent/liteav/beauty/TXBeautyManager;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {p0, v0}, Lcom/tencent/liteav/beauty/TXBeautyManager;->enableSharpnessEnhancement(Z)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    iput v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mPerformanceMode:I

    .line 44
    .line 45
    return-void
.end method

.method public setPriorRemoteVideoStreamType(I)I
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$43;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$43;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public setRemoteAudioVolume(Ljava/lang/String;I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$57;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$57;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setRemoteSubStreamViewFillMode(Ljava/lang/String;I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$21;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$21;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setRemoteSubStreamViewRotation(Ljava/lang/String;I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$22;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$22;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setRemoteSurface(Ljava/lang/String;ILandroid/view/Surface;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$50;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p3, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$50;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;Landroid/view/Surface;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setRemoteSurfaceSize(Ljava/lang/String;III)V
    .locals 6

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$51;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move v5, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$51;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;III)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setRemoteVideoRenderListener(Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eq p2, v1, :cond_0

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    if-eq p2, v2, :cond_0

    .line 7
    .line 8
    if-eq p2, v0, :cond_0

    .line 9
    .line 10
    new-instance p1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string p3, "setRemoteVideoRenderListener unsupported pixelFormat : "

    .line 13
    .line 14
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/16 p0, -0x52f

    .line 28
    .line 29
    return p0

    .line 30
    :cond_0
    if-eq p3, v1, :cond_1

    .line 31
    .line 32
    if-eq p3, v0, :cond_1

    .line 33
    .line 34
    const/4 v0, 0x3

    .line 35
    if-eq p3, v0, :cond_1

    .line 36
    .line 37
    new-instance p1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string p2, "setRemoteVideoRenderListener unsupported bufferType : "

    .line 40
    .line 41
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/16 p0, -0x530

    .line 55
    .line 56
    return p0

    .line 57
    :cond_1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;

    .line 58
    .line 59
    move-object v1, p0

    .line 60
    move-object v2, p1

    .line 61
    move v3, p2

    .line 62
    move v4, p3

    .line 63
    move-object v5, p4

    .line 64
    invoke-direct/range {v0 .. v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 68
    .line 69
    .line 70
    const/4 p0, 0x0

    .line 71
    return p0
.end method

.method public setRemoteVideoStreamType(Ljava/lang/String;I)I
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$49;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$49;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public setRemoteViewFillMode(Ljava/lang/String;I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$37;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$37;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setRemoteViewRotation(Ljava/lang/String;I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$39;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$39;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setRenderView(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;Lcom/tencent/rtmp/ui/TXCloudVideoView;Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;)V
    .locals 8

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    iget-object v0, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tencent/liteav/TXCRenderAndDec;->getVideoRender()Lcom/tencent/liteav/renderer/e;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/tencent/liteav/TXCRenderAndDec;->getVideoRender()Lcom/tencent/liteav/renderer/e;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    if-nez p3, :cond_1

    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    invoke-virtual {v5, p0}, Lcom/tencent/liteav/renderer/e;->c(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;

    .line 28
    .line 29
    move-object v2, p0

    .line 30
    move-object v6, p1

    .line 31
    move-object v4, p2

    .line 32
    move-object v3, p3

    .line 33
    move-object v7, p4

    .line 34
    invoke-direct/range {v1 .. v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/rtmp/ui/TXCloudVideoView;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;Lcom/tencent/liteav/renderer/e;Ljava/lang/String;Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    :cond_2
    :goto_0
    return-void
.end method

.method public setReverbType(I)V
    .locals 1

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x7

    .line 4
    if-le p1, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$97;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$97;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v0, "reverbType not support :"

    .line 19
    .line 20
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "TRTCCloudImpl"

    .line 31
    .line 32
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public setSEIPayloadType(Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    const-string v0, "payloadType"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    const/4 v0, 0x5

    .line 17
    if-eq p1, v0, :cond_1

    .line 18
    .line 19
    const/16 v0, 0xf3

    .line 20
    .line 21
    if-eq p1, v0, :cond_1

    .line 22
    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v1, "callExperimentalAPI[invalid param]: payloadType["

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p1, "]"

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 47
    .line 48
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeSetSEIPayloadType(JI)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    const-string v1, ")"

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string v2, "callExperimentalAPI[succeeded]: setSEIPayloadType ("

    .line 59
    .line 60
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string v2, "callExperimentalAPI[failed]: setSEIPayloadType ("

    .line 80
    .line 81
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_3
    :goto_0
    const-string p1, "callExperimentalAPI[lack parameter or illegal type]: payloadType"

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public setSystemVolumeType(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$58;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$58;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setVideoEncoderMirror(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$45;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$45;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setVideoEncoderParam(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$34;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$34;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setVideoEncoderRotation(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$40;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$40;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setVideoMuteImage(Landroid/graphics/Bitmap;I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$30;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$30;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Landroid/graphics/Bitmap;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setVoiceChangerType(I)Z
    .locals 1

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    const/16 v0, 0xb

    .line 4
    .line 5
    if-le p1, v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$98;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$98;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v0, "voiceChangerType not support :"

    .line 21
    .line 22
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "TRTCCloudImpl"

    .line 33
    .line 34
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public setWatermark(Landroid/graphics/Bitmap;IFFF)V
    .locals 7

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v3, p1

    .line 5
    move v2, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    move v6, p5

    .line 9
    invoke-direct/range {v0 .. v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILandroid/graphics/Bitmap;FFF)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setZoom(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$67;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$67;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public showDebugView(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public snapshotVideo(Ljava/lang/String;ILcom/tencent/trtc/TRTCCloudListener$TRTCSnapshotListener;)V
    .locals 2

    .line 1
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "snapshotVideo user:%s streamType:%d"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$24;

    .line 19
    .line 20
    invoke-direct {v0, p0, p1, p3, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$24;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;Lcom/tencent/trtc/TRTCCloudListener$TRTCSnapshotListener;I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public startAudioRecording(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioRecordingParams;)I
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioRecordingParams;->filePath:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioRecordingParams;->filePath:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance p1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v0, "startLocalAudioRecord error:"

    .line 14
    .line 15
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, -0x1

    .line 29
    return p0

    .line 30
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v2, "startLocalAudioRecord:"

    .line 33
    .line 34
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$65;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$65;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setAudioDumpingListener(Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI$a;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const/16 v0, 0x10

    .line 64
    .line 65
    iget-object p1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioRecordingParams;->filePath:Ljava/lang/String;

    .line 66
    .line 67
    const v1, 0xbb80

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v1, v0, p1}, Lcom/tencent/liteav/audio/TXCAudioEngine;->startLocalAudioDumping(IILjava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    return p0
.end method

.method public startCollectStatus()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mStatusNotifyTask:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$StatusTask;

    .line 6
    .line 7
    const-wide/16 v1, 0x3e8

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public startLocalAudio()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public startLocalPreview(ZLcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ZLcom/tencent/rtmp/ui/TXCloudVideoView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public startPublishCDNStream(Lcom/tencent/trtc/TRTCCloudDef$TRTCPublishCDNParam;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "startPublishCDNStream param is null"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$112;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$112;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudDef$TRTCPublishCDNParam;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public startPublishing(Ljava/lang/String;I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$115;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$115;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public startRemoteSubStreamView(Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public startRemoteView(Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public startScreenCapture(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;Lcom/tencent/trtc/TRTCCloudDef$TRTCScreenShareParams;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;Lcom/tencent/trtc/TRTCCloudDef$TRTCScreenShareParams;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public startSpeedTest(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$110;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$110;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v0, "startSpeedTest failed with invalid params. userId = "

    .line 26
    .line 27
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p2, ", userSig = "

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p2, " self:"

    .line 42
    .line 43
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p1, "TRTCCloudImpl"

    .line 58
    .line 59
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public startVolumeLevelCal(Z)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioVolumeEvalInterval:I

    .line 5
    .line 6
    invoke-static {p1, v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->enableAudioVolumeEvaluation(ZI)Z

    .line 7
    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVolumeLevelNotifyTask:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask;

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    new-instance p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVolumeLevelNotifyTask:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 23
    .line 24
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioVolumeEvalInterval:I

    .line 25
    .line 26
    int-to-long v1, p0

    .line 27
    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    const/4 p1, 0x0

    .line 32
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mVolumeLevelNotifyTask:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask;

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioVolumeEvalInterval:I

    .line 36
    .line 37
    return-void
.end method

.method public stopAllAudioEffects()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$104;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$104;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stopAllRemoteView()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$23;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$23;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stopAudioEffect(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$103;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$103;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stopAudioRecording()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->stopLocalAudioDumping()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public stopBGM()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$89;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$89;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stopCollectStatus()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mStatusNotifyTask:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$StatusTask;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public stopLocalAudio()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$48;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$48;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stopLocalPreview()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stopPublishCDNStream()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$114;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$114;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stopPublishing()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$113;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$113;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stopRemoteRender(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->userID:Ljava/lang/String;

    .line 5
    .line 6
    iget-wide v1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 7
    .line 8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget v2, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 13
    .line 14
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "stopRemoteRender userID:%s tinyID:%d streamType:%d"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/tencent/liteav/audio/a;->a()Lcom/tencent/liteav/audio/a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-wide v1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 36
    .line 37
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/audio/a;->a(Ljava/lang/String;I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 49
    .line 50
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 51
    .line 52
    iget-object v2, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 57
    .line 58
    const/4 v3, 0x0

    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    sget-object v4, Lcom/tencent/liteav/basic/a/b;->a:Lcom/tencent/liteav/basic/a/b;

    .line 62
    .line 63
    invoke-virtual {v0, v3, v4}, Lcom/tencent/liteav/TXCRenderAndDec;->setVideoFrameListener(Lcom/tencent/liteav/o;Lcom/tencent/liteav/basic/a/b;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/tencent/liteav/TXCRenderAndDec;->stop()V

    .line 71
    .line 72
    .line 73
    if-nez v1, :cond_1

    .line 74
    .line 75
    iget-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/tencent/liteav/TXCRenderAndDec;->getVideoRender()Lcom/tencent/liteav/renderer/e;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    iget-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/tencent/liteav/TXCRenderAndDec;->getVideoRender()Lcom/tencent/liteav/renderer/e;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/e;->e()V

    .line 94
    .line 95
    .line 96
    :cond_1
    iget-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 99
    .line 100
    if-eqz v0, :cond_2

    .line 101
    .line 102
    sget-object v4, Lcom/tencent/liteav/basic/a/b;->a:Lcom/tencent/liteav/basic/a/b;

    .line 103
    .line 104
    invoke-virtual {v0, v3, v4}, Lcom/tencent/liteav/TXCRenderAndDec;->setVideoFrameListener(Lcom/tencent/liteav/o;Lcom/tencent/liteav/basic/a/b;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/tencent/liteav/TXCRenderAndDec;->stop()V

    .line 112
    .line 113
    .line 114
    if-nez v2, :cond_2

    .line 115
    .line 116
    iget-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 117
    .line 118
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 119
    .line 120
    invoke-virtual {v0}, Lcom/tencent/liteav/TXCRenderAndDec;->getVideoRender()Lcom/tencent/liteav/renderer/e;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    if-eqz v0, :cond_2

    .line 125
    .line 126
    iget-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 127
    .line 128
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 129
    .line 130
    invoke-virtual {v0}, Lcom/tencent/liteav/TXCRenderAndDec;->getVideoRender()Lcom/tencent/liteav/renderer/e;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/e;->e()V

    .line 135
    .line 136
    .line 137
    :cond_2
    iget-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->stop()V

    .line 140
    .line 141
    .line 142
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 143
    .line 144
    invoke-virtual {p1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->stop()V

    .line 145
    .line 146
    .line 147
    new-instance p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$167;

    .line 148
    .line 149
    invoke-direct {p1, p0, v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$167;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/rtmp/ui/TXCloudVideoView;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public stopRemoteSubStreamView(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$20;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$20;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stopRemoteView(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$18;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$18;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stopScreenCapture()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stopSpeedTest()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$111;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$111;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1

    .line 1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "startLocalPreview surfaceChanged "

    .line 4
    .line 5
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p1, " width "

    .line 16
    .line 17
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p1, ", height "

    .line 24
    .line 25
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 39
    .line 40
    invoke-virtual {p0, p3, p4}, Lcom/tencent/liteav/d;->a(II)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "startLocalPreview surfaceCreated "

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 33
    .line 34
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/d;->a(Landroid/view/Surface;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "startLocalPreview surfaceDestroyed "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/d;->a(Landroid/view/Surface;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public switchCamera()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$66;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$66;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public switchRole(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$11;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$11;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public switchRoom(Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public updateAppScene(I)V
    .locals 3

    .line 1
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAppScene:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    if-eq p1, v0, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAppScene:I

    .line 10
    .line 11
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 12
    .line 13
    iget v2, v1, Lcom/tencent/liteav/g;->a:I

    .line 14
    .line 15
    iget v1, v1, Lcom/tencent/liteav/g;->b:I

    .line 16
    .line 17
    mul-int/2addr v2, v1

    .line 18
    const v1, 0x7e900

    .line 19
    .line 20
    .line 21
    if-lt v2, v1, :cond_1

    .line 22
    .line 23
    iput v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAppScene:I

    .line 24
    .line 25
    :cond_1
    invoke-direct {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->updateEncType()V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAppScene:I

    .line 29
    .line 30
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 35
    .line 36
    iget v1, v1, Lcom/tencent/liteav/g;->j:I

    .line 37
    .line 38
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    filled-new-array {v0, v1, p1}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string v0, "update appScene[%d] for video enc[%d] source scene[%d]"

    .line 51
    .line 52
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public updatePrivateMapKey(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "callExperimentalAPI[update private map key fail, params is null"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "privateMapKey"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 22
    .line 23
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeUpdatePrivateMapKey(JLjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const-string p1, "callExperimentalAPI[update private map key fail, key is empty"

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
