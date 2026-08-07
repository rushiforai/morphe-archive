.class public Ll/nhw;
.super Ll/qrm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qrm0<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;",
        ">;"
    }
.end annotation


# instance fields
.field public r:Ll/kcg0;


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

.method public static synthetic o4(Ll/nhw;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/nhw;->u4(J)V

    return-void
.end method

.method public static synthetic p4(Ll/nhw;Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nhw;->t4(Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;)V

    return-void
.end method

.method public static synthetic q4(Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->endTime:J

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->currentTime:J

    .line 4
    .line 5
    sub-long/2addr v0, v2

    .line 6
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 7
    .line 8
    .line 9
    move-result-wide p0

    .line 10
    const-wide/16 v2, 0x3e8

    .line 11
    .line 12
    mul-long/2addr p0, v2

    .line 13
    sub-long/2addr v0, p0

    .line 14
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method private s4()V
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
    invoke-virtual {v0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/rwn0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->getLuckyParadiseEntranceInfo(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/khw;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/khw;-><init>(Ll/nhw;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private u4(J)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x3e8

    .line 2
    .line 3
    div-long v0, p1, v0

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/nhw;->r:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->p0()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;

    .line 31
    .line 32
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->z0(J)V

    .line 33
    .line 34
    .line 35
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

.method public bridge synthetic T3(IZ)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nhw;->r4(IZ)Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;

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
    sget p0, Ll/obc0;->T8:I

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
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance p2, Ll/bae0$a;

    .line 12
    .line 13
    const/16 v0, 0x64

    .line 14
    .line 15
    invoke-direct {p2, v0}, Ll/bae0$a;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, p3}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2}, Ll/bae0$a;->c()Ll/bae0;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p1, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    sget-object p1, Ll/zeu;->f:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    check-cast p2, Ll/rwn0;

    .line 36
    .line 37
    invoke-virtual {p2}, Ll/rwn0;->p()Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    invoke-static {p2}, Ll/jkp0;->f(Z)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->q0()Ljava/lang/Boolean;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p3, "is_crazy"

    .line 56
    .line 57
    invoke-static {p3, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    filled-new-array {p0}, [Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/nhw;->r:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public r4(IZ)Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;
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
    sget v0, Ll/yec0;->t9:I

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
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;

    .line 17
    .line 18
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 19
    .line 20
    const/high16 v1, 0x42300000    # 44.0f

    .line 21
    .line 22
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/high16 v2, 0x42180000    # 38.0f

    .line 27
    .line 28
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 39
    .line 40
    iget-object v1, p0, Ll/qrm0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 41
    .line 42
    invoke-virtual {p0, v0, v1}, Ll/qrm0;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->setIcon(I)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->setIcon(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :goto_0
    const/4 p0, 0x1

    .line 60
    invoke-static {p2, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    return-object p2
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/nhw;->s4()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/aj1;->b()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/khw;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/khw;-><init>(Ll/nhw;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final t4(Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/qrm0;->X3()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/LucyParadiseEntranceView;->y0(Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/nhw;->r:Ll/kcg0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->isCrazyNow:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->endTime:J

    .line 20
    .line 21
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->currentTime:J

    .line 22
    .line 23
    cmp-long v0, v0, v2

    .line 24
    .line 25
    if-lez v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/rwn0;

    .line 32
    .line 33
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->endTime:J

    .line 44
    .line 45
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->currentTime:J

    .line 46
    .line 47
    sub-long/2addr v1, v3

    .line 48
    const-wide/16 v3, 0x3e8

    .line 49
    .line 50
    div-long/2addr v1, v3

    .line 51
    long-to-int v1, v1

    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/lhw;

    .line 57
    .line 58
    invoke-direct {v1, p1}, Ll/lhw;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    new-instance v0, Ll/mhw;

    .line 66
    .line 67
    invoke-direct {v0, p0}, Ll/mhw;-><init>(Ll/nhw;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Ll/nhw;->r:Ll/kcg0;

    .line 79
    .line 80
    :cond_0
    return-void
.end method
