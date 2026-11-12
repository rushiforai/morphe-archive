.class public final Lcom/leanplum/messagetemplates/OperaSubscriptionDialog$register$1$onResponse$1;
.super Lcom/leanplum/callbacks/VariablesChangedCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/OperaSubscriptionDialog$register$1;->onResponse(Lcom/leanplum/ActionContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004"
    }
    d2 = {
        "com/leanplum/messagetemplates/OperaSubscriptionDialog$register$1$onResponse$1",
        "Lcom/leanplum/callbacks/VariablesChangedCallback;",
        "variablesChanged",
        "",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $actionContext:Lcom/leanplum/ActionContext;

.field final synthetic $currentContext:Landroid/content/Context;

.field final synthetic $taskExecutor:Ltcl;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltcl;Lcom/leanplum/ActionContext;)V
    .registers 4

    iput-object p1, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog$register$1$onResponse$1;->$currentContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog$register$1$onResponse$1;->$taskExecutor:Ltcl;

    iput-object p3, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog$register$1$onResponse$1;->$actionContext:Lcom/leanplum/ActionContext;

    invoke-direct {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public variablesChanged()V
    .registers 4

    new-instance v0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog$register$1$onResponse$1$variablesChanged$1;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog$register$1$onResponse$1;->$currentContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog$register$1$onResponse$1;->$taskExecutor:Ltcl;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog$register$1$onResponse$1;->$actionContext:Lcom/leanplum/ActionContext;

    invoke-direct {v0, v1, v2, p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog$register$1$onResponse$1$variablesChanged$1;-><init>(Landroid/content/Context;Ltcl;Lcom/leanplum/ActionContext;)V

    invoke-static {v0}, Lcom/leanplum/LeanplumActivityHelper;->queueActionUponActive(Ljava/lang/Runnable;)V

    return-void
.end method
