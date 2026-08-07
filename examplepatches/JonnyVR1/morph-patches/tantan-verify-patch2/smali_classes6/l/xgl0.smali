.class public Ll/xgl0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/yil0;",
        ">;"
    }
.end annotation


# static fields
.field public static c:Z

.field public static d:Z

.field public static e:Z

.field public static f:Z


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/camera/videorecord/VideoRecordFrag;

.field public b:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/videorecord/VideoRecordFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xgl0;->a:Lcom/p1/mobile/putong/feed/newui/camera/videorecord/VideoRecordFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e0(Ll/xgl0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xgl0;->n0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Ll/xgl0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xgl0;->s0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic g0(Ll/xgl0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xgl0;->o0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic h0(Ll/xgl0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xgl0;->p0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic i0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j0(Ll/xgl0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xgl0;->q0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic k0(Ll/xgl0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xgl0;->t0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic l0(Ll/xgl0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xgl0;->r0(Ljava/util/List;)V

    return-void
.end method

.method private synthetic n0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yil0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yil0;->Q2()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic o0(Lcom/p1/mobile/android/app/c;)V
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
    check-cast p0, Ll/yil0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/yil0;->T2()V

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
    check-cast p0, Ll/yil0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/yil0;->S2()V

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
    check-cast p0, Ll/yil0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/yil0;->R2()V

    .line 34
    .line 35
    .line 36
    :cond_2
    return-void
.end method

.method private synthetic p0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yil0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ll/yil0;->G3(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic q0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yil0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yil0;->P2()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic r0(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/oc4;->O()Ll/oc4;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/oc4;->j0(Ljava/util/List;)V

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
    check-cast p0, Ll/yil0;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/yil0;->a3(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private synthetic s0(Ll/pf60;)V
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
    check-cast p0, Ll/yil0;

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
    invoke-virtual {p0, v0, p1}, Ll/yil0;->U2(Ljava/util/List;Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method private synthetic t0(Ljava/util/List;)V
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
    check-cast p0, Ll/yil0;

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
    invoke-virtual {p0, p1}, Ll/yil0;->w3(Lcom/p1/mobile/putong/data/Media;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    check-cast p0, Ll/yil0;

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1}, Ll/yil0;->w3(Lcom/p1/mobile/putong/data/Media;)V

    .line 26
    .line 27
    .line 28
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
    new-instance v0, Ll/pgl0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pgl0;-><init>(Ll/xgl0;)V

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
    new-instance v1, Ll/qgl0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/qgl0;-><init>(Ll/xgl0;)V

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
    invoke-static {}, Ll/l94;->e()Ll/l94;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Ll/l94;->f:Lrx/subjects/a;

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
    new-instance v1, Ll/rgl0;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/rgl0;-><init>(Ll/xgl0;)V

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
    invoke-static {}, Ll/doi;->j()Ll/doi;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ll/doi;->h()V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Ll/doi;->f()V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 70
    .line 71
    check-cast p0, Ll/yil0;

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Ll/yil0;->C1(Landroid/os/Bundle;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public u0()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/xgl0;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/api/a;->P2()V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/api/a;->g2(Z)Lrx/c;

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
    new-instance v1, Ll/tgl0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/tgl0;-><init>(Ll/xgl0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/api/a;->U1()Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/ugl0;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/ugl0;-><init>(Ll/xgl0;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/api/a;->W1()Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/api/a;->T1()Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    new-instance v2, Ll/qy;

    .line 69
    .line 70
    invoke-direct {v2}, Ll/qy;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/vgl0;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/vgl0;-><init>(Ll/xgl0;)V

    .line 80
    .line 81
    .line 82
    new-instance p0, Ll/wgl0;

    .line 83
    .line 84
    invoke-direct {p0}, Ll/wgl0;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public x0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/xgl0;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public y0()V
    .locals 3

    .line 1
    new-instance v0, Ll/avx;

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
    invoke-direct {v0, v1, v2, v2}, Ll/avx;-><init>(Landroid/content/Context;ZZ)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ll/avx;->t()Lrx/c;

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
    new-instance v2, Ll/sgl0;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/sgl0;-><init>(Ll/xgl0;)V

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
