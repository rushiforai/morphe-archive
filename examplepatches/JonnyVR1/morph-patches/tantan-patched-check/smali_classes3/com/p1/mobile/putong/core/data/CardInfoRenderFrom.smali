.class public final enum Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

.field public static final enum CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

.field public static final enum OLD_TRANS_PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

.field public static final enum PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

.field public static final enum PROFILE_PREVIEW:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

.field public static final enum UNKNOWN:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;


# instance fields
.field private desc:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->UNKNOWN:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE_PREVIEW:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->OLD_TRANS_PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

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
    new-instance v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "\u672a\u77e5"

    .line 5
    .line 6
    const-string v3, "UNKNOWN"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->UNKNOWN:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "\u5361\u724c\u6e32\u67d3"

    .line 17
    .line 18
    const-string v3, "CARD"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-string v2, "\u8d44\u6599\u9875\u6e32\u67d3"

    .line 29
    .line 30
    const-string v3, "PROFILE"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 36
    .line 37
    new-instance v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    const-string v2, "\u8d44\u6599\u9875\u9884\u89c8"

    .line 41
    .line 42
    const-string v3, "PROFILE_PREVIEW"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE_PREVIEW:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 48
    .line 49
    new-instance v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    const-string v2, "\u8d44\u6599\u8f6c\u6362"

    .line 53
    .line 54
    const-string v3, "OLD_TRANS_PROFILE"

    .line 55
    .line 56
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->OLD_TRANS_PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->$values()[Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->$VALUES:[Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

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
    iput-object p3, p0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->desc:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->$VALUES:[Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 8
    .line 9
    return-object v0
.end method
