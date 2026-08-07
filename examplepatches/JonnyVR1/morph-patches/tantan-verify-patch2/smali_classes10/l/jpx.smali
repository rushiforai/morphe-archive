.class public Ll/jpx;
.super Ll/s0k;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        "VM:",
        "Ll/epx;",
        ">",
        "Ll/s0k<",
        "TD;TVM;>;"
    }
.end annotation


# instance fields
.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;Ll/epx;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;TVM;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/s0k;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic V3(Ll/jpx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jpx;->d4()V

    return-void
.end method

.method public static synthetic W3(Ll/jpx;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jpx;->b4(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic X3(Ll/jpx;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jpx;->a4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic Y3(Ll/jpx;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jpx;->c4(Landroid/content/DialogInterface;)V

    return-void
.end method

.method private d4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jpx;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v0, v1}, Ll/wkn0;->g(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/fpx;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/fpx;-><init>(Ll/jpx;)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Ll/z2e0;

    .line 27
    .line 28
    invoke-direct {p0}, Ll/z2e0;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public O3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jpx;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S3()Ll/u0k;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/u0k;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/epx;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/epx;->e()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v1, 0x1

    .line 12
    const-string v2, "\u52cb\u7ae0\u5899"

    .line 13
    .line 14
    invoke-direct {v0, v2, p0, v1}, Ll/u0k;-><init>(Ljava/lang/String;Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public T3()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public Z3()Z
    .locals 1

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/jpx;->j:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final synthetic a4(Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/epx;

    .line 4
    .line 5
    iget-object v0, v0, Ll/epx;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelPageView;

    .line 6
    .line 7
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelPageView;->l0(Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/epx;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/epx;->k(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic b4(Ll/uxj0;)V
    .locals 0

    .line 1
    const-string p1, "\u9886\u53d6\u6210\u529f"

    .line 2
    .line 3
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/jpx;->d4()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic c4(Landroid/content/DialogInterface;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/ipx;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/ipx;-><init>(Ll/jpx;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v1, 0x5dc

    .line 11
    .line 12
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public e4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/j1k;->g()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {p1, v0}, Ll/wkn0;->h(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Ll/gpx;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/gpx;-><init>(Ll/jpx;)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/z2e0;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/z2e0;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public f4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jpx;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)V
    .locals 7

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->interact:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallGiftItemInteract;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallGiftItemInteract;->title:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/yec0;->J1:I

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    move-object v1, v0

    .line 28
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/GiftWallSendGiftDialogContentView;

    .line 29
    .line 30
    new-instance v0, Ll/jl80$a;

    .line 31
    .line 32
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    invoke-direct {v0, v2}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v2, 0x1

    .line 42
    invoke-virtual {v0, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-virtual {v0, v2}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v2, Ll/hpx;

    .line 52
    .line 53
    invoke-direct {v2, p0}, Ll/hpx;-><init>(Ll/jpx;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ll/jl80$a;->O()Ll/jl80;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    const/4 v4, 0x0

    .line 65
    const/4 v5, 0x1

    .line 66
    move-object v6, p0

    .line 67
    move-object v2, p1

    .line 68
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/GiftWallSendGiftDialogContentView;->n0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;Ll/jl80;ZZLl/i6t;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3}, Ll/jl80;->show()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public init()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/epx;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/epx;->r()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/jpx;->d4()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
