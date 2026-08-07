.class public final enum Lio/agora/rtc2/Constants$AudioScenario;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AudioScenario"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/Constants$AudioScenario;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/Constants$AudioScenario;

.field public static final enum CHATROOM:Lio/agora/rtc2/Constants$AudioScenario;

.field public static final enum DEFAULT:Lio/agora/rtc2/Constants$AudioScenario;

.field public static final enum GAME_STREAMING:Lio/agora/rtc2/Constants$AudioScenario;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    new-instance v0, Lio/agora/rtc2/Constants$AudioScenario;

    const-string v1, "DEFAULT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/rtc2/Constants$AudioScenario;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/Constants$AudioScenario;->DEFAULT:Lio/agora/rtc2/Constants$AudioScenario;

    new-instance v1, Lio/agora/rtc2/Constants$AudioScenario;

    const/4 v2, 0x1

    const/4 v3, 0x3

    const-string v4, "GAME_STREAMING"

    invoke-direct {v1, v4, v2, v3}, Lio/agora/rtc2/Constants$AudioScenario;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/Constants$AudioScenario;->GAME_STREAMING:Lio/agora/rtc2/Constants$AudioScenario;

    new-instance v2, Lio/agora/rtc2/Constants$AudioScenario;

    const/4 v3, 0x2

    const/4 v4, 0x5

    const-string v5, "CHATROOM"

    invoke-direct {v2, v5, v3, v4}, Lio/agora/rtc2/Constants$AudioScenario;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/rtc2/Constants$AudioScenario;->CHATROOM:Lio/agora/rtc2/Constants$AudioScenario;

    filled-new-array {v0, v1, v2}, [Lio/agora/rtc2/Constants$AudioScenario;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/Constants$AudioScenario;->$VALUES:[Lio/agora/rtc2/Constants$AudioScenario;

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

    iput p3, p0, Lio/agora/rtc2/Constants$AudioScenario;->value:I

    return-void
.end method

.method public static getValue(Lio/agora/rtc2/Constants$AudioScenario;)I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/Constants$AudioScenario;->value:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/Constants$AudioScenario;
    .locals 1

    const-class v0, Lio/agora/rtc2/Constants$AudioScenario;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/Constants$AudioScenario;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/Constants$AudioScenario;
    .locals 1

    sget-object v0, Lio/agora/rtc2/Constants$AudioScenario;->$VALUES:[Lio/agora/rtc2/Constants$AudioScenario;

    invoke-virtual {v0}, [Lio/agora/rtc2/Constants$AudioScenario;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/Constants$AudioScenario;

    return-object v0
.end method
