.class public Ll/rrf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rrf;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a()Z
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->opened:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-static {v2}, Ll/fph0;->J(Z)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {v3}, Ll/fph0;->J(Z)V

    .line 16
    .line 17
    .line 18
    :goto_0
    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    .line 19
    .line 20
    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    .line 21
    .line 22
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-static {v2}, Ll/fph0;->H(Z)V

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    invoke-static {v3}, Ll/fph0;->H(Z)V

    .line 37
    .line 38
    .line 39
    :goto_1
    const-string v0, "android.permission.READ_CONTACTS"

    .line 40
    .line 41
    filled-new-array {v0}, [Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-static {v2}, Ll/fph0;->a(Z)V

    .line 52
    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_2
    invoke-static {v3}, Ll/fph0;->a(Z)V

    .line 56
    .line 57
    .line 58
    :goto_2
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 59
    .line 60
    filled-new-array {v0}, [Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    invoke-static {v2}, Ll/fph0;->b(Z)V

    .line 71
    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_3
    invoke-static {v3}, Ll/fph0;->b(Z)V

    .line 75
    .line 76
    .line 77
    :goto_3
    invoke-static {}, Ll/fph0;->O()V

    .line 78
    .line 79
    .line 80
    return v3
.end method

.method public static synthetic b(Ll/rrf;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rrf;->f(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic c()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 2
    .line 3
    const-wide/32 v1, 0x927c0

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/location/a;->u(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/a17;->h()Ll/a17;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Ll/a17;->i(Z)V

    .line 11
    .line 12
    .line 13
    sget-boolean p0, Lcom/p1/mobile/android/app/Act;->isFromBackground:Z

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-static {}, Landroid/os/Looper;->myQueue()Landroid/os/MessageQueue;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v0, Ll/qrf;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/qrf;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/os/MessageQueue;->addIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method


# virtual methods
.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rrf;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v1, Ll/nrf;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/nrf;-><init>(Ll/rrf;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/rrf;->a:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v0, Ll/orf;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/orf;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic f(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/api/c;->S:Z

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p1, Lcom/p1/mobile/putong/core/api/c;->S:Z

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/c;->B3()V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Ll/rrf;->a:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    instance-of p1, p0, Ll/w1j0;

    .line 34
    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    check-cast p0, Ll/w1j0;

    .line 38
    .line 39
    invoke-interface {p0}, Ll/w1j0;->G()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return-void

    .line 47
    :cond_2
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 48
    .line 49
    new-instance p1, Ll/prf;

    .line 50
    .line 51
    invoke-direct {p1}, Ll/prf;-><init>()V

    .line 52
    .line 53
    .line 54
    const-wide/16 v0, 0x3e8

    .line 55
    .line 56
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
