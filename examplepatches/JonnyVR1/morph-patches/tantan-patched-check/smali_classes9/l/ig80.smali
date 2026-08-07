.class public Ll/ig80;
.super Ll/i6t;
.source "SourceFile"

# interfaces
.implements Ll/c6m;
.implements Ll/pwl;
.implements Ll/y2m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/i6t<",
        "TD;",
        "Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;",
        ">;",
        "Ll/c6m;",
        "Ll/pwl;",
        "Ll/y2m;"
    }
.end annotation


# instance fields
.field public i:Ll/ft5;

.field public final j:Ll/uxh0;

.field public k:Ll/ef80;

.field public l:Ll/qg80;

.field public m:Z

.field public n:J

.field public o:J


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qg80;

    .line 5
    .line 6
    invoke-direct {v0, p1, p0}, Ll/qg80;-><init>(Ll/dum;Ll/y2m;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ll/qg80;

    .line 14
    .line 15
    iput-object p1, p0, Ll/ig80;->l:Ll/qg80;

    .line 16
    .line 17
    new-instance p1, Ll/ef80;

    .line 18
    .line 19
    invoke-direct {p1}, Ll/ef80;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/ig80;->k:Ll/ef80;

    .line 23
    .line 24
    new-instance p1, Ll/uxh0;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/uxh0;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/ig80;->j:Ll/uxh0;

    .line 30
    .line 31
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/ig80;->Q4()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic J3(Ll/ig80;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->A4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic K3(Ll/ig80;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->w4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic L3(Ll/ig80;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->q4(Ljava/lang/String;)V

    return-void
.end method

.method private L4()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->s(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/ig80;->k:Ll/ef80;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/ef80;->a()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;->showBg()Ll/v3f$d;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    new-instance v3, Ll/vyr;

    .line 43
    .line 44
    invoke-direct {v3, v2}, Ll/vyr;-><init>(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    const/4 v1, 0x2

    .line 51
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-nez v1, :cond_3

    .line 56
    .line 57
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 58
    .line 59
    iget-object v1, v1, Ll/dum;->h:Ll/oo2;

    .line 60
    .line 61
    instance-of v2, v1, Ll/ou40;

    .line 62
    .line 63
    if-eqz v2, :cond_3

    .line 64
    .line 65
    check-cast v1, Ll/ou40;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ll/ig80;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-eqz v2, :cond_2

    .line 72
    .line 73
    invoke-virtual {v1}, Ll/ou40;->K2()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-nez v2, :cond_2

    .line 78
    .line 79
    invoke-virtual {v1}, Ll/ou40;->L2()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_1

    .line 84
    .line 85
    const-string v0, "PlayerPresenter:onLiving:\u64ad\u653e\u5668\u5207rtc"

    .line 86
    .line 87
    invoke-static {v0}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->audienceRtcPull()Ll/v3f$d;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    :cond_1
    return-void

    .line 106
    :cond_2
    invoke-virtual {v1}, Ll/ou40;->L2()Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-eqz v1, :cond_3

    .line 111
    .line 112
    const-string v1, "PlayerPresenter:onLiving:\u68c0\u67e5\u505c\u6b62rtc"

    .line 113
    .line 114
    invoke-static {v1}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 122
    .line 123
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->audienceRtcPull()Ll/v3f$d;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 128
    .line 129
    invoke-virtual {v1, v2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    :cond_3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 133
    .line 134
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->useCurrentPullStream:Z

    .line 135
    .line 136
    if-nez v1, :cond_4

    .line 137
    .line 138
    iget-object v1, p0, Ll/ig80;->j:Ll/uxh0;

    .line 139
    .line 140
    invoke-virtual {v1}, Ll/uxh0;->k()Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-eqz v1, :cond_4

    .line 145
    .line 146
    sget-object p0, Ll/v2t;->c:Ljava/lang/String;

    .line 147
    .line 148
    const-string v0, "useCurrentPull : false, isStartPlay:true"

    .line 149
    .line 150
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_4
    invoke-direct {p0, v0}, Ll/ig80;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public static synthetic M3(Ll/ig80;Ll/gyb;)Ll/fyb;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->D4(Ll/gyb;)Ll/fyb;

    move-result-object p0

    return-object p0
.end method

.method private M4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)I
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 6
    .line 7
    iget-object v2, v1, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->a:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/vp20;->x()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ll/oo2;->o0()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    move-object v3, p0

    .line 26
    move-object v1, p1

    .line 27
    invoke-virtual/range {v0 .. v5}, Ll/uxh0;->o(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Landroid/widget/FrameLayout;Ll/pwl;Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public static synthetic N3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic O3(Ll/ig80;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->B4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic P3(Ll/ig80;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->H4(Ll/vxj0;)V

    return-void
.end method

.method private P4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/ff80;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/ff80;-><init>(Ll/ig80;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->showLoading()Ll/v3f$d;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lrx/c;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/hf80;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/hf80;-><init>(Ll/ig80;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->quickPlay()Ll/v3f$d;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lrx/c;

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/kf80;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/kf80;-><init>(Ll/ig80;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 94
    .line 95
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->showErrorText()Ll/v3f$d;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Lrx/c;

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v1, Ll/lf80;

    .line 110
    .line 111
    invoke-direct {v1, p0}, Ll/lf80;-><init>(Ll/ig80;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    new-instance v1, Ll/mf80;

    .line 119
    .line 120
    invoke-direct {v1, p0}, Ll/mf80;-><init>(Ll/ig80;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 128
    .line 129
    .line 130
    new-instance v0, Ll/nf80;

    .line 131
    .line 132
    invoke-direct {v0, p0}, Ll/nf80;-><init>(Ll/ig80;)V

    .line 133
    .line 134
    .line 135
    const-class v1, Ll/lh80;

    .line 136
    .line 137
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 138
    .line 139
    .line 140
    new-instance v0, Ll/of80;

    .line 141
    .line 142
    invoke-direct {v0, p0}, Ll/of80;-><init>(Ll/ig80;)V

    .line 143
    .line 144
    .line 145
    const-class v1, Ll/z7b0;

    .line 146
    .line 147
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 155
    .line 156
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->restartPlay()Ll/v3f$c;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    check-cast v0, Lrx/c;

    .line 165
    .line 166
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    new-instance v1, Ll/pf80;

    .line 171
    .line 172
    invoke-direct {v1, p0}, Ll/pf80;-><init>(Ll/ig80;)V

    .line 173
    .line 174
    .line 175
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 187
    .line 188
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->pausePlay()Ll/v3f$c;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    check-cast v0, Lrx/c;

    .line 197
    .line 198
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    new-instance v1, Ll/rf80;

    .line 203
    .line 204
    invoke-direct {v1, p0}, Ll/rf80;-><init>(Ll/ig80;)V

    .line 205
    .line 206
    .line 207
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 212
    .line 213
    .line 214
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 219
    .line 220
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->playerVisible()Ll/v3f$d;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    check-cast v0, Lrx/c;

    .line 229
    .line 230
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    new-instance v1, Ll/sf80;

    .line 235
    .line 236
    invoke-direct {v1, p0}, Ll/sf80;-><init>(Ll/ig80;)V

    .line 237
    .line 238
    .line 239
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 244
    .line 245
    .line 246
    new-instance v0, Ll/qf80;

    .line 247
    .line 248
    invoke-direct {v0, p0}, Ll/qf80;-><init>(Ll/ig80;)V

    .line 249
    .line 250
    .line 251
    const-class v1, Ll/gyb;

    .line 252
    .line 253
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 254
    .line 255
    .line 256
    new-instance v0, Ll/ag80;

    .line 257
    .line 258
    invoke-direct {v0, p0}, Ll/ag80;-><init>(Ll/ig80;)V

    .line 259
    .line 260
    .line 261
    const-class v1, Ll/iu70;

    .line 262
    .line 263
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 271
    .line 272
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->enterRoomFail()Ll/v3f$c;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    check-cast v0, Lrx/c;

    .line 281
    .line 282
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    new-instance v1, Ll/bg80;

    .line 287
    .line 288
    invoke-direct {v1, p0}, Ll/bg80;-><init>(Ll/ig80;)V

    .line 289
    .line 290
    .line 291
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 296
    .line 297
    .line 298
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 303
    .line 304
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->switchMute()Ll/v3f$d;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    check-cast v0, Lrx/c;

    .line 313
    .line 314
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    new-instance v1, Ll/cg80;

    .line 319
    .line 320
    invoke-direct {v1, p0}, Ll/cg80;-><init>(Ll/ig80;)V

    .line 321
    .line 322
    .line 323
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 328
    .line 329
    .line 330
    new-instance v0, Ll/dg80;

    .line 331
    .line 332
    invoke-direct {v0, p0}, Ll/dg80;-><init>(Ll/ig80;)V

    .line 333
    .line 334
    .line 335
    const-class v1, Ll/o7g0;

    .line 336
    .line 337
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 338
    .line 339
    .line 340
    new-instance v0, Ll/eg80;

    .line 341
    .line 342
    invoke-direct {v0, p0}, Ll/eg80;-><init>(Ll/ig80;)V

    .line 343
    .line 344
    .line 345
    const-class v1, Ll/xsi;

    .line 346
    .line 347
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 348
    .line 349
    .line 350
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 355
    .line 356
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->showSuspendText()Ll/v3f$d;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    check-cast v0, Lrx/c;

    .line 365
    .line 366
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 367
    .line 368
    .line 369
    move-result-object v0

    .line 370
    new-instance v1, Ll/fg80;

    .line 371
    .line 372
    invoke-direct {v1, p0}, Ll/fg80;-><init>(Ll/ig80;)V

    .line 373
    .line 374
    .line 375
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 376
    .line 377
    .line 378
    move-result-object v1

    .line 379
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 380
    .line 381
    .line 382
    const/4 v0, 0x2

    .line 383
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 384
    .line 385
    .line 386
    move-result v0

    .line 387
    if-nez v0, :cond_0

    .line 388
    .line 389
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    invoke-virtual {v0}, Ll/oo2;->h0()Lrx/c;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    new-instance v1, Ll/gg80;

    .line 402
    .line 403
    invoke-direct {v1, p0}, Ll/gg80;-><init>(Ll/ig80;)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 407
    .line 408
    .line 409
    move-result-object v0

    .line 410
    new-instance v1, Ll/hg80;

    .line 411
    .line 412
    invoke-direct {v1, p0}, Ll/hg80;-><init>(Ll/ig80;)V

    .line 413
    .line 414
    .line 415
    new-instance p0, Ll/gf80;

    .line 416
    .line 417
    invoke-direct {p0}, Ll/gf80;-><init>()V

    .line 418
    .line 419
    .line 420
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 421
    .line 422
    .line 423
    move-result-object p0

    .line 424
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 425
    .line 426
    .line 427
    return-void

    .line 428
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 429
    .line 430
    .line 431
    move-result-object v0

    .line 432
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 433
    .line 434
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->updatePlayerContainer()Ll/v3f$c;

    .line 435
    .line 436
    .line 437
    move-result-object v0

    .line 438
    new-instance v1, Ll/if80;

    .line 439
    .line 440
    invoke-direct {v1, p0}, Ll/if80;-><init>(Ll/ig80;)V

    .line 441
    .line 442
    .line 443
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 444
    .line 445
    .line 446
    new-instance v0, Ll/jf80;

    .line 447
    .line 448
    invoke-direct {v0, p0}, Ll/jf80;-><init>(Ll/ig80;)V

    .line 449
    .line 450
    .line 451
    const-class v1, Ll/tyb;

    .line 452
    .line 453
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 454
    .line 455
    .line 456
    return-void
.end method

.method public static synthetic R3(Ll/ig80;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->u4(Ljava/lang/String;)V

    return-void
.end method

.method private R4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->m()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ig80;->k:Ll/ef80;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Ll/ef80;->n(Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0}, Ll/uxh0;->u(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic S3(Ll/ig80;Ll/xsi;)Ll/qwl;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->t4(Ll/xsi;)Ll/qwl;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T3(Ll/fyb;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic U3(Ll/ig80;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->G4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic V3(Ll/ig80;Ll/qwl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->X4(Ll/qwl;)V

    return-void
.end method

.method public static synthetic W3(Ll/ig80;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ig80;->n4(Ll/jsv;)V

    return-void
.end method

.method private W4(Ll/jsv;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jsv;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->setWaterMarkVisible(Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->setWaterMarkUserId(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public static synthetic X3(Ll/ig80;Ll/z7b0;)Ltv/danmaku/ijk/media/player/PullWatchInfo;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->z4(Ll/z7b0;)Ltv/danmaku/ijk/media/player/PullWatchInfo;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y3(Ll/ig80;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->F4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic Z3(Ll/ig80;Ll/fyb;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->I4(Ll/fyb;)V

    return-void
.end method

.method public static synthetic a4(Ll/ig80;Ll/lh80;)Landroid/view/ViewGroup;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->r4(Ll/lh80;)Landroid/view/ViewGroup;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b4(Ll/ig80;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->x4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic c4(Ll/ig80;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->C4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d4(Ll/ig80;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->v4(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e4(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f4(Ll/ig80;Ll/o7g0;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->s4(Ll/o7g0;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g4(Ll/ig80;Ll/iu70;)Ll/fyb;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->E4(Ll/iu70;)Ll/fyb;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h4(Ll/ig80;Ll/tyb;)Ll/qwl;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->y4(Ll/tyb;)Ll/qwl;

    move-result-object p0

    return-object p0
.end method

.method private i4()V
    .locals 1

    .line 1
    invoke-static {}, Ll/lti;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 9
    .line 10
    const-string v0, "live"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/uxh0;->e(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private k4()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 8
    .line 9
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->F9:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->k()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 24
    .line 25
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->D9:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :cond_1
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/ig80;->V4(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    sget-object v0, Ll/v2t;->c:Ljava/lang/String;

    .line 38
    .line 39
    const-string v1, "audience retryConnect"

    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/ig80;->l:Ll/qg80;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/qg80;->c4()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private m4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isOfficialShowRoom()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v0, v0, Ll/mc50;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/mc50;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/mc50;->S2()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v0, p0, Ll/ig80;->l:Ll/qg80;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->callback:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/qg80;->d4(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {p0, p1}, Ll/ig80;->M4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0, p1}, Ll/ig80;->j4(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->f()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private n4(Ll/jsv;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-eq v0, v1, :cond_3

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-direct {p0}, Ll/ig80;->R4()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/uxh0;->g()Ll/qwl;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/s310;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/s310;->e0()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object v0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {v0, v1}, Ll/uxh0;->u(Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 37
    .line 38
    iget-object v0, v0, Ll/dum;->j:Ll/x6t;

    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_call:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/x6t;->L3(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    invoke-static {p0}, Ll/bf10;->P(Ll/i6t;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_4

    .line 53
    .line 54
    :cond_2
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 57
    .line 58
    const-string v1, ""

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->v(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    invoke-direct {p0}, Ll/ig80;->L4()V

    .line 65
    .line 66
    .line 67
    :cond_4
    :goto_0
    invoke-direct {p0, p1}, Ll/ig80;->W4(Ll/jsv;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method private o4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/uxh0;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/uxh0;->k()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, v0}, Ll/uxh0;->t(Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p0, v0}, Ll/ig80;->m(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public final synthetic A4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, p1}, Ll/ig80;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic B4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Ll/uxh0;->u(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic C4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->n(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public D0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->e()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->setPlayerCoverVisible(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ig80;->k:Ll/ef80;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/ef80;->e()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v2, p0, Ll/ig80;->k:Ll/ef80;

    .line 23
    .line 24
    invoke-virtual {v2}, Ll/ef80;->g()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const/4 v3, 0x1

    .line 29
    xor-int/2addr v2, v3

    .line 30
    invoke-static {p0, v0, v2}, Ll/wg80;->g(Ll/ig80;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Z)V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x2

    .line 34
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-nez v0, :cond_0

    .line 49
    .line 50
    iput-boolean v3, p0, Ll/ig80;->m:Z

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    iput-boolean v1, p0, Ll/ig80;->m:Z

    .line 54
    .line 55
    invoke-static {p0}, Ll/wg80;->e(Ll/i6t;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-static {p0}, Ll/wg80;->e(Ll/i6t;)V

    .line 60
    .line 61
    .line 62
    :goto_0
    iget-object v0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Ll/uxh0;->p(Ll/ig80;)V

    .line 65
    .line 66
    .line 67
    sget-object p0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 68
    .line 69
    const-string v0, "live_enter_room_cdn"

    .line 70
    .line 71
    const-string v1, "onReceiveFirstIFrame"

    .line 72
    .line 73
    invoke-virtual {p0, v0, v1}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final synthetic D4(Ll/gyb;)Ll/fyb;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ig80;->l4()Ll/fyb;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic E4(Ll/iu70;)Ll/fyb;
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ig80;->j:Ll/uxh0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/uxh0;->i()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/ig80;->j:Ll/uxh0;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/uxh0;->g()Ll/qwl;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    instance-of p1, p1, Ll/s310;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/uxh0;->g()Ll/qwl;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ll/s310;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/s310;->M()Ll/fyb;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public F1()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic F4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ig80;->k:Ll/ef80;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Ll/ef80;->l(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic G4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Ll/uxh0;->t(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic H4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ig80;->S4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic I4(Ll/fyb;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/uxh0;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/uxh0;->g()Ll/qwl;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v0, v0, Ll/s310;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/uxh0;->g()Ll/qwl;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/s310;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ll/s310;->f0(Ll/fyb;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-virtual {p0, p1}, Ll/ig80;->c0(Ll/fyb;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public J4(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->w(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public K4()V
    .locals 8

    .line 1
    const-string v0, "audience_player_retry"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {p0, v0, v1}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/pzi0;->o()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    iget-object v0, p0, Ll/ig80;->l:Ll/qg80;

    .line 12
    .line 13
    iget-wide v4, v0, Ll/qg80;->k:J

    .line 14
    .line 15
    sub-long/2addr v2, v4

    .line 16
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/vwt;->W4()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    int-to-long v4, v0

    .line 25
    const-wide/16 v6, 0x3e8

    .line 26
    .line 27
    mul-long/2addr v4, v6

    .line 28
    cmp-long v0, v2, v4

    .line 29
    .line 30
    if-gez v0, :cond_0

    .line 31
    .line 32
    const-string v0, "\u64cd\u4f5c\u9891\u7e41\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 33
    .line 34
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const-string v0, "audience_player_retry_frequent"

    .line 38
    .line 39
    invoke-static {p0, v0, v1}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    iget-object v0, p0, Ll/ig80;->l:Ll/qg80;

    .line 44
    .line 45
    iget-object p0, p0, Ll/ig80;->k:Ll/ef80;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/ef80;->b()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Ll/qg80;->Z3(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public M0()Ll/ef80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ig80;->k:Ll/ef80;

    .line 2
    .line 3
    return-object p0
.end method

.method public N4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/uxh0;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 10
    .line 11
    const-string v1, "onlive"

    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Ll/uxh0;->t(Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->s(Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/ig80;->k:Ll/ef80;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ll/ef80;->m(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0, p1}, Ll/ig80;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    return-void
.end method

.method public O()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->u(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ll/wg80;->h(Ll/i6t;)V

    .line 10
    .line 11
    .line 12
    const/16 v0, 0xf

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/ig80;->T4(I)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/pzi0;->o()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iput-wide v0, p0, Ll/ig80;->n:J

    .line 22
    .line 23
    return-void
.end method

.method public O0(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->callVolumeChanged()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public O4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Ll/ig80;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    instance-of v0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 8
    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 14
    .line 15
    if-eqz v0, :cond_4

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->provider:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_4

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->reqRtcToken()Ll/v3f$d;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 40
    .line 41
    if-eqz v0, :cond_4

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlvIpv6:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_4

    .line 60
    .line 61
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 62
    .line 63
    if-nez v0, :cond_2

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    new-instance v0, Ll/wyd0;

    .line 67
    .line 68
    const-string v1, "ARTICULATION_SELECT_LIVE_ID"

    .line 69
    .line 70
    const-string v2, ""

    .line 71
    .line 72
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Ljava/lang/CharSequence;

    .line 80
    .line 81
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_3

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_3
    sget-object v0, Ll/v2t;->c:Ljava/lang/String;

    .line 91
    .line 92
    new-instance v1, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    const-string v2, "quickPlay:"

    .line 95
    .line 96
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 100
    .line 101
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v2, ", ipv6: "

    .line 107
    .line 108
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 112
    .line 113
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlvIpv6:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-direct {p0, p1}, Ll/ig80;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 126
    .line 127
    .line 128
    :cond_4
    :goto_0
    return-void
.end method

.method public P0(ZLjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ig80;->k:Ll/ef80;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ef80;->n(Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p2}, Ll/ig80;->j4(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final Q4()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->prePlay()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lrx/c;

    .line 16
    .line 17
    new-instance v1, Ll/wf80;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/wf80;-><init>(Ll/ig80;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->restorePlayerView()Ll/v3f$c;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lrx/c;

    .line 45
    .line 46
    new-instance v2, Ll/xf80;

    .line 47
    .line 48
    invoke-direct {v2, p0}, Ll/xf80;-><init>(Ll/ig80;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    iget-object v2, v2, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 64
    .line 65
    invoke-virtual {v2}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->updatePlayer()Ll/v3f$d;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Lrx/c;

    .line 74
    .line 75
    new-instance v3, Ll/yf80;

    .line 76
    .line 77
    invoke-direct {v3, p0}, Ll/yf80;-><init>(Ll/ig80;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v3}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {v2, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    iget-object v3, v3, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 93
    .line 94
    invoke-virtual {v3}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->jumpInfoVisible()Ll/v3f$d;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v3}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    check-cast v3, Lrx/c;

    .line 103
    .line 104
    new-instance v4, Ll/zf80;

    .line 105
    .line 106
    invoke-direct {v4, p0}, Ll/zf80;-><init>(Ll/ig80;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v4}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-virtual {v3, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    const/4 v4, 0x4

    .line 118
    new-array v4, v4, [Ll/kcg0;

    .line 119
    .line 120
    const/4 v5, 0x0

    .line 121
    aput-object v0, v4, v5

    .line 122
    .line 123
    const/4 v0, 0x1

    .line 124
    aput-object v1, v4, v0

    .line 125
    .line 126
    const/4 v0, 0x2

    .line 127
    aput-object v2, v4, v0

    .line 128
    .line 129
    const/4 v0, 0x3

    .line 130
    aput-object v3, v4, v0

    .line 131
    .line 132
    invoke-static {v4}, Ll/pcg0;->c([Ll/kcg0;)Ll/ft5;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iput-object v0, p0, Ll/ig80;->i:Ll/ft5;

    .line 137
    .line 138
    return-void
.end method

.method public R1(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ig80;->k:Ll/ef80;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ef80;->p(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->videoSizeChanged()Ll/v3f$d;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public S4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->p()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/uxh0;->v()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public T()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/ig80;->o4()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/ig80;->i4()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ll/ig80;->P4()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->f()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/ig80;->k:Ll/ef80;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, v0}, Ll/ef80;->n(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final T4(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->playState()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public U4(I)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    if-eq p1, v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;->showBg()Ll/v3f$d;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance p1, Ll/vyr;

    .line 19
    .line 20
    invoke-direct {p1, v0}, Ll/vyr;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public V4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->q(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final X4(Ll/qwl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uxh0;->y(Ll/qwl;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c0(Ll/fyb;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ig80;->k:Ll/ef80;

    .line 2
    .line 3
    iget v1, p1, Ll/fyb;->a:I

    .line 4
    .line 5
    iget v2, p1, Ll/fyb;->b:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/ef80;->j(II)V

    .line 8
    .line 9
    .line 10
    iget v0, p1, Ll/fyb;->a:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/ig80;->U4(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->ctypChanged()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public f2()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/ig80;->k:Ll/ef80;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/ef80;->n(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->e()V

    .line 12
    .line 13
    .line 14
    const-string v0, "audience_live_stream_buffer"

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {p0, v0, v1}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    const/16 v0, 0x10

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/ig80;->T4(I)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/pzi0;->o()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    iget-wide v2, p0, Ll/ig80;->n:J

    .line 30
    .line 31
    const-wide/16 v4, 0x0

    .line 32
    .line 33
    cmp-long v2, v2, v4

    .line 34
    .line 35
    if-nez v2, :cond_0

    .line 36
    .line 37
    iput-wide v0, p0, Ll/ig80;->n:J

    .line 38
    .line 39
    :cond_0
    iget-wide v2, p0, Ll/ig80;->n:J

    .line 40
    .line 41
    sub-long v2, v0, v2

    .line 42
    .line 43
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-virtual {v4}, Ll/vwt;->M4()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    int-to-long v4, v4

    .line 52
    cmp-long v4, v2, v4

    .line 53
    .line 54
    if-lez v4, :cond_1

    .line 55
    .line 56
    iget-wide v4, p0, Ll/ig80;->o:J

    .line 57
    .line 58
    sub-long v4, v0, v4

    .line 59
    .line 60
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-virtual {v6}, Ll/vwt;->u5()I

    .line 65
    .line 66
    .line 67
    move-result v6

    .line 68
    int-to-long v6, v6

    .line 69
    cmp-long v4, v4, v6

    .line 70
    .line 71
    if-lez v4, :cond_1

    .line 72
    .line 73
    iget-object v4, p0, Ll/xzs;->e:Ll/dum;

    .line 74
    .line 75
    iget-object v4, v4, Ll/dum;->j:Ll/x6t;

    .line 76
    .line 77
    invoke-virtual {v4}, Ll/x6t;->M3()Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-static {v5, v4, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->b7(Ll/oo2;Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;J)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {p0, v2}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    new-instance v3, Ll/vf80;

    .line 94
    .line 95
    invoke-direct {v3}, Ll/vf80;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-static {v3}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {v2, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    iput-wide v0, p0, Ll/ig80;->o:J

    .line 106
    .line 107
    :cond_1
    return-void
.end method

.method public j4(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ig80;->k:Ll/ef80;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ef80;->k(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/ig80;->k:Ll/ef80;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p1, v0}, Ll/ef80;->l(Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 19
    .line 20
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->F9:I

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ll/ig80;->V4(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->k()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 37
    .line 38
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D9:I

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Ll/ig80;->V4(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 49
    .line 50
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D9:I

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Ll/ig80;->V4(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public l0(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->r()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/ig80;->k:Ll/ef80;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, v1}, Ll/ef80;->n(Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/ig80;->k:Ll/ef80;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/ef80;->l(Z)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Ll/ig80;->k4()V

    .line 24
    .line 25
    .line 26
    const/16 v0, 0x11

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/ig80;->T4(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 32
    .line 33
    invoke-virtual {v0, p0, p1}, Ll/uxh0;->q(Ll/ig80;I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final l4()Ll/fyb;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/uxh0;->h()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    cmpl-float v1, v0, v1

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/ig80;->k:Ll/ef80;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ll/ef80;->p(F)V

    .line 15
    .line 16
    .line 17
    :cond_0
    new-instance v0, Ll/fyb;

    .line 18
    .line 19
    iget-object v1, p0, Ll/ig80;->k:Ll/ef80;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/ef80;->a()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iget-object v2, p0, Ll/ig80;->k:Ll/ef80;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/ef80;->c()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iget-object p0, p0, Ll/ig80;->k:Ll/ef80;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ef80;->f()F

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-direct {v0, v1, v2, p0}, Ll/fyb;-><init>(IIF)V

    .line 38
    .line 39
    .line 40
    return-object v0
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->u(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ig80;->i:Ll/ft5;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ft5;->isUnsubscribed()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/ig80;->i:Ll/ft5;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/ft5;->unsubscribe()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/uxh0;->f()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ig80;->k:Ll/ef80;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ef80;->i()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/uxh0;->s()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/uxh0;->x()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ig80;->S4()V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/z91;->b()J

    .line 20
    .line 21
    .line 22
    invoke-super {p0}, Ll/i6t;->n()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public p0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/ig80;->m(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public p1(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->onReceiveMultiCallMode()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final p4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "rtc"

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/sjt;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 30
    .line 31
    const/4 p1, 0x2

    .line 32
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_1

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    :cond_1
    :goto_0
    return p0
.end method

.method public q0()V
    .locals 1

    .line 1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->K9:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p0, v0}, Ll/o1j0;->A(Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic q4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ig80;->k:Ll/ef80;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Ll/ef80;->n(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic r4(Ll/lh80;)Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->a:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    return-object p0
.end method

.method public s1(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ig80;->k:Ll/ef80;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ef80;->o(Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->onReceiveStreamMembers()Ll/v3f$d;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic s4(Ll/o7g0;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ig80;->k:Ll/ef80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ef80;->d()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ig80;->k:Ll/ef80;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Ll/ef80;->m(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->audienceCtypData()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lrx/c;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/tf80;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/tf80;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/uf80;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/uf80;-><init>(Ll/ig80;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic t4(Ll/xsi;)Ll/qwl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uxh0;->w()Ll/qwl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public u1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ig80;->k:Ll/ef80;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/ef80;->n(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->n(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->e()V

    .line 20
    .line 21
    .line 22
    const/16 v0, 0x12

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/ig80;->T4(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic u4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->v(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic v4(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/ig80;->m:Z

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final synthetic w4(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/wg80;->e(Ll/i6t;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic x4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ig80;->j:Ll/uxh0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->a:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ll/uxh0;->z(Landroid/widget/FrameLayout;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic y4(Ll/tyb;)Ll/qwl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uxh0;->g()Ll/qwl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic z4(Ll/z7b0;)Ltv/danmaku/ijk/media/player/PullWatchInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ig80;->j:Ll/uxh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uxh0;->g()Ll/qwl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/qwl;->a()Ltv/danmaku/ijk/media/player/PullWatchInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
