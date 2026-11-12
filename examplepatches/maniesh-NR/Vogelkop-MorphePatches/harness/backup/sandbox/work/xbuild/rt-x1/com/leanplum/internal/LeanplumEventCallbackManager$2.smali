.class Lcom/leanplum/internal/LeanplumEventCallbackManager$2;
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

.field final synthetic val$msg:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/leanplum/internal/LeanplumEventCallbackManager;Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;Ljava/lang/String;)V
    .registers 4

    iput-object p1, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$2;->this$0:Lcom/leanplum/internal/LeanplumEventCallbackManager;

    iput-object p2, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$2;->val$callbacks:Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;

    iput-object p3, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$2;->val$msg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    iget-object v0, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$2;->val$callbacks:Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;

    # getter for: Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->errorCallback:Lcom/leanplum/internal/Request$ErrorCallback;
    invoke-static {v0}, Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->access$100(Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;)Lcom/leanplum/internal/Request$ErrorCallback;

    move-result-object v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$2;->val$callbacks:Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;

    # getter for: Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->errorCallback:Lcom/leanplum/internal/Request$ErrorCallback;
    invoke-static {v0}, Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->access$100(Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;)Lcom/leanplum/internal/Request$ErrorCallback;

    move-result-object v0

    new-instance v1, Ljava/lang/Exception;

    iget-object p0, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$2;->val$msg:Ljava/lang/String;

    invoke-direct {v1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/leanplum/internal/Request$ErrorCallback;->error(Ljava/lang/Exception;)V

    :cond_18
    return-void
.end method
