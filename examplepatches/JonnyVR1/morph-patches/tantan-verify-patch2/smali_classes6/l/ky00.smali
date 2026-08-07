.class public Ll/ky00;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/c110;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Z

.field public d:Z

.field public e:Ljava/lang/Boolean;


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

.method private synthetic E0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/c110;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/c110;->x(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic O0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/c110;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/c110;->r()V

    .line 6
    .line 7
    .line 8
    iget-boolean p1, p0, Ll/ky00;->c:Z

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v0, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->ao(Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/jy00;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/jy00;-><init>(Ll/ky00;)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/vx00;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/vx00;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast p1, Ll/c110;

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/c110;->v()V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p1}, Ll/mrb0;->y(Ljava/lang/String;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    new-instance v0, Ll/wx00;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Ll/wx00;-><init>(Ll/ky00;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    new-instance v0, Ll/xx00;

    .line 71
    .line 72
    invoke-direct {v0, p0}, Ll/xx00;-><init>(Ll/ky00;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    :goto_0
    invoke-virtual {p0}, Ll/ky00;->z0()Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_1

    .line 87
    .line 88
    new-instance p1, Ll/yx00;

    .line 89
    .line 90
    invoke-direct {p1, p0}, Ll/yx00;-><init>(Ll/ky00;)V

    .line 91
    .line 92
    .line 93
    const/4 v0, 0x0

    .line 94
    invoke-virtual {p0, p1, v0}, Ll/ar2;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    new-instance v0, Ll/zx00;

    .line 99
    .line 100
    invoke-direct {v0, p0}, Ll/zx00;-><init>(Ll/ky00;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    :cond_1
    return-void
.end method

.method public static synthetic e0(Ll/ky00;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ky00;->E0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic f0(Ll/ky00;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ky00;->H0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic g0(Ll/ky00;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ky00;->L0()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h0(Ll/ky00;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ky00;->C0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic i0(Ll/ky00;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ky00;->G0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic j0(Ll/ky00;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ky00;->I0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k0(Ll/ky00;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ky00;->O0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic l0(Ll/ky00;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ky00;->D0()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m0(Ll/ky00;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ky00;->N0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic n0(Ll/ky00;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ky00;->Q0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    return-void
.end method

.method public static synthetic o0(Ll/ky00;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ky00;->J0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic p0(Ll/ky00;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ky00;->A0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic r0(Ll/ky00;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ky00;->F0()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s0(Ll/ky00;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ky00;->P0()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final synthetic A0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/ky00;->d:Z

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic C0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/c110;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/c110;->L()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic D0()Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/mrb0;->W(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic F0()Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/api/b;->l4(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 9
    .line 10
    iget-object p0, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/api/b;->Z3(Ljava/lang/String;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final synthetic G0(Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/c110;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/c110;->J(Ll/vg60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic H0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/c110;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/c110;->K(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic I0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iput-object p1, p0, Ll/ky00;->e:Ljava/lang/Boolean;

    .line 4
    .line 5
    return-void
.end method

.method public final synthetic J0(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/ky00;->e:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    check-cast v0, Ll/c110;

    .line 12
    .line 13
    iget-object p0, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ll/c110;->N(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    check-cast v0, Ll/c110;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/c110;->u()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic L0()Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/mrb0;->a(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic N0(Ll/uxj0;)V
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

.method public final synthetic P0()Lrx/c;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/mrb0;->W(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/ay00;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/ay00;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic Q0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/c110;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/c110;->w(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public R0(Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "moment"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/api/b;->j4(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast p0, Ll/c110;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/c110;->I()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public S0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ky00;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput-boolean p1, p0, Ll/ky00;->c:Z

    .line 18
    .line 19
    return-void
.end method

.method public U0()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Ll/og3;->c:Ll/og3;

    .line 4
    .line 5
    const-string v1, "other user id"

    .line 6
    .line 7
    filled-new-array {v1, p0, v0}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public u0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ky00;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, -0x1

    .line 10
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setResult(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public x0(Landroid/view/Menu;)V
    .locals 14

    .line 1
    invoke-virtual {p0}, Ll/ky00;->z0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Ll/mrb0;->X(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v1, "me:"

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v1, "; ab_group:"

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->E()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v1, "; other:"

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v1, "; from:"

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Ll/ky00;->b:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    new-instance v1, Ljava/lang/Exception;

    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    const/16 v0, 0x32

    .line 91
    .line 92
    invoke-static {v1, v0}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 93
    .line 94
    .line 95
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iget-object v4, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 100
    .line 101
    new-instance v8, Ll/ux00;

    .line 102
    .line 103
    invoke-direct {v8, p0}, Ll/ux00;-><init>(Ll/ky00;)V

    .line 104
    .line 105
    .line 106
    const/4 v12, 0x0

    .line 107
    const/4 v13, 0x1

    .line 108
    const/4 v5, 0x0

    .line 109
    const/4 v6, 0x0

    .line 110
    const/4 v7, 0x0

    .line 111
    const/4 v9, 0x0

    .line 112
    const/4 v10, 0x0

    .line 113
    const/4 v11, 0x1

    .line 114
    move-object v3, p1

    .line 115
    invoke-static/range {v2 .. v13}, Ll/k3h;->G0(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;Ll/pcj;Ll/pcj;Ll/x20;Ll/y20;Ll/y20;Ll/y20;ZZZ)Landroid/view/Menu;

    .line 116
    .line 117
    .line 118
    :cond_1
    return-void
.end method

.method public y0()V
    .locals 2

    .line 1
    new-instance v0, Ll/by00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/by00;-><init>(Ll/ky00;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/cy00;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/cy00;-><init>(Ll/ky00;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/dy00;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/dy00;-><init>(Ll/ky00;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/ey00;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/ey00;-><init>(Ll/ky00;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/fy00;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/fy00;-><init>(Ll/ky00;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    new-instance v0, Ll/gy00;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Ll/gy00;-><init>(Ll/ky00;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/hy00;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/hy00;-><init>(Ll/ky00;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/api/b;->M:Lcom/p1/mobile/putong/feed/api/b$a;

    .line 75
    .line 76
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/iy00;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/iy00;-><init>(Ll/ky00;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public z0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ky00;->e:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Ll/mrb0;->z(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/ky00;->e:Ljava/lang/Boolean;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/ky00;->e:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method
