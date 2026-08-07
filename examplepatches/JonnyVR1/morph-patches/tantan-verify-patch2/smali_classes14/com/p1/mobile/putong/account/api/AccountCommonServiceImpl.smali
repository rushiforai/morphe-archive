.class public Lcom/p1/mobile/putong/account/api/AccountCommonServiceImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "putong-common \u4f7f\u7528\u7684 account \u670d\u52a1"
    path = "/account_common_service/service"
.end annotation


# instance fields
.field public a:Ll/m2;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qc;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/qc;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/account/api/AccountCommonServiceImpl;->a:Ll/m2;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public D5()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ike;->i()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public G2()Ll/qyx;
    .locals 0

    .line 1
    new-instance p0, Ll/svc0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/svc0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public G9()Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 8
    .line 9
    const-string v0, "male"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public Vs()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a()Ll/bo;
    .locals 0

    .line 1
    invoke-static {}, Ll/co;->d()Ll/co;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public accessOutterToken()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AuthData;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->F0()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public clientNeedsForceUpdate()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->J0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getSignOutJumpAct()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSignUpData()Lcom/p1/mobile/putong/data/SignUpData;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public sendThirdPartLoginResult(ILjava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->k(ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public signOut()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->p2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t2()Ll/s0y;
    .locals 0

    .line 1
    new-instance p0, Ll/tvc0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/tvc0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public x9()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method
