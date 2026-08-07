.class public final enum Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BadgeIconType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

.field public static final enum BOOST:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

.field public static final enum BOOST_ONCE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

.field public static final enum NONE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

.field public static final enum ODIAMOND:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

.field public static final enum PROMOTION:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

.field public static final enum SEE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->NONE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->PROMOTION:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->SEE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->BOOST:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->BOOST_ONCE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->ODIAMOND:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->NONE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 12
    .line 13
    const-string v1, "PROMOTION"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->PROMOTION:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 22
    .line 23
    const-string v1, "SEE"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->SEE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 32
    .line 33
    const-string v1, "BOOST"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->BOOST:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 40
    .line 41
    new-instance v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 42
    .line 43
    const-string v1, "BOOST_ONCE"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->BOOST_ONCE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 52
    .line 53
    const-string v1, "ODIAMOND"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->ODIAMOND:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->$values()[Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->$VALUES:[Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->$VALUES:[Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 8
    .line 9
    return-object v0
.end method
