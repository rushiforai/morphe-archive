.class public Ll/if40;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/mf40;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

.field public b:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/if40;->b:Z

    .line 6
    .line 7
    return-void
.end method

.method private U0(Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/if40;->V0(Ljava/lang/Runnable;Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private X0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/joa;->M3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 32
    .line 33
    iget-object v1, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/ina;->R3(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance v0, Ll/ve40;

    .line 44
    .line 45
    invoke-direct {v0}, Ll/ve40;-><init>()V

    .line 46
    .line 47
    .line 48
    new-instance v1, Ll/we40;

    .line 49
    .line 50
    invoke-direct {v1}, Ll/we40;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public static synthetic e0(Ll/if40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/if40;->D0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f0(Ll/if40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/if40;->A0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g0(Ll/if40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/if40;->F0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h0(Ll/if40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/if40;->N0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Ll/if40;Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/if40;->z0(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)V

    return-void
.end method

.method public static synthetic j0(Ll/if40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/if40;->J0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k0(Ll/if40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/if40;->H0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l0(Ll/if40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/if40;->G0()V

    return-void
.end method

.method public static synthetic m0(Ll/if40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/if40;->C0()V

    return-void
.end method

.method public static synthetic n0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o0(Ll/if40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/if40;->L0()V

    return-void
.end method

.method public static synthetic p0(Ll/if40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/if40;->I0()V

    return-void
.end method

.method public static synthetic q0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r0(Ll/if40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/if40;->E0()V

    return-void
.end method


# virtual methods
.method public final synthetic A0(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p1, Ll/hf40;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/hf40;-><init>(Ll/if40;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "hide_svip"

    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, Ll/if40;->U0(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic C0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideIcon:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->U9()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    const-string v0, "new_privacy_presenter"

    .line 34
    .line 35
    invoke-static {v0}, Ll/wj90;->a(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->Q3:I

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast p0, Ll/mf40;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/mf40;->k()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final synthetic D0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/mf40;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/mf40;->l()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/mf40;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/mf40;->q()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p1, "privacy_type"

    .line 17
    .line 18
    const-string v0, "freeze_activetime"

    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    filled-new-array {p1}, [Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v0, "e_privacy"

    .line 29
    .line 30
    invoke-static {v0, p0, p1}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic E0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

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
    iget-object v0, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->frozenActivity:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ll/th0$a;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->O3:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->M3:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->N3:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/ye40;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/ye40;-><init>(Ll/if40;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 64
    .line 65
    check-cast v0, Ll/mf40;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/mf40;->x()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const-string v1, "privacy_type"

    .line 72
    .line 73
    const-string v2, "freeze_activetime"

    .line 74
    .line 75
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    filled-new-array {v1}, [Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const-string v2, "e_privacy"

    .line 84
    .line 85
    invoke-static {v2, v0, v1}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 89
    .line 90
    check-cast p0, Ll/mf40;

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/mf40;->l()V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final synthetic F0(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ll/ff40;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/ff40;-><init>(Ll/if40;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "freeze_activetime"

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, p1, v0, v1}, Ll/if40;->V0(Ljava/lang/Runnable;Ljava/lang/String;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic G0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

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
    iget-object v0, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideAge:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->P3:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p0, Ll/mf40;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/mf40;->m()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic H0(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p1, Ll/gf40;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/gf40;-><init>(Ll/if40;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "hide_age"

    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, Ll/if40;->U0(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic I0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

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
    iget-object v0, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideLocation:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->R3:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p0, Ll/mf40;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/mf40;->n()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic J0(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p1, Ll/df40;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/df40;-><init>(Ll/if40;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "hide_location"

    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, Ll/if40;->U0(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic L0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mf40;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mf40;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic N0(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ll/ef40;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/ef40;-><init>(Ll/if40;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "show_to_mylikes_only"

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, p1, v0, v1}, Ll/if40;->V0(Ljava/lang/Runnable;Ljava/lang/String;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public O0()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/bf40;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bf40;-><init>(Ll/if40;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public P0()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/ze40;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ze40;-><init>(Ll/if40;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public Q0()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/ue40;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ue40;-><init>(Ll/if40;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public R0()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/af40;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/af40;-><init>(Ll/if40;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public S0()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/cf40;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cf40;-><init>(Ll/if40;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final V0(Ljava/lang/Runnable;Ljava/lang/String;Z)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v1, Ll/mf40;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/mf40;->x()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "privacy_type"

    .line 16
    .line 17
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    filled-new-array {v3}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    const-string v4, "e_privacy"

    .line 26
    .line 27
    invoke-static {v4, v1, v3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v1, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 33
    .line 34
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    invoke-static {}, Ll/joa;->M3()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    if-eqz p3, :cond_0

    .line 47
    .line 48
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast p0, Ll/mf40;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/mf40;->x()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    filled-new-array {p2}, [Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-static {v4, p0, p2}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_1

    .line 72
    .line 73
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 74
    .line 75
    .line 76
    :cond_1
    return-void

    .line 77
    :cond_2
    if-eqz v0, :cond_4

    .line 78
    .line 79
    iget-object p1, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 80
    .line 81
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_4

    .line 86
    .line 87
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 88
    .line 89
    check-cast p1, Ll/mf40;

    .line 90
    .line 91
    invoke-virtual {p1}, Ll/mf40;->q()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    const-string p2, "p_setting_privacy_manage"

    .line 96
    .line 97
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_3

    .line 102
    .line 103
    const-string p1, "p_setting_privacy_manage,privacy"

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_3
    const-string p1, "p_home_filter,privacy"

    .line 107
    .line 108
    :goto_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 109
    .line 110
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    sget-object p3, Lcom/p1/mobile/putong/core/data/Privilege;->privacy_membership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 119
    .line 120
    invoke-interface {p2, p0, p1, p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ip(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_4
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->G0:I

    .line 125
    .line 126
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public W0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/if40;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ll/if40;->X0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Y0(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/mf40;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/mf40;->s(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/if40;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public b1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->showMeToMyLike:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public s0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->frozenActivity:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-void
.end method

.method public t0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideAge:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-void
.end method

.method public u0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideLocation:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-void
.end method

.method public x0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideIcon:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-void
.end method

.method public y0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ina;->V3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/xe40;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/xe40;-><init>(Ll/if40;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic z0(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)V
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
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->clone()Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/if40;->a:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/if40;->Y0(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
