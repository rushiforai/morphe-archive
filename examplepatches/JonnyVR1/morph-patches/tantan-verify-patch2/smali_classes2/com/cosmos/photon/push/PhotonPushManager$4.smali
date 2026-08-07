.class Lcom/cosmos/photon/push/PhotonPushManager$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/PhotonPushManager;->unRegister()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cosmos/photon/push/PhotonPushManager;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/PhotonPushManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager$4;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/ChannelManager;->getInstance()Lcom/cosmos/photon/push/ChannelManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->getDeviceId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/cosmos/photon/push/ChannelManager;->release(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager$4;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/cosmos/photon/push/PhotonPushManager;->access$600(Lcom/cosmos/photon/push/PhotonPushManager;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/cosmos/photon/push/ChannelBridge;->stopSync(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->getInstance()Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->unregister()V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/cosmos/photon/push/PushPreferenceUtils;->clearAll()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager$4;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-static {v0, v1}, Lcom/cosmos/photon/push/PhotonPushManager;->access$602(Lcom/cosmos/photon/push/PhotonPushManager;Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager$4;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/cosmos/photon/push/PhotonPushManager;->access$802(Lcom/cosmos/photon/push/PhotonPushManager;Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager$4;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 43
    .line 44
    invoke-static {p0, v1}, Lcom/cosmos/photon/push/PhotonPushManager;->access$302(Lcom/cosmos/photon/push/PhotonPushManager;Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    return-void
.end method
