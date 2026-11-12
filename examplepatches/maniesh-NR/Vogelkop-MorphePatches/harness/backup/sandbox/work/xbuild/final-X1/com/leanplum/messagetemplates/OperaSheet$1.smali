.class Lcom/leanplum/messagetemplates/OperaSheet$1;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/OperaSheet;->loadResource(Lcom/leanplum/ActionContext;Lcom/opera/api/Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/leanplum/messagetemplates/ResourceWrapper;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$actionContext:Lcom/leanplum/ActionContext;

.field final synthetic val$callback:Lcom/opera/api/Callback;

.field final synthetic val$hasLottieFile:Z


# direct methods
.method public constructor <init>(Lcom/leanplum/ActionContext;ZLcom/opera/api/Callback;)V
    .registers 4

    iput-object p1, p0, Lcom/leanplum/messagetemplates/OperaSheet$1;->val$actionContext:Lcom/leanplum/ActionContext;

    iput-boolean p2, p0, Lcom/leanplum/messagetemplates/OperaSheet$1;->val$hasLottieFile:Z

    iput-object p3, p0, Lcom/leanplum/messagetemplates/OperaSheet$1;->val$callback:Lcom/opera/api/Callback;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs doInBackground([Ljava/lang/Void;)Lcom/leanplum/messagetemplates/ResourceWrapper;
    .registers 2
    .param p1    # [Ljava/lang/Void;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p1, p0, Lcom/leanplum/messagetemplates/OperaSheet$1;->val$actionContext:Lcom/leanplum/ActionContext;

    iget-boolean p0, p0, Lcom/leanplum/messagetemplates/OperaSheet$1;->val$hasLottieFile:Z

    invoke-static {p1, p0}, Lcom/leanplum/messagetemplates/OperaSheet;->h(Lcom/leanplum/ActionContext;Z)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p1    # [Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 9
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/leanplum/messagetemplates/OperaSheet$1;->doInBackground([Ljava/lang/Void;)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    return-object p0
.end method

.method public onPostExecute(Lcom/leanplum/messagetemplates/ResourceWrapper;)V
    .registers 2
    .param p1    # Lcom/leanplum/messagetemplates/ResourceWrapper;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 6
    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheet$1;->val$callback:Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    check-cast p1, Lcom/leanplum/messagetemplates/ResourceWrapper;

    invoke-virtual {p0, p1}, Lcom/leanplum/messagetemplates/OperaSheet$1;->onPostExecute(Lcom/leanplum/messagetemplates/ResourceWrapper;)V

    return-void
.end method
