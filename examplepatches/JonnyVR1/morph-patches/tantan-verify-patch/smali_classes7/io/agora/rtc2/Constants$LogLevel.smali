.class public final enum Lio/agora/rtc2/Constants$LogLevel;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LogLevel"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/Constants$LogLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/Constants$LogLevel;

.field public static final enum LOG_LEVEL_ERROR:Lio/agora/rtc2/Constants$LogLevel;

.field public static final enum LOG_LEVEL_FATAL:Lio/agora/rtc2/Constants$LogLevel;

.field public static final enum LOG_LEVEL_INFO:Lio/agora/rtc2/Constants$LogLevel;

.field public static final enum LOG_LEVEL_NONE:Lio/agora/rtc2/Constants$LogLevel;

.field public static final enum LOG_LEVEL_WARN:Lio/agora/rtc2/Constants$LogLevel;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    new-instance v0, Lio/agora/rtc2/Constants$LogLevel;

    const-string v1, "LOG_LEVEL_NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/rtc2/Constants$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/Constants$LogLevel;->LOG_LEVEL_NONE:Lio/agora/rtc2/Constants$LogLevel;

    new-instance v1, Lio/agora/rtc2/Constants$LogLevel;

    const-string v2, "LOG_LEVEL_INFO"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lio/agora/rtc2/Constants$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/Constants$LogLevel;->LOG_LEVEL_INFO:Lio/agora/rtc2/Constants$LogLevel;

    new-instance v2, Lio/agora/rtc2/Constants$LogLevel;

    const-string v3, "LOG_LEVEL_WARN"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lio/agora/rtc2/Constants$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/rtc2/Constants$LogLevel;->LOG_LEVEL_WARN:Lio/agora/rtc2/Constants$LogLevel;

    new-instance v3, Lio/agora/rtc2/Constants$LogLevel;

    const-string v4, "LOG_LEVEL_ERROR"

    const/4 v5, 0x3

    const/4 v6, 0x4

    invoke-direct {v3, v4, v5, v6}, Lio/agora/rtc2/Constants$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/agora/rtc2/Constants$LogLevel;->LOG_LEVEL_ERROR:Lio/agora/rtc2/Constants$LogLevel;

    new-instance v4, Lio/agora/rtc2/Constants$LogLevel;

    const-string v5, "LOG_LEVEL_FATAL"

    const/16 v7, 0x8

    invoke-direct {v4, v5, v6, v7}, Lio/agora/rtc2/Constants$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lio/agora/rtc2/Constants$LogLevel;->LOG_LEVEL_FATAL:Lio/agora/rtc2/Constants$LogLevel;

    filled-new-array {v0, v1, v2, v3, v4}, [Lio/agora/rtc2/Constants$LogLevel;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/Constants$LogLevel;->$VALUES:[Lio/agora/rtc2/Constants$LogLevel;

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

    iput p3, p0, Lio/agora/rtc2/Constants$LogLevel;->value:I

    return-void
.end method

.method public static getValue(Lio/agora/rtc2/Constants$LogLevel;)I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/Constants$LogLevel;->value:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/Constants$LogLevel;
    .locals 1

    const-class v0, Lio/agora/rtc2/Constants$LogLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/Constants$LogLevel;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/Constants$LogLevel;
    .locals 1

    sget-object v0, Lio/agora/rtc2/Constants$LogLevel;->$VALUES:[Lio/agora/rtc2/Constants$LogLevel;

    invoke-virtual {v0}, [Lio/agora/rtc2/Constants$LogLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/Constants$LogLevel;

    return-object v0
.end method
