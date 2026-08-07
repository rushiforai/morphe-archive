.class public final enum Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

.field public static final enum TOUCH_DOWN:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

.field public static final enum TOUCH_FINISH:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

.field public static final enum TOUCH_SCROLLING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

.field public static final enum TOUCH_START_SCROLL:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;


# instance fields
.field desc:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->TOUCH_DOWN:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->TOUCH_START_SCROLL:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->TOUCH_SCROLLING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->TOUCH_FINISH:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "\u5f00\u59cb\u89e6\u6478"

    .line 5
    .line 6
    const-string v3, "TOUCH_DOWN"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->TOUCH_DOWN:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "\u89e6\u6478\u89e6\u53d1\u6ed1\u52a8"

    .line 17
    .line 18
    const-string v3, "TOUCH_START_SCROLL"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->TOUCH_START_SCROLL:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-string v2, "\u89e6\u6478\u8fdb\u884c\u4e2d"

    .line 29
    .line 30
    const-string v3, "TOUCH_SCROLLING"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->TOUCH_SCROLLING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 36
    .line 37
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    const-string v2, "\u89e6\u6478\u7ed3\u675f"

    .line 41
    .line 42
    const-string v3, "TOUCH_FINISH"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->TOUCH_FINISH:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->$values()[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->$VALUES:[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 54
    .line 55
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
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->desc:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->$VALUES:[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 8
    .line 9
    return-object v0
.end method
