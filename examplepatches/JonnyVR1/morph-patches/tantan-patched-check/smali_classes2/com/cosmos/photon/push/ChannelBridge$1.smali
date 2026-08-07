.class Lcom/cosmos/photon/push/ChannelBridge$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/ChannelBridge;->start(Z)V
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
    .locals 7

    .line 1
    sget-object p0, Lcom/cosmos/photon/push/ChannelBridge;->listener:Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;->getChannel()Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const-string v1, "watch"

    .line 11
    .line 12
    invoke-interface {p0, v0, v1}, Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;->executeAction(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const-string v0, "has_channel"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const-string p0, "MoPush-Channel"

    .line 27
    .line 28
    const-string v0, "\u5f53\u524d\u5df2\u6709\u901a\u9053\u5e76\u53ef\u7528\uff0c\u65e0\u9700\u518d\u7ed1\u5b9a\u6216\u5efa\u7acb"

    .line 29
    .line 30
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->access$000()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-static {}, Lcom/cosmos/photon/push/ChannelManager;->getInstance()Lcom/cosmos/photon/push/ChannelManager;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->access$100()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Lcom/cosmos/photon/push/ChannelManager;->query(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_1

    .line 54
    .line 55
    invoke-static {}, Lcom/cosmos/photon/push/ChannelManager;->getInstance()Lcom/cosmos/photon/push/ChannelManager;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->access$100()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->access$200()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->access$300()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    sget-object v6, Lcom/cosmos/photon/push/ChannelBridge;->listener:Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;

    .line 72
    .line 73
    invoke-virtual/range {v1 .. v6}, Lcom/cosmos/photon/push/ChannelManager;->bind(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    invoke-static {}, Lcom/cosmos/photon/push/ChannelManager;->getInstance()Lcom/cosmos/photon/push/ChannelManager;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->access$100()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->access$200()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->access$300()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    sget-object v3, Lcom/cosmos/photon/push/ChannelBridge;->listener:Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;

    .line 94
    .line 95
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/cosmos/photon/push/ChannelManager;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method
