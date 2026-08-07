.class public final enum Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ExpandedItemStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

.field public static final enum BE_RECYCLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

.field public static final enum IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

.field public static final enum PRE_RECYCLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

.field public static final enum PRE_REMOVE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

.field public static final enum RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;


# instance fields
.field status:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->PRE_REMOVE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->PRE_RECYCLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->BE_RECYCLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "\u672a\u521d\u59cb\u5316"

    .line 5
    .line 6
    const-string v3, "IDLE"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "\u51c6\u5907\u5220\u9664"

    .line 17
    .line 18
    const-string v3, "PRE_REMOVE"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->PRE_REMOVE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-string v2, "\u51c6\u5907\u590d\u7528"

    .line 29
    .line 30
    const-string v3, "PRE_RECYCLE"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->PRE_RECYCLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 36
    .line 37
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    const-string v2, "\u88ab\u590d\u7528"

    .line 41
    .line 42
    const-string v3, "BE_RECYCLE"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->BE_RECYCLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 48
    .line 49
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    const-string v2, "\u6e32\u67d3\u4e2d"

    .line 53
    .line 54
    const-string v3, "RENDING"

    .line 55
    .line 56
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->$values()[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->$VALUES:[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 66
    .line 67
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
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->status:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->$VALUES:[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 8
    .line 9
    return-object v0
.end method
