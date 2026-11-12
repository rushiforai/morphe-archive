.class Lcom/leanplum/internal/LeanplumEventCallbackManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/internal/LeanplumEventCallbackManager;->invokeCallbacks(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/internal/LeanplumEventCallbackManager;

.field final synthetic val$callbacks:Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;

.field final synthetic val$response:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Lcom/leanplum/internal/LeanplumEventCallbackManager;Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;Lorg/json/JSONObject;)V
    .registers 4

    iput-object p1, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$1;->this$0:Lcom/leanplum/internal/LeanplumEventCallbackManager;

    iput-object p2, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$1;->val$callbacks:Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;

    iput-object p3, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$1;->val$response:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    iget-object v0, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$1;->val$callbacks:Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;

    # getter for: Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->responseCallback:Lcom/leanplum/internal/Request$ResponseCallback;
    invoke-static {v0}, Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->access$000(Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;)Lcom/leanplum/internal/Request$ResponseCallback;

    move-result-object v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$1;->val$callbacks:Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;

    # getter for: Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->responseCallback:Lcom/leanplum/internal/Request$ResponseCallback;
    invoke-static {v0}, Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->access$000(Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;)Lcom/leanplum/internal/Request$ResponseCallback;

    move-result-object v0

    iget-object p0, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$1;->val$response:Lorg/json/JSONObject;

    invoke-interface {v0, p0}, Lcom/leanplum/internal/Request$ResponseCallback;->response(Lorg/json/JSONObject;)V

    :cond_13
    return-void
.end method
