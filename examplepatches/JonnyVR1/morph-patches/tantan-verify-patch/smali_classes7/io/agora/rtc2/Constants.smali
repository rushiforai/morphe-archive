.class public Lio/agora/rtc2/Constants;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/Constants$ScreenScenarioType;,
        Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;,
        Lio/agora/rtc2/Constants$ThreadPriorityType;,
        Lio/agora/rtc2/Constants$VOICE_AI_TUNER_TYPE;,
        Lio/agora/rtc2/Constants$AUDIO_REVERB_TYPE;,
        Lio/agora/rtc2/Constants$AUDIO_EQUALIZATION_BAND_FREQUENCY;,
        Lio/agora/rtc2/Constants$MediaSourceType;,
        Lio/agora/rtc2/Constants$AudioMixingDualMonoMode;,
        Lio/agora/rtc2/Constants$BytesPerSample;,
        Lio/agora/rtc2/Constants$AudioTrackType;,
        Lio/agora/rtc2/Constants$QoEPreference;,
        Lio/agora/rtc2/Constants$VideoScenario;,
        Lio/agora/rtc2/Constants$ExternalVideoSourceType;,
        Lio/agora/rtc2/Constants$StreamFallbackOptions;,
        Lio/agora/rtc2/Constants$VideoStreamType;,
        Lio/agora/rtc2/Constants$SimulcastStreamMode;,
        Lio/agora/rtc2/Constants$VideoModulePosition;,
        Lio/agora/rtc2/Constants$VideoSourceType;,
        Lio/agora/rtc2/Constants$AudioSourceType;,
        Lio/agora/rtc2/Constants$LogLevel;,
        Lio/agora/rtc2/Constants$AudioScenario;,
        Lio/agora/rtc2/Constants$AudioProfile;,
        Lio/agora/rtc2/Constants$MediaType;
    }
.end annotation


# static fields
.field public static final AUDIENCE_LATENCY_LEVEL_LOW_LATENCY:I = 0x1

.field public static final AUDIENCE_LATENCY_LEVEL_ULTRA_LOW_LATENCY:I = 0x2

.field public static final AUDIO_CODEC_AACLC:I = 0x8

.field public static final AUDIO_CODEC_HEAAC:I = 0x9

.field public static final AUDIO_CODEC_HEAAC2:I = 0xb

.field public static final AUDIO_CODEC_OPUS:I = 0x1

.field public static final AUDIO_EFFECT_OFF:I = 0x0

.field public static final AUDIO_ENCODED_FRAME_OBSERVER_POSITION_MIC:I = 0x1

.field public static final AUDIO_ENCODED_FRAME_OBSERVER_POSITION_MIXED:I = 0x3

.field public static final AUDIO_ENCODED_FRAME_OBSERVER_POSITION_PLAYBACK:I = 0x2

.field public static final AUDIO_ENCODING_TYPE_AAC_16000_LOW:I = 0x10101

.field public static final AUDIO_ENCODING_TYPE_AAC_16000_MEDIUM:I = 0x10102

.field public static final AUDIO_ENCODING_TYPE_AAC_32000_HIGH:I = 0x10203

.field public static final AUDIO_ENCODING_TYPE_AAC_32000_LOW:I = 0x10201

.field public static final AUDIO_ENCODING_TYPE_AAC_32000_MEDIUM:I = 0x10202

.field public static final AUDIO_ENCODING_TYPE_AAC_48000_HIGH:I = 0x10303

.field public static final AUDIO_ENCODING_TYPE_AAC_48000_MEDIUM:I = 0x10302

.field public static final AUDIO_ENCODING_TYPE_OPUS_16000_LOW:I = 0x20101

.field public static final AUDIO_ENCODING_TYPE_OPUS_16000_MEDIUM:I = 0x20102

.field public static final AUDIO_ENCODING_TYPE_OPUS_48000_HIGH:I = 0x20303

.field public static final AUDIO_ENCODING_TYPE_OPUS_48000_MEDIUM:I = 0x20302

.field public static final AUDIO_FILE_RECORDING_MIC:I = 0x1

.field public static final AUDIO_FILE_RECORDING_MIXED:I = 0x3

.field public static final AUDIO_FILE_RECORDING_PLAYBACK:I = 0x2

.field public static final AUDIO_MIXING_REASON_ALL_LOOPS_COMPLETED:I = 0x2d3

.field public static final AUDIO_MIXING_REASON_CAN_NOT_OPEN:I = 0x2bd

.field public static final AUDIO_MIXING_REASON_INTERRUPTED_EOF:I = 0x2bf

.field public static final AUDIO_MIXING_REASON_OK:I = 0x0

.field public static final AUDIO_MIXING_REASON_ONE_LOOP_COMPLETED:I = 0x2d1

.field public static final AUDIO_MIXING_REASON_RESUMED_BY_USER:I = 0x2d6

.field public static final AUDIO_MIXING_REASON_STOPPED_BY_USER:I = 0x2d4

.field public static final AUDIO_MIXING_REASON_TOO_FREQUENT_CALL:I = 0x2be

.field public static final AUDIO_MIXING_STATE_FAILED:I = 0x2ca

.field public static final AUDIO_MIXING_STATE_PAUSED:I = 0x2c7

.field public static final AUDIO_MIXING_STATE_PLAYING:I = 0x2c6

.field public static final AUDIO_MIXING_STATE_STOPPED:I = 0x2c9

.field public static final AUDIO_PROFILE_DEFAULT:I = 0x0

.field public static final AUDIO_PROFILE_MUSIC_HIGH_QUALITY:I = 0x4

.field public static final AUDIO_PROFILE_MUSIC_HIGH_QUALITY_STEREO:I = 0x5

.field public static final AUDIO_PROFILE_MUSIC_STANDARD:I = 0x2

.field public static final AUDIO_PROFILE_MUSIC_STANDARD_STEREO:I = 0x3

.field public static final AUDIO_PROFILE_SPEECH_STANDARD:I = 0x1

.field public static final AUDIO_RECORDING_QUALITY_HIGH:I = 0x2

.field public static final AUDIO_RECORDING_QUALITY_LOW:I = 0x0

.field public static final AUDIO_RECORDING_QUALITY_MEDIUM:I = 0x1

.field public static final AUDIO_RECORDING_QUALITY_ULTRA_HIGH:I = 0x3

.field public static final AUDIO_ROUTE_BLUETOOTH_DEVICE_A2DP:I = 0xa

.field public static final AUDIO_ROUTE_BLUETOOTH_DEVICE_HFP:I = 0x5

.field public static final AUDIO_ROUTE_DEFAULT:I = -0x1

.field public static final AUDIO_ROUTE_EARPIECE:I = 0x1

.field public static final AUDIO_ROUTE_HDMI:I = 0x7

.field public static final AUDIO_ROUTE_HEADSET:I = 0x0

.field public static final AUDIO_ROUTE_HEADSETNOMIC:I = 0x2

.field public static final AUDIO_ROUTE_LOUDSPEAKER:I = 0x4

.field public static final AUDIO_ROUTE_SPEAKERPHONE:I = 0x3

.field public static final AUDIO_ROUTE_USBDEVICE:I = 0x6

.field public static final AUDIO_ROUTE_USB_HEADSET:I = 0x8

.field public static final AUDIO_SCENARIO_AI_CLIENT:I = 0xa

.field public static final AUDIO_SCENARIO_AI_SERVER:I = 0x9

.field public static final AUDIO_SCENARIO_CHATROOM:I = 0x5

.field public static final AUDIO_SCENARIO_CHORUS:I = 0x7

.field public static final AUDIO_SCENARIO_DEFAULT:I = 0x0

.field public static final AUDIO_SCENARIO_GAME_STREAMING:I = 0x3

.field public static final AUDIO_SCENARIO_MEETING:I = 0x8

.field public static final CAMERA:I = 0x1

.field public static final CAPTURE_BRIGHTNESS_LEVEL_BRIGHT:I = 0x1

.field public static final CAPTURE_BRIGHTNESS_LEVEL_DARK:I = 0x2

.field public static final CAPTURE_BRIGHTNESS_LEVEL_INVALID:I = -0x1

.field public static final CAPTURE_BRIGHTNESS_LEVEL_NORMAL:I = 0x0

.field public static final CHANNEL_PROFILE_CLOUD_GAMING:I = 0x3

.field public static final CHANNEL_PROFILE_COMMUNICATION:I = 0x0

.field public static final CHANNEL_PROFILE_COMMUNICATION_1v1:I = 0x4

.field public static final CHANNEL_PROFILE_GAME:I = 0x2

.field public static final CHANNEL_PROFILE_LIVE_BROADCASTING:I = 0x1

.field public static final CHAT_BEAUTIFIER_FRESH:I = 0x1010200

.field public static final CHAT_BEAUTIFIER_MAGNETIC:I = 0x1010100

.field public static final CHAT_BEAUTIFIER_VITALITY:I = 0x1010300

.field public static final CLIENT_ROLE_AUDIENCE:I = 0x2

.field public static final CLIENT_ROLE_BROADCASTER:I = 0x1

.field public static final CODEC_CAPABILITY_LEVEL_1080P30FPS:I = 0xa

.field public static final CODEC_CAPABILITY_LEVEL_1080P60FPS:I = 0x14

.field public static final CODEC_CAPABILITY_LEVEL_4K60FPS:I = 0x1e

.field public static final CODEC_CAPABILITY_LEVEL_BASIC_SUPPORT:I = 0x5

.field public static final CODEC_CAPABILITY_LEVEL_UNSPECIFIED:I = -0x1

.field public static final CONNECTION_CHANGED_BANNED_BY_SERVER:I = 0x3

.field public static final CONNECTION_CHANGED_CERTIFICATION_VERYFY_FAILURE:I = 0x16

.field public static final CONNECTION_CHANGED_CLIENT_IP_ADDRESS_CHANGED:I = 0xd

.field public static final CONNECTION_CHANGED_CLIENT_IP_ADDRESS_CHANGED_BY_USER:I = 0x12

.field public static final CONNECTION_CHANGED_CONNECTING:I = 0x0

.field public static final CONNECTION_CHANGED_ECHO_TEST:I = 0x11

.field public static final CONNECTION_CHANGED_INTERRUPTED:I = 0x2

.field public static final CONNECTION_CHANGED_INVALID_APP_ID:I = 0x6

.field public static final CONNECTION_CHANGED_INVALID_CHANNEL_NAME:I = 0x7

.field public static final CONNECTION_CHANGED_INVALID_TOKEN:I = 0x8

.field public static final CONNECTION_CHANGED_JOIN_FAILED:I = 0x4

.field public static final CONNECTION_CHANGED_JOIN_SUCCESS:I = 0x1

.field public static final CONNECTION_CHANGED_KEEP_ALIVE_TIMEOUT:I = 0xe

.field public static final CONNECTION_CHANGED_LEAVE_CHANNEL:I = 0x5

.field public static final CONNECTION_CHANGED_LICENSE_VALIDATION_FAILURE:I = 0x15

.field public static final CONNECTION_CHANGED_LOST:I = 0x10

.field public static final CONNECTION_CHANGED_REJECTED_BY_SERVER:I = 0xa

.field public static final CONNECTION_CHANGED_REJOIN_SUCCESS:I = 0xf

.field public static final CONNECTION_CHANGED_RENEW_TOKEN:I = 0xc

.field public static final CONNECTION_CHANGED_SAME_UID_LOGIN:I = 0x13

.field public static final CONNECTION_CHANGED_SETTING_PROXY_SERVER:I = 0xb

.field public static final CONNECTION_CHANGED_TOKEN_EXPIRED:I = 0x9

.field public static final CONNECTION_CHANGED_TOO_MANY_BROADCASTERS:I = 0x14

.field public static final CONNECTION_STATE_CONNECTED:I = 0x3

.field public static final CONNECTION_STATE_CONNECTING:I = 0x2

.field public static final CONNECTION_STATE_DISCONNECTED:I = 0x1

.field public static final CONNECTION_STATE_FAILED:I = 0x5

.field public static final CONNECTION_STATE_RECONNECTING:I = 0x4

.field public static final CONTENT_INSPECT_NEUTRAL:I = 0x1

.field public static final CONTENT_INSPECT_PORN:I = 0x3

.field public static final CONTENT_INSPECT_SEXY:I = 0x2

.field public static final DEFAULT_CONNECTION_ID:I = 0x0

.field public static final EAR_MONITORING_FILTER_BUILT_IN_AUDIO_FILTERS:I = 0x2

.field public static final EAR_MONITORING_FILTER_NOISE_SUPPRESSION:I = 0x4

.field public static final EAR_MONITORING_FILTER_NONE:I = 0x1

.field public static final EAR_MONITORING_FILTER_REUSE_POST_PROCESSING_FILTER:I = 0x8000

.field public static final ENCRYPTION_ERROR_DATASTREAM_DECRYPTION_FAILURE:I = 0x3

.field public static final ENCRYPTION_ERROR_DATASTREAM_ENCRYPTION_FAILURE:I = 0x4

.field public static final ENCRYPTION_ERROR_DECRYPTION_FAILURE:I = 0x1

.field public static final ENCRYPTION_ERROR_ENCRYPTION_FAILURE:I = 0x2

.field public static final ENCRYPTION_ERROR_INTERNAL_FAILURE:I = 0x0

.field public static final ERR_ABORTED:I = 0x14

.field public static final ERR_ADM_GENERAL_ERROR:I = 0x3ed

.field public static final ERR_ADM_INIT_PLAYOUT:I = 0x3f0

.field public static final ERR_ADM_INIT_RECORDING:I = 0x3f3

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

.field public static final ERR_DATASTREAM_DECRYPTION_FAILED:I = 0x7a

.field public static final ERR_DECRYPTION_FAILED:I = 0x78

.field public static final ERR_ENCRYPTED_STREAM_NOT_ALLOWED_PUBLISH:I = 0x82

.field public static final ERR_FAILED:I = 0x1

.field public static final ERR_INIT_NET_ENGINE:I = 0x15

.field public static final ERR_INVALID_APP_ID:I = 0x65

.field public static final ERR_INVALID_ARGUMENT:I = 0x2

.field public static final ERR_INVALID_CHANNEL_NAME:I = 0x66

.field public static final ERR_INVALID_STATE:I = 0x8

.field public static final ERR_INVALID_TOKEN:I = 0x6e

.field public static final ERR_INVALID_USER_ACCOUNT:I = 0x86

.field public static final ERR_INVALID_USER_ID:I = 0x79

.field public static final ERR_JOIN_CHANNEL_REJECTED:I = 0x11

.field public static final ERR_LEAVE_CHANNEL_REJECTED:I = 0x12

.field public static final ERR_LICENSE_CREDENTIAL_INVALID:I = 0x83

.field public static final ERR_LOAD_MEDIA_ENGINE:I = 0x3e9

.field public static final ERR_MODULE_NOT_FOUND:I = 0x9d

.field public static final ERR_NET_DOWN:I = 0xe

.field public static final ERR_NOT_INITIALIZED:I = 0x7

.field public static final ERR_NOT_IN_CHANNEL:I = 0x71

.field public static final ERR_NOT_READY:I = 0x3

.field public static final ERR_NOT_SUPPORTED:I = 0x4

.field public static final ERR_NO_PERMISSION:I = 0x9

.field public static final ERR_NO_SERVER_RESOURCES:I = 0x67

.field public static final ERR_OK:I = 0x0

.field public static final ERR_REFUSED:I = 0x5

.field public static final ERR_RESOURCE_LIMITED:I = 0x16

.field public static final ERR_SCREEN_CAPTURE_PERMISSION_DENIED:I = 0x10

.field public static final ERR_SCREEN_CAPTURE_SYSTEM_AUDIO_NOT_SUPPORTED:I = 0x3

.field public static final ERR_SCREEN_CAPTURE_SYSTEM_NOT_SUPPORTED:I = 0x2

.field public static final ERR_SET_CLIENT_ROLE_NOT_AUTHORIZED:I = 0x77

.field public static final ERR_SIZE_TOO_LARGE:I = 0x72

.field public static final ERR_STREAM_MESSAGE_TIMEOUT:I = 0x75

.field public static final ERR_TIMEDOUT:I = 0xa

.field public static final ERR_TOKEN_EXPIRED:I = 0x6d

.field public static final ERR_TOO_MANY_DATA_STREAMS:I = 0x74

.field public static final ERR_TOO_OFTEN:I = 0xc

.field public static final ERR_VDM_CAMERA_NOT_AUTHORIZED:I = 0x5dd

.field public static final EXPERIENCE_QUALITY_BAD:I = 0x1

.field public static final EXPERIENCE_QUALITY_GOOD:I = 0x0

.field public static final EXPERIENCE_REASON_NONE:I = 0x0

.field public static final FEATURE_VIDEO_BEAUTY_EFFECT:I = 0x2

.field public static final FEATURE_VIDEO_VIRTUAL_BACKGROUND:I = 0x1

.field public static final HARDWARE_ENCODER:I = 0x0

.field public static final HEADPHONE_EQUALIZER_INEAR:I = 0x4000002

.field public static final HEADPHONE_EQUALIZER_OFF:I = 0x0

.field public static final HEADPHONE_EQUALIZER_OVEREAR:I = 0x4000001

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

.field public static final LASTMILE_PROBE_RESULT_COMPLETE:I = 0x1

.field public static final LASTMILE_PROBE_RESULT_INCOMPLETE_NO_BWE:I = 0x2

.field public static final LASTMILE_PROBE_RESULT_UNAVAILABLE:I = 0x3

.field public static final LICENSE_ERR_DIFF_DEVICES:I = 0x5

.field public static final LICENSE_ERR_EXPIRE:I = 0x2

.field public static final LICENSE_ERR_INTERNAL:I = 0x63

.field public static final LICENSE_ERR_INVALID:I = 0x1

.field public static final LICENSE_ERR_LIMITED_PERIOD:I = 0x4

.field public static final LICENSE_ERR_MINUTES_EXCEED:I = 0x3

.field public static final LOCAL_AUDIO_STREAM_REASON_CAPTURE_FAILURE:I = 0x4

.field public static final LOCAL_AUDIO_STREAM_REASON_DEVICE_BUSY:I = 0x3

.field public static final LOCAL_AUDIO_STREAM_REASON_DEVICE_NO_PERMISSION:I = 0x2

.field public static final LOCAL_AUDIO_STREAM_REASON_ENCODE_FAILURE:I = 0x5

.field public static final LOCAL_AUDIO_STREAM_REASON_FAILURE:I = 0x1

.field public static final LOCAL_AUDIO_STREAM_REASON_INTERRUPTED:I = 0x8

.field public static final LOCAL_AUDIO_STREAM_REASON_OK:I = 0x0

.field public static final LOCAL_AUDIO_STREAM_STATE_ENCODING:I = 0x2

.field public static final LOCAL_AUDIO_STREAM_STATE_FAILED:I = 0x3

.field public static final LOCAL_AUDIO_STREAM_STATE_RECORDING:I = 0x1

.field public static final LOCAL_AUDIO_STREAM_STATE_STOPPED:I = 0x0

.field public static final LOCAL_NETWORK_QUALITY_POOR:I = 0x2

.field public static final LOCAL_RPOXY_CONNECTIVITY_FIRST:I = 0x0

.field public static final LOCAL_RPOXY_LOCAL_ONLY:I = 0x1

.field public static final LOCAL_VIDEO_STREAM_REASON_CAPTURE_FAILURE:I = 0x4

.field public static final LOCAL_VIDEO_STREAM_REASON_CODEC_NOT_SUPPORT:I = 0x5

.field public static final LOCAL_VIDEO_STREAM_REASON_DEVICE_BUSY:I = 0x3

.field public static final LOCAL_VIDEO_STREAM_REASON_DEVICE_FATAL_ERROR:I = 0xf

.field public static final LOCAL_VIDEO_STREAM_REASON_DEVICE_INTERRUPT:I = 0xe

.field public static final LOCAL_VIDEO_STREAM_REASON_DEVICE_NOT_FOUND:I = 0x8

.field public static final LOCAL_VIDEO_STREAM_REASON_DEVICE_NO_PERMISSION:I = 0x2

.field public static final LOCAL_VIDEO_STREAM_REASON_FAILURE:I = 0x1

.field public static final LOCAL_VIDEO_STREAM_REASON_OK:I = 0x0

.field public static final LOCAL_VIDEO_STREAM_STATE_CAPTURING:I = 0x1

.field public static final LOCAL_VIDEO_STREAM_STATE_ENCODING:I = 0x2

.field public static final LOCAL_VIDEO_STREAM_STATE_FAILED:I = 0x3

.field public static final LOCAL_VIDEO_STREAM_STATE_STOPPED:I = 0x0

.field public static final LOG_FILTER_CRITICAL:I = 0x8

.field public static final LOG_FILTER_DEBUG:I = 0x80f

.field public static final LOG_FILTER_ERROR:I = 0xc

.field public static final LOG_FILTER_INFO:I = 0xf

.field public static final LOG_FILTER_OFF:I = 0x0

.field public static final LOG_FILTER_WARNING:I = 0xe

.field public static final LOG_LEVEL_ERROR:I = 0x4

.field public static final LOG_LEVEL_FATAL:I = 0x8

.field public static final LOG_LEVEL_INFO:I = 0x1

.field public static final LOG_LEVEL_NONE:I = 0x0

.field public static final LOG_LEVEL_WARNING:I = 0x2

.field public static final MEDIA_ENGINE_AUDIO_FILE_MIX_FINISH:I = 0xa

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

.field public static final NETWORK_TYPE_DISCONNECTED:I = 0x0

.field public static final NETWORK_TYPE_LAN:I = 0x1

.field public static final NETWORK_TYPE_MOBILE_2G:I = 0x3

.field public static final NETWORK_TYPE_MOBILE_3G:I = 0x4

.field public static final NETWORK_TYPE_MOBILE_4G:I = 0x5

.field public static final NETWORK_TYPE_MOBILE_5G:I = 0x6

.field public static final NETWORK_TYPE_UNKNOWN:I = -0x1

.field public static final NETWORK_TYPE_WIFI:I = 0x2

.field public static final PACKETIZE_MODE_H264_NON_INTERLEAVED:I = 0x0

.field public static final PACKETIZE_MODE_H264_SINGLE_NAL_UNIT:I = 0x1

.field public static final PITCH_CORRECTION:I = 0x2040100

.field public static final POSITION_BEFORE_MIXING:I = 0x8

.field public static final POSITION_EAR_MONITORING:I = 0x10

.field public static final POSITION_MIXED:I = 0x4

.field public static final POSITION_PLAYBACK:I = 0x1

.field public static final POSITION_RECORD:I = 0x2

.field public static final PROXY_TYPE_HTTP:I = 0x5

.field public static final PROXY_TYPE_HTTPS:I = 0x6

.field public static final PROXY_TYPE_LOCAL_PROXY:I = 0x3

.field public static final PROXY_TYPE_NONE_PROXY:I = 0x0

.field public static final PROXY_TYPE_TCP_AUTO_FALLBACK:I = 0x4

.field public static final PROXY_TYPE_TCP_CLOUD_PROXY:I = 0x2

.field public static final PROXY_TYPE_UDP_CLOUD_PROXY:I = 0x1

.field public static final PUB_STATE_IDLE:I = 0x0

.field public static final PUB_STATE_NO_PUBLISHED:I = 0x1

.field public static final PUB_STATE_PUBLISHED:I = 0x3

.field public static final PUB_STATE_PUBLISHING:I = 0x2

.field public static final QUALITY_BAD:I = 0x4

.field public static final QUALITY_DETECTING:I = 0x8

.field public static final QUALITY_DOWN:I = 0x6

.field public static final QUALITY_EXCELLENT:I = 0x1

.field public static final QUALITY_GOOD:I = 0x2

.field public static final QUALITY_POOR:I = 0x3

.field public static final QUALITY_REPORT_FORMAT_HTML:I = 0x1

.field public static final QUALITY_REPORT_FORMAT_JSON:I = 0x0

.field public static final QUALITY_UNKNOWN:I = 0x0

.field public static final QUALITY_UNSUPPORTED:I = 0x7

.field public static final QUALITY_VBAD:I = 0x5

.field public static final RAW_AUDIO_FRAME_OP_MODE_READ_ONLY:I = 0x0

.field public static final RAW_AUDIO_FRAME_OP_MODE_READ_WRITE:I = 0x2

.field public static final RECORD_AUDIO:I = 0x0

.field public static final RELAY_ERROR_DEST_TOKEN_EXPIRED:I = 0xb

.field public static final RELAY_ERROR_FAILED_JOIN_DEST:I = 0x5

.field public static final RELAY_ERROR_FAILED_JOIN_SRC:I = 0x4

.field public static final RELAY_ERROR_FAILED_PACKET_RECEIVED_FROM_SRC:I = 0x6

.field public static final RELAY_ERROR_FAILED_PACKET_SENT_TO_DEST:I = 0x7

.field public static final RELAY_ERROR_INTERNAL_ERROR:I = 0x9

.field public static final RELAY_ERROR_NO_RESOURCE_AVAILABLE:I = 0x3

.field public static final RELAY_ERROR_SERVER_CONNECTION_LOST:I = 0x8

.field public static final RELAY_ERROR_SERVER_ERROR_RESPONSE:I = 0x1

.field public static final RELAY_ERROR_SERVER_NO_RESPONSE:I = 0x2

.field public static final RELAY_ERROR_SRC_TOKEN_EXPIRED:I = 0xa

.field public static final RELAY_EVENT_NETWORK_CONNECTED:I = 0x1

.field public static final RELAY_EVENT_NETWORK_DISCONNECTED:I = 0x0

.field public static final RELAY_EVENT_PACKET_JOINED_DEST_CHANNEL:I = 0x3

.field public static final RELAY_EVENT_PACKET_JOINED_SRC_CHANNEL:I = 0x2

.field public static final RELAY_EVENT_PACKET_RECEIVED_AUDIO_FROM_SRC:I = 0x6

.field public static final RELAY_EVENT_PACKET_RECEIVED_VIDEO_FROM_SRC:I = 0x5

.field public static final RELAY_EVENT_PACKET_SENT_TO_DEST_CHANNEL:I = 0x4

.field public static final RELAY_EVENT_PACKET_UPDATE_DEST_CHANNEL:I = 0x7

.field public static final RELAY_EVENT_PACKET_UPDATE_DEST_CHANNEL_IS_NULL:I = 0xa

.field public static final RELAY_EVENT_PACKET_UPDATE_DEST_CHANNEL_NOT_CHANGE:I = 0x9

.field public static final RELAY_EVENT_PACKET_UPDATE_DEST_CHANNEL_REFUSED:I = 0x8

.field public static final RELAY_EVENT_PAUSE_SEND_PACKET_TO_DEST_CHANNEL_FAILED:I = 0xd

.field public static final RELAY_EVENT_PAUSE_SEND_PACKET_TO_DEST_CHANNEL_SUCCESS:I = 0xc

.field public static final RELAY_EVENT_RESUME_SEND_PACKET_TO_DEST_CHANNEL_FAILED:I = 0xf

.field public static final RELAY_EVENT_RESUME_SEND_PACKET_TO_DEST_CHANNEL_SUCCESS:I = 0xe

.field public static final RELAY_EVENT_VIDEO_PROFILE_UPDATE:I = 0xb

.field public static final RELAY_OK:I = 0x0

.field public static final RELAY_STATE_CONNECTING:I = 0x1

.field public static final RELAY_STATE_FAILURE:I = 0x3

.field public static final RELAY_STATE_IDLE:I = 0x0

.field public static final RELAY_STATE_RUNNING:I = 0x2

.field public static final REMOTE_AUDIO_REASON_INTERNAL:I = 0x0

.field public static final REMOTE_AUDIO_REASON_LOCAL_MUTED:I = 0x3

.field public static final REMOTE_AUDIO_REASON_LOCAL_PLAY_FAILED:I = 0x9

.field public static final REMOTE_AUDIO_REASON_LOCAL_UNMUTED:I = 0x4

.field public static final REMOTE_AUDIO_REASON_NETWORK_CONGESTION:I = 0x1

.field public static final REMOTE_AUDIO_REASON_NETWORK_RECOVERY:I = 0x2

.field public static final REMOTE_AUDIO_REASON_NO_PACKET_RECEIVE:I = 0x8

.field public static final REMOTE_AUDIO_REASON_REMOTE_MUTED:I = 0x5

.field public static final REMOTE_AUDIO_REASON_REMOTE_OFFLINE:I = 0x7

.field public static final REMOTE_AUDIO_REASON_REMOTE_UNMUTED:I = 0x6

.field public static final REMOTE_AUDIO_STATE_DECODING:I = 0x2

.field public static final REMOTE_AUDIO_STATE_FAILED:I = 0x4

.field public static final REMOTE_AUDIO_STATE_FROZEN:I = 0x3

.field public static final REMOTE_AUDIO_STATE_STARTING:I = 0x1

.field public static final REMOTE_AUDIO_STATE_STOPPED:I = 0x0

.field public static final REMOTE_NETWORK_QUALITY_POOR:I = 0x1

.field public static final REMOTE_VIDEO_STATE_DECODING:I = 0x2

.field public static final REMOTE_VIDEO_STATE_FAILED:I = 0x4

.field public static final REMOTE_VIDEO_STATE_FROZEN:I = 0x3

.field public static final REMOTE_VIDEO_STATE_REASON_AUDIO_FALLBACK:I = 0x8

.field public static final REMOTE_VIDEO_STATE_REASON_AUDIO_FALLBACK_RECOVERY:I = 0x9

.field public static final REMOTE_VIDEO_STATE_REASON_CODEC_NOT_SUPPORT:I = 0xd

.field public static final REMOTE_VIDEO_STATE_REASON_INTERNAL:I = 0x0

.field public static final REMOTE_VIDEO_STATE_REASON_LOCAL_MUTED:I = 0x3

.field public static final REMOTE_VIDEO_STATE_REASON_LOCAL_UNMUTED:I = 0x4

.field public static final REMOTE_VIDEO_STATE_REASON_NETWORK_CONGESTION:I = 0x1

.field public static final REMOTE_VIDEO_STATE_REASON_NETWORK_RECOVERY:I = 0x2

.field public static final REMOTE_VIDEO_STATE_REASON_REMOTE_MUTED:I = 0x5

.field public static final REMOTE_VIDEO_STATE_REASON_REMOTE_OFFLINE:I = 0x7

.field public static final REMOTE_VIDEO_STATE_REASON_REMOTE_UNMUTED:I = 0x6

.field public static final REMOTE_VIDEO_STATE_REASON_SDK_IN_BACKGROUND:I = 0xc

.field public static final REMOTE_VIDEO_STATE_STARTING:I = 0x1

.field public static final REMOTE_VIDEO_STATE_STOPPED:I = 0x0

.field public static final RENDER_MODE_ADAPTIVE:I = 0x3

.field public static final RENDER_MODE_FIT:I = 0x2

.field public static final RENDER_MODE_HIDDEN:I = 0x1

.field public static final RHYTHM_PLAYER_REASON_CAN_NOT_OPEN:I = 0x321

.field public static final RHYTHM_PLAYER_REASON_CAN_NOT_PLAY:I = 0x322

.field public static final RHYTHM_PLAYER_REASON_FAILED:I = 0x1

.field public static final RHYTHM_PLAYER_REASON_FILE_OVER_DURATION_LIMIT:I = 0x323

.field public static final RHYTHM_PLAYER_REASON_OK:I = 0x0

.field public static final RHYTHM_PLAYER_STATE_DECODING:I = 0x32c

.field public static final RHYTHM_PLAYER_STATE_FAILED:I = 0x32e

.field public static final RHYTHM_PLAYER_STATE_IDLE:I = 0x32a

.field public static final RHYTHM_PLAYER_STATE_OPENING:I = 0x32b

.field public static final RHYTHM_PLAYER_STATE_PLAYING:I = 0x32d

.field public static final ROOM_ACOUSTICS_3D_VOICE:I = 0x2010800

.field public static final ROOM_ACOUSTICS_CHORUS:I = 0x2010d00

.field public static final ROOM_ACOUSTICS_ETHEREAL:I = 0x2010700

.field public static final ROOM_ACOUSTICS_KTV:I = 0x2010100

.field public static final ROOM_ACOUSTICS_PHONOGRAPH:I = 0x2010400

.field public static final ROOM_ACOUSTICS_SPACIAL:I = 0x2010600

.field public static final ROOM_ACOUSTICS_STUDIO:I = 0x2010300

.field public static final ROOM_ACOUSTICS_VIRTUAL_STEREO:I = 0x2010500

.field public static final ROOM_ACOUSTICS_VIRTUAL_SURROUND_SOUND:I = 0x2010900

.field public static final ROOM_ACOUSTICS_VOCAL_CONCERT:I = 0x2010200

.field public static final RTMP_STREAMING_EVENT_ADVANCED_FEATURE_NOT_SUPPORT:I = 0x3

.field public static final RTMP_STREAMING_EVENT_FAILED_LOAD_IMAGE:I = 0x1

.field public static final RTMP_STREAMING_EVENT_REQUEST_TOO_OFTEN:I = 0x4

.field public static final RTMP_STREAMING_EVENT_URL_ALREADY_IN_USE:I = 0x2

.field public static final RTMP_STREAM_PUBLISH_REASON_CONNECTION_TIMEOUT:I = 0x3

.field public static final RTMP_STREAM_PUBLISH_REASON_ENCRYPTED_STREAM_NOT_ALLOWED:I = 0x2

.field public static final RTMP_STREAM_PUBLISH_REASON_FORMAT_NOT_SUPPORTED:I = 0xa

.field public static final RTMP_STREAM_PUBLISH_REASON_INTERNAL_SERVER_ERROR:I = 0x4

.field public static final RTMP_STREAM_PUBLISH_REASON_INVALID_APPID:I = 0xf

.field public static final RTMP_STREAM_PUBLISH_REASON_INVALID_ARGUMENT:I = 0x1

.field public static final RTMP_STREAM_PUBLISH_REASON_INVALID_PRIVILEGE:I = 0x10

.field public static final RTMP_STREAM_PUBLISH_REASON_NET_DOWN:I = 0xe

.field public static final RTMP_STREAM_PUBLISH_REASON_NOT_AUTHORIZED:I = 0x8

.field public static final RTMP_STREAM_PUBLISH_REASON_NOT_BROADCASTER:I = 0xb

.field public static final RTMP_STREAM_PUBLISH_REASON_OK:I = 0x0

.field public static final RTMP_STREAM_PUBLISH_REASON_REACH_LIMIT:I = 0x7

.field public static final RTMP_STREAM_PUBLISH_REASON_RTMP_SERVER_ERROR:I = 0x5

.field public static final RTMP_STREAM_PUBLISH_REASON_STREAM_NOT_FOUND:I = 0x9

.field public static final RTMP_STREAM_PUBLISH_REASON_TOO_OFTEN:I = 0x6

.field public static final RTMP_STREAM_PUBLISH_REASON_TRANSCODING_NO_MIX_STREAM:I = 0xd

.field public static final RTMP_STREAM_PUBLISH_STATE_CONNECTING:I = 0x1

.field public static final RTMP_STREAM_PUBLISH_STATE_DISCONNECTING:I = 0x5

.field public static final RTMP_STREAM_PUBLISH_STATE_FAILURE:I = 0x4

.field public static final RTMP_STREAM_PUBLISH_STATE_IDLE:I = 0x0

.field public static final RTMP_STREAM_PUBLISH_STATE_RECOVERING:I = 0x3

.field public static final RTMP_STREAM_PUBLISH_STATE_RUNNING:I = 0x2

.field public static final RTMP_STREAM_UNPUBLISH_REASON_OK:I = 0x64

.field public static final SCREEN_CAPTURE:I = 0x2

.field public static final SCREEN_CAPTURE_CONTENT_HINT_DETAILS:I = 0x2

.field public static final SCREEN_CAPTURE_CONTENT_HINT_MOTION:I = 0x1

.field public static final SCREEN_CAPTURE_CONTENT_HINT_NONE:I = 0x0

.field public static final SINGING_BEAUTIFIER:I = 0x1020100

.field public static final SOFTWARE_ENCODER:I = 0x1

.field public static final STREAM_FALLBACK_OPTION_AUDIO_ONLY:I = 0x2

.field public static final STREAM_FALLBACK_OPTION_DISABLED:I = 0x0

.field public static final STREAM_FALLBACK_OPTION_VIDEO_STREAM_LOW:I = 0x1

.field public static final STREAM_LIFE_CYCLE_BIND2CHANNEL:I = 0x1

.field public static final STREAM_LIFE_CYCLE_BIND2OWNER:I = 0x2

.field public static final STYLE_TRANSFORMATION_POPULAR:I = 0x2030200

.field public static final STYLE_TRANSFORMATION_RNB:I = 0x2030100

.field public static final SUB_STATE_IDLE:I = 0x0

.field public static final SUB_STATE_NO_SUBSCRIBED:I = 0x1

.field public static final SUB_STATE_SUBSCRIBED:I = 0x3

.field public static final SUB_STATE_SUBSCRIBING:I = 0x2

.field public static final TCC_DISABLED:I = 0x1

.field public static final TCC_ENABLED:I = 0x0

.field public static final TIMBRE_TRANSFORMATION_CLEAR:I = 0x1030600

.field public static final TIMBRE_TRANSFORMATION_DEEP:I = 0x1030200

.field public static final TIMBRE_TRANSFORMATION_FALSETTO:I = 0x1030400

.field public static final TIMBRE_TRANSFORMATION_FULL:I = 0x1030500

.field public static final TIMBRE_TRANSFORMATION_MELLOW:I = 0x1030300

.field public static final TIMBRE_TRANSFORMATION_RESOUNDING:I = 0x1030700

.field public static final TIMBRE_TRANSFORMATION_RINGING:I = 0x1030800

.field public static final TIMBRE_TRANSFORMATION_VIGOROUS:I = 0x1030100

.field public static final TRANSPORT_TYPE_NONE_PROXY:I = 0x0

.field public static final TRANSPORT_TYPE_TCP_PROXY:I = 0x2

.field public static final TRANSPORT_TYPE_UDP_PROXY:I = 0x1

.field public static final ULTRA_HIGH_QUALITY_VOICE:I = 0x1040100

.field public static final USER_OFFLINE_BECOME_AUDIENCE:I = 0x2

.field public static final USER_OFFLINE_DROPPED:I = 0x1

.field public static final USER_OFFLINE_QUIT:I = 0x0

.field public static final USER_PRIORITY_HIGH:I = 0x32

.field public static final USER_PRIORITY_NORANL:I = 0x64

.field public static final USER_STATE_ENABLE_LOCAL_VIDEO:I = 0x100

.field public static final USER_STATE_ENABLE_VIDEO:I = 0x10

.field public static final USER_STATE_MUTE_AUDIO:I = 0x1

.field public static final USER_STATE_MUTE_VIDEO:I = 0x2

.field public static final VIDEO_CODEC_GENERIC:I = 0x6

.field public static final VIDEO_CODEC_GENERIC_H264:I = 0x7

.field public static final VIDEO_CODEC_GENERIC_JPEG:I = 0x14

.field public static final VIDEO_CODEC_H264:I = 0x2

.field public static final VIDEO_CODEC_H265:I = 0x3

.field public static final VIDEO_CODEC_VP8:I = 0x1

.field public static final VIDEO_CODEC_VP9:I = 0xd

.field public static final VIDEO_FRAME_TYPE_BLANK_FRAME:I = 0x0

.field public static final VIDEO_FRAME_TYPE_B_FRAME:I = 0x5

.field public static final VIDEO_FRAME_TYPE_DELTA_FRAME:I = 0x4

.field public static final VIDEO_FRAME_TYPE_KEY_FRAME:I = 0x3

.field public static final VIDEO_FRAME_TYPE_UNKNOWN:I = 0x6

.field public static final VIDEO_MIRROR_MODE_AUTO:I = 0x0

.field public static final VIDEO_MIRROR_MODE_DISABLED:I = 0x2

.field public static final VIDEO_MIRROR_MODE_ENABLED:I = 0x1

.field public static final VIDEO_ORIENTATION_0:I = 0x0

.field public static final VIDEO_ORIENTATION_180:I = 0xb4

.field public static final VIDEO_ORIENTATION_270:I = 0x10e

.field public static final VIDEO_ORIENTATION_90:I = 0x5a

.field public static final VIDEO_PROFILE_1080P:I = 0x3c
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_1080P_3:I = 0x3e
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_1080P_5:I = 0x40
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_120P:I = 0x0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_120P_3:I = 0x2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_1440P:I = 0x42
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_1440P_2:I = 0x43
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_180P:I = 0xa
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_180P_3:I = 0xc
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_180P_4:I = 0xd
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_240P:I = 0x14
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_240P_3:I = 0x16
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_240P_4:I = 0x17
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_360P:I = 0x1e
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_360P_10:I = 0x27
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_360P_11:I = 0x64
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_360P_3:I = 0x20
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_360P_4:I = 0x21
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_360P_6:I = 0x23
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_360P_7:I = 0x24
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_360P_8:I = 0x25
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_360P_9:I = 0x26
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_480P:I = 0x28
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_480P_10:I = 0x31
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_480P_3:I = 0x2a
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_480P_4:I = 0x2b
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_480P_6:I = 0x2d
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_480P_8:I = 0x2f
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_480P_9:I = 0x30
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_4K:I = 0x46
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_4K_3:I = 0x48
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_720P:I = 0x32
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_720P_3:I = 0x34
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_720P_5:I = 0x36
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_720P_6:I = 0x37
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_PROFILE_DEFAULT:I = 0x1e
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VIDEO_SOURCE_CAMERA_PRIMARY:I = 0x0

.field public static final VIDEO_SOURCE_CAMERA_SECONDARY:I = 0x1

.field public static final VIDEO_SOURCE_CUSTOM:I = 0x4

.field public static final VIDEO_SOURCE_MEDIA_PLAYER:I = 0x5

.field public static final VIDEO_SOURCE_REMOTE:I = 0x9

.field public static final VIDEO_SOURCE_RTC_IMAGE_GIF:I = 0x8

.field public static final VIDEO_SOURCE_RTC_IMAGE_JPEG:I = 0x7

.field public static final VIDEO_SOURCE_RTC_IMAGE_PNG:I = 0x6

.field public static final VIDEO_SOURCE_SCREEN_PRIMARY:I = 0x2

.field public static final VIDEO_SOURCE_SCREEN_SECONDARY:I = 0x3

.field public static final VIDEO_SOURCE_TRANSCODED:I = 0xa

.field public static final VIDEO_SOURCE_UNKNOWN:I = 0x64

.field public static final VIDEO_STREAM_HIGH:I = 0x0

.field public static final VIDEO_STREAM_LOW:I = 0x1

.field public static final VOICE_BEAUTIFIER_OFF:I = 0x0

.field public static final VOICE_CHANGER_BASS:I = 0x3010400

.field public static final VOICE_CHANGER_CARTOON:I = 0x3010500

.field public static final VOICE_CHANGER_CHILDLIKE:I = 0x3010600

.field public static final VOICE_CHANGER_CHIPMUNK:I = 0x3010f00

.field public static final VOICE_CHANGER_DARTH_VADER:I = 0x3010b00

.field public static final VOICE_CHANGER_EFFECT_BOY:I = 0x2020300

.field public static final VOICE_CHANGER_EFFECT_GIRL:I = 0x2020500

.field public static final VOICE_CHANGER_EFFECT_HULK:I = 0x2020700

.field public static final VOICE_CHANGER_EFFECT_OLDMAN:I = 0x2020200

.field public static final VOICE_CHANGER_EFFECT_PIGKING:I = 0x2020600

.field public static final VOICE_CHANGER_EFFECT_SISTER:I = 0x2020400

.field public static final VOICE_CHANGER_EFFECT_UNCLE:I = 0x2020100

.field public static final VOICE_CHANGER_GIRLISH_MAN:I = 0x3010e00

.field public static final VOICE_CHANGER_GROOT:I = 0x3010a00

.field public static final VOICE_CHANGER_IRON_LADY:I = 0x3010c00

.field public static final VOICE_CHANGER_MONSTER:I = 0x3010800

.field public static final VOICE_CHANGER_NEUTRAL:I = 0x3010100

.field public static final VOICE_CHANGER_PHONE_OPERATOR:I = 0x3010700

.field public static final VOICE_CHANGER_SHIN_CHAN:I = 0x3010d00

.field public static final VOICE_CHANGER_SOLID:I = 0x3010300

.field public static final VOICE_CHANGER_SWEET:I = 0x3010200

.field public static final VOICE_CHANGER_TRANSFORMERS:I = 0x3010900

.field public static final VOICE_CONVERSION_OFF:I = 0x0

.field public static final VT_ERR_INTERNAL:I = 0x14

.field public static final VT_ERR_INVALID_IMAGE_PATH:I = 0x3

.field public static final VT_ERR_INVALID_LAYOUT:I = 0x5

.field public static final VT_ERR_INVALID_VIDEO_SOURCE_TYPE:I = 0x2

.field public static final VT_ERR_UNSUPPORT_IMAGE_FORMAT:I = 0x4

.field public static final VT_ERR_VIDEO_SOURCE_NOT_READY:I = 0x1

.field public static final WARN_ADM_GLITCH_STATE:I = 0x41c

.field public static final WARN_ADM_IMPROPER_SETTINGS:I = 0x41d

.field public static final WARN_ADM_PLAYOUT_AUDIO_LOWLEVEL:I = 0x408

.field public static final WARN_ADM_POP_STATE:I = 0x41f

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

.field public static final WIFI_BLUETOOTH_COEXIST:I = 0x8

.field public static final WIRELESS_SIGNAL_POOR:I = 0x4

.field public static final WLACC_MESSAGE_REASON_CHANNEL_CONGESTION:I = 0x1

.field public static final WLACC_MESSAGE_REASON_WEAK_SIGNAL:I = 0x0

.field public static final WLACC_SUGGEST_ACTION_CHECK_5G:I = 0x2

.field public static final WLACC_SUGGEST_ACTION_CLOSE_TO_WIFI:I = 0x0

.field public static final WLACC_SUGGEST_ACTION_CONNECT_SSID:I = 0x1

.field public static final WLACC_SUGGEST_ACTION_MODIFY_SSID:I = 0x3


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
