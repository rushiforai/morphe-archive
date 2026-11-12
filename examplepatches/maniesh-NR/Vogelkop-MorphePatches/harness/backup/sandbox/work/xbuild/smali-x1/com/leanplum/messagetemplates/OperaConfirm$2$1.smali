.class Lcom/leanplum/messagetemplates/OperaConfirm$2$1;
.super Lcom/leanplum/callbacks/PostponableAction;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/OperaConfirm$2;->onResponse(Lcom/leanplum/ActionContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$actionContext:Lcom/leanplum/ActionContext;


# direct methods
.method public constructor <init>(Lcom/leanplum/messagetemplates/OperaConfirm$2;Lcom/leanplum/ActionContext;)V
    .registers 3

    iput-object p2, p0, Lcom/leanplum/messagetemplates/OperaConfirm$2$1;->val$actionContext:Lcom/leanplum/ActionContext;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Lcom/leanplum/callbacks/PostponableAction;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_2d

    const-string v1, "com.opera.android.ui.DIALOG_QUEUE_SERVICE"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lz77;

    if-eqz v1, :cond_2d

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_2d

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaConfirm$2$1;->val$actionContext:Lcom/leanplum/ActionContext;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    invoke-static {p0, v0}, Lcom/leanplum/messagetemplates/OperaConfirm;->a(Lcom/leanplum/ActionContext;Lx5f;)Lb87;

    move-result-object p0

    invoke-virtual {v1, p0}, Lr22;->a(Ljjm;)V

    :cond_2d
    return-void
.end method
