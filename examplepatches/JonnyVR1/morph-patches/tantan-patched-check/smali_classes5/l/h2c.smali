.class public Ll/h2c;
.super Ll/lup0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/lup0<",
        "Ll/i2c;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lup0;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic h0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/i2c;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/i2c;->R()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic k0(Ll/h2c;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/h2c;->o0(Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method

.method public static synthetic l0(Ll/h2c;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/h2c;->h0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic m0(Ll/h2c;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/h2c;->p0(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic o0(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/i2c;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/i2c;->X(Lcom/p1/mobile/putong/data/AuthData;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic p0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/i2c;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/i2c;->W()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/lup0;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/g2c;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/g2c;-><init>(Ll/h2c;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public n0()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->accessOutterToken()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/e2c;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/e2c;-><init>(Ll/h2c;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/f2c;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/f2c;-><init>(Ll/h2c;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method
