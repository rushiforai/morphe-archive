.class public final enum Lio/agora/rtc2/DirectCdnStreamingState;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/DirectCdnStreamingState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/DirectCdnStreamingState;

.field public static final enum FAILED:Lio/agora/rtc2/DirectCdnStreamingState;

.field public static final enum IDLE:Lio/agora/rtc2/DirectCdnStreamingState;

.field public static final enum RECOVERING:Lio/agora/rtc2/DirectCdnStreamingState;

.field public static final enum RUNNING:Lio/agora/rtc2/DirectCdnStreamingState;

.field public static final enum STOPPED:Lio/agora/rtc2/DirectCdnStreamingState;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Lio/agora/rtc2/DirectCdnStreamingState;

    const-string v1, "IDLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/rtc2/DirectCdnStreamingState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/DirectCdnStreamingState;->IDLE:Lio/agora/rtc2/DirectCdnStreamingState;

    new-instance v1, Lio/agora/rtc2/DirectCdnStreamingState;

    const-string v2, "RUNNING"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lio/agora/rtc2/DirectCdnStreamingState;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/DirectCdnStreamingState;->RUNNING:Lio/agora/rtc2/DirectCdnStreamingState;

    new-instance v2, Lio/agora/rtc2/DirectCdnStreamingState;

    const-string v3, "STOPPED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lio/agora/rtc2/DirectCdnStreamingState;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/rtc2/DirectCdnStreamingState;->STOPPED:Lio/agora/rtc2/DirectCdnStreamingState;

    new-instance v3, Lio/agora/rtc2/DirectCdnStreamingState;

    const-string v4, "FAILED"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v5}, Lio/agora/rtc2/DirectCdnStreamingState;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/agora/rtc2/DirectCdnStreamingState;->FAILED:Lio/agora/rtc2/DirectCdnStreamingState;

    new-instance v4, Lio/agora/rtc2/DirectCdnStreamingState;

    const-string v5, "RECOVERING"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6, v6}, Lio/agora/rtc2/DirectCdnStreamingState;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lio/agora/rtc2/DirectCdnStreamingState;->RECOVERING:Lio/agora/rtc2/DirectCdnStreamingState;

    filled-new-array {v0, v1, v2, v3, v4}, [Lio/agora/rtc2/DirectCdnStreamingState;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/DirectCdnStreamingState;->$VALUES:[Lio/agora/rtc2/DirectCdnStreamingState;

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

    iput p3, p0, Lio/agora/rtc2/DirectCdnStreamingState;->value:I

    return-void
.end method

.method public static fromInt(I)Lio/agora/rtc2/DirectCdnStreamingState;
    .locals 5
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-static {}, Lio/agora/rtc2/DirectCdnStreamingState;->values()[Lio/agora/rtc2/DirectCdnStreamingState;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lio/agora/rtc2/DirectCdnStreamingState;->getValue()I

    move-result v4

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lio/agora/rtc2/DirectCdnStreamingState;->FAILED:Lio/agora/rtc2/DirectCdnStreamingState;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/DirectCdnStreamingState;
    .locals 1

    const-class v0, Lio/agora/rtc2/DirectCdnStreamingState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/DirectCdnStreamingState;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/DirectCdnStreamingState;
    .locals 1

    sget-object v0, Lio/agora/rtc2/DirectCdnStreamingState;->$VALUES:[Lio/agora/rtc2/DirectCdnStreamingState;

    invoke-virtual {v0}, [Lio/agora/rtc2/DirectCdnStreamingState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/DirectCdnStreamingState;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/DirectCdnStreamingState;->value:I

    return p0
.end method
