.class Lcom/leanplum/messagetemplates/MessageTemplates$2$1;
.super Lcom/leanplum/callbacks/VariablesChangedCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/MessageTemplates$2;->onResponse(Lcom/leanplum/ActionContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/messagetemplates/MessageTemplates$2;

.field final synthetic val$actionContext:Lcom/leanplum/ActionContext;


# direct methods
.method public constructor <init>(Lcom/leanplum/messagetemplates/MessageTemplates$2;Lcom/leanplum/ActionContext;)V
    .registers 3

    iput-object p1, p0, Lcom/leanplum/messagetemplates/MessageTemplates$2$1;->this$0:Lcom/leanplum/messagetemplates/MessageTemplates$2;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/MessageTemplates$2$1;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-direct {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public variablesChanged()V
    .registers 2

    new-instance v0, Lcom/leanplum/messagetemplates/MessageTemplates$2$1$1;

    invoke-direct {v0, p0}, Lcom/leanplum/messagetemplates/MessageTemplates$2$1$1;-><init>(Lcom/leanplum/messagetemplates/MessageTemplates$2$1;)V

    invoke-static {v0}, Lcom/leanplum/LeanplumActivityHelper;->queueActionUponActive(Ljava/lang/Runnable;)V

    return-void
.end method
