.class public Lcom/p1/mobile/putong/account/AccountModule;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/putong/module/Module;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "AccountModule"
    path = "/account_module/module"
.end annotation


# static fields
.field public static a:Landroid/app/Application;

.field public static b:Ll/uv;

.field public static c:Lcom/p1/mobile/putong/account/api/a;

.field public static d:Ll/pw;

.field public static e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

.field public static f:Ll/wf;

.field public static g:Ll/zj;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;
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

.method public static H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;
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

.method public static J()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;
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


# virtual methods
.method public Ec()V
    .locals 2

    .line 1
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/CommonData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/rrq;->e(Lcom/tantanapp/common/data/JsonAdapter;Ll/gq2;)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Ll/bp;

    .line 12
    .line 13
    invoke-direct {p0}, Ll/bp;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 17
    .line 18
    .line 19
    new-instance p0, Lcom/p1/mobile/putong/account/api/a;

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/api/a;-><init>()V

    .line 22
    .line 23
    .line 24
    sput-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 25
    .line 26
    new-instance p0, Ll/uv;

    .line 27
    .line 28
    invoke-direct {p0}, Ll/uv;-><init>()V

    .line 29
    .line 30
    .line 31
    sput-object p0, Lcom/p1/mobile/putong/account/AccountModule;->b:Ll/uv;

    .line 32
    .line 33
    new-instance p0, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 34
    .line 35
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;-><init>()V

    .line 36
    .line 37
    .line 38
    sput-object p0, Lcom/p1/mobile/putong/account/AccountModule;->e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 39
    .line 40
    const-string p0, "100032"

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    invoke-static {p0, v0}, Ll/tv;->a(Ljava/lang/String;Z)V

    .line 44
    .line 45
    .line 46
    new-instance p0, Ll/uai0;

    .line 47
    .line 48
    invoke-direct {p0}, Ll/uai0;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {p0}, Ll/tv;->b(Ll/sy3;)V

    .line 52
    .line 53
    .line 54
    new-instance p0, Ll/pw;

    .line 55
    .line 56
    invoke-direct {p0}, Ll/pw;-><init>()V

    .line 57
    .line 58
    .line 59
    sput-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 60
    .line 61
    new-instance p0, Ll/wf;

    .line 62
    .line 63
    invoke-direct {p0}, Ll/wf;-><init>()V

    .line 64
    .line 65
    .line 66
    sput-object p0, Lcom/p1/mobile/putong/account/AccountModule;->f:Ll/wf;

    .line 67
    .line 68
    sget-object p0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->ACCOUNT:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 69
    .line 70
    const/4 v0, 0x3

    .line 71
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;->H(Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;I)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Ll/djf0;->c()Ll/djf0;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Ll/djf0;->h()V

    .line 79
    .line 80
    .line 81
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
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Ma()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->g:Ll/zj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/zj;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance p0, Ll/zj;

    .line 9
    .line 10
    invoke-direct {p0}, Ll/zj;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p0}, Ll/l9c;->y(Ll/h9c;)V

    .line 18
    .line 19
    .line 20
    sput-object p0, Lcom/p1/mobile/putong/account/AccountModule;->g:Ll/zj;

    .line 21
    .line 22
    return-void
.end method

.method public Qh()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->g1()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/cqq;->e()Ll/cqq;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-class v0, Lcom/p1/mobile/putong/account/ui/jsbridge/AccountBridgeImplementation;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public ft()Lrx/c;
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
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getContext()Landroid/content/Context;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->a:Landroid/app/Application;

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
    sput-object p1, Lcom/p1/mobile/putong/account/AccountModule;->a:Landroid/app/Application;

    .line 4
    .line 5
    return-void
.end method

.method public ms()V
    .locals 0

    .line 1
    invoke-static {}, Ll/ike;->l()V

    .line 2
    .line 3
    .line 4
    const-string p0, ""

    .line 5
    .line 6
    sput-object p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->f:Ljava/lang/String;

    .line 7
    .line 8
    sget-object p0, Ll/ino;->INSTANCE:Ll/ino;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ino;->a()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public tr(Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/djf0;->i()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/djf0;->k()Ll/jxd0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getAuthData()Ll/gxd0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/data/AuthData;

    .line 26
    .line 27
    invoke-static {p0}, Ll/djf0;->j(Lcom/p1/mobile/putong/data/AuthData;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/djf0;->g()Ll/wyd0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/wyd0;->clear()Z

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->y8()V

    .line 42
    .line 43
    .line 44
    return-void
.end method
