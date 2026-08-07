.class public Lcom/p1/mobile/putong/core/CoreModule;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/putong/module/Module;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "CoreModule"
    path = "/base_module/module"
.end annotation


# static fields
.field public static b:Landroid/app/Application;

.field public static c:Lcom/p1/mobile/putong/core/api/c;

.field public static d:Ll/yy6;

.field public static e:Lcom/p1/mobile/putong/core/api/g0;

.field public static f:Ll/qqk;

.field public static g:Ll/yg0;

.field public static h:Ll/vwa;

.field public static i:Ll/kcg0;

.field public static j:Ll/kcg0;

.field public static k:Ll/il8;

.field public static l:Ll/j49;

.field public static m:Ll/wr2;

.field public static n:Ll/u17;

.field public static o:Ll/gta;


# instance fields
.field public a:Ll/of00;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/of00;->k()Ll/of00;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/CoreModule;->a:Ll/of00;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic F()V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CoreData;->new_()Lcom/p1/mobile/putong/core/data/CoreData;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    return-object v0
.end method

.method public static K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    return-object v0
.end method

.method private M()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ll/wr2;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/wr2;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object p0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->d:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 4
    .line 5
    return-object v0
.end method

.method public static P()Ll/j49;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    return-object v0
.end method

.method public static Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 4
    .line 5
    return-object v0
.end method

.method public static R()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->D3()Ll/kcg0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->n:Ll/u17;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/u17;->S()Ll/ft5;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {}, Ll/a17;->h()Ll/a17;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Ll/a17;->q()Ll/kcg0;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const/4 v3, 0x3

    .line 22
    new-array v3, v3, [Ll/kcg0;

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    aput-object v0, v3, v4

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    aput-object v1, v3, v0

    .line 29
    .line 30
    const/4 v0, 0x2

    .line 31
    aput-object v2, v3, v0

    .line 32
    .line 33
    invoke-static {v3}, Ll/pcg0;->c([Ll/kcg0;)Ll/ft5;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sput-object v0, Lcom/p1/mobile/putong/core/CoreModule;->i:Ll/kcg0;

    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public Ai()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/CoreModule;->a:Ll/of00;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/of00;->e()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Ec()V
    .locals 1

    .line 1
    new-instance v0, Ll/vwa;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vwa;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/CoreModule;->h:Ll/vwa;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/CoreModule;->a:Ll/of00;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/of00;->i()V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/qqk;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/qqk;-><init>()V

    .line 16
    .line 17
    .line 18
    sput-object v0, Lcom/p1/mobile/putong/core/CoreModule;->f:Ll/qqk;

    .line 19
    .line 20
    new-instance v0, Ll/yy6;

    .line 21
    .line 22
    invoke-direct {v0}, Ll/yy6;-><init>()V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/CoreModule;->a:Ll/of00;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/of00;->i()V

    .line 30
    .line 31
    .line 32
    new-instance p0, Lcom/p1/mobile/putong/core/api/g0;

    .line 33
    .line 34
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/api/g0;-><init>()V

    .line 35
    .line 36
    .line 37
    sput-object p0, Lcom/p1/mobile/putong/core/CoreModule;->e:Lcom/p1/mobile/putong/core/api/g0;

    .line 38
    .line 39
    new-instance p0, Ll/yg0;

    .line 40
    .line 41
    invoke-direct {p0}, Ll/yg0;-><init>()V

    .line 42
    .line 43
    .line 44
    sput-object p0, Lcom/p1/mobile/putong/core/CoreModule;->g:Ll/yg0;

    .line 45
    .line 46
    sget-object p0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->CORE:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 47
    .line 48
    const/16 v0, 0x8

    .line 49
    .line 50
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;->H(Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;I)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final J(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    :try_start_0
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->clearRequestsAndStop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p0

    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "Error when coreApi.clearRequestsAndStop() after "

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "[putong-common][userMeState]"

    .line 31
    .line 32
    invoke-static {p1, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public Jh()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/CoreModule;->a:Ll/of00;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/of00;->q()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final L(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    return-void

    .line 9
    :cond_1
    :goto_0
    new-instance p0, Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/api/c;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    return-void
.end method

.method public Ma()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/il8;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Ll/il8;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/il8;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1, v0}, Ll/l9c;->y(Ll/h9c;)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/CoreModule;->a:Ll/of00;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/of00;->j()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public Qh()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/CoreModule;->M()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/CoreModule;->a:Ll/of00;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/of00;->f()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Wn()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/CoreModule;->a:Ll/of00;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/of00;->h()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public ft()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/CoreModule;->L(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/CoreModule;->a:Ll/of00;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/of00;->p()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getContext()Landroid/content/Context;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/app/Application;

    .line 2
    .line 3
    sput-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 4
    .line 5
    invoke-static {}, Ll/j49;->c()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sput-object p0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 10
    .line 11
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sput-object p0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 16
    .line 17
    new-instance p0, Ll/du9;

    .line 18
    .line 19
    invoke-direct {p0}, Ll/du9;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {p0}, Ll/l51;->s(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public ms()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->U6()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/CoreModule;->a:Ll/of00;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/of00;->n()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onLowMemory()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/CoreModule;->a:Ll/of00;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/of00;->m()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/CoreModule;->a:Ll/of00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/of00;->o(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public tr(Z)V
    .locals 3

    .line 1
    const-string v0, "Query user me null after ensureCoreApi"

    .line 2
    .line 3
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->EnsureCoreApi:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    filled-new-array {v1}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-static {v2}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/CoreModule;->L(Z)V

    .line 14
    .line 15
    .line 16
    sget-object v2, Lcom/p1/mobile/putong/util/launch/LaunchStep;->CreateMe:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 19
    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v2}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 30
    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->hasAuditedMarray()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    iput-boolean v2, v0, Ll/dkb;->e5:Z

    .line 43
    .line 44
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFakePlayEnable()Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    iput-boolean v2, v0, Ll/dkb;->f5:Z

    .line 53
    .line 54
    iget-object v0, v1, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 55
    .line 56
    sput-object v0, Ll/uqb0;->y0:Ljava/lang/String;
    :try_end_0
    .catch Lcom/tantanapp/common/utils/DBCorruptException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .line 58
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/CoreModule;->M()V

    .line 59
    .line 60
    .line 61
    new-instance v0, Ll/u17;

    .line 62
    .line 63
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    invoke-direct {v0, v1}, Ll/u17;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 66
    .line 67
    .line 68
    sput-object v0, Lcom/p1/mobile/putong/core/CoreModule;->n:Ll/u17;

    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->R()V

    .line 71
    .line 72
    .line 73
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->CoreOtherAfterSignIn:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 74
    .line 75
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {v1}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/CoreModule;->a:Ll/of00;

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Ll/of00;->g(Z)V

    .line 85
    .line 86
    .line 87
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 88
    .line 89
    .line 90
    if-eqz p1, :cond_0

    .line 91
    .line 92
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->C3()V

    .line 95
    .line 96
    .line 97
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 100
    .line 101
    invoke-virtual {p0}, Ll/dkb;->K7()Lrx/c;

    .line 102
    .line 103
    .line 104
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 107
    .line 108
    invoke-virtual {p0}, Ll/dkb;->H7()V

    .line 109
    .line 110
    .line 111
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->q2:Ll/ura;

    .line 114
    .line 115
    invoke-virtual {p0}, Ll/ura;->y3()V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :catch_0
    move-exception p1

    .line 120
    goto :goto_0

    .line 121
    :catch_1
    move-exception p1

    .line 122
    goto :goto_1

    .line 123
    :cond_1
    :try_start_1
    const-string p1, "[putong-common][userMeState]"

    .line 124
    .line 125
    invoke-static {p1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    new-instance p1, Lcom/tantanapp/common/utils/DBCorruptException;

    .line 129
    .line 130
    invoke-direct {p1, v0}, Lcom/tantanapp/common/utils/DBCorruptException;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    throw p1
    :try_end_1
    .catch Lcom/tantanapp/common/utils/DBCorruptException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 134
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_3

    .line 146
    .line 147
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    const-string v1, "Failed to change locale for db "

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-nez v0, :cond_2

    .line 158
    .line 159
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    const-string v1, "no such table"

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-eqz v0, :cond_3

    .line 170
    .line 171
    :cond_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/CoreModule;->J(Ljava/lang/Exception;)V

    .line 172
    .line 173
    .line 174
    new-instance p0, Lcom/p1/mobile/putong/app/SQLDBDamagedException;

    .line 175
    .line 176
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/app/SQLDBDamagedException;-><init>(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    throw p0

    .line 184
    :cond_3
    throw p1

    .line 185
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/CoreModule;->J(Ljava/lang/Exception;)V

    .line 189
    .line 190
    .line 191
    throw p1
.end method

.method public zf()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/CoreModule;->a:Ll/of00;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/of00;->l()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
