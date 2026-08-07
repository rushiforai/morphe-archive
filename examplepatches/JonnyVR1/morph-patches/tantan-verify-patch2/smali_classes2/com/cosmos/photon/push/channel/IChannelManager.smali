.class public interface abstract Lcom/cosmos/photon/push/channel/IChannelManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;,
        Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;
    }
.end annotation


# virtual methods
.method public abstract bind(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;)V
.end method

.method public abstract create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;)V
.end method

.method public abstract query(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract release(Ljava/lang/String;)V
.end method

.method public abstract unBind()V
.end method
