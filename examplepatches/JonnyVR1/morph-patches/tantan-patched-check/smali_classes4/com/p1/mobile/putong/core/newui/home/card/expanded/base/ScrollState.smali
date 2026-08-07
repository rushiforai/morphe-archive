.class public final enum Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

.field public static final enum DRAGGING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

.field public static final enum IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

.field public static final enum SCROLL_ANIM:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;


# instance fields
.field private desc:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->DRAGGING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->SCROLL_ANIM:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "\u7a7a\u95f2\u72b6\u6001"

    .line 5
    .line 6
    const-string v3, "IDLE"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "\u62d6\u52a8\u4e2d"

    .line 17
    .line 18
    const-string v3, "DRAGGING"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->DRAGGING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-string v2, "\u52a8\u753b\u6ed1\u52a8\u4e2d"

    .line 29
    .line 30
    const-string v3, "SCROLL_ANIM"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->SCROLL_ANIM:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->$values()[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->$VALUES:[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 42
    .line 43
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
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->desc:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->$VALUES:[Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->desc:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
