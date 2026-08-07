.class public Lcom/immomo/ijkConferenceStreamer;
.super Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;
.source "SourceFile"


# static fields
.field public static final AUDIO_EFFECT_TYPE_ELC_TUNE:I = 0x9

.field public static final AUDIO_EFFECT_TYPE_FEMALE:I = 0x6

.field public static final AUDIO_EFFECT_TYPE_MALE:I = 0x5

.field public static final AUDIO_EFFECT_TYPE_MC:I = 0x8

.field public static final AUDIO_EFFECT_TYPE_ORIGINAL:I = 0x0

.field public static final AUDIO_EFFECT_TYPE_WAWA:I = 0x7

.field public static final DEFAULT_RECORD_INTERVAL:I = 0x3e8

.field public static final DEFAULT_REPORT_COUNT:I = 0x1e


# instance fields
.field private final FEMALE_PITCH:I

.field private final MALE_PITCH:I

.field private final WAWA_PITCH:I

.field private cameraInputPipline:Ll/cql;

.field private emptyInputPipline:Ll/usl;

.field private enableAudioStrero:Z

.field private enableVbr:Z

.field private faceBeautiful:I

.field private ijkInputPipline:Ll/lvl;

.field private isActiveSwitch:Ljava/lang/Boolean;

.field private linkMicPusherPipeline:Ll/hwl;

.field private mActiveAudioTrack:I

.field private mAdjustBrightnessInterval:I

.field private mAllRemoteAudioStream:Z

.field private mAnchorStatusHanderhandler:Ll/upw;

.field private mAppID:Ljava/lang/String;

.field private mAudioChannalNum:I

.field private mAudioHighQualityFlg:Z

.field private mAudioInterval:I

.field private mAudioProfile:I

.field private mAudioProfileStatus:Z

.field private mAudioRoteoverrideDefault:I

.field private mAudioSampleRate:I

.field private mAudioScenario:I

.field private mAudio_channe:I

.field private mAudio_channe_frq:I

.field private mAudio_channe_layout:I

.field private mAudiosmooth:I

.field private mAvFlag:I

.field private mBackgroundImgUrl:Ljava/lang/String;

.field private mBasicFilter:Ll/jt2;

.field private mBusinessType:I

.field private mCameraID:I

.field private mChannelkey:Ljava/lang/String;

.field private mClientRole:I

.field private mCommMode:Z

.field mConfParameters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mContextRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private mCusZoomFlag:Z

.field private mDefaultAudioRoutetoSpeakerphone:Z

.field private mEnableAudio:Z

.field private mEnableExternStream:Z

.field private mEnableMulPusherInRoom:Z

.field private mEnableSwitchAudioTrack:Z

.field private mEnableVideo:Z

.field private mEnableWebSdkInteroperability:I

.field private mEncodeHeight:I

.field private mEncodeWidth:I

.field private mEncryptionMode:Ljava/lang/String;

.field private mEncryptionSecret:Ljava/lang/String;

.field private mErrorCode:I

.field private mExternEncodeHeight:I

.field private mExternEncodeWidth:I

.field private mExternVideoBitRate:I

.field private mFaceEyeScale:Ljava/lang/Float;

.field private mFaceThinScale:Ljava/lang/Float;

.field private mHavaSelectCamera:Z

.field private mHavaSelectFile:Z

.field private mIgnoreMonitor:Z

.field private mLinkMicLogEnable:Z

.field private mLinkMicLogPath:Ljava/lang/String;

.field private mLocalAudioStreamMute:Z

.field private mLocalVideoStreamMute:Z

.field private mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

.field private mLogReportCount:I

.field protected mLogReportInterval:I

.field private mLogUploadCallBack:Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

.field private mLoger:Ll/drl;

.field private mMasterAudioLevel:F

.field private mMediaCfgParams:Ll/brx;

.field mMediaProjection:Landroid/media/projection/MediaProjection;

.field mMediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

.field private mMemory:Ljava/lang/String;

.field private mNetType:Ljava/lang/String;

.field private mNetUtil:Ltv/danmaku/ijk/media/streamer/NetUtil;

.field private mNsStatus:Z

.field private mNsmode:I

.field private mOnErrorListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

.field private mOnInfoListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

.field private mOnRecordScreenErrorListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordScreenErrorListener;

.field private mOnRecordSuccessListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordSuccessListener;

.field private mOnRtcStatusListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRtcStatusListener;

.field private mOnlyAudio:Z

.field private mOutErrorCode:I

.field private mOutFileType:I

.field private mOutpath:Ljava/lang/String;

.field private mOutputFilePath:Ljava/lang/String;

.field private mPauseRending:Z

.field private mPcmDateCallback:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

.field private mPlayerStateCallback:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

.field private mPreviewSizeSetListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;

.field private mRecordDateCallback:Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;

.field private mRecordPcmDataCallback:Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;

.field private mRecordScreenError:Z

.field private volatile mRecording:Z

.field private mRoom24hMode:Z

.field private mRoomMode:I

.field private mRoomtype:I

.field private mRtcAudioHandler:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

.field private mRtcAudioHandlerEx:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

.field private mRtcAudioStatsUpdataHandle:Ll/vpw;

.field private mRtcChannelHandler:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

.field private mRtcConnectHandler:Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

.field private mRtcEventHandler:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

.field private mRtcEventHandlerAdapter:Ll/kod0;

.field private mRtcExitRoomHandler:Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;

.field private mRtcLRemoteStatsUpdataHandle:Ll/wpw;

.field private mRtcLVideoLossUpdataHandle:Ll/zpw;

.field private mRtcQualityHandler:Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

.field private mRtcStatsUpdataHandle:Ll/ypw;

.field private mRtcSurroundMusicHander:Lcom/immomo/mediacore/coninf/MRtcSurroundMusicHander;

.field mScreenCodecParameters:Ll/ror;

.field mScreenInputPipline:Ll/n5m;

.field private mScreenOnWhilePlaying:Z

.field mScreenPipelineModuleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

.field mScreenPusherPipeline:Ll/zzl;

.field private mSelectAudioTrack:I

.field private mSelectFileStop:Z

.field private mSlaveAudioLevel:F

.field private mSurface:Ljava/lang/Object;

.field private mSurroundMusicStatusListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

.field private mSynRelease:Ljava/lang/Object;

.field private mTargetVideoHeight:I

.field private mTargetVideoWidth:I

.field private mTextureViewListener:Ll/gbl0;

.field private mUseServerAudioMixer:Z

.field private mUsingVoip:Z

.field private mVenderID:I

.field private mVideoBitRate:I

.field private mVideoChannelListener:Ll/ebl0;

.field private mVideoChannelListenerEx:Ll/hwl$a;

.field private mVideoCodecRate:I

.field private mVideoHeight:I

.field private mVideoQualityFlg:Z

.field private mVideoTextureListener:Ll/gkl0;

.field private mVideoWidth:I

.field private mVisualHeight:I

.field private mVisualWeigh:I

.field private mVoicebackwardsEnable:Z

.field private mZoom:F

.field private moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

.field private momoPusherPipeline:Ll/zzl;

.field private mrCodecParameters:Ll/ror;

.field private mrConfig:Ll/row;

.field private surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

.field private warpType:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1

    const/4 v0, 0x1

    .line 318
    invoke-direct {p0, p1, v0}, Lcom/immomo/ijkConferenceStreamer;-><init>(Landroid/app/Activity;I)V

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;I)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 316
    const-string v3, ""

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/immomo/ijkConferenceStreamer;-><init>(Landroid/app/Activity;ILjava/lang/String;ZLl/brx;)V

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;ILjava/lang/String;Z)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    .line 317
    invoke-direct/range {v0 .. v5}, Lcom/immomo/ijkConferenceStreamer;-><init>(Landroid/app/Activity;ILjava/lang/String;ZLl/brx;)V

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;ILjava/lang/String;ZLl/brx;)V
    .locals 8

    .line 1
    invoke-direct {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;-><init>(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/ijkConferenceStreamer;->mCameraID:I

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mHavaSelectCamera:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mHavaSelectFile:Z

    .line 10
    .line 11
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->mConfParameters:Ljava/util/List;

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAllRemoteAudioStream:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mVoicebackwardsEnable:Z

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    iput-boolean v1, p0, Lcom/immomo/ijkConferenceStreamer;->mIgnoreMonitor:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mOnlyAudio:Z

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mCommMode:Z

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mCusZoomFlag:Z

    .line 30
    .line 31
    const/high16 v2, 0x3f800000    # 1.0f

    .line 32
    .line 33
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mSlaveAudioLevel:F

    .line 34
    .line 35
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mMasterAudioLevel:F

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mChannelkey:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mEncryptionSecret:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mEncryptionMode:Ljava/lang/String;

    .line 43
    .line 44
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mLocalAudioStreamMute:Z

    .line 45
    .line 46
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mLocalVideoStreamMute:Z

    .line 47
    .line 48
    iput-boolean v1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableVideo:Z

    .line 49
    .line 50
    iput-boolean v1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableAudio:Z

    .line 51
    .line 52
    const/4 v4, -0x1

    .line 53
    iput v4, p0, Lcom/immomo/ijkConferenceStreamer;->mAdjustBrightnessInterval:I

    .line 54
    .line 55
    iput v4, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableWebSdkInteroperability:I

    .line 56
    .line 57
    iput-boolean v1, p0, Lcom/immomo/ijkConferenceStreamer;->mDefaultAudioRoutetoSpeakerphone:Z

    .line 58
    .line 59
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mRoom24hMode:Z

    .line 60
    .line 61
    iput v4, p0, Lcom/immomo/ijkConferenceStreamer;->mRoomMode:I

    .line 62
    .line 63
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mUseServerAudioMixer:Z

    .line 64
    .line 65
    iput v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 66
    .line 67
    iput v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 68
    .line 69
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mNsStatus:Z

    .line 70
    .line 71
    iput v4, p0, Lcom/immomo/ijkConferenceStreamer;->mNsmode:I

    .line 72
    .line 73
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mPcmDateCallback:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 74
    .line 75
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mRecordDateCallback:Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;

    .line 76
    .line 77
    iput v4, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioInterval:I

    .line 78
    .line 79
    iput v4, p0, Lcom/immomo/ijkConferenceStreamer;->mAudiosmooth:I

    .line 80
    .line 81
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcEventHandler:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 82
    .line 83
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcAudioHandler:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 84
    .line 85
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcAudioHandlerEx:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 86
    .line 87
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcChannelHandler:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 88
    .line 89
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcQualityHandler:Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 90
    .line 91
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcConnectHandler:Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

    .line 92
    .line 93
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcSurroundMusicHander:Lcom/immomo/mediacore/coninf/MRtcSurroundMusicHander;

    .line 94
    .line 95
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcExitRoomHandler:Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;

    .line 96
    .line 97
    const/16 v5, 0x3e8

    .line 98
    .line 99
    iput v5, p0, Lcom/immomo/ijkConferenceStreamer;->mLogReportInterval:I

    .line 100
    .line 101
    const/16 v5, 0x1e

    .line 102
    .line 103
    iput v5, p0, Lcom/immomo/ijkConferenceStreamer;->mLogReportCount:I

    .line 104
    .line 105
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mOutpath:Ljava/lang/String;

    .line 106
    .line 107
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableMulPusherInRoom:Z

    .line 108
    .line 109
    new-instance v5, Ll/ror;

    .line 110
    .line 111
    invoke-direct {v5}, Ll/ror;-><init>()V

    .line 112
    .line 113
    .line 114
    iput-object v5, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 115
    .line 116
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mPauseRending:Z

    .line 117
    .line 118
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mPlayerStateCallback:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 119
    .line 120
    iput v0, p0, Lcom/immomo/ijkConferenceStreamer;->mVenderID:I

    .line 121
    .line 122
    const-string v5, ""

    .line 123
    .line 124
    iput-object v5, p0, Lcom/immomo/ijkConferenceStreamer;->mAppID:Ljava/lang/String;

    .line 125
    .line 126
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mRecording:Z

    .line 127
    .line 128
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoChannelListener:Ll/ebl0;

    .line 129
    .line 130
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoTextureListener:Ll/gkl0;

    .line 131
    .line 132
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mTextureViewListener:Ll/gbl0;

    .line 133
    .line 134
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mZoom:F

    .line 135
    .line 136
    const/16 v2, 0x160

    .line 137
    .line 138
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mVisualWeigh:I

    .line 139
    .line 140
    const/16 v6, 0x280

    .line 141
    .line 142
    iput v6, p0, Lcom/immomo/ijkConferenceStreamer;->mVisualHeight:I

    .line 143
    .line 144
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mEncodeWidth:I

    .line 145
    .line 146
    iput v6, p0, Lcom/immomo/ijkConferenceStreamer;->mEncodeHeight:I

    .line 147
    .line 148
    const/16 v2, 0xa0

    .line 149
    .line 150
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mExternEncodeWidth:I

    .line 151
    .line 152
    const/16 v2, 0xbe

    .line 153
    .line 154
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mExternEncodeHeight:I

    .line 155
    .line 156
    iput v6, p0, Lcom/immomo/ijkConferenceStreamer;->mTargetVideoWidth:I

    .line 157
    .line 158
    const/16 v2, 0x1e0

    .line 159
    .line 160
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mTargetVideoHeight:I

    .line 161
    .line 162
    const/4 v7, 0x2

    .line 163
    iput v7, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioChannalNum:I

    .line 164
    .line 165
    const v7, 0xac44

    .line 166
    .line 167
    .line 168
    iput v7, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioSampleRate:I

    .line 169
    .line 170
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoWidth:I

    .line 171
    .line 172
    iput v6, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoHeight:I

    .line 173
    .line 174
    iput v1, p0, Lcom/immomo/ijkConferenceStreamer;->mClientRole:I

    .line 175
    .line 176
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableExternStream:Z

    .line 177
    .line 178
    const/16 v2, 0xf

    .line 179
    .line 180
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoCodecRate:I

    .line 181
    .line 182
    const v2, 0x7a120

    .line 183
    .line 184
    .line 185
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoBitRate:I

    .line 186
    .line 187
    const v2, 0x13880

    .line 188
    .line 189
    .line 190
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mExternVideoBitRate:I

    .line 191
    .line 192
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mNetUtil:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 193
    .line 194
    iput v0, p0, Lcom/immomo/ijkConferenceStreamer;->mErrorCode:I

    .line 195
    .line 196
    iput v0, p0, Lcom/immomo/ijkConferenceStreamer;->mOutErrorCode:I

    .line 197
    .line 198
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoQualityFlg:Z

    .line 199
    .line 200
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioHighQualityFlg:Z

    .line 201
    .line 202
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfileStatus:Z

    .line 203
    .line 204
    iput v0, p0, Lcom/immomo/ijkConferenceStreamer;->mRoomtype:I

    .line 205
    .line 206
    iput v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAvFlag:I

    .line 207
    .line 208
    iput v0, p0, Lcom/immomo/ijkConferenceStreamer;->mBusinessType:I

    .line 209
    .line 210
    iput-object v5, p0, Lcom/immomo/ijkConferenceStreamer;->mNetType:Ljava/lang/String;

    .line 211
    .line 212
    iput-object v5, p0, Lcom/immomo/ijkConferenceStreamer;->mMemory:Ljava/lang/String;

    .line 213
    .line 214
    iput-object v5, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogPath:Ljava/lang/String;

    .line 215
    .line 216
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogEnable:Z

    .line 217
    .line 218
    iput v1, p0, Lcom/immomo/ijkConferenceStreamer;->mSelectAudioTrack:I

    .line 219
    .line 220
    const/16 v2, 0xa

    .line 221
    .line 222
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mOutFileType:I

    .line 223
    .line 224
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mOutputFilePath:Ljava/lang/String;

    .line 225
    .line 226
    iput-boolean v1, p0, Lcom/immomo/ijkConferenceStreamer;->mSelectFileStop:Z

    .line 227
    .line 228
    iput v7, p0, Lcom/immomo/ijkConferenceStreamer;->mAudio_channe_frq:I

    .line 229
    .line 230
    iput v1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudio_channe:I

    .line 231
    .line 232
    iput v1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudio_channe_layout:I

    .line 233
    .line 234
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mBackgroundImgUrl:Ljava/lang/String;

    .line 235
    .line 236
    iput v4, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioRoteoverrideDefault:I

    .line 237
    .line 238
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mUsingVoip:Z

    .line 239
    .line 240
    const/4 v2, -0x4

    .line 241
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->MALE_PITCH:I

    .line 242
    .line 243
    const/4 v2, 0x6

    .line 244
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->FEMALE_PITCH:I

    .line 245
    .line 246
    const/16 v2, 0x9

    .line 247
    .line 248
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->WAWA_PITCH:I

    .line 249
    .line 250
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->enableAudioStrero:Z

    .line 251
    .line 252
    iput-boolean v1, p0, Lcom/immomo/ijkConferenceStreamer;->enableVbr:Z

    .line 253
    .line 254
    new-instance v2, Ljava/lang/Object;

    .line 255
    .line 256
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 257
    .line 258
    .line 259
    iput-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->mSynRelease:Ljava/lang/Object;

    .line 260
    .line 261
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mRecordScreenError:Z

    .line 262
    .line 263
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcEventHandlerAdapter:Ll/kod0;

    .line 264
    .line 265
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mMediaCfgParams:Ll/brx;

    .line 266
    .line 267
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableSwitchAudioTrack:Z

    .line 268
    .line 269
    iput v1, p0, Lcom/immomo/ijkConferenceStreamer;->mActiveAudioTrack:I

    .line 270
    .line 271
    new-instance v2, Lcom/immomo/ijkConferenceStreamer$d;

    .line 272
    .line 273
    invoke-direct {v2, p0}, Lcom/immomo/ijkConferenceStreamer$d;-><init>(Lcom/immomo/ijkConferenceStreamer;)V

    .line 274
    .line 275
    .line 276
    iput-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->mLoger:Ll/drl;

    .line 277
    .line 278
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 279
    .line 280
    new-instance v2, Ljava/lang/ref/WeakReference;

    .line 281
    .line 282
    invoke-direct {v2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 283
    .line 284
    .line 285
    iput-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 286
    .line 287
    iput p2, p0, Lcom/immomo/ijkConferenceStreamer;->mVenderID:I

    .line 288
    .line 289
    xor-int/lit8 p2, p4, 0x1

    .line 290
    .line 291
    iput-boolean p2, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableVideo:Z

    .line 292
    .line 293
    iput-boolean v1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableAudio:Z

    .line 294
    .line 295
    iput-boolean p4, p0, Lcom/immomo/ijkConferenceStreamer;->mOnlyAudio:Z

    .line 296
    .line 297
    iput v0, p0, Lcom/immomo/ijkConferenceStreamer;->mOutErrorCode:I

    .line 298
    .line 299
    iput-object p3, p0, Lcom/immomo/ijkConferenceStreamer;->mAppID:Ljava/lang/String;

    .line 300
    .line 301
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    invoke-static {p1}, Ll/l26;->a(Landroid/content/Context;)V

    .line 306
    .line 307
    .line 308
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->initFilterCoreParameters()V

    .line 309
    .line 310
    .line 311
    invoke-direct {p0, p5}, Lcom/immomo/ijkConferenceStreamer;->initPipeline(Ll/brx;)V

    .line 312
    .line 313
    .line 314
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ll/brx;)V
    .locals 6

    .line 315
    const-string v3, ""

    const/4 v4, 0x0

    const/4 v2, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/immomo/ijkConferenceStreamer;-><init>(Landroid/app/Activity;ILjava/lang/String;ZLl/brx;)V

    return-void
.end method

.method public static synthetic access$000(Lcom/immomo/ijkConferenceStreamer;)Ltv/danmaku/ijk/media/streamer/NetUtil;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mNetUtil:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/immomo/ijkConferenceStreamer;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mNetType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1000(Lcom/immomo/ijkConferenceStreamer;)Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mRecordDateCallback:Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$102(Lcom/immomo/ijkConferenceStreamer;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mNetType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1100(Lcom/immomo/ijkConferenceStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mSurroundMusicStatusListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1200(Lcom/immomo/ijkConferenceStreamer;)Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mPcmDateCallback:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1300(Lcom/immomo/ijkConferenceStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordScreenErrorListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mOnRecordScreenErrorListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordScreenErrorListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1402(Lcom/immomo/ijkConferenceStreamer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRecordScreenError:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Lcom/immomo/ijkConferenceStreamer;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mMemory:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$202(Lcom/immomo/ijkConferenceStreamer;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mMemory:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$300(Lcom/immomo/ijkConferenceStreamer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/ijkConferenceStreamer;->mOutErrorCode:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400(Lcom/immomo/ijkConferenceStreamer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/ijkConferenceStreamer;->mErrorCode:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$402(Lcom/immomo/ijkConferenceStreamer;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mErrorCode:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$500(Lcom/immomo/ijkConferenceStreamer;)Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mLogUploadCallBack:Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/immomo/ijkConferenceStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mOnInfoListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Lcom/immomo/ijkConferenceStreamer;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mSynRelease:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$800(Lcom/immomo/ijkConferenceStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mOnErrorListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$900(Lcom/immomo/ijkConferenceStreamer;)Lcom/momo/pub/MomoPipelineModuleRegister;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    return-object p0
.end method

.method private audioEffectReset()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {v0}, Ll/l6m;->P()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p0, v0}, Ll/l6m;->S1(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static getScreenHeight(Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 10
    .line 11
    return p0
.end method

.method public static getScreenWidth(Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 10
    .line 11
    return p0
.end method

.method private initFilterCoreParameters()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mNetUtil:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/app/Activity;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v1}, Ltv/danmaku/ijk/media/streamer/NetUtil;-><init>(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mNetUtil:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 33
    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    new-instance v0, Ll/ror;

    .line 37
    .line 38
    invoke-direct {v0}, Ll/ror;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    iput-boolean v1, v0, Ll/uow;->G0:Z

    .line 47
    .line 48
    const/16 v2, 0x14

    .line 49
    .line 50
    iput v2, v0, Ll/tow;->F:I

    .line 51
    .line 52
    iput v2, v0, Ll/uow;->D0:I

    .line 53
    .line 54
    iget v2, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoCodecRate:I

    .line 55
    .line 56
    iput v2, v0, Ll/uow;->E0:I

    .line 57
    .line 58
    iget v2, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoBitRate:I

    .line 59
    .line 60
    iput v2, v0, Ll/tow;->H:I

    .line 61
    .line 62
    iget v2, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoWidth:I

    .line 63
    .line 64
    iput v2, v0, Ll/tow;->s:I

    .line 65
    .line 66
    iget v2, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoHeight:I

    .line 67
    .line 68
    iput v2, v0, Ll/tow;->t:I

    .line 69
    .line 70
    iget v2, p0, Lcom/immomo/ijkConferenceStreamer;->mEncodeWidth:I

    .line 71
    .line 72
    iput v2, v0, Ll/tow;->m:I

    .line 73
    .line 74
    iget v2, p0, Lcom/immomo/ijkConferenceStreamer;->mEncodeHeight:I

    .line 75
    .line 76
    iput v2, v0, Ll/tow;->n:I

    .line 77
    .line 78
    iget v2, p0, Lcom/immomo/ijkConferenceStreamer;->mExternEncodeWidth:I

    .line 79
    .line 80
    iput v2, v0, Ll/tow;->o:I

    .line 81
    .line 82
    iget v2, p0, Lcom/immomo/ijkConferenceStreamer;->mExternEncodeHeight:I

    .line 83
    .line 84
    iput v2, v0, Ll/tow;->p:I

    .line 85
    .line 86
    iget v2, p0, Lcom/immomo/ijkConferenceStreamer;->mExternVideoBitRate:I

    .line 87
    .line 88
    iput v2, v0, Ll/tow;->I:I

    .line 89
    .line 90
    iget v2, p0, Lcom/immomo/ijkConferenceStreamer;->mVisualWeigh:I

    .line 91
    .line 92
    iput v2, v0, Ll/tow;->u:I

    .line 93
    .line 94
    iget v2, p0, Lcom/immomo/ijkConferenceStreamer;->mVisualHeight:I

    .line 95
    .line 96
    iput v2, v0, Ll/tow;->v:I

    .line 97
    .line 98
    iget-boolean v2, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableExternStream:Z

    .line 99
    .line 100
    iput-boolean v2, v0, Ll/tow;->q:Z

    .line 101
    .line 102
    iget v2, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioChannalNum:I

    .line 103
    .line 104
    iput v2, v0, Ll/tow;->R:I

    .line 105
    .line 106
    iget v2, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioSampleRate:I

    .line 107
    .line 108
    iput v2, v0, Ll/tow;->P:I

    .line 109
    .line 110
    iget-boolean v2, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogEnable:Z

    .line 111
    .line 112
    iput-boolean v2, v0, Ll/uow;->Q0:Z

    .line 113
    .line 114
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogPath:Ljava/lang/String;

    .line 115
    .line 116
    iput-object v2, v0, Ll/uow;->R0:Ljava/lang/String;

    .line 117
    .line 118
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 119
    .line 120
    if-eqz v2, :cond_2

    .line 121
    .line 122
    invoke-interface {v2, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->y(Ll/ror;)V

    .line 123
    .line 124
    .line 125
    :cond_2
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrConfig:Ll/row;

    .line 126
    .line 127
    if-nez v0, :cond_3

    .line 128
    .line 129
    invoke-static {}, Ll/row;->k()Ll/row;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrConfig:Ll/row;

    .line 134
    .line 135
    :cond_3
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrConfig:Ll/row;

    .line 136
    .line 137
    new-instance v2, Ll/erf0;

    .line 138
    .line 139
    iget v3, p0, Lcom/immomo/ijkConferenceStreamer;->mVisualWeigh:I

    .line 140
    .line 141
    iget v4, p0, Lcom/immomo/ijkConferenceStreamer;->mVisualHeight:I

    .line 142
    .line 143
    invoke-direct {v2, v3, v4}, Ll/erf0;-><init>(II)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, v2}, Ll/row;->O(Ll/erf0;)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrConfig:Ll/row;

    .line 150
    .line 151
    new-instance v2, Ll/erf0;

    .line 152
    .line 153
    iget v3, p0, Lcom/immomo/ijkConferenceStreamer;->mEncodeWidth:I

    .line 154
    .line 155
    iget v4, p0, Lcom/immomo/ijkConferenceStreamer;->mEncodeHeight:I

    .line 156
    .line 157
    invoke-direct {v2, v3, v4}, Ll/erf0;-><init>(II)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0, v2}, Ll/row;->r(Ll/erf0;)V

    .line 161
    .line 162
    .line 163
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mCameraID:I

    .line 164
    .line 165
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->mrConfig:Ll/row;

    .line 166
    .line 167
    if-nez v0, :cond_4

    .line 168
    .line 169
    const/4 v0, 0x0

    .line 170
    invoke-virtual {v2, v0}, Ll/row;->q(I)V

    .line 171
    .line 172
    .line 173
    goto :goto_0

    .line 174
    :cond_4
    invoke-virtual {v2, v1}, Ll/row;->q(I)V

    .line 175
    .line 176
    .line 177
    :goto_0
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrConfig:Ll/row;

    .line 178
    .line 179
    new-instance v1, Ll/erf0;

    .line 180
    .line 181
    iget v2, p0, Lcom/immomo/ijkConferenceStreamer;->mTargetVideoWidth:I

    .line 182
    .line 183
    iget p0, p0, Lcom/immomo/ijkConferenceStreamer;->mTargetVideoHeight:I

    .line 184
    .line 185
    invoke-direct {v1, v2, p0}, Ll/erf0;-><init>(II)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0, v1}, Ll/row;->H(Ll/erf0;)V

    .line 189
    .line 190
    .line 191
    return-void
.end method

.method private initPipeline(Ll/brx;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mMediaCfgParams:Ll/brx;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/app/Activity;

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/d410;->m(Landroid/app/Activity;Ll/brx;)Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 18
    .line 19
    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->y(Ll/ror;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 23
    .line 24
    invoke-interface {p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->n()V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 28
    .line 29
    invoke-interface {p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->K()V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mLoger:Ll/drl;

    .line 35
    .line 36
    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->G(Ll/drl;)Ll/fa5;

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 40
    .line 41
    new-instance v0, Lcom/immomo/ijkConferenceStreamer$e;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Lcom/immomo/ijkConferenceStreamer$e;-><init>(Lcom/immomo/ijkConferenceStreamer;)V

    .line 44
    .line 45
    .line 46
    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->D(Ll/j410$b;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 50
    .line 51
    new-instance v0, Lcom/immomo/ijkConferenceStreamer$f;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Lcom/immomo/ijkConferenceStreamer$f;-><init>(Lcom/immomo/ijkConferenceStreamer;)V

    .line 54
    .line 55
    .line 56
    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->A(Lcom/momo/pub/MomoPipelineModuleRegister$b;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 60
    .line 61
    new-instance v0, Lcom/immomo/ijkConferenceStreamer$g;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Lcom/immomo/ijkConferenceStreamer$g;-><init>(Lcom/immomo/ijkConferenceStreamer;)V

    .line 64
    .line 65
    .line 66
    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->e(Lcom/momo/pub/MomoPipelineModuleRegister$a;)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 70
    .line 71
    invoke-interface {p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->l()Lcom/momo/piplinemomoext/input/audio/a;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 76
    .line 77
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 78
    .line 79
    new-instance v0, Lcom/immomo/ijkConferenceStreamer$h;

    .line 80
    .line 81
    invoke-direct {v0, p0}, Lcom/immomo/ijkConferenceStreamer$h;-><init>(Lcom/immomo/ijkConferenceStreamer;)V

    .line 82
    .line 83
    .line 84
    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->f(Lcom/momo/pub/MomoPipelineModuleRegister$c;)V

    .line 85
    .line 86
    .line 87
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const/4 p1, 0x1

    .line 92
    invoke-virtual {p0, p1}, Ll/csx;->C1(I)V

    .line 93
    .line 94
    .line 95
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const/4 p1, 0x0

    .line 100
    invoke-virtual {p0, p1}, Ll/csx;->s1(Z)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method private sabineMcEQ()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/high16 v1, 0x41fa0000    # 31.25f

    .line 7
    .line 8
    const/16 v2, 0x10

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-interface {v0, v3, v1, v2}, Ll/l6m;->d0(IFI)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    const/high16 v2, 0x427a0000    # 62.5f

    .line 18
    .line 19
    const/high16 v3, 0x41000000    # 8.0f

    .line 20
    .line 21
    invoke-interface {v0, v1, v2, v3}, Ll/l6m;->Q(IFF)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    const/high16 v2, 0x42fa0000    # 125.0f

    .line 28
    .line 29
    const/high16 v4, 0x40000000    # 2.0f

    .line 30
    .line 31
    invoke-interface {v0, v1, v2, v4, v3}, Ll/l6m;->n1(IFFF)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 35
    .line 36
    const/4 v1, 0x3

    .line 37
    const/high16 v2, 0x437a0000    # 250.0f

    .line 38
    .line 39
    invoke-interface {v0, v1, v2, v4, v3}, Ll/l6m;->n1(IFFF)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 43
    .line 44
    const/4 v1, 0x4

    .line 45
    const/high16 v2, 0x43fa0000    # 500.0f

    .line 46
    .line 47
    invoke-interface {v0, v1, v2, v4, v3}, Ll/l6m;->n1(IFFF)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 51
    .line 52
    const/4 v1, 0x5

    .line 53
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 54
    .line 55
    invoke-interface {v0, v1, v2, v4, v3}, Ll/l6m;->n1(IFFF)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 59
    .line 60
    const/4 v1, 0x6

    .line 61
    const/high16 v2, 0x44fa0000    # 2000.0f

    .line 62
    .line 63
    const/high16 v3, -0x3f000000    # -8.0f

    .line 64
    .line 65
    invoke-interface {v0, v1, v2, v4, v3}, Ll/l6m;->n1(IFFF)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 69
    .line 70
    const/4 v1, 0x7

    .line 71
    const/high16 v2, 0x457a0000    # 4000.0f

    .line 72
    .line 73
    invoke-interface {v0, v1, v2, v4, v3}, Ll/l6m;->n1(IFFF)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 77
    .line 78
    const/16 v1, 0x8

    .line 79
    .line 80
    const/high16 v2, 0x45fa0000    # 8000.0f

    .line 81
    .line 82
    invoke-interface {v0, v1, v2, v3}, Ll/l6m;->Q(IFF)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 86
    .line 87
    const/high16 v0, 0x467a0000    # 16000.0f

    .line 88
    .line 89
    const/16 v1, 0x21

    .line 90
    .line 91
    const/16 v2, 0x9

    .line 92
    .line 93
    invoke-interface {p0, v2, v0, v1}, Ll/l6m;->d0(IFI)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method private setParameters_i(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/String;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 22
    .line 23
    invoke-interface {v1, v0}, Ll/hwl;->v(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method private startPush(Landroid/app/Activity;Ll/brx;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPipelineModuleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mMediaCfgParams:Ll/brx;

    .line 6
    .line 7
    invoke-static {p1, p2}, Ll/d410;->m(Landroid/app/Activity;Ll/brx;)Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iput-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPipelineModuleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 12
    .line 13
    :cond_0
    iget-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenInputPipline:Ll/n5m;

    .line 14
    .line 15
    if-nez p2, :cond_3

    .line 16
    .line 17
    iget-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenCodecParameters:Ll/ror;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/immomo/ijkConferenceStreamer;->getScreenWidth(Landroid/content/Context;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p2, Ll/uow;->y0:I

    .line 24
    .line 25
    iget-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenCodecParameters:Ll/ror;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/immomo/ijkConferenceStreamer;->getScreenHeight(Landroid/content/Context;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p2, Ll/uow;->z0:I

    .line 32
    .line 33
    iget-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenCodecParameters:Ll/ror;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/immomo/ijkConferenceStreamer;->getScreenWidth(Landroid/content/Context;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p2, Ll/tow;->s:I

    .line 40
    .line 41
    iget-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenCodecParameters:Ll/ror;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/immomo/ijkConferenceStreamer;->getScreenHeight(Landroid/content/Context;)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p2, Ll/tow;->t:I

    .line 48
    .line 49
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPipelineModuleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 50
    .line 51
    iget-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenCodecParameters:Ll/ror;

    .line 52
    .line 53
    invoke-interface {p1, p2}, Lcom/momo/pub/MomoPipelineModuleRegister;->y(Ll/ror;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPipelineModuleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 57
    .line 58
    invoke-interface {p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->K()V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPipelineModuleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 62
    .line 63
    new-instance p2, Lcom/immomo/ijkConferenceStreamer$a;

    .line 64
    .line 65
    invoke-direct {p2, p0}, Lcom/immomo/ijkConferenceStreamer$a;-><init>(Lcom/immomo/ijkConferenceStreamer;)V

    .line 66
    .line 67
    .line 68
    invoke-interface {p1, p2}, Lcom/momo/pub/MomoPipelineModuleRegister;->e(Lcom/momo/pub/MomoPipelineModuleRegister$a;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPipelineModuleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 72
    .line 73
    invoke-interface {p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->o()Ll/n5m;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenInputPipline:Ll/n5m;

    .line 78
    .line 79
    const/4 p2, 0x0

    .line 80
    invoke-interface {p1, p2}, Ll/pvl;->i(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenInputPipline:Ll/n5m;

    .line 84
    .line 85
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 86
    .line 87
    invoke-interface {p1, v0}, Ll/n5m;->o(Landroid/media/projection/MediaProjection;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPipelineModuleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 91
    .line 92
    invoke-interface {p1, p2}, Lcom/momo/pub/MomoPipelineModuleRegister;->P(Ll/brx;)Ll/zzl;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPusherPipeline:Ll/zzl;

    .line 97
    .line 98
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 99
    .line 100
    if-eqz p1, :cond_1

    .line 101
    .line 102
    const/4 v0, 0x1

    .line 103
    invoke-interface {p1, v0}, Ll/hwl;->P1(Z)V

    .line 104
    .line 105
    .line 106
    :cond_1
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 107
    .line 108
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPipelineModuleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 109
    .line 110
    if-eqz p1, :cond_2

    .line 111
    .line 112
    invoke-interface {p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->x()Ll/dpl;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-interface {v0, p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->J(Ll/dpl;)V

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_2
    invoke-interface {v0, p2}, Lcom/momo/pub/MomoPipelineModuleRegister;->J(Ll/dpl;)V

    .line 121
    .line 122
    .line 123
    :goto_0
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPusherPipeline:Ll/zzl;

    .line 124
    .line 125
    iget-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenCodecParameters:Ll/ror;

    .line 126
    .line 127
    iget v0, p2, Ll/ror;->m1:I

    .line 128
    .line 129
    iget-object p2, p2, Ll/uow;->v0:Ljava/lang/String;

    .line 130
    .line 131
    invoke-interface {p1, v0, p2}, Ll/c4m;->p0(ILjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPusherPipeline:Ll/zzl;

    .line 135
    .line 136
    invoke-interface {p1}, Ll/c4m;->t0()I

    .line 137
    .line 138
    .line 139
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenCodecParameters:Ll/ror;

    .line 140
    .line 141
    iget-object p0, p0, Ll/uow;->v0:Ljava/lang/String;

    .line 142
    .line 143
    :cond_3
    return-void
.end method


# virtual methods
.method public JoinRoom(Ljava/lang/String;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/c4m;->p(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public LeaveRoom()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/c4m;->o()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public SabineEffectReset()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->P()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public SabineEffectReset_ex()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->I()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public SabineEffectSet(IIF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/l6m;->e1(IIF)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public SabineEffectSet_ans(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/l6m;->U1(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public SabineEffectSet_peq_Shelving(IFF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/l6m;->Q(IFF)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public SabineEffectSet_peq_fliter(IFI)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/l6m;->d0(IFI)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public SabineEffectSet_peq_peak(IFFF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3, p4}, Ll/l6m;->n1(IFFF)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public SabineEffectSet_reverb(IF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/l6m;->i1(IF)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public addEventHandler(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcEventHandler:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->X1(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public addExitRoomHandler(Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcExitRoomHandler:Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->N0(Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public addFilterToDestory(Ll/jt2;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/pvl;->a()Ll/z5m;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/pvl;->a()Ll/z5m;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, p1, v0}, Lcom/immomo/ijkConferenceStreamer;->addFilterToDestroy(Ll/wej;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public addFilterToDestroy(Ll/wej;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/momo/pub/MomoPipelineModuleRegister;->I(Ll/wej;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public addMRtcAnchorStatusHandle(Ll/upw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-interface {p0, p1}, Ll/hwl;->O0(Ll/upw;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public addMRtcAudioHandler(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "addMRtcAudioHandler"

    .line 6
    .line 7
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcAudioHandler:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 15
    .line 16
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioInterval:I

    .line 17
    .line 18
    iget v1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudiosmooth:I

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0, v1}, Lcom/immomo/ijkConferenceStreamer;->setAudioOnlyModel(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;II)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public addMRtcAudioHandlerEx(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "addMRtcAudioHandlerEx"

    .line 6
    .line 7
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcAudioHandlerEx:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ll/c4m;->n0(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public addMRtcAudioStatsUpdataHandler(Ll/vpw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->B0(Ll/vpw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public addMRtcChannelHandler(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcChannelHandler:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->i0(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public addMRtcConnectHandler(Lcom/immomo/mediacore/coninf/MRtcConnectHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcConnectHandler:Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->a2(Lcom/immomo/mediacore/coninf/MRtcConnectHandler;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public addMRtcLRemoteStatsUpdataHandle(Ll/wpw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcLRemoteStatsUpdataHandle:Ll/wpw;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->H0(Ll/wpw;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public addMRtcMRtcClientRoleChangedHandler(Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->c0(Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public addMRtcQualityHandler(Lcom/immomo/mediacore/coninf/MRtcQualityHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcQualityHandler:Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->J0(Lcom/immomo/mediacore/coninf/MRtcQualityHandler;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public addMRtcReceiveSeiHandler(Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->Y1(Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public addMRtcStatsUpdataHandle(Ll/ypw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-interface {p0, p1}, Ll/hwl;->a0(Ll/ypw;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public addMRtcSurroundMusicHander(Lcom/immomo/mediacore/coninf/MRtcSurroundMusicHander;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcSurroundMusicHander:Lcom/immomo/mediacore/coninf/MRtcSurroundMusicHander;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->s0(Lcom/immomo/mediacore/coninf/MRtcSurroundMusicHander;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public addMRtcVideoLossHandler(Ll/zpw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->D1(Ll/zpw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public adjustAef(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/l6m;->b0(IZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public adjustEQ(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/l6m;->y0(IZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public adjustEf(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/l6m;->T(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public adjustPlaybackSignalVolume(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c4m;->F1(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public adjustRemoteUserVolumeScale(JF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/hwl;->L(JF)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public adjustTune(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/l6m;->j0(IZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public captureImage(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c4m;->V1(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public changeRole(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->E0(I)I

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

.method public changeVideoEncodeSize()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v1, p0, Lcom/immomo/ijkConferenceStreamer;->mVenderID:I

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-ne v1, v2, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 12
    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    invoke-interface {v2, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->b(Ll/uow;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Lcom/momo/pub/MomoPipelineModuleRegister;->v(Ll/ror;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 v2, 0x2

    .line 27
    if-eq v1, v2, :cond_2

    .line 28
    .line 29
    const/4 v2, 0x3

    .line 30
    if-ne v1, v2, :cond_3

    .line 31
    .line 32
    :cond_2
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 33
    .line 34
    if-eqz v1, :cond_3

    .line 35
    .line 36
    invoke-interface {v1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->b(Ll/uow;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 42
    .line 43
    invoke-interface {v0, p0}, Lcom/momo/pub/MomoPipelineModuleRegister;->p(Ll/ror;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public disableSabinAns(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "disableSabinAns:"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const/4 p1, 0x1

    .line 33
    invoke-virtual {p0, p1, p1}, Ll/csx;->k1(II)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/4 p1, 0x0

    .line 42
    invoke-virtual {p0, p1, p1}, Ll/csx;->k1(II)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public enableAudio(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableAudio:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->u1(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public enableAudioStereo(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/hwl;->S(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->enableAudioStrero:Z

    .line 9
    .line 10
    return-void
.end method

.method public enableAudioVolumeIndication(II)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioInterval:I

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/ijkConferenceStreamer;->mAudiosmooth:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcAudioHandler:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1, p2}, Lcom/immomo/ijkConferenceStreamer;->setAudioOnlyModel(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public enableCommMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mCommMode:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->k2(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public enableConfLog(ZLjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogPath:Ljava/lang/String;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogEnable:Z

    .line 4
    .line 5
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-lez p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 16
    .line 17
    iget-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogPath:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p2, p1, Ll/uow;->R0:Ljava/lang/String;

    .line 20
    .line 21
    iget-boolean p2, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogEnable:Z

    .line 22
    .line 23
    iput-boolean p2, p1, Ll/uow;->Q0:Z

    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogEnable:Z

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogPath:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-lez p1, :cond_1

    .line 40
    .line 41
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 42
    .line 43
    iget-boolean p2, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogEnable:Z

    .line 44
    .line 45
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogPath:Ljava/lang/String;

    .line 46
    .line 47
    invoke-interface {p1, p2, p0}, Ll/hwl;->W(ZLjava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public enableExternStream(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableExternStream:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->N(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public enableMulPusherInRoom(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableMulPusherInRoom:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->Z0(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public enableVbr(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->enableVbr:Z

    .line 2
    .line 3
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/csx;->u1(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public enableVideo(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableVideo:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->C0(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public enableWebSdkInteroperability(Z)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableWebSdkInteroperability:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/c4m;->v0(Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public enableWeilaVBR(Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/csx;->u1(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public forwardDownlinkAudio(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/hwl;->z0(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public getAgoraEngine()Lio/agora/rtc2/RtcEngine;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getCodecParameters()Ll/ror;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentPos()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->w()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getEffectsVolume()D
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/hwl;->getEffectsVolume()D

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getExternFileDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/lvl;->getDuration()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getExternFilePlayPos()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/lvl;->getCurrentPosition()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getMasterAudioLevel()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/ijkConferenceStreamer;->mMasterAudioLevel:F

    .line 2
    .line 3
    return p0
.end method

.method public getMediaCfgParams()Ll/brx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mMediaCfgParams:Ll/brx;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMomoProcessPipeline()Ll/o410;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/pub/MomoPipelineModuleRegister;->F()Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->z0()Ll/o410;

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public getMusicDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->getMusicDuration()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getMusicVolume()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->d()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    return p0
.end method

.method public getPreviewSize(II)Ll/erf0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/cql;->x(II)Ll/erf0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance p0, Ll/erf0;

    .line 11
    .line 12
    const/16 p1, 0x160

    .line 13
    .line 14
    const/16 p2, 0x280

    .line 15
    .line 16
    invoke-direct {p0, p1, p2}, Ll/erf0;-><init>(II)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public getRecordDuration()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/c4m;->k1()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getRecordHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/c4m;->L1()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getRecordWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/c4m;->V0()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getRoomType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/ijkConferenceStreamer;->mRoomtype:I

    .line 2
    .line 3
    return p0
.end method

.method public getSlaveAudioLevel()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->y1()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/high16 p0, 0x3f000000    # 0.5f

    .line 11
    .line 12
    return p0
.end method

.method public getStreamerType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/ijkConferenceStreamer;->mVenderID:I

    .line 2
    .line 3
    return p0
.end method

.method public getSurroundMusicDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->c()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getSurroundMusicPos()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->r()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getVideoPts()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getVolumeOfEffects(I)D
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->X0(I)D

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0

    .line 10
    :cond_0
    const-wide/16 p0, 0x0

    .line 11
    .line 12
    return-wide p0
.end method

.method public ignoreMonitor(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mIgnoreMonitor:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/c4m;->J1(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public mergeInput(Ll/pvl;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/momo/pub/MomoPipelineModuleRegister;->q(Ll/pvl;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final muteAllRemoteAudioStream(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAllRemoteAudioStream:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/c4m;->x(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final muteAllRemoteVideoStream(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c4m;->f1(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final muteLocalAudioStream(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mLocalAudioStreamMute:Z

    .line 2
    .line 3
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "ijkconf muteLocalAudioStream"

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-interface {v0, p1}, Ll/c4m;->a(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-interface {p0, p1}, Ll/c4m;->a(Z)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public muteLocalAudioStreamEx(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mLocalAudioStreamMute:Z

    .line 2
    .line 3
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "ijkconf muteLocalAudioStreamEx"

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ll/hwl;->G(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final muteLocalVideoStream(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mLocalVideoStreamMute:Z

    .line 2
    .line 3
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "muteLocalVideoStream"

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ll/c4m;->B1(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final muteRemoteAudioStream(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/c4m;->Q0(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public muteRemoteMsgStream(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/c4m;->U0(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final muteRemoteVideoStream(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/c4m;->H1(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public muteSingerAudioStream(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/c4m;->b(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p0, p1}, Lcom/momo/piplinemomoext/input/audio/a;->b(Z)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V
    .locals 6
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    .line 32
    invoke-virtual/range {v0 .. v5}, Lcom/immomo/ijkConferenceStreamer;->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;Ll/brx;)V

    return-void
.end method

.method public onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;Ll/brx;)V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    const/16 v0, 0x457

    .line 2
    .line 3
    if-eq p2, v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mMediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

    .line 7
    .line 8
    invoke-virtual {p2, p3, p4}, Landroid/media/projection/MediaProjectionManager;->getMediaProjection(ILandroid/content/Intent;)Landroid/media/projection/MediaProjection;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iget-object p4, p0, Lcom/immomo/ijkConferenceStreamer;->mOnInfoListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 13
    .line 14
    if-eqz p4, :cond_1

    .line 15
    .line 16
    const/16 v0, 0x3102

    .line 17
    .line 18
    invoke-interface {p4, p0, v0, p3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 19
    .line 20
    .line 21
    :cond_1
    if-eqz p2, :cond_3

    .line 22
    .line 23
    if-nez p3, :cond_2

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    iput-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 27
    .line 28
    invoke-direct {p0, p1, p5}, Lcom/immomo/ijkConferenceStreamer;->startPush(Landroid/app/Activity;Ll/brx;)V

    .line 29
    .line 30
    .line 31
    :cond_3
    :goto_0
    return-void
.end method

.method public openAudioTracks(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableSwitchAudioTrack:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/lvl;->t(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public pasePlayMusic()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->w1()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public pauseAllEffects()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/hwl;->pauseAllEffects()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public pauseCamera()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "pauseCamera"

    .line 10
    .line 11
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 19
    .line 20
    invoke-interface {p0}, Ll/cql;->N()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public pauseEffect(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->pauseEffect(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public pauseExternFile()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mHavaSelectFile:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "pauseExternFile"

    .line 15
    .line 16
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 24
    .line 25
    invoke-interface {p0}, Ll/lvl;->pause()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public pauseRecording()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/hwl;->s()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public pauseRending()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mPauseRending:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mPauseRending:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "cameraInputPipline pauseRendering"

    .line 18
    .line 19
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 27
    .line 28
    invoke-interface {v0}, Ll/pvl;->K()V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "ijkInputPipline pauseRendering"

    .line 40
    .line 41
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 49
    .line 50
    invoke-interface {p0}, Ll/pvl;->K()V

    .line 51
    .line 52
    .line 53
    :cond_2
    :goto_0
    return-void
.end method

.method public pauseScreenPusher()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenInputPipline:Ll/n5m;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/pvl;->K()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPusherPipeline:Ll/zzl;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p0}, Ll/zzl;->g2()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public pauseSurroundMusic()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->j()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public playEffect(ILjava/lang/String;IDDZ)Z
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v9, 0x0

    .line 6
    .line 7
    move v1, p1

    .line 8
    move-object v2, p2

    .line 9
    move v3, p3

    .line 10
    move-wide v4, p4

    .line 11
    move-wide/from16 v6, p6

    .line 12
    .line 13
    move/from16 v8, p8

    .line 14
    .line 15
    invoke-interface/range {v0 .. v10}, Ll/hwl;->K1(ILjava/lang/String;IDDZD)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public playEffect(ILjava/lang/String;IDDZD)Z
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    if-eqz p0, :cond_0

    .line 23
    invoke-interface/range {p0 .. p10}, Ll/hwl;->K1(ILjava/lang/String;IDDZD)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public release()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/immomo/ijkConferenceStreamer;->setScreenOnWhilePublishing(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/ijkConferenceStreamer;->stopRecording()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/immomo/ijkConferenceStreamer;->stopScreenPushlish()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->release()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->mSynRelease:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v1

    .line 17
    :try_start_0
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->mNetUtil:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/NetUtil;->e()V

    .line 23
    .line 24
    .line 25
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mNetUtil:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto/16 :goto_1

    .line 30
    .line 31
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 32
    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    invoke-interface {v2}, Ll/l6m;->d1()V

    .line 36
    .line 37
    .line 38
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 39
    .line 40
    :cond_1
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 41
    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    invoke-interface {v2}, Ll/pvl;->G()V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 48
    .line 49
    invoke-interface {v2}, Ll/cql;->r()V

    .line 50
    .line 51
    .line 52
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 53
    .line 54
    iget-object v4, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 55
    .line 56
    invoke-interface {v2, v4}, Lcom/momo/pub/MomoPipelineModuleRegister;->B(Ll/pvl;)V

    .line 57
    .line 58
    .line 59
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 60
    .line 61
    :cond_2
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 62
    .line 63
    if-eqz v2, :cond_3

    .line 64
    .line 65
    invoke-interface {v2}, Ll/pvl;->G()V

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 69
    .line 70
    iget-object v4, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 71
    .line 72
    invoke-interface {v2, v4}, Lcom/momo/pub/MomoPipelineModuleRegister;->B(Ll/pvl;)V

    .line 73
    .line 74
    .line 75
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 76
    .line 77
    :cond_3
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->emptyInputPipline:Ll/usl;

    .line 78
    .line 79
    if-eqz v2, :cond_4

    .line 80
    .line 81
    invoke-interface {v2}, Ll/pvl;->G()V

    .line 82
    .line 83
    .line 84
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 85
    .line 86
    iget-object v4, p0, Lcom/immomo/ijkConferenceStreamer;->emptyInputPipline:Ll/usl;

    .line 87
    .line 88
    invoke-interface {v2, v4}, Lcom/momo/pub/MomoPipelineModuleRegister;->B(Ll/pvl;)V

    .line 89
    .line 90
    .line 91
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->emptyInputPipline:Ll/usl;

    .line 92
    .line 93
    :cond_4
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 94
    .line 95
    if-eqz v2, :cond_5

    .line 96
    .line 97
    invoke-interface {v2}, Lcom/momo/pub/MomoPipelineModuleRegister;->t()V

    .line 98
    .line 99
    .line 100
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 101
    .line 102
    :cond_5
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 103
    .line 104
    if-eqz v2, :cond_6

    .line 105
    .line 106
    iget-object v4, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 107
    .line 108
    iget-object v4, v4, Ll/uow;->v0:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v2, v0, v4}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->i(ILjava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 114
    .line 115
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l()V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 119
    .line 120
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->j()V

    .line 121
    .line 122
    .line 123
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 124
    .line 125
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mLogUploadCallBack:Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

    .line 126
    .line 127
    :cond_6
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 128
    .line 129
    if-eqz v0, :cond_7

    .line 130
    .line 131
    invoke-interface {v0}, Ll/c4m;->release()V

    .line 132
    .line 133
    .line 134
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 135
    .line 136
    :cond_7
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 137
    .line 138
    if-eqz v0, :cond_8

    .line 139
    .line 140
    invoke-interface {v0}, Ll/c4m;->release()V

    .line 141
    .line 142
    .line 143
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 144
    .line 145
    :cond_8
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mLogUploadCallBack:Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

    .line 146
    .line 147
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mOnErrorListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

    .line 148
    .line 149
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mPreviewSizeSetListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;

    .line 150
    .line 151
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 152
    .line 153
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 154
    .line 155
    .line 156
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 157
    .line 158
    iput-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mSurface:Ljava/lang/Object;

    .line 159
    .line 160
    monitor-exit v1

    .line 161
    return-void

    .line 162
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 163
    throw p0
.end method

.method public releasePlayMusic()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->o0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public removeMerge(Ll/pvl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->j(Ll/pvl;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public requestExpectStream(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/hwl;->A0(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public resetCamera()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrConfig:Ll/row;

    .line 6
    .line 7
    invoke-interface {v0, p0}, Ll/cql;->B(Ll/row;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public resetCodec(II)V
    .locals 0

    .line 36
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEncodeWidth:I

    .line 37
    iput p2, p0, Lcom/immomo/ijkConferenceStreamer;->mEncodeHeight:I

    .line 38
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->initFilterCoreParameters()V

    .line 39
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    if-eqz p1, :cond_0

    .line 40
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    invoke-interface {p1, p0}, Ll/c4m;->S0(Ll/uow;)V

    :cond_0
    return-void
.end method

.method public resetCodec(III)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEncodeWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/ijkConferenceStreamer;->mEncodeHeight:I

    .line 4
    .line 5
    iput p3, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoBitRate:I

    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget v1, v0, Ll/tow;->H:I

    .line 12
    .line 13
    if-ne p3, v1, :cond_0

    .line 14
    .line 15
    iget p3, v0, Ll/tow;->m:I

    .line 16
    .line 17
    if-ne p1, p3, :cond_0

    .line 18
    .line 19
    iget p1, v0, Ll/tow;->n:I

    .line 20
    .line 21
    if-eq p2, p1, :cond_1

    .line 22
    .line 23
    :cond_0
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->initFilterCoreParameters()V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 31
    .line 32
    invoke-interface {p1, p0}, Ll/c4m;->S0(Ll/uow;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public resetExtPlayerPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 2
    .line 3
    iput-object p1, p0, Ll/uow;->x0:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public resumeAllEffects()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/hwl;->resumeAllEffects()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public resumeCamera()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/cql;->z()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public resumeEffect(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->resumeEffect(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public resumeExternFile(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mHavaSelectFile:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "surface:"

    .line 17
    .line 18
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "resumeExternFile"

    .line 29
    .line 30
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 38
    .line 39
    invoke-interface {v0}, Ll/lvl;->resume()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 43
    .line 44
    invoke-interface {v0}, Ll/pvl;->K()V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 48
    .line 49
    invoke-interface {p0, p1}, Ll/pvl;->C(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public resumePlayMusic()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->p1()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public resumeRecording()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/hwl;->F0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public resumeRending()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mPauseRending:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mPauseRending:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->mSurface:Ljava/lang/Object;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-interface {v0, v1}, Ll/pvl;->C(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mSurface:Ljava/lang/Object;

    .line 25
    .line 26
    invoke-interface {v0, p0}, Ll/pvl;->C(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    :goto_0
    return-void
.end method

.method public resumeScreenPusher()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenInputPipline:Ll/n5m;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, v1}, Ll/pvl;->C(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPusherPipeline:Ll/zzl;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ll/zzl;->R0()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public resumeSurroundMusic()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->q()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public seekExternFile(J)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mHavaSelectFile:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0, p1, p2}, Ll/lvl;->seek(J)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public seekMusic(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/l6m;->q0(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public seekToSurroundMusic(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/l6m;->w0(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public selectCamera(Landroid/app/Activity;I)V
    .locals 0

    return-void
.end method

.method public selectFaceDetectFilter(Landroid/content/Context;Ll/jt2;)V
    .locals 0

    .line 14
    invoke-virtual {p0, p2}, Lcom/immomo/ijkConferenceStreamer;->selectFaceDetectFilter(Ll/jt2;)V

    return-void
.end method

.method public selectFaceDetectFilter(Ll/jt2;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->selectFilter(Ll/jt2;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Ll/suf;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast p1, Ll/suf;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setFaceDetectInterFace(Ll/suf;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public selectFilter(Ll/jt2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mBasicFilter:Ll/jt2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/cql;->j(Ll/jt2;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public sendConferenceDate(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->Q1(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setAdjustBrightnessInterval(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAdjustBrightnessInterval:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/cql;->m(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setAppID(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAppID:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setAudioChannelNum(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioChannalNum:I

    .line 2
    .line 3
    return-void
.end method

.method public setAudioEffectType(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v1, 0x0

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    packed-switch p1, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    :goto_0
    return-void

    .line 14
    :pswitch_0
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->audioEffectReset()V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 18
    .line 19
    invoke-interface {p1, v1, v1}, Ll/l6m;->j0(IZ)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 23
    .line 24
    invoke-interface {p0, v2}, Ll/l6m;->S1(Z)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :pswitch_1
    invoke-interface {v0, v1, v1}, Ll/l6m;->j0(IZ)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 32
    .line 33
    invoke-interface {p1}, Ll/l6m;->I()V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 37
    .line 38
    invoke-interface {p1, v1}, Ll/l6m;->S1(Z)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->sabineMcEQ()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :pswitch_2
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->audioEffectReset()V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 49
    .line 50
    const/16 p1, 0x9

    .line 51
    .line 52
    invoke-interface {p0, p1, v2}, Ll/l6m;->j0(IZ)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :pswitch_3
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->audioEffectReset()V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 60
    .line 61
    const/4 p1, 0x6

    .line 62
    invoke-interface {p0, p1, v2}, Ll/l6m;->j0(IZ)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :pswitch_4
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->audioEffectReset()V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 70
    .line 71
    const/4 p1, -0x4

    .line 72
    invoke-interface {p0, p1, v2}, Ll/l6m;->j0(IZ)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->audioEffectReset()V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 80
    .line 81
    invoke-interface {p0, v1, v1}, Ll/l6m;->j0(IZ)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setAudioHighQualityParameters(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioHighQualityFlg:Z

    .line 2
    .line 3
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "setAudioHighQualityParameters:mAudioProfile="

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "/"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget v1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, ","

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v2, p0, Lcom/immomo/ijkConferenceStreamer;->mVenderID:I

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget-boolean v2, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfileStatus:Z

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-boolean p0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioHighQualityFlg:Z

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string v0, "newAudio"

    .line 60
    .line 61
    invoke-virtual {p1, v0, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public setAudioMixingPitch(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/l6m;->A1(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setAudioOnlyModel(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;II)V
    .locals 3

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    if-ltz p2, :cond_2

    .line 4
    .line 5
    if-gez p3, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "interval:"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v2, ",smooth:"

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "setAudioOnlyModel"

    .line 35
    .line 36
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 44
    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-interface {v0, p1, p2, p3}, Ll/c4m;->Z1(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;II)V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 51
    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    invoke-interface {p0, p1, p2, p3}, Ll/c4m;->Z1(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;II)V

    .line 55
    .line 56
    .line 57
    :cond_2
    :goto_0
    return-void
.end method

.method public setAudioProfile(II)V
    .locals 2

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    if-gez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfileStatus:Z

    .line 8
    .line 9
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 10
    .line 11
    iput p2, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 12
    .line 13
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance p2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v0, "setAudioProfile:mAudioProfile="

    .line 24
    .line 25
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v0, "/"

    .line 34
    .line 35
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 39
    .line 40
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v0, ","

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/immomo/ijkConferenceStreamer;->mVenderID:I

    .line 49
    .line 50
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioHighQualityFlg:Z

    .line 57
    .line 58
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    const-string v0, "newAudio"

    .line 66
    .line 67
    invoke-virtual {p1, v0, p2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    new-instance p2, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v0, "ijkconf setAudioProfile: profile="

    .line 77
    .line 78
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 82
    .line 83
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v0, ", scenario="

    .line 87
    .line 88
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 92
    .line 93
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-virtual {p1, p2}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 108
    .line 109
    iget p2, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 110
    .line 111
    iget p0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 112
    .line 113
    invoke-interface {p1, p2, p0}, Ll/hwl;->M0(II)V

    .line 114
    .line 115
    .line 116
    :cond_1
    :goto_0
    return-void
.end method

.method public setAudioSampleRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioSampleRate:I

    .line 2
    .line 3
    return-void
.end method

.method public setAudioTrackIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mActiveAudioTrack:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/lvl;->n(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setAvFlag(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAvFlag:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/c4m;->t1(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setBlinkSwitch(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/cql;->w(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setBusinessType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mBusinessType:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/c4m;->T0(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setCameraCutSize(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/momo/pub/MomoPipelineModuleRegister;->s(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setChannalName(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 2
    .line 3
    iput-object p1, v0, Ll/ror;->g1:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "setChannalName"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 17
    .line 18
    iget-object v3, v3, Ll/ror;->g1:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    invoke-virtual {p0, v0, v1}, Lcom/immomo/ijkConferenceStreamer;->setSessionID(J)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :catch_0
    move-exception p0

    .line 39
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public setChannelkey(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mChannelkey:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mChannelkey:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {p1, p0}, Ll/hwl;->h0(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method public setCustZoomFlag(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mCusZoomFlag:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->I0(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setDefaultAudioRoutetoSpeakerphone(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mDefaultAudioRoutetoSpeakerphone:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEffectsVolume(D)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/hwl;->setEffectsVolume(D)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setEnableSpeakerphone(Z)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->setEnableSpeakerphone(Z)I

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

.method public setEncoderSize(II)V
    .locals 3

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEncodeWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/ijkConferenceStreamer;->mEncodeHeight:I

    .line 4
    .line 5
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "width:"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p1, ", height:"

    .line 20
    .line 21
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string p2, "setEncoderSize"

    .line 32
    .line 33
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {v0, p1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->initFilterCoreParameters()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public setEncryptionMode(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEncryptionMode:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ll/hwl;->h1(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public setEncryptionSecret(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEncryptionSecret:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ll/hwl;->Z(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public setError(I)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mOutErrorCode:I

    .line 2
    .line 3
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "setError: mOutErrorCode="

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget p0, p0, Lcom/immomo/ijkConferenceStreamer;->mOutErrorCode:I

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "pip->PIPLINE2"

    .line 24
    .line 25
    invoke-virtual {p1, v0, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setExtAudioParameters(III)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudio_channe_frq:I

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/ijkConferenceStreamer;->mAudio_channe:I

    .line 4
    .line 5
    iput p3, p0, Lcom/immomo/ijkConferenceStreamer;->mAudio_channe_layout:I

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1, p2, p3}, Ll/lvl;->p(III)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setExternEncoderSize(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mExternEncodeWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/ijkConferenceStreamer;->mExternEncodeHeight:I

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->initFilterCoreParameters()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setExternVideoEncodingBitRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mExternVideoBitRate:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->initFilterCoreParameters()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFaceBeautiful(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->faceBeautiful:I

    .line 2
    .line 3
    return-void
.end method

.method public setFaceDetectInterFace(Ll/suf;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->H(Ll/suf;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setFaceDetectModelPath(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/cql;->l(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setFaceDetectTimeoutSwitch(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/cql;->I(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setFaceExpressionDetectSwitch(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->isActiveSwitch:Ljava/lang/Boolean;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-interface {p0, p1}, Ll/cql;->k(Z)V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public setFaceEyeScale(Ljava/lang/Float;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mFaceEyeScale:Ljava/lang/Float;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-interface {p0, p1}, Ll/cql;->v(F)V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public setFaceThinScale(Ljava/lang/Float;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mFaceThinScale:Ljava/lang/Float;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-interface {p0, p1}, Ll/cql;->q(F)V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public setForceChangeAudioRouter(ZZ)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iput v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioRoteoverrideDefault:I

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioRoteoverrideDefault:I

    .line 9
    .line 10
    :goto_0
    iput-boolean p2, p0, Lcom/immomo/ijkConferenceStreamer;->mUsingVoip:Z

    .line 11
    .line 12
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-interface {p0, p1, p2}, Ll/hwl;->E1(ZZ)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public setHost(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 2
    .line 3
    iput-boolean p1, p0, Ll/ror;->h1:Z

    .line 4
    .line 5
    return-void
.end method

.method public setLandMode(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->O(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 11
    .line 12
    invoke-interface {p1, p0}, Lcom/momo/pub/MomoPipelineModuleRegister;->p(Ll/ror;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public setLocalMergeSei(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c4m;->I1(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setLogUploadCallBack(IILtv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;)V
    .locals 0

    .line 1
    iput-object p3, p0, Lcom/immomo/ijkConferenceStreamer;->mLogUploadCallBack:Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

    .line 2
    .line 3
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mLogReportInterval:I

    .line 4
    .line 5
    iput p2, p0, Lcom/immomo/ijkConferenceStreamer;->mLogReportCount:I

    .line 6
    .line 7
    return-void
.end method

.method public setMasterAudioLevel(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mMasterAudioLevel:F

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/l6m;->g0(F)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setMediaCfgParams(Ll/brx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mMediaCfgParams:Ll/brx;

    .line 2
    .line 3
    return-void
.end method

.method public setMediaCodecEnable(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    sget-object p1, Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;->HARD_DECODE:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 7
    .line 8
    iput-object p1, p0, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object p1, Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;->SOFT_DECODE:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 12
    .line 13
    iput-object p1, p0, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 14
    .line 15
    return-void
.end method

.method public setMergePosition(Ll/pvl;Ljava/lang/String;FFFFFI)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface/range {p0 .. p8}, Lcom/momo/pub/MomoPipelineModuleRegister;->w(Ll/pvl;Ljava/lang/String;FFFFFI)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setMergePosition(Ll/pvl;Ljava/lang/String;FFFFFIII)V
    .locals 0

    .line 9
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    if-eqz p0, :cond_0

    .line 10
    invoke-interface/range {p0 .. p10}, Lcom/momo/pub/MomoPipelineModuleRegister;->k(Ll/pvl;Ljava/lang/String;FFFFFIII)V

    :cond_0
    return-void
.end method

.method public setMusicPath(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/l6m;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setMusicPitch(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/l6m;->setMusicPitch(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setMusicVolume(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/l6m;->setMusicVolume(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setNsStatus(ZI)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mNsStatus:Z

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/ijkConferenceStreamer;->mNsmode:I

    .line 4
    .line 5
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ll/hwl;->j1(ZI)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setOnErrorListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mOnErrorListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnInfoListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mOnInfoListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnRecordScreenErrorListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordScreenErrorListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mOnRecordScreenErrorListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordScreenErrorListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnRecordSuccessListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordSuccessListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mOnRecordSuccessListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordSuccessListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnRtcStatusListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRtcStatusListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mOnRtcStatusListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRtcStatusListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnSurroundMusicStatusListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mSurroundMusicStatusListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 4
    .line 5
    new-instance v0, Lcom/immomo/ijkConferenceStreamer$j;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/immomo/ijkConferenceStreamer$j;-><init>(Lcom/immomo/ijkConferenceStreamer;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1, v0}, Ll/l6m;->G1(Ll/gb1;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setParameters(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/hwl;->v(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mConfParameters:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setPcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mPcmDateCallback:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    new-instance p1, Lcom/immomo/ijkConferenceStreamer$k;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Lcom/immomo/ijkConferenceStreamer$k;-><init>(Lcom/immomo/ijkConferenceStreamer;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {v0, p1}, Ll/l6m;->R(Ll/fb1;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public setPlayBackAudioLevel(F)V
    .locals 0

    return-void
.end method

.method public setPlayerStateCallback(Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mPlayerStateCallback:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/lvl;->f(Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setPreviewDisplay(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mSurface:Ljava/lang/Object;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Lcom/immomo/ijkConferenceStreamer;->mPauseRending:Z

    .line 9
    .line 10
    invoke-interface {v0}, Ll/pvl;->K()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ll/pvl;->C(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setPreviewSize(II)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mVisualWeigh:I

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/ijkConferenceStreamer;->mVisualHeight:I

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->initFilterCoreParameters()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 13
    .line 14
    invoke-interface {v0, p0}, Lcom/momo/pub/MomoPipelineModuleRegister;->m(Ll/ror;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v1, "width:"

    .line 24
    .line 25
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string p1, ",height:"

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string p2, "ijkconf setPreviewSize"

    .line 44
    .line 45
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public setPreviewSizeSetListener(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mPreviewSizeSetListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;

    .line 2
    .line 3
    return-void
.end method

.method public setProvider(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setBusinessType(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/c4m;->H(I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public setRecordDateCallback(Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRecordDateCallback:Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    new-instance p1, Lcom/immomo/ijkConferenceStreamer$i;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Lcom/immomo/ijkConferenceStreamer$i;-><init>(Lcom/immomo/ijkConferenceStreamer;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {v0, p1}, Ll/l6m;->R(Ll/fb1;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public setRecordFileListener(Ll/l6m$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c4m;->C1(Ll/l6m$a;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setRecordPcmDataCallback(Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRecordPcmDataCallback:Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/c4m;->m1(Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setRole(I)V
    .locals 3

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mClientRole:I

    .line 2
    .line 3
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "role:"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v1, "setRole"

    .line 22
    .line 23
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {v0, p1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 31
    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget p0, p0, Lcom/immomo/ijkConferenceStreamer;->mClientRole:I

    .line 35
    .line 36
    invoke-interface {p1, p0}, Ll/hwl;->D(I)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public setRoom24hMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRoom24hMode:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->q1(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setRoomMode(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRoomMode:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-boolean p0, p0, Lcom/immomo/ijkConferenceStreamer;->mUseServerAudioMixer:Z

    .line 11
    .line 12
    invoke-interface {v0, p1, p0}, Ll/hwl;->c1(IZ)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public setRoomMode(IZ)V
    .locals 1

    .line 16
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRoomMode:I

    .line 17
    iput-boolean p2, p0, Lcom/immomo/ijkConferenceStreamer;->mUseServerAudioMixer:Z

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 18
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    if-eqz p0, :cond_0

    .line 19
    invoke-interface {p0, p1, p2}, Ll/hwl;->c1(IZ)V

    :cond_0
    return-void
.end method

.method public setRoomType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRoomtype:I

    .line 2
    .line 3
    return-void
.end method

.method public setRtcEventHandlerAdapter(Ll/kod0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcEventHandlerAdapter:Ll/kod0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->j2(Ll/kod0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setRtmpPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 2
    .line 3
    iput-object p1, p0, Ll/uow;->v0:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public setScreenOnWhilePublishing(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenOnWhilePlaying:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenOnWhilePlaying:Z

    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public setSei(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c4m;->J(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setSessionID(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 2
    .line 3
    iput-wide p1, p0, Ll/ror;->j1:J

    .line 4
    .line 5
    return-void
.end method

.method public setSimpleMediaLogsUpload(IILl/fpf0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Ll/csx;->s1(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 14
    .line 15
    invoke-interface {p0, p1, p2, p3}, Lcom/momo/pub/MomoPipelineModuleRegister;->i(IILl/fpf0;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setSlaveAudioLevel(F)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mSlaveAudioLevel:F

    .line 2
    .line 3
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ll/l6m;->W1(F)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget p0, p0, Lcom/immomo/ijkConferenceStreamer;->mSlaveAudioLevel:F

    .line 15
    .line 16
    invoke-interface {p1, p0}, Ll/lvl;->setVolume(F)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public setStreamerType(ILjava/lang/String;)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mOutFileType:I

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mOutputFilePath:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 6
    .line 7
    iput-object p2, v0, Ll/uow;->v0:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0, p1, p2}, Ll/c4m;->p0(ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setTargetVideoSize(II)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mTargetVideoWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/ijkConferenceStreamer;->mTargetVideoHeight:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrConfig:Ll/row;

    .line 6
    .line 7
    new-instance v1, Ll/erf0;

    .line 8
    .line 9
    invoke-direct {v1, p1, p2}, Ll/erf0;-><init>(II)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/row;->H(Ll/erf0;)V

    .line 13
    .line 14
    .line 15
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mTargetVideoWidth:I

    .line 16
    .line 17
    iget v1, p0, Lcom/immomo/ijkConferenceStreamer;->mTargetVideoHeight:I

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/immomo/ijkConferenceStreamer;->setCameraCutSize(II)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v1, "width:"

    .line 29
    .line 30
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p1, ",height:"

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string p2, "ijkconf setTargetVideoSize"

    .line 49
    .line 50
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public setUserID(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 2
    .line 3
    iput p1, p0, Ll/ror;->i1:I

    .line 4
    .line 5
    iput p1, p0, Ll/uow;->B0:I

    .line 6
    .line 7
    return-void
.end method

.method public setUserSig(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ll/uow;->C0:Ljava/lang/String;

    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public setVenderID(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mVenderID:I

    .line 2
    .line 3
    return-void
.end method

.method public setVideoChannelListener(Ll/ebl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoChannelListener:Ll/ebl0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->m0(Ll/ebl0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setVideoChannelListenerExt(Ll/hwl$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-interface {p0, p1}, Ll/hwl;->M1(Ll/hwl$a;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public setVideoChannelTextureViewListener(Ll/gbl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mTextureViewListener:Ll/gbl0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/hwl;->P0(Ll/gbl0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setVideoCodeFrameRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoCodecRate:I

    .line 2
    .line 3
    return-void
.end method

.method public setVideoEncodingBitRate(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoBitRate:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, v0, Ll/tow;->H:I

    .line 8
    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->initFilterCoreParameters()V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 19
    .line 20
    invoke-interface {p1, p0}, Ll/c4m;->S0(Ll/uow;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public setVideoMixerBackgroundImgUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mBackgroundImgUrl:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/hwl;->B(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setVideoQualityParameters(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoQualityFlg:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/ijkConferenceStreamer;->getAgoraEngine()Lio/agora/rtc2/RtcEngine;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/immomo/ijkConferenceStreamer;->getAgoraEngine()Lio/agora/rtc2/RtcEngine;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-boolean p0, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoQualityFlg:Z

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lio/agora/rtc2/RtcEngine;->setVideoQualityParameters(Z)I

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setVideoTextureListener(Ll/gkl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoTextureListener:Ll/gkl0;

    .line 2
    .line 3
    return-void
.end method

.method public setVoicebackwardsEnable(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mVoicebackwardsEnable:Z

    .line 2
    .line 3
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "setVoicebackwardsEnable:"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-interface {v0, p1}, Ll/l6m;->z(Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 36
    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    const/4 p1, 0x1

    .line 40
    invoke-interface {p0, p1}, Ll/l6m;->z(Z)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public setVolumeOfEffects(ID)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/hwl;->M(ID)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setWarpType(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->warpType:Ljava/lang/Integer;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-interface {p0, p1}, Ll/cql;->setWarpType(I)V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public setWeilaCodecStatus(ZZ)V
    .locals 0

    .line 1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Ll/csx;->b2(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0, p1}, Ll/csx;->c2(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public startPlayMusic(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/l6m;->v1(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public startPlayMusic(JZ)V
    .locals 0

    .line 9
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    if-eqz p0, :cond_0

    .line 10
    invoke-interface {p0, p1, p2, p3}, Ll/l6m;->Y0(JZ)V

    :cond_0
    return-void
.end method

.method public startPreview(ILjava/lang/Object;)V
    .locals 3

    .line 228
    iput-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mSurface:Ljava/lang/Object;

    .line 229
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mHavaSelectCamera:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    if-eqz v0, :cond_0

    .line 230
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->initFilterCoreParameters()V

    .line 231
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->m(Ll/ror;)V

    .line 232
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    invoke-interface {p1}, Ll/pvl;->K()V

    .line 233
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    invoke-interface {p0, p2}, Ll/pvl;->C(Ljava/lang/Object;)V

    return-void

    :cond_0
    if-nez p2, :cond_1

    .line 234
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    if-nez v0, :cond_1

    goto :goto_1

    .line 235
    :cond_1
    iput-boolean v1, p0, Lcom/immomo/ijkConferenceStreamer;->mHavaSelectCamera:Z

    .line 236
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mCameraID:I

    .line 237
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->initFilterCoreParameters()V

    .line 238
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mCameraID:I

    .line 239
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrConfig:Ll/row;

    if-nez p1, :cond_2

    const/4 p1, 0x0

    .line 240
    invoke-virtual {v0, p1}, Ll/row;->q(I)V

    goto :goto_0

    .line 241
    :cond_2
    invoke-virtual {v0, v1}, Ll/row;->q(I)V

    .line 242
    :goto_0
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrConfig:Ll/row;

    new-instance v2, Ll/qv40;

    invoke-direct {v2}, Ll/qv40;-><init>()V

    invoke-interface {p1, v0, v2}, Lcom/momo/pub/MomoPipelineModuleRegister;->E(Ll/row;Ll/jt2;)Ll/cql;

    move-result-object p1

    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 243
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->warpType:Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setWarpType(Ljava/lang/Integer;)V

    .line 244
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mFaceEyeScale:Ljava/lang/Float;

    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setFaceEyeScale(Ljava/lang/Float;)V

    .line 245
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mFaceThinScale:Ljava/lang/Float;

    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setFaceThinScale(Ljava/lang/Float;)V

    .line 246
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->faceBeautiful:I

    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setFaceBeautiful(I)V

    .line 247
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->isActiveSwitch:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setFaceExpressionDetectSwitch(Ljava/lang/Boolean;)V

    .line 248
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    invoke-interface {p1, v1}, Ll/cql;->T(Z)V

    .line 249
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    invoke-interface {p1, p2}, Ll/pvl;->i(Ljava/lang/Object;)V

    .line 250
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mBasicFilter:Ll/jt2;

    if-eqz p1, :cond_3

    .line 251
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->selectFilter(Ll/jt2;)V

    :cond_3
    :goto_1
    return-void
.end method

.method public startPreview(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 10

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "startPreview: HavaSelect="

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-boolean v2, p0, Lcom/immomo/ijkConferenceStreamer;->mHavaSelectFile:Z

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, ";file="

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, ";"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->mSurface:Ljava/lang/Object;

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v2, "--->"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "pip->PIPLINE2"

    .line 48
    .line 49
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string v3, "file:"

    .line 59
    .line 60
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    const-string v3, "startPreview"

    .line 71
    .line 72
    filled-new-array {v3, v1}, [Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    iput-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mSurface:Ljava/lang/Object;

    .line 80
    .line 81
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mHavaSelectFile:Z

    .line 82
    .line 83
    const/4 v1, 0x1

    .line 84
    if-ne v0, v1, :cond_0

    .line 85
    .line 86
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 87
    .line 88
    if-eqz v0, :cond_0

    .line 89
    .line 90
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 91
    .line 92
    iget-object v0, v0, Ll/uow;->x0:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_0

    .line 99
    .line 100
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 101
    .line 102
    invoke-interface {p1}, Ll/pvl;->K()V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 106
    .line 107
    invoke-interface {p0, p2}, Ll/pvl;->J(Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 112
    .line 113
    iput-object p1, v0, Ll/uow;->x0:Ljava/lang/String;

    .line 114
    .line 115
    iput-boolean v1, p0, Lcom/immomo/ijkConferenceStreamer;->mHavaSelectFile:Z

    .line 116
    .line 117
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->initFilterCoreParameters()V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 121
    .line 122
    if-eqz p1, :cond_1

    .line 123
    .line 124
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mSelectFileStop:Z

    .line 125
    .line 126
    if-nez v0, :cond_1

    .line 127
    .line 128
    iput-boolean v1, p0, Lcom/immomo/ijkConferenceStreamer;->mSelectFileStop:Z

    .line 129
    .line 130
    invoke-interface {p1}, Ll/pvl;->G()V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 134
    .line 135
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 136
    .line 137
    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->B(Ll/pvl;)V

    .line 138
    .line 139
    .line 140
    :cond_1
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 141
    .line 142
    const/4 v0, 0x3

    .line 143
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->mMediaCfgParams:Ll/brx;

    .line 144
    .line 145
    const/4 v3, 0x0

    .line 146
    invoke-interface {p1, v0, v3, v1}, Lcom/momo/pub/MomoPipelineModuleRegister;->r(IZLl/brx;)Ll/lvl;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 151
    .line 152
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableSwitchAudioTrack:Z

    .line 153
    .line 154
    if-eqz p1, :cond_2

    .line 155
    .line 156
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->openAudioTracks(Z)V

    .line 157
    .line 158
    .line 159
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mActiveAudioTrack:I

    .line 160
    .line 161
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setAudioTrackIndex(I)V

    .line 162
    .line 163
    .line 164
    :cond_2
    iget-object v4, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 165
    .line 166
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 167
    .line 168
    iget v5, p1, Ll/tow;->u:I

    .line 169
    .line 170
    iget v6, p1, Ll/tow;->v:I

    .line 171
    .line 172
    const/4 v9, 0x1

    .line 173
    move v7, v5

    .line 174
    move v8, v6

    .line 175
    invoke-interface/range {v4 .. v9}, Lcom/momo/pub/MomoPipelineModuleRegister;->u(IIIIZ)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mPlayerStateCallback:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 179
    .line 180
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setPlayerStateCallback(Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;)V

    .line 181
    .line 182
    .line 183
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudio_channe_frq:I

    .line 184
    .line 185
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudio_channe:I

    .line 186
    .line 187
    iget v1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudio_channe_layout:I

    .line 188
    .line 189
    invoke-virtual {p0, p1, v0, v1}, Lcom/immomo/ijkConferenceStreamer;->setExtAudioParameters(III)V

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 193
    .line 194
    invoke-interface {p1, p2}, Ll/pvl;->i(Ljava/lang/Object;)V

    .line 195
    .line 196
    .line 197
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 198
    .line 199
    iget-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->surroundMusicExt:Lcom/momo/piplinemomoext/input/audio/a;

    .line 200
    .line 201
    invoke-interface {p1, p2}, Ll/lvl;->y(Lcom/momo/piplinemomoext/input/audio/a;)V

    .line 202
    .line 203
    .line 204
    iput-boolean v3, p0, Lcom/immomo/ijkConferenceStreamer;->mSelectFileStop:Z

    .line 205
    .line 206
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 207
    .line 208
    if-eqz p1, :cond_3

    .line 209
    .line 210
    new-instance p2, Lcom/immomo/ijkConferenceStreamer$l;

    .line 211
    .line 212
    invoke-direct {p2, p0}, Lcom/immomo/ijkConferenceStreamer$l;-><init>(Lcom/immomo/ijkConferenceStreamer;)V

    .line 213
    .line 214
    .line 215
    invoke-interface {p1, p2}, Ll/l6m;->R(Ll/fb1;)V

    .line 216
    .line 217
    .line 218
    :cond_3
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    const-string p1, "startPreview: end"

    .line 223
    .line 224
    invoke-virtual {p0, v2, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    return-void
.end method

.method public startPreviewEx(ILjava/lang/Object;)V
    .locals 3

    .line 1
    iput-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mSurface:Ljava/lang/Object;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mHavaSelectCamera:Z

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-ne v0, v2, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->initFilterCoreParameters()V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 19
    .line 20
    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->v(Ll/ror;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 24
    .line 25
    invoke-interface {p1}, Ll/pvl;->K()V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 29
    .line 30
    invoke-interface {p1, p2}, Ll/pvl;->J(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    iput-boolean v1, p0, Lcom/immomo/ijkConferenceStreamer;->mPauseRending:Z

    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    if-nez p2, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 39
    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    iput-boolean v2, p0, Lcom/immomo/ijkConferenceStreamer;->mHavaSelectCamera:Z

    .line 44
    .line 45
    iput p1, p0, Lcom/immomo/ijkConferenceStreamer;->mCameraID:I

    .line 46
    .line 47
    invoke-direct {p0}, Lcom/immomo/ijkConferenceStreamer;->initFilterCoreParameters()V

    .line 48
    .line 49
    .line 50
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mCameraID:I

    .line 51
    .line 52
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrConfig:Ll/row;

    .line 53
    .line 54
    if-nez p1, :cond_2

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ll/row;->q(I)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    invoke-virtual {v0, v2}, Ll/row;->q(I)V

    .line 61
    .line 62
    .line 63
    :goto_0
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 64
    .line 65
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrConfig:Ll/row;

    .line 66
    .line 67
    new-instance v1, Ll/qv40;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/qv40;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-interface {p1, v0, v1}, Lcom/momo/pub/MomoPipelineModuleRegister;->E(Ll/row;Ll/jt2;)Ll/cql;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 77
    .line 78
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 79
    .line 80
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 81
    .line 82
    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->v(Ll/ror;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->warpType:Ljava/lang/Integer;

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setWarpType(Ljava/lang/Integer;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mFaceEyeScale:Ljava/lang/Float;

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setFaceEyeScale(Ljava/lang/Float;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mFaceThinScale:Ljava/lang/Float;

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setFaceThinScale(Ljava/lang/Float;)V

    .line 98
    .line 99
    .line 100
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->faceBeautiful:I

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setFaceBeautiful(I)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->isActiveSwitch:Ljava/lang/Boolean;

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setFaceExpressionDetectSwitch(Ljava/lang/Boolean;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 111
    .line 112
    invoke-interface {p1, v2}, Ll/cql;->T(Z)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 116
    .line 117
    invoke-interface {p1, p2}, Ll/pvl;->i(Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mBasicFilter:Ll/jt2;

    .line 121
    .line 122
    if-eqz p1, :cond_3

    .line 123
    .line 124
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->selectFilter(Ll/jt2;)V

    .line 125
    .line 126
    .line 127
    :cond_3
    :goto_1
    return-void
.end method

.method public startRecordFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/c4m;->y(Ljava/lang/String;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public startRecordWithNotJoinRoom()V
    .locals 1

    .line 690
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mMediaCfgParams:Ll/brx;

    invoke-virtual {p0, v0}, Lcom/immomo/ijkConferenceStreamer;->startRecordWithNotJoinRoom(Ll/brx;)V

    return-void
.end method

.method public startRecordWithNotJoinRoom(Ll/brx;)V
    .locals 10

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "zjlfound"

    .line 6
    .line 7
    const-string v2, "----startRecording"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mRecording:Z

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto/16 :goto_3

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Lcom/momo/pub/MomoPipelineModuleRegister;->y(Ll/ror;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 30
    .line 31
    invoke-interface {v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->L()Ll/usl;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->emptyInputPipline:Ll/usl;

    .line 36
    .line 37
    :cond_1
    const/4 v0, 0x0

    .line 38
    const/4 v1, 0x0

    .line 39
    const/4 v2, 0x1

    .line 40
    if-eqz p1, :cond_3

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/brx;->b()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-nez v3, :cond_3

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/brx;->f()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    invoke-virtual {p0, v3}, Lcom/immomo/ijkConferenceStreamer;->setBusinessType(I)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {p1}, Ll/brx;->b()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-virtual {v3, v4}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    if-eqz v3, :cond_2

    .line 72
    .line 73
    iget-object v4, v3, Ll/arx$d;->e:Ll/bsx;

    .line 74
    .line 75
    if-eqz v4, :cond_2

    .line 76
    .line 77
    iget v4, v4, Ll/bsx;->b:I

    .line 78
    .line 79
    if-nez v4, :cond_2

    .line 80
    .line 81
    move v4, v1

    .line 82
    goto :goto_1

    .line 83
    :cond_2
    :goto_0
    move v4, v2

    .line 84
    goto :goto_1

    .line 85
    :cond_3
    move-object v3, v0

    .line 86
    goto :goto_0

    .line 87
    :goto_1
    if-nez v4, :cond_4

    .line 88
    .line 89
    move-object p1, v0

    .line 90
    :cond_4
    iget v5, p0, Lcom/immomo/ijkConferenceStreamer;->mVenderID:I

    .line 91
    .line 92
    iget-object v6, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 93
    .line 94
    if-nez v5, :cond_7

    .line 95
    .line 96
    invoke-interface {v6, p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->P(Ll/brx;)Ll/zzl;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 101
    .line 102
    new-instance v0, Lcom/immomo/ijkConferenceStreamer$c;

    .line 103
    .line 104
    invoke-direct {v0, p0}, Lcom/immomo/ijkConferenceStreamer$c;-><init>(Lcom/immomo/ijkConferenceStreamer;)V

    .line 105
    .line 106
    .line 107
    invoke-interface {p1, v0}, Ll/l6m;->R(Ll/fb1;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 111
    .line 112
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mOnlyAudio:Z

    .line 113
    .line 114
    invoke-interface {p1, v0}, Ll/c4m;->u0(Z)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 118
    .line 119
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mBusinessType:I

    .line 120
    .line 121
    invoke-interface {p1, v0}, Ll/c4m;->T0(I)V

    .line 122
    .line 123
    .line 124
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mLocalAudioStreamMute:Z

    .line 125
    .line 126
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->muteLocalAudioStream(Z)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcAudioHandler:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 130
    .line 131
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcAudioHandler(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcAudioHandlerEx:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 135
    .line 136
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcAudioHandlerEx(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V

    .line 137
    .line 138
    .line 139
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mOutFileType:I

    .line 140
    .line 141
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mOutputFilePath:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {p0, p1, v0}, Lcom/immomo/ijkConferenceStreamer;->setStreamerType(ILjava/lang/String;)V

    .line 144
    .line 145
    .line 146
    if-eqz v4, :cond_6

    .line 147
    .line 148
    if-eqz v3, :cond_6

    .line 149
    .line 150
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-virtual {p1}, Ll/csx;->d0()I

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {v0}, Ll/csx;->e0()I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    iget-object v1, v3, Ll/arx$d;->e:Ll/bsx;

    .line 167
    .line 168
    if-eqz v1, :cond_5

    .line 169
    .line 170
    iget p1, v1, Ll/bsx;->l:I

    .line 171
    .line 172
    iget v0, v1, Ll/bsx;->k:I

    .line 173
    .line 174
    :cond_5
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 175
    .line 176
    new-instance v3, Ll/fpf0;

    .line 177
    .line 178
    invoke-direct {v3}, Ll/fpf0;-><init>()V

    .line 179
    .line 180
    .line 181
    invoke-interface {v1, p1, v0, v3}, Ll/c4m;->i(IILl/fpf0;)V

    .line 182
    .line 183
    .line 184
    :cond_6
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 185
    .line 186
    invoke-interface {p1}, Ll/c4m;->t0()I

    .line 187
    .line 188
    .line 189
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 190
    .line 191
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mLogReportInterval:I

    .line 192
    .line 193
    invoke-interface {p1, v0}, Ll/c4m;->t(I)V

    .line 194
    .line 195
    .line 196
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 197
    .line 198
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mLogReportCount:I

    .line 199
    .line 200
    invoke-interface {p1, v0}, Ll/c4m;->n(I)V

    .line 201
    .line 202
    .line 203
    goto/16 :goto_8

    .line 204
    .line 205
    :cond_7
    const/4 v7, 0x2

    .line 206
    const/4 v8, 0x4

    .line 207
    if-ne v5, v7, :cond_8

    .line 208
    .line 209
    sget-object v5, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->WEILALINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 210
    .line 211
    goto :goto_2

    .line 212
    :cond_8
    if-ne v5, v2, :cond_9

    .line 213
    .line 214
    sget-object v5, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->AGORALINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 215
    .line 216
    goto :goto_2

    .line 217
    :cond_9
    if-ne v5, v8, :cond_a

    .line 218
    .line 219
    sget-object v5, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->MOMORTCLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 220
    .line 221
    goto :goto_2

    .line 222
    :cond_a
    sget-object v5, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->TXLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 223
    .line 224
    :goto_2
    iget-object v9, p0, Lcom/immomo/ijkConferenceStreamer;->mAppID:Ljava/lang/String;

    .line 225
    .line 226
    invoke-interface {v6, v5, v9, p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->M(Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;Ljava/lang/String;Ll/brx;)Ll/hwl;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 231
    .line 232
    if-nez p1, :cond_b

    .line 233
    .line 234
    :goto_3
    return-void

    .line 235
    :cond_b
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->enableVbr:Z

    .line 236
    .line 237
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->enableVbr(Z)V

    .line 238
    .line 239
    .line 240
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 241
    .line 242
    iget-object v5, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoChannelListener:Ll/ebl0;

    .line 243
    .line 244
    invoke-interface {p1, v5}, Ll/hwl;->m0(Ll/ebl0;)V

    .line 245
    .line 246
    .line 247
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 248
    .line 249
    iget-object v5, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoTextureListener:Ll/gkl0;

    .line 250
    .line 251
    invoke-interface {p1, v5}, Ll/hwl;->r1(Ll/gkl0;)V

    .line 252
    .line 253
    .line 254
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRoomMode:I

    .line 255
    .line 256
    const/4 v5, -0x1

    .line 257
    if-eq p1, v5, :cond_c

    .line 258
    .line 259
    iget-object v6, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 260
    .line 261
    iget-boolean v9, p0, Lcom/immomo/ijkConferenceStreamer;->mUseServerAudioMixer:Z

    .line 262
    .line 263
    invoke-interface {v6, p1, v9}, Ll/hwl;->c1(IZ)V

    .line 264
    .line 265
    .line 266
    :cond_c
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 267
    .line 268
    iget v6, p0, Lcom/immomo/ijkConferenceStreamer;->mLogReportInterval:I

    .line 269
    .line 270
    invoke-interface {p1, v6}, Ll/c4m;->t(I)V

    .line 271
    .line 272
    .line 273
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 274
    .line 275
    iget v6, p0, Lcom/immomo/ijkConferenceStreamer;->mLogReportCount:I

    .line 276
    .line 277
    invoke-interface {p1, v6}, Ll/c4m;->n(I)V

    .line 278
    .line 279
    .line 280
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 281
    .line 282
    iget-boolean v6, p0, Lcom/immomo/ijkConferenceStreamer;->mOnlyAudio:Z

    .line 283
    .line 284
    invoke-interface {p1, v6}, Ll/c4m;->u0(Z)V

    .line 285
    .line 286
    .line 287
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 288
    .line 289
    iget v6, p0, Lcom/immomo/ijkConferenceStreamer;->mAvFlag:I

    .line 290
    .line 291
    invoke-interface {p1, v6}, Ll/c4m;->t1(I)V

    .line 292
    .line 293
    .line 294
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 295
    .line 296
    iget v6, p0, Lcom/immomo/ijkConferenceStreamer;->mBusinessType:I

    .line 297
    .line 298
    invoke-interface {p1, v6}, Ll/c4m;->T0(I)V

    .line 299
    .line 300
    .line 301
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mClientRole:I

    .line 302
    .line 303
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setRole(I)V

    .line 304
    .line 305
    .line 306
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableExternStream:Z

    .line 307
    .line 308
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->enableExternStream(Z)V

    .line 309
    .line 310
    .line 311
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mCommMode:Z

    .line 312
    .line 313
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->enableCommMode(Z)V

    .line 314
    .line 315
    .line 316
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mChannelkey:Ljava/lang/String;

    .line 317
    .line 318
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setChannelkey(Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEncryptionSecret:Ljava/lang/String;

    .line 322
    .line 323
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setEncryptionSecret(Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEncryptionMode:Ljava/lang/String;

    .line 327
    .line 328
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setEncryptionMode(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcAudioHandler:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 332
    .line 333
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcAudioHandler(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 334
    .line 335
    .line 336
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcAudioHandlerEx:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 337
    .line 338
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcAudioHandlerEx(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V

    .line 339
    .line 340
    .line 341
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAllRemoteAudioStream:Z

    .line 342
    .line 343
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->muteAllRemoteAudioStream(Z)V

    .line 344
    .line 345
    .line 346
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mLocalAudioStreamMute:Z

    .line 347
    .line 348
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->muteLocalAudioStreamEx(Z)V

    .line 349
    .line 350
    .line 351
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mLocalVideoStreamMute:Z

    .line 352
    .line 353
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->muteLocalVideoStream(Z)V

    .line 354
    .line 355
    .line 356
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcEventHandler:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 357
    .line 358
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addEventHandler(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

    .line 359
    .line 360
    .line 361
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcConnectHandler:Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

    .line 362
    .line 363
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcConnectHandler(Lcom/immomo/mediacore/coninf/MRtcConnectHandler;)V

    .line 364
    .line 365
    .line 366
    invoke-virtual {p0, v0}, Lcom/immomo/ijkConferenceStreamer;->addMRtcVideoLossHandler(Ll/zpw;)V

    .line 367
    .line 368
    .line 369
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcChannelHandler:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 370
    .line 371
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcChannelHandler(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V

    .line 372
    .line 373
    .line 374
    invoke-virtual {p0, v0}, Lcom/immomo/ijkConferenceStreamer;->addMRtcStatsUpdataHandle(Ll/ypw;)V

    .line 375
    .line 376
    .line 377
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcLRemoteStatsUpdataHandle:Ll/wpw;

    .line 378
    .line 379
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcLRemoteStatsUpdataHandle(Ll/wpw;)V

    .line 380
    .line 381
    .line 382
    invoke-virtual {p0, v0}, Lcom/immomo/ijkConferenceStreamer;->addMRtcAudioStatsUpdataHandler(Ll/vpw;)V

    .line 383
    .line 384
    .line 385
    invoke-virtual {p0, v0}, Lcom/immomo/ijkConferenceStreamer;->addMRtcAnchorStatusHandle(Ll/upw;)V

    .line 386
    .line 387
    .line 388
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcQualityHandler:Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 389
    .line 390
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcQualityHandler(Lcom/immomo/mediacore/coninf/MRtcQualityHandler;)V

    .line 391
    .line 392
    .line 393
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcSurroundMusicHander:Lcom/immomo/mediacore/coninf/MRtcSurroundMusicHander;

    .line 394
    .line 395
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcSurroundMusicHander(Lcom/immomo/mediacore/coninf/MRtcSurroundMusicHander;)V

    .line 396
    .line 397
    .line 398
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcExitRoomHandler:Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;

    .line 399
    .line 400
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addExitRoomHandler(Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;)V

    .line 401
    .line 402
    .line 403
    iput v5, p0, Lcom/immomo/ijkConferenceStreamer;->mRoomMode:I

    .line 404
    .line 405
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfileStatus:Z

    .line 406
    .line 407
    if-nez p1, :cond_11

    .line 408
    .line 409
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mVenderID:I

    .line 410
    .line 411
    if-ne p1, v2, :cond_e

    .line 412
    .line 413
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioHighQualityFlg:Z

    .line 414
    .line 415
    if-eqz p1, :cond_d

    .line 416
    .line 417
    iput v8, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 418
    .line 419
    iput v1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 420
    .line 421
    goto :goto_5

    .line 422
    :cond_d
    iput v1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 423
    .line 424
    iput v1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 425
    .line 426
    goto :goto_5

    .line 427
    :cond_e
    if-ne p1, v7, :cond_10

    .line 428
    .line 429
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioHighQualityFlg:Z

    .line 430
    .line 431
    if-eqz p1, :cond_f

    .line 432
    .line 433
    iput v8, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 434
    .line 435
    goto :goto_4

    .line 436
    :cond_f
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 437
    .line 438
    :goto_4
    iput v1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 439
    .line 440
    :cond_10
    :goto_5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 441
    .line 442
    .line 443
    move-result-object p1

    .line 444
    new-instance v0, Ljava/lang/StringBuilder;

    .line 445
    .line 446
    const-string v6, "----startRecording:Audio Profile:"

    .line 447
    .line 448
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 449
    .line 450
    .line 451
    iget v6, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 452
    .line 453
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 454
    .line 455
    .line 456
    const-string v6, "/"

    .line 457
    .line 458
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 459
    .line 460
    .line 461
    iget v6, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 462
    .line 463
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    const-string v6, ","

    .line 467
    .line 468
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    iget v7, p0, Lcom/immomo/ijkConferenceStreamer;->mVenderID:I

    .line 472
    .line 473
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 474
    .line 475
    .line 476
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 477
    .line 478
    .line 479
    iget-boolean v7, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioHighQualityFlg:Z

    .line 480
    .line 481
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 482
    .line 483
    .line 484
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 485
    .line 486
    .line 487
    iget-boolean v6, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfileStatus:Z

    .line 488
    .line 489
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 490
    .line 491
    .line 492
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 493
    .line 494
    .line 495
    move-result-object v0

    .line 496
    const-string v6, "newAudio"

    .line 497
    .line 498
    invoke-virtual {p1, v6, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    .line 500
    .line 501
    :cond_11
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 502
    .line 503
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 504
    .line 505
    invoke-virtual {p0, p1, v0}, Lcom/immomo/ijkConferenceStreamer;->setAudioProfile(II)V

    .line 506
    .line 507
    .line 508
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoQualityFlg:Z

    .line 509
    .line 510
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setVideoQualityParameters(Z)V

    .line 511
    .line 512
    .line 513
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mConfParameters:Ljava/util/List;

    .line 514
    .line 515
    invoke-direct {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setParameters_i(Ljava/util/List;)V

    .line 516
    .line 517
    .line 518
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 519
    .line 520
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mDefaultAudioRoutetoSpeakerphone:Z

    .line 521
    .line 522
    invoke-interface {p1, v0}, Ll/hwl;->D0(Z)V

    .line 523
    .line 524
    .line 525
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableAudio:Z

    .line 526
    .line 527
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->enableAudio(Z)V

    .line 528
    .line 529
    .line 530
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableVideo:Z

    .line 531
    .line 532
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->enableVideo(Z)V

    .line 533
    .line 534
    .line 535
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRoom24hMode:Z

    .line 536
    .line 537
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setRoom24hMode(Z)V

    .line 538
    .line 539
    .line 540
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogEnable:Z

    .line 541
    .line 542
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogPath:Ljava/lang/String;

    .line 543
    .line 544
    invoke-virtual {p0, p1, v0}, Lcom/immomo/ijkConferenceStreamer;->enableConfLog(ZLjava/lang/String;)V

    .line 545
    .line 546
    .line 547
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableMulPusherInRoom:Z

    .line 548
    .line 549
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->enableMulPusherInRoom(Z)V

    .line 550
    .line 551
    .line 552
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mBackgroundImgUrl:Ljava/lang/String;

    .line 553
    .line 554
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setVideoMixerBackgroundImgUrl(Ljava/lang/String;)V

    .line 555
    .line 556
    .line 557
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRecordPcmDataCallback:Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;

    .line 558
    .line 559
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setRecordPcmDataCallback(Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;)V

    .line 560
    .line 561
    .line 562
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioRoteoverrideDefault:I

    .line 563
    .line 564
    if-ne p1, v2, :cond_12

    .line 565
    .line 566
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mUsingVoip:Z

    .line 567
    .line 568
    invoke-virtual {p0, v2, p1}, Lcom/immomo/ijkConferenceStreamer;->setForceChangeAudioRouter(ZZ)V

    .line 569
    .line 570
    .line 571
    goto :goto_6

    .line 572
    :cond_12
    if-nez p1, :cond_13

    .line 573
    .line 574
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mUsingVoip:Z

    .line 575
    .line 576
    invoke-virtual {p0, v1, p1}, Lcom/immomo/ijkConferenceStreamer;->setForceChangeAudioRouter(ZZ)V

    .line 577
    .line 578
    .line 579
    :cond_13
    :goto_6
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableWebSdkInteroperability:I

    .line 580
    .line 581
    if-eq p1, v5, :cond_15

    .line 582
    .line 583
    if-ne p1, v2, :cond_14

    .line 584
    .line 585
    move p1, v2

    .line 586
    goto :goto_7

    .line 587
    :cond_14
    move p1, v1

    .line 588
    :goto_7
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->enableWebSdkInteroperability(Z)V

    .line 589
    .line 590
    .line 591
    :cond_15
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mNsmode:I

    .line 592
    .line 593
    if-lez p1, :cond_16

    .line 594
    .line 595
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mNsStatus:Z

    .line 596
    .line 597
    invoke-virtual {p0, v0, p1}, Lcom/immomo/ijkConferenceStreamer;->setNsStatus(ZI)V

    .line 598
    .line 599
    .line 600
    :cond_16
    if-eqz v4, :cond_18

    .line 601
    .line 602
    if-eqz v3, :cond_18

    .line 603
    .line 604
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 605
    .line 606
    .line 607
    move-result-object p1

    .line 608
    invoke-virtual {p1}, Ll/csx;->d0()I

    .line 609
    .line 610
    .line 611
    move-result p1

    .line 612
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 613
    .line 614
    .line 615
    move-result-object v0

    .line 616
    invoke-virtual {v0}, Ll/csx;->e0()I

    .line 617
    .line 618
    .line 619
    move-result v0

    .line 620
    iget-object v3, v3, Ll/arx$d;->e:Ll/bsx;

    .line 621
    .line 622
    if-eqz v3, :cond_17

    .line 623
    .line 624
    iget p1, v3, Ll/bsx;->l:I

    .line 625
    .line 626
    iget v0, v3, Ll/bsx;->k:I

    .line 627
    .line 628
    :cond_17
    iget-object v3, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 629
    .line 630
    new-instance v4, Ll/fpf0;

    .line 631
    .line 632
    invoke-direct {v4}, Ll/fpf0;-><init>()V

    .line 633
    .line 634
    .line 635
    invoke-interface {v3, p1, v0, v4}, Ll/c4m;->i(IILl/fpf0;)V

    .line 636
    .line 637
    .line 638
    :cond_18
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 639
    .line 640
    .line 641
    move-result-object p1

    .line 642
    invoke-virtual {p1, v1}, Ll/csx;->a1(I)V

    .line 643
    .line 644
    .line 645
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 646
    .line 647
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->enableAudioStrero:Z

    .line 648
    .line 649
    invoke-interface {p1, v0}, Ll/hwl;->S(Z)V

    .line 650
    .line 651
    .line 652
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 653
    .line 654
    invoke-interface {p1}, Ll/c4m;->k0()V

    .line 655
    .line 656
    .line 657
    :goto_8
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mSlaveAudioLevel:F

    .line 658
    .line 659
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setSlaveAudioLevel(F)V

    .line 660
    .line 661
    .line 662
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mMasterAudioLevel:F

    .line 663
    .line 664
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setMasterAudioLevel(F)V

    .line 665
    .line 666
    .line 667
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mVoicebackwardsEnable:Z

    .line 668
    .line 669
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setVoicebackwardsEnable(Z)V

    .line 670
    .line 671
    .line 672
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mIgnoreMonitor:Z

    .line 673
    .line 674
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->ignoreMonitor(Z)V

    .line 675
    .line 676
    .line 677
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mCusZoomFlag:Z

    .line 678
    .line 679
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setCustZoomFlag(Z)V

    .line 680
    .line 681
    .line 682
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mPcmDateCallback:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 683
    .line 684
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setPcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V

    .line 685
    .line 686
    .line 687
    iput-boolean v2, p0, Lcom/immomo/ijkConferenceStreamer;->mRecording:Z

    .line 688
    .line 689
    return-void
.end method

.method public startRecording()V
    .locals 1

    .line 714
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mMediaCfgParams:Ll/brx;

    invoke-virtual {p0, v0}, Lcom/immomo/ijkConferenceStreamer;->startRecording(Ll/brx;)V

    return-void
.end method

.method public declared-synchronized startRecording(Ll/brx;)V
    .locals 11

    .line 1
    const-string v0, "----startRecording:Audio Profile:"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const-string v2, "zjlfound"

    .line 9
    .line 10
    const-string v3, "----startRecording"

    .line 11
    .line 12
    invoke-virtual {v1, v2, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-boolean v1, p0, Lcom/immomo/ijkConferenceStreamer;->mRecording:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :cond_0
    const/4 v1, 0x0

    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, 0x1

    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    :try_start_1
    invoke-virtual {p1}, Ll/brx;->b()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-nez v4, :cond_2

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/brx;->f()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    invoke-virtual {p0, v4}, Lcom/immomo/ijkConferenceStreamer;->setBusinessType(I)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-virtual {p1}, Ll/brx;->b()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-virtual {v4, v5}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    if-eqz v4, :cond_1

    .line 56
    .line 57
    iget-object v5, v4, Ll/arx$d;->e:Ll/bsx;

    .line 58
    .line 59
    if-eqz v5, :cond_1

    .line 60
    .line 61
    iget v5, v5, Ll/bsx;->b:I

    .line 62
    .line 63
    if-nez v5, :cond_1

    .line 64
    .line 65
    move v5, v2

    .line 66
    goto :goto_1

    .line 67
    :catchall_0
    move-exception p1

    .line 68
    goto/16 :goto_8

    .line 69
    .line 70
    :cond_1
    :goto_0
    move v5, v3

    .line 71
    goto :goto_1

    .line 72
    :cond_2
    move-object v4, v1

    .line 73
    goto :goto_0

    .line 74
    :goto_1
    if-nez v5, :cond_3

    .line 75
    .line 76
    move-object p1, v1

    .line 77
    :cond_3
    iget-object v6, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 78
    .line 79
    iget-object v7, p0, Lcom/immomo/ijkConferenceStreamer;->mrCodecParameters:Ll/ror;

    .line 80
    .line 81
    invoke-interface {v6, v7}, Lcom/momo/pub/MomoPipelineModuleRegister;->y(Ll/ror;)V

    .line 82
    .line 83
    .line 84
    iget-object v6, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 85
    .line 86
    if-nez v6, :cond_4

    .line 87
    .line 88
    iget-object v6, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 89
    .line 90
    invoke-interface {v6}, Lcom/momo/pub/MomoPipelineModuleRegister;->L()Ll/usl;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    iput-object v6, p0, Lcom/immomo/ijkConferenceStreamer;->emptyInputPipline:Ll/usl;

    .line 95
    .line 96
    :cond_4
    iget v6, p0, Lcom/immomo/ijkConferenceStreamer;->mVenderID:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    .line 98
    iget-object v7, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 99
    .line 100
    if-nez v6, :cond_7

    .line 101
    .line 102
    :try_start_2
    invoke-interface {v7, p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->P(Ll/brx;)Ll/zzl;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 107
    .line 108
    new-instance v0, Lcom/immomo/ijkConferenceStreamer$b;

    .line 109
    .line 110
    invoke-direct {v0, p0}, Lcom/immomo/ijkConferenceStreamer$b;-><init>(Lcom/immomo/ijkConferenceStreamer;)V

    .line 111
    .line 112
    .line 113
    invoke-interface {p1, v0}, Ll/l6m;->R(Ll/fb1;)V

    .line 114
    .line 115
    .line 116
    if-eqz v5, :cond_6

    .line 117
    .line 118
    if-eqz v4, :cond_6

    .line 119
    .line 120
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1}, Ll/csx;->d0()I

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v0}, Ll/csx;->e0()I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    iget-object v1, v4, Ll/arx$d;->e:Ll/bsx;

    .line 137
    .line 138
    if-eqz v1, :cond_5

    .line 139
    .line 140
    iget p1, v1, Ll/bsx;->l:I

    .line 141
    .line 142
    iget v0, v1, Ll/bsx;->k:I

    .line 143
    .line 144
    :cond_5
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 145
    .line 146
    new-instance v2, Ll/fpf0;

    .line 147
    .line 148
    invoke-direct {v2}, Ll/fpf0;-><init>()V

    .line 149
    .line 150
    .line 151
    invoke-interface {v1, p1, v0, v2}, Ll/c4m;->i(IILl/fpf0;)V

    .line 152
    .line 153
    .line 154
    :cond_6
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 155
    .line 156
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mOnlyAudio:Z

    .line 157
    .line 158
    invoke-interface {p1, v0}, Ll/c4m;->u0(Z)V

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 162
    .line 163
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mBusinessType:I

    .line 164
    .line 165
    invoke-interface {p1, v0}, Ll/c4m;->T0(I)V

    .line 166
    .line 167
    .line 168
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mLocalAudioStreamMute:Z

    .line 169
    .line 170
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->muteLocalAudioStream(Z)V

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcAudioHandler:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 174
    .line 175
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcAudioHandler(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcAudioHandlerEx:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 179
    .line 180
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcAudioHandlerEx(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V

    .line 181
    .line 182
    .line 183
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mOutFileType:I

    .line 184
    .line 185
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mOutputFilePath:Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {p0, p1, v0}, Lcom/immomo/ijkConferenceStreamer;->setStreamerType(ILjava/lang/String;)V

    .line 188
    .line 189
    .line 190
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 191
    .line 192
    invoke-interface {p1}, Ll/c4m;->t0()I

    .line 193
    .line 194
    .line 195
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 196
    .line 197
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mLogReportInterval:I

    .line 198
    .line 199
    invoke-interface {p1, v0}, Ll/c4m;->t(I)V

    .line 200
    .line 201
    .line 202
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 203
    .line 204
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mLogReportCount:I

    .line 205
    .line 206
    invoke-interface {p1, v0}, Ll/c4m;->n(I)V

    .line 207
    .line 208
    .line 209
    goto/16 :goto_7

    .line 210
    .line 211
    :cond_7
    const/4 v8, 0x2

    .line 212
    const/4 v9, 0x4

    .line 213
    if-ne v6, v8, :cond_8

    .line 214
    .line 215
    sget-object v6, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->WEILALINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 216
    .line 217
    goto :goto_2

    .line 218
    :cond_8
    if-ne v6, v3, :cond_9

    .line 219
    .line 220
    sget-object v6, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->AGORALINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 221
    .line 222
    goto :goto_2

    .line 223
    :cond_9
    if-ne v6, v9, :cond_a

    .line 224
    .line 225
    sget-object v6, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->MOMORTCLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 226
    .line 227
    goto :goto_2

    .line 228
    :cond_a
    sget-object v6, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->TXLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 229
    .line 230
    :goto_2
    iget-object v10, p0, Lcom/immomo/ijkConferenceStreamer;->mAppID:Ljava/lang/String;

    .line 231
    .line 232
    invoke-interface {v7, v6, v10, p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->M(Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;Ljava/lang/String;Ll/brx;)Ll/hwl;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 237
    .line 238
    if-nez p1, :cond_b

    .line 239
    .line 240
    monitor-exit p0

    .line 241
    return-void

    .line 242
    :cond_b
    :try_start_3
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->enableVbr:Z

    .line 243
    .line 244
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->enableVbr(Z)V

    .line 245
    .line 246
    .line 247
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 248
    .line 249
    iget-object v6, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoChannelListener:Ll/ebl0;

    .line 250
    .line 251
    invoke-interface {p1, v6}, Ll/hwl;->m0(Ll/ebl0;)V

    .line 252
    .line 253
    .line 254
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 255
    .line 256
    iget-object v6, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoTextureListener:Ll/gkl0;

    .line 257
    .line 258
    invoke-interface {p1, v6}, Ll/hwl;->r1(Ll/gkl0;)V

    .line 259
    .line 260
    .line 261
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 262
    .line 263
    iget-object v6, p0, Lcom/immomo/ijkConferenceStreamer;->mTextureViewListener:Ll/gbl0;

    .line 264
    .line 265
    invoke-interface {p1, v6}, Ll/hwl;->P0(Ll/gbl0;)V

    .line 266
    .line 267
    .line 268
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 269
    .line 270
    invoke-interface {p1, v1}, Ll/hwl;->M1(Ll/hwl$a;)V

    .line 271
    .line 272
    .line 273
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRoomMode:I

    .line 274
    .line 275
    const/4 v6, -0x1

    .line 276
    if-eq p1, v6, :cond_c

    .line 277
    .line 278
    iget-object v7, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 279
    .line 280
    iget-boolean v10, p0, Lcom/immomo/ijkConferenceStreamer;->mUseServerAudioMixer:Z

    .line 281
    .line 282
    invoke-interface {v7, p1, v10}, Ll/hwl;->c1(IZ)V

    .line 283
    .line 284
    .line 285
    :cond_c
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 286
    .line 287
    iget v7, p0, Lcom/immomo/ijkConferenceStreamer;->mLogReportInterval:I

    .line 288
    .line 289
    invoke-interface {p1, v7}, Ll/c4m;->t(I)V

    .line 290
    .line 291
    .line 292
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 293
    .line 294
    iget v7, p0, Lcom/immomo/ijkConferenceStreamer;->mLogReportCount:I

    .line 295
    .line 296
    invoke-interface {p1, v7}, Ll/c4m;->n(I)V

    .line 297
    .line 298
    .line 299
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 300
    .line 301
    iget-boolean v7, p0, Lcom/immomo/ijkConferenceStreamer;->mOnlyAudio:Z

    .line 302
    .line 303
    invoke-interface {p1, v7}, Ll/c4m;->u0(Z)V

    .line 304
    .line 305
    .line 306
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 307
    .line 308
    iget v7, p0, Lcom/immomo/ijkConferenceStreamer;->mAvFlag:I

    .line 309
    .line 310
    invoke-interface {p1, v7}, Ll/c4m;->t1(I)V

    .line 311
    .line 312
    .line 313
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 314
    .line 315
    iget v7, p0, Lcom/immomo/ijkConferenceStreamer;->mBusinessType:I

    .line 316
    .line 317
    invoke-interface {p1, v7}, Ll/c4m;->T0(I)V

    .line 318
    .line 319
    .line 320
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mClientRole:I

    .line 321
    .line 322
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setRole(I)V

    .line 323
    .line 324
    .line 325
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableExternStream:Z

    .line 326
    .line 327
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->enableExternStream(Z)V

    .line 328
    .line 329
    .line 330
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mCommMode:Z

    .line 331
    .line 332
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->enableCommMode(Z)V

    .line 333
    .line 334
    .line 335
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mChannelkey:Ljava/lang/String;

    .line 336
    .line 337
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setChannelkey(Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEncryptionSecret:Ljava/lang/String;

    .line 341
    .line 342
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setEncryptionSecret(Ljava/lang/String;)V

    .line 343
    .line 344
    .line 345
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEncryptionMode:Ljava/lang/String;

    .line 346
    .line 347
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setEncryptionMode(Ljava/lang/String;)V

    .line 348
    .line 349
    .line 350
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcAudioHandler:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 351
    .line 352
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcAudioHandler(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 353
    .line 354
    .line 355
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcAudioHandlerEx:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 356
    .line 357
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcAudioHandlerEx(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V

    .line 358
    .line 359
    .line 360
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAllRemoteAudioStream:Z

    .line 361
    .line 362
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->muteAllRemoteAudioStream(Z)V

    .line 363
    .line 364
    .line 365
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mLocalAudioStreamMute:Z

    .line 366
    .line 367
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->muteLocalAudioStreamEx(Z)V

    .line 368
    .line 369
    .line 370
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mLocalVideoStreamMute:Z

    .line 371
    .line 372
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->muteLocalVideoStream(Z)V

    .line 373
    .line 374
    .line 375
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcEventHandler:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 376
    .line 377
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addEventHandler(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

    .line 378
    .line 379
    .line 380
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcConnectHandler:Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

    .line 381
    .line 382
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcConnectHandler(Lcom/immomo/mediacore/coninf/MRtcConnectHandler;)V

    .line 383
    .line 384
    .line 385
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcEventHandlerAdapter:Ll/kod0;

    .line 386
    .line 387
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setRtcEventHandlerAdapter(Ll/kod0;)V

    .line 388
    .line 389
    .line 390
    invoke-virtual {p0, v1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcVideoLossHandler(Ll/zpw;)V

    .line 391
    .line 392
    .line 393
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcChannelHandler:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 394
    .line 395
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcChannelHandler(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V

    .line 396
    .line 397
    .line 398
    invoke-virtual {p0, v1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcStatsUpdataHandle(Ll/ypw;)V

    .line 399
    .line 400
    .line 401
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcLRemoteStatsUpdataHandle:Ll/wpw;

    .line 402
    .line 403
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcLRemoteStatsUpdataHandle(Ll/wpw;)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {p0, v1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcAudioStatsUpdataHandler(Ll/vpw;)V

    .line 407
    .line 408
    .line 409
    invoke-virtual {p0, v1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcAnchorStatusHandle(Ll/upw;)V

    .line 410
    .line 411
    .line 412
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcQualityHandler:Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 413
    .line 414
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcQualityHandler(Lcom/immomo/mediacore/coninf/MRtcQualityHandler;)V

    .line 415
    .line 416
    .line 417
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRtcSurroundMusicHander:Lcom/immomo/mediacore/coninf/MRtcSurroundMusicHander;

    .line 418
    .line 419
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->addMRtcSurroundMusicHander(Lcom/immomo/mediacore/coninf/MRtcSurroundMusicHander;)V

    .line 420
    .line 421
    .line 422
    iput v6, p0, Lcom/immomo/ijkConferenceStreamer;->mRoomMode:I

    .line 423
    .line 424
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfileStatus:Z

    .line 425
    .line 426
    if-nez p1, :cond_11

    .line 427
    .line 428
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mVenderID:I

    .line 429
    .line 430
    if-ne p1, v3, :cond_e

    .line 431
    .line 432
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioHighQualityFlg:Z

    .line 433
    .line 434
    if-eqz p1, :cond_d

    .line 435
    .line 436
    iput v9, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 437
    .line 438
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 439
    .line 440
    goto :goto_4

    .line 441
    :cond_d
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 442
    .line 443
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 444
    .line 445
    goto :goto_4

    .line 446
    :cond_e
    if-ne p1, v8, :cond_10

    .line 447
    .line 448
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioHighQualityFlg:Z

    .line 449
    .line 450
    if-eqz p1, :cond_f

    .line 451
    .line 452
    iput v9, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 453
    .line 454
    goto :goto_3

    .line 455
    :cond_f
    iput v3, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 456
    .line 457
    :goto_3
    iput v2, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 458
    .line 459
    :cond_10
    :goto_4
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 460
    .line 461
    .line 462
    move-result-object p1

    .line 463
    const-string v1, "newAudio"

    .line 464
    .line 465
    new-instance v7, Ljava/lang/StringBuilder;

    .line 466
    .line 467
    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 468
    .line 469
    .line 470
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 471
    .line 472
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 473
    .line 474
    .line 475
    const-string v0, "/"

    .line 476
    .line 477
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 478
    .line 479
    .line 480
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 481
    .line 482
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 483
    .line 484
    .line 485
    const-string v0, ","

    .line 486
    .line 487
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 488
    .line 489
    .line 490
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mVenderID:I

    .line 491
    .line 492
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 493
    .line 494
    .line 495
    const-string v0, ","

    .line 496
    .line 497
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 498
    .line 499
    .line 500
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioHighQualityFlg:Z

    .line 501
    .line 502
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 503
    .line 504
    .line 505
    const-string v0, ","

    .line 506
    .line 507
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 508
    .line 509
    .line 510
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfileStatus:Z

    .line 511
    .line 512
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 513
    .line 514
    .line 515
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 516
    .line 517
    .line 518
    move-result-object v0

    .line 519
    invoke-virtual {p1, v1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 520
    .line 521
    .line 522
    :cond_11
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioProfile:I

    .line 523
    .line 524
    iget v0, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioScenario:I

    .line 525
    .line 526
    invoke-virtual {p0, p1, v0}, Lcom/immomo/ijkConferenceStreamer;->setAudioProfile(II)V

    .line 527
    .line 528
    .line 529
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mVideoQualityFlg:Z

    .line 530
    .line 531
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setVideoQualityParameters(Z)V

    .line 532
    .line 533
    .line 534
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mConfParameters:Ljava/util/List;

    .line 535
    .line 536
    invoke-direct {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setParameters_i(Ljava/util/List;)V

    .line 537
    .line 538
    .line 539
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 540
    .line 541
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mDefaultAudioRoutetoSpeakerphone:Z

    .line 542
    .line 543
    invoke-interface {p1, v0}, Ll/hwl;->D0(Z)V

    .line 544
    .line 545
    .line 546
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableAudio:Z

    .line 547
    .line 548
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->enableAudio(Z)V

    .line 549
    .line 550
    .line 551
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableVideo:Z

    .line 552
    .line 553
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->enableVideo(Z)V

    .line 554
    .line 555
    .line 556
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRoom24hMode:Z

    .line 557
    .line 558
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setRoom24hMode(Z)V

    .line 559
    .line 560
    .line 561
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogEnable:Z

    .line 562
    .line 563
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mLinkMicLogPath:Ljava/lang/String;

    .line 564
    .line 565
    invoke-virtual {p0, p1, v0}, Lcom/immomo/ijkConferenceStreamer;->enableConfLog(ZLjava/lang/String;)V

    .line 566
    .line 567
    .line 568
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableMulPusherInRoom:Z

    .line 569
    .line 570
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->enableMulPusherInRoom(Z)V

    .line 571
    .line 572
    .line 573
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mBackgroundImgUrl:Ljava/lang/String;

    .line 574
    .line 575
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setVideoMixerBackgroundImgUrl(Ljava/lang/String;)V

    .line 576
    .line 577
    .line 578
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mRecordPcmDataCallback:Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;

    .line 579
    .line 580
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setRecordPcmDataCallback(Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;)V

    .line 581
    .line 582
    .line 583
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mAudioRoteoverrideDefault:I

    .line 584
    .line 585
    if-ne p1, v3, :cond_12

    .line 586
    .line 587
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mUsingVoip:Z

    .line 588
    .line 589
    invoke-virtual {p0, v3, p1}, Lcom/immomo/ijkConferenceStreamer;->setForceChangeAudioRouter(ZZ)V

    .line 590
    .line 591
    .line 592
    goto :goto_5

    .line 593
    :cond_12
    if-nez p1, :cond_13

    .line 594
    .line 595
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mUsingVoip:Z

    .line 596
    .line 597
    invoke-virtual {p0, v2, p1}, Lcom/immomo/ijkConferenceStreamer;->setForceChangeAudioRouter(ZZ)V

    .line 598
    .line 599
    .line 600
    :cond_13
    :goto_5
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mEnableWebSdkInteroperability:I

    .line 601
    .line 602
    if-eq p1, v6, :cond_15

    .line 603
    .line 604
    if-ne p1, v3, :cond_14

    .line 605
    .line 606
    move p1, v3

    .line 607
    goto :goto_6

    .line 608
    :cond_14
    move p1, v2

    .line 609
    :goto_6
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->enableWebSdkInteroperability(Z)V

    .line 610
    .line 611
    .line 612
    :cond_15
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mNsmode:I

    .line 613
    .line 614
    if-lez p1, :cond_16

    .line 615
    .line 616
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mNsStatus:Z

    .line 617
    .line 618
    invoke-virtual {p0, v0, p1}, Lcom/immomo/ijkConferenceStreamer;->setNsStatus(ZI)V

    .line 619
    .line 620
    .line 621
    :cond_16
    if-eqz v5, :cond_18

    .line 622
    .line 623
    if-eqz v4, :cond_18

    .line 624
    .line 625
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 626
    .line 627
    .line 628
    move-result-object p1

    .line 629
    invoke-virtual {p1}, Ll/csx;->d0()I

    .line 630
    .line 631
    .line 632
    move-result p1

    .line 633
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 634
    .line 635
    .line 636
    move-result-object v0

    .line 637
    invoke-virtual {v0}, Ll/csx;->e0()I

    .line 638
    .line 639
    .line 640
    move-result v0

    .line 641
    iget-object v1, v4, Ll/arx$d;->e:Ll/bsx;

    .line 642
    .line 643
    if-eqz v1, :cond_17

    .line 644
    .line 645
    iget p1, v1, Ll/bsx;->l:I

    .line 646
    .line 647
    iget v0, v1, Ll/bsx;->k:I

    .line 648
    .line 649
    :cond_17
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 650
    .line 651
    new-instance v4, Ll/fpf0;

    .line 652
    .line 653
    invoke-direct {v4}, Ll/fpf0;-><init>()V

    .line 654
    .line 655
    .line 656
    invoke-interface {v1, p1, v0, v4}, Ll/c4m;->i(IILl/fpf0;)V

    .line 657
    .line 658
    .line 659
    :cond_18
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 660
    .line 661
    .line 662
    move-result-object p1

    .line 663
    invoke-virtual {p1, v2}, Ll/csx;->a1(I)V

    .line 664
    .line 665
    .line 666
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 667
    .line 668
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->enableAudioStrero:Z

    .line 669
    .line 670
    invoke-interface {p1, v0}, Ll/hwl;->S(Z)V

    .line 671
    .line 672
    .line 673
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 674
    .line 675
    invoke-interface {p1}, Ll/c4m;->t0()I

    .line 676
    .line 677
    .line 678
    :goto_7
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mSlaveAudioLevel:F

    .line 679
    .line 680
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setSlaveAudioLevel(F)V

    .line 681
    .line 682
    .line 683
    iget p1, p0, Lcom/immomo/ijkConferenceStreamer;->mMasterAudioLevel:F

    .line 684
    .line 685
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setMasterAudioLevel(F)V

    .line 686
    .line 687
    .line 688
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mVoicebackwardsEnable:Z

    .line 689
    .line 690
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setVoicebackwardsEnable(Z)V

    .line 691
    .line 692
    .line 693
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mIgnoreMonitor:Z

    .line 694
    .line 695
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->ignoreMonitor(Z)V

    .line 696
    .line 697
    .line 698
    iget-boolean p1, p0, Lcom/immomo/ijkConferenceStreamer;->mCusZoomFlag:Z

    .line 699
    .line 700
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setCustZoomFlag(Z)V

    .line 701
    .line 702
    .line 703
    iget-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mPcmDateCallback:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 704
    .line 705
    invoke-virtual {p0, p1}, Lcom/immomo/ijkConferenceStreamer;->setPcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V

    .line 706
    .line 707
    .line 708
    iput-boolean v3, p0, Lcom/immomo/ijkConferenceStreamer;->mRecording:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 709
    .line 710
    monitor-exit p0

    .line 711
    return-void

    .line 712
    :goto_8
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 713
    throw p1
.end method

.method public startScreenPushlish(Landroid/app/Activity;Ll/ror;)V
    .locals 1

    .line 1
    iput-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenCodecParameters:Ll/ror;

    .line 2
    .line 3
    const-string p2, "media_projection"

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    check-cast p2, Landroid/media/projection/MediaProjectionManager;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/immomo/ijkConferenceStreamer;->mMediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

    .line 12
    .line 13
    new-instance p2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 19
    .line 20
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v0, ">=21"

    .line 24
    .line 25
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    const-string v0, "ScreenRecordActivity"

    .line 33
    .line 34
    invoke-static {v0, p2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mMediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/media/projection/MediaProjectionManager;->createScreenCaptureIntent()Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const/16 p2, 0x457

    .line 44
    .line 45
    invoke-virtual {p1, p0, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public startSurroundMusic(Ljava/lang/String;IJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/l6m;->O1(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public startSurroundMusicEx(Ljava/lang/String;ZZI)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3, p4}, Ll/hwl;->r0(Ljava/lang/String;ZZI)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopAllEffects()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/hwl;->stopAllEffects()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopEffect(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/hwl;->stopEffect(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopPlayMusic()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->N1()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopRecordFile()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/c4m;->e2()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopRecordWithNotLeaveRoom()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mRecording:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-interface {v0}, Ll/c4m;->f()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 18
    .line 19
    invoke-interface {v0, v1}, Lcom/momo/pub/MomoPipelineModuleRegister;->z(Ll/c4m;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-interface {v0}, Ll/c4m;->A()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 34
    .line 35
    invoke-interface {v0, v1}, Lcom/momo/pub/MomoPipelineModuleRegister;->z(Ll/c4m;)V

    .line 36
    .line 37
    .line 38
    :cond_2
    const/4 v0, 0x0

    .line 39
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mRecording:Z

    .line 40
    .line 41
    return-void
.end method

.method public stopRecording()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mRecording:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-interface {v0}, Ll/c4m;->f()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->momoPusherPipeline:Ll/zzl;

    .line 18
    .line 19
    invoke-interface {v0, v1}, Lcom/momo/pub/MomoPipelineModuleRegister;->z(Ll/c4m;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-interface {v0}, Ll/c4m;->f()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 34
    .line 35
    invoke-interface {v0, v1}, Lcom/momo/pub/MomoPipelineModuleRegister;->z(Ll/c4m;)V

    .line 36
    .line 37
    .line 38
    :cond_2
    const/4 v0, 0x0

    .line 39
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mRecording:Z

    .line 40
    .line 41
    return-void
.end method

.method public stopRenderer()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mSelectFileStop:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "stopRenderer"

    .line 14
    .line 15
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "stopRenderer: stopRenderer()"

    .line 27
    .line 28
    const-string v2, "pip->PIPLINE2"

    .line 29
    .line 30
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mSelectFileStop:Z

    .line 35
    .line 36
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 37
    .line 38
    invoke-interface {v0}, Ll/pvl;->G()V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 44
    .line 45
    invoke-interface {v0, v1}, Lcom/momo/pub/MomoPipelineModuleRegister;->B(Ll/pvl;)V

    .line 46
    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    iput-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->ijkInputPipline:Ll/lvl;

    .line 50
    .line 51
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string v0, "stopRenderer: stopRenderer() end"

    .line 56
    .line 57
    invoke-virtual {p0, v2, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public stopScreenPushlish()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPusherPipeline:Ll/zzl;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-interface {v0}, Ll/c4m;->f()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPipelineModuleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPusherPipeline:Ll/zzl;

    .line 14
    .line 15
    invoke-interface {v0, v2}, Lcom/momo/pub/MomoPipelineModuleRegister;->C(Ll/c4m;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iput-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPusherPipeline:Ll/zzl;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenInputPipline:Ll/n5m;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-interface {v0}, Ll/pvl;->G()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPipelineModuleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->emptyInputPipline:Ll/usl;

    .line 30
    .line 31
    invoke-interface {v0, v2}, Lcom/momo/pub/MomoPipelineModuleRegister;->B(Ll/pvl;)V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenInputPipline:Ll/n5m;

    .line 35
    .line 36
    :cond_2
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPipelineModuleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    invoke-interface {v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->t()V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->mScreenPipelineModuleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 44
    .line 45
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->mOnRecordSuccessListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordSuccessListener;

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    iget-boolean v1, p0, Lcom/immomo/ijkConferenceStreamer;->mRecordScreenError:Z

    .line 50
    .line 51
    if-nez v1, :cond_3

    .line 52
    .line 53
    invoke-interface {v0, p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$onRecordSuccessListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)V

    .line 54
    .line 55
    .line 56
    :cond_3
    return-void
.end method

.method public stopSurroundMusic()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->stopSurroundMusic()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopSurroundMusic_NoDelay()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->Y()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public switchCamera()V
    .locals 3

    .line 1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "switchCamera"

    .line 6
    .line 7
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0, v2}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->mrConfig:Ll/row;

    .line 19
    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    iget-object v2, p0, Lcom/immomo/ijkConferenceStreamer;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Landroid/app/Activity;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrConfig:Ll/row;

    .line 31
    .line 32
    invoke-interface {v0, v2, p0}, Ll/cql;->i0(Landroid/app/Activity;Ll/row;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v0, "ijkConferenceStreamer"

    .line 40
    .line 41
    invoke-virtual {p0, v0, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public switchCamera(Landroid/app/Activity;)V
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->mrConfig:Ll/row;

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 46
    invoke-interface {v0, p1, p0}, Ll/cql;->i0(Landroid/app/Activity;Ll/row;)V

    .line 47
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    move-result-object p0

    const-string p1, "ijkConferenceStreamer"

    const-string v0, "switchCamera"

    invoke-virtual {p0, p1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public unSelectCamera()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/immomo/ijkConferenceStreamer;->mHavaSelectCamera:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0}, Ll/pvl;->G()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/cql;->r()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->moduleRegister:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 19
    .line 20
    invoke-interface {v0, v1}, Lcom/momo/pub/MomoPipelineModuleRegister;->B(Ll/pvl;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/immomo/ijkConferenceStreamer;->cameraInputPipline:Ll/cql;

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public updateChannelkey(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer;->mChannelkey:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer;->linkMicPusherPipeline:Ll/hwl;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ll/hwl;->l2(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method
