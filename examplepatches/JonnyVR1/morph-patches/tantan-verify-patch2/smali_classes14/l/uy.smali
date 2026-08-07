.class public Ll/uy;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/r00;",
        ">;"
    }
.end annotation


# static fields
.field public static c:Z

.field public static d:Z

.field public static e:Z

.field public static f:Z


# instance fields
.field public a:Lcom/p1/mobile/putong/account/ui/camera/AccountVideoRecordFrag;

.field public b:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/camera/AccountVideoRecordFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/uy;->a:Lcom/p1/mobile/putong/account/ui/camera/AccountVideoRecordFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e0(Ll/uy;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uy;->q0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f0(Ll/uy;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uy;->p0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic g0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h0(Ll/uy;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uy;->n0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic i0(Ll/uy;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uy;->o0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic j0(Ll/uy;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uy;->t0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic k0(Ll/uy;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uy;->r0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic l0(Ll/uy;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uy;->s0(Ll/pf60;)V

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public m0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    new-instance v0, Ll/ly;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ly;-><init>(Ll/uy;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/my;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/my;-><init>(Ll/uy;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/uh;->d()Ll/uh;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Ll/uh;->f:Lrx/subjects/a;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/ny;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/ny;-><init>(Ll/uy;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/vo;->j()Ll/vo;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ll/vo;->h()V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Ll/vo;->f()V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 70
    .line 71
    check-cast p0, Ll/r00;

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Ll/r00;->k1(Landroid/os/Bundle;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final synthetic n0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/r00;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/r00;->r2()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/r00;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/r00;->v2()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Ll/r00;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/r00;->u2()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 26
    .line 27
    if-ne p1, v0, :cond_2

    .line 28
    .line 29
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p0, Ll/r00;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/r00;->s2()V

    .line 34
    .line 35
    .line 36
    :cond_2
    return-void
.end method

.method public final synthetic p0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/r00;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ll/r00;->g3(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic q0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/r00;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/r00;->q2()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic r0(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/nj;->C()Ll/nj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/nj;->T(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Ll/r00;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/r00;->C2(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic s0(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/r00;

    .line 12
    .line 13
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Ljava/util/List;

    .line 16
    .line 17
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p1, Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {p0, v0, p1}, Ll/r00;->w2(Ljava/util/List;Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic t0(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/r00;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/r00;->X2(Lcom/p1/mobile/putong/data/Media;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    check-cast p0, Ll/r00;

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1}, Ll/r00;->X2(Lcom/p1/mobile/putong/data/Media;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public u0()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/uy;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->c:Ll/lh;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/lh;->L()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->c:Ll/lh;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Ll/lh;->D(Z)Lrx/c;

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
    new-instance v1, Ll/oy;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/oy;-><init>(Ll/uy;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->c:Ll/lh;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/lh;->z()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/py;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/py;-><init>(Ll/uy;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget-object v1, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->c:Ll/lh;

    .line 65
    .line 66
    invoke-virtual {v1}, Ll/lh;->A()Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    sget-object v2, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->c:Ll/lh;

    .line 71
    .line 72
    invoke-virtual {v2}, Ll/lh;->y()Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    new-instance v3, Ll/qy;

    .line 77
    .line 78
    invoke-direct {v3}, Ll/qy;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-static {v1, v2, v3}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/ry;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/ry;-><init>(Ll/uy;)V

    .line 92
    .line 93
    .line 94
    new-instance p0, Ll/sy;

    .line 95
    .line 96
    invoke-direct {p0}, Ll/sy;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public x0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/uy;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public y0()V
    .locals 3

    .line 1
    new-instance v0, Ll/ws;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-direct {v0, v1, v2, v2}, Ll/ws;-><init>(Landroid/content/Context;ZZ)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ll/ws;->i()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    new-instance v2, Ll/ty;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/ty;-><init>(Ll/uy;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportLoaderManager()Landroidx/loader/app/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const/4 v1, 0x0

    .line 44
    const/4 v2, 0x0

    .line 45
    invoke-virtual {p0, v1, v2, v0}, Landroidx/loader/app/a;->e(ILandroid/os/Bundle;Landroidx/loader/app/a$a;)Ll/utv;

    .line 46
    .line 47
    .line 48
    return-void
.end method
