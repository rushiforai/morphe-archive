.class Lcom/cosmos/photon/push/service/PushService$MsgSendBinder$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;->executeAction(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;

.field final synthetic val$channelId:Ljava/lang/String;

.field final synthetic val$fromPkg:Ljava/lang/String;

.field final synthetic val$logAction:Ljava/lang/String;

.field final synthetic val$savedDeviceId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder$1;->this$1:Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder$1;->val$logAction:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder$1;->val$fromPkg:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder$1;->val$savedDeviceId:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder$1;->val$channelId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder$1;->val$logAction:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder$1;->val$fromPkg:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder$1;->val$savedDeviceId:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder$1;->val$channelId:Ljava/lang/String;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "MoPush-Channel"

    .line 14
    .line 15
    const-string v2, "MsgSendBinder executeAction[%s] kill due to : fromPkg[%s] savedDeviceId[%s] != channelId[%s]"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder$1;->this$1:Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;->this$0:Lcom/cosmos/photon/push/service/PushService;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    .line 25
    .line 26
    .line 27
    return-void
.end method
