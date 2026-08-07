.class public Ll/t0n0;
.super Ll/lnm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/lnm0<",
        "Ll/rwn0;",
        "Ll/i0n0;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ll/dom0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/dom0;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/lnm0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/i0n0;

    .line 5
    .line 6
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ll/i0n0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, Ll/t0n0;->j:Ll/dom0;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic W3(Ll/p7o0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/p7o0;->a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 4
    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic X3(Ll/t0n0;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t0n0;->m4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V

    return-void
.end method

.method public static synthetic Y3(Ll/t0n0;Ll/p7o0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t0n0;->j4(Ll/p7o0;)V

    return-void
.end method

.method public static synthetic Z3(Ll/t0n0;Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t0n0;->k4(Ll/hrk0$a;)V

    return-void
.end method

.method public static synthetic a4(Ll/t0n0;Ll/p7o0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t0n0;->i4(Ll/p7o0;)V

    return-void
.end method

.method public static synthetic b4(Ljava/lang/Throwable;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c4(Ll/t0n0;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t0n0;->h4(Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d4(Ll/t0n0;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t0n0;->n4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V

    return-void
.end method

.method public static synthetic e4(Ll/t0n0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t0n0;->l4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V

    return-void
.end method

.method private synthetic h4(Ll/uxj0;)Lrx/c;
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
    invoke-virtual {p0}, Ll/rwn0;->S3()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private init()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/i0n0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 6
    .line 7
    iget-object v1, v1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/i0n0;->j(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/rwn0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/oo2;->m2()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/j0n0;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/j0n0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/k0n0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/k0n0;-><init>(Ll/t0n0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/l0n0;

    .line 45
    .line 46
    invoke-direct {v1}, Ll/l0n0;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/m0n0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/m0n0;-><init>(Ll/t0n0;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Ll/rwn0;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/rwn0;->S3()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/n0n0;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/n0n0;-><init>(Ll/t0n0;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Ll/rwn0;

    .line 96
    .line 97
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    new-instance v1, Ll/o0n0;

    .line 106
    .line 107
    invoke-direct {v1}, Ll/o0n0;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    new-instance v1, Ll/p0n0;

    .line 115
    .line 116
    invoke-direct {v1, p0}, Ll/p0n0;-><init>(Ll/t0n0;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Ll/rwn0;

    .line 131
    .line 132
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iget-object v0, v0, Ll/aj1;->c0:Lrx/subjects/b;

    .line 137
    .line 138
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    new-instance v1, Ll/q0n0;

    .line 143
    .line 144
    invoke-direct {v1, p0}, Ll/q0n0;-><init>(Ll/t0n0;)V

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
.end method

.method private synthetic j4(Ll/p7o0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/i0n0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/i0n0;->f()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private o4()V
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
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ll/rwn0;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/oo2;->n2()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/rwn0;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/rwn0;->N1(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/t0n0;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S3()Ll/fom0;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/fom0;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Vh:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/i0n0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/i0n0;->i()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-direct {v0, v1, p0, v2}, Ll/fom0;-><init>(Ljava/lang/String;Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public T3()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public U3()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/lnm0;->U3()V

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
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ll/rwn0;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/rwn0;->D3(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public V3()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/t0n0;->o4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->tf:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Ll/i0n0;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Ll/i0n0;->s(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public g4(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t0n0;->j:Ll/dom0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dom0;->h4()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x1

    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/rwn0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Ll/t0n0;->j:Ll/dom0;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/dom0;->h4()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->callInvite(Ljava/lang/String;Ljava/lang/String;I)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/r0n0;

    .line 37
    .line 38
    invoke-direct {v1, p0, p1}, Ll/r0n0;-><init>(Ll/t0n0;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    new-instance p0, Ll/r5k;

    .line 42
    .line 43
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ll/rwn0;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->callInvite(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/s0n0;

    .line 73
    .line 74
    invoke-direct {v1, p0, p1}, Ll/s0n0;-><init>(Ll/t0n0;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    new-instance p0, Ll/wnt;

    .line 78
    .line 79
    invoke-direct {p0}, Ll/wnt;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final synthetic i4(Ll/p7o0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/i0n0;

    .line 4
    .line 5
    iget-object p1, p1, Ll/p7o0;->a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, p1, v1, p0}, Ll/i0n0;->q(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic k4(Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/t0n0;->V3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic l4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/t0n0;->V3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t0n0;->f4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t0n0;->f4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
