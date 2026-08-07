.class public Ll/e070;
.super Ll/ibf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ibf0<",
        "Ll/c170;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Ljava/lang/String;

.field public f:Lcom/p1/mobile/putong/account/data/CaptchaData;


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

.method private I1(Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 4

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
    new-instance v0, Lcom/p1/mobile/putong/data/SignUpData;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 11
    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->phone:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 16
    .line 17
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 18
    .line 19
    iput v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->countryCode:I

    .line 20
    .line 21
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 22
    .line 23
    iput v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->code:I

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->action:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->verifyType:Ljava/lang/String;

    .line 40
    .line 41
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/account/api/a;->i2(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 47
    .line 48
    const-string v2, "pending"

    .line 49
    .line 50
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_0

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 63
    .line 64
    check-cast v1, Ll/c170;

    .line 65
    .line 66
    invoke-virtual {v1}, Ll/c170;->S()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-static {v1}, Ll/l51;->K(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    sget-object v1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/TtcAccountBindAct;->Companion:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/TtcAccountBindAct$a;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v1, v2, v0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/TtcAccountBindAct$a;->a(Landroid/content/Context;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 94
    .line 95
    .line 96
    goto/16 :goto_1

    .line 97
    .line 98
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 99
    .line 100
    const-string v2, "signup"

    .line 101
    .line 102
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-nez v1, :cond_2

    .line 107
    .line 108
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 109
    .line 110
    const-string v2, "ttt-signup"

    .line 111
    .line 112
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-eqz v1, :cond_1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 120
    .line 121
    check-cast v0, Ll/c170;

    .line 122
    .line 123
    invoke-virtual {v0}, Ll/c170;->J0()V

    .line 124
    .line 125
    .line 126
    new-instance v0, Lcom/p1/mobile/putong/data/SignInData;

    .line 127
    .line 128
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 129
    .line 130
    .line 131
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 132
    .line 133
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 138
    .line 139
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 140
    .line 141
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignInData;->verifyType:Ljava/lang/String;

    .line 142
    .line 143
    new-instance p1, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .line 147
    .line 148
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 149
    .line 150
    check-cast v1, Ll/c170;

    .line 151
    .line 152
    invoke-virtual {v1}, Ll/c170;->P()I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string v1, " "

    .line 160
    .line 161
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 165
    .line 166
    check-cast v1, Ll/c170;

    .line 167
    .line 168
    invoke-virtual {v1}, Ll/c170;->R()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 180
    .line 181
    new-instance p1, Lcom/p1/mobile/putong/data/Device;

    .line 182
    .line 183
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 184
    .line 185
    .line 186
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 187
    .line 188
    invoke-static {}, Ll/tl8;->N()Ljava/util/List;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    iput-object v1, p1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 193
    .line 194
    const-string p1, "confirmation_code"

    .line 195
    .line 196
    invoke-static {p1}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 201
    .line 202
    new-instance p1, Ll/oz60;

    .line 203
    .line 204
    invoke-direct {p1, p0}, Ll/oz60;-><init>(Ll/e070;)V

    .line 205
    .line 206
    .line 207
    new-instance v1, Ll/pz60;

    .line 208
    .line 209
    invoke-direct {v1, p0}, Ll/pz60;-><init>(Ll/e070;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0, v0, p1, v1}, Ll/ibf0;->J0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;)V

    .line 213
    .line 214
    .line 215
    goto :goto_1

    .line 216
    :cond_2
    :goto_0
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 217
    .line 218
    check-cast v1, Ll/c170;

    .line 219
    .line 220
    invoke-virtual {v1}, Ll/c170;->J0()V

    .line 221
    .line 222
    .line 223
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    const/4 v2, 0x0

    .line 228
    const/4 v3, 0x1

    .line 229
    invoke-static {v0, v2, v3}, Ll/ike;->r(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;Z)Lrx/c;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    new-instance v1, Ll/mz60;

    .line 238
    .line 239
    invoke-direct {v1, p0, p1}, Ll/mz60;-><init>(Ll/e070;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 240
    .line 241
    .line 242
    new-instance p1, Ll/nz60;

    .line 243
    .line 244
    invoke-direct {p1, p0}, Ll/nz60;-><init>(Ll/e070;)V

    .line 245
    .line 246
    .line 247
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 252
    .line 253
    .line 254
    :cond_3
    :goto_1
    invoke-static {}, Ll/bp;->j()Z

    .line 255
    .line 256
    .line 257
    move-result p1

    .line 258
    if-eqz p1, :cond_4

    .line 259
    .line 260
    invoke-static {}, Ll/ot40;->e()Ll/ot40;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 265
    .line 266
    check-cast p0, Ll/c170;

    .line 267
    .line 268
    invoke-virtual {p0}, Ll/c170;->R()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    invoke-virtual {p1, p0}, Ll/ot40;->j(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    :cond_4
    return-void
.end method

.method public static synthetic Q0(Ll/e070;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/e070;->p1()V

    return-void
.end method

.method public static synthetic R0(Ll/e070;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e070;->r1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic S0(Lcom/p1/mobile/putong/data/Captcha;)Ljava/lang/Boolean;
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

.method public static synthetic U0(Ll/e070;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/e070;->v1()V

    return-void
.end method

.method public static synthetic V0(Ll/e070;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/e070;->F1()V

    return-void
.end method

.method public static synthetic W0(Ll/e070;Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e070;->z1(Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V

    return-void
.end method

.method public static synthetic X0(Ll/e070;Lcom/p1/mobile/putong/data/Captcha;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e070;->s1(Lcom/p1/mobile/putong/data/Captcha;)V

    return-void
.end method

.method public static synthetic Y0(Ll/e070;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e070;->x1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic a1(Ll/e070;Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e070;->t1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic b1(Ll/e070;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/e070;->E1()V

    return-void
.end method

.method public static synthetic c1(Ll/e070;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e070;->u1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d1(Ll/x20;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    instance-of v1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 3
    .line 4
    if-eqz v1, :cond_0

    .line 5
    .line 6
    move-object v1, p1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 8
    .line 9
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 10
    .line 11
    const v2, 0x9c4b

    .line 12
    .line 13
    .line 14
    if-ne v1, v2, :cond_0

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    iput-boolean v2, v1, Lcom/p1/mobile/putong/account/api/a;->n:Z

    .line 20
    .line 21
    invoke-interface {p0}, Ll/x20;->call()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/api/a;->n:Z

    .line 30
    .line 31
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Ljava/util/HashMap;

    .line 35
    .line 36
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string v1, "Sign up status"

    .line 40
    .line 41
    const-string v2, "Phone number register fail"

    .line 42
    .line 43
    invoke-virtual {p0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    sget-object v1, Ll/x95;->INSTANCE:Ll/x95;

    .line 47
    .line 48
    const-string v2, "Sign Up"

    .line 49
    .line 50
    invoke-virtual {v1, v2, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 55
    .line 56
    iput-boolean v0, v1, Lcom/p1/mobile/putong/account/api/a;->n:Z

    .line 57
    .line 58
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static synthetic e1(Ll/x20;Lcom/p1/mobile/putong/data/AccountErrorResponse;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/api/a;->n:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic f1(Ll/e070;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e070;->q1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g1(Ll/e070;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/e070;->D1(IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic h1(Ll/e070;Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e070;->I1(Lcom/p1/mobile/putong/data/VerifyData;)V

    return-void
.end method

.method public static synthetic i1(Ll/e070;Lcom/p1/mobile/putong/account/data/CaptchaData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e070;->C1(Lcom/p1/mobile/putong/account/data/CaptchaData;)V

    return-void
.end method

.method public static synthetic j1(Ll/e070;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e070;->B1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k1(Ll/e070;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e070;->H1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic l1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static n1(Ljava/lang/String;Z)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

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
    if-nez p1, :cond_1

    .line 11
    .line 12
    const-string p1, "^[0-9]*$"

    .line 13
    .line 14
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    const/16 v0, 0xb

    .line 32
    .line 33
    if-eq p1, v0, :cond_2

    .line 34
    .line 35
    return v2

    .line 36
    :cond_2
    const-string p1, "^1[0-9]{10}$"

    .line 37
    .line 38
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0
.end method

.method private synthetic p1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/c170;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/c170;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic q1(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    new-instance p1, Ll/b070;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/b070;-><init>(Ll/e070;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final synthetic B1(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object v1, p1

    .line 9
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 10
    .line 11
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 12
    .line 13
    const v2, 0x62639

    .line 14
    .line 15
    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/e070;->L1()V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    if-eqz v0, :cond_1

    .line 23
    .line 24
    move-object v0, p1

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 26
    .line 27
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 28
    .line 29
    const v1, 0x6263b

    .line 30
    .line 31
    .line 32
    if-ne v0, v1, :cond_1

    .line 33
    .line 34
    sget-object p1, Ll/olj;->INSTANCE:Ll/olj;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1, v0}, Ll/olj;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast v0, Ll/c170;

    .line 47
    .line 48
    const-string v1, "send_code"

    .line 49
    .line 50
    invoke-virtual {v0, p1, v1}, Ll/c170;->G0(Ljava/lang/Throwable;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    invoke-static {p1}, Ll/tf;->b(Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    new-instance p1, Ljava/util/HashMap;

    .line 60
    .line 61
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string v0, "Sign up status"

    .line 65
    .line 66
    const-string v1, "Phone number register fail"

    .line 67
    .line 68
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 72
    .line 73
    const-string v1, "Sign Up"

    .line 74
    .line 75
    invoke-virtual {v0, v1, p1}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 79
    .line 80
    check-cast p0, Ll/c170;

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/c170;->K0()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final synthetic C1(Lcom/p1/mobile/putong/account/data/CaptchaData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e070;->f:Lcom/p1/mobile/putong/account/data/CaptchaData;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/c170;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/c170;->E0(Lcom/p1/mobile/putong/account/data/CaptchaData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic D1(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    const/4 p1, -0x1

    .line 2
    if-ne p2, p1, :cond_3

    .line 3
    .line 4
    const-string p1, "back_reason"

    .line 5
    .line 6
    invoke-virtual {p3, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_3

    .line 11
    .line 12
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/e070;->e:Ljava/lang/String;

    .line 17
    .line 18
    const-string p2, "show_captcha"

    .line 19
    .line 20
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/e070;->L1()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string p1, "change_number"

    .line 31
    .line 32
    iget-object p2, p0, Ll/e070;->e:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const-string p1, "password_login"

    .line 42
    .line 43
    iget-object p2, p0, Ll/e070;->e:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast p0, Ll/c170;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/c170;->H0()V

    .line 56
    .line 57
    .line 58
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 59
    return p0

    .line 60
    :cond_3
    const/4 p0, 0x0

    .line 61
    return p0
.end method

.method public final synthetic E1()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v2, Ll/c170;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/c170;->P()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast v3, Ll/c170;

    .line 20
    .line 21
    invoke-virtual {v3}, Ll/c170;->R()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    const/4 v4, 0x1

    .line 26
    invoke-static {v1, v2, v3, v4}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/VerifyCodeAct;->Z1(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;I)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ll/qz60;

    .line 31
    .line 32
    invoke-direct {v2, p0}, Ll/qz60;-><init>(Ll/e070;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic F1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/c170;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/c170;->K0()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/c170;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/c170;->S()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/bp;->j()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-static {}, Ll/ot40;->e()Ll/ot40;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast p0, Ll/c170;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/c170;->R()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Ll/ot40;->j(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    new-instance p0, Ljava/util/HashMap;

    .line 48
    .line 49
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v0, "Method used"

    .line 53
    .line 54
    const-string v1, "Phone"

    .line 55
    .line 56
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    const-string v0, "Status"

    .line 60
    .line 61
    const-string v1, "Success"

    .line 62
    .line 63
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 67
    .line 68
    invoke-static {v0}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "Version"

    .line 73
    .line 74
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 78
    .line 79
    const-string v1, "Login"

    .line 80
    .line 81
    invoke-virtual {v0, v1, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final synthetic H1(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    const-string v0, "newDevice"

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "e_password_verifypage_wrong_tips"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    const-string v0, "suspicious"

    .line 30
    .line 31
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/e070;->L1()V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p0, Ll/c170;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/c170;->M0()V

    .line 45
    .line 46
    .line 47
    new-instance p0, Ljava/util/HashMap;

    .line 48
    .line 49
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v0, "inActivated"

    .line 53
    .line 54
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    const-string p1, "Method used"

    .line 61
    .line 62
    const-string v0, "Phone"

    .line 63
    .line 64
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    const-string p1, "Status"

    .line 68
    .line 69
    const-string v0, "Failure"

    .line 70
    .line 71
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 75
    .line 76
    invoke-static {p1}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    const-string v0, "Version"

    .line 81
    .line 82
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 86
    .line 87
    const-string v0, "Login"

    .line 88
    .line 89
    invoke-virtual {p1, v0, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 90
    .line 91
    .line 92
    :cond_2
    return-void
.end method

.method public J1(Lcom/p1/mobile/putong/data/Captcha;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/VerifyData;->new_()Lcom/p1/mobile/putong/data/VerifyData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "signup_signin"

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 18
    .line 19
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v1, Ll/c170;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/c170;->P()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 28
    .line 29
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v1, Ll/c170;

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/c170;->R()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 38
    .line 39
    const/4 v1, 0x4

    .line 40
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 41
    .line 42
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast v1, Ll/c170;

    .line 45
    .line 46
    invoke-virtual {v1}, Ll/c170;->Y()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    iget-object v1, p0, Ll/e070;->f:Lcom/p1/mobile/putong/account/data/CaptchaData;

    .line 53
    .line 54
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_0

    .line 59
    .line 60
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 61
    .line 62
    move-object v2, v1

    .line 63
    check-cast v2, Ll/c170;

    .line 64
    .line 65
    iget-boolean v2, v2, Ll/c170;->F:Z

    .line 66
    .line 67
    if-eqz v2, :cond_0

    .line 68
    .line 69
    iget-object v2, p0, Ll/e070;->f:Lcom/p1/mobile/putong/account/data/CaptchaData;

    .line 70
    .line 71
    iget-object v2, v2, Lcom/p1/mobile/putong/account/data/CaptchaData;->token:Ljava/lang/String;

    .line 72
    .line 73
    iput-object v2, v0, Lcom/p1/mobile/putong/data/VerifyData;->captchaToken:Ljava/lang/String;

    .line 74
    .line 75
    check-cast v1, Ll/c170;

    .line 76
    .line 77
    invoke-virtual {v1}, Ll/c170;->O()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->captchaValue:Ljava/lang/String;

    .line 82
    .line 83
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_1

    .line 88
    .line 89
    iput-object p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 90
    .line 91
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 92
    .line 93
    check-cast p1, Ll/c170;

    .line 94
    .line 95
    invoke-virtual {p1}, Ll/c170;->J0()V

    .line 96
    .line 97
    .line 98
    iget-object p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 99
    .line 100
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 104
    .line 105
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/api/a;->b2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    new-instance v1, Ll/zz60;

    .line 110
    .line 111
    invoke-direct {v1, p0, v0}, Ll/zz60;-><init>(Ll/e070;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 112
    .line 113
    .line 114
    new-instance v0, Ll/a070;

    .line 115
    .line 116
    invoke-direct {v0, p0}, Ll/a070;-><init>(Ll/e070;)V

    .line 117
    .line 118
    .line 119
    const/4 p0, 0x0

    .line 120
    invoke-static {v1, v0, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public L1()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->W0()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/c070;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/c070;-><init>(Ll/e070;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/d070;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/d070;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public N1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/c170;

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
    check-cast v1, Ll/c170;

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
    check-cast v2, Ll/c170;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/c170;->P()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast p0, Ll/c170;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/c170;->R()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v1, v2, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberVerifyAct;->X1(Landroid/content/Context;ILjava/lang/String;)Landroid/content/Intent;

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

.method public O1()V
    .locals 1

    .line 1
    new-instance v0, Ll/lz60;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lz60;-><init>(Ll/e070;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public P1()V
    .locals 4

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
    check-cast v2, Ll/c170;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/c170;->P()I

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
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast v2, Ll/c170;

    .line 30
    .line 31
    invoke-virtual {v2}, Ll/c170;->R()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast v1, Ll/c170;

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/c170;->Q()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 53
    .line 54
    const-string v1, "password"

    .line 55
    .line 56
    invoke-static {v1}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 61
    .line 62
    new-instance v1, Lcom/p1/mobile/putong/data/Device;

    .line 63
    .line 64
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 68
    .line 69
    invoke-static {}, Ll/tl8;->N()Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 74
    .line 75
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 76
    .line 77
    check-cast v1, Ll/c170;

    .line 78
    .line 79
    invoke-virtual {v1}, Ll/c170;->J0()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    sget v2, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 89
    .line 90
    .line 91
    new-instance v1, Ll/rz60;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/rz60;-><init>(Ll/e070;)V

    .line 94
    .line 95
    .line 96
    new-instance v2, Ll/sz60;

    .line 97
    .line 98
    invoke-direct {v2, p0}, Ll/sz60;-><init>(Ll/e070;)V

    .line 99
    .line 100
    .line 101
    const/4 v3, 0x1

    .line 102
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/ibf0;->L0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;Z)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public Q1(ILjava/lang/String;Ll/x20;Ll/x20;)V
    .locals 1

    .line 1
    new-instance p3, Lcom/p1/mobile/putong/data/VerifyData;

    .line 2
    .line 3
    invoke-direct {p3}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p3, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "signup"

    .line 13
    .line 14
    invoke-static {v0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p3, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 19
    .line 20
    iput p1, p3, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 21
    .line 22
    iput-object p2, p3, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 23
    .line 24
    const/4 p1, 0x4

    .line 25
    iput p1, p3, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 26
    .line 27
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 28
    .line 29
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/account/api/a;->E2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance p1, Ll/tz60;

    .line 38
    .line 39
    invoke-direct {p1, p4}, Ll/tz60;-><init>(Ll/x20;)V

    .line 40
    .line 41
    .line 42
    new-instance p2, Ll/vz60;

    .line 43
    .line 44
    invoke-direct {p2, p4}, Ll/vz60;-><init>(Ll/x20;)V

    .line 45
    .line 46
    .line 47
    const/4 p3, 0x0

    .line 48
    invoke-static {p1, p2, p3}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ibf0;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jz60;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/jz60;-><init>(Ll/e070;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/uz60;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/uz60;-><init>(Ll/e070;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

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
    new-instance v1, Ll/wz60;

    .line 43
    .line 44
    invoke-direct {v1}, Ll/wz60;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/xz60;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/xz60;-><init>(Ll/e070;)V

    .line 54
    .line 55
    .line 56
    new-instance p0, Ll/yz60;

    .line 57
    .line 58
    invoke-direct {p0}, Ll/yz60;-><init>()V

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

.method public o1()Z
    .locals 1

    .line 1
    const-string v0, "verify_code_login"

    .line 2
    .line 3
    iget-object p0, p0, Ll/e070;->e:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic r1(Lcom/p1/mobile/android/app/c;)V
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
    check-cast p0, Ll/c170;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/c170;->L0()V

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
    check-cast p0, Ll/c170;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/c170;->B0()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public final synthetic s1(Lcom/p1/mobile/putong/data/Captcha;)V
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
    invoke-virtual {p0, p1}, Ll/e070;->J1(Lcom/p1/mobile/putong/data/Captcha;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic t1(Lcom/p1/mobile/putong/data/VerifyData;Ll/uxj0;)V
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
    check-cast p2, Ll/c170;

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/c170;->K0()V

    .line 13
    .line 14
    .line 15
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 16
    .line 17
    const-string v0, "ttt-signup"

    .line 18
    .line 19
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ibf0;->r0()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast v0, Ll/c170;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-static {v0, p1, v1, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->c2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyData;ZZ)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic u1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/c170;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/c170;->K0()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic v1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/c170;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/c170;->K0()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/c170;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/c170;->S()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic x1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/c170;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/c170;->K0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic z1(Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/c170;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/c170;->K0()V

    .line 6
    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    iget-boolean v0, p2, Lcom/p1/mobile/account_core/reponse_data/RiskVerification;->required:Z

    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/kz60;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/kz60;-><init>(Ll/e070;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, p2, p1, v1}, Ll/fdd0;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;Lcom/p1/mobile/putong/data/VerifyData;Ll/fdd0$a;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/c170;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/c170;->x0()V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method
