.class final Lcom/cosmos/photon/push/PhotonPushManager$ActivityLife;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/PhotonPushManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ActivityLife"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cosmos/photon/push/PhotonPushManager;


# direct methods
.method private constructor <init>(Lcom/cosmos/photon/push/PhotonPushManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager$ActivityLife;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/cosmos/photon/push/PhotonPushManager;Lcom/cosmos/photon/push/PhotonPushManager$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/cosmos/photon/push/PhotonPushManager$ActivityLife;-><init>(Lcom/cosmos/photon/push/PhotonPushManager;)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager$ActivityLife;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/cosmos/photon/push/PhotonPushManager;->access$908(Lcom/cosmos/photon/push/PhotonPushManager;)I

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager$ActivityLife;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/cosmos/photon/push/PhotonPushManager;->access$900(Lcom/cosmos/photon/push/PhotonPushManager;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, 0x1

    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager$ActivityLife;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 16
    .line 17
    iput-boolean v0, p1, Lcom/cosmos/photon/push/PhotonPushManager;->isForeGround:Z

    .line 18
    .line 19
    invoke-static {p1}, Lcom/cosmos/photon/push/PhotonPushManager;->access$1000(Lcom/cosmos/photon/push/PhotonPushManager;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager$ActivityLife;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 24
    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    invoke-static {v0}, Lcom/cosmos/photon/push/PhotonPushManager;->access$600(Lcom/cosmos/photon/push/PhotonPushManager;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager$ActivityLife;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->access$800(Lcom/cosmos/photon/push/PhotonPushManager;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p1, p0}, Lcom/cosmos/photon/push/ChannelBridge;->start(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    invoke-static {v0, p0}, Lcom/cosmos/photon/push/PhotonPushManager;->access$1002(Lcom/cosmos/photon/push/PhotonPushManager;Z)Z

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager$ActivityLife;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/cosmos/photon/push/PhotonPushManager;->access$910(Lcom/cosmos/photon/push/PhotonPushManager;)I

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager$ActivityLife;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/cosmos/photon/push/PhotonPushManager;->access$900(Lcom/cosmos/photon/push/PhotonPushManager;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager$ActivityLife;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->isForeGround:Z

    .line 18
    .line 19
    :cond_0
    return-void
.end method
