.class public final enum Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

.field public static final enum DEFAULT_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

.field public static final enum EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

.field public static final enum TRANS_EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;


# instance fields
.field private desc:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->DEFAULT_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->TRANS_EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

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
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "\u666e\u901a\u7684\u5212\u5361-\u53ef\u5207\u5361"

    .line 5
    .line 6
    const-string v3, "DEFAULT_CARD"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->DEFAULT_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 14
    .line 15
    const-string v1, "EXPANDED_CARD"

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    const-string v3, "\u5e73\u94fa\u7684\uff0c\u53ef\u4e0a\u4e0b\u6ed1\u52a8\u5361\u7247"

    .line 19
    .line 20
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 26
    .line 27
    const-string v1, "TRANS_EXPANDED_CARD"

    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->TRANS_EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->$values()[Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->$VALUES:[Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 40
    .line 41
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
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->desc:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->$VALUES:[Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 8
    .line 9
    return-object v0
.end method
