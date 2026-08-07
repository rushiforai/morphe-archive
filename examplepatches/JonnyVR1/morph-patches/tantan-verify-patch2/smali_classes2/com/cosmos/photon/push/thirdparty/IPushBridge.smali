.class public interface abstract Lcom/cosmos/photon/push/thirdparty/IPushBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract getContext()Landroid/content/Context;
.end method

.method public abstract getRegisteredToken()Ljava/lang/String;
.end method

.method public abstract onGetTokenResult(ZLjava/lang/String;)V
.end method

.method public abstract onPushRegisterResult(IILjava/lang/String;)V
.end method

.method public abstract onReceiveAssistThirdNotification(ILcom/cosmos/photon/push/thirdparty/NotificationWrapper;)V
.end method

.method public abstract onReceiveAssistThirdToken(ILjava/lang/String;)V
.end method

.method public abstract onReceivePassThroughMessage(ILjava/lang/String;)V
.end method

.method public abstract onUnRegisterResult(II)V
.end method
