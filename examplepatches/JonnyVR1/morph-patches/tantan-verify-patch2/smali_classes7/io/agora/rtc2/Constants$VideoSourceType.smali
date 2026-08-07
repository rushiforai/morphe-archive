.class public final enum Lio/agora/rtc2/Constants$VideoSourceType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "VideoSourceType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/Constants$VideoSourceType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/Constants$VideoSourceType;

.field public static final enum VIDEO_SOURCE_CAMERA_FOURTH:Lio/agora/rtc2/Constants$VideoSourceType;

.field public static final enum VIDEO_SOURCE_CAMERA_PRIMARY:Lio/agora/rtc2/Constants$VideoSourceType;

.field public static final enum VIDEO_SOURCE_CAMERA_SECONDARY:Lio/agora/rtc2/Constants$VideoSourceType;

.field public static final enum VIDEO_SOURCE_CAMERA_THIRD:Lio/agora/rtc2/Constants$VideoSourceType;

.field public static final enum VIDEO_SOURCE_CUSTOM:Lio/agora/rtc2/Constants$VideoSourceType;

.field public static final enum VIDEO_SOURCE_MEDIA_PLAYER:Lio/agora/rtc2/Constants$VideoSourceType;

.field public static final enum VIDEO_SOURCE_REMOTE:Lio/agora/rtc2/Constants$VideoSourceType;

.field public static final enum VIDEO_SOURCE_RTC_IMAGE_GIF:Lio/agora/rtc2/Constants$VideoSourceType;

.field public static final enum VIDEO_SOURCE_RTC_IMAGE_JPEG:Lio/agora/rtc2/Constants$VideoSourceType;

.field public static final enum VIDEO_SOURCE_RTC_IMAGE_PNG:Lio/agora/rtc2/Constants$VideoSourceType;

.field public static final enum VIDEO_SOURCE_SCREEN_PRIMARY:Lio/agora/rtc2/Constants$VideoSourceType;

.field public static final enum VIDEO_SOURCE_SCREEN_SECONDARY:Lio/agora/rtc2/Constants$VideoSourceType;

.field public static final enum VIDEO_SOURCE_SPEECH_DRIVEN:Lio/agora/rtc2/Constants$VideoSourceType;

.field public static final enum VIDEO_SOURCE_TRANSCODED:Lio/agora/rtc2/Constants$VideoSourceType;

.field public static final enum VIDEO_SOURCE_UNKNOWN:Lio/agora/rtc2/Constants$VideoSourceType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 18

    new-instance v0, Lio/agora/rtc2/Constants$VideoSourceType;

    const-string v1, "VIDEO_SOURCE_CAMERA_PRIMARY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/rtc2/Constants$VideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_CAMERA_PRIMARY:Lio/agora/rtc2/Constants$VideoSourceType;

    new-instance v1, Lio/agora/rtc2/Constants$VideoSourceType;

    const-string v2, "VIDEO_SOURCE_CAMERA_SECONDARY"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lio/agora/rtc2/Constants$VideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_CAMERA_SECONDARY:Lio/agora/rtc2/Constants$VideoSourceType;

    new-instance v2, Lio/agora/rtc2/Constants$VideoSourceType;

    const-string v3, "VIDEO_SOURCE_SCREEN_PRIMARY"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lio/agora/rtc2/Constants$VideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_SCREEN_PRIMARY:Lio/agora/rtc2/Constants$VideoSourceType;

    new-instance v3, Lio/agora/rtc2/Constants$VideoSourceType;

    const-string v4, "VIDEO_SOURCE_SCREEN_SECONDARY"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v5}, Lio/agora/rtc2/Constants$VideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_SCREEN_SECONDARY:Lio/agora/rtc2/Constants$VideoSourceType;

    new-instance v4, Lio/agora/rtc2/Constants$VideoSourceType;

    const-string v5, "VIDEO_SOURCE_CUSTOM"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6, v6}, Lio/agora/rtc2/Constants$VideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_CUSTOM:Lio/agora/rtc2/Constants$VideoSourceType;

    new-instance v5, Lio/agora/rtc2/Constants$VideoSourceType;

    const-string v6, "VIDEO_SOURCE_MEDIA_PLAYER"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7, v7}, Lio/agora/rtc2/Constants$VideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_MEDIA_PLAYER:Lio/agora/rtc2/Constants$VideoSourceType;

    new-instance v6, Lio/agora/rtc2/Constants$VideoSourceType;

    const-string v7, "VIDEO_SOURCE_RTC_IMAGE_PNG"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8, v8}, Lio/agora/rtc2/Constants$VideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_RTC_IMAGE_PNG:Lio/agora/rtc2/Constants$VideoSourceType;

    new-instance v7, Lio/agora/rtc2/Constants$VideoSourceType;

    const-string v8, "VIDEO_SOURCE_RTC_IMAGE_JPEG"

    const/4 v9, 0x7

    invoke-direct {v7, v8, v9, v9}, Lio/agora/rtc2/Constants$VideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_RTC_IMAGE_JPEG:Lio/agora/rtc2/Constants$VideoSourceType;

    new-instance v8, Lio/agora/rtc2/Constants$VideoSourceType;

    const-string v9, "VIDEO_SOURCE_RTC_IMAGE_GIF"

    const/16 v10, 0x8

    invoke-direct {v8, v9, v10, v10}, Lio/agora/rtc2/Constants$VideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_RTC_IMAGE_GIF:Lio/agora/rtc2/Constants$VideoSourceType;

    new-instance v9, Lio/agora/rtc2/Constants$VideoSourceType;

    const-string v10, "VIDEO_SOURCE_REMOTE"

    const/16 v11, 0x9

    invoke-direct {v9, v10, v11, v11}, Lio/agora/rtc2/Constants$VideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_REMOTE:Lio/agora/rtc2/Constants$VideoSourceType;

    new-instance v10, Lio/agora/rtc2/Constants$VideoSourceType;

    const-string v11, "VIDEO_SOURCE_TRANSCODED"

    const/16 v12, 0xa

    invoke-direct {v10, v11, v12, v12}, Lio/agora/rtc2/Constants$VideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_TRANSCODED:Lio/agora/rtc2/Constants$VideoSourceType;

    new-instance v11, Lio/agora/rtc2/Constants$VideoSourceType;

    const-string v12, "VIDEO_SOURCE_CAMERA_THIRD"

    const/16 v13, 0xb

    invoke-direct {v11, v12, v13, v13}, Lio/agora/rtc2/Constants$VideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_CAMERA_THIRD:Lio/agora/rtc2/Constants$VideoSourceType;

    new-instance v12, Lio/agora/rtc2/Constants$VideoSourceType;

    const-string v13, "VIDEO_SOURCE_CAMERA_FOURTH"

    const/16 v14, 0xc

    invoke-direct {v12, v13, v14, v14}, Lio/agora/rtc2/Constants$VideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_CAMERA_FOURTH:Lio/agora/rtc2/Constants$VideoSourceType;

    new-instance v13, Lio/agora/rtc2/Constants$VideoSourceType;

    const/16 v14, 0xd

    const/16 v15, 0xf

    move-object/from16 v16, v0

    const-string v0, "VIDEO_SOURCE_SPEECH_DRIVEN"

    invoke-direct {v13, v0, v14, v15}, Lio/agora/rtc2/Constants$VideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v13, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_SPEECH_DRIVEN:Lio/agora/rtc2/Constants$VideoSourceType;

    new-instance v14, Lio/agora/rtc2/Constants$VideoSourceType;

    const/16 v0, 0xe

    const/16 v15, 0x64

    move-object/from16 v17, v1

    const-string v1, "VIDEO_SOURCE_UNKNOWN"

    invoke-direct {v14, v1, v0, v15}, Lio/agora/rtc2/Constants$VideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v14, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_UNKNOWN:Lio/agora/rtc2/Constants$VideoSourceType;

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    filled-new-array/range {v0 .. v14}, [Lio/agora/rtc2/Constants$VideoSourceType;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/Constants$VideoSourceType;->$VALUES:[Lio/agora/rtc2/Constants$VideoSourceType;

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

    iput p3, p0, Lio/agora/rtc2/Constants$VideoSourceType;->value:I

    return-void
.end method

.method public static fromInt(I)Lio/agora/rtc2/Constants$VideoSourceType;
    .locals 5

    invoke-static {}, Lio/agora/rtc2/Constants$VideoSourceType;->values()[Lio/agora/rtc2/Constants$VideoSourceType;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lio/agora/rtc2/Constants$VideoSourceType;->getValue()I

    move-result v4

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_UNKNOWN:Lio/agora/rtc2/Constants$VideoSourceType;

    return-object p0
.end method

.method public static getValue(Lio/agora/rtc2/Constants$VideoSourceType;)I
    .locals 0

    .line 2
    iget p0, p0, Lio/agora/rtc2/Constants$VideoSourceType;->value:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/Constants$VideoSourceType;
    .locals 1

    const-class v0, Lio/agora/rtc2/Constants$VideoSourceType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/Constants$VideoSourceType;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/Constants$VideoSourceType;
    .locals 1

    sget-object v0, Lio/agora/rtc2/Constants$VideoSourceType;->$VALUES:[Lio/agora/rtc2/Constants$VideoSourceType;

    invoke-virtual {v0}, [Lio/agora/rtc2/Constants$VideoSourceType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/Constants$VideoSourceType;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/rtc2/Constants$VideoSourceType;->value:I

    return p0
.end method
