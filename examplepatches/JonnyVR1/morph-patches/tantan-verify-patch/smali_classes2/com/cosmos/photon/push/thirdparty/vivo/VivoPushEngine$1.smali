.class Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/vivo/push/IPushActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;->register()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine$1;->this$0:Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onStateChanged(I)V
    .locals 4

    .line 1
    sget-object p0, Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Lcom/vivo/push/PushClient;->getInstance(Landroid/content/Context;)Lcom/vivo/push/PushClient;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lcom/vivo/push/PushClient;->getRegId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move-object v1, v0

    .line 21
    :goto_0
    const/16 v2, 0xa

    .line 22
    .line 23
    const/16 v3, 0x3e9

    .line 24
    .line 25
    invoke-interface {p0, v2, v3, v1}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->onPushRegisterResult(IILjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const-string p0, "vivo"

    .line 29
    .line 30
    invoke-static {p0, p1, v0}, Lcom/cosmos/photon/push/thirdparty/ThirdPartyEventReporter;->logRegCallback(Ljava/lang/String;ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
