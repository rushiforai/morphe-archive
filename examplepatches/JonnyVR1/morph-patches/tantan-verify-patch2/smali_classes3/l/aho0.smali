.class public Ll/aho0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

.field public j:Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;

.field public k:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    iput-object p3, p0, Ll/aho0;->j:Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic J3(Ll/aho0;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aho0;->Z3(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;)V

    return-void
.end method

.method public static synthetic K3(Ll/aho0;Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/aho0;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic L3(Ll/aho0;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkModify;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aho0;->U3(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkModify;)V

    return-void
.end method

.method public static synthetic M3(Ll/aho0;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aho0;->T3(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;)V

    return-void
.end method

.method public static synthetic N3(Ll/aho0;Ll/pgo0;)Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aho0;->V3(Ll/pgo0;)Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O3(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->getUserId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic P3(Ll/aho0;Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aho0;->R3(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V

    return-void
.end method


# virtual methods
.method public final R3(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/aho0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 2
    .line 3
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;->w(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoicePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoicePkEvent;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoicePkEvent;->onVoicePkChange()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/aho0;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic S3(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aho0;->j:Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;->i0(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic T3(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/aho0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->onCallPoints:Ljava/util/List;

    .line 4
    .line 5
    new-instance v1, Ll/zgo0;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ll/zgo0;-><init>(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->getUserId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->userId:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p0, p0, Ll/aho0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->onCallPoints:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->getPoint()J

    .line 36
    .line 37
    .line 38
    move-result-wide v1

    .line 39
    iget-wide v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->point:J

    .line 40
    .line 41
    cmp-long p0, v3, v1

    .line 42
    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 p0, 0x0

    .line 48
    :goto_0
    iput-boolean p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->isScoreChange:Z

    .line 49
    .line 50
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->point:J

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->getIsNewTopOne()Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    iput-boolean p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->isNewTopOne:Z

    .line 57
    .line 58
    return-void
.end method

.method public final synthetic U3(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkModify;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aho0;->X3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V3(Ll/pgo0;)Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aho0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public W3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/aho0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/aho0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->schema:Ljava/lang/String;

    .line 18
    .line 19
    const/16 v1, 0x283c

    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/bae0;->b(ILjava/lang/String;)Ll/bae0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final X3()V
    .locals 2

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
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getVoicePkDetail(Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/xgo0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/xgo0;-><init>(Ll/aho0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final Y3(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/aho0;->k:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->enable:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->endMill:J

    .line 11
    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-gez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-wide/16 v0, 0x1

    .line 20
    .line 21
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/ygo0;

    .line 40
    .line 41
    invoke-direct {v1, p0, p1}, Ll/ygo0;-><init>(Ll/aho0;Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Ll/aho0;->k:Ll/kcg0;

    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/aho0;->j:Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;

    .line 56
    .line 57
    const/4 p1, 0x0

    .line 58
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final Z3(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aho0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;->getCallRewardPointsList()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    :goto_0
    return-void

    .line 17
    :cond_1
    new-instance v0, Ll/wgo0;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/wgo0;-><init>(Ll/aho0;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoicePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoicePkEvent;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoicePkEvent;->onVoicePkChange()Ll/v3f$d;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p0, p0, Ll/aho0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
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
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->k1()Lrx/c;

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
    new-instance v1, Ll/tgo0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/tgo0;-><init>(Ll/aho0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/rwn0;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/aj1;->j1()Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/ugo0;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/ugo0;-><init>(Ll/aho0;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    new-instance v0, Ll/vgo0;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/vgo0;-><init>(Ll/aho0;)V

    .line 67
    .line 68
    .line 69
    const-class v1, Ll/pgo0;

    .line 70
    .line 71
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/aho0;->X3()V

    .line 75
    .line 76
    .line 77
    return-void
.end method
