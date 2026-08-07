.class public Lcom/p1/mobile/putong/safety/UpgradePolicy;
.super Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;
.source "SourceFile"


# static fields
.field private static final CHECK_UPDATE_RUL:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/xi5;->UPDATE_URL:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "/android/version"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Lcom/p1/mobile/putong/safety/UpgradePolicy;->CHECK_UPDATE_RUL:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;-><init>(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static checkUpdate(Landroid/app/Activity;Ll/y20;Ll/y20;)V
    .locals 3
    .param p0    # Landroid/app/Activity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ll/y20<",
            "Ll/vx0;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/rg50$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/rg50$b;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/tg50;->g()Ll/tg50;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ll/rg50$b;->j(Ll/o6e;)Ll/rg50$b;

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/x1d0$a;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/x1d0$a;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/safety/UpgradePolicy;->getUpgradeUrl()Ll/rnl;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Ll/x1d0$a;->s(Ll/rnl;)Ll/x1d0$a;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    :try_start_0
    invoke-static {v1}, Lcom/p1/mobile/putong/api/api/Network;->addHMC(Ll/x1d0;)Ll/x1d0;

    .line 31
    .line 32
    .line 33
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    :catch_0
    invoke-static {v0}, Ll/c1j0;->a(Ll/rg50$b;)Ll/rg50$b;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/rg50$b;->c()Ll/rg50;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0, v1}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Lcom/p1/mobile/putong/safety/UpgradePolicy$a;

    .line 47
    .line 48
    invoke-direct {v1, p0, p2, p1}, Lcom/p1/mobile/putong/safety/UpgradePolicy$a;-><init>(Landroid/app/Activity;Ll/y20;Ll/y20;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {v0, v1}, Ll/ry3;->h(Ll/w84;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method private static getUpgradeUrl()Ll/rnl;
    .locals 6

    .line 1
    sget-object v0, Ll/ls4;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/safety/UpgradePolicy;->getUserId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    sget-object v3, Lcom/p1/mobile/putong/safety/UpgradePolicy;->CHECK_UPDATE_RUL:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v3}, Ll/rnl;->r(Ljava/lang/String;)Ll/rnl;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v3}, Ll/rnl;->p()Ll/rnl$a;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v4, "appversion"

    .line 22
    .line 23
    const-string v5, "7.3.3"

    .line 24
    .line 25
    invoke-virtual {v3, v4, v5}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    const-string v4, "deviceid"

    .line 30
    .line 31
    invoke-virtual {v3, v4, v1}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v3, "affiliate"

    .line 36
    .line 37
    invoke-virtual {v1, v3, v0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_0

    .line 46
    .line 47
    const-string v1, "userid"

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 50
    .line 51
    .line 52
    :cond_0
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    return-object v0
.end method

.method private static getUserId()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->e:Ll/gxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const-string v0, ""

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/data/AuthData;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 19
    .line 20
    return-object v0
.end method


# virtual methods
.method public localProcess()Z
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->context:Landroid/content/Context;

    .line 7
    .line 8
    const-class v2, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const/high16 v1, 0x10000000

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const v1, 0x8000

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->context:Landroid/content/Context;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Lcom/p1/mobile/putong/safety/ContinuousCrashException;

    .line 30
    .line 31
    const-string v0, "The system is crash for many times, and the recovery strategy is activated"

    .line 32
    .line 33
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/safety/ContinuousCrashException;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0
.end method

.method public remoteProcess()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->remoteActivity:Landroid/app/Activity;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
