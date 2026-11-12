.class Lcom/leanplum/internal/LeanplumInternal$5;
.super Lcom/leanplum/callbacks/VariablesChangedCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/internal/LeanplumInternal;->scheduleAction(Lcom/leanplum/ActionContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$actionContext:Lcom/leanplum/ActionContext;


# direct methods
.method public constructor <init>(Lcom/leanplum/ActionContext;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/internal/LeanplumInternal$5;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-direct {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public variablesChanged()V
    .registers 3

    :try_start_0
    const-string v0, "__Push Notification"

    iget-object v1, p0, Lcom/leanplum/internal/LeanplumInternal$5;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-virtual {v1}, Lcom/leanplum/ActionContext;->actionName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-static {}, Lcom/leanplum/internal/ActionManager;->getInstance()Lcom/leanplum/internal/ActionManager;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/internal/LeanplumInternal$5;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-virtual {v1}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/ActionManager;->recordLocalPushImpression(Ljava/lang/String;)V

    goto :goto_29

    :cond_1c
    invoke-static {}, Lcom/leanplum/internal/ActionManager;->getInstance()Lcom/leanplum/internal/ActionManager;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/internal/LeanplumInternal$5;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-virtual {v1}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/ActionManager;->recordMessageImpression(Ljava/lang/String;)V

    :goto_29
    iget-object p0, p0, Lcom/leanplum/internal/LeanplumInternal$5;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-static {p0}, Lcom/leanplum/Leanplum;->triggerMessageDisplayed(Lcom/leanplum/ActionContext;)V
    :try_end_2e
    .catchall {:try_start_0 .. :try_end_2e} :catchall_2f

    return-void

    :catchall_2f
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
