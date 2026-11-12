.class Lcom/leanplum/messagetemplates/OperaSheet$2$1;
.super Lcom/leanplum/callbacks/VariablesChangedCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/OperaSheet$2;->onResponse(Lcom/leanplum/ActionContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$actionContext:Lcom/leanplum/ActionContext;

.field final synthetic val$currentContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/leanplum/messagetemplates/OperaSheet$2;Landroid/content/Context;Lcom/leanplum/ActionContext;)V
    .registers 4

    iput-object p2, p0, Lcom/leanplum/messagetemplates/OperaSheet$2$1;->val$currentContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/leanplum/messagetemplates/OperaSheet$2$1;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public variablesChanged()V
    .registers 4

    new-instance v0, Lcom/leanplum/messagetemplates/OperaSheet$2$1$1;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheet$2$1;->val$currentContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/leanplum/messagetemplates/OperaSheet$2$1;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-direct {v0, p0, v1, v2}, Lcom/leanplum/messagetemplates/OperaSheet$2$1$1;-><init>(Lcom/leanplum/messagetemplates/OperaSheet$2$1;Landroid/content/Context;Lcom/leanplum/ActionContext;)V

    invoke-static {v0}, Lcom/leanplum/LeanplumActivityHelper;->queueActionUponActive(Ljava/lang/Runnable;)V

    return-void
.end method
