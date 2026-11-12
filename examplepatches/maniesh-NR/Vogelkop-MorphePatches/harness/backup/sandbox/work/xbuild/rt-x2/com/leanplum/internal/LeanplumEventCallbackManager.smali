.class Lcom/leanplum/internal/LeanplumEventCallbackManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;
    }
.end annotation


# instance fields
.field private final callbacks:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager;->callbacks:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method


# virtual methods
.method public addCallbacks(Lcom/leanplum/internal/Request;Lcom/leanplum/internal/Request$ResponseCallback;Lcom/leanplum/internal/Request$ErrorCallback;)V
    .registers 5

    if-eqz p1, :cond_6

    if-nez p2, :cond_7

    if-nez p3, :cond_7

    :cond_6
    return-void

    :cond_7
    iget-object p0, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager;->callbacks:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/leanplum/internal/Request;->getRequestId()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;

    invoke-direct {v0, p2, p3}, Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;-><init>(Lcom/leanplum/internal/Request$ResponseCallback;Lcom/leanplum/internal/Request$ErrorCallback;)V

    invoke-virtual {p0, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public invokeAllCallbacksWithError(Ljava/lang/Exception;)V
    .registers 8
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager;->callbacks:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    if-eqz v0, :cond_56

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager;->callbacks:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_17
    :goto_17
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_41

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;

    if-eqz v2, :cond_17

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v4

    new-instance v5, Lcom/leanplum/internal/LeanplumEventCallbackManager$3;

    invoke-direct {v5, p0, v2, p1}, Lcom/leanplum/internal/LeanplumEventCallbackManager$3;-><init>(Lcom/leanplum/internal/LeanplumEventCallbackManager;Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;Ljava/lang/Exception;)V

    invoke-virtual {v4, v5}, Lcom/leanplum/internal/OperationQueue;->addParallelOperation(Ljava/lang/Runnable;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_17

    :cond_41
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v1, 0x0

    :goto_46
    if-ge v1, p1, :cond_56

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager;->callbacks:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_46

    :cond_56
    return-void
.end method

.method public invokeCallbacks(Lorg/json/JSONObject;)V
    .registers 9

    if-eqz p1, :cond_7b

    iget-object v0, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager;->callbacks:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    if-eqz v0, :cond_7b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager;->callbacks:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_19
    :goto_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_66

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;

    if-eqz v3, :cond_19

    if-eqz v2, :cond_19

    invoke-static {p1, v3}, Lcom/leanplum/internal/RequestUtil;->getResponseForId(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_19

    invoke-static {v4}, Lcom/leanplum/internal/RequestUtil;->isResponseSuccess(Lorg/json/JSONObject;)Z

    move-result v5

    if-eqz v5, :cond_4e

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v5

    new-instance v6, Lcom/leanplum/internal/LeanplumEventCallbackManager$1;

    invoke-direct {v6, p0, v2, v4}, Lcom/leanplum/internal/LeanplumEventCallbackManager$1;-><init>(Lcom/leanplum/internal/LeanplumEventCallbackManager;Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;Lorg/json/JSONObject;)V

    invoke-virtual {v5, v6}, Lcom/leanplum/internal/OperationQueue;->addParallelOperation(Ljava/lang/Runnable;)V

    goto :goto_62

    :cond_4e
    invoke-static {v4}, Lcom/leanplum/internal/RequestUtil;->getResponseError(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/leanplum/internal/RequestUtil;->getReadableErrorMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v5

    new-instance v6, Lcom/leanplum/internal/LeanplumEventCallbackManager$2;

    invoke-direct {v6, p0, v2, v4}, Lcom/leanplum/internal/LeanplumEventCallbackManager$2;-><init>(Lcom/leanplum/internal/LeanplumEventCallbackManager;Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Lcom/leanplum/internal/OperationQueue;->addParallelOperation(Ljava/lang/Runnable;)V

    :goto_62
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_19

    :cond_66
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v1, 0x0

    :goto_6b
    if-ge v1, p1, :cond_7b

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager;->callbacks:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6b

    :cond_7b
    return-void
.end method
