.class public Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;
.super Landroid/app/Activity;
.source "SourceFile"


# instance fields
.field public a:Ll/l4g0;

.field public b:Ll/kcg0;

.field public c:Z

.field public d:J

.field public e:Ll/kcg0;

.field public f:Ll/kcg0;

.field public g:Ll/kcg0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->a:Ll/l4g0;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->c:Z

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;Landroid/content/Intent;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->p(Landroid/content/Intent;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->s(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->hasInvalidHash()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;Ljava/lang/String;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->r(Ljava/lang/String;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/uxj0;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/uxj0;)Lrx/c;
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->w0:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v0, Ll/gxf0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/gxf0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic g(Ll/uxj0;Ll/uxj0;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->q(Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic i(Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashWaitPlugin:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    invoke-static {p0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashWaitUser:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    invoke-static {p0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic k(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    const-string p0, "[common][DatabaseStore]"

    .line 2
    .line 3
    const-string p1, "userMeStateErrorDialog click retry"

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/uqb0;->f1()V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public attachBaseContext(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/bqj0;->c(Landroid/content/Context;)Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->attachBaseContext(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public finish()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashAll:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->MainStartWait:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final l()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->o(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->c:Z

    .line 15
    .line 16
    return-void
.end method

.method public final m()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->finish()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/v7c0;->b:I

    .line 5
    .line 6
    sget v1, Ll/v7c0;->c:I

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/uqi;->j()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final n()V
    .locals 3

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct$a;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;)V

    .line 6
    .line 7
    .line 8
    const-class v2, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;

    .line 9
    .line 10
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-direct {v0, v1, v2}, Ll/l4g0;-><init>(Ll/ur2;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->a:Ll/l4g0;

    .line 18
    .line 19
    return-void
.end method

.method public final o(Landroid/content/Intent;)V
    .locals 2

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
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/cmb0;->p(Landroid/content/Intent;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->m()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    sget-object v0, Ll/uqb0;->j0:Ll/dg00;

    .line 34
    .line 35
    iget-object v0, v0, Ll/dg00;->f:Lrx/subjects/a;

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 44
    .line 45
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    :goto_0
    new-instance v1, Ll/xwf0;

    .line 50
    .line 51
    invoke-direct {v1, p0, p1}, Ll/xwf0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;Landroid/content/Intent;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->e:Ll/kcg0;

    .line 63
    .line 64
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const/16 v1, 0x1c

    .line 7
    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/16 v1, 0x1706

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-static {v0, v1}, Ll/p4z0;->a(Landroid/view/WindowManager$LayoutParams;I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 3

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "android.view.autofill.extra.RESTORE_SESSION_TOKEN"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p0, v1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ljava/lang/Exception;

    .line 19
    .line 20
    const-string v2, "tankerFlag"

    .line 21
    .line 22
    invoke-direct {v1, v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    :goto_0
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/bqj0;->b(Landroid/content/res/Configuration;)Landroid/content/res/Configuration;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashPageCreateWait:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashCreate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashAll:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 9
    .line 10
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/uqi;->k()V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/af60;->e()Ll/af60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0, p0}, Ll/af60;->b(Landroid/app/Activity;)V

    .line 25
    .line 26
    .line 27
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->n()V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->a:Ll/l4g0;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/l4g0;->c()V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->a:Ll/l4g0;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/l4g0;->r()V

    .line 41
    .line 42
    .line 43
    invoke-static {p0}, Ll/y1l0;->a(Landroid/app/Activity;)V

    .line 44
    .line 45
    .line 46
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string v0, "extra_intent"

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catch_0
    move-exception p1

    .line 60
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    const/4 p1, 0x0

    .line 64
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_0

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setExtrasClassLoader(Ljava/lang/ClassLoader;)V

    .line 82
    .line 83
    .line 84
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    const/4 v0, 0x1

    .line 89
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->l0(Z)V

    .line 90
    .line 91
    .line 92
    invoke-static {p0}, Ll/cmb0;->r(Landroid/app/Activity;)V

    .line 93
    .line 94
    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_1

    .line 104
    .line 105
    sget-object p1, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 106
    .line 107
    const-wide/32 v0, 0x493e0

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/location/a;->u(J)V

    .line 111
    .line 112
    .line 113
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->v()V

    .line 114
    .line 115
    .line 116
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashCreate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 117
    .line 118
    invoke-static {p0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->b:Ll/kcg0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->b:Ll/kcg0;

    .line 15
    .line 16
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->e:Ll/kcg0;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->e:Ll/kcg0;

    .line 30
    .line 31
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->f:Ll/kcg0;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->f:Ll/kcg0;

    .line 45
    .line 46
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->g:Ll/kcg0;

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_3

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->g:Ll/kcg0;

    .line 60
    .line 61
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 62
    .line 63
    .line 64
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->a:Ll/l4g0;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/l4g0;->g()V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->a:Ll/l4g0;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/l4g0;->e()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->c:Z

    .line 6
    .line 7
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->c:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->l()V

    .line 9
    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->c:Z

    .line 13
    .line 14
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/af60;->e()Ll/af60;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1, p0}, Ll/af60;->k(Landroid/app/Activity;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic p(Landroid/content/Intent;Ll/uxj0;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p2, :cond_2

    .line 11
    .line 12
    sget-object p2, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 13
    .line 14
    invoke-virtual {p2}, Ll/cmb0;->e0()V

    .line 15
    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :cond_0
    if-eqz v0, :cond_1

    .line 24
    .line 25
    :try_start_0
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->d(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catch_0
    move-exception p1

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    :goto_0
    invoke-static {p0, v0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    goto :goto_2

    .line 39
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    new-instance p1, Landroid/content/Intent;

    .line 43
    .line 44
    sget-object p2, Ll/uqb0;->c0:Ll/bn5;

    .line 45
    .line 46
    invoke-interface {p2, p0}, Ll/bn5;->getMainActIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->startActivity(Landroid/content/Intent;)V

    .line 54
    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_2
    new-instance p2, Landroid/content/Intent;

    .line 58
    .line 59
    const-class v1, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;

    .line 60
    .line 61
    invoke-direct {p2, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 62
    .line 63
    .line 64
    const-string v1, "from_splash"

    .line 65
    .line 66
    const/4 v2, 0x1

    .line 67
    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 68
    .line 69
    .line 70
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_3

    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    :cond_3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->t(Landroid/net/Uri;)V

    .line 81
    .line 82
    .line 83
    const-string v0, "account"

    .line 84
    .line 85
    sget-object v1, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 86
    .line 87
    invoke-static {p1, v0, v1}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_4

    .line 92
    .line 93
    const/4 v0, 0x0

    .line 94
    const-string v1, "first_welcome"

    .line 95
    .line 96
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    invoke-virtual {p2, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->startActivity(Landroid/content/Intent;)V

    .line 104
    .line 105
    .line 106
    :cond_4
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->m()V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final synthetic q(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1
    const-string p1, "logout_type"

    .line 2
    .line 3
    const-string p2, "db_crash"

    .line 4
    .line 5
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string p2, "e_auto_logout"

    .line 14
    .line 15
    const-string v0, ""

    .line 16
    .line 17
    invoke-static {p2, v0, p1}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    const-string p1, "[common][DatabaseStore]"

    .line 21
    .line 22
    const-string p2, "userMeStateErrorDialog click signout"

    .line 23
    .line 24
    invoke-static {p1, p2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/uqb0;->q0()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->w()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic r(Ljava/lang/String;)Ll/uxj0;
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->hasInvalidHash()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/api/ABManager;->v(I)Z

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-wide v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->d:J

    .line 12
    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long p1, v0, v2

    .line 16
    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->d:J

    .line 24
    .line 25
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashWaitAb:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 26
    .line 27
    invoke-static {p0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 28
    .line 29
    .line 30
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 31
    .line 32
    return-object p0
.end method

.method public final synthetic s(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->w()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-ne v0, v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->w()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/4 v0, 0x2

    .line 27
    if-ne p1, v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->u()V

    .line 30
    .line 31
    .line 32
    :cond_2
    return-void
.end method

.method public startActivity(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final t(Landroid/net/Uri;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_2

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "tantan"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v0, "tantanapp://join_group?groupId="

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string v0, "tantanapp://web/login/oauth"

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    :cond_1
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sput-object p0, Ll/abe0;->g:Ljava/lang/String;

    .line 55
    .line 56
    :cond_2
    :goto_0
    return-void
.end method

.method public final u()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/appcompat/app/a$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Landroidx/appcompat/app/a$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/account/R$string;->L3:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/a$a;->setMessage(I)Landroidx/appcompat/app/a$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Lcom/p1/mobile/putong/account/R$string;->M3:I

    .line 13
    .line 14
    new-instance v2, Ll/hxf0;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/hxf0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/app/a$a;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/a$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Lcom/p1/mobile/putong/account/R$string;->N3:I

    .line 24
    .line 25
    new-instance v2, Ll/ywf0;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/ywf0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/app/a$a;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/a$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/a$a;->setCancelable(Z)Landroidx/appcompat/app/a$a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Landroidx/appcompat/app/a$a;->create()Landroidx/appcompat/app/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final v()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashWaitUser:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashWaitAb:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 21
    .line 22
    sget-object v1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashWaitPlugin:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 23
    .line 24
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->hash()Lrx/subjects/a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/zwf0;

    .line 36
    .line 37
    invoke-direct {v1}, Ll/zwf0;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const-wide/16 v2, 0x5

    .line 50
    .line 51
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 52
    .line 53
    invoke-virtual {v0, v2, v3, v4, v1}, Lrx/c;->timeout(JLjava/util/concurrent/TimeUnit;Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const/4 v1, 0x1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v2, Ll/axf0;

    .line 71
    .line 72
    invoke-direct {v2, p0}, Ll/axf0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    sget-object v2, Ll/uqb0;->j0:Ll/dg00;

    .line 80
    .line 81
    iget-object v2, v2, Ll/dg00;->b:Lrx/subjects/a;

    .line 82
    .line 83
    new-instance v3, Ll/bxf0;

    .line 84
    .line 85
    invoke-direct {v3}, Ll/bxf0;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v2, v3}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    new-instance v3, Ll/cxf0;

    .line 93
    .line 94
    invoke-direct {v3}, Ll/cxf0;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    new-instance v3, Ll/dxf0;

    .line 102
    .line 103
    invoke-direct {v3}, Ll/dxf0;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-static {v0, v2, v3}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    goto :goto_0

    .line 115
    :cond_0
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 116
    .line 117
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    :goto_0
    new-instance v1, Ll/exf0;

    .line 122
    .line 123
    invoke-direct {v1}, Ll/exf0;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    new-instance v1, Ll/fxf0;

    .line 139
    .line 140
    invoke-direct {v1, p0}, Ll/fxf0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;)V

    .line 141
    .line 142
    .line 143
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->g:Ll/kcg0;

    .line 152
    .line 153
    return-void
.end method

.method public final w()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/toh0;->r(Landroid/content/Intent;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const/high16 v1, 0x10000

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->startActivity(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->finish()V

    .line 24
    .line 25
    .line 26
    sget v0, Ll/v7c0;->b:I

    .line 27
    .line 28
    sget v1, Ll/v7c0;->c:I

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    move-exception v0

    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;->o(Landroid/content/Intent;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
