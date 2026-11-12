.class Lcom/leanplum/LeanplumInbox$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/internal/Request$ResponseCallback;


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

    iput-object p1, p0, Lcom/leanplum/LeanplumInbox$2;->this$0:Lcom/leanplum/LeanplumInbox;

    iput-object p2, p0, Lcom/leanplum/LeanplumInbox$2;->val$callback:Lcom/leanplum/callbacks/InboxSyncedCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public response(Lorg/json/JSONObject;)V
    .registers 14

    const-string v0, "expirationTimestamp"

    const/4 v1, 0x0

    if-nez p1, :cond_d

    :try_start_5
    const-string p1, "No inbox response received from the server."

    new-array v0, v1, [Ljava/lang/Object;

    invoke-static {p1, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_d
    const-string v2, "newsfeedMessages"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_1f

    const-string v0, "No inbox messages found in the response from the server. %s"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_1f
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    move v5, v1

    :cond_2b
    :goto_2b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_86

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "messageData"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "vars"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-static {v8}, Lcom/leanplum/internal/JsonConverter;->mapFromJson(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v8

    const-string v9, "deliveryTimestamp"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_64

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    goto :goto_65

    :cond_64
    const/4 v10, 0x0

    :goto_65
    const-string v11, "isRead"

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v7

    invoke-static {v6, v9, v10, v7, v8}, Lcom/leanplum/LeanplumInboxMessage;->constructMessage(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;ZLjava/util/Map;)Lcom/leanplum/LeanplumInboxMessage;

    move-result-object v8

    if-eqz v8, :cond_2b

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v8}, Lcom/leanplum/LeanplumInboxMessage;->downloadImageIfPrefetchingEnabled()Z

    move-result v9

    or-int/2addr v3, v9

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    if-nez v7, :cond_82

    add-int/lit8 v5, v5, 0x1

    :cond_82
    invoke-virtual {p1, v6, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2b

    :cond_86
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_9a

    iget-object v0, p0, Lcom/leanplum/LeanplumInbox$2;->this$0:Lcom/leanplum/LeanplumInbox;

    const/4 v2, 0x1

    invoke-virtual {v0, p1, v5, v2}, Lcom/leanplum/LeanplumInbox;->update(Ljava/util/Map;IZ)V

    iget-object p1, p0, Lcom/leanplum/LeanplumInbox$2;->this$0:Lcom/leanplum/LeanplumInbox;

    iget-object v0, p0, Lcom/leanplum/LeanplumInbox$2;->val$callback:Lcom/leanplum/callbacks/InboxSyncedCallback;

    # invokes: Lcom/leanplum/LeanplumInbox;->triggerInboxSyncedWithStatus(ZLcom/leanplum/callbacks/InboxSyncedCallback;)V
    invoke-static {p1, v2, v0}, Lcom/leanplum/LeanplumInbox;->access$000(Lcom/leanplum/LeanplumInbox;ZLcom/leanplum/callbacks/InboxSyncedCallback;)V

    return-void

    :cond_9a
    new-instance v0, Lcom/leanplum/LeanplumInbox$2$1;

    invoke-direct {v0, p0, p1, v5}, Lcom/leanplum/LeanplumInbox$2$1;-><init>(Lcom/leanplum/LeanplumInbox$2;Ljava/util/Map;I)V

    invoke-static {v0}, Lcom/leanplum/Leanplum;->addOnceVariablesChangedAndNoDownloadsPendingHandler(Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    :try_end_a2
    .catchall {:try_start_5 .. :try_end_a2} :catchall_a3

    return-void

    :catchall_a3
    move-exception p1

    iget-object v0, p0, Lcom/leanplum/LeanplumInbox$2;->this$0:Lcom/leanplum/LeanplumInbox;

    iget-object p0, p0, Lcom/leanplum/LeanplumInbox$2;->val$callback:Lcom/leanplum/callbacks/InboxSyncedCallback;

    # invokes: Lcom/leanplum/LeanplumInbox;->triggerInboxSyncedWithStatus(ZLcom/leanplum/callbacks/InboxSyncedCallback;)V
    invoke-static {v0, v1, p0}, Lcom/leanplum/LeanplumInbox;->access$000(Lcom/leanplum/LeanplumInbox;ZLcom/leanplum/callbacks/InboxSyncedCallback;)V

    invoke-static {p1}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
