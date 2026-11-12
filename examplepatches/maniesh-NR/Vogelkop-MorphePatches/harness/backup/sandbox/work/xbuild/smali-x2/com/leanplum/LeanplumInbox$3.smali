.class Lcom/leanplum/LeanplumInbox$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/internal/Request$ErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/LeanplumInbox;->downloadMessages(Lcom/leanplum/callbacks/InboxSyncedCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/LeanplumInbox;

.field final synthetic val$callback:Lcom/leanplum/callbacks/InboxSyncedCallback;


# direct methods
.method public constructor <init>(Lcom/leanplum/LeanplumInbox;Lcom/leanplum/callbacks/InboxSyncedCallback;)V
    .registers 3

    iput-object p1, p0, Lcom/leanplum/LeanplumInbox$3;->this$0:Lcom/leanplum/LeanplumInbox;

    iput-object p2, p0, Lcom/leanplum/LeanplumInbox$3;->val$callback:Lcom/leanplum/callbacks/InboxSyncedCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public error(Ljava/lang/Exception;)V
    .registers 3

    iget-object p1, p0, Lcom/leanplum/LeanplumInbox$3;->this$0:Lcom/leanplum/LeanplumInbox;

    const/4 v0, 0x0

    iget-object p0, p0, Lcom/leanplum/LeanplumInbox$3;->val$callback:Lcom/leanplum/callbacks/InboxSyncedCallback;

    # invokes: Lcom/leanplum/LeanplumInbox;->triggerInboxSyncedWithStatus(ZLcom/leanplum/callbacks/InboxSyncedCallback;)V
    invoke-static {p1, v0, p0}, Lcom/leanplum/LeanplumInbox;->access$000(Lcom/leanplum/LeanplumInbox;ZLcom/leanplum/callbacks/InboxSyncedCallback;)V

    return-void
.end method
