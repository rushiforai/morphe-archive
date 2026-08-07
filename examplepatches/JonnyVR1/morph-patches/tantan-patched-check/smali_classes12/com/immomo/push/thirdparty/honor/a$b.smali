.class Lcom/immomo/push/thirdparty/honor/a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/hihonor/push/sdk/HonorPushCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/push/thirdparty/honor/a;->unregister()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/hihonor/push/sdk/HonorPushCallback<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/push/thirdparty/honor/a;


# direct methods
.method public constructor <init>(Lcom/immomo/push/thirdparty/honor/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/push/thirdparty/honor/a$b;->a:Lcom/immomo/push/thirdparty/honor/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Void;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/immomo/push/thirdparty/honor/a;->b:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 2
    .line 3
    const/16 p1, 0xb

    .line 4
    .line 5
    const/16 v0, 0xbb9

    .line 6
    .line 7
    invoke-interface {p0, p1, v0}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->onUnRegisterResult(II)V

    .line 8
    .line 9
    .line 10
    const-string p0, "\u8363\u8000push\u6ce8\u9500\u7ed3\u679c\uff1asuccess"

    .line 11
    .line 12
    invoke-static {p0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->e(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onFailure(ILjava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/push/thirdparty/honor/a;->b:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 2
    .line 3
    const/16 p1, 0xb

    .line 4
    .line 5
    const/16 p2, 0xbba

    .line 6
    .line 7
    invoke-interface {p0, p1, p2}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->onUnRegisterResult(II)V

    .line 8
    .line 9
    .line 10
    const-string p0, "\u8363\u8000push\u6ce8\u9500\u7ed3\u679c\uff1afail"

    .line 11
    .line 12
    invoke-static {p0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->e(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Void;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/push/thirdparty/honor/a$b;->a(Ljava/lang/Void;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
