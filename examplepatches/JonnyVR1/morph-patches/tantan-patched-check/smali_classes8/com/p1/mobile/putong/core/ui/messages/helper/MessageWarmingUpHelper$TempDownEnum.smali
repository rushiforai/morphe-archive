.class public final enum Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TempDownEnum"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

.field public static final enum chuEmo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

.field public static final enum friendEmo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

.field public static final enum message:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

.field public static final enum photo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;


# instance fields
.field public content:Ljava/lang/String;

.field public imageRes:Ljava/lang/String;

.field public key:Ljava/lang/String;

.field public title:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->message:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->photo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->chuEmo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->friendEmo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 2
    .line 3
    const-string v1, "send_message"

    .line 4
    .line 5
    const-string v2, "\u53d1\u6761\u6d88\u606f\uff0c\u7acb\u523b\u56de\u6e29"

    .line 6
    .line 7
    const-string v3, "message"

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->message:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 16
    .line 17
    const-string v1, "send_photo"

    .line 18
    .line 19
    const-string v2, "\u5206\u4eab\u7167\u7247\uff0c\u7acb\u523b\u56de\u6e29"

    .line 20
    .line 21
    const-string v3, "photo"

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->photo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 28
    .line 29
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 30
    .line 31
    const-string v1, "send_chuochuo_emoji"

    .line 32
    .line 33
    const-string v2, "\u6233%s\u4e00\u4e0b\uff0c\u7acb\u523b\u56de\u6e29"

    .line 34
    .line 35
    const-string v3, "chuEmo"

    .line 36
    .line 37
    const/4 v4, 0x2

    .line 38
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->chuEmo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 42
    .line 43
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 44
    .line 45
    const-string v1, "send_friends_emoji"

    .line 46
    .line 47
    const-string v2, "\u53d1\u9001\u8868\u60c5\uff0c\u7acb\u523b\u56de\u6e29"

    .line 48
    .line 49
    const-string v3, "friendEmo"

    .line 50
    .line 51
    const/4 v4, 0x3

    .line 52
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->friendEmo:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->$values()[Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->$VALUES:[Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 62
    .line 63
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->content:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->imageRes:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->key:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->title:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->$VALUES:[Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    .line 8
    .line 9
    return-object v0
.end method
