.class public Ll/esb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/esb$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/esb$a;-><init>(Ll/esb;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/esb;->a:Ljava/lang/Runnable;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/lang/Boolean;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic b(Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    if-eqz p0, :cond_0

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

.method public static synthetic c(Ll/esb;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/esb;->g(Z)V

    return-void
.end method

.method public static synthetic d(Ll/esb;Ll/kcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/esb;->f(Ll/kcg0;)V

    return-void
.end method

.method public static bridge synthetic e(Ll/esb;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/esb;->a:Ljava/lang/Runnable;

    return-object p0
.end method


# virtual methods
.method public final synthetic f(Ll/kcg0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/esb;->a:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ll/kcg0;->unsubscribe()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final g(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/esb;->a:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/esb;->a:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public h()Ll/kcg0;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/zrb;

    .line 14
    .line 15
    invoke-direct {v2}, Ll/zrb;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/asb;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/asb;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/bsb;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/bsb;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/csb;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/csb;-><init>(Ll/esb;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/dsb;

    .line 54
    .line 55
    invoke-direct {v1, p0, v0}, Ll/dsb;-><init>(Ll/esb;Ll/kcg0;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
