.class Lcom/cosmos/photon/push/NotifyHelper$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/NotifyHelper$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cosmos/photon/push/NotifyHelper$1;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/NotifyHelper$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/NotifyHelper$1$1;->this$0:Lcom/cosmos/photon/push/NotifyHelper$1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    :try_start_0
    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/photon/push/NotifyHelper$1$1;->this$0:Lcom/cosmos/photon/push/NotifyHelper$1;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/cosmos/photon/push/NotifyHelper$1;->val$notify:Lcom/cosmos/photon/push/notification/MoNotify;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->icon:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/cosmos/photon/push/PushMessageReceiver;->getLargeIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 10
    .line 11
    .line 12
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    return-object p0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    const-string v0, "MoPush-Notify"

    .line 16
    .line 17
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 22
    invoke-virtual {p0}, Lcom/cosmos/photon/push/NotifyHelper$1$1;->call()Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method
