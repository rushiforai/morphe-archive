.class public Ll/dpi0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/ipi0;",
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

.method public static synthetic e0(Ll/dpi0;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dpi0;->i0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Ll/dpi0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dpi0;->h0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic h0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ipi0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ipi0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic i0(Ll/vg60;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/ipi0;

    .line 6
    .line 7
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/ipi0;->j(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/api0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/api0;-><init>(Ll/dpi0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->df()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/bpi0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/bpi0;-><init>(Ll/dpi0;)V

    .line 31
    .line 32
    .line 33
    new-instance p0, Ll/cpi0;

    .line 34
    .line 35
    invoke-direct {p0}, Ll/cpi0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method
