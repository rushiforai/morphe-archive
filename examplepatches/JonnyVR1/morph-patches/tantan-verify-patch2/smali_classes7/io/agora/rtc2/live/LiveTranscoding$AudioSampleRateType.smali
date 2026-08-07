.class public final enum Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/live/LiveTranscoding;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AudioSampleRateType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

.field public static final enum TYPE_32000:Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

.field public static final enum TYPE_44100:Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

.field public static final enum TYPE_48000:Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    new-instance v0, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    const/4 v1, 0x0

    const/16 v2, 0x7d00

    const-string v3, "TYPE_32000"

    invoke-direct {v0, v3, v1, v2}, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;->TYPE_32000:Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    new-instance v1, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    const/4 v2, 0x1

    const v3, 0xac44

    const-string v4, "TYPE_44100"

    invoke-direct {v1, v4, v2, v3}, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;->TYPE_44100:Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    new-instance v2, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    const/4 v3, 0x2

    const v4, 0xbb80

    const-string v5, "TYPE_48000"

    invoke-direct {v2, v5, v3, v4}, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;->TYPE_48000:Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    filled-new-array {v0, v1, v2}, [Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;->$VALUES:[Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

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

    iput p3, p0, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;->value:I

    return-void
.end method

.method public static getValue(Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;)I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;->value:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;
    .locals 1

    const-class v0, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;
    .locals 1

    sget-object v0, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;->$VALUES:[Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    invoke-virtual {v0}, [Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    return-object v0
.end method
