.class Lcom/cosmos/photon/push/ChannelBridge$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/ChannelBridge;->watchFixChannelIdChange()V
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
    .locals 3

    .line 1
    const-string p0, "MoPush-Channel"

    .line 2
    .line 3
    :try_start_0
    const-string v0, "ChannelBridge watchFixChannelIdChange"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/cosmos/photon/push/ChannelBridge;->listener:Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;->getChannel()Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string v1, "watch"

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-interface {v0, v2, v1}, Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;->executeAction(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    :goto_0
    const/4 p0, 0x1

    .line 28
    invoke-static {p0}, Lcom/cosmos/photon/push/ChannelBridge;->access$400(Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
