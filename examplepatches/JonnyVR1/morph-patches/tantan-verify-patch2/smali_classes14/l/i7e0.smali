.class public Ll/i7e0;
.super Ll/o5e0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/jl80;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    const-string p0, "e_noverify_intention_button2"

    .line 5
    .line 6
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic f(Ljava/lang/String;Ll/jl80;)V
    .locals 1

    .line 1
    const-string v0, "e_noverify_failed_button2"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 7
    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 12
    .line 13
    const-string p1, "cancelVerification"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/d0;->r4(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic g(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Ll/jl80;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    const-string p0, "e_noverify_familiar_button2"

    .line 5
    .line 6
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic i(Ll/jl80;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    const-string p0, "e_noverify_privacy_button2"

    .line 5
    .line 6
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic j(Ll/abe0;Ljava/lang/String;Ll/jl80;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/abe0;->b()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/abe0;->b()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, "other"

    .line 10
    .line 11
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/settings/privacy/PrivacySettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    const-string p0, "e_noverify_familiar_button1"

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic k(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Ll/abe0;Ljava/lang/String;Ll/jl80;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/abe0;->b()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 6
    .line 7
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x1

    .line 14
    const-string v3, "edit_data_button"

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static {v0, v1, v3, v4, v2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "preview_type"

    .line 22
    .line 23
    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/abe0;->b()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    const-string p0, "e_noverify_intention_button1"

    .line 34
    .line 35
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic n(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Ll/abe0;Ljava/lang/String;Ll/jl80;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/abe0;->b()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    :goto_0
    const-string v1, "unknown_"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    const-string v1, "default"

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_1

    .line 46
    .line 47
    const-string v1, "rejected"

    .line 48
    .line 49
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_1

    .line 54
    .line 55
    const-string v1, "normal"

    .line 56
    .line 57
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-nez v1, :cond_1

    .line 62
    .line 63
    const-string v1, "invalid"

    .line 64
    .line 65
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    :cond_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    const-string v0, "verification_center"

    .line 78
    .line 79
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;->b2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    const-string p0, "e_noverify_privacy_button1"

    .line 87
    .line 88
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public static synthetic p(Ll/abe0;Ljava/lang/String;Ll/jl80;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 14
    .line 15
    const-string v2, "pending"

    .line 16
    .line 17
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 26
    .line 27
    const-string v1, "prePending"

    .line 28
    .line 29
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    :cond_0
    const-string p0, "\u8ba4\u8bc1\u5ba1\u6838\u4e2d\uff0c\u8bf7\u8010\u5fc3\u7b49\u5f85\u5ba1\u6838\u901a\u8fc7"

    .line 36
    .line 37
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {p0}, Ll/abe0;->b()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string v0, "tantan://verification/avatar"

    .line 50
    .line 51
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {p0, v0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 56
    .line 57
    .line 58
    :goto_0
    const-string p0, "e_noverify_failed_button1"

    .line 59
    .line 60
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static r(Ll/abe0;Ljava/lang/String;)V
    .locals 4

    .line 1
    const-class v0, Ll/g6e;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_noverify_familiar_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v2, "noverify_source"

    .line 14
    .line 15
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

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
    new-instance p1, Ll/jl80$a;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/abe0;->b()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-direct {p1, v2}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/gra;->z()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    sget v2, Ll/dbc0;->fi:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    sget v2, Ll/dbc0;->qk:I

    .line 45
    .line 46
    :goto_0
    invoke-virtual {p1, v2}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const/4 v2, 0x0

    .line 51
    invoke-virtual {p1, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {}, Ll/gra;->z()Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_1

    .line 60
    .line 61
    sget v3, Ll/dbc0;->R:I

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    const/4 v3, -0x1

    .line 65
    :goto_1
    invoke-virtual {p1, v3}, Ll/jl80$a;->d0(I)Ll/jl80$a;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1, v2}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const-string v2, "\u5c4f\u853d\u53ef\u80fd\u8ba4\u8bc6\u7684\u4eba"

    .line 74
    .line 75
    invoke-virtual {p1, v2}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-string v2, "\u4f60\u53ef\u4ee5\u8bbe\u7f6e\uff1a\n\u5c4f\u853d\u901a\u8baf\u5f55\u597d\u53cb\n\u4e0d\u88ab\u9644\u8fd1\u7684\u4eba\u53d1\u73b0"

    .line 80
    .line 81
    invoke-virtual {p1, v2}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    const-string v2, "\u53bb\u5c4f\u853d\u53ef\u80fd\u8ba4\u8bc6\u7684\u4eba"

    .line 86
    .line 87
    invoke-virtual {p1, v2}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    const-string v2, "\u53d6\u6d88"

    .line 92
    .line 93
    invoke-virtual {p1, v2}, Ll/jl80$a;->W(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1}, Ll/jl80$a;->O()Ll/jl80;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    new-instance v2, Ll/e7e0;

    .line 102
    .line 103
    invoke-direct {v2, p0, v1, p1}, Ll/e7e0;-><init>(Ll/abe0;Ljava/lang/String;Ll/jl80;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, v2}, Ll/jl80;->W(Ljava/lang/Runnable;)V

    .line 107
    .line 108
    .line 109
    new-instance p0, Ll/f7e0;

    .line 110
    .line 111
    invoke-direct {p0, p1, v1}, Ll/f7e0;-><init>(Ll/jl80;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1, p0}, Ll/jl80;->V(Ljava/lang/Runnable;)V

    .line 115
    .line 116
    .line 117
    new-instance p0, Ll/g7e0;

    .line 118
    .line 119
    invoke-direct {p0, v0}, Ll/g7e0;-><init>(Ll/l4g0;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, p0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1}, Ll/jl80;->show()V

    .line 126
    .line 127
    .line 128
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method


# virtual methods
.method public a(Ll/abe0;Ll/z20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gra;->E2()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const-string v0, "\u63d0\u4ea4\u6210\u529f!"

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p1}, Ll/abe0;->g()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-string v1, "/"

    .line 18
    .line 19
    const-string v2, ""

    .line 20
    .line 21
    invoke-virtual {p2, v1, v2}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "source"

    .line 30
    .line 31
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {v2}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    const/4 v4, -0x1

    .line 55
    sparse-switch v3, :sswitch_data_0

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :sswitch_0
    const-string v3, "toast"

    .line 60
    .line 61
    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-nez p2, :cond_1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    const/4 v4, 0x4

    .line 69
    goto :goto_0

    .line 70
    :sswitch_1
    const-string v3, "leak"

    .line 71
    .line 72
    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-nez p2, :cond_2

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    const/4 v4, 0x3

    .line 80
    goto :goto_0

    .line 81
    :sswitch_2
    const-string v3, "editprofile"

    .line 82
    .line 83
    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-nez p2, :cond_3

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_3
    const/4 v4, 0x2

    .line 91
    goto :goto_0

    .line 92
    :sswitch_3
    const-string v3, "contacts"

    .line 93
    .line 94
    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    if-nez p2, :cond_4

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_4
    const/4 v4, 0x1

    .line 102
    goto :goto_0

    .line 103
    :sswitch_4
    const-string v3, "verification"

    .line 104
    .line 105
    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    if-nez p2, :cond_5

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_5
    const/4 v4, 0x0

    .line 113
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 114
    .line 115
    .line 116
    goto :goto_1

    .line 117
    :pswitch_0
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    const-string p1, "noverify_source"

    .line 122
    .line 123
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    filled-new-array {p1}, [Ll/pf60;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    const-string p2, "e_noverify_theft_toast"

    .line 132
    .line 133
    invoke-static {p2, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 134
    .line 135
    .line 136
    :goto_1
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :pswitch_1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 141
    .line 142
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 143
    .line 144
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v3

    .line 152
    if-eqz v3, :cond_6

    .line 153
    .line 154
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 155
    .line 156
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 157
    .line 158
    goto :goto_2

    .line 159
    :cond_6
    const/4 p2, 0x0

    .line 160
    :goto_2
    const-string v3, "unknown_"

    .line 161
    .line 162
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    if-nez v3, :cond_7

    .line 167
    .line 168
    const-string v3, "default"

    .line 169
    .line 170
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    if-nez v3, :cond_7

    .line 175
    .line 176
    const-string v3, "rejected"

    .line 177
    .line 178
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 179
    .line 180
    .line 181
    move-result v3

    .line 182
    if-nez v3, :cond_7

    .line 183
    .line 184
    const-string v3, "normal"

    .line 185
    .line 186
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    if-nez v3, :cond_7

    .line 191
    .line 192
    const-string v3, "invalid"

    .line 193
    .line 194
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 195
    .line 196
    .line 197
    move-result p2

    .line 198
    if-nez p2, :cond_7

    .line 199
    .line 200
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    return-void

    .line 204
    :cond_7
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result p2

    .line 208
    if-eqz p2, :cond_8

    .line 209
    .line 210
    invoke-virtual {p0, p1, v1}, Ll/i7e0;->q(Ll/abe0;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    return-void

    .line 214
    :cond_8
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    return-void

    .line 218
    :pswitch_2
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 219
    .line 220
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 221
    .line 222
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 223
    .line 224
    .line 225
    move-result-object p2

    .line 226
    invoke-static {p2}, Ll/aw90;->T(Lcom/p1/mobile/putong/data/User;)Z

    .line 227
    .line 228
    .line 229
    move-result p2

    .line 230
    if-eqz p2, :cond_9

    .line 231
    .line 232
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    return-void

    .line 236
    :cond_9
    invoke-virtual {p0, p1, v1}, Ll/i7e0;->s(Ll/abe0;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    return-void

    .line 240
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 241
    .line 242
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 243
    .line 244
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 249
    .line 250
    if-eqz p0, :cond_a

    .line 251
    .line 252
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->hideContacts()Ljava/lang/Boolean;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 257
    .line 258
    .line 259
    move-result p0

    .line 260
    if-eqz p0, :cond_a

    .line 261
    .line 262
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    :cond_a
    invoke-static {p1, v1}, Ll/i7e0;->r(Ll/abe0;Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    return-void

    .line 270
    :pswitch_4
    invoke-virtual {p0, p1, v1}, Ll/i7e0;->t(Ll/abe0;Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    return-void

    .line 274
    nop

    .line 275
    :sswitch_data_0
    .sparse-switch
        -0x587a29e5 -> :sswitch_4
        -0x21d29fad -> :sswitch_3
        -0x56ce3a1 -> :sswitch_2
        0x329f63 -> :sswitch_1
        0x6969627 -> :sswitch_0
    .end sparse-switch

    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public c(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final q(Ll/abe0;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-class p0, Ll/g6e;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "p_noverify_privacy_popup"

    .line 8
    .line 9
    invoke-static {v0, p0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v1, "noverify_source"

    .line 14
    .line 15
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    filled-new-array {p2}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p0, p2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    new-instance p2, Landroid/widget/ImageView;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {p2, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V

    .line 37
    .line 38
    .line 39
    sget v1, Ll/dbc0;->rk:I

    .line 40
    .line 41
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 42
    .line 43
    .line 44
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 45
    .line 46
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 47
    .line 48
    .line 49
    new-instance v1, Ll/jl80$a;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-direct {v1, v2}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, p2}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    const/4 v1, 0x0

    .line 63
    invoke-virtual {p2, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p2, v1}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-static {}, Ll/gra;->z()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_0

    .line 76
    .line 77
    sget v1, Ll/dbc0;->R:I

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    const/4 v1, -0x1

    .line 81
    :goto_0
    invoke-virtual {p2, v1}, Ll/jl80$a;->d0(I)Ll/jl80$a;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    const-string v1, "\u62c5\u5fc3\u5e73\u53f0\u9690\u79c1\u6cc4\u9732\uff1f\n\u53bb\u516c\u5b89\u90e8 \u00b7 \u56fd\u5bb6\u5e73\u53f0\u8ba4\u8bc1"

    .line 86
    .line 87
    invoke-virtual {p2, v1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    const-string v1, "\u53bb\u56fd\u5bb6\u5e73\u53f0\u8ba4\u8bc1"

    .line 92
    .line 93
    invoke-virtual {p2, v1}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    const-string v1, "\u53d6\u6d88"

    .line 98
    .line 99
    invoke-virtual {p2, v1}, Ll/jl80$a;->W(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-virtual {p2}, Ll/jl80$a;->O()Ll/jl80;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    new-instance v1, Ll/w6e0;

    .line 108
    .line 109
    invoke-direct {v1, p1, v0, p2}, Ll/w6e0;-><init>(Ll/abe0;Ljava/lang/String;Ll/jl80;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p2, v1}, Ll/jl80;->W(Ljava/lang/Runnable;)V

    .line 113
    .line 114
    .line 115
    new-instance p1, Ll/z6e0;

    .line 116
    .line 117
    invoke-direct {p1, p2, v0}, Ll/z6e0;-><init>(Ll/jl80;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2, p1}, Ll/jl80;->V(Ljava/lang/Runnable;)V

    .line 121
    .line 122
    .line 123
    new-instance p1, Ll/a7e0;

    .line 124
    .line 125
    invoke-direct {p1, p0}, Ll/a7e0;-><init>(Ll/l4g0;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p2, p1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p2}, Ll/jl80;->show()V

    .line 132
    .line 133
    .line 134
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public final s(Ll/abe0;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-class p0, Ll/g6e;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "p_noverify_intention_popup"

    .line 8
    .line 9
    invoke-static {v0, p0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v1, "noverify_source"

    .line 14
    .line 15
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    filled-new-array {p2}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p0, p2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    new-instance p2, Ll/jl80$a;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {p2, v1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/gra;->z()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    sget v1, Ll/dbc0;->gi:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    sget v1, Ll/dbc0;->sk:I

    .line 45
    .line 46
    :goto_0
    invoke-virtual {p2, v1}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-virtual {p2, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p2, v1}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-static {}, Ll/gra;->z()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    sget v1, Ll/dbc0;->R:I

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    const/4 v1, -0x1

    .line 69
    :goto_1
    invoke-virtual {p2, v1}, Ll/jl80$a;->d0(I)Ll/jl80$a;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    const-string v1, "\u8ba9\u6211\u4eec\u591a\u4e86\u89e3\u4f60\u4e00\u70b9"

    .line 74
    .line 75
    invoke-virtual {p2, v1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    const-string v1, "\u5b8c\u5584\u8d44\u6599\u540e\u4f60\u53ef\u4ee5\uff1a\n\u4f18\u5148\u63a8\u8350\u7ed9\u4ed6\u4eba\uff0c\u83b7\u5f97\u66f4\u591a\u559c\u6b22\n\u53d1\u51fa\u66f4\u591a\u559c\u6b22\uff0c\u83b7\u5f97\u66f4\u591a\u914d\u5bf9"

    .line 80
    .line 81
    invoke-virtual {p2, v1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    const-string v1, "\u53bb\u5b8c\u5584\u8d44\u6599"

    .line 86
    .line 87
    invoke-virtual {p2, v1}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    const-string v1, "\u53d6\u6d88"

    .line 92
    .line 93
    invoke-virtual {p2, v1}, Ll/jl80$a;->W(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-virtual {p2}, Ll/jl80$a;->O()Ll/jl80;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    new-instance v1, Ll/h7e0;

    .line 102
    .line 103
    invoke-direct {v1, p1, v0, p2}, Ll/h7e0;-><init>(Ll/abe0;Ljava/lang/String;Ll/jl80;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p2, v1}, Ll/jl80;->W(Ljava/lang/Runnable;)V

    .line 107
    .line 108
    .line 109
    new-instance p1, Ll/x6e0;

    .line 110
    .line 111
    invoke-direct {p1, p2, v0}, Ll/x6e0;-><init>(Ll/jl80;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p2, p1}, Ll/jl80;->V(Ljava/lang/Runnable;)V

    .line 115
    .line 116
    .line 117
    new-instance p1, Ll/y6e0;

    .line 118
    .line 119
    invoke-direct {p1, p0}, Ll/y6e0;-><init>(Ll/l4g0;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p2, p1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p2}, Ll/jl80;->show()V

    .line 126
    .line 127
    .line 128
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public final t(Ll/abe0;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-class p0, Ll/g6e;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "p_noverify_failed_popup"

    .line 8
    .line 9
    invoke-static {v0, p0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v1, "noverify_source"

    .line 14
    .line 15
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    filled-new-array {p2}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p0, p2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    new-instance p2, Ll/jl80$a;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {p2, v1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/gra;->z()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    sget v1, Ll/dbc0;->hi:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    sget v1, Ll/dbc0;->tk:I

    .line 45
    .line 46
    :goto_0
    invoke-virtual {p2, v1}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-virtual {p2, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p2, v1}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-static {}, Ll/gra;->z()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    sget v1, Ll/dbc0;->R:I

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    const/4 v1, -0x1

    .line 69
    :goto_1
    invoke-virtual {p2, v1}, Ll/jl80$a;->d0(I)Ll/jl80$a;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    const-string v1, "\u63d0\u5347\u8ba4\u8bc1\u6210\u529f\u7387"

    .line 74
    .line 75
    invoke-virtual {p2, v1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    const-string v1, "\u4e3b\u5934\u50cf\u4f7f\u7528\u672c\u4eba\u6e05\u6670\u6b63\u9762\u7167\uff0c\n\u9009\u62e9\u5149\u7ebf\u660e\u4eae\u7684\u573a\u666f\u8fdb\u884c\u9762\u90e8\u91c7\u96c6"

    .line 80
    .line 81
    invoke-virtual {p2, v1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    const-string v1, "\u518d\u8bd5\u4e00\u6b21"

    .line 86
    .line 87
    invoke-virtual {p2, v1}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    const-string v1, "\u53d6\u6d88"

    .line 92
    .line 93
    invoke-virtual {p2, v1}, Ll/jl80$a;->W(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-virtual {p2}, Ll/jl80$a;->O()Ll/jl80;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    new-instance v1, Ll/b7e0;

    .line 102
    .line 103
    invoke-direct {v1, p1, v0, p2}, Ll/b7e0;-><init>(Ll/abe0;Ljava/lang/String;Ll/jl80;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p2, v1}, Ll/jl80;->W(Ljava/lang/Runnable;)V

    .line 107
    .line 108
    .line 109
    new-instance p1, Ll/c7e0;

    .line 110
    .line 111
    invoke-direct {p1, v0, p2}, Ll/c7e0;-><init>(Ljava/lang/String;Ll/jl80;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p2, p1}, Ll/jl80;->V(Ljava/lang/Runnable;)V

    .line 115
    .line 116
    .line 117
    new-instance p1, Ll/d7e0;

    .line 118
    .line 119
    invoke-direct {p1, p0}, Ll/d7e0;-><init>(Ll/l4g0;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p2, p1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p2}, Ll/jl80;->show()V

    .line 126
    .line 127
    .line 128
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method
