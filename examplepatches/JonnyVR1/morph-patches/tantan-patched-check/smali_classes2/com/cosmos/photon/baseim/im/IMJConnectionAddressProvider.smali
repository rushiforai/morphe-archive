.class public interface abstract Lcom/cosmos/photon/baseim/im/IMJConnectionAddressProvider;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract connectFailed(Lcom/cosmos/photon/baseim/im/Address;)V
.end method

.method public abstract connectSuccess(Lcom/cosmos/photon/baseim/im/Address;)V
.end method

.method public abstract getAddress()Lcom/cosmos/photon/baseim/im/Address;
.end method

.method public abstract saveDirectAddress(Lcom/cosmos/photon/baseim/im/Address;)V
.end method

.method public abstract saveDirectAddressList(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/cosmos/photon/baseim/im/Address;",
            ">;)V"
        }
    .end annotation
.end method
