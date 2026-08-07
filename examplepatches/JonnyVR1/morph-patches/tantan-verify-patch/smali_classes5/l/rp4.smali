.class public Ll/rp4;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/dq4;",
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

.method public static synthetic f0(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->T3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic g0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 6
    .line 7
    const-string v0, "verified"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic i0(Ll/rp4;Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rp4;->u0(Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;)V

    return-void
.end method

.method public static synthetic j0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k0(Ll/rp4;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rp4;->t0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic t0(Ll/pf60;)V
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
    iput-object v1, p0, Ll/rp4;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

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
    iput-object v0, p0, Ll/rp4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

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
    iput-object v0, p0, Ll/rp4;->c:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

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
    iput-object v0, p0, Ll/rp4;->d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

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
    iput-object p1, p0, Ll/rp4;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 86
    .line 87
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 88
    .line 89
    check-cast p1, Ll/dq4;

    .line 90
    .line 91
    const/4 v0, 0x0

    .line 92
    invoke-virtual {p1, v0}, Ll/dq4;->V(Z)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 96
    .line 97
    check-cast p1, Ll/dq4;

    .line 98
    .line 99
    iget-object v0, p0, Ll/rp4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ll/dq4;->P(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 105
    .line 106
    check-cast p1, Ll/dq4;

    .line 107
    .line 108
    iget-object v0, p0, Ll/rp4;->c:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 109
    .line 110
    iget-object v1, p0, Ll/rp4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 111
    .line 112
    invoke-virtual {p1, v0, v1}, Ll/dq4;->T(Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 116
    .line 117
    check-cast p1, Ll/dq4;

    .line 118
    .line 119
    iget-object v0, p0, Ll/rp4;->d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 120
    .line 121
    iget-object v1, p0, Ll/rp4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 122
    .line 123
    invoke-virtual {p1, v0, v1}, Ll/dq4;->S(Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 127
    .line 128
    check-cast p1, Ll/dq4;

    .line 129
    .line 130
    iget-object v0, p0, Ll/rp4;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 131
    .line 132
    invoke-virtual {p1, v0}, Ll/dq4;->U(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Ll/rp4;->A0()V

    .line 136
    .line 137
    .line 138
    return-void
.end method


# virtual methods
.method public A0()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/rp4;->f:Z

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
    iput-boolean v0, p0, Ll/rp4;->f:Z

    .line 8
    .line 9
    const-string v0, "e_verification_avatar"

    .line 10
    .line 11
    iget-object v1, p0, Ll/rp4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Ll/rp4;->C0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "e_verification_name"

    .line 17
    .line 18
    iget-object v1, p0, Ll/rp4;->c:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 19
    .line 20
    invoke-virtual {p0, v0, v1}, Ll/rp4;->C0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 21
    .line 22
    .line 23
    const-string v0, "e_verification_student"

    .line 24
    .line 25
    iget-object v1, p0, Ll/rp4;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Ll/rp4;->C0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 28
    .line 29
    .line 30
    const-string v0, "e_verification_ctid"

    .line 31
    .line 32
    iget-object v1, p0, Ll/rp4;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Ll/rp4;->C0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final C0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/rp4;->y0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

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
    new-instance v1, Ll/jp4;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/jp4;-><init>(Ll/rp4;)V

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
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/kp4;

    .line 55
    .line 56
    invoke-direct {v1}, Ll/kp4;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/lp4;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/lp4;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/mp4;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/mp4;-><init>(Ll/rp4;)V

    .line 79
    .line 80
    .line 81
    new-instance v2, Ll/np4;

    .line 82
    .line 83
    invoke-direct {v2}, Ll/np4;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 91
    .line 92
    .line 93
    new-instance v0, Ll/op4;

    .line 94
    .line 95
    invoke-direct {v0}, Ll/op4;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v1, Ll/pp4;

    .line 103
    .line 104
    invoke-direct {v1}, Ll/pp4;-><init>()V

    .line 105
    .line 106
    .line 107
    new-instance v2, Ll/qp4;

    .line 108
    .line 109
    invoke-direct {v2}, Ll/qp4;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {p0}, Ll/xc20;->t(Lcom/p1/mobile/android/app/Act;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final m0()Ljava/lang/String;
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
    const-string v0, "tip_type"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;->valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;->INVITE:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 24
    .line 25
    if-ne p0, v0, :cond_1

    .line 26
    .line 27
    const-string p0, "invite_verify"

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;->ONLY_CERT:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 31
    .line 32
    if-ne p0, v0, :cond_2

    .line 33
    .line 34
    const-string p0, "trial_like"

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;->SWIPE_LIMIT:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 38
    .line 39
    if-ne p0, v0, :cond_3

    .line 40
    .line 41
    const-string p0, "like_limit"

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_3
    const-string p0, "unverified_default"

    .line 45
    .line 46
    return-object p0
.end method

.method public n0()V
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
    iget-object v1, p0, Ll/rp4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Ll/rp4;->z0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public o0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rp4;->d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

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
    iget-object v0, p0, Ll/rp4;->d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

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
    iget-object v0, p0, Ll/rp4;->d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

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
    iget-object v0, p0, Ll/rp4;->d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

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
    iget-object v0, p0, Ll/rp4;->d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

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
    iget-object v1, p0, Ll/rp4;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 69
    .line 70
    invoke-virtual {p0, v0, v1}, Ll/rp4;->z0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public p0()V
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
    iget-object v1, p0, Ll/rp4;->c:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Ll/rp4;->z0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public q0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->E2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v1, "setting"

    .line 16
    .line 17
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/settings/privacy/PrivacySettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-class v2, Lcom/p1/mobile/putong/core/newui/container/NewUI1ContainerActivity;

    .line 32
    .line 33
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 34
    .line 35
    .line 36
    const-class v1, Lcom/p1/mobile/putong/core/ui/settings/SettingsFragOld;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "fragmentName"

    .line 43
    .line 44
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public r0(I)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->more_swipe:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->priority_recommend:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->cert_logo:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->high_privacy_setting:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->only_look_cert:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/sq4;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-direct {v1, v2, p1, v0}, Ll/sq4;-><init>(Lcom/p1/mobile/android/app/Act;ILjava/util/List;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ll/q27;->show()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/rp4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 32
    .line 33
    const-string v1, "verified"

    .line 34
    .line 35
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    const-string p0, "pass"

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-string p0, "invalidation"

    .line 45
    .line 46
    :goto_0
    const-string v1, "verfication_state"

    .line 47
    .line 48
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->getTrackName()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string v0, "privilege_name"

    .line 63
    .line 64
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p1, "e_verify_privilege"

    .line 73
    .line 74
    const-string v0, "p_verification"

    .line 75
    .line 76
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public s0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rp4;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

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
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    const-string v1, "pending"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const/4 v2, 0x0

    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-static {v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->X1(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    const-string v0, "e_verification_student"

    .line 39
    .line 40
    iget-object v1, p0, Ll/rp4;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 41
    .line 42
    invoke-virtual {p0, v0, v1}, Ll/rp4;->z0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic u0(Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/dq4;

    .line 4
    .line 5
    iget v0, p1, Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;->exSwipeRight:I

    .line 6
    .line 7
    iget v1, p1, Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;->priorityRecommend:I

    .line 8
    .line 9
    iget p1, p1, Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;->seeVerifyCount:I

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1, p1}, Ll/dq4;->R(III)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public x0(Ljava/lang/String;)V
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
    iget-object p1, p0, Ll/rp4;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

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
    iput-object p1, p0, Ll/rp4;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

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
    iget-object p1, p0, Ll/rp4;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

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
    iget-object p0, p0, Ll/rp4;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

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

.method public final y0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;Z)V
    .locals 7

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
    const-string v2, "default"

    .line 8
    .line 9
    const-string v3, "waitting"

    .line 10
    .line 11
    const-string v4, "pending"

    .line 12
    .line 13
    const-string v5, "succeed"

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    move-object v1, v5

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string v1, "rejected"

    .line 20
    .line 21
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    const-string v1, "fail"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-static {p2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    move-object v1, v3

    .line 37
    goto :goto_0

    .line 38
    :cond_2
    const-string v1, "invalid"

    .line 39
    .line 40
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_3

    .line 45
    .line 46
    const-string v1, "invalidation"

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_3
    move-object v1, v2

    .line 50
    :goto_0
    const-string v6, "e_verification_name"

    .line 51
    .line 52
    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    if-eqz v6, :cond_6

    .line 57
    .line 58
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-eqz p2, :cond_6

    .line 63
    .line 64
    iget-object p2, p0, Ll/rp4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 65
    .line 66
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    if-eqz p2, :cond_4

    .line 71
    .line 72
    move-object v3, v5

    .line 73
    goto :goto_1

    .line 74
    :cond_4
    iget-object p2, p0, Ll/rp4;->b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 75
    .line 76
    invoke-static {p2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    if-eqz p2, :cond_5

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_5
    const-string v3, "Pending"

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_6
    move-object v3, v1

    .line 87
    :goto_1
    new-instance p2, Ljava/util/HashMap;

    .line 88
    .line 89
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 90
    .line 91
    .line 92
    const-string v0, "verification_button_state"

    .line 93
    .line 94
    invoke-virtual {p2, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    const-string v0, "e_verification_avatar"

    .line 98
    .line 99
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_9

    .line 104
    .line 105
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFakeUser()Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-nez v1, :cond_7

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    const-string v1, "LOW_FACE_MARK"

    .line 124
    .line 125
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_8

    .line 134
    .line 135
    :cond_7
    const-string v2, "image_quality"

    .line 136
    .line 137
    :cond_8
    const-string v0, "photo_status"

    .line 138
    .line 139
    invoke-virtual {p2, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    invoke-static {}, Ll/gra;->p2()Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-eqz v0, :cond_9

    .line 147
    .line 148
    const-string v0, "verification_guidance_status"

    .line 149
    .line 150
    invoke-virtual {p0}, Ll/rp4;->m0()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p2, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    :cond_9
    const-string p0, "p_verification"

    .line 158
    .line 159
    if-eqz p3, :cond_a

    .line 160
    .line 161
    invoke-static {p1, p0, p2}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :cond_a
    invoke-static {p1, p0, p2}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public final z0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/rp4;->y0(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerificationStatus;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
