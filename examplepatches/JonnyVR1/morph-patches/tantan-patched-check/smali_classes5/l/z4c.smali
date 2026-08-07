.class public Ll/z4c;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/k5c;",
        ">;"
    }
.end annotation


# instance fields
.field public a:J

.field public b:J

.field public c:J


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

.method public static synthetic e0(Ll/z4c;Lrx/Notification;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z4c;->s0(Lrx/Notification;)V

    return-void
.end method

.method public static synthetic f0(Ll/z4c;Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/AccountErrorResponse;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/z4c;->x0(Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/AccountErrorResponse;)V

    return-void
.end method

.method public static synthetic g0(Ll/z4c;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z4c;->u0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic h0(Ll/z4c;Lcom/p1/mobile/putong/data/DownloadDataCheck;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z4c;->q0(Lcom/p1/mobile/putong/data/DownloadDataCheck;)V

    return-void
.end method

.method public static synthetic i0(Ll/z4c;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z4c;->r0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0()Ll/uxj0;
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Ll/ecj;->E()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/uqb0;->t0()Ljava/io/File;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Ll/oki;->b(Ljava/io/File;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Ll/am2;->d:Ljava/io/File;

    .line 12
    .line 13
    invoke-static {v0}, Ll/oki;->b(Ljava/io/File;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Ll/am2;->e:Ljava/io/File;

    .line 17
    .line 18
    invoke-static {v0}, Ll/oki;->b(Ljava/io/File;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/io/File;

    .line 22
    .line 23
    sget-object v1, Ll/uc00;->a:Ljava/lang/String;

    .line 24
    .line 25
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0}, Ll/oki;->b(Ljava/io/File;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ljava/io/File;

    .line 32
    .line 33
    sget-object v1, Ll/uc00;->b:Ljava/lang/String;

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0}, Ll/oki;->b(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catch_0
    move-exception v0

    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    :catch_1
    :goto_0
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 47
    .line 48
    return-object v0
.end method

.method public static synthetic k0(Ll/z4c;ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/z4c;->t0(ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic l0(Ll/z4c;Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z4c;->y0(Ll/x20;Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic u0(Landroid/os/Bundle;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/uqb0;->t0()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/oki;->p(Ljava/io/File;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iput-wide v0, p0, Ll/z4c;->a:J

    .line 10
    .line 11
    sget-object p1, Ll/am2;->d:Ljava/io/File;

    .line 12
    .line 13
    invoke-static {p1}, Ll/oki;->p(Ljava/io/File;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iput-wide v0, p0, Ll/z4c;->b:J

    .line 18
    .line 19
    sget-object p1, Ll/am2;->e:Ljava/io/File;

    .line 20
    .line 21
    invoke-static {p1}, Ll/oki;->p(Ljava/io/File;)J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iput-wide v0, p0, Ll/z4c;->c:J

    .line 26
    .line 27
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p1, Ll/k5c;

    .line 30
    .line 31
    iget-wide v2, p0, Ll/z4c;->a:J

    .line 32
    .line 33
    iget-wide v4, p0, Ll/z4c;->b:J

    .line 34
    .line 35
    add-long/2addr v2, v4

    .line 36
    add-long/2addr v2, v0

    .line 37
    invoke-static {v2, v3}, Ll/a9g0;->k(J)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1, v0}, Ll/k5c;->H(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->i()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast p0, Ll/k5c;

    .line 53
    .line 54
    const/4 p1, 0x1

    .line 55
    invoke-virtual {p0, p1}, Ll/k5c;->p(Z)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method


# virtual methods
.method public A0()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->l0:Ll/g1y;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->runnerStop()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public C0(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    const/4 p3, 0x1

    .line 8
    if-ne p1, p3, :cond_0

    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    if-ne p2, p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/z4c;->n0()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public D0(Ljava/lang/String;Ll/x20;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/data/EmailVerifyData;->createData(Ljava/lang/String;)Lcom/p1/mobile/putong/data/EmailVerifyData;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->downloadDataVerifyEmail(Lcom/p1/mobile/putong/data/EmailVerifyData;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/v4c;

    .line 27
    .line 28
    invoke-direct {v1, p0, p2, p1}, Ll/v4c;-><init>(Ll/z4c;Ll/x20;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    new-instance p1, Ll/w4c;

    .line 32
    .line 33
    invoke-direct {p1, p0, p2}, Ll/w4c;-><init>(Ll/z4c;Ll/x20;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/t4c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/t4c;-><init>(Ll/z4c;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final m0(J)Z
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    mul-long/2addr p1, v2

    .line 8
    sub-long/2addr v0, p1

    .line 9
    const-wide/32 p0, 0x240c8400

    .line 10
    .line 11
    .line 12
    cmp-long p0, v0, p0

    .line 13
    .line 14
    if-lez p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public n0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->checkDownloadData()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/r4c;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/r4c;-><init>(Ll/z4c;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/s4c;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/s4c;-><init>(Ll/z4c;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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

.method public o0()V
    .locals 2

    .line 1
    new-instance v0, Ll/x4c;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/x4c;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lrx/c;->materialize()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/y4c;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/y4c;-><init>(Ll/z4c;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public p0(I)Lcom/p1/mobile/android/app/Dialog$g;
    .locals 1

    .line 1
    new-instance v0, Ll/u4c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/u4c;-><init>(Ll/z4c;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic q0(Lcom/p1/mobile/putong/data/DownloadDataCheck;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/DownloadDataCheck;->last_apply_time:J

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Ll/z4c;->m0(J)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    check-cast p0, Ll/k5c;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/k5c;->L()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    check-cast p0, Ll/k5c;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/k5c;->q()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic r0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic s0(Lrx/Notification;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/k5c;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/k5c;->u()V

    .line 6
    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    iput-wide v0, p0, Ll/z4c;->c:J

    .line 11
    .line 12
    iput-wide v0, p0, Ll/z4c;->b:J

    .line 13
    .line 14
    iput-wide v0, p0, Ll/z4c;->a:J

    .line 15
    .line 16
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Ll/k5c;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/a9g0;->k(J)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/k5c;->I(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic t0(ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    if-eq p1, p4, :cond_2

    .line 2
    .line 3
    if-nez p4, :cond_0

    .line 4
    .line 5
    sget-object p1, Ll/jm5;->c:Ll/jxd0;

    .line 6
    .line 7
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    sget-object p1, Ll/jm5;->a:Ll/jxd0;

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p1, 0x1

    .line 19
    if-ne p4, p1, :cond_1

    .line 20
    .line 21
    sget-object p1, Ll/jm5;->c:Ll/jxd0;

    .line 22
    .line 23
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    sget-object p1, Ll/jm5;->a:Ll/jxd0;

    .line 29
    .line 30
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    sget-object p1, Ll/jm5;->c:Ll/jxd0;

    .line 37
    .line 38
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    sget-object p1, Ll/jm5;->a:Ll/jxd0;

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast p0, Ll/k5c;

    .line 51
    .line 52
    invoke-virtual {p0, p4}, Ll/k5c;->G(I)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ll/lj1;->b()Ll/lj1;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ll/lj1;->a()Lrx/subjects/a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    return-void
.end method

.method public final synthetic x0(Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/AccountErrorResponse;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/ui/settings/verifyemail/EmailSendedAct;->Z1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 p2, 0x1

    .line 24
    invoke-virtual {p1, p0, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic y0(Ll/x20;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    instance-of v0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 13
    .line 14
    iget p2, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 15
    .line 16
    const v0, 0x9c43

    .line 17
    .line 18
    .line 19
    if-eq p2, v0, :cond_1

    .line 20
    .line 21
    const v0, 0x9c9a

    .line 22
    .line 23
    .line 24
    if-eq p2, v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-interface {p1}, Ll/x20;->call()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    sget v0, Lcom/p1/mobile/putong/core/R$string;->J5:I

    .line 39
    .line 40
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Tr:I

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p1, p2, p0}, Ll/g6e;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->G8:I

    .line 59
    .line 60
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    instance-of p0, p2, Lcom/p1/mobile/putong/api/api/TantanException$ServerException;

    .line 65
    .line 66
    if-eqz p0, :cond_4

    .line 67
    .line 68
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$ServerException;

    .line 69
    .line 70
    iget p0, p2, Lcom/p1/mobile/putong/api/api/TantanException$ServerException;->code:I

    .line 71
    .line 72
    const p1, 0xc351

    .line 73
    .line 74
    .line 75
    if-ne p0, p1, :cond_3

    .line 76
    .line 77
    sget p0, Lcom/p1/mobile/putong/core/R$string;->I5:I

    .line 78
    .line 79
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 80
    .line 81
    .line 82
    :cond_3
    :goto_0
    return-void

    .line 83
    :cond_4
    invoke-static {p2}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public z0()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->l0:Ll/g1y;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->runnerStart()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
