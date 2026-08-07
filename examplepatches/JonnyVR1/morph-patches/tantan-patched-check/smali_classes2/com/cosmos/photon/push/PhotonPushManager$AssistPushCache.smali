.class Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/PhotonPushManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AssistPushCache"
.end annotation


# instance fields
.field assistThirdToken:Ljava/lang/String;

.field lastAssistThirdToken:Ljava/lang/String;

.field lastSelfToken:Ljava/lang/String;

.field selfToken:Ljava/lang/String;

.field final synthetic this$0:Lcom/cosmos/photon/push/PhotonPushManager;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/PhotonPushManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
