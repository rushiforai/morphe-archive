.class public Ll/zn;
.super Ll/w1e;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/w1e;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Ll/pej0;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic B(Lv/VText;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C(Ll/x20;Lcom/p1/mobile/putong/data/MobileRespInfo;)V
    .locals 0

    .line 1
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "\u624b\u673a\u7ed1\u5b9a\u5931\u8d25"

    .line 6
    .line 7
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic D(Lv/VEditText;Lv/VText;Lcom/p1/mobile/android/app/Act;Lv/VEditText;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/view/View;->setClickable(Z)V

    .line 9
    .line 10
    .line 11
    sget p0, Lcom/p1/mobile/putong/account/R$string;->A3:I

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 14
    .line 15
    .line 16
    const-string p0, "bind_phone_obs"

    .line 17
    .line 18
    const/16 p4, 0x3c

    .line 19
    .line 20
    invoke-static {p0, p4}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p2, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance p4, Ll/nn;

    .line 29
    .line 30
    invoke-direct {p4, p1, p2}, Ll/nn;-><init>(Lv/VText;Lcom/p1/mobile/android/app/Act;)V

    .line 31
    .line 32
    .line 33
    new-instance p2, Ll/on;

    .line 34
    .line 35
    invoke-direct {p2}, Ll/on;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/qn;

    .line 39
    .line 40
    invoke-direct {v0, p1, p3}, Ll/qn;-><init>(Lv/VText;Lv/VEditText;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p4, p2, v0}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/android/app/Act;Lv/VText;Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p2, Ll/fn;

    .line 2
    .line 3
    invoke-direct {p2, p1}, Ll/fn;-><init>(Lv/VText;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p2}, Ll/zn;->M(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic F(Lv/VText;Lv/VEditText;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 3
    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/account/R$string;->r3:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {p0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-static {p0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-static {p0, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/data/MobileRespInfo;)Lrx/c;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->token:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->accessCode:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->openId:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/account/api/a;->Q1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic H(Lv/VEditText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;Lv/VText;Ll/pej0;Ll/x20;Ll/x20;Lv/VButton;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p8, "e_force_bindphone_unidentified_confirm"

    .line 2
    .line 3
    const-string v0, "p_force_bindphone_unidentified_popup"

    .line 4
    .line 5
    invoke-static {p8, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 9
    .line 10
    .line 11
    move-result-object p8

    .line 12
    invoke-static {p8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p8

    .line 16
    if-eqz p8, :cond_0

    .line 17
    .line 18
    const-string p0, "\u8bf7\u8f93\u5165\u624b\u673a\u53f7"

    .line 19
    .line 20
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 25
    .line 26
    .line 27
    move-result-object p8

    .line 28
    invoke-static {p8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p8

    .line 32
    if-eqz p8, :cond_1

    .line 33
    .line 34
    const-string p0, "\u8bf7\u8f93\u5165\u77ed\u4fe1\u9a8c\u8bc1\u7801"

    .line 35
    .line 36
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    sget p8, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 41
    .line 42
    invoke-virtual {p2, p8}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 43
    .line 44
    .line 45
    new-instance p8, Lcom/p1/mobile/putong/data/VerifyData;

    .line 46
    .line 47
    invoke-direct {p8}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {p1}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iput p1, p8, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 55
    .line 56
    const-string p1, "bind_mobile"

    .line 57
    .line 58
    invoke-static {p1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p8, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 63
    .line 64
    const/4 v0, 0x6

    .line 65
    iput v0, p8, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 66
    .line 67
    invoke-static {p3}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput v0, p8, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 72
    .line 73
    invoke-static {p0}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p8, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {p1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p8, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 84
    .line 85
    invoke-static {p3}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    iput p1, p8, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 90
    .line 91
    invoke-static {p0}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    iput-object p0, p8, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 96
    .line 97
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 98
    .line 99
    invoke-virtual {p0, p8}, Lcom/p1/mobile/putong/account/api/a;->B2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    new-instance p1, Ll/cn;

    .line 104
    .line 105
    invoke-direct {p1, p2, p4, p5}, Ll/cn;-><init>(Lcom/p1/mobile/android/app/Act;Ll/pej0;Ll/x20;)V

    .line 106
    .line 107
    .line 108
    new-instance p3, Ll/dn;

    .line 109
    .line 110
    invoke-direct {p3, p2, p6, p7}, Ll/dn;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Lv/VButton;)V

    .line 111
    .line 112
    .line 113
    const/4 p2, 0x0

    .line 114
    invoke-static {p1, p3, p2}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/data/MobileRespInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic J(Ll/y20;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    const/4 p1, -0x1

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    const-string p1, "ccode"

    .line 5
    .line 6
    invoke-virtual {p3, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    const/16 p2, 0x56

    .line 13
    .line 14
    invoke-virtual {p3, p1, p2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    new-instance p2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string p3, "+"

    .line 21
    .line 22
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public static synthetic K(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pej0;Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p4, "e_force_bindphone_identified_confirm"

    .line 2
    .line 3
    const-string v0, "p_force_bindphone_identified_popup"

    .line 4
    .line 5
    invoke-static {p4, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 9
    .line 10
    .line 11
    move-result-object p4

    .line 12
    const/16 v0, 0x1388

    .line 13
    .line 14
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->h(I)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p4

    .line 18
    new-instance v0, Ll/gn;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/gn;-><init>(Ll/x20;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p4, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    new-instance v0, Ll/hn;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/hn;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p4, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p4

    .line 36
    new-instance v0, Ll/in;

    .line 37
    .line 38
    invoke-direct {v0}, Ll/in;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p4, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p4

    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-virtual {p0, p4, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p4

    .line 50
    new-instance v0, Ll/jn;

    .line 51
    .line 52
    invoke-direct {v0, p2, p3}, Ll/jn;-><init>(Ll/pej0;Ll/x20;)V

    .line 53
    .line 54
    .line 55
    new-instance p3, Ll/kn;

    .line 56
    .line 57
    invoke-direct {p3, p1, p0}, Ll/kn;-><init>(Ll/x20;Lcom/p1/mobile/android/app/Act;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p4, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2}, Ll/pej0;->dismiss()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/android/app/Act;Ll/pej0;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    const-string p0, "bind_phone_obs"

    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Ll/zn;->N(Ll/pej0;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ll/pej0;->dismiss()V

    .line 13
    .line 14
    .line 15
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-interface {p2}, Ll/x20;->call()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static M(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;->Z1(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/rn;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ll/rn;-><init>(Ll/y20;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private static N(Ll/pej0;)V
    .locals 3
    .param p0    # Ll/pej0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, "input_method"

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    const/4 v1, 0x2

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const/4 v2, 0x0

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void

    .line 68
    :catch_0
    move-exception p0

    .line 69
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public static varargs O(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;
    .locals 7

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    array-length v2, p2

    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    aget-object v2, p2, v1

    .line 11
    .line 12
    add-int/lit8 v3, v1, 0x1

    .line 13
    .line 14
    aget-object v3, p2, v3

    .line 15
    .line 16
    new-instance v4, Ll/zn$g;

    .line 17
    .line 18
    invoke-direct {v4, p0, v2, v3}, Ll/zn$g;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    add-int/2addr v5, v6

    .line 34
    const/16 v6, 0x21

    .line 35
    .line 36
    invoke-virtual {v0, v4, v3, v5, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 37
    .line 38
    .line 39
    new-instance v3, Landroid/text/style/StyleSpan;

    .line 40
    .line 41
    const/4 v4, 0x1

    .line 42
    invoke-direct {v3, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    add-int/2addr v5, v2

    .line 58
    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 59
    .line 60
    .line 61
    add-int/lit8 v1, v1, 0x2

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    return-object v0
.end method

.method public static P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;
    .locals 22

    .line 1
    move-object/from16 v3, p0

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "p_force_bindphone_unidentified_popup"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "signup_way"

    .line 16
    .line 17
    move-object/from16 v2, p1

    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "verified"

    .line 24
    .line 25
    move-object/from16 v4, p2

    .line 26
    .line 27
    invoke-static {v4, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    const-string v9, ""

    .line 32
    .line 33
    if-eqz v4, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move-object v2, v9

    .line 37
    :goto_0
    const-string v4, "page_display_fromwhich"

    .line 38
    .line 39
    invoke-static {v4, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 51
    .line 52
    .line 53
    new-instance v5, Ll/pej0;

    .line 54
    .line 55
    invoke-direct {v5, v3}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 56
    .line 57
    .line 58
    const/4 v10, 0x0

    .line 59
    invoke-virtual {v5, v10}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v5, v10}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 63
    .line 64
    .line 65
    sget v1, Ll/hec0;->a:I

    .line 66
    .line 67
    invoke-virtual {v5, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 68
    .line 69
    .line 70
    const-string v11, "bind_phone_obs"

    .line 71
    .line 72
    invoke-static {v11}, Ll/l51;->K(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v5}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_1

    .line 84
    .line 85
    const v2, 0x1020002

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    sget v4, Ll/wcc0;->o:I

    .line 93
    .line 94
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    check-cast v2, Landroid/widget/FrameLayout;

    .line 99
    .line 100
    sget v4, Ll/bbc0;->a0:I

    .line 101
    .line 102
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 103
    .line 104
    .line 105
    :cond_1
    new-instance v2, Ll/un;

    .line 106
    .line 107
    invoke-direct {v2, v1}, Ll/un;-><init>(Landroid/view/Window;)V

    .line 108
    .line 109
    .line 110
    invoke-static {v2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 111
    .line 112
    .line 113
    sget v1, Ll/wcc0;->g:I

    .line 114
    .line 115
    invoke-virtual {v5, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    move-object v2, v1

    .line 120
    check-cast v2, Lv/VText;

    .line 121
    .line 122
    sget v1, Ll/wcc0;->j0:I

    .line 123
    .line 124
    invoke-virtual {v5, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    check-cast v1, Lv/VEditText;

    .line 129
    .line 130
    sget v4, Ll/wcc0;->i:I

    .line 131
    .line 132
    invoke-virtual {v5, v4}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    check-cast v4, Lv/VEditText;

    .line 137
    .line 138
    sget v6, Ll/wcc0;->t:I

    .line 139
    .line 140
    invoke-virtual {v5, v6}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object v6

    .line 144
    move-object v12, v6

    .line 145
    check-cast v12, Lv/VText;

    .line 146
    .line 147
    sget v6, Ll/wcc0;->z:I

    .line 148
    .line 149
    invoke-virtual {v5, v6}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v6

    .line 153
    check-cast v6, Lv/VText;

    .line 154
    .line 155
    const/4 v7, 0x3

    .line 156
    invoke-static {v7}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 157
    .line 158
    .line 159
    move-result-object v8

    .line 160
    const/4 v13, 0x1

    .line 161
    invoke-virtual {v6, v8, v13}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 162
    .line 163
    .line 164
    new-instance v14, Ll/vn;

    .line 165
    .line 166
    invoke-direct {v14, v3, v1}, Ll/vn;-><init>(Lcom/p1/mobile/android/app/Act;Lv/VEditText;)V

    .line 167
    .line 168
    .line 169
    sget v6, Ll/wcc0;->a:I

    .line 170
    .line 171
    invoke-virtual {v5, v6}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v6

    .line 175
    move-object v8, v6

    .line 176
    check-cast v8, Lv/VButton;

    .line 177
    .line 178
    sget v6, Ll/bbc0;->t1:I

    .line 179
    .line 180
    invoke-virtual {v8, v6}, Landroid/view/View;->setBackgroundResource(I)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v1}, Lv/VEditText;->h()Lrx/c;

    .line 184
    .line 185
    .line 186
    move-result-object v6

    .line 187
    new-instance v15, Ll/wn;

    .line 188
    .line 189
    invoke-direct {v15, v1, v12, v8, v4}, Ll/wn;-><init>(Lv/VEditText;Lv/VText;Lv/VButton;Lv/VEditText;)V

    .line 190
    .line 191
    .line 192
    invoke-static {v15}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 193
    .line 194
    .line 195
    move-result-object v15

    .line 196
    invoke-virtual {v6, v15}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v4}, Lv/VEditText;->h()Lrx/c;

    .line 200
    .line 201
    .line 202
    move-result-object v6

    .line 203
    new-instance v15, Ll/xn;

    .line 204
    .line 205
    invoke-direct {v15, v1, v4, v8}, Ll/xn;-><init>(Lv/VEditText;Lv/VEditText;Lv/VButton;)V

    .line 206
    .line 207
    .line 208
    invoke-static {v15}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 209
    .line 210
    .line 211
    move-result-object v15

    .line 212
    invoke-virtual {v6, v15}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 213
    .line 214
    .line 215
    invoke-static {v7}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 216
    .line 217
    .line 218
    move-result-object v6

    .line 219
    invoke-virtual {v8, v6, v13}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 220
    .line 221
    .line 222
    new-instance v6, Ll/zn$a;

    .line 223
    .line 224
    invoke-direct {v6, v3, v14, v0}, Ll/zn$a;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ll/l4g0;)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {v5, v6}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 228
    .line 229
    .line 230
    new-instance v0, Ll/yn;

    .line 231
    .line 232
    move-object v6, v4

    .line 233
    move-object v4, v2

    .line 234
    move-object v2, v6

    .line 235
    move-object/from16 v7, p3

    .line 236
    .line 237
    move-object/from16 v6, p4

    .line 238
    .line 239
    invoke-direct/range {v0 .. v8}, Ll/yn;-><init>(Lv/VEditText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;Lv/VText;Ll/pej0;Ll/x20;Ll/x20;Lv/VButton;)V

    .line 240
    .line 241
    .line 242
    move-object v6, v4

    .line 243
    move-object v4, v2

    .line 244
    move-object v2, v6

    .line 245
    move-object v6, v5

    .line 246
    invoke-static {v8, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 247
    .line 248
    .line 249
    sget v0, Ll/wcc0;->h0:I

    .line 250
    .line 251
    invoke-virtual {v6, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    check-cast v0, Lv/VText;

    .line 256
    .line 257
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->d()Ll/pf60;

    .line 258
    .line 259
    .line 260
    move-result-object v5

    .line 261
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->e()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController$MobileType;

    .line 262
    .line 263
    .line 264
    move-result-object v7

    .line 265
    sget-object v8, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController$MobileType;->unknown:Lcom/p1/mobile/putong/api/mobile/ChinaMobileController$MobileType;

    .line 266
    .line 267
    if-ne v7, v8, :cond_2

    .line 268
    .line 269
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v5

    .line 273
    const-string v7, "\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 274
    .line 275
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v8

    .line 279
    const-string v15, "\u300a\u7528\u6237\u534f\u8bae\u300b"

    .line 280
    .line 281
    filled-new-array {v15, v5, v7, v8}, [Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v5

    .line 285
    const-string v7, "\u6839\u636e\u56fd\u5bb6\u5b9e\u540d\u8981\u6c42\uff0c\u9605\u8bfb\u5e76\u540c\u610f\u5b8c\u6210\u624b\u673a\u53f7\u7ed1\u5b9a\uff0c\u300a\u7528\u6237\u534f\u8bae\u300b\u3001\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 286
    .line 287
    invoke-static {v3, v7, v5}, Ll/q8g0;->B(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 288
    .line 289
    .line 290
    move-result-object v5

    .line 291
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 292
    .line 293
    .line 294
    goto :goto_1

    .line 295
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    .line 296
    .line 297
    const-string v8, "\u6839\u636e\u56fd\u5bb6\u5b9e\u540d\u8981\u6c42\uff0c\u9605\u8bfb\u5e76\u540c\u610f\u5b8c\u6210\u624b\u673a\u53f7\u7ed1\u5b9a\uff0c\u300a"

    .line 298
    .line 299
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    iget-object v8, v5, Ll/pf60;->a:Ljava/lang/Object;

    .line 303
    .line 304
    check-cast v8, Ljava/lang/String;

    .line 305
    .line 306
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    const-string v8, "\u300b\u3001\u300a\u7528\u6237\u534f\u8bae\u300b\u3001\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 310
    .line 311
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v7

    .line 318
    new-instance v8, Ljava/lang/StringBuilder;

    .line 319
    .line 320
    const-string v15, "\u300a"

    .line 321
    .line 322
    invoke-direct {v8, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 323
    .line 324
    .line 325
    iget-object v15, v5, Ll/pf60;->a:Ljava/lang/Object;

    .line 326
    .line 327
    check-cast v15, Ljava/lang/String;

    .line 328
    .line 329
    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    const-string v15, "\u300b"

    .line 333
    .line 334
    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 335
    .line 336
    .line 337
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v16

    .line 341
    iget-object v5, v5, Ll/pf60;->b:Ljava/lang/Object;

    .line 342
    .line 343
    move-object/from16 v17, v5

    .line 344
    .line 345
    check-cast v17, Ljava/lang/String;

    .line 346
    .line 347
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object v19

    .line 351
    const-string v20, "\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 352
    .line 353
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v21

    .line 357
    const-string v18, "\u300a\u7528\u6237\u534f\u8bae\u300b"

    .line 358
    .line 359
    filled-new-array/range {v16 .. v21}, [Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v5

    .line 363
    invoke-static {v3, v7, v5}, Ll/q8g0;->B(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 364
    .line 365
    .line 366
    move-result-object v5

    .line 367
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 368
    .line 369
    .line 370
    :goto_1
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 371
    .line 372
    .line 373
    move-result-object v5

    .line 374
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 375
    .line 376
    .line 377
    sget v0, Ll/wcc0;->w:I

    .line 378
    .line 379
    invoke-virtual {v6, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 380
    .line 381
    .line 382
    move-result-object v0

    .line 383
    check-cast v0, Lv/VImage;

    .line 384
    .line 385
    new-instance v5, Ll/um;

    .line 386
    .line 387
    move-object/from16 v7, p5

    .line 388
    .line 389
    invoke-direct {v5, v3, v7, v6}, Ll/um;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pej0;)V

    .line 390
    .line 391
    .line 392
    invoke-static {v0, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 393
    .line 394
    .line 395
    new-instance v0, Ljava/lang/StringBuilder;

    .line 396
    .line 397
    invoke-direct {v0, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 398
    .line 399
    .line 400
    sget-object v5, Ll/nsb;->d:Ljava/util/ArrayList;

    .line 401
    .line 402
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 403
    .line 404
    .line 405
    move-result-object v5

    .line 406
    check-cast v5, Ll/nsb;

    .line 407
    .line 408
    iget v5, v5, Ll/nsb;->b:I

    .line 409
    .line 410
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 411
    .line 412
    .line 413
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object v0

    .line 417
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 418
    .line 419
    .line 420
    new-instance v0, Ll/vm;

    .line 421
    .line 422
    invoke-direct {v0, v3, v2}, Ll/vm;-><init>(Lcom/p1/mobile/android/app/Act;Lv/VText;)V

    .line 423
    .line 424
    .line 425
    invoke-static {v2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 426
    .line 427
    .line 428
    new-instance v0, Ll/wm;

    .line 429
    .line 430
    move-object v5, v3

    .line 431
    move-object v3, v12

    .line 432
    invoke-direct/range {v0 .. v5}, Ll/wm;-><init>(Lv/VEditText;Lv/VText;Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;)V

    .line 433
    .line 434
    .line 435
    move-object v2, v0

    .line 436
    move-object v0, v3

    .line 437
    move-object v3, v5

    .line 438
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 439
    .line 440
    .line 441
    new-instance v2, Ll/xm;

    .line 442
    .line 443
    invoke-direct {v2, v1, v3, v14}, Ll/xm;-><init>(Lv/VEditText;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 444
    .line 445
    .line 446
    invoke-virtual {v6, v2}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 447
    .line 448
    .line 449
    invoke-static {v11}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 450
    .line 451
    .line 452
    move-result v2

    .line 453
    if-nez v2, :cond_4

    .line 454
    .line 455
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 456
    .line 457
    .line 458
    move-result-object v1

    .line 459
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 460
    .line 461
    .line 462
    move-result v1

    .line 463
    if-lez v1, :cond_3

    .line 464
    .line 465
    move v10, v13

    .line 466
    :cond_3
    invoke-static {v0, v10}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 467
    .line 468
    .line 469
    :cond_4
    invoke-virtual {v6}, Landroid/app/Dialog;->show()V

    .line 470
    .line 471
    .line 472
    return-object v6
.end method

.method public static Q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;
    .locals 7

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_force_bindphone_identified_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "signup_way"

    .line 14
    .line 15
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {p1}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 27
    .line 28
    .line 29
    new-instance p1, Ll/pej0;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {p1, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 36
    .line 37
    .line 38
    sget v2, Ll/hec0;->b:I

    .line 39
    .line 40
    invoke-virtual {p1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 44
    .line 45
    .line 46
    new-instance v1, Ll/zn$h;

    .line 47
    .line 48
    invoke-direct {v1, v0}, Ll/zn$h;-><init>(Ll/l4g0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_0

    .line 63
    .line 64
    const v1, 0x1020002

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    sget v2, Ll/wcc0;->o:I

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Landroid/widget/FrameLayout;

    .line 78
    .line 79
    sget v2, Ll/bbc0;->a0:I

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 82
    .line 83
    .line 84
    :cond_0
    new-instance v1, Ll/ym;

    .line 85
    .line 86
    invoke-direct {v1, v0}, Ll/ym;-><init>(Landroid/view/Window;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 90
    .line 91
    .line 92
    sget v0, Ll/wcc0;->z:I

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Lv/VText;

    .line 99
    .line 100
    const/4 v1, 0x3

    .line 101
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    const/4 v3, 0x1

    .line 106
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 107
    .line 108
    .line 109
    sget v0, Ll/wcc0;->y:I

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lv/VText;

    .line 116
    .line 117
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 122
    .line 123
    .line 124
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-nez v2, :cond_1

    .line 129
    .line 130
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    :cond_1
    sget p2, Ll/wcc0;->x:I

    .line 134
    .line 135
    invoke-virtual {p1, p2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    check-cast p2, Lv/VText;

    .line 140
    .line 141
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {p2, v0, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 146
    .line 147
    .line 148
    new-instance v0, Ll/zm;

    .line 149
    .line 150
    invoke-direct {v0, p6, p1}, Ll/zm;-><init>(Ll/x20;Ll/pej0;)V

    .line 151
    .line 152
    .line 153
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    sget p2, Ll/wcc0;->a:I

    .line 157
    .line 158
    invoke-virtual {p1, p2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    check-cast p2, Lv/VButton;

    .line 163
    .line 164
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 165
    .line 166
    .line 167
    move-result-object p6

    .line 168
    invoke-virtual {p2, p6, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 169
    .line 170
    .line 171
    new-instance p6, Ll/an;

    .line 172
    .line 173
    invoke-direct {p6, p0, p5, p1, p4}, Ll/an;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pej0;Ll/x20;)V

    .line 174
    .line 175
    .line 176
    invoke-static {p2, p6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 177
    .line 178
    .line 179
    sget p2, Ll/wcc0;->h0:I

    .line 180
    .line 181
    invoke-virtual {p1, p2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    check-cast p2, Lv/VText;

    .line 186
    .line 187
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->d()Ll/pf60;

    .line 188
    .line 189
    .line 190
    move-result-object p4

    .line 191
    new-instance p5, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    const-string p6, "\u6839\u636e\u56fd\u5bb6\u5b9e\u540d\u8981\u6c42\uff0c\u9605\u8bfb\u5e76\u540c\u610f\u5b8c\u6210\u624b\u673a\u53f7\u7ed1\u5b9a\uff0c\u300a"

    .line 194
    .line 195
    invoke-direct {p5, p6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    iget-object p6, p4, Ll/pf60;->a:Ljava/lang/Object;

    .line 199
    .line 200
    check-cast p6, Ljava/lang/String;

    .line 201
    .line 202
    invoke-virtual {p5, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    const-string p6, "\u300b\u3001\u300a\u7528\u6237\u534f\u8bae\u300b\u3001\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 206
    .line 207
    invoke-virtual {p5, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object p5

    .line 214
    new-instance p6, Ljava/lang/StringBuilder;

    .line 215
    .line 216
    const-string v0, "\u300a"

    .line 217
    .line 218
    invoke-direct {p6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    iget-object v0, p4, Ll/pf60;->a:Ljava/lang/Object;

    .line 222
    .line 223
    check-cast v0, Ljava/lang/String;

    .line 224
    .line 225
    invoke-virtual {p6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    const-string v0, "\u300b"

    .line 229
    .line 230
    invoke-virtual {p6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    iget-object p4, p4, Ll/pf60;->b:Ljava/lang/Object;

    .line 238
    .line 239
    move-object v2, p4

    .line 240
    check-cast v2, Ljava/lang/String;

    .line 241
    .line 242
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v4

    .line 246
    const-string v5, "\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 247
    .line 248
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v6

    .line 252
    const-string v3, "\u300a\u7528\u6237\u534f\u8bae\u300b"

    .line 253
    .line 254
    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p4

    .line 258
    invoke-static {p0, p5, p4}, Ll/q8g0;->B(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 263
    .line 264
    .line 265
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 270
    .line 271
    .line 272
    sget p0, Ll/wcc0;->w:I

    .line 273
    .line 274
    invoke-virtual {p1, p0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    check-cast p0, Lv/VImage;

    .line 279
    .line 280
    new-instance p2, Ll/bn;

    .line 281
    .line 282
    invoke-direct {p2, p1, p3}, Ll/bn;-><init>(Ll/pej0;Ll/x20;)V

    .line 283
    .line 284
    .line 285
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    .line 289
    .line 290
    .line 291
    return-object p1
.end method

.method public static R(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)Ll/pej0;
    .locals 5

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_login_user_agreement_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/pej0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    sget v2, Ll/hec0;->B:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 24
    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/zn$e;

    .line 31
    .line 32
    invoke-direct {v2, v0, p2}, Ll/zn$e;-><init>(Ll/l4g0;Ll/x20;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 36
    .line 37
    .line 38
    new-instance p2, Ll/zn$f;

    .line 39
    .line 40
    invoke-direct {p2}, Ll/zn$f;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, p2}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    const v0, 0x1020002

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2, v0}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    sget v2, Ll/wcc0;->o:I

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Landroid/widget/FrameLayout;

    .line 70
    .line 71
    sget v2, Ll/bbc0;->a0:I

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 74
    .line 75
    .line 76
    :cond_0
    new-instance v0, Ll/pn;

    .line 77
    .line 78
    invoke-direct {v0, p2}, Ll/pn;-><init>(Landroid/view/Window;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 82
    .line 83
    .line 84
    sget p2, Ll/wcc0;->z:I

    .line 85
    .line 86
    invoke-virtual {v1, p2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    check-cast p2, Lv/VText;

    .line 91
    .line 92
    sget v0, Ll/wcc0;->a:I

    .line 93
    .line 94
    invoke-virtual {v1, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Lv/VButton;

    .line 99
    .line 100
    new-instance v2, Ll/sn;

    .line 101
    .line 102
    invoke-direct {v2, p1, v1}, Ll/sn;-><init>(Ll/x20;Ll/pej0;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    sget p1, Ll/wcc0;->g0:I

    .line 109
    .line 110
    invoke-virtual {v1, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Lv/VText;

    .line 115
    .line 116
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->p()Z

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    const-string v3, "#66000000"

    .line 121
    .line 122
    if-eqz v2, :cond_1

    .line 123
    .line 124
    sget v2, Lcom/p1/mobile/putong/account/R$string;->a1:I

    .line 125
    .line 126
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(I)V

    .line 127
    .line 128
    .line 129
    sget p2, Lcom/p1/mobile/putong/account/R$string;->Z0:I

    .line 130
    .line 131
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(I)V

    .line 132
    .line 133
    .line 134
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 139
    .line 140
    .line 141
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result p2

    .line 145
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 146
    .line 147
    .line 148
    new-instance p2, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .line 152
    .line 153
    sget v0, Lcom/p1/mobile/putong/account/R$string;->r0:I

    .line 154
    .line 155
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    const-string v0, " "

    .line 163
    .line 164
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    sget v2, Lcom/p1/mobile/putong/account/R$string;->s0:I

    .line 168
    .line 169
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    sget v0, Lcom/p1/mobile/putong/account/R$string;->I2:I

    .line 180
    .line 181
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    sget v0, Lcom/p1/mobile/putong/account/R$string;->r0:I

    .line 193
    .line 194
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    sget v3, Lcom/p1/mobile/putong/account/R$string;->I2:I

    .line 203
    .line 204
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v4

    .line 212
    filled-new-array {v0, v2, v3, v4}, [Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-static {p0, p2, v0}, Ll/zn;->O(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 221
    .line 222
    .line 223
    goto :goto_0

    .line 224
    :cond_1
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 225
    .line 226
    .line 227
    move-result p2

    .line 228
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 229
    .line 230
    .line 231
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 232
    .line 233
    .line 234
    move-result p2

    .line 235
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 236
    .line 237
    .line 238
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 239
    .line 240
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    const-string v2, "\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 245
    .line 246
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v3

    .line 250
    const-string v4, "\u300a\u7528\u6237\u534f\u8bae\u300b"

    .line 251
    .line 252
    filled-new-array {v4, v0, v2, v3}, [Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    const-string v2, "\u300a\u7528\u6237\u534f\u8bae\u300b\u548c\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 257
    .line 258
    invoke-static {p0, p2, v2, v0}, Ll/q8g0;->A(Landroid/app/Activity;Landroid/graphics/Typeface;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 263
    .line 264
    .line 265
    :goto_0
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 270
    .line 271
    .line 272
    sget p0, Ll/wcc0;->w:I

    .line 273
    .line 274
    invoke-virtual {v1, p0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    check-cast p0, Lv/VImage;

    .line 279
    .line 280
    new-instance p1, Ll/tn;

    .line 281
    .line 282
    invoke-direct {p1, v1}, Ll/tn;-><init>(Ll/pej0;)V

    .line 283
    .line 284
    .line 285
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 289
    .line 290
    .line 291
    return-object v1
.end method

.method public static S(Lcom/p1/mobile/android/app/Act;ZZZLl/x20;Ll/x20;Ll/y20;)Ll/pej0;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "ZZZ",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ll/pej0;"
        }
    .end annotation

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_other_signin_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/pej0;

    .line 17
    .line 18
    invoke-direct {v2, p0}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    const/4 v3, 0x1

    .line 22
    invoke-virtual {v2, v3}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 23
    .line 24
    .line 25
    sget v4, Ll/hec0;->L:I

    .line 26
    .line 27
    invoke-virtual {v2, v4}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 28
    .line 29
    .line 30
    new-instance v4, Ll/zn$b;

    .line 31
    .line 32
    invoke-direct {v4}, Ll/zn$b;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v4}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    if-eqz v5, :cond_0

    .line 47
    .line 48
    const v5, 0x1020002

    .line 49
    .line 50
    .line 51
    invoke-virtual {v4, v5}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    sget v6, Ll/wcc0;->o:I

    .line 56
    .line 57
    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    check-cast v5, Landroid/widget/FrameLayout;

    .line 62
    .line 63
    sget v6, Ll/bbc0;->a0:I

    .line 64
    .line 65
    invoke-virtual {v5, v6}, Landroid/view/View;->setBackgroundResource(I)V

    .line 66
    .line 67
    .line 68
    :cond_0
    new-instance v5, Ll/tm;

    .line 69
    .line 70
    invoke-direct {v5, v4}, Ll/tm;-><init>(Landroid/view/Window;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v5}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 74
    .line 75
    .line 76
    sget v4, Ll/wcc0;->M:I

    .line 77
    .line 78
    invoke-virtual {v2, v4}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    check-cast v4, Lv/VRecyclerView;

    .line 83
    .line 84
    new-instance v5, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 85
    .line 86
    invoke-direct {v5, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 87
    .line 88
    .line 89
    const/4 v6, 0x0

    .line 90
    invoke-virtual {v5, v6}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4, v5}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 94
    .line 95
    .line 96
    new-instance v5, Ljava/util/ArrayList;

    .line 97
    .line 98
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 99
    .line 100
    .line 101
    new-instance v6, Ll/zx;

    .line 102
    .line 103
    invoke-direct {v6, p0}, Ll/zx;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 104
    .line 105
    .line 106
    const-string v7, "display_signin_way"

    .line 107
    .line 108
    const-string v8, "e_other_signin_way"

    .line 109
    .line 110
    if-eqz p2, :cond_1

    .line 111
    .line 112
    const-string v9, "wechat"

    .line 113
    .line 114
    invoke-static {v7, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object v9

    .line 118
    filled-new-array {v9}, [Ll/pf60;

    .line 119
    .line 120
    .line 121
    move-result-object v9

    .line 122
    invoke-static {v8, v1, v9}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 123
    .line 124
    .line 125
    new-instance v9, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;

    .line 126
    .line 127
    const-string v10, "\u5fae\u4fe1"

    .line 128
    .line 129
    sget v11, Ll/bbc0;->X:I

    .line 130
    .line 131
    move-object/from16 v12, p4

    .line 132
    .line 133
    invoke-direct {v9, v10, v11, v12}, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;-><init>(Ljava/lang/String;ILl/x20;)V

    .line 134
    .line 135
    .line 136
    invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    :cond_1
    if-eqz p3, :cond_2

    .line 140
    .line 141
    const-string v9, "qq"

    .line 142
    .line 143
    invoke-static {v7, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 144
    .line 145
    .line 146
    move-result-object v7

    .line 147
    filled-new-array {v7}, [Ll/pf60;

    .line 148
    .line 149
    .line 150
    move-result-object v7

    .line 151
    invoke-static {v8, v1, v7}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 152
    .line 153
    .line 154
    new-instance v1, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;

    .line 155
    .line 156
    const-string v7, "QQ"

    .line 157
    .line 158
    sget v8, Ll/bbc0;->W:I

    .line 159
    .line 160
    move-object/from16 v9, p5

    .line 161
    .line 162
    invoke-direct {v1, v7, v8, v9}, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;-><init>(Ljava/lang/String;ILl/x20;)V

    .line 163
    .line 164
    .line 165
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    :cond_2
    invoke-virtual {v4, v6}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v6, v5}, Ll/zx;->C(Ljava/util/List;)V

    .line 172
    .line 173
    .line 174
    new-instance v1, Ll/zn$c;

    .line 175
    .line 176
    invoke-direct {v1, v5}, Ll/zn$c;-><init>(Ljava/util/List;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v6, v1}, Ll/zx;->D(Ll/zx$b;)V

    .line 180
    .line 181
    .line 182
    sget v1, Ll/wcc0;->K:I

    .line 183
    .line 184
    invoke-virtual {v2, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    check-cast v1, Lv/VCheckBox;

    .line 189
    .line 190
    new-instance v4, Ll/en;

    .line 191
    .line 192
    move-object/from16 v5, p6

    .line 193
    .line 194
    invoke-direct {v4, v5, v1}, Ll/en;-><init>(Ll/y20;Lv/VCheckBox;)V

    .line 195
    .line 196
    .line 197
    invoke-static {v1, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 198
    .line 199
    .line 200
    sget v4, Ll/wcc0;->L:I

    .line 201
    .line 202
    invoke-virtual {v2, v4}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    check-cast v4, Lv/VText;

    .line 207
    .line 208
    if-eqz p1, :cond_3

    .line 209
    .line 210
    invoke-virtual {v1, v3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 211
    .line 212
    .line 213
    :cond_3
    sget p1, Lcom/p1/mobile/putong/account/R$string;->O3:I

    .line 214
    .line 215
    sget v1, Lcom/p1/mobile/putong/account/R$string;->r0:I

    .line 216
    .line 217
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    const-string v3, " %s "

    .line 226
    .line 227
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    sget v3, Lcom/p1/mobile/putong/account/R$string;->I2:I

    .line 232
    .line 233
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v3

    .line 237
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v3

    .line 241
    const-string v5, " %s"

    .line 242
    .line 243
    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v3

    .line 247
    filled-new-array {v1, v3}, [Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    invoke-virtual {p0, p1, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    sget v1, Lcom/p1/mobile/putong/account/R$string;->r0:I

    .line 256
    .line 257
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    sget v5, Lcom/p1/mobile/putong/account/R$string;->I2:I

    .line 266
    .line 267
    invoke-virtual {p0, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v5

    .line 271
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v6

    .line 275
    filled-new-array {v1, v3, v5, v6}, [Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    invoke-static {p0, p1, v1}, Ll/q8g0;->B(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    invoke-virtual {v4, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 284
    .line 285
    .line 286
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    invoke-virtual {v4, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 291
    .line 292
    .line 293
    new-instance p0, Ll/zn$d;

    .line 294
    .line 295
    invoke-direct {p0, v0}, Ll/zn$d;-><init>(Ll/l4g0;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v2, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    .line 302
    .line 303
    .line 304
    return-object v2
.end method

.method public static T(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p3}, Lcom/p1/mobile/android/app/Dialog$e;->u0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic g(Lv/VEditText;Lv/VText;Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p5, "e_force_bindphone_unidentified_getcode"

    .line 2
    .line 3
    const-string v0, "p_force_bindphone_unidentified_popup"

    .line 4
    .line 5
    invoke-static {p5, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p5

    .line 12
    invoke-static {p1}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/16 v1, 0x56

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move v0, v2

    .line 24
    :goto_0
    invoke-static {p5, v0}, Ll/e070;->n1(Ljava/lang/String;Z)Z

    .line 25
    .line 26
    .line 27
    move-result p5

    .line 28
    if-nez p5, :cond_1

    .line 29
    .line 30
    const-string p0, "\u8bf7\u8f93\u5165\u6b63\u786e\u624b\u673a\u53f7"

    .line 31
    .line 32
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    new-instance p5, Lcom/p1/mobile/putong/data/VerifyData;

    .line 37
    .line 38
    invoke-direct {p5}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p5, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 46
    .line 47
    const-string v0, "bind_mobile"

    .line 48
    .line 49
    invoke-static {v0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p5, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    iput v0, p5, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 57
    .line 58
    invoke-static {p1}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    iput p1, p5, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 63
    .line 64
    invoke-static {p0}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p5, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {p2, v2}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 74
    .line 75
    .line 76
    const-string p1, "..."

    .line 77
    .line 78
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 82
    .line 83
    invoke-virtual {p1, p5}, Lcom/p1/mobile/putong/account/api/a;->b2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    new-instance p5, Ll/ln;

    .line 88
    .line 89
    invoke-direct {p5, p3, p2, p4, p0}, Ll/ln;-><init>(Lv/VEditText;Lv/VText;Lcom/p1/mobile/android/app/Act;Lv/VEditText;)V

    .line 90
    .line 91
    .line 92
    new-instance p3, Ll/mn;

    .line 93
    .line 94
    invoke-direct {p3, p2, p0, p4}, Ll/mn;-><init>(Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p5, p3, v2}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public static synthetic h(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/yfc0;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i(Lv/VEditText;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-wide/16 v0, 0xc8

    .line 16
    .line 17
    invoke-virtual {p1, p2, v0, v1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pej0;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p3, "e_force_bindphone_unidentified_cancel"

    .line 2
    .line 3
    const-string v0, "p_force_bindphone_unidentified_popup"

    .line 4
    .line 5
    invoke-static {p3, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-static {p3}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    if-eqz p3, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-interface {p1}, Ll/x20;->call()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2}, Ll/pej0;->dismiss()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic k(Ll/pej0;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "cancel_back"

    .line 2
    .line 3
    const-string v0, "cancle"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "e_login_user_agreement_popup_cancel"

    .line 14
    .line 15
    const-string v1, "p_login_user_agreement_popup"

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic l(Ll/x20;Ll/pej0;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_force_bindphone_identified_choose_other"

    .line 2
    .line 3
    const-string v0, "p_force_bindphone_identified_popup"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ll/pej0;->dismiss()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic m(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/yfc0;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic n(Ll/x20;Ll/pej0;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const-string p2, "e_login_user_agreement_popup_confirm"

    .line 8
    .line 9
    const-string v0, "p_login_user_agreement_popup"

    .line 10
    .line 11
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p0}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ll/pej0;->dismiss()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic o(Ll/x20;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 5
    .line 6
    .line 7
    instance-of p0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    move-object p0, p2

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 13
    .line 14
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 15
    .line 16
    const p1, 0x9c4b

    .line 17
    .line 18
    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    invoke-static {p2}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic p(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/yfc0;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic q(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/android/app/Act;Ll/x20;Lv/VButton;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    instance-of p0, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 5
    .line 6
    if-eqz p0, :cond_2

    .line 7
    .line 8
    move-object p0, p3

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 12
    .line 13
    const v0, 0x9c40

    .line 14
    .line 15
    .line 16
    if-ne p0, v0, :cond_0

    .line 17
    .line 18
    invoke-static {p3}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {p0}, Ll/bsj0;->l(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    invoke-interface {p1}, Ll/x20;->call()V

    .line 29
    .line 30
    .line 31
    invoke-static {p3}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sget p0, Ll/qa00;->j:I

    .line 39
    .line 40
    invoke-static {p2, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    invoke-static {p3}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static synthetic s(Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 6
    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/account/R$string;->r3:I

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {p0, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    :goto_0
    instance-of p0, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 36
    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    move-object p1, p3

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 41
    .line 42
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 43
    .line 44
    const v0, 0x6263b

    .line 45
    .line 46
    .line 47
    if-ne p1, v0, :cond_1

    .line 48
    .line 49
    sget-object p0, Ll/olj;->INSTANCE:Ll/olj;

    .line 50
    .line 51
    invoke-virtual {p0, p2}, Ll/olj;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    if-eqz p0, :cond_4

    .line 56
    .line 57
    move-object p0, p3

    .line 58
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 59
    .line 60
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 61
    .line 62
    const p1, 0x9c40

    .line 63
    .line 64
    .line 65
    if-ne p0, p1, :cond_2

    .line 66
    .line 67
    invoke-static {p3}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    invoke-static {p0}, Ll/bsj0;->l(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    if-nez p0, :cond_3

    .line 76
    .line 77
    invoke-static {p3}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_4
    invoke-static {p3}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public static synthetic t(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/yfc0;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic u(Lv/VText;Lcom/p1/mobile/android/app/Act;Ljava/lang/Long;)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x3c

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p2, v0, v2

    .line 11
    .line 12
    if-lez p2, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v1, Lcom/p1/mobile/putong/account/R$string;->k4:I

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "%d%s"

    .line 33
    .line 34
    invoke-static {p2, v0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public static synthetic v(Ll/y20;Lv/VCheckBox;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/android/app/Act;Lv/VEditText;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic x(Lv/VEditText;Lv/VEditText;Lv/VButton;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    sget p0, Ll/bbc0;->K1:I

    .line 38
    .line 39
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    sget p0, Ll/bbc0;->t1:I

    .line 44
    .line 45
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic y(Lv/VEditText;Lv/VText;Lv/VButton;Lv/VEditText;Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    const/4 v0, 0x0

    .line 14
    if-nez p4, :cond_0

    .line 15
    .line 16
    const-string p4, "bind_phone_obs"

    .line 17
    .line 18
    invoke-static {p4}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p4

    .line 22
    if-nez p4, :cond_0

    .line 23
    .line 24
    const/4 p4, 0x1

    .line 25
    invoke-static {p1, p4}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {p1, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    :goto_0
    sget p1, Ll/qa00;->q:I

    .line 33
    .line 34
    invoke-static {p2, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 35
    .line 36
    .line 37
    const-string p1, "p_force_bindphone_unidentified_popup"

    .line 38
    .line 39
    new-array p4, v0, [Ll/pf60;

    .line 40
    .line 41
    const-string v0, "e_force_bindphone_unidentified_input"

    .line 42
    .line 43
    invoke-static {v0, p1, p4}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-nez p0, :cond_1

    .line 63
    .line 64
    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-nez p0, :cond_1

    .line 81
    .line 82
    sget p0, Ll/bbc0;->K1:I

    .line 83
    .line 84
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    sget p0, Ll/bbc0;->t1:I

    .line 89
    .line 90
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public static synthetic z(Ll/pej0;Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_force_bindphone_identified_cancel"

    .line 2
    .line 3
    const-string v0, "p_force_bindphone_identified_popup"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
