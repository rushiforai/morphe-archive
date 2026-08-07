.class public final enum Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

.field public static final enum CONV_MSG_CHANGE:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

.field public static final enum PAGE_FINISH:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

.field public static final enum PAGE_INIT:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;


# instance fields
.field private typeDes:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_INIT:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_FINISH:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->CONV_MSG_CHANGE:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

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
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "\u9875\u9762\u521d\u59cb\u5316"

    .line 5
    .line 6
    const-string v3, "PAGE_INIT"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_INIT:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "\u9875\u9762\u9500\u6bc1"

    .line 17
    .line 18
    const-string v3, "PAGE_FINISH"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_FINISH:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-string v2, "\u6d88\u606f\u6216\u8005\u4f1a\u8bdd\u4fe1\u606f\u66f4\u65b0"

    .line 29
    .line 30
    const-string v3, "CONV_MSG_CHANGE"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->CONV_MSG_CHANGE:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->$values()[Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->$VALUES:[Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

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
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->typeDes:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->$VALUES:[Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 8
    .line 9
    return-object v0
.end method
