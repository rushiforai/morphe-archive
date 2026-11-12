.class public Lcom/leanplum/internal/Socket;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static handleTriggerEvent(Lorg/json/JSONArray;)V
    .registers 6

    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p0

    const-string v0, "action"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_6e

    const-string v1, "messageId"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "isRooted"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p0

    const-string v2, "__name__"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/leanplum/internal/VarCache;->actionDefinitions()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_3c

    const-string v4, "values"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    goto :goto_3d

    :cond_3c
    const/4 v3, 0x0

    :goto_3d
    invoke-static {v0}, Lcom/leanplum/internal/JsonConverter;->mapFromJson(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/leanplum/internal/VarCache;->mergeHelper(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    new-instance v3, Lcom/leanplum/ActionContext;

    invoke-direct {v3, v2, v0, v1}, Lcom/leanplum/ActionContext;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/leanplum/ActionContext;->preventRealtimeUpdating()V

    invoke-virtual {v3, p0}, Lcom/leanplum/internal/BaseActionContext;->setIsRooted(Z)V

    const/4 p0, 0x1

    invoke-virtual {v3, p0}, Lcom/leanplum/internal/BaseActionContext;->setIsPreview(Z)V

    invoke-virtual {v3}, Lcom/leanplum/ActionContext;->update()V

    invoke-static {v3}, Lcom/leanplum/internal/LeanplumInternal;->triggerAction(Lcom/leanplum/ActionContext;)V

    invoke-static {}, Lcom/leanplum/internal/ActionManager;->getInstance()Lcom/leanplum/internal/ActionManager;

    move-result-object p0

    invoke-virtual {v3}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/leanplum/internal/ActionManager;->recordMessageImpression(Ljava/lang/String;)V

    invoke-static {v3}, Lcom/leanplum/Leanplum;->triggerMessageDisplayed(Lcom/leanplum/ActionContext;)V
    :try_end_6e
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_6e} :catch_6f

    :cond_6e
    return-void

    :catch_6f
    move-exception p0

    const-string v0, "Error getting action info"

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
