.class public Ll/qw10;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/Music;

.field public b:Z

.field public c:Z


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

.method private synthetic C0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 2
    .line 3
    iget-object v0, p0, Ll/qw10;->a:Lcom/p1/mobile/putong/data/Music;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/api/a;->M2(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/mw10;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/mw10;-><init>(Ll/qw10;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ll/nw10;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/nw10;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->r()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private synthetic D0(Landroid/util/Pair;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qw10;->a:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/lang/CharSequence;

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 18
    .line 19
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p1, Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->B2(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static synthetic e0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q1:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f0(Ll/qw10;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qw10;->A0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic g0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q1:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic h0(Ll/qw10;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qw10;->D0(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic i0(Ll/qw10;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qw10;->H0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic j0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q1:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic k0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/l120;->d()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ll/l120;->o(J)Z

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/l120;->h()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic l0(Ll/qw10;Lcom/p1/mobile/putong/data/Music;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qw10;->E0(Lcom/p1/mobile/putong/data/Music;)V

    return-void
.end method

.method public static synthetic m0(Ll/qw10;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qw10;->x0(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    return-void
.end method

.method public static synthetic n0(Ll/qw10;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qw10;->F0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic o0(Ll/qw10;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qw10;->C0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic p0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jka;->p0:Lrx/subjects/b;

    .line 4
    .line 5
    return-object v0
.end method

.method public static synthetic q0(Ll/qw10;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qw10;->y0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic r0(Ll/qw10;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qw10;->G0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic s0(Ll/qw10;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qw10;->z0(Ljava/lang/Throwable;)V

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
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->y2()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic E0(Lcom/p1/mobile/putong/data/Music;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qw10;->a:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iput-object p1, p0, Ll/qw10;->a:Lcom/p1/mobile/putong/data/Music;

    .line 15
    .line 16
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->z2(Lcom/p1/mobile/putong/data/Music;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->F2()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic F0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->o2(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic G0(Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/qw10;->I0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic H0(Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/qw10;->I0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final I0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qw10;->a:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    iput-boolean p1, v0, Lcom/p1/mobile/putong/data/Music;->favor:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->v0:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->n0:I

    .line 11
    .line 12
    :goto_0
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 13
    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 16
    .line 17
    iget-object v0, p0, Ll/qw10;->a:Lcom/p1/mobile/putong/data/Music;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/api/a;->W2(Lcom/p1/mobile/putong/data/Music;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->F2()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public J0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/qw10;->a:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Music;->favor:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/api/a;->Z1(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/cw10;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/cw10;-><init>(Ll/qw10;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/dw10;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/dw10;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/api/a;->R1(Lcom/p1/mobile/putong/data/Music;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance v0, Ll/ew10;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/ew10;-><init>(Ll/qw10;)V

    .line 50
    .line 51
    .line 52
    new-instance p0, Ll/fw10;

    .line 53
    .line 54
    invoke-direct {p0}, Ll/fw10;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public L0(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 1

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 4
    .line 5
    invoke-static {p1, p0, v0}, Ll/l120;->n(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;II)J

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public N0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/l120;->d()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ll/l120;->o(J)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/bw10;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bw10;-><init>(Ll/qw10;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/hw10;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/hw10;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/api/a;->R2()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/iw10;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/iw10;-><init>(Ll/qw10;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/api/a;->S1()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/jw10;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/jw10;-><init>(Ll/qw10;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    new-instance v0, Ll/kw10;

    .line 59
    .line 60
    invoke-direct {v0}, Ll/kw10;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/lw10;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/lw10;-><init>(Ll/qw10;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public t0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/orb0;->I()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-boolean v0, p0, Ll/qw10;->b:Z

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->H0:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->A2(Z)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Ll/gw10;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/gw10;-><init>(Ll/qw10;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 39
    .line 40
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->p2()Ll/rv10;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object p0, p0, Ll/qw10;->a:Lcom/p1/mobile/putong/data/Music;

    .line 47
    .line 48
    invoke-virtual {v1, p0, v0}, Ll/rv10;->K(Lcom/p1/mobile/putong/data/Music;Ll/y20;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public u0()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/qw10;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/qw10;->c:Z

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 10
    .line 11
    iget-object v1, p0, Ll/qw10;->a:Lcom/p1/mobile/putong/data/Music;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/api/a;->S2(Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/ow10;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/ow10;-><init>(Ll/qw10;)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Ll/pw10;

    .line 29
    .line 30
    invoke-direct {v2, p0}, Ll/pw10;-><init>(Ll/qw10;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic x0(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->k2()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->pickMediasWithInstaPicker(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic y0(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/qw10;->c:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->y2()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic z0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/qw10;->c:Z

    .line 3
    .line 4
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q1:I

    .line 5
    .line 6
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
