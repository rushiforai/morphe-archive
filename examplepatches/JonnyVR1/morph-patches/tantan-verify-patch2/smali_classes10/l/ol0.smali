.class public Ll/ol0;
.super Ll/qrm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qrm0<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomCallButton;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/qrm0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o4(Ll/ol0;Ll/ovn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ol0;->r4(Ll/ovn0;)V

    return-void
.end method


# virtual methods
.method public C1(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qrm0;->l:Ll/dum;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/dum;->d:Z

    .line 4
    .line 5
    return p0
.end method

.method public bridge synthetic T3(IZ)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ol0;->q4(IZ)Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomCallButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b4()I
    .locals 0

    .line 1
    sget p0, Ll/obc0;->j1:I

    .line 2
    .line 3
    return p0
.end method

.method public c4()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public m4(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qrm0;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;->showMemberManagerDialog()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 p1, -0x1

    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public p4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomCallButton;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomCallButton;->c:Landroid/widget/TextView;

    .line 14
    .line 15
    sget v1, Ll/obc0;->x0:I

    .line 16
    .line 17
    invoke-static {v1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomCallButton;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomCallButton;->c:Landroid/widget/TextView;

    .line 31
    .line 32
    const/high16 v1, 0x41600000    # 14.0f

    .line 33
    .line 34
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomCallButton;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomCallButton;->c:Landroid/widget/TextView;

    .line 48
    .line 49
    const/high16 v0, 0x41980000    # 19.0f

    .line 50
    .line 51
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumWidth(I)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public q4(IZ)Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomCallButton;
    .locals 3

    .line 1
    iget-object p2, p0, Ll/qrm0;->l:Ll/dum;

    .line 2
    .line 3
    iget-object p2, p2, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    sget v0, Ll/yec0;->P7:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p2, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomCallButton;

    .line 17
    .line 18
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 19
    .line 20
    iget v1, p0, Ll/qrm0;->j:I

    .line 21
    .line 22
    iget v2, p0, Ll/qrm0;->i:I

    .line 23
    .line 24
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/qrm0;->l1()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomCallButton;->g0(Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 38
    .line 39
    iget-object v1, p0, Ll/qrm0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 40
    .line 41
    invoke-virtual {p0, v0, v1}, Ll/qrm0;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomCallButton;->setIcon(I)V

    .line 52
    .line 53
    .line 54
    return-object p2

    .line 55
    :cond_0
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomCallButton;->setIcon(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-object p2
.end method

.method public final synthetic r4(Ll/ovn0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/ovn0;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Ll/ol0;->s4(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public s4(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomCallButton;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomCallButton;->b(I)V

    .line 8
    .line 9
    .line 10
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
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->updateCountEvent()Ll/v3f$d;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-virtual {v0, v1}, Ll/v3f$b;->i(Z)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lrx/c;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/ml0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/ml0;-><init>(Ll/ol0;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/ol0;->p4()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->updateApplyCountEvent()Ll/v3f$d;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lrx/c;

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/ml0;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/ml0;-><init>(Ll/ol0;)V

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
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    check-cast v1, Ll/rwn0;

    .line 106
    .line 107
    invoke-virtual {v1}, Ll/rwn0;->W0()Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->callApplyList(Ljava/lang/String;Z)Lrx/c;

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
    new-instance v1, Ll/nl0;

    .line 120
    .line 121
    invoke-direct {v1, p0}, Ll/nl0;-><init>(Ll/ol0;)V

    .line 122
    .line 123
    .line 124
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 129
    .line 130
    .line 131
    return-void
.end method
