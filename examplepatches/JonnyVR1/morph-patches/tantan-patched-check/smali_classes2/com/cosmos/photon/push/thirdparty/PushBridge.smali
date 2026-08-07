.class public abstract Lcom/cosmos/photon/push/thirdparty/PushBridge;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cosmos/photon/push/thirdparty/IPushBridge;


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
.method public getContext()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->getInstance()Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
