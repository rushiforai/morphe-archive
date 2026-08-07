.class public interface abstract Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/channel/IChannelManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ChannelListener"
.end annotation


# virtual methods
.method public abstract getChannel()Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;
.end method

.method public abstract onChannelConnected(Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;)V
.end method

.method public abstract onChannelDisConnect()V
.end method

.method public abstract onChannelError(I)V
.end method
