.class public Landroidx/biometric/BiometricPrompt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "SyntheticAccessor"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/biometric/BiometricPrompt$e;,
        Landroidx/biometric/BiometricPrompt$b;,
        Landroidx/biometric/BiometricPrompt$c;,
        Landroidx/biometric/BiometricPrompt$d;
    }
.end annotation


# instance fields
.field public a:Landroidx/fragment/app/FragmentActivity;

.field public b:Landroidx/fragment/app/Fragment;

.field public final c:Ljava/util/concurrent/Executor;

.field public final d:Landroidx/biometric/BiometricPrompt$b;

.field public e:Landroidx/biometric/FingerprintDialogFragment;

.field public f:Landroidx/biometric/FingerprintHelperFragment;

.field public g:Landroidx/biometric/BiometricFragment;

.field public h:Z

.field public i:Z

.field public final j:Landroid/content/DialogInterface$OnClickListener;

.field public final k:Ll/jer;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/FragmentActivity;Ljava/util/concurrent/Executor;Landroidx/biometric/BiometricPrompt$b;)V
    .locals 2
    .param p1    # Landroidx/fragment/app/FragmentActivity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroidx/biometric/BiometricPrompt$b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "LambdaLast"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroidx/biometric/BiometricPrompt$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Landroidx/biometric/BiometricPrompt$a;-><init>(Landroidx/biometric/BiometricPrompt;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/biometric/BiometricPrompt;->j:Landroid/content/DialogInterface$OnClickListener;

    .line 10
    .line 11
    new-instance v0, Landroidx/biometric/BiometricPrompt$2;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Landroidx/biometric/BiometricPrompt$2;-><init>(Landroidx/biometric/BiometricPrompt;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Landroidx/biometric/BiometricPrompt;->k:Ll/jer;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    iput-object p1, p0, Landroidx/biometric/BiometricPrompt;->a:Landroidx/fragment/app/FragmentActivity;

    .line 26
    .line 27
    iput-object p3, p0, Landroidx/biometric/BiometricPrompt;->d:Landroidx/biometric/BiometricPrompt$b;

    .line 28
    .line 29
    iput-object p2, p0, Landroidx/biometric/BiometricPrompt;->c:Ljava/util/concurrent/Executor;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroidx/activity/ComponentActivity;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, v0}, Landroidx/lifecycle/Lifecycle;->a(Ll/jer;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    const-string p0, "AuthenticationCallback must not be null"

    .line 40
    .line 41
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    throw v1

    .line 45
    :cond_1
    const-string p0, "Executor must not be null"

    .line 46
    .line 47
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    throw v1

    .line 51
    :cond_2
    const-string p0, "FragmentActivity must not be null"

    .line 52
    .line 53
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    throw v1
.end method

.method public static synthetic a()Z
    .locals 1

    .line 1
    invoke-static {}, Landroidx/biometric/BiometricPrompt;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method public static synthetic b(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/BiometricFragment;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt;->g:Landroidx/biometric/BiometricFragment;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Landroidx/biometric/BiometricPrompt;)Landroidx/fragment/app/FragmentManager;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt;->x()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Landroidx/biometric/BiometricPrompt;Landroidx/biometric/BiometricFragment;)Landroidx/biometric/BiometricFragment;
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/BiometricPrompt;->g:Landroidx/biometric/BiometricFragment;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic e(Landroidx/biometric/BiometricPrompt;)Landroid/content/DialogInterface$OnClickListener;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt;->j:Landroid/content/DialogInterface$OnClickListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Landroidx/biometric/BiometricPrompt;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt;->A()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Landroidx/biometric/BiometricPrompt;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/biometric/BiometricPrompt;->B(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/BiometricPrompt$b;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt;->d:Landroidx/biometric/BiometricPrompt$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintDialogFragment;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt;->e:Landroidx/biometric/FingerprintDialogFragment;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Landroidx/biometric/BiometricPrompt;Landroidx/biometric/FingerprintDialogFragment;)Landroidx/biometric/FingerprintDialogFragment;
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/BiometricPrompt;->e:Landroidx/biometric/FingerprintDialogFragment;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic k(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintHelperFragment;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt;->f:Landroidx/biometric/FingerprintHelperFragment;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(Landroidx/biometric/BiometricPrompt;Landroidx/biometric/FingerprintHelperFragment;)Landroidx/biometric/FingerprintHelperFragment;
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/BiometricPrompt;->f:Landroidx/biometric/FingerprintHelperFragment;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic m(Landroidx/biometric/BiometricPrompt;)Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt;->c:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n(Landroidx/biometric/BiometricPrompt;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt;->y()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic o(Landroidx/biometric/BiometricPrompt;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/biometric/BiometricPrompt;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic p(Landroidx/biometric/BiometricPrompt;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/biometric/BiometricPrompt;->h:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic q(Landroidx/biometric/FingerprintDialogFragment;Landroidx/biometric/FingerprintHelperFragment;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroidx/biometric/BiometricPrompt;->v(Landroidx/biometric/FingerprintDialogFragment;Landroidx/biometric/FingerprintHelperFragment;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Landroidx/biometric/BiometricPrompt;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt;->C()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static u()Z
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    return v0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    return v0
.end method

.method public static v(Landroidx/biometric/FingerprintDialogFragment;Landroidx/biometric/FingerprintHelperFragment;)V
    .locals 0
    .param p0    # Landroidx/biometric/FingerprintDialogFragment;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroidx/biometric/FingerprintHelperFragment;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroidx/biometric/FingerprintDialogFragment;->e4()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-virtual {p1, p0}, Landroidx/biometric/FingerprintHelperFragment;->b4(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final A()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Landroidx/biometric/BiometricPrompt;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-static {}, Landroidx/biometric/a;->f()Landroidx/biometric/a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_4

    .line 11
    .line 12
    invoke-virtual {v0}, Landroidx/biometric/a;->c()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x1

    .line 17
    if-eq v1, v2, :cond_3

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    if-eq v1, v2, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt;->w()Landroidx/fragment/app/FragmentActivity;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt;->w()Landroidx/fragment/app/FragmentActivity;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget v2, Landroidx/biometric/R$string;->j:I

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    goto :goto_0

    .line 40
    :cond_2
    const-string v1, ""

    .line 41
    .line 42
    :goto_0
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt;->d:Landroidx/biometric/BiometricPrompt$b;

    .line 43
    .line 44
    const/16 v2, 0xa

    .line 45
    .line 46
    invoke-virtual {p0, v2, v1}, Landroidx/biometric/BiometricPrompt$b;->a(ILjava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Landroidx/biometric/a;->q()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Landroidx/biometric/a;->i()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_3
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt;->d:Landroidx/biometric/BiometricPrompt$b;

    .line 57
    .line 58
    new-instance v1, Landroidx/biometric/BiometricPrompt$c;

    .line 59
    .line 60
    const/4 v2, 0x0

    .line 61
    invoke-direct {v1, v2}, Landroidx/biometric/BiometricPrompt$c;-><init>(Landroidx/biometric/BiometricPrompt$d;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v1}, Landroidx/biometric/BiometricPrompt$b;->c(Landroidx/biometric/BiometricPrompt$c;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Landroidx/biometric/a;->q()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Landroidx/biometric/a;->i()V

    .line 71
    .line 72
    .line 73
    :cond_4
    :goto_1
    return-void
.end method

.method public final B(Z)V
    .locals 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-static {}, Landroidx/biometric/a;->e()Landroidx/biometric/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-boolean v1, p0, Landroidx/biometric/BiometricPrompt;->i:Z

    .line 13
    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    invoke-static {}, Landroidx/biometric/BiometricPrompt;->u()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v1, p0, Landroidx/biometric/BiometricPrompt;->g:Landroidx/biometric/BiometricFragment;

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/biometric/a;->j(Landroidx/biometric/BiometricFragment;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object v1, p0, Landroidx/biometric/BiometricPrompt;->e:Landroidx/biometric/FingerprintDialogFragment;

    .line 31
    .line 32
    if-eqz v1, :cond_3

    .line 33
    .line 34
    iget-object v2, p0, Landroidx/biometric/BiometricPrompt;->f:Landroidx/biometric/FingerprintHelperFragment;

    .line 35
    .line 36
    if-eqz v2, :cond_3

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Landroidx/biometric/a;->o(Landroidx/biometric/FingerprintDialogFragment;Landroidx/biometric/FingerprintHelperFragment;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt;->w()Landroidx/fragment/app/FragmentActivity;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    :try_start_0
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v1}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const/4 v3, 0x0

    .line 57
    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Landroid/content/pm/ActivityInfo;->getThemeResource()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {v0, v1}, Landroidx/biometric/a;->l(I)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :catch_0
    move-exception v1

    .line 70
    const-string v2, "BiometricPromptCompat"

    .line 71
    .line 72
    const-string v3, "Failed to register client theme to bridge"

    .line 73
    .line 74
    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 75
    .line 76
    .line 77
    :cond_3
    :goto_0
    iget-object v1, p0, Landroidx/biometric/BiometricPrompt;->c:Ljava/util/concurrent/Executor;

    .line 78
    .line 79
    iget-object v2, p0, Landroidx/biometric/BiometricPrompt;->j:Landroid/content/DialogInterface$OnClickListener;

    .line 80
    .line 81
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt;->d:Landroidx/biometric/BiometricPrompt$b;

    .line 82
    .line 83
    invoke-virtual {v0, v1, v2, p0}, Landroidx/biometric/a;->k(Ljava/util/concurrent/Executor;Landroid/content/DialogInterface$OnClickListener;Landroidx/biometric/BiometricPrompt$b;)V

    .line 84
    .line 85
    .line 86
    if-eqz p1, :cond_4

    .line 87
    .line 88
    invoke-virtual {v0}, Landroidx/biometric/a;->p()V

    .line 89
    .line 90
    .line 91
    :cond_4
    :goto_1
    return-void
.end method

.method public final C()V
    .locals 0

    .line 1
    invoke-static {}, Landroidx/biometric/a;->f()Landroidx/biometric/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/biometric/a;->i()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public s(Landroidx/biometric/BiometricPrompt$e;)V
    .locals 1
    .param p1    # Landroidx/biometric/BiometricPrompt$e;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Landroidx/biometric/BiometricPrompt;->t(Landroidx/biometric/BiometricPrompt$e;Landroidx/biometric/BiometricPrompt$d;)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string p0, "PromptInfo can not be null"

    .line 9
    .line 10
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final t(Landroidx/biometric/BiometricPrompt$e;Landroidx/biometric/BiometricPrompt$d;)V
    .locals 7
    .param p1    # Landroidx/biometric/BiometricPrompt$e;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/biometric/BiometricPrompt$d;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroidx/biometric/BiometricPrompt$e;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Landroidx/biometric/BiometricPrompt;->i:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt;->w()Landroidx/fragment/app/FragmentActivity;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Landroidx/biometric/BiometricPrompt$e;->b()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_3

    .line 16
    .line 17
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 18
    .line 19
    const/16 v2, 0x1c

    .line 20
    .line 21
    if-gt v1, v2, :cond_3

    .line 22
    .line 23
    iget-boolean v1, p0, Landroidx/biometric/BiometricPrompt;->i:Z

    .line 24
    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroidx/biometric/BiometricPrompt;->z(Landroidx/biometric/BiometricPrompt$e;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    const-string v1, "BiometricPromptCompat"

    .line 32
    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    const-string p0, "Failed to authenticate with device credential. Activity was null."

    .line 36
    .line 37
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-static {}, Landroidx/biometric/a;->f()Landroidx/biometric/a;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    if-nez v2, :cond_2

    .line 46
    .line 47
    const-string p0, "Failed to authenticate with device credential. Bridge was null."

    .line 48
    .line 49
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    invoke-virtual {v2}, Landroidx/biometric/a;->h()Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-nez v2, :cond_3

    .line 58
    .line 59
    invoke-static {v0}, Ll/n03;->b(Landroid/content/Context;)Ll/n03;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v2}, Ll/n03;->a()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_3

    .line 68
    .line 69
    invoke-virtual {p1}, Landroidx/biometric/BiometricPrompt$e;->a()Landroid/os/Bundle;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const/4 p1, 0x0

    .line 74
    invoke-static {v1, v0, p0, p1}, Ll/aok0;->e(Ljava/lang/String;Landroidx/fragment/app/FragmentActivity;Landroid/os/Bundle;Ljava/lang/Runnable;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_3
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt;->x()Landroidx/fragment/app/FragmentManager;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->L0()Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_4

    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    invoke-virtual {p1}, Landroidx/biometric/BiometricPrompt$e;->a()Landroid/os/Bundle;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    const/4 v2, 0x0

    .line 94
    iput-boolean v2, p0, Landroidx/biometric/BiometricPrompt;->h:Z

    .line 95
    .line 96
    if-eqz v0, :cond_5

    .line 97
    .line 98
    if-eqz p2, :cond_5

    .line 99
    .line 100
    sget-object v2, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 101
    .line 102
    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {v0, v2, v3}, Ll/aok0;->h(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    if-eqz v2, :cond_5

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_5
    invoke-static {}, Landroidx/biometric/BiometricPrompt;->u()Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-eqz v2, :cond_8

    .line 116
    .line 117
    const-string v0, "BiometricFragment"

    .line 118
    .line 119
    invoke-virtual {v1, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    check-cast v2, Landroidx/biometric/BiometricFragment;

    .line 124
    .line 125
    if-eqz v2, :cond_6

    .line 126
    .line 127
    iput-object v2, p0, Landroidx/biometric/BiometricPrompt;->g:Landroidx/biometric/BiometricFragment;

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_6
    invoke-static {}, Landroidx/biometric/BiometricFragment;->e4()Landroidx/biometric/BiometricFragment;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    iput-object v3, p0, Landroidx/biometric/BiometricPrompt;->g:Landroidx/biometric/BiometricFragment;

    .line 135
    .line 136
    :goto_0
    iget-object v3, p0, Landroidx/biometric/BiometricPrompt;->g:Landroidx/biometric/BiometricFragment;

    .line 137
    .line 138
    iget-object v4, p0, Landroidx/biometric/BiometricPrompt;->c:Ljava/util/concurrent/Executor;

    .line 139
    .line 140
    iget-object v5, p0, Landroidx/biometric/BiometricPrompt;->j:Landroid/content/DialogInterface$OnClickListener;

    .line 141
    .line 142
    iget-object v6, p0, Landroidx/biometric/BiometricPrompt;->d:Landroidx/biometric/BiometricPrompt$b;

    .line 143
    .line 144
    invoke-virtual {v3, v4, v5, v6}, Landroidx/biometric/BiometricFragment;->g4(Ljava/util/concurrent/Executor;Landroid/content/DialogInterface$OnClickListener;Landroidx/biometric/BiometricPrompt$b;)V

    .line 145
    .line 146
    .line 147
    iget-object v3, p0, Landroidx/biometric/BiometricPrompt;->g:Landroidx/biometric/BiometricFragment;

    .line 148
    .line 149
    invoke-virtual {v3, p2}, Landroidx/biometric/BiometricFragment;->h4(Landroidx/biometric/BiometricPrompt$d;)V

    .line 150
    .line 151
    .line 152
    iget-object p2, p0, Landroidx/biometric/BiometricPrompt;->g:Landroidx/biometric/BiometricFragment;

    .line 153
    .line 154
    invoke-virtual {p2, p1}, Landroidx/biometric/BiometricFragment;->f4(Landroid/os/Bundle;)V

    .line 155
    .line 156
    .line 157
    if-nez v2, :cond_7

    .line 158
    .line 159
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt;->g:Landroidx/biometric/BiometricFragment;

    .line 164
    .line 165
    invoke-virtual {p1, p0, v0}, Landroidx/fragment/app/k;->e(Landroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-virtual {p0}, Landroidx/fragment/app/k;->j()I

    .line 170
    .line 171
    .line 172
    goto/16 :goto_5

    .line 173
    .line 174
    :cond_7
    iget-object p1, p0, Landroidx/biometric/BiometricPrompt;->g:Landroidx/biometric/BiometricFragment;

    .line 175
    .line 176
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->isDetached()Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-eqz p1, :cond_e

    .line 181
    .line 182
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt;->g:Landroidx/biometric/BiometricFragment;

    .line 187
    .line 188
    invoke-virtual {p1, p0}, Landroidx/fragment/app/k;->h(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-virtual {p0}, Landroidx/fragment/app/k;->j()I

    .line 193
    .line 194
    .line 195
    goto/16 :goto_5

    .line 196
    .line 197
    :cond_8
    :goto_1
    const-string v2, "FingerprintDialogFragment"

    .line 198
    .line 199
    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    check-cast v3, Landroidx/biometric/FingerprintDialogFragment;

    .line 204
    .line 205
    if-eqz v3, :cond_9

    .line 206
    .line 207
    iput-object v3, p0, Landroidx/biometric/BiometricPrompt;->e:Landroidx/biometric/FingerprintDialogFragment;

    .line 208
    .line 209
    goto :goto_2

    .line 210
    :cond_9
    invoke-static {}, Landroidx/biometric/FingerprintDialogFragment;->p4()Landroidx/biometric/FingerprintDialogFragment;

    .line 211
    .line 212
    .line 213
    move-result-object v4

    .line 214
    iput-object v4, p0, Landroidx/biometric/BiometricPrompt;->e:Landroidx/biometric/FingerprintDialogFragment;

    .line 215
    .line 216
    :goto_2
    iget-object v4, p0, Landroidx/biometric/BiometricPrompt;->e:Landroidx/biometric/FingerprintDialogFragment;

    .line 217
    .line 218
    iget-object v5, p0, Landroidx/biometric/BiometricPrompt;->j:Landroid/content/DialogInterface$OnClickListener;

    .line 219
    .line 220
    invoke-virtual {v4, v5}, Landroidx/biometric/FingerprintDialogFragment;->r4(Landroid/content/DialogInterface$OnClickListener;)V

    .line 221
    .line 222
    .line 223
    iget-object v4, p0, Landroidx/biometric/BiometricPrompt;->e:Landroidx/biometric/FingerprintDialogFragment;

    .line 224
    .line 225
    invoke-virtual {v4, p1}, Landroidx/biometric/FingerprintDialogFragment;->q4(Landroid/os/Bundle;)V

    .line 226
    .line 227
    .line 228
    if-eqz v0, :cond_b

    .line 229
    .line 230
    sget-object p1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 231
    .line 232
    invoke-static {v0, p1}, Ll/aok0;->g(Landroid/content/Context;Ljava/lang/String;)Z

    .line 233
    .line 234
    .line 235
    move-result p1

    .line 236
    if-nez p1, :cond_b

    .line 237
    .line 238
    iget-object p1, p0, Landroidx/biometric/BiometricPrompt;->e:Landroidx/biometric/FingerprintDialogFragment;

    .line 239
    .line 240
    if-nez v3, :cond_a

    .line 241
    .line 242
    invoke-virtual {p1, v1, v2}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    goto :goto_3

    .line 246
    :cond_a
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->isDetached()Z

    .line 247
    .line 248
    .line 249
    move-result p1

    .line 250
    if-eqz p1, :cond_b

    .line 251
    .line 252
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt;->e:Landroidx/biometric/FingerprintDialogFragment;

    .line 257
    .line 258
    invoke-virtual {p1, v0}, Landroidx/fragment/app/k;->h(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 259
    .line 260
    .line 261
    move-result-object p1

    .line 262
    invoke-virtual {p1}, Landroidx/fragment/app/k;->j()I

    .line 263
    .line 264
    .line 265
    :cond_b
    :goto_3
    const-string p1, "FingerprintHelperFragment"

    .line 266
    .line 267
    invoke-virtual {v1, p1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    check-cast v0, Landroidx/biometric/FingerprintHelperFragment;

    .line 272
    .line 273
    if-eqz v0, :cond_c

    .line 274
    .line 275
    iput-object v0, p0, Landroidx/biometric/BiometricPrompt;->f:Landroidx/biometric/FingerprintHelperFragment;

    .line 276
    .line 277
    goto :goto_4

    .line 278
    :cond_c
    invoke-static {}, Landroidx/biometric/FingerprintHelperFragment;->f4()Landroidx/biometric/FingerprintHelperFragment;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    iput-object v2, p0, Landroidx/biometric/BiometricPrompt;->f:Landroidx/biometric/FingerprintHelperFragment;

    .line 283
    .line 284
    :goto_4
    iget-object v2, p0, Landroidx/biometric/BiometricPrompt;->f:Landroidx/biometric/FingerprintHelperFragment;

    .line 285
    .line 286
    iget-object v3, p0, Landroidx/biometric/BiometricPrompt;->c:Ljava/util/concurrent/Executor;

    .line 287
    .line 288
    iget-object v4, p0, Landroidx/biometric/BiometricPrompt;->d:Landroidx/biometric/BiometricPrompt$b;

    .line 289
    .line 290
    invoke-virtual {v2, v3, v4}, Landroidx/biometric/FingerprintHelperFragment;->h4(Ljava/util/concurrent/Executor;Landroidx/biometric/BiometricPrompt$b;)V

    .line 291
    .line 292
    .line 293
    iget-object v2, p0, Landroidx/biometric/BiometricPrompt;->e:Landroidx/biometric/FingerprintDialogFragment;

    .line 294
    .line 295
    invoke-virtual {v2}, Landroidx/biometric/FingerprintDialogFragment;->g4()Landroid/os/Handler;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    iget-object v3, p0, Landroidx/biometric/BiometricPrompt;->f:Landroidx/biometric/FingerprintHelperFragment;

    .line 300
    .line 301
    invoke-virtual {v3, v2}, Landroidx/biometric/FingerprintHelperFragment;->j4(Landroid/os/Handler;)V

    .line 302
    .line 303
    .line 304
    iget-object v3, p0, Landroidx/biometric/BiometricPrompt;->f:Landroidx/biometric/FingerprintHelperFragment;

    .line 305
    .line 306
    invoke-virtual {v3, p2}, Landroidx/biometric/FingerprintHelperFragment;->i4(Landroidx/biometric/BiometricPrompt$d;)V

    .line 307
    .line 308
    .line 309
    const/4 p2, 0x6

    .line 310
    invoke-virtual {v2, p2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 311
    .line 312
    .line 313
    move-result-object p2

    .line 314
    const-wide/16 v3, 0x1f4

    .line 315
    .line 316
    invoke-virtual {v2, p2, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 317
    .line 318
    .line 319
    if-nez v0, :cond_d

    .line 320
    .line 321
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 322
    .line 323
    .line 324
    move-result-object p2

    .line 325
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt;->f:Landroidx/biometric/FingerprintHelperFragment;

    .line 326
    .line 327
    invoke-virtual {p2, p0, p1}, Landroidx/fragment/app/k;->e(Landroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    invoke-virtual {p0}, Landroidx/fragment/app/k;->j()I

    .line 332
    .line 333
    .line 334
    goto :goto_5

    .line 335
    :cond_d
    iget-object p1, p0, Landroidx/biometric/BiometricPrompt;->f:Landroidx/biometric/FingerprintHelperFragment;

    .line 336
    .line 337
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->isDetached()Z

    .line 338
    .line 339
    .line 340
    move-result p1

    .line 341
    if-eqz p1, :cond_e

    .line 342
    .line 343
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt;->f:Landroidx/biometric/FingerprintHelperFragment;

    .line 348
    .line 349
    invoke-virtual {p1, p0}, Landroidx/fragment/app/k;->h(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 350
    .line 351
    .line 352
    move-result-object p0

    .line 353
    invoke-virtual {p0}, Landroidx/fragment/app/k;->j()I

    .line 354
    .line 355
    .line 356
    :cond_e
    :goto_5
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 357
    .line 358
    .line 359
    return-void
.end method

.method public final w()Landroidx/fragment/app/FragmentActivity;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt;->a:Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt;->b:Landroidx/fragment/app/Fragment;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final x()Landroidx/fragment/app/FragmentManager;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt;->a:Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt;->b:Landroidx/fragment/app/Fragment;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final y()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt;->w()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt;->w()Landroidx/fragment/app/FragmentActivity;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->isChangingConfigurations()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final z(Landroidx/biometric/BiometricPrompt$e;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt;->w()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v1, 0x1

    .line 15
    invoke-virtual {p0, v1}, Landroidx/biometric/BiometricPrompt;->B(Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Landroidx/biometric/BiometricPrompt$e;->a()Landroid/os/Bundle;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "handling_device_credential_result"

    .line 23
    .line 24
    invoke-virtual {p0, p1, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    new-instance p1, Landroid/content/Intent;

    .line 28
    .line 29
    const-class v1, Landroidx/biometric/DeviceCredentialHandlerActivity;

    .line 30
    .line 31
    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 32
    .line 33
    .line 34
    const-string v1, "prompt_info_bundle"

    .line 35
    .line 36
    invoke-virtual {p1, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    return-void
.end method
