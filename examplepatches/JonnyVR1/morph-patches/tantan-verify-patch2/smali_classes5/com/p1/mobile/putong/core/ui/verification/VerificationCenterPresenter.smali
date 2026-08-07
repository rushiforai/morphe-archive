.class public Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter$VerificationType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/core/ui/verification/a;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

.field public b:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

.field public c:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

.field public d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

.field public e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;


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

.method public static synthetic f0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic g0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->q0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->r0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->p0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic k0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/VerificationCenter;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic p0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/vb0;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/core/ui/verification/a;

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/verification/a;->P(Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/core/ui/verification/a;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/verification/a;->P(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic q0(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/ui/verification/a;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/verification/a;->Q(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 42
    .line 43
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast p1, Lcom/p1/mobile/putong/core/ui/verification/a;

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter$VerificationType;->PIC:Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter$VerificationType;

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/verification/a;->O(Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter$VerificationType;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/vb0;->f()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 59
    .line 60
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_1

    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 69
    .line 70
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_1

    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 81
    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 83
    .line 84
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 85
    .line 86
    check-cast p0, Lcom/p1/mobile/putong/core/ui/verification/a;

    .line 87
    .line 88
    sget-object p1, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter$VerificationType;->AGE:Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter$VerificationType;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/verification/a;->O(Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter$VerificationType;)V

    .line 91
    .line 92
    .line 93
    :cond_1
    return-void
.end method

.method private synthetic r0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    sput-boolean p0, Ll/x5l0;->a:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 3

    .line 1
    new-instance v0, Ll/p2l0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/p2l0;-><init>(Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v2, Ll/q2l0;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/q2l0;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/r2l0;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/r2l0;-><init>(Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    new-instance v0, Ll/s2l0;

    .line 51
    .line 52
    invoke-direct {v0}, Ll/s2l0;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/t2l0;

    .line 60
    .line 61
    invoke-direct {v1}, Ll/t2l0;-><init>()V

    .line 62
    .line 63
    .line 64
    new-instance v2, Ll/u2l0;

    .line 65
    .line 66
    invoke-direct {v2}, Ll/u2l0;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/v2l0;

    .line 85
    .line 86
    invoke-direct {v1}, Ll/v2l0;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const/4 v1, 0x1

    .line 94
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/w2l0;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/w2l0;-><init>(Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;)V

    .line 101
    .line 102
    .line 103
    new-instance v2, Ll/x2l0;

    .line 104
    .line 105
    invoke-direct {v2}, Ll/x2l0;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-static {p0}, Ll/xc20;->t(Lcom/p1/mobile/android/app/Act;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public n0()Lcom/p1/mobile/putong/data/StudentVerificationStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->e:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 2
    .line 3
    return-object p0
.end method

.method public o0()Lcom/p1/mobile/putong/data/StudentVerificationStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->d:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 2
    .line 3
    return-object p0
.end method

.method public s0(Ljava/lang/String;)V
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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

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
