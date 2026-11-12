.class Lcom/leanplum/LeanplumInbox$2$1;
.super Lcom/leanplum/callbacks/VariablesChangedCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/LeanplumInbox$2;->response(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/leanplum/LeanplumInbox$2;

.field final synthetic val$messages:Ljava/util/Map;

.field final synthetic val$totalUnreadCount:I


# direct methods
.method public constructor <init>(Lcom/leanplum/LeanplumInbox$2;Ljava/util/Map;I)V
    .registers 4

    iput-object p1, p0, Lcom/leanplum/LeanplumInbox$2$1;->this$1:Lcom/leanplum/LeanplumInbox$2;

    iput-object p2, p0, Lcom/leanplum/LeanplumInbox$2$1;->val$messages:Ljava/util/Map;

    iput p3, p0, Lcom/leanplum/LeanplumInbox$2$1;->val$totalUnreadCount:I

    invoke-direct {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public variablesChanged()V
    .registers 5

    iget-object v0, p0, Lcom/leanplum/LeanplumInbox$2$1;->this$1:Lcom/leanplum/LeanplumInbox$2;

    iget-object v0, v0, Lcom/leanplum/LeanplumInbox$2;->this$0:Lcom/leanplum/LeanplumInbox;

    iget-object v1, p0, Lcom/leanplum/LeanplumInbox$2$1;->val$messages:Ljava/util/Map;

    iget v2, p0, Lcom/leanplum/LeanplumInbox$2$1;->val$totalUnreadCount:I

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/leanplum/LeanplumInbox;->update(Ljava/util/Map;IZ)V

    iget-object p0, p0, Lcom/leanplum/LeanplumInbox$2$1;->this$1:Lcom/leanplum/LeanplumInbox$2;

    iget-object v0, p0, Lcom/leanplum/LeanplumInbox$2;->this$0:Lcom/leanplum/LeanplumInbox;

    iget-object p0, p0, Lcom/leanplum/LeanplumInbox$2;->val$callback:Lcom/leanplum/callbacks/InboxSyncedCallback;

    # invokes: Lcom/leanplum/LeanplumInbox;->triggerInboxSyncedWithStatus(ZLcom/leanplum/callbacks/InboxSyncedCallback;)V
    invoke-static {v0, v3, p0}, Lcom/leanplum/LeanplumInbox;->access$000(Lcom/leanplum/LeanplumInbox;ZLcom/leanplum/callbacks/InboxSyncedCallback;)V

    return-void
.end method
