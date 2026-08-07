.class public Ll/v5v;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/kcg0;

.field public b:Ll/j0v;

.field public c:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/v5v;->a:Ll/kcg0;

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h0(Ll/v5v;ZLl/j0v;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v5v;->r0(ZLl/j0v;)V

    return-void
.end method

.method public static synthetic i0(Ll/v5v;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v5v;->q0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic j0(Ll/v5v;Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v5v;->p0(Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->activity:Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l0(ILjava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;)Ll/j0v;
    .locals 1

    .line 1
    new-instance v0, Ll/j0v;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/j0v;-><init>(ILjava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/j0v;->a()Ll/j0v;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic m0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->notifyRefreshVoiceActivitiesNum()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/v5v;->o0()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/v5v;->c:Ll/kcg0;

    .line 8
    .line 9
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 13
    .line 14
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ll/gm3;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/gm3;->h()Lrx/subjects/a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-wide/16 v2, 0x1f4

    .line 29
    .line 30
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 31
    .line 32
    invoke-virtual {v1, v2, v3, v4}, Lrx/c;->throttleLast(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    new-instance v2, Ll/m5v;

    .line 37
    .line 38
    invoke-direct {v2}, Ll/m5v;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    new-instance v2, Ll/n5v;

    .line 46
    .line 47
    invoke-direct {v2, p0}, Ll/n5v;-><init>(Ll/v5v;)V

    .line 48
    .line 49
    .line 50
    new-instance v3, Ll/o5v;

    .line 51
    .line 52
    invoke-direct {v3}, Ll/o5v;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {v2, v3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iput-object v1, p0, Ll/v5v;->c:Ll/kcg0;

    .line 64
    .line 65
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Ll/gm3;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/gm3;->g()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/p5v;

    .line 80
    .line 81
    invoke-direct {v1}, Ll/p5v;-><init>()V

    .line 82
    .line 83
    .line 84
    new-instance v2, Ll/q5v;

    .line 85
    .line 86
    invoke-direct {v2}, Ll/q5v;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Ll/ppi0;->y()Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    new-instance v1, Ll/r5v;

    .line 121
    .line 122
    invoke-direct {v1, p0}, Ll/r5v;-><init>(Ll/v5v;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v5v;->a:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/v5v;->c:Ll/kcg0;

    .line 7
    .line 8
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final n0()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ppi0;->x()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/vwt;->v7()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public final o0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/v5v;->n0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->setLiveVoiceEntryViewVis(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic p0(Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->momentUnReadCon:I

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->momentRedDotType:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v0, p1, v1}, Ll/v5v;->u0(ILjava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic q0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v5v;->o0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/v5v;->t0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic r0(ZLl/j0v;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->E(Ll/j0v;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p2, p1}, Ll/v5v;->y0(Ll/j0v;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public s0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->A()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public t0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/v5v;->n0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 9
    .line 10
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ll/gm3;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/gm3;->h()Lrx/subjects/a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->activity:Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    :goto_0
    return-void

    .line 34
    :cond_2
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->momentUnReadCon:I

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->momentRedDotType:Ljava/lang/String;

    .line 37
    .line 38
    const/4 v2, 0x1

    .line 39
    invoke-virtual {p0, v1, v0, v2}, Ll/v5v;->u0(ILjava/lang/String;Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final u0(ILjava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/v5v;->n0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/v5v;->a:Ll/kcg0;

    .line 9
    .line 10
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/VoiceCenterApiProvider;->getVoiceNoticeLivingList()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/s5v;

    .line 22
    .line 23
    invoke-direct {v1, p1, p2}, Ll/s5v;-><init>(ILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance p2, Ll/t5v;

    .line 31
    .line 32
    invoke-direct {p2, p0, p3}, Ll/t5v;-><init>(Ll/v5v;Z)V

    .line 33
    .line 34
    .line 35
    new-instance p3, Ll/u5v;

    .line 36
    .line 37
    invoke-direct {p3}, Ll/u5v;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {p2, p3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Ll/v5v;->a:Ll/kcg0;

    .line 49
    .line 50
    return-void
.end method

.method public x0()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/VoiceCenterApiProvider;->postVoiceActivitiesToZero()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y0(Ll/j0v;Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    if-nez p2, :cond_2

    .line 5
    .line 6
    iget-object p2, p0, Ll/v5v;->b:Ll/j0v;

    .line 7
    .line 8
    if-eqz p2, :cond_2

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Ll/j0v;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-nez p2, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    :goto_0
    return-void

    .line 18
    :cond_2
    :goto_1
    const/4 p2, 0x0

    .line 19
    invoke-static {p1, p2, p2, p2}, Ll/evo0;->f(Ll/j0v;ZZZ)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/v5v;->b:Ll/j0v;

    .line 23
    .line 24
    return-void
.end method
