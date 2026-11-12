.class Lcom/leanplum/LeanplumPushService$3$1$1;
.super Lcom/leanplum/callbacks/VariablesChangedCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/LeanplumPushService$3$1;->variablesChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/leanplum/LeanplumPushService$3$1;


# direct methods
.method public constructor <init>(Lcom/leanplum/LeanplumPushService$3$1;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/LeanplumPushService$3$1$1;->this$1:Lcom/leanplum/LeanplumPushService$3$1;

    invoke-direct {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public variablesChanged()V
    .registers 2

    :try_start_0
    const-string v0, "Open action"

    iget-object p0, p0, Lcom/leanplum/LeanplumPushService$3$1$1;->this$1:Lcom/leanplum/LeanplumPushService$3$1;

    iget-object p0, p0, Lcom/leanplum/LeanplumPushService$3$1;->val$messageId:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/leanplum/internal/LeanplumInternal;->performTrackedAction(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    return-void

    :catchall_a
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
