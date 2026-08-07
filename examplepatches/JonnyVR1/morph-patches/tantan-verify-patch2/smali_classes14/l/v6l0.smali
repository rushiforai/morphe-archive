.class public Ll/v6l0;
.super Ll/ibf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ibf0<",
        "Lcom/p1/mobile/putong/account/ui/accountnew/a;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Lcom/p1/mobile/putong/data/VerifyReason;

.field public f:I

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Lcom/p1/mobile/putong/data/VerifyData;

.field public j:Z

.field public k:Z

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/Runnable;

.field public o:Ll/x20;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ibf0;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/data/VerifyData;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 10
    .line 11
    new-instance p1, Ll/a6l0;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/a6l0;-><init>(Ll/v6l0;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/v6l0;->n:Ljava/lang/Runnable;

    .line 17
    .line 18
    new-instance p1, Ll/l6l0;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Ll/l6l0;-><init>(Ll/v6l0;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/v6l0;->o:Ll/x20;

    .line 24
    .line 25
    return-void
.end method

.method private synthetic C1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "e_appeal_phone_number_verification_send"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Ll/v6l0;->f:I

    .line 15
    .line 16
    const/16 v1, 0x56

    .line 17
    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    iget-boolean v0, p0, Ll/v6l0;->k:Z

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    const-string v0, "signup_signin"

    .line 25
    .line 26
    invoke-static {v0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 31
    .line 32
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e0(Lcom/p1/mobile/putong/data/VerifyReason;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->G()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 48
    .line 49
    const-string v1, "signup"

    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget-object v0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 59
    .line 60
    const-string v1, "forgot-password"

    .line 61
    .line 62
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    iget-object v0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 70
    .line 71
    const-string v1, "signin"

    .line 72
    .line 73
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    :goto_0
    iget-object v0, p0, Ll/v6l0;->l:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_3

    .line 83
    .line 84
    iget-object v0, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 85
    .line 86
    iget-object v1, p0, Ll/v6l0;->l:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->captchaToken:Ljava/lang/String;

    .line 89
    .line 90
    :cond_3
    iget-object v0, p0, Ll/v6l0;->m:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-nez v0, :cond_4

    .line 97
    .line 98
    iget-object v0, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 99
    .line 100
    iget-object v1, p0, Ll/v6l0;->m:Ljava/lang/String;

    .line 101
    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->captchaValue:Ljava/lang/String;

    .line 103
    .line 104
    :cond_4
    iget-object v0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 105
    .line 106
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 112
    .line 113
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 117
    .line 118
    iget v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 119
    .line 120
    iget-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 121
    .line 122
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 123
    .line 124
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/account/api/a;->b2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    new-instance v1, Ll/s6l0;

    .line 129
    .line 130
    invoke-direct {v1, p0}, Ll/s6l0;-><init>(Ll/v6l0;)V

    .line 131
    .line 132
    .line 133
    new-instance v2, Ll/t6l0;

    .line 134
    .line 135
    invoke-direct {v2, p0}, Ll/t6l0;-><init>(Ll/v6l0;)V

    .line 136
    .line 137
    .line 138
    const/4 p0, 0x0

    .line 139
    invoke-static {v1, v2, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public static synthetic Q0(Ll/v6l0;Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v6l0;->T1(Lcom/p1/mobile/putong/data/VerifyData;)V

    return-void
.end method

.method public static synthetic R0(Ll/v6l0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v6l0;->t1()V

    return-void
.end method

.method public static synthetic S0(Ll/v6l0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v6l0;->E1()V

    return-void
.end method

.method public static synthetic U0(Ll/v6l0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v6l0;->B1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic V0(Ll/v6l0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v6l0;->L1()V

    return-void
.end method

.method public static synthetic W0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X0(Ll/v6l0;Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v6l0;->F1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic Y0(Ll/v6l0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v6l0;->s1(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic a1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b1(Ll/v6l0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v6l0;->J1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c1(Lcom/p1/mobile/putong/data/Captcha;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Captcha;->localExpired:Z

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

.method public static synthetic d1(Ll/v6l0;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v6l0;->z1(Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V

    return-void
.end method

.method public static synthetic e1(Ll/v6l0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v6l0;->x1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f1(Ll/v6l0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v6l0;->v1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic g1(Ll/v6l0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/v6l0;->C1()V

    return-void
.end method

.method public static synthetic h1(Ll/v6l0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v6l0;->D1()V

    return-void
.end method

.method public static synthetic i1(Ll/v6l0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v6l0;->O1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j1(Ll/v6l0;Lcom/p1/mobile/putong/data/ConfirmCodeResponse;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v6l0;->N1(Lcom/p1/mobile/putong/data/ConfirmCodeResponse;)V

    return-void
.end method

.method public static synthetic k1(Ll/v6l0;Lcom/p1/mobile/putong/data/Captcha;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v6l0;->u1(Lcom/p1/mobile/putong/data/Captcha;)V

    return-void
.end method

.method public static synthetic l1(Ll/v6l0;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v6l0;->I1(Ll/x20;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic m1(Ll/v6l0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v6l0;->H1(Ljava/lang/Throwable;)V

    return-void
.end method

.method private n1()V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Ll/v6l0;->l:Ljava/lang/String;

    .line 4
    .line 5
    iput-object v0, p0, Ll/v6l0;->m:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerifyData;->captchaToken:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerifyData;->captchaValue:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final synthetic B1(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/v6l0;->n1()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 10
    .line 11
    iget-object v1, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 12
    .line 13
    iget-object p0, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p1, v1, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->d0(Ljava/lang/Throwable;Lcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic D1()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 5
    .line 6
    iget-object v2, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 7
    .line 8
    iget-object v3, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 9
    .line 10
    iget v4, p0, Ll/v6l0;->f:I

    .line 11
    .line 12
    iget-object v5, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 13
    .line 14
    iget-boolean v6, p0, Ll/v6l0;->j:Z

    .line 15
    .line 16
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->c0(Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic E1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/v6l0;->p1(Lcom/p1/mobile/putong/data/VerifyReason;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic F1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p2, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->l0()V

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 14
    .line 15
    const-string v0, "forgot-password"

    .line 16
    .line 17
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/PasswordResetNewAct;->X1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyData;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    iget-object p2, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 47
    .line 48
    const-string v0, "ban-appeal"

    .line 49
    .line 50
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-eqz p2, :cond_1

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/data/PhoneNumber;->new_()Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget p2, p0, Ll/v6l0;->f:I

    .line 61
    .line 62
    iput p2, p1, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 63
    .line 64
    iget-object p2, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 65
    .line 66
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-interface {p2, p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->verifyAppealIdentity(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PhoneNumber;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 81
    .line 82
    const-string v0, "signup"

    .line 83
    .line 84
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    if-eqz p2, :cond_2

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/v6l0;->X1()V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    new-instance p2, Lcom/p1/mobile/putong/data/SignInData;

    .line 95
    .line 96
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 97
    .line 98
    .line 99
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 100
    .line 101
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 108
    .line 109
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->verifyType:Ljava/lang/String;

    .line 110
    .line 111
    new-instance p1, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    iget v0, p0, Ll/v6l0;->f:I

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    const-string v0, " "

    .line 122
    .line 123
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 136
    .line 137
    new-instance p1, Lcom/p1/mobile/putong/data/Device;

    .line 138
    .line 139
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 140
    .line 141
    .line 142
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 143
    .line 144
    invoke-static {}, Ll/tl8;->N()Ljava/util/List;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 149
    .line 150
    const-string p1, "confirmation_code"

    .line 151
    .line 152
    invoke-static {p1}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 157
    .line 158
    new-instance p1, Ll/m6l0;

    .line 159
    .line 160
    invoke-direct {p1, p0}, Ll/m6l0;-><init>(Ll/v6l0;)V

    .line 161
    .line 162
    .line 163
    const/4 v0, 0x0

    .line 164
    invoke-virtual {p0, p2, p1, v0}, Ll/ibf0;->J0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;)V

    .line 165
    .line 166
    .line 167
    return-void
.end method

.method public final synthetic H1(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 7
    .line 8
    iget-object v1, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 9
    .line 10
    iget-object p0, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, p1, v1, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->d0(Ljava/lang/Throwable;Lcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic I1(Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->l0()V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic J1(Ljava/lang/Throwable;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 5
    .line 6
    iget-object v2, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 7
    .line 8
    iget-object v3, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 9
    .line 10
    iget v4, p0, Ll/v6l0;->f:I

    .line 11
    .line 12
    iget-object v5, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 13
    .line 14
    move-object v6, p1

    .line 15
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->k0(Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/VerifyData;ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic L1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/v6l0;->p1(Lcom/p1/mobile/putong/data/VerifyReason;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic N1(Lcom/p1/mobile/putong/data/ConfirmCodeResponse;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ConfirmCodeResponse;->action:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "signup"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/v6l0;->X1()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance p1, Lcom/p1/mobile/putong/data/SignInData;

    .line 16
    .line 17
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->K()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 33
    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    iget v1, p0, Ll/v6l0;->f:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v1, " "

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 59
    .line 60
    new-instance v0, Lcom/p1/mobile/putong/data/Device;

    .line 61
    .line 62
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 66
    .line 67
    invoke-static {}, Ll/tl8;->N()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 72
    .line 73
    const-string v0, "confirmation_code"

    .line 74
    .line 75
    invoke-static {v0}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 80
    .line 81
    new-instance v0, Ll/i6l0;

    .line 82
    .line 83
    invoke-direct {v0, p0}, Ll/i6l0;-><init>(Ll/v6l0;)V

    .line 84
    .line 85
    .line 86
    const/4 v1, 0x0

    .line 87
    invoke-virtual {p0, p1, v0, v1}, Ll/ibf0;->J0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final synthetic O1(Ljava/lang/Throwable;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 5
    .line 6
    iget-object v2, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 7
    .line 8
    iget-object v3, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 9
    .line 10
    iget v4, p0, Ll/v6l0;->f:I

    .line 11
    .line 12
    iget-object v5, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 13
    .line 14
    move-object v6, p1

    .line 15
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->k0(Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/VerifyData;ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public P1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 4
    .line 5
    iget-object p0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->b0(Lcom/p1/mobile/putong/data/VerifyReason;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Q1(Landroid/view/Menu;)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->M1()Ll/fu;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v0, v1}, Ll/fu;->b(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 15
    .line 16
    const-string v1, "signin"

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-boolean v0, p0, Ll/v6l0;->j:Z

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 29
    .line 30
    const-string v1, "fix_verify_code_hack"

    .line 31
    .line 32
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    iget-object v0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 39
    .line 40
    const-string v1, "signup_signin"

    .line 41
    .line 42
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    const/4 p0, 0x0

    .line 50
    return p0

    .line 51
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->E(Landroid/view/Menu;)V

    .line 56
    .line 57
    .line 58
    const/4 p0, 0x1

    .line 59
    return p0
.end method

.method public R1(Landroid/view/MenuItem;)Z
    .locals 4

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0x102002c

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->I()V

    .line 16
    .line 17
    .line 18
    return v2

    .line 19
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    sget v0, Ll/wcc0;->l0:I

    .line 24
    .line 25
    if-ne p1, v0, :cond_2

    .line 26
    .line 27
    new-instance p1, Lcom/p1/mobile/putong/data/SignInData;

    .line 28
    .line 29
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    iget v1, p0, Ll/v6l0;->f:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v1, " "

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v1}, Ll/jyb;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 61
    .line 62
    iget v0, p0, Ll/v6l0;->f:I

    .line 63
    .line 64
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 69
    .line 70
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 71
    .line 72
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v1, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_1

    .line 89
    .line 90
    const-string v1, "null"

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_1
    iget-object v1, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 94
    .line 95
    :goto_0
    const-string v3, "phone_num"

    .line 96
    .line 97
    invoke-static {v3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    filled-new-array {v1}, [Ll/pf60;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    const-string v3, "e_verification_code_bypassword_button"

    .line 106
    .line 107
    invoke-static {v3, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 111
    .line 112
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 113
    .line 114
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 119
    .line 120
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 121
    .line 122
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    const-string v3, "signin"

    .line 127
    .line 128
    invoke-static {v3}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-static {v1, v3, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;->a2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;)Landroid/content/Intent;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 137
    .line 138
    .line 139
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 140
    .line 141
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 148
    .line 149
    .line 150
    return v2

    .line 151
    :cond_2
    const/4 p0, 0x0

    .line 152
    return p0
.end method

.method public S1(Ll/l4g0;)V
    .locals 3

    .line 1
    iget v0, p0, Ll/v6l0;->f:I

    .line 2
    .line 3
    const/16 v1, 0x56

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    .line 9
    .line 10
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 14
    .line 15
    const-string v2, "signup"

    .line 16
    .line 17
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget-object v1, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 25
    .line 26
    const-string v2, "signin"

    .line 27
    .line 28
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    iget-boolean v1, p0, Ll/v6l0;->j:Z

    .line 35
    .line 36
    if-eqz v1, :cond_5

    .line 37
    .line 38
    const-string v2, "new_device"

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    iget-object v1, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 42
    .line 43
    const-string v2, "forgot-password"

    .line 44
    .line 45
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    const-string v2, "reset_password"

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    iget-object v1, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 55
    .line 56
    const-string v2, "ban-appeal"

    .line 57
    .line 58
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    const-string v2, "appeal"

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_4
    const-string v2, "others"

    .line 68
    .line 69
    :cond_5
    :goto_0
    :try_start_0
    const-string v1, "verify_code_type"

    .line 70
    .line 71
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 72
    .line 73
    .line 74
    const-string v1, "phone_num"

    .line 75
    .line 76
    iget-object p0, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    .line 80
    .line 81
    const-string p0, "ban_type"

    .line 82
    .line 83
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 84
    .line 85
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_6

    .line 90
    .line 91
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 92
    .line 93
    iget-object v1, v1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 94
    .line 95
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_6

    .line 100
    .line 101
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 102
    .line 103
    iget-object v1, v1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 104
    .line 105
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_6

    .line 114
    .line 115
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 116
    .line 117
    iget-object v1, v1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 118
    .line 119
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 124
    .line 125
    iget v1, v1, Lcom/p1/mobile/putong/data/BanStatus;->code:I

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_6
    const/4 v1, 0x0

    .line 129
    :goto_1
    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :catch_0
    move-exception p0

    .line 137
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final T1(Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 4
    .line 5
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 9
    .line 10
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/account/api/a;->A2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/j6l0;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Ll/j6l0;-><init>(Ll/v6l0;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/k6l0;

    .line 29
    .line 30
    invoke-direct {p1, p0}, Ll/k6l0;-><init>(Ll/v6l0;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public U1(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    const-string v0, "REASON"

    .line 2
    .line 3
    iget-object v1, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "COUNTRY_CODE"

    .line 9
    .line 10
    iget v1, p0, Ll/v6l0;->f:I

    .line 11
    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const-string v0, "PHONE_NUMBER"

    .line 16
    .line 17
    iget-object v1, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v0, "PASSWORD"

    .line 23
    .line 24
    iget-object v1, p0, Ll/v6l0;->h:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const-string v0, "IS_NEW_DEVICE"

    .line 30
    .line 31
    iget-boolean p0, p0, Ll/v6l0;->j:Z

    .line 32
    .line 33
    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public V1(Landroid/util/Pair;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/String;

    .line 4
    .line 5
    iput-object v0, p0, Ll/v6l0;->l:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Ll/v6l0;->m:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public W1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/v6l0;->k:Z

    .line 2
    .line 3
    return-void
.end method

.method public X1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-static {v1, v2, v3, v3}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->c2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyData;ZZ)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public Y1(Ll/x20;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 15
    .line 16
    const-string v1, "ban-appeal"

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v2, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 34
    .line 35
    const-string v3, "account"

    .line 36
    .line 37
    invoke-static {v0, v3, v2}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-eqz v4, :cond_0

    .line 42
    .line 43
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 44
    .line 45
    invoke-static {v4, v3, v2}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 54
    .line 55
    iget v2, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 56
    .line 57
    if-eqz v2, :cond_0

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_0

    .line 66
    .line 67
    const/4 v0, 0x1

    .line 68
    goto :goto_0

    .line 69
    :cond_0
    move v0, v1

    .line 70
    :goto_0
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 71
    .line 72
    check-cast v2, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 73
    .line 74
    invoke-virtual {v2}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    const-string v0, "1"

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_1
    const-string v0, "0"

    .line 88
    .line 89
    :goto_1
    const-string v3, "is_binding_phonenumber"

    .line 90
    .line 91
    invoke-static {v3, v0}, Ll/rfj0$a;->f(Ljava/lang/String;Ljava/lang/String;)Ll/rfj0$a;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    new-instance v3, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    const-string v4, ""

    .line 98
    .line 99
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object v4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 103
    .line 104
    check-cast v4, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 105
    .line 106
    iget-object v4, v4, Lcom/p1/mobile/putong/account/ui/accountnew/a;->l:Lv/VCheckBox;

    .line 107
    .line 108
    invoke-virtual {v4}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    const-string v4, "is_checked"

    .line 120
    .line 121
    invoke-static {v4, v3}, Ll/rfj0$a;->f(Ljava/lang/String;Ljava/lang/String;)Ll/rfj0$a;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    filled-new-array {v0, v3}, [Ll/rfj0$a;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    const-string v3, "e_p_appeal_verify_phonenumber_page_next"

    .line 130
    .line 131
    invoke-static {v3, v2, v0}, Ll/rfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/rfj0$a;)V

    .line 132
    .line 133
    .line 134
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 135
    .line 136
    iget-object v2, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 137
    .line 138
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/account/api/a;->A2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    new-instance v2, Ll/g6l0;

    .line 143
    .line 144
    invoke-direct {v2, p0, p1}, Ll/g6l0;-><init>(Ll/v6l0;Ll/x20;)V

    .line 145
    .line 146
    .line 147
    new-instance p1, Ll/h6l0;

    .line 148
    .line 149
    invoke-direct {p1, p0}, Ll/h6l0;-><init>(Ll/v6l0;)V

    .line 150
    .line 151
    .line 152
    invoke-static {v2, p1, v1}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public Z1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 15
    .line 16
    iget-object v1, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/api/a;->F2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/e6l0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/e6l0;-><init>(Ll/v6l0;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/f6l0;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/f6l0;-><init>(Ll/v6l0;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    invoke-static {v1, v2, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ibf0;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/n6l0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/n6l0;-><init>(Ll/v6l0;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/o6l0;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/o6l0;-><init>(Ll/v6l0;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v1, v1, Ll/esf0;->b:Lrx/subjects/b;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/p6l0;

    .line 43
    .line 44
    invoke-direct {v1}, Ll/p6l0;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/q6l0;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/q6l0;-><init>(Ll/v6l0;)V

    .line 54
    .line 55
    .line 56
    new-instance p0, Ll/r6l0;

    .line 57
    .line 58
    invoke-direct {p0}, Ll/r6l0;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public o1()Lcom/p1/mobile/putong/data/VerifyReason;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    return-object p0
.end method

.method public p1(Lcom/p1/mobile/putong/data/VerifyReason;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    const-string p0, ""

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v0, "REASON"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/data/VerifyReason;

    .line 22
    .line 23
    const-string v0, "ban-appeal"

    .line 24
    .line 25
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const-string p0, "p_appeal_verify_phonenumber"

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_0
    const-string p0, "p_sign_in_verification_code_view"

    .line 35
    .line 36
    return-object p0
.end method

.method public q1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/v6l0;->p1(Lcom/p1/mobile/putong/data/VerifyReason;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/16 v1, 0x3c

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/b6l0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/b6l0;-><init>(Ll/v6l0;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/c6l0;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/c6l0;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v3, Ll/d6l0;

    .line 28
    .line 29
    invoke-direct {v3, p0}, Ll/d6l0;-><init>(Ll/v6l0;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v2, v3}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public r1(Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerifyData;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    iput p2, p0, Ll/v6l0;->f:I

    .line 4
    .line 5
    iput-object p3, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/v6l0;->h:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 10
    .line 11
    iput-boolean p6, p0, Ll/v6l0;->j:Z

    .line 12
    .line 13
    return-void
.end method

.method public final synthetic s1(Ljava/lang/Long;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->i0(J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic t1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 4
    .line 5
    iget-object p0, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->g0(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic u1(Lcom/p1/mobile/putong/data/Captcha;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 8
    .line 9
    iput-object p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 10
    .line 11
    iget-object p0, p0, Ll/v6l0;->n:Ljava/lang/Runnable;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic v1(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->H()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic x1(Landroid/os/Bundle;)V
    .locals 7

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object v0, p1

    .line 4
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 5
    .line 6
    iget-object v1, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 7
    .line 8
    iget v2, p0, Ll/v6l0;->f:I

    .line 9
    .line 10
    iget-object v3, p0, Ll/v6l0;->g:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v4, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 13
    .line 14
    iget-boolean v5, p0, Ll/v6l0;->j:Z

    .line 15
    .line 16
    iget-object v6, p0, Ll/v6l0;->h:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->J(Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;Lcom/p1/mobile/putong/data/VerifyData;ZLjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic z1(Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/v6l0;->n1()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-boolean v0, p1, Lcom/p1/mobile/account_core/reponse_data/RiskVerification;->required:Z

    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/v6l0;->i:Lcom/p1/mobile/putong/data/VerifyData;

    .line 13
    .line 14
    new-instance v2, Ll/u6l0;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ll/u6l0;-><init>(Ll/v6l0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, p1, v1, v2}, Ll/fdd0;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;Lcom/p1/mobile/putong/data/VerifyData;Ll/fdd0$a;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 29
    .line 30
    iget-object p0, p0, Ll/v6l0;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e0(Lcom/p1/mobile/putong/data/VerifyReason;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
