.class Lcom/leanplum/messagetemplates/OperaConfirm$1;
.super Lnz0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/OperaConfirm;->createDialogRequest(Lcom/leanplum/ActionContext;Lorm;)Lb87;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$actionContext:Lcom/leanplum/ActionContext;

.field final synthetic val$usageReporter:Lorm;


# direct methods
.method public constructor <init>(ZLcom/leanplum/ActionContext;Lorm;)V
    .registers 4

    iput-object p2, p0, Lcom/leanplum/messagetemplates/OperaConfirm$1;->val$actionContext:Lcom/leanplum/ActionContext;

    iput-object p3, p0, Lcom/leanplum/messagetemplates/OperaConfirm$1;->val$usageReporter:Lorm;

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lnz0;-><init>(ZZ)V

    return-void
.end method

.method private logInteraction(Lvb0;)V
    .registers 10
    .param p1    # Lvb0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaConfirm$1;->val$usageReporter:Lorm;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaConfirm$1;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-virtual {p0}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object v7

    move-object v1, v0

    check-cast v1, Lx5f;

    sget-object v2, Lgg0;->c:Lgg0;

    const-wide/16 v4, 0x2

    sget-object v6, Ldg0;->b:Ldg0;

    move-object v3, p1

    invoke-virtual/range {v1 .. v7}, Lx5f;->Y(Lgg0;Lvb0;JLdg0;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic getDefaultPriority()Lijm;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object p0, Lijm;->b:Lijm;

    return-object p0
.end method

.method public getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaConfirm$1;->val$actionContext:Lcom/leanplum/ActionContext;

    const-string p1, "Cancel text"

    invoke-virtual {p0, p1}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaConfirm$1;->val$actionContext:Lcom/leanplum/ActionContext;

    const-string p1, "Accept text"

    invoke-virtual {p0, p1}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public isAllowed(Lb2l;)Z
    .registers 2
    .param p1    # Lb2l;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p1, :cond_e

    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x0

    return p0

    :cond_e
    const/4 p0, 0x1

    return p0
.end method

.method public onCreateDialog(Laz0;)V
    .registers 4
    .param p1    # Laz0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaConfirm$1;->val$actionContext:Lcom/leanplum/ActionContext;

    const-string v1, "Title"

    invoke-virtual {v0, v1}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Laz0;->setTitle(Ljava/lang/CharSequence;)Laz0;

    move-result-object p1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaConfirm$1;->val$actionContext:Lcom/leanplum/ActionContext;

    const-string v0, "Message"

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Laz0;->a:Lwy0;

    iput-object p0, p1, Lwy0;->f:Ljava/lang/CharSequence;

    const/4 p0, 0x1

    iput-boolean p0, p1, Lwy0;->k:Z

    return-void
.end method

.method public onDismissDialog(Lbz0;Lhjm;)V
    .registers 3
    .param p1    # Lbz0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lhjm;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object p1, Lhjm;->b:Lhjm;

    if-ne p2, p1, :cond_9

    sget-object p1, Lvb0;->d:Lvb0;

    invoke-direct {p0, p1}, Lcom/leanplum/messagetemplates/OperaConfirm$1;->logInteraction(Lvb0;)V

    :cond_9
    return-void
.end method

.method public onNegativeButtonClicked(Lbz0;)V
    .registers 2
    .param p1    # Lbz0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object p1, Lvb0;->c:Lvb0;

    invoke-direct {p0, p1}, Lcom/leanplum/messagetemplates/OperaConfirm$1;->logInteraction(Lvb0;)V

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaConfirm$1;->val$actionContext:Lcom/leanplum/ActionContext;

    const-string p1, "Cancel action"

    invoke-virtual {p0, p1}, Lcom/leanplum/ActionContext;->runActionNamed(Ljava/lang/String;)V

    return-void
.end method

.method public onPositiveButtonClicked(Lbz0;)V
    .registers 2
    .param p1    # Lbz0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object p1, Lvb0;->b:Lvb0;

    invoke-direct {p0, p1}, Lcom/leanplum/messagetemplates/OperaConfirm$1;->logInteraction(Lvb0;)V

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaConfirm$1;->val$actionContext:Lcom/leanplum/ActionContext;

    const-string p1, "Accept action"

    invoke-virtual {p0, p1}, Lcom/leanplum/ActionContext;->runTrackedActionNamed(Ljava/lang/String;)V

    return-void
.end method
