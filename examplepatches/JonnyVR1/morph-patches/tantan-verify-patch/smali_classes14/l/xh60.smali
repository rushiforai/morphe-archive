.class public Ll/xh60;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/bi60;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/VerifyData;

.field public b:Z

.field public c:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/xh60;->c:Ljava/lang/Runnable;

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e0(Ll/xh60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xh60;->q0()V

    return-void
.end method

.method public static synthetic f0(Ll/xh60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xh60;->p0()V

    return-void
.end method

.method public static synthetic g0(Ll/xh60;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xh60;->s0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ll/xh60;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xh60;->n0(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic i0(Ll/xh60;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xh60;->o0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic j0(Ll/xh60;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xh60;->r0(Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic k0(Ll/xh60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xh60;->m0()V

    return-void
.end method

.method private synthetic m0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bi60;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bi60;->m()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic o0(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/xh60;->b:Z

    .line 3
    .line 4
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const/16 v0, 0x1a

    .line 7
    .line 8
    if-lt p1, v0, :cond_0

    .line 9
    .line 10
    const-string p1, "samsung"

    .line 11
    .line 12
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const-string p1, "SM-G950F"

    .line 21
    .line 22
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Ll/sh60;

    .line 31
    .line 32
    invoke-direct {p1, p0}, Ll/sh60;-><init>(Ll/xh60;)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Ll/xh60;->c:Ljava/lang/Runnable;

    .line 36
    .line 37
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p1, Ll/bi60;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/bi60;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object v0, p0, Ll/xh60;->c:Ljava/lang/Runnable;

    .line 46
    .line 47
    const-wide/16 v1, 0x64

    .line 48
    .line 49
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 53
    .line 54
    check-cast p1, Ll/bi60;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/bi60;->l()Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance v0, Ll/th60;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Ll/th60;-><init>(Ll/xh60;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 73
    .line 74
    check-cast p0, Ll/bi60;

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/bi60;->r()V

    .line 77
    .line 78
    .line 79
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/qh60;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qh60;-><init>(Ll/xh60;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/rh60;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/rh60;-><init>(Ll/xh60;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xh60;->a:Lcom/p1/mobile/putong/data/VerifyData;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic n0(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/xh60;->b:Z

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
    iput-boolean v1, p0, Ll/xh60;->b:Z

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/bi60;

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/4 v0, 0x6

    .line 27
    if-lt p1, v0, :cond_1

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    :cond_1
    invoke-virtual {p0, v1}, Ll/bi60;->f(Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic p0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/bi60;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/bi60;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/xh60;->c:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic q0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bi60;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bi60;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic r0(Ljava/lang/String;Ll/uxj0;)V
    .locals 6

    .line 1
    const-string p2, "signin_type"

    .line 2
    .line 3
    const-string v0, "reset_password"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object v0, p0, Ll/xh60;->a:Lcom/p1/mobile/putong/data/VerifyData;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "phone_num"

    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    const-string v0, "e_signin_success"

    .line 24
    .line 25
    const-string v1, ""

    .line 26
    .line 27
    invoke-static {v0, v1, p2}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    const/4 p2, 0x0

    .line 31
    new-array v0, p2, [Ljava/lang/Object;

    .line 32
    .line 33
    const-string v1, "signin"

    .line 34
    .line 35
    invoke-static {v1, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/xh60;->a:Lcom/p1/mobile/putong/data/VerifyData;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    invoke-static {}, Ll/qsf0;->d()Ll/qsf0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Ll/qsf0;->e()Lrx/subjects/a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Landroid/util/Pair;

    .line 63
    .line 64
    iget-object v2, p0, Ll/xh60;->a:Lcom/p1/mobile/putong/data/VerifyData;

    .line 65
    .line 66
    iget v2, v2, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 67
    .line 68
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iget-object v3, p0, Ll/xh60;->a:Lcom/p1/mobile/putong/data/VerifyData;

    .line 73
    .line 74
    iget-object v3, v3, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 75
    .line 76
    const/4 v4, 0x3

    .line 77
    new-array v4, v4, [Ljava/lang/CharSequence;

    .line 78
    .line 79
    aput-object v2, v4, p2

    .line 80
    .line 81
    const-string v2, " "

    .line 82
    .line 83
    const/4 v5, 0x1

    .line 84
    aput-object v2, v4, v5

    .line 85
    .line 86
    const/4 v2, 0x2

    .line 87
    aput-object v3, v4, v2

    .line 88
    .line 89
    invoke-static {v4}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-direct {v1, v2, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 104
    .line 105
    const-string v0, "user.reset_password.signin"

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/api/a;->X1(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 111
    .line 112
    check-cast p1, Ll/bi60;

    .line 113
    .line 114
    invoke-virtual {p1}, Ll/bi60;->act()Lcom/p1/mobile/android/app/Act;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 119
    .line 120
    .line 121
    sget p1, Lcom/p1/mobile/putong/account/R$string;->Y2:I

    .line 122
    .line 123
    sget v0, Lcom/p1/mobile/putong/account/R$string;->Z2:I

    .line 124
    .line 125
    invoke-static {p1, v0}, Ll/lu6;->b(II)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-static {p1, p2}, Ll/o1j0;->A(Ljava/lang/String;Z)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 133
    .line 134
    check-cast p1, Ll/bi60;

    .line 135
    .line 136
    invoke-virtual {p1}, Ll/bi60;->act()Lcom/p1/mobile/android/app/Act;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-static {p1}, Ll/cp;->e(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 149
    .line 150
    .line 151
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 152
    .line 153
    check-cast p2, Ll/bi60;

    .line 154
    .line 155
    invoke-virtual {p2}, Ll/bi60;->act()Lcom/p1/mobile/android/app/Act;

    .line 156
    .line 157
    .line 158
    move-result-object p2

    .line 159
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 160
    .line 161
    .line 162
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 163
    .line 164
    check-cast p1, Ll/bi60;

    .line 165
    .line 166
    invoke-virtual {p1}, Ll/bi60;->act()Lcom/p1/mobile/android/app/Act;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 171
    .line 172
    .line 173
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 174
    .line 175
    check-cast p0, Ll/bi60;

    .line 176
    .line 177
    invoke-virtual {p0}, Ll/bi60;->act()Lcom/p1/mobile/android/app/Act;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 182
    .line 183
    .line 184
    return-void
.end method

.method public final synthetic s0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bi60;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bi60;->act()Lcom/p1/mobile/android/app/Act;

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

.method public t0(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/bi60;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/bi60;->act()Lcom/p1/mobile/android/app/Act;

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
    new-instance v0, Lcom/p1/mobile/putong/data/ForgetPasswordData;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/ForgetPasswordData;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/xh60;->a:Lcom/p1/mobile/putong/data/VerifyData;

    .line 20
    .line 21
    iget v2, v1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 22
    .line 23
    iput v2, v0, Lcom/p1/mobile/putong/data/ForgetPasswordData;->code:I

    .line 24
    .line 25
    iget v2, v1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 26
    .line 27
    iput v2, v0, Lcom/p1/mobile/putong/data/ForgetPasswordData;->countryCode:I

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/data/ForgetPasswordData;->mobileNumber:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p1, v0, Lcom/p1/mobile/putong/data/ForgetPasswordData;->new_:Ljava/lang/String;

    .line 34
    .line 35
    new-instance v1, Ll/uh60;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/uh60;-><init>(Ll/xh60;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/account/api/a;->U0(Lcom/p1/mobile/putong/data/ForgetPasswordData;Ljava/lang/Runnable;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/vh60;

    .line 45
    .line 46
    invoke-direct {v1, p0, p1}, Ll/vh60;-><init>(Ll/xh60;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    new-instance p1, Ll/wh60;

    .line 50
    .line 51
    invoke-direct {p1, p0}, Ll/wh60;-><init>(Ll/xh60;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method
