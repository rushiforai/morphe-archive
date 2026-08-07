.class public Ll/xbi;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/bci;",
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

.method public static synthetic e0(Ll/xbi;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xbi;->j0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/xbi;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xbi;->k0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Ll/xbi;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xbi;->i0(Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method

.method private synthetic k0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/bci;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/bci;->x()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/bci;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/bci;->J()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Ll/bci;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1}, Ll/bci;->z(Ljava/util/Map;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ubi;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ubi;-><init>(Ll/xbi;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public h0()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->accessOutterToken()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/vbi;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/vbi;-><init>(Ll/xbi;)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/wbi;

    .line 17
    .line 18
    invoke-direct {v2, p0}, Ll/wbi;-><init>(Ll/xbi;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic i0(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bci;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/bci;->I(Lcom/p1/mobile/putong/data/AuthData;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic j0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bci;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/bci;->H(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
