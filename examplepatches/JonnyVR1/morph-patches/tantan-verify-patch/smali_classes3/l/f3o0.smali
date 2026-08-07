.class public Ll/f3o0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Ll/k3o0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/x6o0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/k3o0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/k3o0;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p1, Ll/k3o0;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ll/k3o0;->j(Ll/f3o0;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic J3(Ll/f3o0;Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f3o0;->N3(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;)V

    return-void
.end method

.method public static synthetic K3(Ll/f3o0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f3o0;->M3()V

    return-void
.end method

.method public static synthetic L3(Ll/f3o0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f3o0;->P3(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final synthetic M3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/k3o0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/k3o0;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic N3(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/k3o0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/k3o0;->C(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public O3(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f3o0;->i:Ll/x6o0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x6o0;->L3(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final P3(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getMedalWallData(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/e3o0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/e3o0;-><init>(Ll/f3o0;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/r5k;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/x6o0;

    .line 5
    .line 6
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/x6o0;-><init>(Ll/dum;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/x6o0;

    .line 16
    .line 17
    iput-object v0, p0, Ll/f3o0;->i:Ll/x6o0;

    .line 18
    .line 19
    new-instance v1, Ll/c3o0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/c3o0;-><init>(Ll/f3o0;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/x6o0;->K3(Ll/x20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->IntlVoiceMedalWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceMedalWallEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceMedalWallEvent;->showMedalWall()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/d3o0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/d3o0;-><init>(Ll/f3o0;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/r5k;

    .line 30
    .line 31
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method
