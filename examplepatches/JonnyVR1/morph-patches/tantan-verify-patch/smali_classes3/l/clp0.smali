.class public Ll/clp0;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/rwn0;",
        "Ll/llp0;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:J


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
    new-instance p1, Ll/llp0;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/llp0;-><init>(Ll/clp0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic S3(Ll/clp0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$GiftWallRefresh;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/clp0;->c4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$GiftWallRefresh;)V

    return-void
.end method

.method public static synthetic T3(Ll/clp0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$GiftWallRefresh;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/clp0;->b4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$GiftWallRefresh;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U3(Ll/clp0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/clp0;->Z3(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V

    return-void
.end method

.method public static synthetic V3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bf10;->j(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W3(Ll/clp0;Ll/aco0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/clp0;->a4(Ll/aco0;)V

    return-void
.end method

.method public static synthetic X3(Ll/clp0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/clp0;->d4(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V

    return-void
.end method

.method private synthetic Z3(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/llp0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/llp0;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/llp0;->Z(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic a4(Ll/aco0;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/llp0;

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
    check-cast v0, Ll/llp0;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v2, p1, Ll/aco0;->a:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v2, p0, Ll/clp0;->j:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v3, p1, Ll/aco0;->b:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v3, p0, Ll/clp0;->k:Ljava/lang/String;

    .line 25
    .line 26
    iget-wide v4, p1, Ll/aco0;->c:J

    .line 27
    .line 28
    iput-wide v4, p0, Ll/clp0;->l:J

    .line 29
    .line 30
    new-instance v6, Ll/zkp0;

    .line 31
    .line 32
    invoke-direct {v6, p0}, Ll/zkp0;-><init>(Ll/clp0;)V

    .line 33
    .line 34
    .line 35
    move-object v1, p0

    .line 36
    invoke-virtual/range {v1 .. v6}, Ll/clp0;->e4(Ljava/lang/String;Ljava/lang/String;JLl/y20;)V

    .line 37
    .line 38
    .line 39
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
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;->showWeekStarGiftDetail()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/wkp0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/wkp0;-><init>(Ll/clp0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/rwn0;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/aj1;->W()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/xkp0;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/xkp0;-><init>(Ll/clp0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/ykp0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/ykp0;-><init>(Ll/clp0;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public Y3()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/clp0;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/clp0;->k:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v2, p0, Ll/clp0;->j:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v3, p0, Ll/clp0;->k:Ljava/lang/String;

    .line 20
    .line 21
    iget-wide v4, p0, Ll/clp0;->l:J

    .line 22
    .line 23
    new-instance v6, Ll/alp0;

    .line 24
    .line 25
    invoke-direct {v6, p0}, Ll/alp0;-><init>(Ll/clp0;)V

    .line 26
    .line 27
    .line 28
    move-object v1, p0

    .line 29
    invoke-virtual/range {v1 .. v6}, Ll/clp0;->e4(Ljava/lang/String;Ljava/lang/String;JLl/y20;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final synthetic b4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$GiftWallRefresh;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/llp0;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic c4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$GiftWallRefresh;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/clp0;->Y3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d4(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/llp0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/llp0;->Z(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e4(Ljava/lang/String;Ljava/lang/String;JLl/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/zbo0;->f(Ljava/lang/String;Ljava/lang/String;J)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/blp0;

    .line 10
    .line 11
    invoke-direct {p1}, Ll/blp0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p5, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method
