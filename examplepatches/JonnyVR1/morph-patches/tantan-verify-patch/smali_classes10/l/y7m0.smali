.class public Ll/y7m0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/room/close/VirtualVoiceCloseView;",
        ">;"
    }
.end annotation


# static fields
.field public static j:I


# instance fields
.field public i:J


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/room/close/VirtualVoiceCloseView;)V
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

.method public static synthetic J3(Ll/y7m0;Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y7m0;->Z3(Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;)V

    return-void
.end method

.method public static synthetic K3(Ll/y7m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y7m0;->S3(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L3(Ll/y7m0;Ll/u7f;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y7m0;->R3(Ll/u7f;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/y7m0;Ll/dan0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y7m0;->P3(Ll/dan0;)V

    return-void
.end method

.method public static synthetic N3(Ll/y7m0;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y7m0;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method


# virtual methods
.method public final O3(Ljava/lang/String;)V
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
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ll/y6s;->d(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/rwn0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 30
    .line 31
    const-string v1, "game"

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    const-string p0, "\u6e38\u620f\u4e2d,\u7981\u6b62\u6536\u8d77\u623f\u95f4"

    .line 40
    .line 41
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ll/rwn0;

    .line 50
    .line 51
    const/4 v1, 0x1

    .line 52
    invoke-virtual {v0, v1}, Ll/rwn0;->Q3(Z)V

    .line 53
    .line 54
    .line 55
    new-instance v0, Ll/hti;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Ll/rwn0;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/i6t;->n3()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    new-instance v3, Ll/npc0;

    .line 68
    .line 69
    const/16 v4, 0xd48

    .line 70
    .line 71
    invoke-direct {v3, v4}, Ll/npc0;-><init>(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v3}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Ljava/lang/String;

    .line 79
    .line 80
    invoke-direct {v0, v1, v2, v3, p1}, Ll/hti;-><init>(Ll/oo2;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-static {}, Ll/lwr;->b()V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Ll/cmp0;->d()Ll/cmp0;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1, v0}, Ll/cmp0;->l(Ll/hti;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Ll/rwn0;

    .line 99
    .line 100
    invoke-virtual {v0, p1}, Ll/oo2;->b2(Z)V

    .line 101
    .line 102
    .line 103
    if-nez p1, :cond_1

    .line 104
    .line 105
    invoke-static {}, Ll/lwr;->d()V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_1
    invoke-static {}, Ll/cmp0;->d()Ll/cmp0;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p1}, Ll/cmp0;->k()V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 117
    .line 118
    if-eqz p1, :cond_2

    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-nez p1, :cond_2

    .line 125
    .line 126
    iget-object p1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 127
    .line 128
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-nez p1, :cond_2

    .line 133
    .line 134
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 137
    .line 138
    .line 139
    :cond_2
    return-void
.end method

.method public final synthetic P3(Ll/dan0;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Ll/dan0;->a:Z

    .line 2
    .line 3
    iget-object p1, p1, Ll/dan0;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ll/y7m0;->X3(ZLjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic R3(Ll/u7f;)Ljava/lang/Boolean;
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
    invoke-virtual {p0}, Ll/oo2;->Y0()Z

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

.method public final synthetic S3(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y7m0;->V3()V

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
    invoke-static {}, Ll/lwr;->d()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCloseEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;->showFloatWindow()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lrx/c;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/t7m0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/t7m0;-><init>(Ll/y7m0;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/u7m0;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/u7m0;-><init>(Ll/y7m0;)V

    .line 42
    .line 43
    .line 44
    const-class v1, Ll/u7f;

    .line 45
    .line 46
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCloseEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;->voiceVirtualLiveViewGestureDetect()Ll/v3f$d;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Lrx/c;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/v7m0;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/v7m0;-><init>(Ll/y7m0;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final synthetic T3(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 2

    .line 1
    new-instance v0, Ll/moo0;

    .line 2
    .line 3
    const-string v1, "notice"

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;->data:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 6
    .line 7
    invoke-direct {v0, v1, p1}, Ll/moo0;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Ll/rwn0;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/rwn0;->p()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Ll/xzs;->e:Ll/dum;

    .line 23
    .line 24
    iget-object p1, p1, Ll/dum;->b:Ll/njt;

    .line 25
    .line 26
    invoke-static {p1}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VirtualRoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;->showVirtualNoticePreviewDialog()Ll/v3f$d;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->TopNoticeEvent:Lcom/tantan/live/eventbus/LiveEventBus$TopNoticeEvent;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$TopNoticeEvent;->openEditNoticeDialog2()Ll/v3f$d;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final U3(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    check-cast v2, Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {v2}, Ll/rwn0;->h3()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-nez v2, :cond_1

    .line 16
    .line 17
    invoke-static {p0}, Ll/i9o0;->i(Ll/i6t;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v2, 0x0

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    :goto_0
    const/4 v2, 0x1

    .line 27
    :goto_1
    iget-wide v3, p0, Ll/y7m0;->i:J

    .line 28
    .line 29
    sub-long/2addr v0, v3

    .line 30
    long-to-float v0, v0

    .line 31
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 32
    .line 33
    div-float/2addr v0, v1

    .line 34
    sget v1, Ll/y7m0;->j:I

    .line 35
    .line 36
    int-to-float v1, v1

    .line 37
    cmpl-float v0, v0, v1

    .line 38
    .line 39
    if-gtz v0, :cond_3

    .line 40
    .line 41
    if-eqz v2, :cond_2

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_2
    invoke-virtual {p0}, Ll/y7m0;->V3()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_3
    :goto_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    invoke-static {p0}, Ll/jkp0;->m(Ll/i6t;)V

    .line 55
    .line 56
    .line 57
    new-instance p1, Ll/th0$a;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-direct {p1, v0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 64
    .line 65
    .line 66
    const-string v0, "\u786e\u8ba4\u8981\u79bb\u5f00\u7fa4\u804a\u5417?"

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    sget v0, Ll/n9c0;->p0:I

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const-string v0, "\u786e\u8ba4\u79bb\u5f00"

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    new-instance v0, Ll/x7m0;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ll/x7m0;-><init>(Ll/y7m0;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    sget p1, Ll/n9c0;->X0:I

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ll/th0$a;->d(I)Ll/th0$a;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const-string p1, "\u624b\u6ed1\u4e86"

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Ll/rwn0;

    .line 118
    .line 119
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Ll/jsv;->a()I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_7

    .line 128
    .line 129
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    check-cast v0, Ll/rwn0;

    .line 134
    .line 135
    invoke-virtual {v0}, Ll/oo2;->k0()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    if-nez v0, :cond_5

    .line 140
    .line 141
    const/4 v0, 0x3

    .line 142
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-eqz v0, :cond_5

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_5
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 150
    .line 151
    invoke-virtual {v0}, Ll/wrv;->u()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 156
    .line 157
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 158
    .line 159
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_6

    .line 164
    .line 165
    invoke-virtual {p0, p1}, Ll/y7m0;->O3(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :cond_6
    invoke-static {}, Ll/lwr;->b()V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 177
    .line 178
    .line 179
    :cond_7
    :goto_3
    return-void
.end method

.method public V3()V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/jkp0;->n(Ll/i6t;)V

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
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "voice-close"

    .line 15
    .line 16
    invoke-static {p0, v0, v1}, Ll/ydn0;->g(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public W3()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/y7m0;->U3(Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public X3(ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/y7m0;->U3(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Y3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->openSharePanelDialog()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final Z3(Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;)V
    .locals 1

    .line 1
    sget-object v0, Ll/y7m0$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p1, "slide"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/y7m0;->U3(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public a4()V
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
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->getVirtualVoiceRoomInfo(Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/w7m0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/w7m0;-><init>(Ll/y7m0;)V

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

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/rwn0;->k3()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/lwr;->b()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/close/VirtualVoiceCloseView;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ll/rwn0;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/close/VirtualVoiceCloseView;->o0(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/vwt;->e4()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    sput v0, Ll/y7m0;->j:I

    .line 32
    .line 33
    invoke-static {}, Ll/pzi0;->o()J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    iput-wide v0, p0, Ll/y7m0;->i:J

    .line 38
    .line 39
    return-void
.end method
