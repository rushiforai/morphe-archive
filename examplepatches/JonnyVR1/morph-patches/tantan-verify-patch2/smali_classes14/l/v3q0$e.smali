.class public Ll/v3q0$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tvf;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/v3q0;-><init>(Ll/ner;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/tvf<",
        "Ll/a1w;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/account/data/ThirdPartyData;",
            "Lcom/p1/mobile/putong/data/ThirdPartyValidation;",
            "Lcom/p1/mobile/putong/data/SignUpData;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic b:Ll/v3q0;


# direct methods
.method public constructor <init>(Ll/v3q0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/f4q0;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/f4q0;-><init>(Ll/v3q0$e;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/v3q0$e;->a:Ll/a30;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic b(Ll/v3q0$e;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v3q0$e;->s()V

    return-void
.end method

.method public static synthetic c(Ll/v3q0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/v3q0$e;->z(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic e(Ll/v3q0$e;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v3q0$e;->t()V

    return-void
.end method

.method public static synthetic f(Ll/v3q0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v3q0$e;->y(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g(Ll/v3q0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v3q0$e;->C(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/putong/data/SignUpData;)V

    return-void
.end method

.method public static synthetic h(Ll/v3q0$e;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v3q0$e;->u()V

    return-void
.end method

.method public static synthetic i(Ll/v3q0$e;Lcom/p1/mobile/putong/data/ThirdPartyValidation;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/v3q0$e;->q(Lcom/p1/mobile/putong/data/ThirdPartyValidation;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic j(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/data/SignUpData;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerLib;->getAppsFlyerUID(Landroid/content/Context;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->facebook:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 21
    .line 22
    return-object p0
.end method

.method public static synthetic k(Ll/v3q0$e;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v3q0$e;->A()V

    return-void
.end method

.method public static synthetic l(Ll/v3q0$e;Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v3q0$e;->v(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic m(Ll/v3q0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v3q0$e;->B(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/putong/data/SignUpData;)V

    return-void
.end method

.method public static synthetic n(Ll/v3q0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/putong/data/ThirdPartyValidation;Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/v3q0$e;->r(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/putong/data/ThirdPartyValidation;Lcom/p1/mobile/putong/data/SignUpData;)V

    return-void
.end method

.method public static synthetic o(Ll/v3q0$e;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v3q0$e;->x(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic p(Ll/v3q0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/v3q0$e;->w(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final synthetic A()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/v3q0;->A3(Ll/v3q0;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/o6;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Ll/o6;->p(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic B(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/v3q0$e;->a:Ll/a30;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, p1, v0, p2}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic C(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 1

    .line 1
    new-instance v0, Ll/b4q0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/b4q0;-><init>(Ll/v3q0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final D(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/account/data/ThirdPartyData;)V
    .locals 4

    .line 1
    new-instance v0, Ll/y3q0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/y3q0;-><init>(Ll/v3q0$e;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p2, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p2, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyToken:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x1

    .line 18
    invoke-static {p1, v2, v3}, Ll/ike;->r(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;Z)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    new-instance v2, Ll/z3q0;

    .line 27
    .line 28
    invoke-direct {v2, p0, p1}, Ll/z3q0;-><init>(Ll/v3q0$e;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 29
    .line 30
    .line 31
    new-instance p1, Ll/a4q0;

    .line 32
    .line 33
    invoke-direct {p1, p0, p2, v0}, Ll/a4q0;-><init>(Ll/v3q0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v2, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public E(Ll/a1w;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/a1w;->a()Lcom/facebook/AccessToken;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {v0, p1}, Ll/v3q0;->t3(Ll/v3q0;Lcom/facebook/AccessToken;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ll/c4q0;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Ll/c4q0;-><init>(Ll/v3q0$e;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->new_()Lcom/p1/mobile/putong/account/data/ThirdPartyData;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 20
    .line 21
    invoke-static {v1}, Ll/v3q0;->p3(Ll/v3q0;)Lcom/facebook/AccessToken;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Lcom/facebook/AccessToken;->o()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyId:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v1, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 32
    .line 33
    invoke-static {v1}, Ll/v3q0;->p3(Ll/v3q0;)Lcom/facebook/AccessToken;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Lcom/facebook/AccessToken;->n()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyToken:Ljava/lang/String;

    .line 42
    .line 43
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/account/api/a;->C2(Lcom/p1/mobile/putong/account/data/ThirdPartyData;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    new-instance v2, Ll/d4q0;

    .line 50
    .line 51
    invoke-direct {v2, p0, v0}, Ll/d4q0;-><init>(Ll/v3q0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;)V

    .line 52
    .line 53
    .line 54
    new-instance v3, Ll/e4q0;

    .line 55
    .line 56
    invoke-direct {v3, p0, v0, p1}, Ll/e4q0;-><init>(Ll/v3q0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;)V

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    invoke-static {v2, v3, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public a(Lcom/facebook/FacebookException;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->m(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/w3q0;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/w3q0;-><init>(Ll/v3q0$e;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onCancel()V
    .locals 1

    .line 1
    new-instance v0, Ll/g4q0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/g4q0;-><init>(Ll/v3q0$e;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/a1w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v3q0$e;->E(Ll/a1w;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/data/ThirdPartyValidation;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyValidation:Lcom/p1/mobile/putong/data/ThirdPartyValidation;

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0, p2, p3}, Ll/v3q0$e;->D(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/account/data/ThirdPartyData;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/putong/data/ThirdPartyValidation;Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/h4q0;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/h4q0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/i4q0;

    .line 22
    .line 23
    invoke-direct {v1, p0, p2, p3, p1}, Ll/i4q0;-><init>(Ll/v3q0$e;Lcom/p1/mobile/putong/data/ThirdPartyValidation;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/account/data/ThirdPartyData;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic s()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/v3q0;->z3(Ll/v3q0;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/o6;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Ll/o6;->p(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic t()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/v3q0;->y3(Ll/v3q0;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/o6;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Ll/o6;->p(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic u()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/v3q0;->B3(Ll/v3q0;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/o6;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Ll/o6;->p(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/api/a;->Q0()Ll/wyd0;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 13
    .line 14
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 21
    .line 22
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/api/a;->O0()Ll/mxd0;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 27
    .line 28
    invoke-virtual {p2, v0}, Ll/mxd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 32
    .line 33
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_1

    .line 38
    .line 39
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 40
    .line 41
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/api/a;->P0()Ll/wyd0;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p2, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    :cond_1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    iget-object v0, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 61
    .line 62
    if-eqz p2, :cond_2

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    iget-object p0, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->b2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    invoke-static {v0}, Ll/v3q0;->s3(Ll/v3q0;)Ll/y20;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 2
    .line 3
    invoke-static {v0, p3}, Ll/v3q0;->v3(Ll/v3q0;Ljava/lang/Throwable;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/v3q0;->r3(Ll/v3q0;)Ll/b30;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "facebook"

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {p0, p3, p1, p2, v0}, Ll/b30;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p3}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic x(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/v3q0;->q3(Ll/v3q0;)Ll/x20;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic y(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/uxj0;)V
    .locals 2

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    iget-object v0, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/v3q0;->p3(Ll/v3q0;)Lcom/facebook/AccessToken;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/facebook/AccessToken;->o()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 14
    .line 15
    invoke-static {v1}, Ll/v3q0;->p3(Ll/v3q0;)Lcom/facebook/AccessToken;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Lcom/facebook/AccessToken;->n()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/account/api/a;->Y1(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    new-instance v0, Ll/j4q0;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/j4q0;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2, v0}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    new-instance v0, Ll/k4q0;

    .line 37
    .line 38
    invoke-direct {v0, p0, p1}, Ll/k4q0;-><init>(Ll/v3q0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;)V

    .line 39
    .line 40
    .line 41
    new-instance p1, Ll/x3q0;

    .line 42
    .line 43
    invoke-direct {p1, p0}, Ll/x3q0;-><init>(Ll/v3q0$e;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic z(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 2
    .line 3
    invoke-static {v0, p3}, Ll/v3q0;->v3(Ll/v3q0;Ljava/lang/Throwable;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/v3q0$e;->b:Ll/v3q0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/v3q0;->r3(Ll/v3q0;)Ll/b30;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "facebook"

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {p0, p3, p1, p2, v0}, Ll/b30;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p3}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
