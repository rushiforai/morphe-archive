.class public Lcom/tencent/could/huiyansdk/fragments/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/fragments/b;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/b;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "AuthingFragment"

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v0, :cond_4

    .line 11
    .line 12
    new-instance v3, Lcom/tencent/could/huiyansdk/view/c;

    .line 13
    .line 14
    new-instance v4, Lcom/tencent/could/huiyansdk/fragments/b$a;

    .line 15
    .line 16
    invoke-direct {v4, p0}, Lcom/tencent/could/huiyansdk/fragments/b$a;-><init>(Lcom/tencent/could/huiyansdk/fragments/b;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {v3, v0, v4}, Lcom/tencent/could/huiyansdk/view/c;-><init>(Landroid/content/Context;Lcom/tencent/could/huiyansdk/view/c$d;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3, v0}, Lcom/tencent/could/huiyansdk/view/c;->a(Landroid/content/Context;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 29
    .line 30
    const-string v0, "OcrConfirmDialog"

    .line 31
    .line 32
    const-string v4, "checkIsConfirmed success!"

    .line 33
    .line 34
    invoke-virtual {p0, v2, v0, v4}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3}, Landroid/app/Dialog;->isShowing()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-virtual {v3}, Landroid/app/Dialog;->dismiss()V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object v0, v3, Lcom/tencent/could/huiyansdk/view/c;->a:Lcom/tencent/could/huiyansdk/view/c$d;

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    check-cast v0, Lcom/tencent/could/huiyansdk/fragments/b$a;

    .line 51
    .line 52
    const-string v3, "Have Confirm info!"

    .line 53
    .line 54
    invoke-virtual {p0, v2, v1, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, v0, Lcom/tencent/could/huiyansdk/fragments/b$a;->a:Lcom/tencent/could/huiyansdk/fragments/b;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/b;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->l()V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void

    .line 65
    :cond_2
    sget-object p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 66
    .line 67
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 68
    .line 69
    if-eqz v4, :cond_3

    .line 70
    .line 71
    const-string v5, "ShowPrivacyDialog"

    .line 72
    .line 73
    const/4 v6, 0x1

    .line 74
    const-wide/16 v7, 0x1

    .line 75
    .line 76
    const-string v9, ""

    .line 77
    .line 78
    invoke-interface/range {v4 .. v9}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->updateOperateInfo(Ljava/lang/String;IJLjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    invoke-virtual {v3}, Landroid/app/Dialog;->show()V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_4
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 86
    .line 87
    const-string v3, "activity is null!"

    .line 88
    .line 89
    invoke-virtual {v0, v2, v1, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/b;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->l()V

    .line 95
    .line 96
    .line 97
    return-void
.end method
