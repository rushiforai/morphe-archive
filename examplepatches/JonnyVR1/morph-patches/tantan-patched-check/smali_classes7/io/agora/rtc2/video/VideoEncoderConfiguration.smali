.class public Lio/agora/rtc2/video/VideoEncoderConfiguration;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;,
        Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;,
        Lio/agora/rtc2/video/VideoEncoderConfiguration$CODEC_CAP_MASK;,
        Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;,
        Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;,
        Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;,
        Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;,
        Lio/agora/rtc2/video/VideoEncoderConfiguration$ORIENTATION_MODE;,
        Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;,
        Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;
    }
.end annotation


# static fields
.field public static final COMPATIBLE_BITRATE:I = -0x1

.field public static final DEFAULT_MIN_BITRATE:I = -0x1

.field public static final DEFAULT_MIN_BITRATE_EQUAL_TO_TARGET_BITRATE:I = -0x2

.field public static final DEFAULT_MIN_FRAMERATE:I = -0x1

.field public static final STANDARD_BITRATE:I

.field public static final VD_120x120:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_1280x720:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_160x120:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_180x180:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_1920x1080:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_240x180:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_240x240:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_2540x1440:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_320x180:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_320x240:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_360x360:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_3840x2160:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_424x240:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_480x360:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_480x480:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_640x360:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_640x480:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_840x480:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_960x540:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public static final VD_960x720:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;


# instance fields
.field public advanceOptions:Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;

.field public bitrate:I

.field public codecType:Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;

.field public degradationPrefer:Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;

.field public dimensions:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

.field public frameRate:I

.field public minBitrate:I

.field public minFrameRate:I

.field public mirrorMode:Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;

.field public orientationMode:Lio/agora/rtc2/video/VideoEncoderConfiguration$ORIENTATION_MODE;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v1, 0x78

    invoke-direct {v0, v1, v1}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_120x120:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v2, 0xa0

    invoke-direct {v0, v2, v1}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_160x120:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v1, 0xb4

    invoke-direct {v0, v1, v1}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_180x180:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v2, 0xf0

    invoke-direct {v0, v2, v1}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_240x180:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v3, 0x140

    invoke-direct {v0, v3, v1}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_320x180:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    invoke-direct {v0, v2, v2}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_240x240:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    invoke-direct {v0, v3, v2}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_320x240:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v1, 0x1a8

    invoke-direct {v0, v1, v2}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_424x240:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v1, 0x168

    invoke-direct {v0, v1, v1}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_360x360:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v2, 0x1e0

    invoke-direct {v0, v2, v1}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_480x360:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v3, 0x280

    invoke-direct {v0, v3, v1}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_640x360:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    invoke-direct {v0, v2, v2}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_480x480:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    invoke-direct {v0, v3, v2}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_640x480:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v1, 0x348

    invoke-direct {v0, v1, v2}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_840x480:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v1, 0x21c

    const/16 v2, 0x3c0

    invoke-direct {v0, v2, v1}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_960x540:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v1, 0x2d0

    invoke-direct {v0, v2, v1}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_960x720:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v2, 0x500

    invoke-direct {v0, v2, v1}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_1280x720:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v1, 0x780

    const/16 v2, 0x438

    invoke-direct {v0, v1, v2}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_1920x1080:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v1, 0x9ec

    const/16 v2, 0x5a0

    invoke-direct {v0, v1, v2}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_2540x1440:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v1, 0xf00

    const/16 v2, 0x870

    invoke-direct {v0, v1, v2}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->VD_3840x2160:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    const/16 v1, 0x3c0

    const/16 v2, 0x21c

    invoke-direct {v0, v1, v2}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    iput-object v0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->dimensions:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    sget-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->FRAME_RATE_FPS_15:Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    invoke-virtual {v0}, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->getValue()I

    move-result v0

    iput v0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->frameRate:I

    const/4 v0, -0x1

    iput v0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->minFrameRate:I

    const/4 v1, 0x0

    iput v1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->bitrate:I

    iput v0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->minBitrate:I

    sget-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$ORIENTATION_MODE;->ORIENTATION_MODE_ADAPTIVE:Lio/agora/rtc2/video/VideoEncoderConfiguration$ORIENTATION_MODE;

    iput-object v0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->orientationMode:Lio/agora/rtc2/video/VideoEncoderConfiguration$ORIENTATION_MODE;

    sget-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;->MAINTAIN_AUTO:Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;

    iput-object v0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->degradationPrefer:Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;

    sget-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;->MIRROR_MODE_DISABLED:Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;

    iput-object v0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->mirrorMode:Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;

    sget-object v2, Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;->PREFER_AUTO:Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;

    sget-object v3, Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;->PREFER_COMPRESSION_AUTO:Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;

    invoke-direct {v0, v2, v3, v1}, Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;-><init>(Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;Z)V

    iput-object v0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->advanceOptions:Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;

    sget-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;->VIDEO_CODEC_NONE:Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;

    iput-object v0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->codecType:Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;

    return-void
.end method

.method public constructor <init>(IILio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;ILio/agora/rtc2/video/VideoEncoderConfiguration$ORIENTATION_MODE;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    invoke-direct {v0, p1, p2}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    iput-object v0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->dimensions:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    invoke-virtual {p3}, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->getValue()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->frameRate:I

    const/4 p1, -0x1

    iput p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->minFrameRate:I

    iput p4, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->bitrate:I

    iput p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->minBitrate:I

    iput-object p5, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->orientationMode:Lio/agora/rtc2/video/VideoEncoderConfiguration$ORIENTATION_MODE;

    sget-object p1, Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;->MAINTAIN_AUTO:Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->degradationPrefer:Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;

    sget-object p1, Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;->MIRROR_MODE_DISABLED:Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->mirrorMode:Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;

    new-instance p1, Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;

    sget-object p2, Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;->PREFER_AUTO:Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;

    sget-object p3, Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;->PREFER_COMPRESSION_AUTO:Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;

    const/4 p4, 0x0

    invoke-direct {p1, p2, p3, p4}, Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;-><init>(Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;Z)V

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->advanceOptions:Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;

    sget-object p1, Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;->VIDEO_CODEC_NONE:Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->codecType:Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;

    return-void
.end method

.method public constructor <init>(IILio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;ILio/agora/rtc2/video/VideoEncoderConfiguration$ORIENTATION_MODE;Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;)V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    invoke-direct {v0, p1, p2}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>(II)V

    iput-object v0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->dimensions:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    invoke-virtual {p3}, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->getValue()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->frameRate:I

    const/4 p1, -0x1

    iput p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->minFrameRate:I

    iput p4, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->bitrate:I

    iput p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->minBitrate:I

    iput-object p5, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->orientationMode:Lio/agora/rtc2/video/VideoEncoderConfiguration$ORIENTATION_MODE;

    sget-object p1, Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;->MAINTAIN_AUTO:Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->degradationPrefer:Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;

    iput-object p6, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->mirrorMode:Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;

    new-instance p1, Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;

    sget-object p2, Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;->PREFER_AUTO:Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;

    sget-object p3, Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;->PREFER_COMPRESSION_AUTO:Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;

    const/4 p4, 0x0

    invoke-direct {p1, p2, p3, p4}, Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;-><init>(Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;Z)V

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->advanceOptions:Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;

    sget-object p1, Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;->VIDEO_CODEC_NONE:Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->codecType:Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;

    return-void
.end method

.method public constructor <init>(Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;ILio/agora/rtc2/video/VideoEncoderConfiguration$ORIENTATION_MODE;)V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->dimensions:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    invoke-virtual {p2}, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->getValue()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->frameRate:I

    const/4 p1, -0x1

    iput p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->minFrameRate:I

    iput p3, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->bitrate:I

    iput p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->minBitrate:I

    iput-object p4, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->orientationMode:Lio/agora/rtc2/video/VideoEncoderConfiguration$ORIENTATION_MODE;

    sget-object p1, Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;->MAINTAIN_AUTO:Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->degradationPrefer:Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;

    sget-object p1, Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;->MIRROR_MODE_DISABLED:Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->mirrorMode:Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;

    new-instance p1, Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;

    sget-object p2, Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;->PREFER_AUTO:Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;

    sget-object p3, Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;->PREFER_COMPRESSION_AUTO:Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;

    const/4 p4, 0x0

    invoke-direct {p1, p2, p3, p4}, Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;-><init>(Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;Z)V

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->advanceOptions:Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;

    sget-object p1, Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;->VIDEO_CODEC_NONE:Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->codecType:Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;

    return-void
.end method

.method public constructor <init>(Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;ILio/agora/rtc2/video/VideoEncoderConfiguration$ORIENTATION_MODE;Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->dimensions:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    invoke-virtual {p2}, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->getValue()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->frameRate:I

    const/4 p1, -0x1

    iput p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->minFrameRate:I

    iput p3, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->bitrate:I

    iput p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->minBitrate:I

    iput-object p4, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->orientationMode:Lio/agora/rtc2/video/VideoEncoderConfiguration$ORIENTATION_MODE;

    sget-object p1, Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;->MAINTAIN_AUTO:Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->degradationPrefer:Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;

    iput-object p5, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->mirrorMode:Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;

    new-instance p1, Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;

    sget-object p2, Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;->PREFER_AUTO:Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;

    sget-object p3, Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;->PREFER_COMPRESSION_AUTO:Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;

    const/4 p4, 0x0

    invoke-direct {p1, p2, p3, p4}, Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;-><init>(Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;Z)V

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->advanceOptions:Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;

    sget-object p1, Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;->VIDEO_CODEC_NONE:Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;

    iput-object p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->codecType:Lio/agora/rtc2/video/VideoEncoderConfiguration$VIDEO_CODEC_TYPE;

    return-void
.end method
