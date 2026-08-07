.class final Lcom/cosmos/photon/push/ChannelManager$MyServiceConnection;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/ChannelManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "MyServiceConnection"
.end annotation


# instance fields
.field listener:Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;

.field final synthetic this$0:Lcom/cosmos/photon/push/ChannelManager;


# direct methods
.method private constructor <init>(Lcom/cosmos/photon/push/ChannelManager;Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/ChannelManager$MyServiceConnection;->this$0:Lcom/cosmos/photon/push/ChannelManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/cosmos/photon/push/ChannelManager$MyServiceConnection;->listener:Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Lcom/cosmos/photon/push/ChannelManager;Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;Lcom/cosmos/photon/push/ChannelManager$1;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/cosmos/photon/push/ChannelManager$MyServiceConnection;-><init>(Lcom/cosmos/photon/push/ChannelManager;Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;)V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "onServiceConnected "

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "MoPush-Channel"

    .line 16
    .line 17
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p2}, Lcom/cosmos/photon/push/service/IPushChannel$Stub;->asInterface(Landroid/os/IBinder;)Lcom/cosmos/photon/push/service/IPushChannel;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p2, p0, Lcom/cosmos/photon/push/ChannelManager$MyServiceConnection;->listener:Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;

    .line 25
    .line 26
    new-instance v0, Lcom/cosmos/photon/push/ChannelManager$MyServiceConnection$1;

    .line 27
    .line 28
    invoke-direct {v0, p0, p1}, Lcom/cosmos/photon/push/ChannelManager$MyServiceConnection$1;-><init>(Lcom/cosmos/photon/push/ChannelManager$MyServiceConnection;Lcom/cosmos/photon/push/service/IPushChannel;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {p2, v0}, Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;->onChannelConnected(Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 1
    const-string p1, "MoPush-Channel"

    .line 2
    .line 3
    const-string v0, "onServiceDisconnected"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/cosmos/photon/push/ChannelManager$MyServiceConnection;->listener:Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;

    .line 9
    .line 10
    invoke-interface {p0}, Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;->onChannelDisConnect()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
