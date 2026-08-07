.class public Ll/w56;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/b66;",
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

.method public static synthetic e0(Ll/w56;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w56;->g0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Ll/w56;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w56;->h0(Ll/pf60;)V

    return-void
.end method

.method private synthetic g0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/b66;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/b66;->c()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic h0(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/b66;

    .line 12
    .line 13
    check-cast v0, Ll/vg60;

    .line 14
    .line 15
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    check-cast p1, Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-lez p1, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p1, 0x0

    .line 28
    :goto_0
    invoke-virtual {p0, v0, p1}, Ll/b66;->b(Ljava/util/List;Z)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/t56;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/t56;-><init>(Ll/w56;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->vn()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/g;->qo()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ll/u56;

    .line 31
    .line 32
    invoke-direct {v3}, Ll/u56;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2, v3}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v0, v1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/v56;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/v56;-><init>(Ll/w56;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method
