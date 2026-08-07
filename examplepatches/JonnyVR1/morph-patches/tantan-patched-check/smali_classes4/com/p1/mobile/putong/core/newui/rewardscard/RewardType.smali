.class public final enum Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

.field public static final enum ADVANCE:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

.field public static final enum BOOST:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

.field public static final enum NOTHING:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

.field public static final enum ROAMING:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

.field public static final enum SUPERLIKE:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

.field public static final enum UNDO:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;


# instance fields
.field public final text:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->SUPERLIKE:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->UNDO:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->ROAMING:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->BOOST:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->ADVANCE:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->NOTHING:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

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
    new-instance v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "superLike"

    .line 5
    .line 6
    const-string v3, "SUPERLIKE"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->SUPERLIKE:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "undo"

    .line 17
    .line 18
    const-string v3, "UNDO"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->UNDO:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-string v2, "roaming"

    .line 29
    .line 30
    const-string v3, "ROAMING"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->ROAMING:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 36
    .line 37
    new-instance v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    const-string v2, "boost"

    .line 41
    .line 42
    const-string v3, "BOOST"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->BOOST:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 48
    .line 49
    new-instance v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    const-string v2, "advancedSearch"

    .line 53
    .line 54
    const-string v3, "ADVANCE"

    .line 55
    .line 56
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->ADVANCE:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 60
    .line 61
    new-instance v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 62
    .line 63
    const/4 v1, 0x5

    .line 64
    const-string v2, "nothing"

    .line 65
    .line 66
    const-string v3, "NOTHING"

    .line 67
    .line 68
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->NOTHING:Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->$values()[Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sput-object v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->$VALUES:[Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 78
    .line 79
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
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->text:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->$VALUES:[Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/newui/rewardscard/RewardType;

    .line 8
    .line 9
    return-object v0
.end method
