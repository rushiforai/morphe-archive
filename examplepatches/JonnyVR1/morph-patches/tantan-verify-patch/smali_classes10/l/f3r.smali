.class public Ll/f3r;
.super Ll/g3r;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        "VM:",
        "Ll/y2r;",
        ">",
        "Ll/g3r<",
        "TD;TVM;>;"
    }
.end annotation


# instance fields
.field public final j:Ll/e4r;

.field public k:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;Ll/y2r;Ll/e4r;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;TVM;",
            "Ll/e4r;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/g3r;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "\u5df2\u70b9"

    .line 5
    .line 6
    iput-object p1, p0, Ll/f3r;->k:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 9
    .line 10
    .line 11
    iput-object p3, p0, Ll/f3r;->j:Ll/e4r;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic V3(Ll/f3r;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f3r;->h4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W3(Ll/f3r;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRefresh;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f3r;->k4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRefresh;)V

    return-void
.end method

.method public static synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Y3(Ll/f3r;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f3r;->i4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic Z3(Ll/f3r;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f3r;->j4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic a4(Ll/f3r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/f3r;->g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public P3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/y2r;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/y2r;->init()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/f3r;->f4()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/rwn0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/aj1;->C0()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/z2r;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/z2r;-><init>(Ll/f3r;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public S3()Ll/v3r;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/v3r;

    .line 2
    .line 3
    iget-object v1, p0, Ll/f3r;->k:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/y2r;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/y2r;->b()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v2, 0x1

    .line 14
    invoke-direct {v0, v1, p0, v2}, Ll/v3r;-><init>(Ljava/lang/String;Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public T3()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public U3()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/y2r;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/y2r;->b()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public b4(Landroid/util/Pair;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/f3r;->d4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-virtual {p0}, Ll/f3r;->e4()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    sget-object v0, Ll/qd80;->m:Ljava/lang/String;

    .line 31
    .line 32
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;->status:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_3

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->resumeMusic()Ll/v3f$c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->pauseMusic()Ll/v3f$c;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final c4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0, p1}, Ll/rqn0;->g(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance p1, Ll/e3r;

    .line 28
    .line 29
    invoke-direct {p1}, Ll/e3r;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final d4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "\u662f\u5426\u5220\u9664\u8be5\u6b4c\u66f2"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "\u5220\u9664"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/d3r;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1}, Ll/d3r;-><init>(Ll/f3r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "\u53d6\u6d88"

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final e4()V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "\u5207\u6b4c\u4f1a\u7ed3\u675f\u5f53\u524d\u6b4c\u66f2\uff0c\u662f\u5426\u5207\u6b4c\uff1f"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "\u5207\u6b4c"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/c3r;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/c3r;-><init>(Ll/f3r;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "\u53d6\u6d88"

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final f4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/rqn0;->j(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/a3r;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/a3r;-><init>(Ll/f3r;)V

    .line 30
    .line 31
    .line 32
    new-instance v2, Ll/b3r;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/b3r;-><init>(Ll/f3r;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f3r;->c4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic h4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->switchNext()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic i4(Ljava/util/List;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Ll/y2r;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/y2r;->d(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0, p1}, Ll/f3r;->l4(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast p1, Ll/y2r;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/y2r;->c()V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-virtual {p0, p1}, Ll/f3r;->l4(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic j4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/y2r;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/y2r;->c()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic k4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRefresh;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f3r;->f4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l4(I)V
    .locals 2

    .line 1
    const/16 v0, 0x63

    .line 2
    .line 3
    if-le p1, v0, :cond_0

    .line 4
    .line 5
    const-string p1, "\u5df2\u70b9 99+"

    .line 6
    .line 7
    iput-object p1, p0, Ll/f3r;->k:Ljava/lang/String;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v1, "\u5df2\u70b9 "

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Ll/f3r;->k:Ljava/lang/String;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string p1, "\u5df2\u70b9 0"

    .line 30
    .line 31
    iput-object p1, p0, Ll/f3r;->k:Ljava/lang/String;

    .line 32
    .line 33
    :goto_0
    iget-object p0, p0, Ll/f3r;->j:Ll/e4r;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/e4r;->e4()V

    .line 36
    .line 37
    .line 38
    return-void
.end method
