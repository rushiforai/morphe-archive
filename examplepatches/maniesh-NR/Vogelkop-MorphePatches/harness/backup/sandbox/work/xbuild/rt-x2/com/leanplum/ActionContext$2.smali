.class Lcom/leanplum/ActionContext$2;
.super Lcom/leanplum/callbacks/VariablesChangedCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/ActionContext;->isChainToExistingMessageStarted(Ljava/util/Map;Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/ActionContext;

.field final synthetic val$messageId:Ljava/lang/String;

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/leanplum/ActionContext;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    iput-object p1, p0, Lcom/leanplum/ActionContext$2;->this$0:Lcom/leanplum/ActionContext;

    iput-object p2, p0, Lcom/leanplum/ActionContext$2;->val$messageId:Ljava/lang/String;

    iput-object p3, p0, Lcom/leanplum/ActionContext$2;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public variablesChanged()V
    .registers 4

    iget-object v0, p0, Lcom/leanplum/ActionContext$2;->this$0:Lcom/leanplum/ActionContext;

    iget-object v1, p0, Lcom/leanplum/ActionContext$2;->val$messageId:Ljava/lang/String;

    invoke-static {}, Lcom/leanplum/internal/VarCache;->messages()Ljava/util/Map;

    move-result-object v2

    iget-object p0, p0, Lcom/leanplum/ActionContext$2;->val$name:Ljava/lang/String;

    # invokes: Lcom/leanplum/ActionContext;->executeChainedMessage(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z
    invoke-static {v0, v1, v2, p0}, Lcom/leanplum/ActionContext;->access$100(Lcom/leanplum/ActionContext;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z

    return-void
.end method
