.class public Ll/boj;
.super Ll/qrm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qrm0<",
        "Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;",
        ">;"
    }
.end annotation


# instance fields
.field public r:Ljava/lang/Boolean;

.field public s:Ll/kcg0;


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
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 5
    .line 6
    iput-object p1, p0, Ll/boj;->r:Ljava/lang/Boolean;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic o4(Ll/boj;Ll/er40;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/boj;->t4(Ll/er40;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p4(Ll/boj;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/boj;->u4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic q4(Ll/boj;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/boj;->v4(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic u4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/boj;->w4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C1(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;->BOTTOM:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/boj;->s4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/xnj;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/xnj;-><init>(Ll/boj;)V

    .line 16
    .line 17
    .line 18
    const-class v1, Ll/er40;

    .line 19
    .line 20
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public bridge synthetic T3(IZ)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/boj;->r4(IZ)Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;

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
    sget p0, Ll/obc0;->fa:I

    .line 2
    .line 3
    return p0
.end method

.method public c4()I
    .locals 0

    .line 1
    sget p0, Ll/obc0;->ha:I

    .line 2
    .line 3
    return p0
.end method

.method public m4(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/znc0;->e(Ll/i6t;)Ll/coj;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    new-instance p2, Ll/cqj$a;

    .line 8
    .line 9
    invoke-direct {p2}, Ll/cqj$a;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, p1}, Ll/cqj$a;->h(Ll/coj;)Ll/cqj$a;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/cqj$a;->d()Ll/cqj;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 25
    .line 26
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGiftDialogEvent()Ll/v3f$d;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    new-instance p3, Ll/lx50;

    .line 31
    .line 32
    invoke-direct {p3}, Ll/lx50;-><init>()V

    .line 33
    .line 34
    .line 35
    const/16 v0, 0x320

    .line 36
    .line 37
    invoke-virtual {p3, v0}, Ll/lx50;->i(I)Ll/lx50;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    invoke-virtual {p3, p1}, Ll/lx50;->h(Ll/cqj;)Ll/lx50;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string p3, "voiceLiveMain"

    .line 46
    .line 47
    invoke-virtual {p1, p3}, Ll/lx50;->j(Ljava/lang/String;)Ll/lx50;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p2, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->dismissBubble()Ll/v3f$d;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p1, "voiceGiftButtonBubble"

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 5
    .line 6
    iput-object v0, p0, Ll/boj;->r:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;->j0(Ljava/lang/Boolean;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;->l0()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/boj;->s:Ll/kcg0;

    .line 27
    .line 28
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public r4(IZ)Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;
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
    sget v0, Ll/yec0;->v:I

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
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;

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
    iget-object v0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 31
    .line 32
    iget-object v1, p0, Ll/qrm0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Ll/qrm0;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;->setIcon(I)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;->setIcon(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :goto_0
    const/4 p0, 0x1

    .line 52
    invoke-static {p2, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    return-object p2
.end method

.method public final s4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->playGiftAnim()Ll/v3f$d;

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
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/aoj;

    .line 29
    .line 30
    invoke-direct {v0, p1}, Ll/aoj;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 41
    .line 42
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;->j0(Ljava/lang/Boolean;)V

    .line 43
    .line 44
    .line 45
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
    iget-boolean v0, v0, Ll/rwn0;->Q:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/boj;->w4()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->updateInspireGiftStatus()Ll/v3f$c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lrx/c;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/ynj;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/ynj;-><init>(Ll/boj;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->refreshGiftRedDot()Ll/v3f$d;

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
    new-instance v1, Ll/znj;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/znj;-><init>(Ll/boj;)V

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

.method public final synthetic t4(Ll/er40;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic v4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/VoiceBottomGiftView;->g0(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public w4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/boj;->r:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x3

    .line 10
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
