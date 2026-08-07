.class public final enum Lcom/p1/mobile/putong/core/data/ChatPartnerScene;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/data/ChatPartnerScene;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

.field public static final enum MESSAGE_PAGE_PASSIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

.field public static final enum ONLINE_SQUARE_ACTIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

.field public static final enum ONLINE_SQUARE_PASSIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/data/ChatPartnerScene;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->MESSAGE_PAGE_PASSIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->ONLINE_SQUARE_PASSIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->ONLINE_SQUARE_ACTIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

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
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "messagePagePassive"

    .line 5
    .line 6
    const-string v3, "MESSAGE_PAGE_PASSIVE"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->MESSAGE_PAGE_PASSIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "onlineSquarePassive"

    .line 17
    .line 18
    const-string v3, "ONLINE_SQUARE_PASSIVE"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->ONLINE_SQUARE_PASSIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-string v2, "onlineSquareActive"

    .line 29
    .line 30
    const-string v3, "ONLINE_SQUARE_ACTIVE"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->ONLINE_SQUARE_ACTIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->$values()[Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->$VALUES:[Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

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
    iput-object p3, p0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->value:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatPartnerScene;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, -0x1

    .line 9
    sparse-switch v0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :sswitch_0
    const-string v0, "onlineSquarePassive"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x2

    .line 23
    goto :goto_0

    .line 24
    :sswitch_1
    const-string v0, "messagePagePassive"

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v1, 0x1

    .line 34
    goto :goto_0

    .line 35
    :sswitch_2
    const-string v0, "onlineSquareActive"

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const/4 v1, 0x0

    .line 45
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 46
    .line 47
    .line 48
    const/4 p0, 0x0

    .line 49
    return-object p0

    .line 50
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->ONLINE_SQUARE_PASSIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 51
    .line 52
    return-object p0

    .line 53
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->MESSAGE_PAGE_PASSIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 54
    .line 55
    return-object p0

    .line 56
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->ONLINE_SQUARE_ACTIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 57
    .line 58
    return-object p0

    .line 59
    :sswitch_data_0
    .sparse-switch
        -0x4f811f8a -> :sswitch_2
        -0x45415cef -> :sswitch_1
        0x75673bb7 -> :sswitch_0
    .end sparse-switch

    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatPartnerScene;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/data/ChatPartnerScene;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->$VALUES:[Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->value:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
