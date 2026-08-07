.class public final enum Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/video/VideoEncoderConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FRAME_RATE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

.field public static final enum FRAME_RATE_FPS_1:Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

.field public static final enum FRAME_RATE_FPS_10:Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

.field public static final enum FRAME_RATE_FPS_15:Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

.field public static final enum FRAME_RATE_FPS_24:Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

.field public static final enum FRAME_RATE_FPS_30:Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

.field public static final enum FRAME_RATE_FPS_60:Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

.field public static final enum FRAME_RATE_FPS_7:Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    const-string v1, "FRAME_RATE_FPS_1"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->FRAME_RATE_FPS_1:Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    new-instance v1, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    const-string v2, "FRAME_RATE_FPS_7"

    const/4 v4, 0x7

    invoke-direct {v1, v2, v3, v4}, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->FRAME_RATE_FPS_7:Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    new-instance v2, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    const/4 v3, 0x2

    const/16 v4, 0xa

    const-string v5, "FRAME_RATE_FPS_10"

    invoke-direct {v2, v5, v3, v4}, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->FRAME_RATE_FPS_10:Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    new-instance v3, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    const/4 v4, 0x3

    const/16 v5, 0xf

    const-string v6, "FRAME_RATE_FPS_15"

    invoke-direct {v3, v6, v4, v5}, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->FRAME_RATE_FPS_15:Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    new-instance v4, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    const/4 v5, 0x4

    const/16 v6, 0x18

    const-string v7, "FRAME_RATE_FPS_24"

    invoke-direct {v4, v7, v5, v6}, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->FRAME_RATE_FPS_24:Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    new-instance v5, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    const/4 v6, 0x5

    const/16 v7, 0x1e

    const-string v8, "FRAME_RATE_FPS_30"

    invoke-direct {v5, v8, v6, v7}, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->FRAME_RATE_FPS_30:Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    new-instance v6, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    const/4 v7, 0x6

    const/16 v8, 0x3c

    const-string v9, "FRAME_RATE_FPS_60"

    invoke-direct {v6, v9, v7, v8}, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->FRAME_RATE_FPS_60:Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    filled-new-array/range {v0 .. v6}, [Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->$VALUES:[Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

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

    iput p3, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;
    .locals 1

    const-class v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;
    .locals 1

    sget-object v0, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->$VALUES:[Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    invoke-virtual {v0}, [Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration$FRAME_RATE;->value:I

    return p0
.end method
