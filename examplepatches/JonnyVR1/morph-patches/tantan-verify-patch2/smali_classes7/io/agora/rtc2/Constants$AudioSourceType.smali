.class public final enum Lio/agora/rtc2/Constants$AudioSourceType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AudioSourceType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/Constants$AudioSourceType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/Constants$AudioSourceType;

.field public static final enum AUDIO_SOURCE_CUSTOM:Lio/agora/rtc2/Constants$AudioSourceType;

.field public static final enum AUDIO_SOURCE_LOOPBACK_RECORDING:Lio/agora/rtc2/Constants$AudioSourceType;

.field public static final enum AUDIO_SOURCE_MEDIA_PLAYER:Lio/agora/rtc2/Constants$AudioSourceType;

.field public static final enum AUDIO_SOURCE_MICROPHONE:Lio/agora/rtc2/Constants$AudioSourceType;

.field public static final enum AUDIO_SOURCE_MIXED_STREAM:Lio/agora/rtc2/Constants$AudioSourceType;

.field public static final enum AUDIO_SOURCE_REMOTE_CHANNEL:Lio/agora/rtc2/Constants$AudioSourceType;

.field public static final enum AUDIO_SOURCE_REMOTE_USER:Lio/agora/rtc2/Constants$AudioSourceType;

.field public static final enum AUDIO_SOURCE_UNKNOWN:Lio/agora/rtc2/Constants$AudioSourceType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 11

    new-instance v0, Lio/agora/rtc2/Constants$AudioSourceType;

    const-string v1, "AUDIO_SOURCE_MICROPHONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/rtc2/Constants$AudioSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/Constants$AudioSourceType;->AUDIO_SOURCE_MICROPHONE:Lio/agora/rtc2/Constants$AudioSourceType;

    new-instance v1, Lio/agora/rtc2/Constants$AudioSourceType;

    const-string v2, "AUDIO_SOURCE_CUSTOM"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lio/agora/rtc2/Constants$AudioSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/Constants$AudioSourceType;->AUDIO_SOURCE_CUSTOM:Lio/agora/rtc2/Constants$AudioSourceType;

    new-instance v2, Lio/agora/rtc2/Constants$AudioSourceType;

    const-string v3, "AUDIO_SOURCE_MEDIA_PLAYER"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lio/agora/rtc2/Constants$AudioSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/rtc2/Constants$AudioSourceType;->AUDIO_SOURCE_MEDIA_PLAYER:Lio/agora/rtc2/Constants$AudioSourceType;

    new-instance v3, Lio/agora/rtc2/Constants$AudioSourceType;

    const-string v4, "AUDIO_SOURCE_LOOPBACK_RECORDING"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v5}, Lio/agora/rtc2/Constants$AudioSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/agora/rtc2/Constants$AudioSourceType;->AUDIO_SOURCE_LOOPBACK_RECORDING:Lio/agora/rtc2/Constants$AudioSourceType;

    new-instance v4, Lio/agora/rtc2/Constants$AudioSourceType;

    const-string v5, "AUDIO_SOURCE_MIXED_STREAM"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6, v6}, Lio/agora/rtc2/Constants$AudioSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lio/agora/rtc2/Constants$AudioSourceType;->AUDIO_SOURCE_MIXED_STREAM:Lio/agora/rtc2/Constants$AudioSourceType;

    new-instance v5, Lio/agora/rtc2/Constants$AudioSourceType;

    const-string v6, "AUDIO_SOURCE_REMOTE_USER"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7, v7}, Lio/agora/rtc2/Constants$AudioSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lio/agora/rtc2/Constants$AudioSourceType;->AUDIO_SOURCE_REMOTE_USER:Lio/agora/rtc2/Constants$AudioSourceType;

    new-instance v6, Lio/agora/rtc2/Constants$AudioSourceType;

    const-string v7, "AUDIO_SOURCE_REMOTE_CHANNEL"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8, v8}, Lio/agora/rtc2/Constants$AudioSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lio/agora/rtc2/Constants$AudioSourceType;->AUDIO_SOURCE_REMOTE_CHANNEL:Lio/agora/rtc2/Constants$AudioSourceType;

    new-instance v7, Lio/agora/rtc2/Constants$AudioSourceType;

    const/4 v8, 0x7

    const/16 v9, 0x64

    const-string v10, "AUDIO_SOURCE_UNKNOWN"

    invoke-direct {v7, v10, v8, v9}, Lio/agora/rtc2/Constants$AudioSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lio/agora/rtc2/Constants$AudioSourceType;->AUDIO_SOURCE_UNKNOWN:Lio/agora/rtc2/Constants$AudioSourceType;

    filled-new-array/range {v0 .. v7}, [Lio/agora/rtc2/Constants$AudioSourceType;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/Constants$AudioSourceType;->$VALUES:[Lio/agora/rtc2/Constants$AudioSourceType;

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

    iput p3, p0, Lio/agora/rtc2/Constants$AudioSourceType;->value:I

    return-void
.end method

.method public static fromInt(I)Lio/agora/rtc2/Constants$AudioSourceType;
    .locals 5

    invoke-static {}, Lio/agora/rtc2/Constants$AudioSourceType;->values()[Lio/agora/rtc2/Constants$AudioSourceType;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lio/agora/rtc2/Constants$AudioSourceType;->getValue()I

    move-result v4

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lio/agora/rtc2/Constants$AudioSourceType;->AUDIO_SOURCE_UNKNOWN:Lio/agora/rtc2/Constants$AudioSourceType;

    return-object p0
.end method

.method public static getValue(Lio/agora/rtc2/Constants$AudioSourceType;)I
    .locals 0

    .line 2
    iget p0, p0, Lio/agora/rtc2/Constants$AudioSourceType;->value:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/Constants$AudioSourceType;
    .locals 1

    const-class v0, Lio/agora/rtc2/Constants$AudioSourceType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/Constants$AudioSourceType;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/Constants$AudioSourceType;
    .locals 1

    sget-object v0, Lio/agora/rtc2/Constants$AudioSourceType;->$VALUES:[Lio/agora/rtc2/Constants$AudioSourceType;

    invoke-virtual {v0}, [Lio/agora/rtc2/Constants$AudioSourceType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/Constants$AudioSourceType;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/rtc2/Constants$AudioSourceType;->value:I

    return p0
.end method
