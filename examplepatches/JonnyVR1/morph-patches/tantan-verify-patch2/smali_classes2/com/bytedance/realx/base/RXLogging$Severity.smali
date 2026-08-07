.class public final enum Lcom/bytedance/realx/base/RXLogging$Severity;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/base/RXLogging;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Severity"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/bytedance/realx/base/RXLogging$Severity;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/bytedance/realx/base/RXLogging$Severity;

.field public static final enum LS_DEBUG:Lcom/bytedance/realx/base/RXLogging$Severity;

.field public static final enum LS_ERROR:Lcom/bytedance/realx/base/RXLogging$Severity;

.field public static final enum LS_INFO:Lcom/bytedance/realx/base/RXLogging$Severity;

.field public static final enum LS_NONE:Lcom/bytedance/realx/base/RXLogging$Severity;

.field public static final enum LS_TRACE:Lcom/bytedance/realx/base/RXLogging$Severity;

.field public static final enum LS_WARNING:Lcom/bytedance/realx/base/RXLogging$Severity;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 2
    .line 3
    const-string v1, "LS_DEBUG"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/bytedance/realx/base/RXLogging$Severity;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/bytedance/realx/base/RXLogging$Severity;->LS_DEBUG:Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 10
    .line 11
    new-instance v1, Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 12
    .line 13
    const-string v2, "LS_TRACE"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Lcom/bytedance/realx/base/RXLogging$Severity;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/bytedance/realx/base/RXLogging$Severity;->LS_TRACE:Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 20
    .line 21
    new-instance v2, Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 22
    .line 23
    const-string v3, "LS_INFO"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4}, Lcom/bytedance/realx/base/RXLogging$Severity;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/bytedance/realx/base/RXLogging$Severity;->LS_INFO:Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 30
    .line 31
    new-instance v3, Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 32
    .line 33
    const-string v4, "LS_WARNING"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5}, Lcom/bytedance/realx/base/RXLogging$Severity;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/bytedance/realx/base/RXLogging$Severity;->LS_WARNING:Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 40
    .line 41
    new-instance v4, Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 42
    .line 43
    const-string v5, "LS_ERROR"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6}, Lcom/bytedance/realx/base/RXLogging$Severity;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lcom/bytedance/realx/base/RXLogging$Severity;->LS_ERROR:Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 50
    .line 51
    new-instance v5, Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 52
    .line 53
    const-string v6, "LS_NONE"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v5, v6, v7}, Lcom/bytedance/realx/base/RXLogging$Severity;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/bytedance/realx/base/RXLogging$Severity;->LS_NONE:Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 60
    .line 61
    filled-new-array/range {v0 .. v5}, [Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/bytedance/realx/base/RXLogging$Severity;->$VALUES:[Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 66
    .line 67
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bytedance/realx/base/RXLogging$Severity;
    .locals 1

    .line 1
    const-class v0, Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/bytedance/realx/base/RXLogging$Severity;
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/base/RXLogging$Severity;->$VALUES:[Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/bytedance/realx/base/RXLogging$Severity;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/bytedance/realx/base/RXLogging$Severity;

    .line 8
    .line 9
    return-object v0
.end method
