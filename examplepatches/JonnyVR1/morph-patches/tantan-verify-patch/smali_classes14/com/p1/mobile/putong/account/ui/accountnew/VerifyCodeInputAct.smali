.class public Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;
.super Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP<",
        "Ll/v6l0;",
        "Lcom/p1/mobile/putong/account/ui/accountnew/a;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/v6l0;

.field public d:Lcom/p1/mobile/putong/account/ui/accountnew/a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static Z1(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "REASON"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "COUNTRY_CODE"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "PHONE_NUMBER"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p0, "PASSWORD"

    .line 24
    .line 25
    const-string p1, ""

    .line 26
    .line 27
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const-string p0, "IS_NEW_DEVICE"

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    return-object v0
.end method

.method public static a2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->c2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;Z)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static b2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "REASON"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "COUNTRY_CODE"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "PHONE_NUMBER"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p0, "PASSWORD"

    .line 24
    .line 25
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    const-string p0, "IS_NEW_DEVICE"

    .line 29
    .line 30
    invoke-virtual {v0, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method public static c2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;Z)Landroid/content/Intent;
    .locals 6

    .line 1
    const-string v4, ""

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move v2, p2

    .line 6
    move-object v3, p3

    .line 7
    move v5, p4

    .line 8
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->b2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method


# virtual methods
.method public d2()Ll/v6l0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->c:Ll/v6l0;

    .line 2
    .line 3
    return-object p0
.end method

.method public e2()Lcom/p1/mobile/putong/account/ui/accountnew/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->d:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public finish()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic generateSignInPresenter()Ll/ibf0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->d2()Ll/v6l0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic generateSignInViewModel()Ll/jbf0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->e2()Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->d:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->d:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 7
    .line 8
    new-instance v0, Ll/v6l0;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/v6l0;-><init>(Ll/ner;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->c:Ll/v6l0;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->d:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    invoke-super {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->initDataOnCreate()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->c:Ll/v6l0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/v6l0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->c:Ll/v6l0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/v6l0;->P1()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->c:Ll/v6l0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/v6l0;->Q1(Landroid/view/Menu;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->checkOptionsItemSelectSpeedOk()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->c:Ll/v6l0;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ll/v6l0;->R1(Landroid/view/MenuItem;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Act;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public onRestart()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->d:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->setText(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->c:Ll/v6l0;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/v6l0;->U1(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onStartLifecycle()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->c:Ll/v6l0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/v6l0;->S1(Ll/l4g0;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->onStartLifecycle()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->c:Ll/v6l0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/v6l0;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 13

    .line 1
    new-instance v5, Lcom/p1/mobile/putong/data/VerifyData;

    .line 2
    .line 3
    invoke-direct {v5}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "REASON"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/data/VerifyReason;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const-string v3, "COUNTRY_CODE"

    .line 23
    .line 24
    const/4 v7, 0x0

    .line 25
    invoke-virtual {v2, v3, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    const-string v6, "PHONE_NUMBER"

    .line 34
    .line 35
    invoke-virtual {v4, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    move-result-object v8

    .line 43
    const-string v9, "PASSWORD"

    .line 44
    .line 45
    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v8

    .line 49
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    move-result-object v10

    .line 53
    const-string v11, "IS_NEW_DEVICE"

    .line 54
    .line 55
    invoke-virtual {v10, v11, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 56
    .line 57
    .line 58
    move-result v10

    .line 59
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v12

    .line 63
    if-eqz v12, :cond_0

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lcom/p1/mobile/putong/data/VerifyReason;

    .line 70
    .line 71
    invoke-virtual {p1, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    const-string v1, ""

    .line 76
    .line 77
    invoke-virtual {p1, v6, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {p1, v9, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    invoke-virtual {p1, v11}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v10

    .line 89
    :cond_0
    move-object v1, v0

    .line 90
    move-object v3, v4

    .line 91
    move-object v4, v8

    .line 92
    move v6, v10

    .line 93
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iput-object v0, v5, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 98
    .line 99
    iput v2, v5, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 100
    .line 101
    iput-object v3, v5, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 102
    .line 103
    iput-object v1, v5, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 104
    .line 105
    const/4 v0, 0x4

    .line 106
    iput v0, v5, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 107
    .line 108
    const-string v8, "ban-appeal"

    .line 109
    .line 110
    invoke-static {v1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_1

    .line 115
    .line 116
    const-string v0, "100032"

    .line 117
    .line 118
    iput-object v0, v5, Lcom/p1/mobile/putong/data/VerifyData;->clientId:Ljava/lang/String;

    .line 119
    .line 120
    const-string v0, "Text"

    .line 121
    .line 122
    iput-object v0, v5, Lcom/p1/mobile/putong/data/VerifyData;->category:Ljava/lang/String;

    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->d:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 125
    .line 126
    const/4 v9, 0x1

    .line 127
    invoke-virtual {v0, v9}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->h0(Z)V

    .line 128
    .line 129
    .line 130
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->c:Ll/v6l0;

    .line 131
    .line 132
    invoke-virtual/range {v0 .. v6}, Ll/v6l0;->r1(Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerifyData;Z)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->d:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 136
    .line 137
    invoke-virtual {v0, v3, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->f0(Ljava/lang/String;Lcom/p1/mobile/putong/data/VerifyReason;)V

    .line 138
    .line 139
    .line 140
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->preCreateView(Landroid/os/Bundle;)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->d:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 144
    .line 145
    invoke-virtual {p1, v1, v6}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->j0(Lcom/p1/mobile/putong/data/VerifyReason;Z)V

    .line 146
    .line 147
    .line 148
    invoke-static {v1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-eqz p1, :cond_2

    .line 153
    .line 154
    invoke-virtual {p0, v7}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 155
    .line 156
    .line 157
    :cond_2
    return-void
.end method
