.class public Lcom/tencent/ugc/TXRecordCommon;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/ugc/TXRecordCommon$ITXBGMNotify;,
        Lcom/tencent/ugc/TXRecordCommon$TXUGCCustomConfig;,
        Lcom/tencent/ugc/TXRecordCommon$TXUGCSimpleConfig;,
        Lcom/tencent/ugc/TXRecordCommon$ITXSnapshotListener;,
        Lcom/tencent/ugc/TXRecordCommon$ITXVideoRecordListener;,
        Lcom/tencent/ugc/TXRecordCommon$TXRecordResult;
    }
.end annotation


# static fields
.field public static final AUDIO_SAMPLERATE_16000:I = 0x3e80

.field public static final AUDIO_SAMPLERATE_32000:I = 0x7d00

.field public static final AUDIO_SAMPLERATE_44100:I = 0xac44

.field public static final AUDIO_SAMPLERATE_48000:I = 0xbb80

.field public static final AUDIO_SAMPLERATE_8000:I = 0x1f40

.field public static final EVT_CAMERA_CANNOT_USE:I = 0x3

.field public static final EVT_DESCRIPTION:Ljava/lang/String; = "EVT_DESCRIPTION"

.field public static final EVT_ID_PAUSE:I = 0x1

.field public static final EVT_ID_RESUME:I = 0x2

.field public static final EVT_MIC_CANNOT_USE:I = 0x4

.field public static final EVT_PARAM1:Ljava/lang/String; = "EVT_PARAM1"

.field public static final EVT_PARAM2:Ljava/lang/String; = "EVT_PARAM2"

.field public static final EVT_TIME:Ljava/lang/String; = "EVT_TIME"

.field public static final RECORD_RESULT_COMPOSE_CANCEL:I = -0x7

.field public static final RECORD_RESULT_COMPOSE_INTERNAL_ERR:I = -0x9

.field public static final RECORD_RESULT_COMPOSE_SET_DST_PATH_ERR:I = -0x5

.field public static final RECORD_RESULT_COMPOSE_SET_SRC_PATH_ERR:I = -0x4

.field public static final RECORD_RESULT_COMPOSE_START_ERR:I = -0x6

.field public static final RECORD_RESULT_COMPOSE_VERIFY_FAIL:I = -0x8

.field public static final RECORD_RESULT_FAILED:I = -0x1

.field public static final RECORD_RESULT_FILE_ERR:I = -0x3

.field public static final RECORD_RESULT_OK:I = 0x0

.field public static final RECORD_RESULT_OK_LESS_THAN_MINDURATION:I = 0x1

.field public static final RECORD_RESULT_OK_REACHED_MAXDURATION:I = 0x2

.field public static final RECORD_RESULT_SUSPEND_FOR_NO_TASK:I = -0x2

.field public static final RECORD_SPEED_FAST:I = 0x3

.field public static final RECORD_SPEED_FASTEST:I = 0x4

.field public static final RECORD_SPEED_NORMAL:I = 0x2

.field public static final RECORD_SPEED_SLOW:I = 0x1

.field public static final RECORD_SPEED_SLOWEST:I = 0x0

.field public static final RECORD_TYPE_STREAM_SOURCE:I = 0x1

.field public static final START_RECORD_ERR_API_IS_LOWER_THAN_18:I = -0x3

.field public static final START_RECORD_ERR_IS_IN_RECORDING:I = -0x1

.field public static final START_RECORD_ERR_LICENCE_VERIFICATION_FAILED:I = -0x5

.field public static final START_RECORD_ERR_NOT_INIT:I = -0x4

.field public static final START_RECORD_ERR_VIDEO_PATH_IS_EMPTY:I = -0x2

.field public static final START_RECORD_OK:I = 0x0

.field public static final VIDEO_ASPECT_RATIO_16_9:I = 0x3

.field public static final VIDEO_ASPECT_RATIO_1_1:I = 0x2

.field public static final VIDEO_ASPECT_RATIO_3_4:I = 0x1

.field public static final VIDEO_ASPECT_RATIO_4_3:I = 0x4

.field public static final VIDEO_ASPECT_RATIO_9_16:I = 0x0

.field public static final VIDEO_QUALITY_HIGH:I = 0x2

.field public static final VIDEO_QUALITY_LOW:I = 0x0

.field public static final VIDEO_QUALITY_MEDIUM:I = 0x1

.field public static final VIDEO_RENDER_MODE_ADJUST_RESOLUTION:I = 0x1

.field public static final VIDEO_RENDER_MODE_FULL_FILL_SCREEN:I = 0x0

.field public static final VIDEO_RESOLUTION_1080_1920:I = 0x3

.field public static final VIDEO_RESOLUTION_360_640:I = 0x0

.field public static final VIDEO_RESOLUTION_540_960:I = 0x1

.field public static final VIDEO_RESOLUTION_720_1280:I = 0x2

.field public static final VIDOE_REVERB_TYPE_0:I = 0x0

.field public static final VIDOE_REVERB_TYPE_1:I = 0x1

.field public static final VIDOE_REVERB_TYPE_2:I = 0x2

.field public static final VIDOE_REVERB_TYPE_3:I = 0x3

.field public static final VIDOE_REVERB_TYPE_4:I = 0x4

.field public static final VIDOE_REVERB_TYPE_5:I = 0x5

.field public static final VIDOE_REVERB_TYPE_6:I = 0x6

.field public static final VIDOE_REVERB_TYPE_7:I = 0x7

.field public static final VIDOE_VOICECHANGER_TYPE_0:I = 0x0

.field public static final VIDOE_VOICECHANGER_TYPE_1:I = 0x1

.field public static final VIDOE_VOICECHANGER_TYPE_10:I = 0xa

.field public static final VIDOE_VOICECHANGER_TYPE_11:I = 0xb

.field public static final VIDOE_VOICECHANGER_TYPE_2:I = 0x2

.field public static final VIDOE_VOICECHANGER_TYPE_3:I = 0x3

.field public static final VIDOE_VOICECHANGER_TYPE_4:I = 0x4

.field public static final VIDOE_VOICECHANGER_TYPE_6:I = 0x6

.field public static final VIDOE_VOICECHANGER_TYPE_7:I = 0x7

.field public static final VIDOE_VOICECHANGER_TYPE_8:I = 0x8

.field public static final VIDOE_VOICECHANGER_TYPE_9:I = 0x9


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
