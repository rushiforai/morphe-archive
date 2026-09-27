.class final enum Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;
.super Ljava/lang/Enum;
.source "NativeCaptionBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Refresh"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

.field public static final enum AI_STARTED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

.field public static final enum APPLIED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

.field public static final enum CAPTIONS_OFF:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

.field public static final enum DEFERRED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;


# direct methods
.method private static synthetic $values()[Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;
    .registers 3

    const/4 v0, 0x4

    .line 68
    new-array v0, v0, [Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->APPLIED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->AI_STARTED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->CAPTIONS_OFF:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->DEFERRED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 68
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    const-string v1, "APPLIED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->APPLIED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    new-instance v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    const-string v1, "AI_STARTED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->AI_STARTED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    new-instance v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    const-string v1, "CAPTIONS_OFF"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->CAPTIONS_OFF:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    new-instance v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    const-string v1, "DEFERRED"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->DEFERRED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->$values()[Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->$VALUES:[Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 68
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 68
    const-class v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    return-object p0
.end method

.method public static values()[Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;
    .registers 1

    .line 68
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->$VALUES:[Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    invoke-virtual {v0}, [Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    return-object v0
.end method
