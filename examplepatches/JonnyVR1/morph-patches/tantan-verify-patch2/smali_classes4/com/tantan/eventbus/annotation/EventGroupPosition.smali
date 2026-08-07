.class public final enum Lcom/tantan/eventbus/annotation/EventGroupPosition;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/tantan/eventbus/annotation/EventGroupPosition;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/tantan/eventbus/annotation/EventGroupPosition;

.field public static final enum DEFAULT:Lcom/tantan/eventbus/annotation/EventGroupPosition;

.field public static final enum LIVE_HOME:Lcom/tantan/eventbus/annotation/EventGroupPosition;

.field public static final enum LIVE_SEARCH:Lcom/tantan/eventbus/annotation/EventGroupPosition;

.field public static final enum LIVE_VIDEO_CHAT:Lcom/tantan/eventbus/annotation/EventGroupPosition;


# instance fields
.field private final className:Ljava/lang/String;

.field private final packagePath:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/tantan/eventbus/annotation/EventGroupPosition;
    .locals 4

    .line 1
    sget-object v0, Lcom/tantan/eventbus/annotation/EventGroupPosition;->DEFAULT:Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 2
    .line 3
    sget-object v1, Lcom/tantan/eventbus/annotation/EventGroupPosition;->LIVE_HOME:Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 4
    .line 5
    sget-object v2, Lcom/tantan/eventbus/annotation/EventGroupPosition;->LIVE_SEARCH:Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 6
    .line 7
    sget-object v3, Lcom/tantan/eventbus/annotation/EventGroupPosition;->LIVE_VIDEO_CHAT:Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/tantan/eventbus/annotation/EventGroupPosition;

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
    new-instance v0, Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 2
    .line 3
    const-string v1, "LiveEventBus"

    .line 4
    .line 5
    const-string v2, "com.tantan.live.eventbus"

    .line 6
    .line 7
    const-string v3, "DEFAULT"

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/tantan/eventbus/annotation/EventGroupPosition;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/tantan/eventbus/annotation/EventGroupPosition;->DEFAULT:Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 14
    .line 15
    new-instance v0, Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 16
    .line 17
    const-string v1, "LiveHomeEventBus"

    .line 18
    .line 19
    const-string v2, "com.tantan.live.home.eventbus"

    .line 20
    .line 21
    const-string v3, "LIVE_HOME"

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/tantan/eventbus/annotation/EventGroupPosition;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/tantan/eventbus/annotation/EventGroupPosition;->LIVE_HOME:Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 28
    .line 29
    new-instance v0, Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 30
    .line 31
    const-string v1, "LiveSearchEventBus"

    .line 32
    .line 33
    const-string v2, "com.tantan.live.search.eventbus"

    .line 34
    .line 35
    const-string v3, "LIVE_SEARCH"

    .line 36
    .line 37
    const/4 v4, 0x2

    .line 38
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/tantan/eventbus/annotation/EventGroupPosition;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sput-object v0, Lcom/tantan/eventbus/annotation/EventGroupPosition;->LIVE_SEARCH:Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 42
    .line 43
    new-instance v0, Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 44
    .line 45
    const-string v1, "LiveVChatEventBus"

    .line 46
    .line 47
    const-string v2, "com.p1.mobile.putong.live.external.internal.vchat"

    .line 48
    .line 49
    const-string v3, "LIVE_VIDEO_CHAT"

    .line 50
    .line 51
    const/4 v4, 0x3

    .line 52
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/tantan/eventbus/annotation/EventGroupPosition;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    sput-object v0, Lcom/tantan/eventbus/annotation/EventGroupPosition;->LIVE_VIDEO_CHAT:Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 56
    .line 57
    invoke-static {}, Lcom/tantan/eventbus/annotation/EventGroupPosition;->$values()[Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sput-object v0, Lcom/tantan/eventbus/annotation/EventGroupPosition;->$VALUES:[Lcom/tantan/eventbus/annotation/EventGroupPosition;

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
    iput-object p3, p0, Lcom/tantan/eventbus/annotation/EventGroupPosition;->className:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p4, p0, Lcom/tantan/eventbus/annotation/EventGroupPosition;->packagePath:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/tantan/eventbus/annotation/EventGroupPosition;
    .locals 1

    .line 1
    const-class v0, Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/tantan/eventbus/annotation/EventGroupPosition;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantan/eventbus/annotation/EventGroupPosition;->$VALUES:[Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/tantan/eventbus/annotation/EventGroupPosition;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/tantan/eventbus/annotation/EventGroupPosition;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/eventbus/annotation/EventGroupPosition;->className:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPackagePath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/eventbus/annotation/EventGroupPosition;->packagePath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
