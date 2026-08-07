.class public Ll/dom0;
.super Ll/lnm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/lnm0<",
        "Ll/rwn0;",
        "Ll/qnm0;",
        ">;"
    }
.end annotation


# instance fields
.field public j:I

.field public k:I


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/lnm0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/dom0;->k:I

    .line 6
    .line 7
    new-instance v0, Ll/qnm0;

    .line 8
    .line 9
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-direct {v0, p1, p0}, Ll/qnm0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/dom0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic W3(Ljava/util/List;Ll/uwl;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/lnm0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    check-cast p1, Ll/lnm0;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/lnm0;->S3()Ll/fom0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic X3(ILl/uwl;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/lnm0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/lnm0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/lnm0;->T3()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-ne v0, p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/lnm0;->V3()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic Y3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Te:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic Z3(Ll/dom0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dom0;->g4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V

    return-void
.end method

.method public static synthetic a4(Ll/dom0;Ll/snm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dom0;->l4(Ll/snm0;)V

    return-void
.end method

.method public static synthetic b4(Ll/dom0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dom0;->o4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic c4(Ll/fom0;Ll/fom0;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/fom0;->a()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Ll/fom0;->a()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sub-int/2addr p1, p0

    .line 10
    return p1
.end method

.method public static synthetic d4(Ll/dom0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dom0;->n4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)V

    return-void
.end method

.method public static synthetic e4(Ll/dom0;Ll/snm0;)Ll/snm0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dom0;->k4(Ll/snm0;)Ll/snm0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f4(Ll/dom0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dom0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method private p4(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/aom0;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Ll/aom0;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public R3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/y8s;->R3()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/t0n0;

    .line 5
    .line 6
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 7
    .line 8
    invoke-direct {v0, v1, p0}, Ll/t0n0;-><init>(Ll/dum;Ll/dom0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/wvm0;

    .line 15
    .line 16
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ll/wvm0;-><init>(Ll/dum;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceApplyManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceApplyManagerEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceApplyManagerEvent;->show()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/tnm0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/tnm0;-><init>(Ll/dom0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/unm0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/unm0;-><init>(Ll/dom0;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final g4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V
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
    const/4 v1, 0x3

    .line 12
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast v1, Ll/qnm0;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->NINE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;->getType()Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate$UpdateType;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;->getUserId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 63
    .line 64
    check-cast p0, Ll/qnm0;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;->getType()Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate$UpdateType;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate$UpdateType;->Remove:Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate$UpdateType;

    .line 71
    .line 72
    if-eq p1, v0, :cond_0

    .line 73
    .line 74
    const/4 p1, 0x1

    .line 75
    goto :goto_0

    .line 76
    :cond_0
    const/4 p1, 0x0

    .line 77
    :goto_0
    invoke-virtual {p0, p1}, Ll/qnm0;->S(Z)V

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method public h4()I
    .locals 0

    .line 1
    iget p0, p0, Ll/dom0;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public i4()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/fom0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance v1, Ll/ynm0;

    .line 13
    .line 14
    invoke-direct {v1, v0}, Ll/ynm0;-><init>(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/znm0;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/znm0;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public j4()Z
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
    const/4 v1, 0x3

    .line 12
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->NINE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll/rwn0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    invoke-static {p0}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    :cond_0
    const/4 p0, 0x1

    .line 47
    return p0

    .line 48
    :cond_1
    const/4 p0, 0x0

    .line 49
    return p0
.end method

.method public final synthetic k4(Ll/snm0;)Ll/snm0;
    .locals 1

    .line 1
    iget v0, p1, Ll/snm0;->b:I

    .line 2
    .line 3
    iput v0, p0, Ll/dom0;->k:I

    .line 4
    .line 5
    return-object p1
.end method

.method public final synthetic l4(Ll/snm0;)V
    .locals 0

    .line 1
    iget p1, p1, Ll/snm0;->a:I

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dom0;->r4(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic m4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/qnm0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic n4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)V
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
    invoke-virtual {p0}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;->getFreeCall()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->freeCall:Z

    .line 16
    .line 17
    return-void
.end method

.method public final synthetic o4(Ll/jsv;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/qnm0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v0, 0x4

    .line 16
    if-ne p1, v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p0, Ll/qnm0;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public q4()V
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
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->resetPopularity(Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/bom0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/bom0;-><init>(Ll/dom0;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/com0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/com0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public r4(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/qnm0;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/qnm0;->U(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/dom0;->s4(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public s4(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/dom0;->j:I

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/dom0;->p4(I)V

    .line 4
    .line 5
    .line 6
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
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->a1()Lrx/c;

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
    new-instance v1, Ll/vnm0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/vnm0;-><init>(Ll/dom0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/rwn0;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v0, v0, Ll/aj1;->c0:Lrx/subjects/b;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/wnm0;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/wnm0;-><init>(Ll/dom0;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Ll/rwn0;

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/xnm0;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/xnm0;-><init>(Ll/dom0;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    return-void
.end method
