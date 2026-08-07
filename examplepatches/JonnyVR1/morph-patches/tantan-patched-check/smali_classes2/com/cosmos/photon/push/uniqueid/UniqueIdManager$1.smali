.class Lcom/cosmos/photon/push/uniqueid/UniqueIdManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->seekUniqueId(Landroid/content/Context;)Lorg/json/JSONObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager$1;->this$0:Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager$1;->val$context:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager$1;->this$0:Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->access$200(Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;)Lcom/cosmos/photon/push/uniqueid/UniqueCache;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager$1;->val$context:Landroid/content/Context;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager$1;->this$0:Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->access$100(Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;)Lorg/json/JSONObject;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v2, "androidId"

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0, v2}, Lcom/cosmos/photon/push/uniqueid/UniqueCache;->saveUnique(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
