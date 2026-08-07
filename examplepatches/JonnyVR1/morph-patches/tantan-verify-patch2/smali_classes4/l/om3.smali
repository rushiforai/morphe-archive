.class public Ll/om3;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/sm3;",
        ">",
        "Ll/ar2<",
        "TT;>;"
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

.method public static synthetic f0(Ll/om3;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/om3;->m0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Ll/om3;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/om3;->p0(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic h0(Ll/om3;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/om3;->o0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic i0(Ll/om3;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/om3;->n0(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/om3;->k0(Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static k0(Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->l1:Lcom/p1/mobile/putong/core/api/o;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/o;->j3(Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private synthetic m0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/sm3;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/sm3;->w()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/sm3;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/sm3;->G()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Ll/sm3;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1}, Ll/sm3;->x(Ljava/util/Map;)V

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
    new-instance v0, Ll/im3;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/im3;-><init>(Ll/om3;)V

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

.method public l0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic n0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/sm3;

    .line 4
    .line 5
    const-string p2, "window.$$notifyPaySuccess$$"

    .line 6
    .line 7
    invoke-virtual {p0, p2, p1}, Ll/sm3;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic o0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/sm3;

    .line 4
    .line 5
    const-string v0, "window.$$abortPay$$"

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Ll/sm3;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic p0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/net/Uri;->getQuery()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string p2, "&"

    .line 21
    .line 22
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p0, Ll/sm3;

    .line 35
    .line 36
    invoke-virtual {p0, p2}, Ll/sm3;->F(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public q0(JLjava/lang/String;)V
    .locals 7

    .line 1
    invoke-static {p3}, Lcom/p1/mobile/putong/core/api/o;->l3(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v5, Ll/mm3;

    .line 10
    .line 11
    invoke-direct {v5, p0, v0}, Ll/mm3;-><init>(Ll/om3;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance v6, Ll/nm3;

    .line 15
    .line 16
    invoke-direct {v6, p0, v0}, Ll/nm3;-><init>(Ll/om3;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    move-wide v2, p1

    .line 20
    move-object v4, p3

    .line 21
    invoke-static/range {v1 .. v6}, Ll/why;->i(Lcom/p1/mobile/android/app/Act;JLjava/lang/String;Ll/y20;Ll/x20;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public r0(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->l1:Lcom/p1/mobile/putong/core/api/o;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/o;->q3()Lrx/c;

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
    new-instance v1, Ll/jm3;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/jm3;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/km3;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1}, Ll/km3;-><init>(Ll/om3;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/lm3;

    .line 28
    .line 29
    invoke-direct {p0}, Ll/lm3;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method
