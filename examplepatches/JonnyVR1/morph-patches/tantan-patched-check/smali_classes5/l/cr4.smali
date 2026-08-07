.class public Ll/cr4;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/hr4;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

.field public b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

.field public c:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

.field public d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

.field public e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

.field public f:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0()Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/d0;->p4(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Ll/cr4;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cr4;->m0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic h0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic m0(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 5
    .line 6
    iput-object v1, p0, Ll/cr4;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 33
    .line 34
    iput-object v0, p0, Ll/cr4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 35
    .line 36
    :cond_0
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 55
    .line 56
    iput-object v0, p0, Ll/cr4;->c:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 57
    .line 58
    :cond_1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 77
    .line 78
    iput-object v0, p0, Ll/cr4;->d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 79
    .line 80
    :cond_2
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 81
    .line 82
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 83
    .line 84
    const/4 p1, 0x0

    .line 85
    iput-object p1, p0, Ll/cr4;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 86
    .line 87
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 88
    .line 89
    check-cast p1, Ll/hr4;

    .line 90
    .line 91
    const/4 v0, 0x0

    .line 92
    invoke-virtual {p1, v0}, Ll/hr4;->v(Z)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 96
    .line 97
    check-cast p1, Ll/hr4;

    .line 98
    .line 99
    iget-object v0, p0, Ll/cr4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ll/hr4;->n(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 105
    .line 106
    check-cast p1, Ll/hr4;

    .line 107
    .line 108
    iget-object v0, p0, Ll/cr4;->c:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 109
    .line 110
    iget-object v1, p0, Ll/cr4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 111
    .line 112
    invoke-virtual {p1, v0, v1}, Ll/hr4;->q(Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 116
    .line 117
    check-cast p1, Ll/hr4;

    .line 118
    .line 119
    iget-object v0, p0, Ll/cr4;->d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 120
    .line 121
    iget-object v1, p0, Ll/cr4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 122
    .line 123
    invoke-virtual {p1, v0, v1}, Ll/hr4;->p(Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 127
    .line 128
    check-cast p1, Ll/hr4;

    .line 129
    .line 130
    iget-object v0, p0, Ll/cr4;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 131
    .line 132
    invoke-virtual {p1, v0}, Ll/hr4;->s(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Ll/cr4;->q0()V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method private o0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;Z)V
    .locals 6

    .line 1
    const-string v0, "verified"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const-string v2, "waitting"

    .line 8
    .line 9
    const-string v3, "pending"

    .line 10
    .line 11
    const-string v4, "succeed"

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    move-object v1, v4

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string v1, "rejected"

    .line 18
    .line 19
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    const-string v1, "fail"

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    move-object v1, v2

    .line 35
    goto :goto_0

    .line 36
    :cond_2
    const-string v1, "invalid"

    .line 37
    .line 38
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_3

    .line 43
    .line 44
    const-string v1, "invalidation"

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    const-string v1, "default"

    .line 48
    .line 49
    :goto_0
    const-string v5, "e_verification_name"

    .line 50
    .line 51
    invoke-static {p1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    if-eqz v5, :cond_6

    .line 56
    .line 57
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-eqz p2, :cond_6

    .line 62
    .line 63
    iget-object p2, p0, Ll/cr4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 64
    .line 65
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_4

    .line 70
    .line 71
    move-object v2, v4

    .line 72
    goto :goto_1

    .line 73
    :cond_4
    iget-object p0, p0, Ll/cr4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 74
    .line 75
    invoke-static {p0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-eqz p0, :cond_5

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_5
    const-string v2, "Pending"

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_6
    move-object v2, v1

    .line 86
    :goto_1
    const-string p0, "verification_button_state"

    .line 87
    .line 88
    const-string p2, "p_verification"

    .line 89
    .line 90
    if-eqz p3, :cond_7

    .line 91
    .line 92
    invoke-static {p0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    filled-new-array {p0}, [Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_7
    invoke-static {p0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    filled-new-array {p0}, [Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method private p0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Ll/cr4;->o0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private r0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, p2, v0}, Ll/cr4;->o0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ll/ip4;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/ip4;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/yq4;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/yq4;-><init>(Ll/cr4;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    new-instance v0, Ll/zq4;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/zq4;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/ar4;

    .line 52
    .line 53
    invoke-direct {v1}, Ll/ar4;-><init>()V

    .line 54
    .line 55
    .line 56
    new-instance v2, Ll/br4;

    .line 57
    .line 58
    invoke-direct {v2}, Ll/br4;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {p0}, Ll/xc20;->t(Lcom/p1/mobile/android/app/Act;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/pq4;->o(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "e_verification_avatar"

    .line 9
    .line 10
    iget-object v1, p0, Ll/cr4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 11
    .line 12
    invoke-direct {p0, v0, v1}, Ll/cr4;->p0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public j0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cr4;->d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 2
    .line 3
    const-string v1, "unknown_"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/cr4;->d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 12
    .line 13
    const-string v1, "default"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/cr4;->d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 22
    .line 23
    const-string v1, "rejected"

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Ll/cr4;->d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 32
    .line 33
    const-string v1, "normal"

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Ll/cr4;->d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 42
    .line 43
    const-string v1, "invalid"

    .line 44
    .line 45
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    const-string v1, "verification_center"

    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/pq4;->k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    const-string v0, "e_verification_ctid"

    .line 67
    .line 68
    iget-object v1, p0, Ll/cr4;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 69
    .line 70
    invoke-direct {p0, v0, v1}, Ll/cr4;->p0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public k0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/pq4;->n(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "e_verification_name"

    .line 9
    .line 10
    iget-object v1, p0, Ll/cr4;->c:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 11
    .line 12
    invoke-direct {p0, v0, v1}, Ll/cr4;->p0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public l0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cr4;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v1, "verified"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/cr4;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 14
    .line 15
    const-string v1, "pending"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const/4 v2, 0x0

    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-static {v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->X1(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    const-string v0, "e_verification_student"

    .line 41
    .line 42
    iget-object v1, p0, Ll/cr4;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 43
    .line 44
    invoke-direct {p0, v0, v1}, Ll/cr4;->p0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public n0(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 11
    .line 12
    const-string p1, "raw"

    .line 13
    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 19
    .line 20
    new-instance p1, Ll/sim;

    .line 21
    .line 22
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-direct {p1, v1}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Lcom/p1/mobile/putong/data/Dimension;

    .line 32
    .line 33
    iget-object p1, p1, Ll/sim;->d:[I

    .line 34
    .line 35
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 36
    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 39
    .line 40
    iget-object p1, p0, Ll/cr4;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 41
    .line 42
    if-nez p1, :cond_0

    .line 43
    .line 44
    new-instance p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 45
    .line 46
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/data/VerificationCenter;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Ll/cr4;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 50
    .line 51
    new-instance v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 52
    .line 53
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 57
    .line 58
    :cond_0
    iget-object p1, p0, Ll/cr4;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 61
    .line 62
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const/4 v1, 0x1

    .line 69
    iget-object p0, p0, Ll/cr4;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 70
    .line 71
    const/4 v2, 0x0

    .line 72
    invoke-static {p1, v2, v1, v0, p0}, Ll/zki0;->G(Lcom/p1/mobile/android/app/Act;ZZLcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/core/data/VerificationCenter;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public q0()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/cr4;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/cr4;->f:Z

    .line 8
    .line 9
    const-string v0, "e_verification_avatar"

    .line 10
    .line 11
    iget-object v1, p0, Ll/cr4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 12
    .line 13
    invoke-direct {p0, v0, v1}, Ll/cr4;->r0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "e_verification_name"

    .line 17
    .line 18
    iget-object v1, p0, Ll/cr4;->c:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 19
    .line 20
    invoke-direct {p0, v0, v1}, Ll/cr4;->r0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 21
    .line 22
    .line 23
    const-string v0, "e_verification_student"

    .line 24
    .line 25
    iget-object v1, p0, Ll/cr4;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 26
    .line 27
    invoke-direct {p0, v0, v1}, Ll/cr4;->r0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 28
    .line 29
    .line 30
    const-string v0, "e_verification_ctid"

    .line 31
    .line 32
    iget-object v1, p0, Ll/cr4;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 33
    .line 34
    invoke-direct {p0, v0, v1}, Ll/cr4;->r0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
