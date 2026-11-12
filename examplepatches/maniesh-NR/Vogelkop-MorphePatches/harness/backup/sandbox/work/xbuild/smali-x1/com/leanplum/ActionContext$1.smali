.class Lcom/leanplum/ActionContext$1;
.super Lcom/leanplum/callbacks/VariablesChangedCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/ActionContext;->createActionContextForMessageId(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/ActionContext;

.field final synthetic val$actionContext:Lcom/leanplum/ActionContext;

.field final synthetic val$messageId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/leanplum/ActionContext;Lcom/leanplum/ActionContext;Ljava/lang/String;)V
    .registers 4

    iput-object p1, p0, Lcom/leanplum/ActionContext$1;->this$0:Lcom/leanplum/ActionContext;

    iput-object p2, p0, Lcom/leanplum/ActionContext$1;->val$actionContext:Lcom/leanplum/ActionContext;

    iput-object p3, p0, Lcom/leanplum/ActionContext$1;->val$messageId:Ljava/lang/String;

    invoke-direct {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public variablesChanged()V
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/leanplum/ActionContext$1;->val$actionContext:Lcom/leanplum/ActionContext;

    # getter for: Lcom/leanplum/ActionContext;->name:Ljava/lang/String;
    invoke-static {v0}, Lcom/leanplum/ActionContext;->access$000(Lcom/leanplum/ActionContext;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/internal/VarCache;->getActionDefinitionType(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_17

    invoke-static {}, Lcom/leanplum/internal/ActionManager;->getInstance()Lcom/leanplum/internal/ActionManager;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/ActionContext$1;->val$messageId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/ActionManager;->recordChainedActionImpression(Ljava/lang/String;)V

    goto :goto_20

    :cond_17
    invoke-static {}, Lcom/leanplum/internal/ActionManager;->getInstance()Lcom/leanplum/internal/ActionManager;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/ActionContext$1;->val$messageId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/ActionManager;->recordMessageImpression(Ljava/lang/String;)V

    :goto_20
    iget-object p0, p0, Lcom/leanplum/ActionContext$1;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-static {p0}, Lcom/leanplum/Leanplum;->triggerMessageDisplayed(Lcom/leanplum/ActionContext;)V
    :try_end_25
    .catchall {:try_start_0 .. :try_end_25} :catchall_26

    return-void

    :catchall_26
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
