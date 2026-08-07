.class public interface abstract Lcom/cosmos/photon/push/service/IPushChannel;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/service/IPushChannel$Stub;,
        Lcom/cosmos/photon/push/service/IPushChannel$Default;
    }
.end annotation


# virtual methods
.method public abstract executeAction(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
