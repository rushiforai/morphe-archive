.class public final enum Lio/agora/rtc2/Constants$AudioTrackType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AudioTrackType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/Constants$AudioTrackType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/Constants$AudioTrackType;

.field public static final enum AUDIO_TRACK_DIRECT:Lio/agora/rtc2/Constants$AudioTrackType;

.field public static final enum AUDIO_TRACK_MIXABLE:Lio/agora/rtc2/Constants$AudioTrackType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lio/agora/rtc2/Constants$AudioTrackType;

    const-string v1, "AUDIO_TRACK_MIXABLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/rtc2/Constants$AudioTrackType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/Constants$AudioTrackType;->AUDIO_TRACK_MIXABLE:Lio/agora/rtc2/Constants$AudioTrackType;

    new-instance v1, Lio/agora/rtc2/Constants$AudioTrackType;

    const-string v2, "AUDIO_TRACK_DIRECT"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lio/agora/rtc2/Constants$AudioTrackType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/Constants$AudioTrackType;->AUDIO_TRACK_DIRECT:Lio/agora/rtc2/Constants$AudioTrackType;

    filled-new-array {v0, v1}, [Lio/agora/rtc2/Constants$AudioTrackType;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/Constants$AudioTrackType;->$VALUES:[Lio/agora/rtc2/Constants$AudioTrackType;

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

    iput p3, p0, Lio/agora/rtc2/Constants$AudioTrackType;->value:I

    return-void
.end method

.method public static getValue(Lio/agora/rtc2/Constants$AudioTrackType;)I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/Constants$AudioTrackType;->value:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/Constants$AudioTrackType;
    .locals 1

    const-class v0, Lio/agora/rtc2/Constants$AudioTrackType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/Constants$AudioTrackType;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/Constants$AudioTrackType;
    .locals 1

    sget-object v0, Lio/agora/rtc2/Constants$AudioTrackType;->$VALUES:[Lio/agora/rtc2/Constants$AudioTrackType;

    invoke-virtual {v0}, [Lio/agora/rtc2/Constants$AudioTrackType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/Constants$AudioTrackType;

    return-object v0
.end method
