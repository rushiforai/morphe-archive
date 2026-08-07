.class public final enum Lio/agora/rtc2/DirectCdnStreamingReason;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/DirectCdnStreamingReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/DirectCdnStreamingReason;

.field public static final enum AUDIO_PUBLICATION:Lio/agora/rtc2/DirectCdnStreamingReason;

.field public static final enum BAD_NAME:Lio/agora/rtc2/DirectCdnStreamingReason;

.field public static final enum FAILED:Lio/agora/rtc2/DirectCdnStreamingReason;

.field public static final enum NET_CONNECT:Lio/agora/rtc2/DirectCdnStreamingReason;

.field public static final enum OK:Lio/agora/rtc2/DirectCdnStreamingReason;

.field public static final enum VIDEO_PUBLICATION:Lio/agora/rtc2/DirectCdnStreamingReason;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    new-instance v0, Lio/agora/rtc2/DirectCdnStreamingReason;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/rtc2/DirectCdnStreamingReason;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/DirectCdnStreamingReason;->OK:Lio/agora/rtc2/DirectCdnStreamingReason;

    new-instance v1, Lio/agora/rtc2/DirectCdnStreamingReason;

    const-string v2, "FAILED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lio/agora/rtc2/DirectCdnStreamingReason;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/DirectCdnStreamingReason;->FAILED:Lio/agora/rtc2/DirectCdnStreamingReason;

    new-instance v2, Lio/agora/rtc2/DirectCdnStreamingReason;

    const-string v3, "AUDIO_PUBLICATION"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lio/agora/rtc2/DirectCdnStreamingReason;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/rtc2/DirectCdnStreamingReason;->AUDIO_PUBLICATION:Lio/agora/rtc2/DirectCdnStreamingReason;

    new-instance v3, Lio/agora/rtc2/DirectCdnStreamingReason;

    const-string v4, "VIDEO_PUBLICATION"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v5}, Lio/agora/rtc2/DirectCdnStreamingReason;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/agora/rtc2/DirectCdnStreamingReason;->VIDEO_PUBLICATION:Lio/agora/rtc2/DirectCdnStreamingReason;

    new-instance v4, Lio/agora/rtc2/DirectCdnStreamingReason;

    const-string v5, "NET_CONNECT"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6, v6}, Lio/agora/rtc2/DirectCdnStreamingReason;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lio/agora/rtc2/DirectCdnStreamingReason;->NET_CONNECT:Lio/agora/rtc2/DirectCdnStreamingReason;

    new-instance v5, Lio/agora/rtc2/DirectCdnStreamingReason;

    const-string v6, "BAD_NAME"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7, v7}, Lio/agora/rtc2/DirectCdnStreamingReason;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lio/agora/rtc2/DirectCdnStreamingReason;->BAD_NAME:Lio/agora/rtc2/DirectCdnStreamingReason;

    filled-new-array/range {v0 .. v5}, [Lio/agora/rtc2/DirectCdnStreamingReason;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/DirectCdnStreamingReason;->$VALUES:[Lio/agora/rtc2/DirectCdnStreamingReason;

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

    iput p3, p0, Lio/agora/rtc2/DirectCdnStreamingReason;->value:I

    return-void
.end method

.method public static fromInt(I)Lio/agora/rtc2/DirectCdnStreamingReason;
    .locals 5
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-static {}, Lio/agora/rtc2/DirectCdnStreamingReason;->values()[Lio/agora/rtc2/DirectCdnStreamingReason;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lio/agora/rtc2/DirectCdnStreamingReason;->getValue()I

    move-result v4

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lio/agora/rtc2/DirectCdnStreamingReason;->FAILED:Lio/agora/rtc2/DirectCdnStreamingReason;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/DirectCdnStreamingReason;
    .locals 1

    const-class v0, Lio/agora/rtc2/DirectCdnStreamingReason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/DirectCdnStreamingReason;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/DirectCdnStreamingReason;
    .locals 1

    sget-object v0, Lio/agora/rtc2/DirectCdnStreamingReason;->$VALUES:[Lio/agora/rtc2/DirectCdnStreamingReason;

    invoke-virtual {v0}, [Lio/agora/rtc2/DirectCdnStreamingReason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/DirectCdnStreamingReason;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/DirectCdnStreamingReason;->value:I

    return p0
.end method
