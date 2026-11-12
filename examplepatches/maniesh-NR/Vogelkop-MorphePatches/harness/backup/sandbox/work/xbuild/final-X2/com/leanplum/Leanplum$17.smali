.class Lcom/leanplum/Leanplum$17;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/internal/Request$ResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/Leanplum;->forceContentUpdate(Lcom/leanplum/callbacks/VariablesChangedCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/leanplum/callbacks/VariablesChangedCallback;


# direct methods
.method public constructor <init>(Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/Leanplum$17;->val$callback:Lcom/leanplum/callbacks/VariablesChangedCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public response(Lorg/json/JSONObject;)V
    .registers 5

    const/4 v0, 0x0

    if-nez p1, :cond_b

    :try_start_3
    const-string p1, "No response received from the server. Please contact us to investigate."

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p1, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_3a

    :cond_b
    # invokes: Lcom/leanplum/Leanplum;->applyContentInResponse(Lorg/json/JSONObject;)V
    invoke-static {p1}, Lcom/leanplum/Leanplum;->access$1300(Lorg/json/JSONObject;)V

    const-string v1, "syncNewsfeed"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1f

    invoke-static {}, Lcom/leanplum/LeanplumInbox;->getInstance()Lcom/leanplum/LeanplumInbox;

    move-result-object v1

    invoke-virtual {v1}, Lcom/leanplum/LeanplumInbox;->downloadMessages()V

    goto :goto_26

    :cond_1f
    invoke-static {}, Lcom/leanplum/LeanplumInbox;->getInstance()Lcom/leanplum/LeanplumInbox;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/leanplum/LeanplumInbox;->triggerInboxSyncedWithStatus(Z)V

    :goto_26
    const-string v1, "loggingEnabled"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_30

    sput-boolean v2, Lcom/leanplum/internal/Constants;->loggingEnabled:Z

    :cond_30
    # invokes: Lcom/leanplum/Leanplum;->parseVariantDebugInfo(Lorg/json/JSONObject;)V
    invoke-static {p1}, Lcom/leanplum/Leanplum;->access$1400(Lorg/json/JSONObject;)V

    invoke-static {p1}, Lcom/leanplum/Leanplum;->parseFilenameToURLs(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object p1

    invoke-static {p1}, Lcom/leanplum/internal/FileManager;->setFilenameToURLs(Ljava/util/Map;)V

    :goto_3a
    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object p1

    iget-object p0, p0, Lcom/leanplum/Leanplum$17;->val$callback:Lcom/leanplum/callbacks/VariablesChangedCallback;

    invoke-virtual {p1, p0}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V
    :try_end_43
    .catchall {:try_start_3 .. :try_end_43} :catchall_44

    return-void

    :catchall_44
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
