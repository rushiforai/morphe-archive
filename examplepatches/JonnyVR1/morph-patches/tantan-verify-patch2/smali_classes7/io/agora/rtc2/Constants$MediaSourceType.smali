.class public final enum Lio/agora/rtc2/Constants$MediaSourceType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MediaSourceType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/Constants$MediaSourceType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/Constants$MediaSourceType;

.field public static final enum AUDIO_PLAYOUT_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

.field public static final enum AUDIO_RECORDING_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

.field public static final enum CUSTOM_VIDEO_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

.field public static final enum MEDIA_PLAYER_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

.field public static final enum PRIMARY_CAMERA_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

.field public static final enum PRIMARY_SCREEN_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

.field public static final enum REMOTE_VIDEO_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

.field public static final enum RTC_IMAGE_GIF_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

.field public static final enum RTC_IMAGE_JPEG_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

.field public static final enum RTC_IMAGE_PNG_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

.field public static final enum SECONDARY_CAMERA_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

.field public static final enum SECONDARY_SCREEN_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

.field public static final enum SPEECH_DRIVEN_VIDEO_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

.field public static final enum TRANSCODED_VIDEO_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

.field public static final enum UNKNOWN_MEDIA_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 18

    new-instance v0, Lio/agora/rtc2/Constants$MediaSourceType;

    const-string v1, "AUDIO_PLAYOUT_SOURCE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/rtc2/Constants$MediaSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/Constants$MediaSourceType;->AUDIO_PLAYOUT_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    new-instance v1, Lio/agora/rtc2/Constants$MediaSourceType;

    const-string v2, "AUDIO_RECORDING_SOURCE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lio/agora/rtc2/Constants$MediaSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/Constants$MediaSourceType;->AUDIO_RECORDING_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    new-instance v2, Lio/agora/rtc2/Constants$MediaSourceType;

    const-string v3, "PRIMARY_CAMERA_SOURCE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lio/agora/rtc2/Constants$MediaSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/rtc2/Constants$MediaSourceType;->PRIMARY_CAMERA_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    new-instance v3, Lio/agora/rtc2/Constants$MediaSourceType;

    const-string v4, "SECONDARY_CAMERA_SOURCE"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v5}, Lio/agora/rtc2/Constants$MediaSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/agora/rtc2/Constants$MediaSourceType;->SECONDARY_CAMERA_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    new-instance v4, Lio/agora/rtc2/Constants$MediaSourceType;

    const-string v5, "PRIMARY_SCREEN_SOURCE"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6, v6}, Lio/agora/rtc2/Constants$MediaSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lio/agora/rtc2/Constants$MediaSourceType;->PRIMARY_SCREEN_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    new-instance v5, Lio/agora/rtc2/Constants$MediaSourceType;

    const-string v6, "SECONDARY_SCREEN_SOURCE"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7, v7}, Lio/agora/rtc2/Constants$MediaSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lio/agora/rtc2/Constants$MediaSourceType;->SECONDARY_SCREEN_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    new-instance v6, Lio/agora/rtc2/Constants$MediaSourceType;

    const-string v7, "CUSTOM_VIDEO_SOURCE"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8, v8}, Lio/agora/rtc2/Constants$MediaSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lio/agora/rtc2/Constants$MediaSourceType;->CUSTOM_VIDEO_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    new-instance v7, Lio/agora/rtc2/Constants$MediaSourceType;

    const-string v8, "MEDIA_PLAYER_SOURCE"

    const/4 v9, 0x7

    invoke-direct {v7, v8, v9, v9}, Lio/agora/rtc2/Constants$MediaSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lio/agora/rtc2/Constants$MediaSourceType;->MEDIA_PLAYER_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    new-instance v8, Lio/agora/rtc2/Constants$MediaSourceType;

    const-string v9, "RTC_IMAGE_PNG_SOURCE"

    const/16 v10, 0x8

    invoke-direct {v8, v9, v10, v10}, Lio/agora/rtc2/Constants$MediaSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lio/agora/rtc2/Constants$MediaSourceType;->RTC_IMAGE_PNG_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    new-instance v9, Lio/agora/rtc2/Constants$MediaSourceType;

    const-string v10, "RTC_IMAGE_JPEG_SOURCE"

    const/16 v11, 0x9

    invoke-direct {v9, v10, v11, v11}, Lio/agora/rtc2/Constants$MediaSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lio/agora/rtc2/Constants$MediaSourceType;->RTC_IMAGE_JPEG_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    new-instance v10, Lio/agora/rtc2/Constants$MediaSourceType;

    const-string v11, "RTC_IMAGE_GIF_SOURCE"

    const/16 v12, 0xa

    invoke-direct {v10, v11, v12, v12}, Lio/agora/rtc2/Constants$MediaSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lio/agora/rtc2/Constants$MediaSourceType;->RTC_IMAGE_GIF_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    new-instance v11, Lio/agora/rtc2/Constants$MediaSourceType;

    const-string v12, "REMOTE_VIDEO_SOURCE"

    const/16 v13, 0xb

    invoke-direct {v11, v12, v13, v13}, Lio/agora/rtc2/Constants$MediaSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lio/agora/rtc2/Constants$MediaSourceType;->REMOTE_VIDEO_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    new-instance v12, Lio/agora/rtc2/Constants$MediaSourceType;

    const-string v13, "TRANSCODED_VIDEO_SOURCE"

    const/16 v14, 0xc

    invoke-direct {v12, v13, v14, v14}, Lio/agora/rtc2/Constants$MediaSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lio/agora/rtc2/Constants$MediaSourceType;->TRANSCODED_VIDEO_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    new-instance v13, Lio/agora/rtc2/Constants$MediaSourceType;

    const-string v14, "SPEECH_DRIVEN_VIDEO_SOURCE"

    const/16 v15, 0xd

    invoke-direct {v13, v14, v15, v15}, Lio/agora/rtc2/Constants$MediaSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v13, Lio/agora/rtc2/Constants$MediaSourceType;->SPEECH_DRIVEN_VIDEO_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    new-instance v14, Lio/agora/rtc2/Constants$MediaSourceType;

    const/16 v15, 0xe

    move-object/from16 v16, v0

    const/16 v0, 0x64

    move-object/from16 v17, v1

    const-string v1, "UNKNOWN_MEDIA_SOURCE"

    invoke-direct {v14, v1, v15, v0}, Lio/agora/rtc2/Constants$MediaSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v14, Lio/agora/rtc2/Constants$MediaSourceType;->UNKNOWN_MEDIA_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    filled-new-array/range {v0 .. v14}, [Lio/agora/rtc2/Constants$MediaSourceType;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/Constants$MediaSourceType;->$VALUES:[Lio/agora/rtc2/Constants$MediaSourceType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lio/agora/rtc2/Constants$MediaSourceType;->value:I

    return-void
.end method

.method public static getValue(Lio/agora/rtc2/Constants$MediaSourceType;)I
    .locals 0

    if-eqz p0, :cond_0

    iget p0, p0, Lio/agora/rtc2/Constants$MediaSourceType;->value:I

    return p0

    :cond_0
    sget-object p0, Lio/agora/rtc2/Constants$MediaSourceType;->UNKNOWN_MEDIA_SOURCE:Lio/agora/rtc2/Constants$MediaSourceType;

    iget p0, p0, Lio/agora/rtc2/Constants$MediaSourceType;->value:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/Constants$MediaSourceType;
    .locals 1

    const-class v0, Lio/agora/rtc2/Constants$MediaSourceType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/Constants$MediaSourceType;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/Constants$MediaSourceType;
    .locals 1

    sget-object v0, Lio/agora/rtc2/Constants$MediaSourceType;->$VALUES:[Lio/agora/rtc2/Constants$MediaSourceType;

    invoke-virtual {v0}, [Lio/agora/rtc2/Constants$MediaSourceType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/Constants$MediaSourceType;

    return-object v0
.end method
