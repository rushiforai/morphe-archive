.class public Ll/ihe0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/dhe0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f0(Ll/ihe0;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ihe0;->i0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic g0(Ll/ihe0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ihe0;->h0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic h0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/dhe0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dhe0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic i0(Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/dhe0;

    .line 4
    .line 5
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/dhe0;->d(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/fhe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fhe0;-><init>(Ll/ihe0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Ap()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/ghe0;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/ghe0;-><init>(Ll/ihe0;)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Ll/hhe0;

    .line 27
    .line 28
    invoke-direct {p0}, Ll/hhe0;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method
