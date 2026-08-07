.class Lcom/cosmos/photon/push/service/PushService$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cosmos/photon/baseim/push/PacketReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/service/PushService;->initPushImManager()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cosmos/photon/push/service/PushService;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/service/PushService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/service/PushService$2;->this$0:Lcom/cosmos/photon/push/service/PushService;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onReceivePacket([B)V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {p1}, Lcom/immomo/push/pb/PbPacketBody;->parseFrom([B)Lcom/immomo/push/pb/PbPacketBody;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/push/pb/PbPacketBody;->getMsg()Lcom/immomo/push/pb/Msg;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getToPkg()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Lcom/cosmos/photon/push/util/DeviceUtils;->isAppInstalled(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-static {p0}, Lcom/cosmos/photon/push/DataProcessor;->onMsgArrived(Lcom/immomo/push/pb/Msg;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/cosmos/photon/push/PushImManager;->getInstance()Lcom/cosmos/photon/push/PushImManager;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getLt()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getLv()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    int-to-long v1, p0

    .line 38
    invoke-virtual {p1, v0, v1, v2}, Lcom/cosmos/photon/push/PushImManager;->notifySyncMsgSaved(Ljava/lang/String;J)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void

    .line 42
    :cond_1
    const-string p1, "MoPush-Notify"

    .line 43
    .line 44
    const-string v0, "pkg[%s] uninstall"

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getToPkg()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p1, v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :catch_0
    move-exception p0

    .line 59
    const-string p1, "MoPush-"

    .line 60
    .line 61
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method
