.class public final enum Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ChatHeatActionData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ExclusiveAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

.field public static final enum ACCEPT:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

.field public static final enum CANCEL:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

.field public static final enum CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

.field public static final enum ENTER_CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

.field public static final enum INVITE:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

.field public static final enum SPECIAL_REMIND:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;


# instance fields
.field action:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->ENTER_CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->INVITE:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->ACCEPT:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->CANCEL:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->SPECIAL_REMIND:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 2
    .line 3
    const-string v1, "CHECK"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "check"

    .line 7
    .line 8
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 14
    .line 15
    const-string v1, "ENTER_CHECK"

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->ENTER_CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 22
    .line 23
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 24
    .line 25
    const/4 v1, 0x2

    .line 26
    const-string v2, "invite"

    .line 27
    .line 28
    const-string v3, "INVITE"

    .line 29
    .line 30
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->INVITE:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 34
    .line 35
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 36
    .line 37
    const/4 v1, 0x3

    .line 38
    const-string v2, "accept"

    .line 39
    .line 40
    const-string v3, "ACCEPT"

    .line 41
    .line 42
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->ACCEPT:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 46
    .line 47
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 48
    .line 49
    const/4 v1, 0x4

    .line 50
    const-string v2, "cancel"

    .line 51
    .line 52
    const-string v3, "CANCEL"

    .line 53
    .line 54
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->CANCEL:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 58
    .line 59
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 60
    .line 61
    const/4 v1, 0x5

    .line 62
    const-string v2, "setSpecialRemind"

    .line 63
    .line 64
    const-string v3, "SPECIAL_REMIND"

    .line 65
    .line 66
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->SPECIAL_REMIND:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 70
    .line 71
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->$values()[Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->$VALUES:[Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 76
    .line 77
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->action:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->$VALUES:[Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getAction()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->action:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
