.class public Ll/u3p0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;",
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
    return-void
.end method

.method public static synthetic J3(Ll/u3p0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u3p0;->R3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;)V

    return-void
.end method

.method public static synthetic K3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L3(Ll/u3p0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u3p0;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;)V

    return-void
.end method

.method public static synthetic M3(Ll/u3p0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/u3p0;->O3(Ll/jsv;)V

    return-void
.end method

.method private synthetic O3(Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u3p0;->N3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final N3()V
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
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getVoiceLiveHeartBeat(Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/t3p0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/t3p0;-><init>(Ll/u3p0;)V

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

.method public final P3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;

    .line 4
    .line 5
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;->heartbeats:J

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;->R(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final R3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;)V
    .locals 5

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
    invoke-virtual {v0}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;->roomId:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/rwn0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;->liveId:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Ll/u3p0;->i:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;

    .line 42
    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;

    .line 48
    .line 49
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;->heartBeat:J

    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;->R(J)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;->timestamp:J

    .line 56
    .line 57
    iget-wide v3, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;->timestamp:J

    .line 58
    .line 59
    cmp-long v0, v1, v3

    .line 60
    .line 61
    if-lez v0, :cond_1

    .line 62
    .line 63
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 64
    .line 65
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;

    .line 66
    .line 67
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;->heartBeat:J

    .line 68
    .line 69
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;->R(J)V

    .line 70
    .line 71
    .line 72
    :goto_0
    iput-object p1, p0, Ll/u3p0;->i:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;

    .line 73
    .line 74
    :cond_1
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vwt;->o7()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;->S(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/u3p0;->N3()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ll/rwn0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/aj1;->O0()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/q3p0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/q3p0;-><init>(Ll/u3p0;)V

    .line 46
    .line 47
    .line 48
    new-instance v2, Ll/r3p0;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/r3p0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_0

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Ll/rwn0;

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/rwn0;->u()Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/s3p0;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/s3p0;-><init>(Ll/u3p0;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    :cond_0
    return-void

    .line 93
    :cond_1
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;

    .line 94
    .line 95
    const/4 p0, 0x0

    .line 96
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;->S(Z)V

    .line 97
    .line 98
    .line 99
    return-void
.end method
