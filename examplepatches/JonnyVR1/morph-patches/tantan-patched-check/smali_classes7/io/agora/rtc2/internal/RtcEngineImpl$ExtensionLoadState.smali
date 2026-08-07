.class final enum Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ExtensionLoadState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;

.field public static final enum LOADED:Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;

.field public static final enum LOAD_FAIL:Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;

    const-string v1, "LOADED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;->LOADED:Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;

    new-instance v1, Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;

    const-string v2, "LOAD_FAIL"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;->LOAD_FAIL:Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;

    filled-new-array {v0, v1}, [Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;->$VALUES:[Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;
    .locals 1

    const-class v0, Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;
    .locals 1

    sget-object v0, Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;->$VALUES:[Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;

    invoke-virtual {v0}, [Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/internal/RtcEngineImpl$ExtensionLoadState;

    return-object v0
.end method
