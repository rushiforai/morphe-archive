.class public final enum Lio/agora/rtc2/Constants$ExternalVideoSourceType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ExternalVideoSourceType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/Constants$ExternalVideoSourceType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/Constants$ExternalVideoSourceType;

.field public static final enum ENCODED_VIDEO_FRAME:Lio/agora/rtc2/Constants$ExternalVideoSourceType;

.field public static final enum VIDEO_FRAME:Lio/agora/rtc2/Constants$ExternalVideoSourceType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lio/agora/rtc2/Constants$ExternalVideoSourceType;

    const-string v1, "VIDEO_FRAME"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/rtc2/Constants$ExternalVideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/Constants$ExternalVideoSourceType;->VIDEO_FRAME:Lio/agora/rtc2/Constants$ExternalVideoSourceType;

    new-instance v1, Lio/agora/rtc2/Constants$ExternalVideoSourceType;

    const-string v2, "ENCODED_VIDEO_FRAME"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lio/agora/rtc2/Constants$ExternalVideoSourceType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/Constants$ExternalVideoSourceType;->ENCODED_VIDEO_FRAME:Lio/agora/rtc2/Constants$ExternalVideoSourceType;

    filled-new-array {v0, v1}, [Lio/agora/rtc2/Constants$ExternalVideoSourceType;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/Constants$ExternalVideoSourceType;->$VALUES:[Lio/agora/rtc2/Constants$ExternalVideoSourceType;

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

    iput p3, p0, Lio/agora/rtc2/Constants$ExternalVideoSourceType;->value:I

    return-void
.end method

.method public static getValue(Lio/agora/rtc2/Constants$ExternalVideoSourceType;)I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/Constants$ExternalVideoSourceType;->value:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/Constants$ExternalVideoSourceType;
    .locals 1

    const-class v0, Lio/agora/rtc2/Constants$ExternalVideoSourceType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/Constants$ExternalVideoSourceType;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/Constants$ExternalVideoSourceType;
    .locals 1

    sget-object v0, Lio/agora/rtc2/Constants$ExternalVideoSourceType;->$VALUES:[Lio/agora/rtc2/Constants$ExternalVideoSourceType;

    invoke-virtual {v0}, [Lio/agora/rtc2/Constants$ExternalVideoSourceType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/Constants$ExternalVideoSourceType;

    return-object v0
.end method
