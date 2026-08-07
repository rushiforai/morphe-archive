.class public Ll/bzn0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic J3(Ll/bzn0;Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bzn0;->N3(Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/bzn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bzn0;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;)V

    return-void
.end method

.method public static synthetic L3(Ll/bzn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bzn0;->O3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;)V

    return-void
.end method


# virtual methods
.method public M3(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 v0, 0x464

    .line 12
    .line 13
    invoke-static {v0, p1}, Ll/bae0;->b(ILjava/lang/String;)Ll/bae0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic N3(Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getHeatBoxData(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic O3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic P3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final R3()V
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
    const/16 v1, 0x1e

    .line 8
    .line 9
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/zyn0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/zyn0;-><init>(Ll/bzn0;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/azn0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/azn0;-><init>(Ll/bzn0;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getHeatBoxData(Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/yyn0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/yyn0;-><init>(Ll/bzn0;)V

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
    invoke-virtual {p0}, Ll/bzn0;->R3()V

    .line 35
    .line 36
    .line 37
    return-void
.end method
