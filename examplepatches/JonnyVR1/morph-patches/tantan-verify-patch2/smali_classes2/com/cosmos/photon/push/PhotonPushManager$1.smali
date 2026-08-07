.class Lcom/cosmos/photon/push/PhotonPushManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cosmos/photon/push/thirdparty/IStatisticReporter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/PhotonPushManager;->init(Landroid/app/Application;Ljava/lang/String;Lcom/cosmos/photon/push/PushMessageReceiver;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cosmos/photon/push/PhotonPushManager;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/PhotonPushManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager$1;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public log(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
