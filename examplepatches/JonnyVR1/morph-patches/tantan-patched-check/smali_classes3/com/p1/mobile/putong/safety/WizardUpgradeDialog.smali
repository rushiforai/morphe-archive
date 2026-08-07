.class public Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/data/SafetyModeConfig;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H0(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->P0()V

    return-void
.end method

.method public static synthetic I0(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->V0()V

    return-void
.end method

.method public static synthetic J0(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->U0()V

    return-void
.end method

.method public static synthetic K0(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;Ll/vx0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->X0(Ll/vx0;)V

    return-void
.end method

.method public static synthetic L0(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;Ll/vx0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->T0(Ll/vx0;)V

    return-void
.end method

.method public static synthetic N0(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->R0()V

    return-void
.end method

.method public static synthetic O0(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->S0(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final P0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->c:Lcom/p1/mobile/putong/data/SafetyModeConfig;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/SafetyModeConfig;->resetUserData:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/swd0;->c(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {}, Ll/yx0;->d()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final Q0(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "android.intent.action.VIEW"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {v0, p1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    const-string p1, "\u8bf7\u9009\u62e9\u6d4f\u89c8\u5668"

    .line 29
    .line 30
    invoke-static {v0, p1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-static {}, Ll/yx0;->d()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final R0()V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p0}, Ll/uxw;->d(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    goto :goto_0

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ll/qu2;->w(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    :goto_0
    invoke-static {}, Ll/yx0;->d()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic S0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->Y0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic T0(Ll/vx0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/vx0;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->Q0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic U0()V
    .locals 0

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->W0(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V0()V
    .locals 0

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->W0(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final W0(Landroid/app/Activity;)V
    .locals 0

    .line 1
    :try_start_0
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->e:Ll/gxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/AuthData;

    .line 8
    .line 9
    invoke-static {p1, p0}, Ll/h6d0;->k(Landroid/app/Activity;Lcom/p1/mobile/putong/data/AuthData;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    invoke-static {}, Ll/yx0;->d()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final X0(Ll/vx0;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/common/R$string;->F2:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->q(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/cs4;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/vx0;->a()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {p1}, Ll/vx0;->b()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-direct {v1, p0, v2, v3}, Ll/cs4;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->p(Landroid/widget/ListAdapter;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget v1, Lcom/p1/mobile/putong/common/R$string;->a:I

    .line 39
    .line 40
    new-instance v2, Ll/thq0;

    .line 41
    .line 42
    invoke-direct {v2, p0}, Ll/thq0;-><init>(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->p0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->t()Lcom/p1/mobile/android/app/Dialog$e;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {}, Ll/ls4;->a()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_0

    .line 58
    .line 59
    invoke-static {}, Ll/uxw;->b()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_0

    .line 64
    .line 65
    sget p1, Lcom/p1/mobile/putong/common/R$string;->G2:I

    .line 66
    .line 67
    new-instance v1, Ll/uhq0;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/uhq0;-><init>(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    goto :goto_0

    .line 77
    :cond_0
    sget v1, Lcom/p1/mobile/putong/common/R$string;->E2:I

    .line 78
    .line 79
    new-instance v2, Ll/vhq0;

    .line 80
    .line 81
    invoke-direct {v2, p0, p1}, Ll/vhq0;-><init>(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;Ll/vx0;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    :goto_0
    invoke-static {}, Ll/h6d0;->j()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_1

    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->c:Lcom/p1/mobile/putong/data/SafetyModeConfig;

    .line 95
    .line 96
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/SafetyModeConfig;->resetUserData:Z

    .line 97
    .line 98
    if-eqz v0, :cond_1

    .line 99
    .line 100
    sget v0, Lcom/p1/mobile/putong/common/R$string;->j2:I

    .line 101
    .line 102
    new-instance v1, Ll/whq0;

    .line 103
    .line 104
    invoke-direct {v1, p0}, Ll/whq0;-><init>(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 108
    .line 109
    .line 110
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public final Y0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/h6d0;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->c:Lcom/p1/mobile/putong/data/SafetyModeConfig;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, v1, Lcom/p1/mobile/putong/data/SafetyModeConfig;->resetAppData:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {p0}, Ll/yx0;->a(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {}, Ll/yx0;->d()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    iget-boolean v0, v1, Lcom/p1/mobile/putong/data/SafetyModeConfig;->resetUserData:Z

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    sget v1, Lcom/p1/mobile/putong/common/R$string;->i2:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->q(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget v1, Lcom/p1/mobile/putong/common/R$string;->a:I

    .line 45
    .line 46
    new-instance v2, Ll/thq0;

    .line 47
    .line 48
    invoke-direct {v2, p0}, Ll/thq0;-><init>(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->p0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sget v1, Lcom/p1/mobile/putong/common/R$string;->j2:I

    .line 56
    .line 57
    new-instance v2, Ll/xhq0;

    .line 58
    .line 59
    invoke-direct {v2, p0}, Ll/xhq0;-><init>(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->t()Lcom/p1/mobile/android/app/Dialog$e;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    invoke-static {}, Ll/yx0;->d()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public finish()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 3
    .line 4
    .line 5
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Landroid/view/View;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ll/rhq0;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Ll/rhq0;-><init>(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/shq0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/shq0;-><init>(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/safety/UpgradePolicy;->checkUpdate(Landroid/app/Activity;Ll/y20;Ll/y20;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/h6d0;->l()V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/swd0;->e()Lcom/p1/mobile/putong/data/SafetyModeConfig;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->c:Lcom/p1/mobile/putong/data/SafetyModeConfig;

    .line 37
    .line 38
    return-void
.end method
