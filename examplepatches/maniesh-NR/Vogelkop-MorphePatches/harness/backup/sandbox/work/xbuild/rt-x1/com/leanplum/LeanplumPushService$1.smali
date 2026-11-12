.class Lcom/leanplum/LeanplumPushService$1;
.super Lcom/leanplum/callbacks/VariablesChangedCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/LeanplumPushService;->requireMessageContent(Ljava/lang/String;Lcom/leanplum/callbacks/VariablesChangedCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$messageId:Ljava/lang/String;

.field final synthetic val$onComplete:Lcom/leanplum/callbacks/VariablesChangedCallback;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    .registers 3

    iput-object p1, p0, Lcom/leanplum/LeanplumPushService$1;->val$messageId:Ljava/lang/String;

    iput-object p2, p0, Lcom/leanplum/LeanplumPushService$1;->val$onComplete:Lcom/leanplum/callbacks/VariablesChangedCallback;

    invoke-direct {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public variablesChanged()V
    .registers 4

    :try_start_0
    invoke-static {}, Lcom/leanplum/internal/VarCache;->messages()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/LeanplumPushService$1;->val$messageId:Ljava/lang/String;

    if-eqz v1, :cond_46

    if-eqz v0, :cond_10

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_46

    :cond_10
    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withGetVarsAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    const-string v1, "includeDefaults"

    const-string v2, "false"

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;->andParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    const-string v1, "includeMessageId"

    iget-object v2, p0, Lcom/leanplum/LeanplumPushService$1;->val$messageId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;->andParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    sget-object v1, Lcom/leanplum/internal/Request$RequestType;->IMMEDIATE:Lcom/leanplum/internal/Request$RequestType;

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/RequestBuilder;->andType(Lcom/leanplum/internal/Request$RequestType;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object v0

    new-instance v1, Lcom/leanplum/LeanplumPushService$1$1;

    invoke-direct {v1, p0}, Lcom/leanplum/LeanplumPushService$1$1;-><init>(Lcom/leanplum/LeanplumPushService$1;)V

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/Request;->onResponse(Lcom/leanplum/internal/Request$ResponseCallback;)V

    new-instance v1, Lcom/leanplum/LeanplumPushService$1$2;

    invoke-direct {v1, p0}, Lcom/leanplum/LeanplumPushService$1$2;-><init>(Lcom/leanplum/LeanplumPushService$1;)V

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/Request;->onError(Lcom/leanplum/internal/Request$ErrorCallback;)V

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    return-void

    :cond_46
    iget-object p0, p0, Lcom/leanplum/LeanplumPushService$1;->val$onComplete:Lcom/leanplum/callbacks/VariablesChangedCallback;

    invoke-virtual {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;->variablesChanged()V
    :try_end_4b
    .catchall {:try_start_0 .. :try_end_4b} :catchall_4c

    return-void

    :catchall_4c
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
