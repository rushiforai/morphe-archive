.class public Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;
.super Landroid/app/Activity;
.source "SourceFile"


# static fields
.field public static i:J


# instance fields
.field public a:Z

.field public b:J

.field public c:Ll/l4g0;

.field public d:Ll/l4g0;

.field public e:Ll/l4g0;

.field public final f:Ll/vxd0;

.field public final g:Ll/vxd0;

.field public h:Ll/kcg0;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->a:Z

    .line 6
    .line 7
    new-instance v0, Ll/l4g0;

    .line 8
    .line 9
    const-class v1, Landroid/app/Dialog;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "p_second_prompt_phone_auth_popup_view"

    .line 16
    .line 17
    invoke-direct {v0, v3, v2}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->c:Ll/l4g0;

    .line 21
    .line 22
    new-instance v0, Ll/l4g0;

    .line 23
    .line 24
    const-string v2, "p_sys_phone_auth_popup_view"

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->d:Ll/l4g0;

    .line 34
    .line 35
    new-instance v0, Ll/l4g0;

    .line 36
    .line 37
    const-string v2, "p_prompt_phone_auth_popup_view"

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->e:Ll/l4g0;

    .line 47
    .line 48
    new-instance v0, Ll/vxd0;

    .line 49
    .line 50
    const-string v1, "welcome_session"

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->f:Ll/vxd0;

    .line 57
    .line 58
    new-instance v0, Ll/vxd0;

    .line 59
    .line 60
    const-string v1, "application_started"

    .line 61
    .line 62
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->g:Ll/vxd0;

    .line 66
    .line 67
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->q(Ll/x20;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->o()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->p()V

    return-void
.end method

.method public static synthetic d(Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->r()V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->n()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)Ll/l4g0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->e:Ll/l4g0;

    return-object p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)Ll/l4g0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->c:Ll/l4g0;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)Ll/l4g0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->d:Ll/l4g0;

    return-object p0
.end method

.method public static l(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const p0, 0x10008000

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static m()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->a:[Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method


# virtual methods
.method public finish()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashProxyAll:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 8
    .line 9
    .line 10
    :try_start_0
    invoke-super {p0}, Landroid/app/Activity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    :catch_0
    return-void
.end method

.method public final j(Ll/x20;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->b:Ll/uqb0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Ll/uqb0;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/uqb0;-><init>()V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/app/TantanApp;->b:Ll/uqb0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/uqb0;->m()V

    .line 14
    .line 15
    .line 16
    sput-boolean v1, Lcom/p1/mobile/putong/app/TantanApp;->k:Z

    .line 17
    .line 18
    :cond_0
    invoke-static {v1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->setVisitorHasClick(Z)V

    .line 19
    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->a:[Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->s(Ll/x20;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-interface {p1}, Ll/x20;->call()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->k()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public k()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->a:[Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-boolean v1, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->a:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->k(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-boolean v1, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->a:Z

    .line 18
    .line 19
    xor-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v2, Ll/mxf0;

    .line 35
    .line 36
    invoke-direct {v2, p0}, Ll/mxf0;-><init>(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)V

    .line 37
    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v2, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct$c;

    .line 45
    .line 46
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct$c;-><init>(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->p(Ll/j6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v2, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct$b;

    .line 54
    .line 55
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct$b;-><init>(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->t(Ll/k6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v2, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct$a;

    .line 63
    .line 64
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct$a;-><init>(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->v(Ll/l6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->s(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$c;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 76
    .line 77
    .line 78
    iput-boolean v1, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->a:Z

    .line 79
    .line 80
    return-void
.end method

.method public final synthetic n()V
    .locals 1

    .line 1
    new-instance v0, Ll/nxf0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nxf0;-><init>(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic o()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->j(Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    :try_start_0
    invoke-static {}, Lcom/tencent/mmkv/MMKV;->getRootDir()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {p0, p1, p1}, Ll/kmk0;->a(Landroid/content/Context;ZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    :catchall_0
    :cond_0
    invoke-static {}, Ll/wiw;->f()V

    .line 19
    .line 20
    .line 21
    :try_start_1
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->e:Ll/gxd0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/app/TantanApp;->d:Ll/kxd0;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/bzd0;->b()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/p1/mobile/putong/data/AuthData;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v0}, Ll/wiw;->j(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    invoke-static {}, Ll/wiw;->h()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 56
    .line 57
    .line 58
    :catch_0
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashStartWait:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 59
    .line 60
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 61
    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashProxyCreate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 64
    .line 65
    sget-object v1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashProxyAll:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 66
    .line 67
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 72
    .line 73
    .line 74
    sget-object v0, Ll/uqb0;->A0:Lrx/subjects/a;

    .line 75
    .line 76
    new-instance v1, Ll/pf60;

    .line 77
    .line 78
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 79
    .line 80
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    check-cast v3, Ll/pf60;

    .line 85
    .line 86
    iget-object v3, v3, Ll/pf60;->b:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast v3, Ljava/lang/Boolean;

    .line 89
    .line 90
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 97
    .line 98
    .line 99
    move-result-wide v0

    .line 100
    sput-wide v0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->i:J

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-eqz v1, :cond_2

    .line 111
    .line 112
    sget-boolean v1, Lcom/p1/mobile/putong/app/TantanApp;->k:Z

    .line 113
    .line 114
    if-nez v1, :cond_2

    .line 115
    .line 116
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->getInstance()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v1, v0}, Lcom/cosmos/photon/push/PhotonPushManager;->logPushClick(Landroid/content/Intent;)V

    .line 121
    .line 122
    .line 123
    :cond_2
    const/4 v1, 0x0

    .line 124
    if-eqz v0, :cond_3

    .line 125
    .line 126
    :try_start_2
    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    goto :goto_1

    .line 131
    :catch_1
    move-exception v2

    .line 132
    goto :goto_2

    .line 133
    :cond_3
    move-object v2, v1

    .line 134
    :goto_1
    if-eqz v2, :cond_4

    .line 135
    .line 136
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-static {v2}, Ll/wse0;->d(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_4
    if-eqz v0, :cond_5

    .line 145
    .line 146
    const-string v2, "wzrk_dl"

    .line 147
    .line 148
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 153
    .line 154
    .line 155
    move-result v3

    .line 156
    if-nez v3, :cond_5

    .line 157
    .line 158
    invoke-static {v2}, Ll/wse0;->d(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 159
    .line 160
    .line 161
    goto :goto_3

    .line 162
    :goto_2
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 163
    .line 164
    .line 165
    :cond_5
    :goto_3
    invoke-virtual {p0}, Landroid/app/Activity;->isTaskRoot()Z

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    if-nez v2, :cond_6

    .line 170
    .line 171
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    if-eqz v2, :cond_6

    .line 176
    .line 177
    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    const-string v3, "android.intent.category.LAUNCHER"

    .line 182
    .line 183
    invoke-virtual {v0, v3}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z

    .line 184
    .line 185
    .line 186
    move-result v3

    .line 187
    if-eqz v3, :cond_6

    .line 188
    .line 189
    const-string v3, "android.intent.action.MAIN"

    .line 190
    .line 191
    invoke-static {v3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    if-eqz v2, :cond_6

    .line 196
    .line 197
    const-string v2, "custom"

    .line 198
    .line 199
    invoke-virtual {v0, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-nez v0, :cond_6

    .line 204
    .line 205
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->finish()V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->g:Ll/vxd0;

    .line 210
    .line 211
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    check-cast v0, Ljava/lang/Integer;

    .line 216
    .line 217
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    if-nez v0, :cond_7

    .line 222
    .line 223
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->f:Ll/vxd0;

    .line 224
    .line 225
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    check-cast v0, Ljava/lang/Integer;

    .line 230
    .line 231
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    if-nez v0, :cond_7

    .line 236
    .line 237
    const-string v0, ""

    .line 238
    .line 239
    new-array v2, p1, [Ll/pf60;

    .line 240
    .line 241
    const-string v3, "e_first_app_open_pre"

    .line 242
    .line 243
    invoke-static {v3, v0, v2}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 244
    .line 245
    .line 246
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->f:Ll/vxd0;

    .line 247
    .line 248
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    check-cast v0, Ljava/lang/Integer;

    .line 253
    .line 254
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 255
    .line 256
    .line 257
    move-result v0

    .line 258
    const/4 v2, 0x3

    .line 259
    const/4 v3, 0x1

    .line 260
    if-ge v0, v2, :cond_8

    .line 261
    .line 262
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->f:Ll/vxd0;

    .line 263
    .line 264
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    move-result-object v2

    .line 268
    check-cast v2, Ljava/lang/Integer;

    .line 269
    .line 270
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 271
    .line 272
    .line 273
    move-result v2

    .line 274
    add-int/2addr v2, v3

    .line 275
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 276
    .line 277
    .line 278
    move-result-object v2

    .line 279
    invoke-virtual {v0, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    :cond_8
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    const/16 v2, 0x400

    .line 287
    .line 288
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    const/high16 v2, 0x4000000

    .line 296
    .line 297
    invoke-virtual {v0, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    const/high16 v2, -0x80000000

    .line 305
    .line 306
    invoke-virtual {v0, v2}, Landroid/view/Window;->addFlags(I)V

    .line 307
    .line 308
    .line 309
    invoke-static {}, Ll/ive0;->j()Z

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    if-eqz v0, :cond_9

    .line 314
    .line 315
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/app/PutongAct;->MIUISetStatusBarLightMode(Landroid/view/Window;Z)Z

    .line 320
    .line 321
    .line 322
    :cond_9
    invoke-static {}, Ll/ive0;->g()Z

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    if-eqz v0, :cond_a

    .line 327
    .line 328
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/app/PutongAct;->FlymeSetStatusBarLightMode(Landroid/view/Window;Z)Z

    .line 333
    .line 334
    .line 335
    :cond_a
    sget-boolean v0, Lcom/p1/mobile/putong/app/TantanApp;->k:Z

    .line 336
    .line 337
    if-nez v0, :cond_c

    .line 338
    .line 339
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    const-string v2, "signout"

    .line 344
    .line 345
    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 346
    .line 347
    .line 348
    move-result v0

    .line 349
    if-eqz v0, :cond_b

    .line 350
    .line 351
    goto :goto_4

    .line 352
    :cond_b
    invoke-static {}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->m()Z

    .line 353
    .line 354
    .line 355
    move-result p1

    .line 356
    if-eqz p1, :cond_d

    .line 357
    .line 358
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->r()V

    .line 359
    .line 360
    .line 361
    goto :goto_5

    .line 362
    :cond_c
    :goto_4
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    sget v2, Ll/jec0;->R:I

    .line 367
    .line 368
    invoke-virtual {v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 369
    .line 370
    .line 371
    move-result-object v0

    .line 372
    check-cast v0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 373
    .line 374
    new-instance v1, Ll/jxf0;

    .line 375
    .line 376
    invoke-direct {v1, p0}, Ll/jxf0;-><init>(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)V

    .line 377
    .line 378
    .line 379
    iput-object v1, v0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->l:Ljava/lang/Runnable;

    .line 380
    .line 381
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    .line 382
    .line 383
    .line 384
    invoke-static {}, Ll/bnl0;->F0()I

    .line 385
    .line 386
    .line 387
    move-result v1

    .line 388
    invoke-virtual {v0, p1, v1, p1, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 389
    .line 390
    .line 391
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 392
    .line 393
    .line 394
    move-result-object p1

    .line 395
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 396
    .line 397
    .line 398
    move-result-object v0

    .line 399
    sget v1, Ll/b9c0;->m:I

    .line 400
    .line 401
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 402
    .line 403
    .line 404
    move-result v0

    .line 405
    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 406
    .line 407
    .line 408
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 409
    .line 410
    .line 411
    move-result-object p1

    .line 412
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 413
    .line 414
    .line 415
    move-result-object p0

    .line 416
    sget v0, Ll/b9c0;->m:I

    .line 417
    .line 418
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 419
    .line 420
    .line 421
    move-result p0

    .line 422
    invoke-virtual {p1, p0}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 423
    .line 424
    .line 425
    :cond_d
    :goto_5
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashProxyCreate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 426
    .line 427
    invoke-static {p0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 428
    .line 429
    .line 430
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->h:Ll/kcg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->h:Ll/kcg0;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 2
    .line 3
    .line 4
    sget-boolean v0, Lcom/p1/mobile/putong/app/TantanApp;->k:Z

    .line 5
    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "signout"

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->m()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->r()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->r()V

    .line 33
    .line 34
    .line 35
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic p()V
    .locals 3

    .line 1
    new-instance v0, Ll/kxf0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/kxf0;-><init>(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x64

    .line 7
    .line 8
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic q(Ll/x20;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashWaitModuleLoad:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "signout"

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Landroid/content/Intent;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->f:Ll/vxd0;

    .line 31
    .line 32
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Ljava/lang/Integer;

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    const/4 v3, 0x1

    .line 43
    if-ne v2, v3, :cond_1

    .line 44
    .line 45
    move v1, v3

    .line 46
    :cond_1
    const-string v2, "first_welcome"

    .line 47
    .line 48
    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    const-string v1, "extra_intent"

    .line 52
    .line 53
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    sget-object p1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashPageCreateWait:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 57
    .line 58
    filled-new-array {p1}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-static {p1}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 63
    .line 64
    .line 65
    sget-object p1, Ll/uqb0;->c0:Ll/bn5;

    .line 66
    .line 67
    invoke-interface {p1}, Ll/bn5;->t5()Ljava/lang/Class;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->finish()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final r()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->s(Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final s(Ll/x20;)V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->b:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0xc8

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-gez v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iput-wide v0, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->b:J

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SplashWaitModuleLoad:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 22
    .line 23
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/ixf0;

    .line 31
    .line 32
    invoke-direct {v0, p0, p1}, Ll/ixf0;-><init>(Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;Ll/x20;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->t(Ll/x20;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final t(Ll/x20;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->j0:Ll/dg00;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/dg00;->r()Ll/dg00;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/uqb0;->j0:Ll/dg00;

    .line 10
    .line 11
    :cond_0
    sget-object v0, Ll/uqb0;->j0:Ll/dg00;

    .line 12
    .line 13
    const-string v1, "account"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/dg00;->y(Ljava/lang/String;)Lrx/subjects/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/lxf0;

    .line 25
    .line 26
    invoke-direct {v1, p1}, Ll/lxf0;-><init>(Ll/x20;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->h:Ll/kcg0;

    .line 38
    .line 39
    return-void
.end method
