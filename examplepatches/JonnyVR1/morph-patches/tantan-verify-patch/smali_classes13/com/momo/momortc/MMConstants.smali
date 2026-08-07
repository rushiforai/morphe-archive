.class public Lcom/momo/momortc/MMConstants;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/momortc/MMConstants$MediaType;,
        Lcom/momo/momortc/MMConstants$AudioProfile;,
        Lcom/momo/momortc/MMConstants$AudioScenario;
    }
.end annotation


# static fields
.field public static final AUDIO_EQUALIZATION_BAND_125:I = 0x2

.field public static final AUDIO_EQUALIZATION_BAND_16K:I = 0x9

.field public static final AUDIO_EQUALIZATION_BAND_1K:I = 0x5

.field public static final AUDIO_EQUALIZATION_BAND_250:I = 0x3

.field public static final AUDIO_EQUALIZATION_BAND_2K:I = 0x6

.field public static final AUDIO_EQUALIZATION_BAND_31:I = 0x0

.field public static final AUDIO_EQUALIZATION_BAND_4K:I = 0x7

.field public static final AUDIO_EQUALIZATION_BAND_500:I = 0x4

.field public static final AUDIO_EQUALIZATION_BAND_62:I = 0x1

.field public static final AUDIO_EQUALIZATION_BAND_8K:I = 0x8

.field public static final AUDIO_PROFILE_DEFAULT:I = 0x0

.field public static final AUDIO_PROFILE_MUSIC_HIGH_QUALITY:I = 0x4

.field public static final AUDIO_PROFILE_MUSIC_HIGH_QUALITY_STEREO:I = 0x5

.field public static final AUDIO_PROFILE_MUSIC_STANDARD:I = 0x2

.field public static final AUDIO_PROFILE_MUSIC_STANDARD_STEREO:I = 0x3

.field public static final AUDIO_PROFILE_SPEECH_STANDARD:I = 0x1

.field public static final AUDIO_RECORDING_QUALITY_HIGH:I = 0x2

.field public static final AUDIO_RECORDING_QUALITY_LOW:I = 0x0

.field public static final AUDIO_RECORDING_QUALITY_MEDIUM:I = 0x1

.field public static final AUDIO_REVERB_DRY_LEVEL:I = 0x0

.field public static final AUDIO_REVERB_ROOM_SIZE:I = 0x2

.field public static final AUDIO_REVERB_STRENGTH:I = 0x4

.field public static final AUDIO_REVERB_WET_DELAY:I = 0x3

.field public static final AUDIO_REVERB_WET_LEVEL:I = 0x1

.field public static final AUDIO_ROUTE_DEFAULT:I = -0x1

.field public static final AUDIO_ROUTE_EARPIECE:I = 0x1

.field public static final AUDIO_ROUTE_HEADSET:I = 0x0

.field public static final AUDIO_ROUTE_HEADSETBLUETOOTH:I = 0x5

.field public static final AUDIO_ROUTE_HEADSETNOMIC:I = 0x2

.field public static final AUDIO_ROUTE_LOUDSPEAKER:I = 0x4

.field public static final AUDIO_ROUTE_SPEAKERPHONE:I = 0x3

.field public static final AUDIO_SCENARIO_CHATROOM_ENTERTAINMENT:I = 0x1

.field public static final AUDIO_SCENARIO_CHATROOM_GAMING:I = 0x5

.field public static final AUDIO_SCENARIO_DEFAULT:I = 0x0

.field public static final AUDIO_SCENARIO_EDUCATION:I = 0x2

.field public static final AUDIO_SCENARIO_GAME_STREAMING:I = 0x3

.field public static final AUDIO_SCENARIO_NUM:I = 0x6

.field public static final AUDIO_SCENARIO_SHOWROOM:I = 0x4

.field public static final CHANNEL_PROFILE_COMMUNICATION:I = 0x0

.field public static final CHANNEL_PROFILE_GAME:I = 0x2

.field public static final CHANNEL_PROFILE_LIVE_BROADCASTING:I = 0x1

.field public static final CLIENT_ROLE_AUDIENCE:I = 0x2

.field public static final CLIENT_ROLE_BROADCASTER:I = 0x1

.field public static final ERR_ADM_GENERAL_ERROR:I = 0x3ed

.field public static final ERR_ADM_INIT_LOOPBACK:I = 0x3fe

.field public static final ERR_ADM_INIT_PLAYOUT:I = 0x3f0

.field public static final ERR_ADM_INIT_RECORDING:I = 0x3f3

.field public static final ERR_ADM_JAVA_RESOURCE:I = 0x3ee

.field public static final ERR_ADM_NO_PLAYOUT_DEVICE:I = 0x550

.field public static final ERR_ADM_NO_RECORDING_DEVICE:I = 0x54f

.field public static final ERR_ADM_RECORD_AUDIO_FAILED:I = 0x3fa

.field public static final ERR_ADM_RUNTIME_PLAYOUT_ERROR:I = 0x3f7

.field public static final ERR_ADM_RUNTIME_RECORDING_ERROR:I = 0x3f9

.field public static final ERR_ADM_SAMPLE_RATE:I = 0x3ef

.field public static final ERR_ADM_START_LOOPBACK:I = 0x3ff

.field public static final ERR_ADM_START_PLAYOUT:I = 0x3f1

.field public static final ERR_ADM_START_RECORDING:I = 0x3f4

.field public static final ERR_ADM_STOP_PLAYOUT:I = 0x3f2

.field public static final ERR_ADM_STOP_RECORDING:I = 0x3f5

.field public static final ERR_ALREADY_IN_USE:I = 0x13

.field public static final ERR_AUDIO_BT_SCO_FAILED:I = 0x406

.field public static final ERR_BIND_SOCKET:I = 0xd

.field public static final ERR_BITRATE_LIMIT:I = 0x73

.field public static final ERR_BUFFER_TOO_SMALL:I = 0x6

.field public static final ERR_CANCELED:I = 0xb

.field public static final ERR_CLIENT_IS_BANNED_BY_SERVER:I = 0x7b

.field public static final ERR_CONNECTION_INTERRUPTED:I = 0x6f

.field public static final ERR_CONNECTION_LOST:I = 0x70

.field public static final ERR_DECRYPTION_FAILED:I = 0x78

.field public static final ERR_FAILED:I = 0x1

.field public static final ERR_INVALID_APP_ID:I = 0x65

.field public static final ERR_INVALID_ARGUMENT:I = 0x2

.field public static final ERR_INVALID_CHANNEL_NAME:I = 0x66

.field public static final ERR_INVALID_TOKEN:I = 0x6e

.field public static final ERR_JOIN_CHANNEL_REJECTED:I = 0x11

.field public static final ERR_LEAVE_CHANNEL_REJECTED:I = 0x12

.field public static final ERR_LOAD_MEDIA_ENGINE:I = 0x3e9

.field public static final ERR_NET_DOWN:I = 0xe

.field public static final ERR_NET_NOBUFS:I = 0xf

.field public static final ERR_NOT_INITIALIZED:I = 0x7

.field public static final ERR_NOT_IN_CHANNEL:I = 0x71

.field public static final ERR_NOT_READY:I = 0x3

.field public static final ERR_NOT_SUPPORTED:I = 0x4

.field public static final ERR_NO_PERMISSION:I = 0x9

.field public static final ERR_OK:I = 0x0

.field public static final ERR_REFUSED:I = 0x5

.field public static final ERR_SIZE_TOO_LARGE:I = 0x72

.field public static final ERR_START_CALL:I = 0x3ea

.field public static final ERR_START_CAMERA:I = 0x3eb

.field public static final ERR_START_VIDEO_RENDER:I = 0x3ec

.field public static final ERR_TIMEDOUT:I = 0xa

.field public static final ERR_TOKEN_EXPIRED:I = 0x6d

.field public static final ERR_TOO_MANY_DATA_STREAMS:I = 0x74

.field public static final ERR_TOO_OFTEN:I = 0xc

.field public static final ERR_VCM_ENCODER_ENCODE_ERROR:I = 0x642

.field public static final ERR_VCM_ENCODER_INIT_ERROR:I = 0x641

.field public static final ERR_VCM_ENCODER_SET_ERROR:I = 0x643

.field public static final ERR_VCM_UNKNOWN_ERROR:I = 0x640

.field public static final ERR_VDM_CAMERA_NOT_AUTHORIZED:I = 0x5dd

.field public static final ERR_WATERMARKR_INFO:I = 0x7f

.field public static final ERR_WATERMARK_ARGB:I = 0x80

.field public static final ERR_WATERMARK_PARAM:I = 0x7c

.field public static final ERR_WATERMARK_PATH:I = 0x7d

.field public static final ERR_WATERMARK_PNG:I = 0x7e

.field public static final ERR_WATERMARK_READ:I = 0x81

.field public static final HARDWARE_ENCODER:I = 0x0

.field public static final INJECT_STREAM_STATUS_BROKEN:I = 0xa

.field public static final INJECT_STREAM_STATUS_START_ALREADY_EXISTS:I = 0x1

.field public static final INJECT_STREAM_STATUS_START_FAILED:I = 0x4

.field public static final INJECT_STREAM_STATUS_START_SUCCESS:I = 0x0

.field public static final INJECT_STREAM_STATUS_START_TIMEDOUT:I = 0x3

.field public static final INJECT_STREAM_STATUS_START_UNAUTHORIZED:I = 0x2

.field public static final INJECT_STREAM_STATUS_STOP_FAILED:I = 0x9

.field public static final INJECT_STREAM_STATUS_STOP_NOT_FOUND:I = 0x6

.field public static final INJECT_STREAM_STATUS_STOP_SUCCESS:I = 0x5

.field public static final INJECT_STREAM_STATUS_STOP_TIMEDOUT:I = 0x8

.field public static final INJECT_STREAM_STATUS_STOP_UNAUTHORIZED:I = 0x7

.field public static final LOG_FILTER_CRITICAL:I = 0x8

.field public static final LOG_FILTER_DEBUG:I = 0x80f

.field public static final LOG_FILTER_ERROR:I = 0xc

.field public static final LOG_FILTER_INFO:I = 0xf

.field public static final LOG_FILTER_OFF:I = 0x0

.field public static final LOG_FILTER_WARNING:I = 0xe

.field public static final MEDIA_ENGINE_AUDIO_FILE_MIX_FINISH:I = 0xa

.field public static final MEDIA_ENGINE_LOCAL_AUDIO_RECORD_DISABLED:I = 0xf

.field public static final MEDIA_ENGINE_LOCAL_AUDIO_RECORD_ENABLED:I = 0xe

.field public static final MEDIA_ENGINE_PLAYOUT_ERROR:I = 0x1

.field public static final MEDIA_ENGINE_PLAYOUT_WARNING:I = 0x3

.field public static final MEDIA_ENGINE_RECORDING_ERROR:I = 0x0

.field public static final MEDIA_ENGINE_RECORDING_WARNING:I = 0x2

.field public static final MEDIA_ENGINE_ROLE_AUDIENCE:I = 0x16

.field public static final MEDIA_ENGINE_ROLE_BROADCASTER_INTERACTIVE:I = 0x15

.field public static final MEDIA_ENGINE_ROLE_BROADCASTER_SOLO:I = 0x14

.field public static final MEDIA_ENGINE_ROLE_COMM_PEER:I = 0x17

.field public static final MEDIA_TYPE_AUDIO_AND_VIDEO:I = 0x3

.field public static final MEDIA_TYPE_AUDIO_ONLY:I = 0x1

.field public static final MEDIA_TYPE_NONE:I = 0x0

.field public static final MEDIA_TYPE_VIDEO_ONLY:I = 0x2

.field public static final QUALITY_BAD:I = 0x4

.field public static final QUALITY_DOWN:I = 0x6

.field public static final QUALITY_EXCELLENT:I = 0x1

.field public static final QUALITY_GOOD:I = 0x2

.field public static final QUALITY_POOR:I = 0x3

.field public static final QUALITY_REPORT_FORMAT_HTML:I = 0x1

.field public static final QUALITY_REPORT_FORMAT_JSON:I = 0x0

.field public static final QUALITY_UNKNOWN:I = 0x0

.field public static final QUALITY_VBAD:I = 0x5

.field public static final RAW_AUDIO_FRAME_OP_MODE_READ_ONLY:I = 0x0

.field public static final RAW_AUDIO_FRAME_OP_MODE_READ_WRITE:I = 0x2

.field public static final RAW_AUDIO_FRAME_OP_MODE_WRITE_ONLY:I = 0x1

.field public static final RENDER_MODE_ADAPTIVE:I = 0x3

.field public static final RENDER_MODE_FIT:I = 0x2

.field public static final RENDER_MODE_HIDDEN:I = 0x1

.field public static final SOFEWARE_ENCODER:I = 0x1

.field public static final STREAM_LIFE_CYCLE_BIND2CHANNEL:I = 0x1

.field public static final STREAM_LIFE_CYCLE_BIND2OWNER:I = 0x2

.field public static final USER_OFFLINE_BECOME_AUDIENCE:I = 0x2

.field public static final USER_OFFLINE_DROPPED:I = 0x1

.field public static final USER_OFFLINE_QUIT:I = 0x0

.field public static final VIDEO_MIRROR_MODE_AUTO:I = 0x0

.field public static final VIDEO_MIRROR_MODE_DISABLED:I = 0x2

.field public static final VIDEO_MIRROR_MODE_ENABLED:I = 0x1

.field public static final VIDEO_PROFILE_120P:I = 0x0

.field public static final VIDEO_PROFILE_120P_3:I = 0x2

.field public static final VIDEO_PROFILE_180P:I = 0xa

.field public static final VIDEO_PROFILE_180P_3:I = 0xc

.field public static final VIDEO_PROFILE_180P_4:I = 0xd

.field public static final VIDEO_PROFILE_240P:I = 0x14

.field public static final VIDEO_PROFILE_240P_3:I = 0x16

.field public static final VIDEO_PROFILE_240P_4:I = 0x17

.field public static final VIDEO_PROFILE_360P:I = 0x1e

.field public static final VIDEO_PROFILE_360P_10:I = 0x27

.field public static final VIDEO_PROFILE_360P_11:I = 0x64

.field public static final VIDEO_PROFILE_360P_3:I = 0x20

.field public static final VIDEO_PROFILE_360P_4:I = 0x21

.field public static final VIDEO_PROFILE_360P_6:I = 0x23

.field public static final VIDEO_PROFILE_360P_7:I = 0x24

.field public static final VIDEO_PROFILE_360P_8:I = 0x25

.field public static final VIDEO_PROFILE_360P_9:I = 0x26

.field public static final VIDEO_PROFILE_480P:I = 0x28

.field public static final VIDEO_PROFILE_480P_10:I = 0x31

.field public static final VIDEO_PROFILE_480P_3:I = 0x2a

.field public static final VIDEO_PROFILE_480P_4:I = 0x2b

.field public static final VIDEO_PROFILE_480P_6:I = 0x2d

.field public static final VIDEO_PROFILE_480P_8:I = 0x2f

.field public static final VIDEO_PROFILE_480P_9:I = 0x30

.field public static final VIDEO_PROFILE_720P:I = 0x32

.field public static final VIDEO_PROFILE_720P_3:I = 0x34

.field public static final VIDEO_PROFILE_720P_5:I = 0x36

.field public static final VIDEO_PROFILE_720P_6:I = 0x37

.field public static final VIDEO_PROFILE_DEFAULT:I = 0x1e

.field public static final VIDEO_STREAM_HIGH:I = 0x0

.field public static final VIDEO_STREAM_LOW:I = 0x1

.field public static final WARN_ADM_GLITCH_STATE:I = 0x41c

.field public static final WARN_ADM_IMPROPER_SETTINGS:I = 0x41d

.field public static final WARN_ADM_PLAYOUT_AUDIO_LOWLEVEL:I = 0x408

.field public static final WARN_ADM_RECORD_AUDIO_LOWLEVEL:I = 0x407

.field public static final WARN_ADM_RECORD_AUDIO_SILENCE:I = 0x3fb

.field public static final WARN_ADM_RECORD_IS_OCCUPIED:I = 0x409

.field public static final WARN_ADM_RUNTIME_PLAYOUT_WARNING:I = 0x3f6

.field public static final WARN_ADM_RUNTIME_RECORDING_WARNING:I = 0x3f8

.field public static final WARN_APM_HOWLING:I = 0x41b

.field public static final WARN_AUDIO_MIXING_OPEN_ERROR:I = 0x2bd

.field public static final WARN_INIT_VIDEO:I = 0x10

.field public static final WARN_INVALID_VIEW:I = 0x8

.field public static final WARN_LOOKUP_CHANNEL_REJECTED:I = 0x69

.field public static final WARN_LOOKUP_CHANNEL_TIMEOUT:I = 0x68

.field public static final WARN_NO_AVAILABLE_CHANNEL:I = 0x67

.field public static final WARN_OPEN_CHANNEL_INVALID_TICKET:I = 0x79

.field public static final WARN_OPEN_CHANNEL_REJECTED:I = 0x6b

.field public static final WARN_OPEN_CHANNEL_TIMEOUT:I = 0x6a

.field public static final WARN_OPEN_CHANNEL_TRY_NEXT_VOS:I = 0x7a

.field public static final WARN_PENDING:I = 0x14

.field public static final WARN_SET_CLIENT_ROLE_NOT_AUTHORIZED:I = 0x77

.field public static final WARN_SET_CLIENT_ROLE_TIMEOUT:I = 0x76

.field public static final WARN_SWITCH_LIVE_VIDEO_TIMEOUT:I = 0x6f


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
