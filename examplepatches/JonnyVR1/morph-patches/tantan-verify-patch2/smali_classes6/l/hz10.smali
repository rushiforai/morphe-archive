.class public Ll/hz10;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/data/MusicCategory;

.field public b:Z


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

.method public static synthetic e0(Ll/hz10;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hz10;->o0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/hz10;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hz10;->q0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g0(Ll/hz10;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hz10;->n0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic h0(Ll/hz10;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hz10;->p0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic i0(Ll/hz10;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hz10;->r0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Ll/hz10;Lcom/p1/mobile/putong/feed/data/MusicCategory;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hz10;->s0(Lcom/p1/mobile/putong/feed/data/MusicCategory;Landroid/os/Bundle;)V

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

.method private synthetic p0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->l2(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic q0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->m2(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic r0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->m2(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public l0()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/hz10;->b:Z

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
    iput-boolean v0, p0, Ll/hz10;->b:Z

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 10
    .line 11
    iget-object v1, p0, Ll/hz10;->a:Lcom/p1/mobile/putong/feed/data/MusicCategory;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MusicCategory;->category:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/api/a;->U2(Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/fz10;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/fz10;-><init>(Ll/hz10;)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Ll/gz10;

    .line 29
    .line 30
    invoke-direct {v2, p0}, Ll/gz10;-><init>(Ll/hz10;)V

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

.method public m0(Lcom/p1/mobile/putong/feed/data/MusicCategory;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/hz10;->a:Lcom/p1/mobile/putong/feed/data/MusicCategory;

    .line 2
    .line 3
    new-instance v0, Ll/az10;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Ll/az10;-><init>(Ll/hz10;Lcom/p1/mobile/putong/feed/data/MusicCategory;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/bz10;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/bz10;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0, p1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic n0(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/hz10;->b:Z

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
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->n2()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic o0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/hz10;->b:Z

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

.method public final synthetic s0(Lcom/p1/mobile/putong/feed/data/MusicCategory;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MusicCategory;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/api/a;->T2(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0, p2}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/cz10;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/cz10;-><init>(Ll/hz10;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p2, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MusicCategory;->category:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/feed/api/a;->O2(Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance p2, Ll/dz10;

    .line 38
    .line 39
    invoke-direct {p2, p0}, Ll/dz10;-><init>(Ll/hz10;)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Ll/ez10;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/ez10;-><init>(Ll/hz10;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->r()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public t0(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
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

.method public u0()V
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
