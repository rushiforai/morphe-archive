.class Lcom/leanplum/messagetemplates/OperaSheet$2;
.super Lcom/leanplum/callbacks/ActionCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/OperaSheet;->register(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$currentContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/messagetemplates/OperaSheet$2;->val$currentContext:Landroid/content/Context;

    invoke-direct {p0}, Lcom/leanplum/callbacks/ActionCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Lcom/leanplum/ActionContext;)Z
    .registers 4
    .param p1    # Lcom/leanplum/ActionContext;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lcom/leanplum/messagetemplates/OperaSheet$2$1;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheet$2;->val$currentContext:Landroid/content/Context;

    invoke-direct {v0, p0, v1, p1}, Lcom/leanplum/messagetemplates/OperaSheet$2$1;-><init>(Lcom/leanplum/messagetemplates/OperaSheet$2;Landroid/content/Context;Lcom/leanplum/ActionContext;)V

    invoke-static {v0}, Lcom/leanplum/Leanplum;->addOnceVariablesChangedAndNoDownloadsPendingHandler(Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    const/4 p0, 0x1

    return p0
.end method
