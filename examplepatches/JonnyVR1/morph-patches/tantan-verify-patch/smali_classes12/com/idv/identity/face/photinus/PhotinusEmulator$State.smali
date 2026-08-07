.class public final enum Lcom/idv/identity/face/photinus/PhotinusEmulator$State;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/idv/identity/face/photinus/PhotinusEmulator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/idv/identity/face/photinus/PhotinusEmulator$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

.field public static final enum AT_FAULT:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

.field public static final enum AWAITING_COMPLETION:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

.field public static final enum AWAITING_FRAMES:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

.field public static final enum COMPLETED:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

.field public static final enum INVALID:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

.field public static final enum IN_COMPLETION:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

.field public static final enum READY:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;


# instance fields
.field public final isComplete:Z

.field public final isTerminalState:Z


# direct methods
.method private static synthetic $values()[Lcom/idv/identity/face/photinus/PhotinusEmulator$State;
    .locals 7

    .line 1
    sget-object v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->INVALID:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 2
    .line 3
    sget-object v1, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->READY:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 4
    .line 5
    sget-object v2, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->AWAITING_FRAMES:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 6
    .line 7
    sget-object v3, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->AWAITING_COMPLETION:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 8
    .line 9
    sget-object v4, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->IN_COMPLETION:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 10
    .line 11
    sget-object v5, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->AT_FAULT:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 12
    .line 13
    sget-object v6, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->COMPLETED:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 14
    .line 15
    filled-new-array/range {v0 .. v6}, [Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 2
    .line 3
    const-string v1, "INVALID"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v2, v3}, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;-><init>(Ljava/lang/String;IZZ)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->INVALID:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 11
    .line 12
    new-instance v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 13
    .line 14
    const-string v1, "READY"

    .line 15
    .line 16
    invoke-direct {v0, v1, v3, v2, v2}, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;-><init>(Ljava/lang/String;IZZ)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->READY:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 20
    .line 21
    new-instance v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 22
    .line 23
    const-string v1, "AWAITING_FRAMES"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v0, v1, v4, v2, v2}, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;-><init>(Ljava/lang/String;IZZ)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->AWAITING_FRAMES:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 30
    .line 31
    new-instance v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 32
    .line 33
    const-string v1, "AWAITING_COMPLETION"

    .line 34
    .line 35
    const/4 v4, 0x3

    .line 36
    invoke-direct {v0, v1, v4, v2, v2}, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;-><init>(Ljava/lang/String;IZZ)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->AWAITING_COMPLETION:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 40
    .line 41
    new-instance v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 42
    .line 43
    const-string v1, "IN_COMPLETION"

    .line 44
    .line 45
    const/4 v4, 0x4

    .line 46
    invoke-direct {v0, v1, v4, v3, v2}, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;-><init>(Ljava/lang/String;IZZ)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->IN_COMPLETION:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 50
    .line 51
    new-instance v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 52
    .line 53
    const-string v1, "AT_FAULT"

    .line 54
    .line 55
    const/4 v4, 0x5

    .line 56
    invoke-direct {v0, v1, v4, v2, v3}, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;-><init>(Ljava/lang/String;IZZ)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->AT_FAULT:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 60
    .line 61
    new-instance v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 62
    .line 63
    const-string v1, "COMPLETED"

    .line 64
    .line 65
    const/4 v2, 0x6

    .line 66
    invoke-direct {v0, v1, v2, v3, v3}, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;-><init>(Ljava/lang/String;IZZ)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->COMPLETED:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 70
    .line 71
    invoke-static {}, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->$values()[Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sput-object v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->$VALUES:[Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 76
    .line 77
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-boolean p3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->isComplete:Z

    .line 5
    .line 6
    iput-boolean p4, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->isTerminalState:Z

    .line 7
    .line 8
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/idv/identity/face/photinus/PhotinusEmulator$State;
    .locals 1

    .line 1
    const-class v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/idv/identity/face/photinus/PhotinusEmulator$State;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->$VALUES:[Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 8
    .line 9
    return-object v0
.end method
