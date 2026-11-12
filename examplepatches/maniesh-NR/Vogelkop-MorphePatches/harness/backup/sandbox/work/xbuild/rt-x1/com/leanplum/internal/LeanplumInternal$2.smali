.class Lcom/leanplum/internal/LeanplumInternal$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/internal/LeanplumInternal;->triggerAction(Lcom/leanplum/ActionContext;Lcom/leanplum/callbacks/VariablesChangedCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/leanplum/callbacks/ActionCallback;

.field final synthetic val$context:Lcom/leanplum/ActionContext;

.field final synthetic val$handled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic val$handledCallback:Lcom/leanplum/callbacks/VariablesChangedCallback;


# direct methods
.method public constructor <init>(Lcom/leanplum/callbacks/ActionCallback;Lcom/leanplum/ActionContext;Lcom/leanplum/callbacks/VariablesChangedCallback;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .registers 5

    iput-object p1, p0, Lcom/leanplum/internal/LeanplumInternal$2;->val$callback:Lcom/leanplum/callbacks/ActionCallback;

    iput-object p2, p0, Lcom/leanplum/internal/LeanplumInternal$2;->val$context:Lcom/leanplum/ActionContext;

    iput-object p3, p0, Lcom/leanplum/internal/LeanplumInternal$2;->val$handledCallback:Lcom/leanplum/callbacks/VariablesChangedCallback;

    iput-object p4, p0, Lcom/leanplum/internal/LeanplumInternal$2;->val$handled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    iget-object v0, p0, Lcom/leanplum/internal/LeanplumInternal$2;->val$callback:Lcom/leanplum/callbacks/ActionCallback;

    iget-object v1, p0, Lcom/leanplum/internal/LeanplumInternal$2;->val$context:Lcom/leanplum/ActionContext;

    invoke-virtual {v0, v1}, Lcom/leanplum/callbacks/ActionCallback;->onResponse(Lcom/leanplum/ActionContext;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/leanplum/internal/LeanplumInternal$2;->val$handledCallback:Lcom/leanplum/callbacks/VariablesChangedCallback;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/leanplum/internal/LeanplumInternal$2;->val$handled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_1c

    iget-object p0, p0, Lcom/leanplum/internal/LeanplumInternal$2;->val$handledCallback:Lcom/leanplum/callbacks/VariablesChangedCallback;

    invoke-virtual {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;->variablesChanged()V

    :cond_1c
    return-void
.end method
