.class Lcom/leanplum/internal/Registration$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/internal/Request$ResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/internal/Registration;->registerDevice(Ljava/lang/String;Lcom/leanplum/callbacks/StartCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/leanplum/callbacks/StartCallback;


# direct methods
.method public constructor <init>(Lcom/leanplum/callbacks/StartCallback;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/internal/Registration$1;->val$callback:Lcom/leanplum/callbacks/StartCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public response(Lorg/json/JSONObject;)V
    .registers 4

    :try_start_0
    invoke-static {p1}, Lcom/leanplum/internal/RequestUtil;->isResponseSuccess(Lorg/json/JSONObject;)Z

    move-result v0

    iget-object v1, p0, Lcom/leanplum/internal/Registration$1;->val$callback:Lcom/leanplum/callbacks/StartCallback;

    invoke-virtual {v1, v0}, Lcom/leanplum/callbacks/StartCallback;->setSuccess(Z)V

    if-nez v0, :cond_15

    invoke-static {p1}, Lcom/leanplum/internal/RequestUtil;->getResponseError(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p1, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_15
    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object p1

    iget-object p0, p0, Lcom/leanplum/internal/Registration$1;->val$callback:Lcom/leanplum/callbacks/StartCallback;

    invoke-virtual {p1, p0}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V
    :try_end_1e
    .catchall {:try_start_0 .. :try_end_1e} :catchall_1f

    return-void

    :catchall_1f
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
