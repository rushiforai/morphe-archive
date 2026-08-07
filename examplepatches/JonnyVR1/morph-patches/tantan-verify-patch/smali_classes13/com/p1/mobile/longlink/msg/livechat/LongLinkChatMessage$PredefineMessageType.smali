.class public final enum Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/l$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PredefineMessageType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;",
        ">;",
        "Lcom/google/protobuf/l$c;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

.field public static final enum ENTERROOM_NOTICE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

.field public static final ENTERROOM_NOTICE_VALUE:I = 0x2

.field public static final enum OPENLIVE_NOTICE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

.field public static final OPENLIVE_NOTICE_VALUE:I = 0x1

.field public static final enum PLACEHOLDER:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

.field public static final PLACEHOLDER_VALUE:I

.field public static final enum UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

.field private static final internalValueMap:Lcom/google/protobuf/l$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$d<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final value:I


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->PLACEHOLDER:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->OPENLIVE_NOTICE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->ENTERROOM_NOTICE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

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
    new-instance v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 2
    .line 3
    const-string v1, "PLACEHOLDER"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->PLACEHOLDER:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 12
    .line 13
    const-string v1, "OPENLIVE_NOTICE"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->OPENLIVE_NOTICE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 22
    .line 23
    const-string v1, "ENTERROOM_NOTICE"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->ENTERROOM_NOTICE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 32
    .line 33
    const/4 v1, 0x3

    .line 34
    const/4 v2, -0x1

    .line 35
    const-string v3, "UNRECOGNIZED"

    .line 36
    .line 37
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->$values()[Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->$VALUES:[Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 47
    .line 48
    new-instance v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType$1;

    .line 49
    .line 50
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType$1;-><init>()V

    .line 51
    .line 52
    .line 53
    sput-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->internalValueMap:Lcom/google/protobuf/l$d;

    .line 54
    .line 55
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static forNumber(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->ENTERROOM_NOTICE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_1
    sget-object p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->OPENLIVE_NOTICE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->PLACEHOLDER:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 18
    .line 19
    return-object p0
.end method

.method public static internalGetValueMap()Lcom/google/protobuf/l$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/l$d<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->internalValueMap:Lcom/google/protobuf/l$d;

    .line 2
    .line 3
    return-object v0
.end method

.method public static valueOf(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 10
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->forNumber(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->$VALUES:[Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$PredefineMessageType;->value:I

    .line 2
    .line 3
    return p0
.end method
