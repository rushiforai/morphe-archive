.class Lcom/cosmos/photon/push/service/PushService$5;
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
    iput-object p1, p0, Lcom/cosmos/photon/push/service/PushService$5;->this$0:Lcom/cosmos/photon/push/service/PushService;

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
    .locals 1

    .line 1
    :try_start_0
    invoke-static {p1}, Lcom/immomo/push/pb/PbPacketBody;->parseFrom([B)Lcom/immomo/push/pb/PbPacketBody;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/push/pb/PbPacketBody;->getNotifyV2()Lcom/immomo/push/pb/NotifyV2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyV2;->getToPkg()Ljava/lang/String;

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
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-static {p0}, Lcom/cosmos/photon/push/DataProcessor;->onPushArrived(Lcom/immomo/push/pb/NotifyV2;)Z

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string p1, "MoPush-Notify"

    .line 24
    .line 25
    const-string v0, "pkg[%s] uninstall"

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyV2;->getToPkg()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p1, v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :catch_0
    move-exception p0

    .line 40
    const-string p1, "MoPush-"

    .line 41
    .line 42
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
