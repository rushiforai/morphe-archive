.class Lcom/leanplum/messagetemplates/MessageTemplates$1;
.super Lcom/leanplum/callbacks/ActionCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/MessageTemplates;->createCallback(Lcom/leanplum/messagetemplates/MessageTemplate;)Lcom/leanplum/callbacks/ActionCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$template:Lcom/leanplum/messagetemplates/MessageTemplate;


# direct methods
.method public constructor <init>(Lcom/leanplum/messagetemplates/MessageTemplate;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/messagetemplates/MessageTemplates$1;->val$template:Lcom/leanplum/messagetemplates/MessageTemplate;

    invoke-direct {p0}, Lcom/leanplum/callbacks/ActionCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Lcom/leanplum/ActionContext;)Z
    .registers 3

    new-instance v0, Lcom/leanplum/messagetemplates/MessageTemplates$1$1;

    invoke-direct {v0, p0, p1}, Lcom/leanplum/messagetemplates/MessageTemplates$1$1;-><init>(Lcom/leanplum/messagetemplates/MessageTemplates$1;Lcom/leanplum/ActionContext;)V

    invoke-static {v0}, Lcom/leanplum/LeanplumActivityHelper;->queueActionUponActive(Ljava/lang/Runnable;)V

    const/4 p0, 0x1

    return p0
.end method
