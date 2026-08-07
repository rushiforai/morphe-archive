.class Lcom/cosmos/photon/push/ChannelBridge$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/ChannelBridge;->setAlias(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$alias:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/ChannelBridge$3;->val$alias:Ljava/lang/String;

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
    .locals 3

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/ChannelBridge;->listener:Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;->getChannel()Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v1, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v2, "key_alias"

    .line 15
    .line 16
    iget-object p0, p0, Lcom/cosmos/photon/push/ChannelBridge$3;->val$alias:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "key_pkg"

    .line 22
    .line 23
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v1, p0, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string p0, "set_alias"

    .line 31
    .line 32
    invoke-interface {v0, v1, p0}, Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;->executeAction(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method
