.class public Lcom/cosmos/photon/push/msg/MoMessage;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x6a8e77bf77f6b583L


# instance fields
.field public data:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public id:Ljava/lang/String;

.field public logType:I

.field public text:Ljava/lang/String;

.field public time:J

.field public toPkg:Ljava/lang/String;

.field public type:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/cosmos/photon/push/msg/MoMessage;->logType:I

    .line 6
    .line 7
    return-void
.end method

.method public static create(Lcom/immomo/push/pb/Msg;)Lcom/cosmos/photon/push/msg/MoMessage;
    .locals 3

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/msg/MoMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/cosmos/photon/push/msg/MoMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, v0, Lcom/cosmos/photon/push/msg/MoMessage;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getToPkg()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, Lcom/cosmos/photon/push/msg/MoMessage;->toPkg:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getType()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iput v1, v0, Lcom/cosmos/photon/push/msg/MoMessage;->type:I

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getTime()J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    iput-wide v1, v0, Lcom/cosmos/photon/push/msg/MoMessage;->time:J

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getText()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/cosmos/photon/push/msg/MoMessage;->text:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getDataMap()Ljava/util/Map;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    if-nez v1, :cond_0

    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getDataMap()Ljava/util/Map;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-direct {v1, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 51
    .line 52
    .line 53
    move-object p0, v1

    .line 54
    :goto_0
    iput-object p0, v0, Lcom/cosmos/photon/push/msg/MoMessage;->data:Ljava/util/HashMap;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/cosmos/photon/push/msg/MoMessage;->getLogType(Lcom/cosmos/photon/push/msg/MoMessage;)V

    .line 57
    .line 58
    .line 59
    return-object v0
.end method

.method public static create(Lcom/immomo/push/pb/MsgV2;)Lcom/cosmos/photon/push/msg/MoMessage;
    .locals 3

    .line 60
    new-instance v0, Lcom/cosmos/photon/push/msg/MoMessage;

    invoke-direct {v0}, Lcom/cosmos/photon/push/msg/MoMessage;-><init>()V

    .line 61
    invoke-virtual {p0}, Lcom/immomo/push/pb/MsgV2;->getId()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/cosmos/photon/push/msg/MoMessage;->id:Ljava/lang/String;

    .line 62
    invoke-virtual {p0}, Lcom/immomo/push/pb/MsgV2;->getToPkg()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/cosmos/photon/push/msg/MoMessage;->toPkg:Ljava/lang/String;

    .line 63
    invoke-virtual {p0}, Lcom/immomo/push/pb/MsgV2;->getType()I

    move-result v1

    iput v1, v0, Lcom/cosmos/photon/push/msg/MoMessage;->type:I

    .line 64
    invoke-virtual {p0}, Lcom/immomo/push/pb/MsgV2;->getTime()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/cosmos/photon/push/msg/MoMessage;->time:J

    .line 65
    invoke-virtual {p0}, Lcom/immomo/push/pb/MsgV2;->getText()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/cosmos/photon/push/msg/MoMessage;->text:Ljava/lang/String;

    .line 66
    invoke-virtual {p0}, Lcom/immomo/push/pb/MsgV2;->getDataMap()Ljava/util/Map;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/immomo/push/pb/MsgV2;->getDataMap()Ljava/util/Map;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    move-object p0, v1

    :goto_0
    iput-object p0, v0, Lcom/cosmos/photon/push/msg/MoMessage;->data:Ljava/util/HashMap;

    .line 67
    invoke-static {v0}, Lcom/cosmos/photon/push/msg/MoMessage;->getLogType(Lcom/cosmos/photon/push/msg/MoMessage;)V

    return-object v0
.end method

.method private static getLogType(Lcom/cosmos/photon/push/msg/MoMessage;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/msg/MoMessage;->data:Ljava/util/HashMap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    const-string v1, "ins_log"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/cosmos/photon/push/msg/MoMessage;->logType:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    return-void

    .line 24
    :catch_0
    move-exception p0

    .line 25
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "MoMessage{id=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/cosmos/photon/push/msg/MoMessage;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', toPkg=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/cosmos/photon/push/msg/MoMessage;->toPkg:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', time="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-wide v1, p0, Lcom/cosmos/photon/push/msg/MoMessage;->time:J

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", type="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/cosmos/photon/push/msg/MoMessage;->type:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", text=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/cosmos/photon/push/msg/MoMessage;->text:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p0, "\'}"

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
