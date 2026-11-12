.class Lcom/leanplum/messagetemplates/MessageTemplates$1$1;
.super Lcom/leanplum/callbacks/PostponableAction;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/MessageTemplates$1;->onResponse(Lcom/leanplum/ActionContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/messagetemplates/MessageTemplates$1;

.field final synthetic val$actionContext:Lcom/leanplum/ActionContext;


# direct methods
.method public constructor <init>(Lcom/leanplum/messagetemplates/MessageTemplates$1;Lcom/leanplum/ActionContext;)V
    .registers 3

    iput-object p1, p0, Lcom/leanplum/messagetemplates/MessageTemplates$1$1;->this$0:Lcom/leanplum/messagetemplates/MessageTemplates$1;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/MessageTemplates$1$1;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-direct {p0}, Lcom/leanplum/callbacks/PostponableAction;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    iget-object v0, p0, Lcom/leanplum/messagetemplates/MessageTemplates$1$1;->this$0:Lcom/leanplum/messagetemplates/MessageTemplates$1;

    iget-object v0, v0, Lcom/leanplum/messagetemplates/MessageTemplates$1;->val$template:Lcom/leanplum/messagetemplates/MessageTemplate;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/MessageTemplates$1$1;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-interface {v0, p0}, Lcom/leanplum/messagetemplates/MessageTemplate;->handleAction(Lcom/leanplum/ActionContext;)V

    return-void
.end method
