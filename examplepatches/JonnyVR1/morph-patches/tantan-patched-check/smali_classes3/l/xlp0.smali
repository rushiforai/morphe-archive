.class public Ll/xlp0;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/rwn0;",
        "Ll/slp0;",
        ">;"
    }
.end annotation


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
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/slp0;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/slp0;-><init>(Ll/xlp0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic S3(Ll/xlp0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarHallMainDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xlp0;->V3(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarHallMainDetail;)V

    return-void
.end method

.method public static synthetic T3(Ll/xlp0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xlp0;->U3(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic U3(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/slp0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Ll/slp0;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast v0, Ll/slp0;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/xlp0;->W3(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceNewGiftWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;->showWeekStarHall()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/vlp0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/vlp0;-><init>(Ll/xlp0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic V3(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarHallMainDetail;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/slp0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/slp0;->S(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarHallMainDetail;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public W3(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/zbo0;->e(Ljava/lang/String;)Lrx/c;

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
    new-instance v0, Ll/wlp0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/wlp0;-><init>(Ll/xlp0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method
