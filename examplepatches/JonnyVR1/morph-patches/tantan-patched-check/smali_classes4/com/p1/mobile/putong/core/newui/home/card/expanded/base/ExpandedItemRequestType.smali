.class public final enum Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;

.field public static final enum ExpandedCardClick:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;

.field public static final enum OnUserContentMeasured:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;


# instance fields
.field private desc:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;->ExpandedCardClick:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;->OnUserContentMeasured:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "\u5361\u7247\u89e6\u53d1\u70b9\u51fb"

    .line 5
    .line 6
    const-string v3, "ExpandedCardClick"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;->ExpandedCardClick:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "\u7528\u6237\u4fe1\u606f\u6d4b\u91cf\u5b8c\u6bd5"

    .line 17
    .line 18
    const-string v3, "OnUserContentMeasured"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;->OnUserContentMeasured:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;->$values()[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;->$VALUES:[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;

    .line 30
    .line 31
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
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;->desc:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;->$VALUES:[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedItemRequestType;

    .line 8
    .line 9
    return-object v0
.end method
