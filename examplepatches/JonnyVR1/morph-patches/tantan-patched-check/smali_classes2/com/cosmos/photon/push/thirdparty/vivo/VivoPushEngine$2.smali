.class Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/vivo/push/IPushActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;->unregister()V
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
    iput-object p1, p0, Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine$2;->this$0:Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;

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
    .locals 2

    .line 1
    sget-object p0, Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/16 p1, 0xbb9

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/16 p1, 0xbba

    .line 9
    .line 10
    :goto_0
    const/4 v0, 0x0

    .line 11
    const/16 v1, 0xb

    .line 12
    .line 13
    invoke-interface {p0, v1, p1, v0}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->onPushRegisterResult(IILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
