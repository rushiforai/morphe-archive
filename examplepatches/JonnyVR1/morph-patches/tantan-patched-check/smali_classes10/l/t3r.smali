.class public Ll/t3r;
.super Ll/g3r;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        "VM:",
        "Ll/i3r;",
        ">",
        "Ll/g3r<",
        "TD;TVM;>;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView$b;"
    }
.end annotation


# instance fields
.field public j:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/i3r;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;TVM;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/g3r;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic V3(Ll/t3r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t3r;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W3(Ll/t3r;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRefresh;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t3r;->l4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRefresh;)V

    return-void
.end method

.method public static synthetic X3(Ll/t3r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t3r;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y3(Ll/t3r;Ljava/lang/String;ZLjava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/t3r;->m4(Ljava/lang/String;ZLjava/util/List;)V

    return-void
.end method

.method public static synthetic Z3(Ll/t3r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;ILcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/t3r;->h4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;ILcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic a4(Ll/t3r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t3r;->g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b4(Ll/t3r;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t3r;->k4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c4(Ll/t3r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;ILcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/t3r;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;ILcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic d4()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Ll/q6r;->a:Z

    .line 3
    .line 4
    return-void
.end method

.method private n4()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/i3r;

    .line 4
    .line 5
    iget-object v0, v0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;->getSearchString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    xor-int/lit8 v2, v1, 0x1

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    const-string v1, "query"

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast v0, Ll/i3r;

    .line 25
    .line 26
    iget-object v0, v0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;->getListType()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const-string v1, ""

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v3, 0x1

    .line 37
    if-eq v0, v3, :cond_2

    .line 38
    .line 39
    const/4 v3, 0x2

    .line 40
    if-eq v0, v3, :cond_1

    .line 41
    .line 42
    move-object v0, v1

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    const-string v0, "sung"

    .line 45
    .line 46
    :goto_0
    move-object v4, v1

    .line 47
    move-object v1, v0

    .line 48
    move-object v0, v4

    .line 49
    goto :goto_1

    .line 50
    :cond_2
    const-string v0, "recommend"

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    const-string v0, "hot"

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :goto_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    check-cast v3, Ll/rwn0;

    .line 61
    .line 62
    invoke-virtual {v3}, Ll/vp20;->k()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-static {v3, v1, v0}, Ll/rqn0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v3, Ll/k3r;

    .line 75
    .line 76
    invoke-direct {v3, p0, v1, v2}, Ll/k3r;-><init>(Ll/t3r;Ljava/lang/String;Z)V

    .line 77
    .line 78
    .line 79
    new-instance p0, Ll/z2e0;

    .line 80
    .line 81
    invoke-direct {p0}, Ll/z2e0;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v3, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    return-void
.end method


# virtual methods
.method public L(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/t3r;->n4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public O3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t3r;->j:Ll/kcg0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v0, Ll/i3r;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/i3r;->b()V

    .line 11
    .line 12
    .line 13
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public P(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v1, Ll/i3r;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/i3r;->c()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v0, Ll/i3r;

    .line 19
    .line 20
    iget-object v0, v0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;->v0(Z)V

    .line 24
    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-direct {p0}, Ll/t3r;->n4()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/t3r;->init()V

    .line 5
    .line 6
    .line 7
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
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/i3r;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/i3r;->c()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v1, 0x0

    .line 12
    const-string v2, "KTV\u70b9\u6b4c"

    .line 13
    .line 14
    invoke-direct {v0, v2, p0, v1}, Ll/v3r;-><init>(Ljava/lang/String;Landroid/view/View;I)V

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

.method public U3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/i3r;

    .line 4
    .line 5
    iget-object v0, v0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;->e:Landroid/widget/EditText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/i3r;

    .line 15
    .line 16
    iget-object p0, p0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;->o0(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public d2(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Ll/i3r;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/i3r;->c()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ll/t3r;->n4()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public e4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;I)V
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
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0, p1}, Ll/t3r;->o4(ZLcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V

    .line 19
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
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Ll/rqn0;->h(Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/l3r;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/l3r;-><init>(Ll/t3r;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/m3r;

    .line 49
    .line 50
    invoke-direct {v1, p0, p1}, Ll/m3r;-><init>(Ll/t3r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/n3r;

    .line 58
    .line 59
    invoke-direct {v1, p0, p1, p2}, Ll/n3r;-><init>(Ll/t3r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;I)V

    .line 60
    .line 61
    .line 62
    new-instance p0, Ll/z2e0;

    .line 63
    .line 64
    invoke-direct {p0}, Ll/z2e0;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Ll/rwn0;

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_1

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callApplyEvent()Ll/v3f$d;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    new-instance v1, Ll/bzm0;

    .line 98
    .line 99
    invoke-direct {v1}, Ll/bzm0;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Ll/rwn0;

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/rwn0;->Z2()Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    new-instance v1, Ll/o3r;

    .line 120
    .line 121
    invoke-direct {v1, p0}, Ll/o3r;-><init>(Ll/t3r;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    new-instance v1, Ll/p3r;

    .line 129
    .line 130
    invoke-direct {v1}, Ll/p3r;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    const/4 v1, 0x1

    .line 138
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    new-instance v1, Ll/q3r;

    .line 143
    .line 144
    invoke-direct {v1, p0, p1, p2}, Ll/q3r;-><init>(Ll/t3r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;I)V

    .line 145
    .line 146
    .line 147
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_1
    new-instance p1, Ll/th0$a;

    .line 156
    .line 157
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    invoke-direct {p1, p2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 162
    .line 163
    .line 164
    const-string p2, "\u7533\u8bf7\u4e0a\u9ea6\u6f14\u5531"

    .line 165
    .line 166
    invoke-virtual {p1, p2}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    const-string p2, "\u4e0a\u9ea6\u540e\u624d\u80fd\u5531\u6b4c\u54e6\uff0c\u5411\u7fa4\u4e3b\u7533\u8bf7\u4e0a\u9ea6\u5427"

    .line 171
    .line 172
    invoke-virtual {p1, p2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    const-string p2, "\u53d1\u51fa\u7533\u8bf7"

    .line 177
    .line 178
    invoke-virtual {p1, p2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    new-instance p2, Ll/r3r;

    .line 183
    .line 184
    invoke-direct {p2, p0}, Ll/r3r;-><init>(Ll/t3r;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p1, p2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    const-string p1, "\u53d6\u6d88"

    .line 192
    .line 193
    invoke-virtual {p0, p1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 202
    .line 203
    .line 204
    return-void
.end method

.method public final synthetic f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)Lrx/c;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->status:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "end"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Ll/rwn0;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Ll/rqn0;->n(Ljava/lang/String;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public final synthetic g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)Lrx/c;
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
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->songCode:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->provider:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0, p2, p1}, Ll/rqn0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic h4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;ILcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t3r;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic i4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
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
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 12
    .line 13
    const-string p1, "ktv"

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public init()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/i3r;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/i3r;->d(Ll/t3r;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/rwn0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Ll/aj1;->X0:Lrx/subjects/b;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/j3r;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/j3r;-><init>(Ll/t3r;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Ll/t3r;->j:Ll/kcg0;

    .line 38
    .line 39
    invoke-direct {p0}, Ll/t3r;->n4()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic j4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;ILcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t3r;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->KtvDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$KtvDialogEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$KtvDialogEvent;->closeKtvDialog()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callApplyEvent()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Ll/bzm0;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/bzm0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic l4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRefresh;)V
    .locals 2

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
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRefresh;->getUserId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRefresh;->getAction()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRefresh$Action;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRefresh$Action;->REMOVE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVOrderRefresh$Action;

    .line 22
    .line 23
    if-ne p1, v0, :cond_0

    .line 24
    .line 25
    invoke-direct {p0}, Ll/t3r;->n4()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final synthetic m4(Ljava/lang/String;ZLjava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/i3r;

    .line 4
    .line 5
    iget-object v0, v0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 6
    .line 7
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;->u0(Ljava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    check-cast p0, Ll/i3r;

    .line 19
    .line 20
    invoke-virtual {p0, p3}, Ll/i3r;->f(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    check-cast p0, Ll/i3r;

    .line 25
    .line 26
    invoke-virtual {p0, p3}, Ll/i3r;->e(Ljava/util/List;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public o4(ZLcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/i3r;

    .line 4
    .line 5
    iget-object v0, v0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;->getSearchString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

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
    const/4 v0, -0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Ll/i3r;

    .line 22
    .line 23
    iget-object v0, v0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;->getListType()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    if-eq v0, v1, :cond_2

    .line 33
    .line 34
    const/4 v2, 0x2

    .line 35
    if-eq v0, v2, :cond_1

    .line 36
    .line 37
    move v0, v2

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move v0, v1

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    const/4 v0, 0x0

    .line 42
    goto :goto_0

    .line 43
    :cond_3
    const/4 v0, 0x3

    .line 44
    :goto_0
    if-eqz p1, :cond_4

    .line 45
    .line 46
    iget p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->position:I

    .line 47
    .line 48
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->title:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v0, p1, p2, p0}, Ll/q6r;->e(IILjava/lang/String;Ll/i6t;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_4
    iget p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->position:I

    .line 55
    .line 56
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->title:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v0, p1, p2, p0}, Ll/q6r;->d(IILjava/lang/String;Ll/i6t;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final p4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->isOrdered:Z

    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    sput-boolean p1, Ll/q6r;->a:Z

    .line 6
    .line 7
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p1, Ll/i3r;

    .line 10
    .line 11
    iget-object p1, p1, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;->getSearchString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    check-cast v0, Ll/i3r;

    .line 26
    .line 27
    iget-object p1, v0, Ll/i3r;->c:Ll/p2r;

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    check-cast v0, Ll/i3r;

    .line 34
    .line 35
    iget-object p1, v0, Ll/i3r;->b:Ll/p2r;

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 38
    .line 39
    .line 40
    :goto_0
    invoke-virtual {p0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance p1, Ll/s3r;

    .line 45
    .line 46
    invoke-direct {p1}, Ll/s3r;-><init>()V

    .line 47
    .line 48
    .line 49
    const-wide/16 v0, 0x64

    .line 50
    .line 51
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
