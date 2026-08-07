.class public final enum Lio/agora/rtc2/Constants$SimulcastStreamMode;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SimulcastStreamMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/Constants$SimulcastStreamMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/Constants$SimulcastStreamMode;

.field public static final enum AUTO_SIMULCAST_STREAM:Lio/agora/rtc2/Constants$SimulcastStreamMode;

.field public static final enum DISABLE_SIMULCAST_STREAM:Lio/agora/rtc2/Constants$SimulcastStreamMode;

.field public static final enum ENABLE_SIMULCAST_STREAM:Lio/agora/rtc2/Constants$SimulcastStreamMode;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    new-instance v0, Lio/agora/rtc2/Constants$SimulcastStreamMode;

    const/4 v1, -0x1

    const-string v2, "AUTO_SIMULCAST_STREAM"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lio/agora/rtc2/Constants$SimulcastStreamMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/Constants$SimulcastStreamMode;->AUTO_SIMULCAST_STREAM:Lio/agora/rtc2/Constants$SimulcastStreamMode;

    new-instance v1, Lio/agora/rtc2/Constants$SimulcastStreamMode;

    const-string v2, "DISABLE_SIMULCAST_STREAM"

    const/4 v4, 0x1

    invoke-direct {v1, v2, v4, v3}, Lio/agora/rtc2/Constants$SimulcastStreamMode;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/Constants$SimulcastStreamMode;->DISABLE_SIMULCAST_STREAM:Lio/agora/rtc2/Constants$SimulcastStreamMode;

    new-instance v2, Lio/agora/rtc2/Constants$SimulcastStreamMode;

    const-string v3, "ENABLE_SIMULCAST_STREAM"

    const/4 v5, 0x2

    invoke-direct {v2, v3, v5, v4}, Lio/agora/rtc2/Constants$SimulcastStreamMode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/rtc2/Constants$SimulcastStreamMode;->ENABLE_SIMULCAST_STREAM:Lio/agora/rtc2/Constants$SimulcastStreamMode;

    filled-new-array {v0, v1, v2}, [Lio/agora/rtc2/Constants$SimulcastStreamMode;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/Constants$SimulcastStreamMode;->$VALUES:[Lio/agora/rtc2/Constants$SimulcastStreamMode;

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

    iput p3, p0, Lio/agora/rtc2/Constants$SimulcastStreamMode;->value:I

    return-void
.end method

.method public static getValue(Lio/agora/rtc2/Constants$SimulcastStreamMode;)I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/Constants$SimulcastStreamMode;->value:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/Constants$SimulcastStreamMode;
    .locals 1

    const-class v0, Lio/agora/rtc2/Constants$SimulcastStreamMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/Constants$SimulcastStreamMode;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/Constants$SimulcastStreamMode;
    .locals 1

    sget-object v0, Lio/agora/rtc2/Constants$SimulcastStreamMode;->$VALUES:[Lio/agora/rtc2/Constants$SimulcastStreamMode;

    invoke-virtual {v0}, [Lio/agora/rtc2/Constants$SimulcastStreamMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/Constants$SimulcastStreamMode;

    return-object v0
.end method
