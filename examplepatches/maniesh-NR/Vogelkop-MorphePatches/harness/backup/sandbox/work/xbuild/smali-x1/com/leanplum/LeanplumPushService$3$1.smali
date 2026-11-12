.class Lcom/leanplum/LeanplumPushService$3$1;
.super Lcom/leanplum/callbacks/VariablesChangedCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/LeanplumPushService$3;->variablesChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/LeanplumPushService$3;

.field final synthetic val$messageId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/leanplum/LeanplumPushService$3;Ljava/lang/String;)V
    .registers 3

    iput-object p1, p0, Lcom/leanplum/LeanplumPushService$3$1;->this$0:Lcom/leanplum/LeanplumPushService$3;

    iput-object p2, p0, Lcom/leanplum/LeanplumPushService$3$1;->val$messageId:Ljava/lang/String;

    invoke-direct {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public variablesChanged()V
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/leanplum/LeanplumPushService$3$1;->val$messageId:Ljava/lang/String;

    new-instance v1, Lcom/leanplum/LeanplumPushService$3$1$1;

    invoke-direct {v1, p0}, Lcom/leanplum/LeanplumPushService$3$1$1;-><init>(Lcom/leanplum/LeanplumPushService$3$1;)V

    # invokes: Lcom/leanplum/LeanplumPushService;->requireMessageContent(Ljava/lang/String;Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    invoke-static {v0, v1}, Lcom/leanplum/LeanplumPushService;->access$100(Ljava/lang/String;Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    :try_end_a
    .catchall {:try_start_0 .. :try_end_a} :catchall_b

    return-void

    :catchall_b
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
