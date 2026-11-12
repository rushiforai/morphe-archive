.class Lcom/leanplum/internal/LeanplumEventCallbackManager$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/internal/LeanplumEventCallbackManager;->invokeAllCallbacksWithError(Ljava/lang/Exception;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/internal/LeanplumEventCallbackManager;

.field final synthetic val$callbacks:Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;

.field final synthetic val$error:Ljava/lang/Exception;


# direct methods
.method public constructor <init>(Lcom/leanplum/internal/LeanplumEventCallbackManager;Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;Ljava/lang/Exception;)V
    .registers 4

    iput-object p1, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$3;->this$0:Lcom/leanplum/internal/LeanplumEventCallbackManager;

    iput-object p2, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$3;->val$callbacks:Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;

    iput-object p3, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$3;->val$error:Ljava/lang/Exception;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    iget-object v0, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$3;->val$callbacks:Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;

    # getter for: Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->errorCallback:Lcom/leanplum/internal/Request$ErrorCallback;
    invoke-static {v0}, Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->access$100(Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;)Lcom/leanplum/internal/Request$ErrorCallback;

    move-result-object v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$3;->val$callbacks:Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;

    # getter for: Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->errorCallback:Lcom/leanplum/internal/Request$ErrorCallback;
    invoke-static {v0}, Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->access$100(Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;)Lcom/leanplum/internal/Request$ErrorCallback;

    move-result-object v0

    iget-object p0, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$3;->val$error:Ljava/lang/Exception;

    invoke-interface {v0, p0}, Lcom/leanplum/internal/Request$ErrorCallback;->error(Ljava/lang/Exception;)V

    :cond_13
    return-void
.end method
