.class public Ll/oy60;
.super Ll/ibf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ibf0<",
        "Ll/hz60;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Lcom/p1/mobile/putong/data/VerifyReason;

.field public f:Lcom/p1/mobile/putong/data/SignInData;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Z

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ll/b1w;

.field public n:I


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ibf0;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q0(Ll/oy60;Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/oy60;->E1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic R0(Ll/oy60;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oy60;->D1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic S0(Ll/oy60;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oy60;->F1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic U0(Lcom/google/android/gms/auth/api/credentials/Credential;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "inActivated"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "newDevice"

    .line 10
    .line 11
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/qsf0;->d()Ll/qsf0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1, p0}, Ll/qsf0;->c(Lcom/google/android/gms/auth/api/credentials/Credential;)V

    .line 22
    .line 23
    .line 24
    sget p0, Lcom/p1/mobile/putong/account/R$string;->Q3:I

    .line 25
    .line 26
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public static synthetic V0(Ll/oy60;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oy60;->I1(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic W0(Ll/oy60;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oy60;->B1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic X0(Ll/oy60;Lcom/p1/mobile/putong/data/AccountErrorResponse;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oy60;->Q1(Lcom/p1/mobile/putong/data/AccountErrorResponse;)V

    return-void
.end method

.method public static synthetic Y0(Ll/oy60;Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/oy60;->z1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic a1(Ll/oy60;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oy60;->N1(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic b1(Ll/oy60;Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oy60;->W1(Lcom/p1/mobile/putong/data/VerifyData;)V

    return-void
.end method

.method public static synthetic c1(Ll/oy60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/oy60;->C1()V

    return-void
.end method

.method public static synthetic d1(Ll/oy60;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oy60;->u1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic e1(Ll/oy60;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oy60;->s1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic f1(Ll/oy60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/oy60;->t1()V

    return-void
.end method

.method public static synthetic g1(Ll/oy60;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oy60;->v1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic h1(Ll/oy60;Lcom/google/android/gms/auth/api/credentials/Credential;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oy60;->x1(Lcom/google/android/gms/auth/api/credentials/Credential;)V

    return-void
.end method

.method public static synthetic i1(Ll/oy60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/oy60;->L1()V

    return-void
.end method

.method public static synthetic j1(Ll/oy60;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oy60;->O1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k1(Ll/oy60;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oy60;->J1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l1(Ll/oy60;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oy60;->P1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic m1(Ll/oy60;Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/oy60;->H1(Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V

    return-void
.end method


# virtual methods
.method public final synthetic B1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hz60;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic C1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hz60;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic D1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hz60;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic E1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 3

    .line 1
    new-instance p2, Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->phone:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 7
    .line 8
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 11
    .line 12
    iput v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->countryCode:I

    .line 13
    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 15
    .line 16
    iput v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->code:I

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->action:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->verifyType:Ljava/lang/String;

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 35
    .line 36
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/account/api/a;->i2(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 40
    .line 41
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 45
    .line 46
    const-string v1, "pending"

    .line 47
    .line 48
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 61
    .line 62
    check-cast v0, Ll/hz60;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 69
    .line 70
    .line 71
    sget-object v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/TtcAccountBindAct;->Companion:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/TtcAccountBindAct$a;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1, p2, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/TtcAccountBindAct$a;->a(Landroid/content/Context;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 92
    .line 93
    .line 94
    :cond_0
    return-void

    .line 95
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 96
    .line 97
    const-string v1, "signup"

    .line 98
    .line 99
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_3

    .line 104
    .line 105
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 106
    .line 107
    const-string v1, "ttt-signup"

    .line 108
    .line 109
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_2

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_2
    new-instance p2, Lcom/p1/mobile/putong/data/SignInData;

    .line 117
    .line 118
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 119
    .line 120
    .line 121
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 122
    .line 123
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 128
    .line 129
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 130
    .line 131
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->verifyType:Ljava/lang/String;

    .line 132
    .line 133
    new-instance p1, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 139
    .line 140
    check-cast v0, Ll/hz60;

    .line 141
    .line 142
    invoke-virtual {v0}, Ll/hz60;->I()I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const-string v0, " "

    .line 150
    .line 151
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Ll/oy60;->h:Ljava/lang/String;

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 164
    .line 165
    new-instance p1, Lcom/p1/mobile/putong/data/Device;

    .line 166
    .line 167
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 168
    .line 169
    .line 170
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 171
    .line 172
    invoke-static {}, Ll/tl8;->N()Ljava/util/List;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 177
    .line 178
    const-string p1, "confirmation_code"

    .line 179
    .line 180
    invoke-static {p1}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 185
    .line 186
    new-instance p1, Ll/dy60;

    .line 187
    .line 188
    invoke-direct {p1, p0}, Ll/dy60;-><init>(Ll/oy60;)V

    .line 189
    .line 190
    .line 191
    new-instance v0, Ll/fy60;

    .line 192
    .line 193
    invoke-direct {v0, p0}, Ll/fy60;-><init>(Ll/oy60;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p0, p2, p1, v0}, Ll/ibf0;->J0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;)V

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :cond_3
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    const/4 v1, 0x0

    .line 205
    const/4 v2, 0x1

    .line 206
    invoke-static {p2, v1, v2}, Ll/ike;->r(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;Z)Lrx/c;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 211
    .line 212
    .line 213
    move-result-object p2

    .line 214
    new-instance v0, Ll/by60;

    .line 215
    .line 216
    invoke-direct {v0, p0, p1}, Ll/by60;-><init>(Ll/oy60;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 217
    .line 218
    .line 219
    new-instance p1, Ll/cy60;

    .line 220
    .line 221
    invoke-direct {p1, p0}, Ll/cy60;-><init>(Ll/oy60;)V

    .line 222
    .line 223
    .line 224
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 229
    .line 230
    .line 231
    return-void
.end method

.method public final synthetic F1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/hz60;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 13
    .line 14
    .line 15
    invoke-static {p1}, Ll/tf;->b(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic H1(Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/hz60;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/oy60;->o1()V

    .line 13
    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    iget-boolean v0, p2, Lcom/p1/mobile/account_core/reponse_data/RiskVerification;->required:Z

    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/yx60;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/yx60;-><init>(Ll/oy60;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, p2, p1, v1}, Ll/fdd0;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;Lcom/p1/mobile/putong/data/VerifyData;Ll/fdd0$a;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-virtual {p0}, Ll/oy60;->c2()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic I1(Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/String;

    .line 4
    .line 5
    iput-object v0, p0, Ll/oy60;->k:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Ll/oy60;->l:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/oy60;->X1()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic J1(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/hz60;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/oy60;->o1()V

    .line 16
    .line 17
    .line 18
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    move-object v1, p1

    .line 23
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 24
    .line 25
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 26
    .line 27
    const v2, 0x62639

    .line 28
    .line 29
    .line 30
    if-ne v1, v2, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/xx60;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/xx60;-><init>(Ll/oy60;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p1, v0}, Ll/sm;->n0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    if-eqz v0, :cond_1

    .line 46
    .line 47
    move-object v0, p1

    .line 48
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 49
    .line 50
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 51
    .line 52
    const v1, 0x6263b

    .line 53
    .line 54
    .line 55
    if-ne v0, v1, :cond_1

    .line 56
    .line 57
    sget-object p1, Ll/olj;->INSTANCE:Ll/olj;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Ll/olj;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    invoke-static {p1}, Ll/tf;->b(Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final synthetic L1()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/oy60;->o1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic N1(Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/String;

    .line 4
    .line 5
    iput-object v0, p0, Ll/oy60;->k:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Ll/oy60;->l:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public final synthetic O1(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/oy60;->o1()V

    .line 2
    .line 3
    .line 4
    const-string v0, "suspicious"

    .line 5
    .line 6
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance v0, Ll/ux60;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/ux60;-><init>(Ll/oy60;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/sm;->n0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic P1(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    :try_start_0
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 7
    .line 8
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 9
    .line 10
    const v1, 0x9c4b

    .line 11
    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/oy60;->b2()V

    .line 16
    .line 17
    .line 18
    goto :goto_2

    .line 19
    :catch_0
    move-exception v0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_1

    .line 25
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    :goto_1
    iget p1, p0, Ll/oy60;->n:I

    .line 32
    .line 33
    add-int/lit8 p1, p1, 0x1

    .line 34
    .line 35
    iput p1, p0, Ll/oy60;->n:I

    .line 36
    .line 37
    :goto_2
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p0, Ll/hz60;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic Q1(Lcom/p1/mobile/putong/data/AccountErrorResponse;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/hz60;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/hz60;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "signup"

    .line 18
    .line 19
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast v2, Ll/hz60;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/hz60;->I()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iget-object v3, p0, Ll/oy60;->h:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0, v1, v2, v3}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->a2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p0, Ll/hz60;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public R1(IILandroid/content/Intent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    const-string v1, "signup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/oy60;->m:Ll/b1w;

    .line 12
    .line 13
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v1, Ll/hz60;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1, p1, p2, p3}, Ll/b1w;->a(Landroid/content/Context;IILandroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/qsf0;->d()Ll/qsf0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/tx60;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/tx60;-><init>(Ll/oy60;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1, p2, p3, v1}, Ll/qsf0;->f(IILandroid/content/Intent;Ll/y20;)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public S1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    const-string v1, "ban-appeal"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/hz60;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 v0, 0x0

    .line 24
    new-array v0, v0, [Ll/rfj0$a;

    .line 25
    .line 26
    const-string v1, "e_p_appeal_verify_phonenumber_page_back"

    .line 27
    .line 28
    invoke-static {v1, p0, v0}, Ll/rfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/rfj0$a;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public T1(Landroid/view/Menu;)Z
    .locals 4

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
    iget-object v0, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

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
    const/4 v1, 0x1

    .line 23
    const/4 v2, 0x2

    .line 24
    const/4 v3, 0x0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->f:Ll/wf;

    .line 28
    .line 29
    iget-object p0, p0, Ll/oy60;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 32
    .line 33
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Ll/wf;->m(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_0

    .line 42
    .line 43
    return v3

    .line 44
    :cond_0
    sget p0, Ll/wcc0;->F:I

    .line 45
    .line 46
    sget v0, Lcom/p1/mobile/putong/account/R$string;->p2:I

    .line 47
    .line 48
    invoke-interface {p1, v3, p0, v3, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-interface {p0, v2}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 53
    .line 54
    .line 55
    return v1

    .line 56
    :cond_1
    invoke-static {}, Ll/bp;->k()Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_2

    .line 61
    .line 62
    sget p0, Ll/wcc0;->J:I

    .line 63
    .line 64
    const-string v0, "\u9047\u5230\u95ee\u9898\uff1f"

    .line 65
    .line 66
    invoke-interface {p1, v3, p0, v3, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-interface {p0, v2}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 71
    .line 72
    .line 73
    return v1

    .line 74
    :cond_2
    return v3
.end method

.method public U1(Landroid/view/MenuItem;)Z
    .locals 6

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget v1, Ll/wcc0;->F:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-ne v0, v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/oy60;->pageId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "phone_num"

    .line 16
    .line 17
    iget-object v1, p0, Ll/oy60;->h:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "e_password_verifypage_switch_button"

    .line 28
    .line 29
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p1, Ll/hz60;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/hz60;->I()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/16 v0, 0x56

    .line 41
    .line 42
    if-ne p1, v0, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/oy60;->c2()V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast p1, Ll/hz60;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 57
    .line 58
    check-cast v0, Ll/hz60;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v1, "signin"

    .line 65
    .line 66
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object v4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 71
    .line 72
    check-cast v4, Ll/hz60;

    .line 73
    .line 74
    invoke-virtual {v4}, Ll/hz60;->I()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    iget-object v5, p0, Ll/oy60;->h:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v0, v1, v4, v5, v2}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->c2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;Z)Landroid/content/Intent;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 85
    .line 86
    .line 87
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 88
    .line 89
    check-cast p0, Ll/hz60;

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 96
    .line 97
    .line 98
    return v3

    .line 99
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    sget v0, Ll/wcc0;->J:I

    .line 104
    .line 105
    if-ne p1, v0, :cond_2

    .line 106
    .line 107
    const-string p1, "e_prelogin_mobile_num_page_feedback"

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/oy60;->pageId()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    const-string v0, "https://feedback.tantanapp.com/feedback-mobile/pre-login"

    .line 125
    .line 126
    invoke-static {v0}, Ll/ebe0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    const-string v1, "\u5e2e\u52a9\u4e0e\u53cd\u9988"

    .line 131
    .line 132
    invoke-static {p0, v1, v0, v3}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 137
    .line 138
    .line 139
    return v3

    .line 140
    :cond_2
    return v2
.end method

.method public V1(Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;Ll/l4g0;)V
    .locals 2

    .line 1
    new-instance p1, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v0, Ll/hz60;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "p_sign_in_password_view"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    const-string v0, "phone_num"

    .line 27
    .line 28
    iget-object p0, p0, Ll/oy60;->h:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p1, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast v0, Ll/hz60;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "p_sign_in_phone_number_view"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    const-string v0, "phone_show_type"

    .line 55
    .line 56
    const-string v1, "SHORE_CUT_ACT"

    .line 57
    .line 58
    iget-object p0, p0, Ll/oy60;->g:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_1

    .line 65
    .line 66
    const-string p0, "switch_signin"

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    const-string p0, "direct_signin"

    .line 70
    .line 71
    :goto_0
    invoke-virtual {p1, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 72
    .line 73
    .line 74
    :cond_2
    :goto_1
    invoke-virtual {p2, p1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :catch_0
    move-exception p0

    .line 79
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final W1(Lcom/p1/mobile/putong/data/VerifyData;)V
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
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/account/api/a;->A2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/zx60;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Ll/zx60;-><init>(Ll/oy60;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Ll/ay60;

    .line 33
    .line 34
    invoke-direct {p1, p0}, Ll/ay60;-><init>(Ll/oy60;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public X1()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VerifyData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v1, Ll/hz60;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/hz60;->I()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 21
    .line 22
    iget-object v1, p0, Ll/oy60;->h:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 25
    .line 26
    const/4 v1, 0x4

    .line 27
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 28
    .line 29
    const-string v1, "signup_signin"

    .line 30
    .line 31
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 36
    .line 37
    iget-object v1, p0, Ll/oy60;->k:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_0

    .line 44
    .line 45
    iget-object v1, p0, Ll/oy60;->k:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->captchaToken:Ljava/lang/String;

    .line 48
    .line 49
    :cond_0
    iget-object v1, p0, Ll/oy60;->l:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-nez v1, :cond_1

    .line 56
    .line 57
    iget-object v1, p0, Ll/oy60;->l:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->captchaValue:Ljava/lang/String;

    .line 60
    .line 61
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 62
    .line 63
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 67
    .line 68
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/account/api/a;->b2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    new-instance v2, Ll/vx60;

    .line 73
    .line 74
    invoke-direct {v2, p0, v0}, Ll/vx60;-><init>(Ll/oy60;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 75
    .line 76
    .line 77
    new-instance v0, Ll/wx60;

    .line 78
    .line 79
    invoke-direct {v0, p0}, Ll/wx60;-><init>(Ll/oy60;)V

    .line 80
    .line 81
    .line 82
    const/4 p0, 0x0

    .line 83
    invoke-static {v2, v0, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public Y1(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/oy60;->i:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public Z1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/hz60;

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
    check-cast v1, Ll/hz60;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast v2, Ll/hz60;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/hz60;->I()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    iget-object p0, p0, Ll/oy60;->h:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1, v2, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberVerifyAct;->X1(Landroid/content/Context;ILjava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ibf0;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ey60;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ey60;-><init>(Ll/oy60;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/gy60;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/gy60;-><init>(Ll/oy60;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/oy60;->q1()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final a2(Ljava/lang/String;Ljava/lang/String;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SignInData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/SignInData;->isSmartlock:Z

    .line 8
    .line 9
    const-string v1, "password"

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 16
    .line 17
    iput-object p2, v0, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 20
    .line 21
    new-instance p1, Lcom/p1/mobile/putong/data/Device;

    .line 22
    .line 23
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 27
    .line 28
    invoke-static {}, Ll/tl8;->N()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    iput-object p2, p1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    invoke-virtual {p0, v0, p1, p3}, Ll/ibf0;->J0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final b2()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SignInData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v2, Ll/hz60;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/hz60;->I()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v2, " "

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Ll/oy60;->h:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v2}, Ll/jyb;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast v1, Ll/hz60;

    .line 45
    .line 46
    invoke-virtual {v1}, Ll/hz60;->I()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 61
    .line 62
    check-cast p0, Ll/hz60;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string v2, "signin"

    .line 69
    .line 70
    invoke-static {v2}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-static {p0, v2, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;->a2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;)Landroid/content/Intent;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public c2()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/hz60;

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
    check-cast v1, Ll/hz60;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "signup_signin"

    .line 18
    .line 19
    invoke-static {v2}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast v3, Ll/hz60;

    .line 26
    .line 27
    invoke-virtual {v3}, Ll/hz60;->I()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    iget-object p0, p0, Ll/oy60;->h:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1, v2, v3, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->a2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public d2()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/hz60;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "phone_num"

    .line 14
    .line 15
    iget-object p0, p0, Ll/oy60;->h:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {p0}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v1, "e_password_verifypage_signin_button"

    .line 26
    .line 27
    invoke-static {v1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e2()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    sget-object v0, Ll/og3;->a:Ll/og3;

    .line 13
    .line 14
    const-string v1, "reason"

    .line 15
    .line 16
    filled-new-array {v1, p0, v0}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public f2(Ljava/lang/CharSequence;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/oy60;->j:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iput-boolean v1, p0, Ll/oy60;->j:Z

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Ll/hz60;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v2, "p_sign_in_phone_number_view"

    .line 27
    .line 28
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-lez p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p1, Ll/hz60;

    .line 43
    .line 44
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-array v1, v1, [Ljava/lang/Object;

    .line 61
    .line 62
    const-string v2, "e_phone_input"

    .line 63
    .line 64
    invoke-static {v2, p1, v0, v1}, Ll/g4g0;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 68
    .line 69
    check-cast p1, Ll/hz60;

    .line 70
    .line 71
    invoke-virtual {p1}, Ll/hz60;->K()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iput-object p1, p0, Ll/oy60;->h:Ljava/lang/String;

    .line 76
    .line 77
    if-nez p1, :cond_2

    .line 78
    .line 79
    new-instance p1, Ljava/lang/Exception;

    .line 80
    .line 81
    const-string v0, "mobileNumber == null in PhoneNumberInputAct on line 368"

    .line 82
    .line 83
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 90
    .line 91
    check-cast p1, Ll/hz60;

    .line 92
    .line 93
    invoke-virtual {p1}, Ll/hz60;->j0()V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 97
    .line 98
    check-cast p1, Ll/hz60;

    .line 99
    .line 100
    invoke-virtual {p1}, Ll/hz60;->f0()Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_3

    .line 105
    .line 106
    iget-object p1, p0, Ll/oy60;->h:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    const/16 v0, 0xb

    .line 113
    .line 114
    if-ne p1, v0, :cond_3

    .line 115
    .line 116
    iget-object p1, p0, Ll/oy60;->h:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {p0, p1}, Ll/oy60;->n1(Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_3

    .line 123
    .line 124
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 125
    .line 126
    check-cast p0, Ll/hz60;

    .line 127
    .line 128
    invoke-virtual {p0}, Ll/hz60;->g0()V

    .line 129
    .line 130
    .line 131
    :cond_3
    return-void
.end method

.method public final g2()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/hz60;

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
    check-cast v1, Ll/hz60;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 18
    .line 19
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v3, Ll/hz60;

    .line 22
    .line 23
    invoke-virtual {v3}, Ll/hz60;->I()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    iget-object p0, p0, Ll/oy60;->h:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1, v2, v3, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->a2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public h2(Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget p1, p0, Ll/oy60;->n:I

    .line 4
    .line 5
    add-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    iput p1, p0, Ll/oy60;->n:I

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p1, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 11
    .line 12
    const-string v0, "signin"

    .line 13
    .line 14
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_3

    .line 19
    .line 20
    iget-object p1, p0, Ll/oy60;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 21
    .line 22
    iget-object v0, p0, Ll/oy60;->i:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 25
    .line 26
    const-string v0, "password"

    .line 27
    .line 28
    invoke-static {v0}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 33
    .line 34
    iget-object p1, p0, Ll/oy60;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 35
    .line 36
    new-instance v0, Lcom/p1/mobile/putong/data/Device;

    .line 37
    .line 38
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 42
    .line 43
    iget-object p1, p0, Ll/oy60;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 46
    .line 47
    invoke-static {}, Ll/tl8;->N()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 52
    .line 53
    iget-object p1, p0, Ll/oy60;->k:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-nez p1, :cond_1

    .line 60
    .line 61
    iget-object p1, p0, Ll/oy60;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 62
    .line 63
    iget-object v0, p0, Ll/oy60;->k:Ljava/lang/String;

    .line 64
    .line 65
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->captchaToken:Ljava/lang/String;

    .line 66
    .line 67
    :cond_1
    iget-object p1, p0, Ll/oy60;->l:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_2

    .line 74
    .line 75
    iget-object p1, p0, Ll/oy60;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 76
    .line 77
    iget-object v0, p0, Ll/oy60;->l:Ljava/lang/String;

    .line 78
    .line 79
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->captchaValue:Ljava/lang/String;

    .line 80
    .line 81
    :cond_2
    iget-object p1, p0, Ll/oy60;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 82
    .line 83
    new-instance v0, Ll/ky60;

    .line 84
    .line 85
    invoke-direct {v0, p0}, Ll/ky60;-><init>(Ll/oy60;)V

    .line 86
    .line 87
    .line 88
    new-instance v1, Ll/ly60;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/ly60;-><init>(Ll/oy60;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p1, v0, v1}, Ll/ibf0;->J0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_3
    iget-object p1, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 98
    .line 99
    const-string v0, "signup"

    .line 100
    .line 101
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_4

    .line 106
    .line 107
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 108
    .line 109
    check-cast p1, Ll/hz60;

    .line 110
    .line 111
    invoke-virtual {p1}, Ll/hz60;->J()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 116
    .line 117
    check-cast v0, Ll/hz60;

    .line 118
    .line 119
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const-string v1, "phone_num"

    .line 128
    .line 129
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    filled-new-array {p1}, [Ll/pf60;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    const-string v1, "e_phone_continue_button"

    .line 138
    .line 139
    invoke-static {v1, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Ll/oy60;->i2()V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_4
    iget-object p1, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 147
    .line 148
    const-string v0, "ban-appeal"

    .line 149
    .line 150
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-eqz p1, :cond_5

    .line 155
    .line 156
    invoke-virtual {p0}, Ll/oy60;->g2()V

    .line 157
    .line 158
    .line 159
    :cond_5
    return-void
.end method

.method public final i2()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VerifyData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 15
    .line 16
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v1, Ll/hz60;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/hz60;->I()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 25
    .line 26
    iget-object v1, p0, Ll/oy60;->h:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast v1, Ll/hz60;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    sget v2, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 41
    .line 42
    .line 43
    iget v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 44
    .line 45
    const/16 v2, 0x56

    .line 46
    .line 47
    if-ne v1, v2, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/oy60;->X1()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 54
    .line 55
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/account/api/a;->E2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/my60;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/my60;-><init>(Ll/oy60;)V

    .line 62
    .line 63
    .line 64
    new-instance v2, Ll/ny60;

    .line 65
    .line 66
    invoke-direct {v2, p0}, Ll/ny60;-><init>(Ll/oy60;)V

    .line 67
    .line 68
    .line 69
    const/4 p0, 0x0

    .line 70
    invoke-static {v1, v2, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public n1(Ljava/lang/String;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x3

    .line 6
    const/4 v2, 0x0

    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    return v2

    .line 10
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Ll/hz60;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/hz60;->f0()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    const-string p0, "^[0-9]*$"

    .line 21
    .line 22
    invoke-static {p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    const/16 v0, 0xb

    .line 40
    .line 41
    if-eq p0, v0, :cond_2

    .line 42
    .line 43
    return v2

    .line 44
    :cond_2
    const-string p0, "^1[0-9]{10}$"

    .line 45
    .line 46
    invoke-static {p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0
.end method

.method public final o1()V
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Ll/oy60;->k:Ljava/lang/String;

    .line 4
    .line 5
    iput-object v0, p0, Ll/oy60;->l:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, p0, Ll/oy60;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/oy60;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignInData;->captchaToken:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignInData;->captchaValue:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public p1(Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    iput-object p2, p0, Ll/oy60;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 4
    .line 5
    iput-object p3, p0, Ll/oy60;->g:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 10
    .line 11
    const-string v1, "ban-appeal"

    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p0, "p_appeal_verify_phonenumber"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    iget-object p0, p0, Ll/oy60;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    const-string p0, "p_sign_in_password_view"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_1
    const-string p0, "p_sign_in_phone_number_view"

    .line 34
    .line 35
    return-object p0
.end method

.method public q1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/hy60;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/hy60;-><init>(Ll/oy60;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final r1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/hz60;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/b1w;->c(Lcom/p1/mobile/android/app/Act;)Ll/b1w;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/oy60;->m:Ll/b1w;

    .line 14
    .line 15
    return-void
.end method

.method public final synthetic s1(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/hz60;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/hz60;->j0()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Ll/hz60;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/hz60;->h0()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public final synthetic t1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hz60;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/hz60;->k0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic u1(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    const-string v0, "signup"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v1, Ll/jy60;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/jy60;-><init>(Ll/oy60;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/oy60;->r1()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 27
    .line 28
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    iput-boolean p1, p0, Ll/oy60;->j:Z

    .line 36
    .line 37
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p1, Ll/hz60;

    .line 40
    .line 41
    iget-object v0, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 42
    .line 43
    iget-object v1, p0, Ll/oy60;->f:Lcom/p1/mobile/putong/data/SignInData;

    .line 44
    .line 45
    invoke-virtual {p1, v0, v1}, Ll/hz60;->i0(Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast p1, Ll/hz60;

    .line 51
    .line 52
    iget-object v0, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ll/hz60;->L(Lcom/p1/mobile/putong/data/VerifyReason;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 58
    .line 59
    check-cast p1, Ll/hz60;

    .line 60
    .line 61
    iget-object p0, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 62
    .line 63
    invoke-virtual {p1, p0}, Ll/hz60;->M(Lcom/p1/mobile/putong/data/VerifyReason;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final synthetic v1(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/oy60;->e:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    const-string v0, "signup"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/qsf0;->d()Ll/qsf0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Ll/qsf0;->g(Landroid/app/Activity;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic x1(Lcom/google/android/gms/auth/api/credentials/Credential;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/credentials/Credential;->J()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    const-string v1, " "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    array-length v0, v0

    .line 18
    const/4 v1, 0x2

    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/credentials/Credential;->J()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/credentials/Credential;->getPassword()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ll/iy60;

    .line 31
    .line 32
    invoke-direct {v2, p1}, Ll/iy60;-><init>(Lcom/google/android/gms/auth/api/credentials/Credential;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0, v1, v2}, Ll/oy60;->a2(Ljava/lang/String;Ljava/lang/String;Ll/y20;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    :goto_0
    invoke-static {}, Ll/qsf0;->d()Ll/qsf0;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, p1}, Ll/qsf0;->c(Lcom/google/android/gms/auth/api/credentials/Credential;)V

    .line 44
    .line 45
    .line 46
    sget p0, Lcom/p1/mobile/putong/account/R$string;->Q3:I

    .line 47
    .line 48
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic z1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p2, Ll/hz60;

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 17
    .line 18
    .line 19
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 20
    .line 21
    const-string v0, "ttt-signup"

    .line 22
    .line 23
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ibf0;->r0()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast v0, Ll/hz60;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-static {v0, p1, v1, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->c2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyData;ZZ)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 58
    .line 59
    .line 60
    return-void
.end method
