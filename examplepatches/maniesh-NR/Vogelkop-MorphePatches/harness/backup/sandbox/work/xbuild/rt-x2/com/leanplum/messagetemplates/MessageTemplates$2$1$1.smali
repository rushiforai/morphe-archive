.class Lcom/leanplum/messagetemplates/MessageTemplates$2$1$1;
.super Lcom/leanplum/callbacks/PostponableAction;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/MessageTemplates$2$1;->variablesChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/leanplum/messagetemplates/MessageTemplates$2$1;


# direct methods
.method public constructor <init>(Lcom/leanplum/messagetemplates/MessageTemplates$2$1;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/messagetemplates/MessageTemplates$2$1$1;->this$1:Lcom/leanplum/messagetemplates/MessageTemplates$2$1;

    invoke-direct {p0}, Lcom/leanplum/callbacks/PostponableAction;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    iget-object p0, p0, Lcom/leanplum/messagetemplates/MessageTemplates$2$1$1;->this$1:Lcom/leanplum/messagetemplates/MessageTemplates$2$1;

    iget-object v0, p0, Lcom/leanplum/messagetemplates/MessageTemplates$2$1;->this$0:Lcom/leanplum/messagetemplates/MessageTemplates$2;

    iget-object v0, v0, Lcom/leanplum/messagetemplates/MessageTemplates$2;->val$template:Lcom/leanplum/messagetemplates/MessageTemplate;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/MessageTemplates$2$1;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-interface {v0, p0}, Lcom/leanplum/messagetemplates/MessageTemplate;->handleAction(Lcom/leanplum/ActionContext;)V

    return-void
.end method
