.class Lcom/cosmos/photon/push/ChannelBridge$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/ChannelBridge;->createChannel()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/ChannelManager;->getInstance()Lcom/cosmos/photon/push/ChannelManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/cosmos/photon/push/ChannelManager;->unBind()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/cosmos/photon/push/ChannelManager;->getInstance()Lcom/cosmos/photon/push/ChannelManager;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->access$100()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->access$200()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->access$300()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    sget-object v3, Lcom/cosmos/photon/push/ChannelBridge;->listener:Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/cosmos/photon/push/ChannelManager;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
