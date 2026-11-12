.class Lcom/leanplum/Leanplum$18;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/internal/Request$ErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/Leanplum;->forceContentUpdate(Lcom/leanplum/callbacks/VariablesChangedCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/leanplum/callbacks/VariablesChangedCallback;


# direct methods
.method public constructor <init>(Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/Leanplum$18;->val$callback:Lcom/leanplum/callbacks/VariablesChangedCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public error(Ljava/lang/Exception;)V
    .registers 2

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object p1

    iget-object p0, p0, Lcom/leanplum/Leanplum$18;->val$callback:Lcom/leanplum/callbacks/VariablesChangedCallback;

    invoke-virtual {p1, p0}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    invoke-static {}, Lcom/leanplum/LeanplumInbox;->getInstance()Lcom/leanplum/LeanplumInbox;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/leanplum/LeanplumInbox;->triggerInboxSyncedWithStatus(Z)V

    return-void
.end method
