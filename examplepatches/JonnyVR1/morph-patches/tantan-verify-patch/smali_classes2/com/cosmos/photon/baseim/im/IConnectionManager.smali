.class public interface abstract Lcom/cosmos/photon/baseim/im/IConnectionManager;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract getCFlag()Ljava/lang/String;
.end method

.method public abstract notifySyncMsgSaved(Ljava/lang/String;J)V
.end method

.method public abstract notifySyncMsgSaved(Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract post(Ljava/lang/String;)V
.end method

.method public abstract registerActionHandler(Ljava/lang/String;Lcom/cosmos/photon/baseim/im/IMessageHandler;)V
.end method

.method public abstract release()V
.end method

.method public abstract removeActionHandler(Ljava/lang/String;)V
.end method

.method public abstract removeAllActionHandler()V
.end method

.method public abstract send(Lcom/cosmos/photon/baseim/im/SendTask;)V
.end method

.method public abstract setAddressProvider(Lcom/cosmos/photon/baseim/im/IMJConnectionAddressProvider;)V
.end method

.method public abstract setAuthInfo(Lcom/cosmos/photon/baseim/im/AuthInfo;)V
.end method

.method public abstract setIMJEventListener(Lcom/cosmos/photon/baseim/im/IMJEventListener;)V
.end method

.method public abstract setTrafficReporter(Lcom/cosmos/photon/baseim/im/TrafficReporter;)V
.end method

.method public abstract startIMJ()V
.end method

.method public abstract stopIMJ()V
.end method
