.class public Lcom/tencent/iliveroom/TXILiveRoomDefine;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixUser;,
        Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;,
        Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;,
        Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;,
        Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;,
        Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;,
        Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;,
        Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;,
        Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;,
        Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;,
        Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveConfig;
    }
.end annotation


# static fields
.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_1280_720:I = 0x5

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_160_160:I = 0x13

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_180_320:I = 0x7

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_240_320:I = 0xb

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_270_270:I = 0x12

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_270_480:I = 0x8

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_320_180:I = 0x9

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_320_240:I = 0xe

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_320_480:I = 0x6

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_360_480:I = 0xc

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_360_640:I = 0x0

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_480_270:I = 0xa

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_480_360:I = 0xf

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_480_480:I = 0x11

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_480_640:I = 0xd

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_540_960:I = 0x1

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_640_360:I = 0x3

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_640_480:I = 0x10

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_720_1280:I = 0x2

.field public static final TXILIVEROOM_VIDEO_RESOLUTION_TYPE_960_540:I = 0x4

.field public static final TXILiveRoomAudioEncQualityMusicHigh:I = 0x3

.field public static final TXILiveRoomAudioEncQualityMusicStandard:I = 0x2

.field public static final TXILiveRoomAudioEncQualitySpeechStandard:I = 0x1

.field public static final TXILiveRoomAudioModeEarpiece:I = 0x1

.field public static final TXILiveRoomAudioModeSpeakerphone:I = 0x0

.field public static final TXILiveRoomAudioSampleRate16000:I = 0x3e80

.field public static final TXILiveRoomAudioSampleRate32000:I = 0x7d00

.field public static final TXILiveRoomAudioSampleRate44100:I = 0xac44

.field public static final TXILiveRoomAudioSampleRate48000:I = 0xbb80

.field public static final TXILiveRoomBeautyStyleNature:I = 0x1

.field public static final TXILiveRoomBeautyStyleSmooth:I = 0x0

.field public static final TXILiveRoomCustomModeTypeAudio:I = 0x1

.field public static final TXILiveRoomCustomModeTypeNone:I = 0x0

.field public static final TXILiveRoomCustomModeTypeVideo:I = 0x2

.field public static final TXILiveRoomErrorAudioPlayEngineNotStart:I = 0x2bc1

.field public static final TXILiveRoomErrorConnReachMaxRetryTimes:I = -0x18e91

.field public static final TXILiveRoomErrorConnRoomFailed:I = -0x18e9c

.field public static final TXILiveRoomErrorConnRoomNotExist:I = -0x18e9e

.field public static final TXILiveRoomErrorConnRoomTimeout:I = -0x18e92

.field public static final TXILiveRoomErrorConnUserNotExist:I = -0x18ea0

.field public static final TXILiveRoomErrorDisconnect:I = 0x2afa

.field public static final TXILiveRoomErrorEffectInvalid:I = 0x2bc4

.field public static final TXILiveRoomErrorEffectNotSupportSampleRate:I = 0x2bc5

.field public static final TXILiveRoomErrorLoadLiteAVSDKSOFail:I = 0x2c25

.field public static final TXILiveRoomErrorMusicInvalid:I = 0x2bc2

.field public static final TXILiveRoomErrorMusicNotSupportSampleRate:I = 0x2bc3

.field public static final TXILiveRoomErrorNone:I = 0x0

.field public static final TXILiveRoomErrorOpenCameraFailed:I = 0x2afb

.field public static final TXILiveRoomErrorOpenMicFailed:I = 0x2afc

.field public static final TXILiveRoomErrorSigExpired:I = 0x2b5e

.field public static final TXILiveRoomErrorSigFailed:I = 0x2b5f

.field public static final TXILiveRoomErrorSwitchRoleFailed:I = 0x2b5d

.field public static final TXILiveRoomErrorTimeout:I = 0x2b5c

.field public static final TXILiveRoomErrorUnsupportResolution:I = 0x2afd

.field public static final TXILiveRoomErrorUnsupportSamplerate:I = 0x2afe

.field public static final TXILiveRoomErrorUpVideoAuthFailed:I = 0x2af9

.field public static final TXILiveRoomEventConnectSucc:I = 0x32c9

.field public static final TXILiveRoomEventOpenCameraSucc:I = 0x32ca

.field public static final TXILiveRoomEventOpenMicSucc:I = 0x32d7

.field public static final TXILiveRoomEventRenderFirstFrame:I = 0x32d2

.field public static final TXILiveRoomEventReqVideoAuthSucc:I = 0x32cf

.field public static final TXILiveRoomEventResolutionChanged:I = 0x32d0

.field public static final TXILiveRoomEventServerAddrChanged:I = 0x32d5

.field public static final TXILiveRoomEventServerTypeChanged:I = 0x32d6

.field public static final TXILiveRoomEventStartPlayAudioFrame:I = 0x32d3

.field public static final TXILiveRoomEventStartVideoHardWareDecoder:I = 0x32cd

.field public static final TXILiveRoomEventStartVideoHardWareEncoder:I = 0x32cb

.field public static final TXILiveRoomEventStartVideoSoftWareDecoder:I = 0x32ce

.field public static final TXILiveRoomEventStartVideoSoftWareEncoder:I = 0x32cc

.field public static final TXILiveRoomEventVideoBitrateChanged:I = 0x32d1

.field public static final TXILiveRoomEventVideoPlayLag:I = 0x32d4

.field public static final TXILiveRoomHomeOrientationDown:I = 0x1

.field public static final TXILiveRoomHomeOrientationLeft:I = 0x2

.field public static final TXILiveRoomHomeOrientationRight:I = 0x0

.field public static final TXILiveRoomHomeOrientationUp:I = 0x3

.field public static final TXILiveRoomMixOutputVideoCodecTypeDefault:I = 0x0

.field public static final TXILiveRoomMixOutputVideoCodecTypeH264:I = 0x1

.field public static final TXILiveRoomMixOutputVideoCodecTypeH265:I = 0x2

.field public static final TXILiveRoomOfflineReasonDropped:I = 0x1

.field public static final TXILiveRoomOfflineReasonKicked:I = 0x2

.field public static final TXILiveRoomOfflineReasonQuit:I = 0x0

.field public static final TXILiveRoomRoleAudience:I = 0x2

.field public static final TXILiveRoomRoleBroadcaster:I = 0x1

.field public static final TXILiveRoomScenarioChat:I = 0x1

.field public static final TXILiveRoomScenarioLive:I = 0x2

.field public static final TXILiveRoomVideoForamt_Texture_2D:I = 0x0

.field public static final TXILiveRoomVideoForamt_Texture_OES:I = 0x0

.field public static final TXILiveRoomVideoRenderModeFit:I = 0x1

.field public static final TXILiveRoomVideoRenderModeHidden:I = 0x0

.field public static final TXILiveRoomVideoStreamBig:I = 0x0

.field public static final TXILiveRoomVideoStreamSmall:I = 0x1

.field public static final TXILiveRoomVolumeTypeAuto:I = 0x0

.field public static final TXILiveRoomVolumeTypeMedia:I = 0x1

.field public static final TXILiveRoomWarningAudioDecodeFailed:I = 0x2ee7

.field public static final TXILiveRoomWarningAudioEncodeFailed:I = 0x2ee5

.field public static final TXILiveRoomWarningCameraNotAuthorized:I = 0x2ee8

.field public static final TXILiveRoomWarningCameraOccupy:I = 0x2ee9

.field public static final TXILiveRoomWarningHWAcceFailed:I = 0x2ee3

.field public static final TXILiveRoomWarningInternalError:I = 0x2eec

.field public static final TXILiveRoomWarningMICNotAuthorized:I = 0x2eea

.field public static final TXILiveRoomWarningMICOccupy:I = 0x2eeb

.field public static final TXILiveRoomWarningNetBusy:I = 0x2ee2

.field public static final TXILiveRoomWarningNone:I = 0x0

.field public static final TXILiveRoomWarningReconnect:I = 0x2ee1

.field public static final TXILiveRoomWarningVideoDecodeFailed:I = 0x2ee6

.field public static final TXILiveRoomWarningVideoEncodeFailed:I = 0x2ee4

.field public static final TXIliveRoomAuthBitsCreateRoom:I = 0x1

.field public static final TXIliveRoomAuthBitsDefault:I = -0x1

.field public static final TXIliveRoomAuthBitsJoinRoom:I = 0x2

.field public static final TXIliveRoomAuthBitsRecvAudio:I = 0x8

.field public static final TXIliveRoomAuthBitsRecvCameraVideo:I = 0x20

.field public static final TXIliveRoomAuthBitsRecvScreenVideo:I = 0x80

.field public static final TXIliveRoomAuthBitsSendAudio:I = 0x4

.field public static final TXIliveRoomAuthBitsSendCameraVideo:I = 0x10

.field public static final TXIliveRoomAuthBitsSendScreenVideo:I = 0x40


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
