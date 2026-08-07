.class public Lcom/tencent/could/huiyansdk/fragments/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/huiyansdk/permission/a;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/fragments/a;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "AuthCheckStage"

    .line 8
    .line 9
    const-string v2, "OpenCheckPageError"

    .line 10
    .line 11
    const-string v3, ""

    .line 12
    .line 13
    invoke-interface {v0, v1, v2, v3}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 17
    .line 18
    const-string v1, "permission forbid!"

    .line 19
    .line 20
    const/4 v2, 0x2

    .line 21
    const-string v3, "AuthingFragment"

    .line 22
    .line 23
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sget-object v0, Lcom/tencent/could/huiyansdk/permission/c$a;->a:Lcom/tencent/could/huiyansdk/permission/c;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/permission/c;->b()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/a;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 32
    .line 33
    sget v0, Lcom/tencent/could/huiyansdk/R$string;->txy_permission_loss_check_error:I

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getResString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const/16 v0, 0xe0

    .line 40
    .line 41
    invoke-static {v0, p0}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->sendErrorAndExitAuth(ILjava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public b()V
    .locals 5

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const-string v2, "AuthCheckStage"

    .line 8
    .line 9
    const-string v3, "EnterAuthCheckPage"

    .line 10
    .line 11
    const-string v4, ""

    .line 12
    .line 13
    invoke-interface {v1, v2, v3, v4}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object v1, Lcom/tencent/could/huiyansdk/permission/c$a;->a:Lcom/tencent/could/huiyansdk/permission/c;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/permission/c;->b()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isShowPrivacyPolicyDialog()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/a;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-static {v0, v1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Z)Z

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/a;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 40
    .line 41
    new-instance v0, Lcom/tencent/could/huiyansdk/fragments/b;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Lcom/tencent/could/huiyansdk/fragments/b;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/a;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->l()V

    .line 53
    .line 54
    .line 55
    return-void
.end method
