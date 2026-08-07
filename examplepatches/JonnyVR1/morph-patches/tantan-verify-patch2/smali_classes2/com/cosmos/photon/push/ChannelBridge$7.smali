.class Lcom/cosmos/photon/push/ChannelBridge$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/ChannelBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private mChannel:Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;


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
.method public getChannel()Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/ChannelBridge$7;->mChannel:Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;

    .line 2
    .line 3
    return-object p0
.end method

.method public onChannelConnected(Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;)V
    .locals 2

    .line 1
    const-string v0, "MoPush-Channel"

    .line 2
    .line 3
    iput-object p1, p0, Lcom/cosmos/photon/push/ChannelBridge$7;->mChannel:Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    :try_start_0
    const-string v1, "check"

    .line 7
    .line 8
    invoke-interface {p1, p0, v1}, Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;->executeAction(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;

    .line 9
    .line 10
    .line 11
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    :goto_0
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p1, "has_channel"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const/4 p1, 0x0

    .line 29
    :goto_1
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->access$500()V

    .line 30
    .line 31
    .line 32
    :cond_1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "check result %b  %s"

    .line 41
    .line 42
    invoke-static {v0, p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public onChannelDisConnect()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/cosmos/photon/push/ChannelBridge$7;->mChannel:Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;

    .line 3
    .line 4
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->access$200()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    invoke-static {p0}, Lcom/cosmos/photon/push/ChannelBridge;->access$400(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onChannelError(I)V
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "MoPush-Channel"

    .line 10
    .line 11
    const-string v0, "onChannelError %d"

    .line 12
    .line 13
    invoke-static {p1, v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->access$500()V

    .line 17
    .line 18
    .line 19
    return-void
.end method
