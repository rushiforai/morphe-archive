.class Lcom/leanplum/LeanplumPushService$3;
.super Lcom/leanplum/callbacks/VariablesChangedCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/LeanplumPushService;->performPushNotificationAction(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$notification:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/LeanplumPushService$3;->val$notification:Landroid/os/Bundle;

    invoke-direct {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public variablesChanged()V
    .registers 5

    const-string v0, "Open action"

    :try_start_2
    iget-object v1, p0, Lcom/leanplum/LeanplumPushService$3;->val$notification:Landroid/os/Bundle;

    invoke-static {v1}, Lcom/leanplum/LeanplumPushService;->getMessageId(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3f

    iget-object v2, p0, Lcom/leanplum/LeanplumPushService$3;->val$notification:Landroid/os/Bundle;

    # invokes: Lcom/leanplum/LeanplumPushService;->areActionsEmbedded(Landroid/os/Bundle;)Z
    invoke-static {v2}, Lcom/leanplum/LeanplumPushService;->access$000(Landroid/os/Bundle;)Z

    move-result v2

    if-eqz v2, :cond_37

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iget-object p0, p0, Lcom/leanplum/LeanplumPushService$3;->val$notification:Landroid/os/Bundle;

    const-string v3, "_lpx"

    invoke-virtual {p0, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/JsonConverter;->fromJson(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    invoke-virtual {v2, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lcom/leanplum/ActionContext;

    const-string v3, "__Push Notification"

    invoke-direct {p0, v3, v2, v1}, Lcom/leanplum/ActionContext;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/leanplum/ActionContext;->preventRealtimeUpdating()V

    invoke-virtual {p0}, Lcom/leanplum/ActionContext;->update()V

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->runTrackedActionNamed(Ljava/lang/String;)V

    return-void

    :cond_37
    new-instance v0, Lcom/leanplum/LeanplumPushService$3$1;

    invoke-direct {v0, p0, v1}, Lcom/leanplum/LeanplumPushService$3$1;-><init>(Lcom/leanplum/LeanplumPushService$3;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/leanplum/Leanplum;->addOnceVariablesChangedAndNoDownloadsPendingHandler(Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    :try_end_3f
    .catchall {:try_start_2 .. :try_end_3f} :catchall_40

    :cond_3f
    return-void

    :catchall_40
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
