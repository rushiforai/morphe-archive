.class public Ll/x81;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;Lrx/subjects/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;",
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/x81;->i:Lrx/subjects/a;

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic J3(Ll/x81;Ll/hrk0$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x81;->T3(Ll/hrk0$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/x81;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x81;->S3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;)V

    return-void
.end method

.method public static synthetic L3(Ll/x81;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x81;->W3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;)V

    return-void
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;->newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    const-wide/16 v3, 0x3e8

    .line 10
    .line 11
    div-long/2addr v1, v3

    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter$Builder;->setCurrentTime(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter$Builder;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter$Type;->updateApplyUnreadCount:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter$Type;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter$Builder;->setUpdateType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter$Type;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter$Builder;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;->applyUnreadCount:I

    .line 23
    .line 24
    int-to-long v1, p0

    .line 25
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter$Builder;->setApplyUnreadCount(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter$Builder;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;

    .line 34
    .line 35
    return-object p0
.end method

.method public static synthetic N3(Ll/x81;Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x81;->R3(Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O3(Ll/x81;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x81;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;)V

    return-void
.end method

.method public static synthetic P3(Ll/x81;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x81;->U3(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic T3(Ll/hrk0$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private synthetic U3(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x81;->i:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iget-object p0, p0, Ll/x81;->i:Lrx/subjects/a;

    .line 18
    .line 19
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;

    .line 24
    .line 25
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;->l(ZLcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method


# virtual methods
.method public final synthetic R3(Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;->applyUnreadCount:I

    .line 8
    .line 9
    if-lez p1, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic S3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x81;->Y3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 5
    .line 6
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 7
    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Ll/w61;->b0(Ljava/lang/String;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/q81;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/q81;-><init>(Ll/x81;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/r81;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/r81;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/s81;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/s81;-><init>(Ll/x81;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic V3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;

    .line 4
    .line 5
    invoke-static {p0}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;->l(ZLcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic W3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x81;->Y3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public X3()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 v0, 0x1b65

    .line 12
    .line 13
    invoke-static {v0}, Ll/px50;->c(I)Ll/px50$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Ll/efv;->H:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->TRAN_GRAY_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/px50$a;->p(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)Ll/px50$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v1, Ll/qa00;->j:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/px50$a;->s(I)Ll/px50$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    .line 36
    .line 37
    const-wide v3, 0x3fe6666666666666L    # 0.7

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/px50$a;->z(DD)Ll/px50$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/16 v1, 0x50

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ll/px50$a;->q()Ll/px50;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final Y3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/x81;->j:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/x81;->j:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;->getCurrentTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;->getCurrentTime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    cmp-long v0, v0, v2

    .line 20
    .line 21
    if-lez v0, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v0, p0, Ll/x81;->j:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const-wide/16 v1, 0x0

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Ll/x81;->j:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;->getApplyUnreadCount()J

    .line 37
    .line 38
    .line 39
    move-result-wide v3

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    move-wide v3, v1

    .line 42
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;->getApplyUnreadCount()J

    .line 43
    .line 44
    .line 45
    move-result-wide v5

    .line 46
    cmp-long v0, v3, v1

    .line 47
    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    cmp-long v0, v5, v1

    .line 51
    .line 52
    if-lez v0, :cond_2

    .line 53
    .line 54
    invoke-static {p0}, Ll/t3m0;->j(Ll/i6t;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    iput-object p1, p0, Ll/x81;->j:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;

    .line 58
    .line 59
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 60
    .line 61
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionCounter;->getApplyUnreadCount()J

    .line 64
    .line 65
    .line 66
    move-result-wide v0

    .line 67
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionToolbarView;->p(J)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/t81;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/t81;-><init>(Ll/x81;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/u81;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/u81;-><init>(Ll/x81;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/x81;->i:Lrx/subjects/a;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/v81;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/v81;-><init>(Ll/x81;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Ll/rwn0;

    .line 74
    .line 75
    iget-object v0, v0, Ll/oo2;->z:Ll/p1w;

    .line 76
    .line 77
    invoke-virtual {v0}, Ll/p1w;->r()Ll/aj1;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Ll/aj1;->H0()Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/w81;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/w81;-><init>(Ll/x81;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    return-void
.end method
