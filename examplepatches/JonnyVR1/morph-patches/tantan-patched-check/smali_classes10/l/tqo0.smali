.class public Ll/tqo0;
.super Ll/x5;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/x5<",
        "Ll/jqm0;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
        "Ll/noo0;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ll/noo0;

.field public final k:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

.field public final l:Ll/ogd0;

.field public m:Ll/kcg0;

.field public n:Ll/kcg0;

.field public o:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/noo0;Ll/ogd0;Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/x5;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tqo0;->j:Ll/noo0;

    .line 5
    .line 6
    iget-object v0, p1, Ll/dum;->f:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 9
    .line 10
    iput-object v0, p0, Ll/tqo0;->k:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 11
    .line 12
    iput-object p2, p0, Ll/tqo0;->l:Ll/ogd0;

    .line 13
    .line 14
    invoke-virtual {p0, p3}, Ll/l6t;->C(Ll/iam;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p2, Landroid/view/ViewGroup;

    .line 20
    .line 21
    invoke-virtual {p1, p0, p2}, Ll/dum;->a(Ll/njt;Landroid/view/ViewGroup;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private synthetic A4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;

    .line 10
    .line 11
    iget-object p1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/jqm0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgPicType:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ll/jqm0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backgroundUrl:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;

    .line 42
    .line 43
    iget-object p0, v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;

    .line 44
    .line 45
    const-string v0, "static"

    .line 46
    .line 47
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private D4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/bri0;

    .line 29
    .line 30
    invoke-direct {p1, p3}, Ll/bri0;-><init>(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic j4(Ll/tqo0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tqo0;->w4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic k4(Ll/tqo0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tqo0;->y4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic l4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m4(Ll/tqo0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tqo0;->z4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method public static synthetic n4()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o4(Ll/tqo0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tqo0;->A4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic p4(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

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

.method public static synthetic q4(Ll/tqo0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tqo0;->v4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic r4(Ll/tqo0;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tqo0;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    return-void
.end method

.method private s4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tqo0;->n:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->getGiftWidthObs()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/pqo0;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/pqo0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/qqo0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/qqo0;-><init>(Ll/tqo0;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/rqo0;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/rqo0;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Ll/tqo0;->n:Ll/kcg0;

    .line 54
    .line 55
    return-void
.end method

.method private synthetic v4(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->changeInputSize()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Landroid/util/Size;

    .line 12
    .line 13
    invoke-static {}, Ll/bnl0;->y0()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    sub-int/2addr v1, p1

    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-direct {v0, v1, p1}, Landroid/util/Size;-><init>(II)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private synthetic w4(Ll/jsv;)V
    .locals 1

    .line 1
    sget-object p1, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 2
    .line 3
    const-string v0, "voice_valid_state_module"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/njt;->M3()V

    .line 9
    .line 10
    .line 11
    const-string p0, "validStateModule"

    .line 12
    .line 13
    invoke-virtual {p1, v0, p0}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic x4(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/oo2;->T0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public B4(ZLcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tqo0;->o:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Ll/tqo0;->o:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PreLoadEvent:Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;->preLoad()Ll/v3f$d;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance v0, Ll/om80;

    .line 27
    .line 28
    invoke-direct {v0, p1, p2}, Ll/om80;-><init>(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public C4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    return-void
.end method

.method public E4(ZLjava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCloseEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;->showFloatWindow()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/dan0;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2}, Ll/dan0;-><init>(ZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public N3()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/tqo0;->o:Ljava/lang/String;

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PreLoadEvent:Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;->cleanPreLoad()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public O3()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public P3()V
    .locals 0

    .line 1
    return-void
.end method

.method public R3()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Landroid/view/View;

    .line 4
    .line 5
    return-object p0
.end method

.method public bridge synthetic S3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ZLl/y20;Ll/y20;Z)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/tqo0;->u4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;ZLl/y20;Ll/y20;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T3(Ll/y20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;->initSmallWindowRoomInfo()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/vgd0;

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    move-object v1, p1

    .line 18
    invoke-direct/range {v0 .. v5}, Ll/vgd0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ZLl/y20;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public U3(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public V3()Z
    .locals 2

    .line 1
    new-instance v0, Ll/u7f;

    .line 2
    .line 3
    const/16 v1, 0xd48

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/u7f;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public W3()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tqo0;->o:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

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

.method public X3(I)Z
    .locals 2

    .line 1
    new-instance v0, Ll/v24;

    .line 2
    .line 3
    const/16 v1, 0xd48

    .line 4
    .line 5
    invoke-direct {v0, v1, p1}, Ll/v24;-><init>(II)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public Y3(ZZ)Z
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    sget-object p2, Ll/zrv;->a:Ll/wrv;

    .line 5
    .line 6
    invoke-virtual {p2}, Ll/wrv;->u()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iget-object p2, p2, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 11
    .line 12
    iget-object p2, p2, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    const-string p2, "click_back_button"

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Ll/tqo0;->E4(ZLjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    return p1
.end method

.method public Z3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tqo0;->l:Ll/ogd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ogd0;->h1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a4()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "slide"

    .line 3
    .line 4
    invoke-virtual {p0, v0, v1}, Ll/tqo0;->E4(ZLjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic b4(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/tqo0;->B4(ZLcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic c4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tqo0;->C4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e4(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/jqm0;->f4(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f4(Ll/qwl;)V
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
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->updatePlayer()Ll/v3f$d;

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

.method public g4(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->setSwallowAllTouchEvent(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public i4()V
    .locals 3

    .line 1
    invoke-static {}, Ll/zrv;->r()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/tqo0;->l:Ll/ogd0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ogd0;->x0()Ll/u4j;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0}, Ll/njt;->K3()Ll/dum;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ll/mer;->I2(Ll/dum;)Ll/l6t;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/njt;->K3()Ll/dum;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/noo0;

    .line 26
    .line 27
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;

    .line 30
    .line 31
    invoke-static {p0, v0, v1}, Ll/jqo0;->c(Ll/tqo0;Ll/noo0;Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;)V

    .line 32
    .line 33
    .line 34
    invoke-super {p0}, Ll/l6t;->T()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ll/jqm0;

    .line 42
    .line 43
    iget-object v1, p0, Ll/x5;->i:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/vp20;->w(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Ll/jqm0;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/rwn0;->c2()V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 64
    .line 65
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;

    .line 66
    .line 67
    const/4 v1, 0x1

    .line 68
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->k0(Z)V

    .line 69
    .line 70
    .line 71
    invoke-direct {p0}, Ll/tqo0;->s4()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Ll/jqm0;

    .line 79
    .line 80
    invoke-virtual {v0}, Ll/rwn0;->y()Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v2, Ll/lqo0;

    .line 89
    .line 90
    invoke-direct {v2, p0}, Ll/lqo0;-><init>(Ll/tqo0;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    new-instance v2, Ll/mqo0;

    .line 113
    .line 114
    invoke-direct {v2, p0}, Ll/mqo0;-><init>(Ll/tqo0;)V

    .line 115
    .line 116
    .line 117
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Ll/jqm0;

    .line 129
    .line 130
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    new-instance v2, Ll/nqo0;

    .line 139
    .line 140
    invoke-direct {v2, p0}, Ll/nqo0;-><init>(Ll/tqo0;)V

    .line 141
    .line 142
    .line 143
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, Ll/jqm0;

    .line 155
    .line 156
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 157
    .line 158
    invoke-virtual {v0, v2}, Ll/oo2;->o1(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    new-instance v2, Ll/oqo0;

    .line 163
    .line 164
    invoke-direct {v2, p0}, Ll/oqo0;-><init>(Ll/tqo0;)V

    .line 165
    .line 166
    .line 167
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    iput-object v0, p0, Ll/tqo0;->m:Ll/kcg0;

    .line 176
    .line 177
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    check-cast v0, Ll/jqm0;

    .line 182
    .line 183
    invoke-virtual {v0}, Ll/oo2;->P1()V

    .line 184
    .line 185
    .line 186
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->f(I)V

    .line 191
    .line 192
    .line 193
    const/4 v0, 0x0

    .line 194
    iput-object v0, p0, Ll/tqo0;->o:Ljava/lang/String;

    .line 195
    .line 196
    return-void
.end method

.method public init()V
    .locals 3

    .line 1
    new-instance v0, Ll/i5j;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 4
    .line 5
    iget-object v2, p0, Ll/tqo0;->l:Ll/ogd0;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/i5j;-><init>(Ll/dum;Ll/ogd0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/njt;->K3()Ll/dum;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/noo0;

    .line 18
    .line 19
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;

    .line 22
    .line 23
    invoke-static {p0, v0, v1}, Ll/jqo0;->d(Ll/tqo0;Ll/noo0;Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;

    .line 29
    .line 30
    iget-object p0, p0, Ll/tqo0;->k:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->j0(Ll/rgd0;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-virtual {p0, v0}, Ll/ere;->t(Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dum;->m:Ll/w3o0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/l6t;->destroy()V

    .line 6
    .line 7
    .line 8
    const-string v0, "context_single_room"

    .line 9
    .line 10
    invoke-static {v0}, Ll/r230;->p(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/tqo0;->m:Ll/kcg0;

    .line 14
    .line 15
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/tqo0;->V3()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-super {p0}, Ll/i6t;->n()V

    .line 23
    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 28
    .line 29
    iget-object p0, p0, Ll/dum;->h:Ll/oo2;

    .line 30
    .line 31
    check-cast p0, Ll/jqm0;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p0, v0}, Ll/jqm0;->c0(Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ll/jqm0;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/jqm0;->exit()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public s2()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->s2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/tqo0;->n:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->destroy()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/pvn$a;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/pvn$a;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/pvn;->e(Ll/ga1;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/jqm0;

    .line 17
    .line 18
    iget-boolean v0, v0, Ll/rwn0;->Q:Z

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/jqm0;

    .line 27
    .line 28
    invoke-static {}, Ll/pzi0;->o()J

    .line 29
    .line 30
    .line 31
    move-result-wide v1

    .line 32
    iput-wide v1, v0, Ll/jqm0;->g0:J

    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Ll/jqm0;

    .line 45
    .line 46
    invoke-virtual {v1}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgPicType:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Ll/jqm0;

    .line 57
    .line 58
    invoke-virtual {v2}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backgroundUrl:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceAuctionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;->refreshVoiceBg()Ll/v3f$d;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Lrx/c;

    .line 82
    .line 83
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Ll/kqo0;

    .line 88
    .line 89
    invoke-direct {v1, p0}, Ll/kqo0;-><init>(Ll/tqo0;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public t4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/njt;->J3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;ZLl/y20;Ll/y20;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
            "Z",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;->initRoomInfo()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/vgd0;

    .line 12
    .line 13
    move-object v2, p1

    .line 14
    move v3, p2

    .line 15
    move-object v4, p3

    .line 16
    move-object v1, p4

    .line 17
    move v5, p5

    .line 18
    invoke-direct/range {v0 .. v5}, Ll/vgd0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ZLl/y20;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic y4(Ll/jsv;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jsv;->k()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ll/jqm0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/jqm0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p1, v0, p0}, Ll/jqm0;->e2(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 28
    .line 29
    const-string p1, "enter_voice_room"

    .line 30
    .line 31
    const-string v0, "startLive"

    .line 32
    .line 33
    invoke-virtual {p0, p1, v0}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final synthetic z4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, -0x1

    .line 12
    sparse-switch v1, :sswitch_data_0

    .line 13
    .line 14
    .line 15
    goto/16 :goto_0

    .line 16
    .line 17
    :sswitch_0
    const-string v1, "delete_manager"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto/16 :goto_0

    .line 26
    .line 27
    :cond_0
    const/16 v3, 0x9

    .line 28
    .line 29
    goto/16 :goto_0

    .line 30
    .line 31
    :sswitch_1
    const-string v1, "forbidden_multidevice"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    goto/16 :goto_0

    .line 40
    .line 41
    :cond_1
    const/16 v3, 0x8

    .line 42
    .line 43
    goto/16 :goto_0

    .line 44
    .line 45
    :sswitch_2
    const-string v1, "force_stop"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    const/4 v3, 0x7

    .line 55
    goto :goto_0

    .line 56
    :sswitch_3
    const-string v1, "pause"

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_3

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    const/4 v3, 0x6

    .line 66
    goto :goto_0

    .line 67
    :sswitch_4
    const-string v1, "stop"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_4

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    const/4 v3, 0x5

    .line 77
    goto :goto_0

    .line 78
    :sswitch_5
    const-string v1, "boot"

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_5

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_5
    const/4 v3, 0x4

    .line 88
    goto :goto_0

    .line 89
    :sswitch_6
    const-string v1, "chat_tip_change"

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_6

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_6
    const/4 v3, 0x3

    .line 99
    goto :goto_0

    .line 100
    :sswitch_7
    const-string v1, "re_request_room_gift_list"

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-nez v0, :cond_7

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_7
    const/4 v3, 0x2

    .line 110
    goto :goto_0

    .line 111
    :sswitch_8
    const-string v1, "system"

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_8

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_8
    move v3, v2

    .line 121
    goto :goto_0

    .line 122
    :sswitch_9
    const-string v1, "add_manager"

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-nez v0, :cond_9

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_9
    const/4 v3, 0x0

    .line 132
    :goto_0
    const-string v0, ""

    .line 133
    .line 134
    packed-switch v3, :pswitch_data_0

    .line 135
    .line 136
    .line 137
    goto/16 :goto_2

    .line 138
    .line 139
    :pswitch_0
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->isAnchor:Z

    .line 140
    .line 141
    if-eqz v1, :cond_a

    .line 142
    .line 143
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->T5:I

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_a
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->R5:I

    .line 147
    .line 148
    :goto_1
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    check-cast v2, Ll/jqm0;

    .line 157
    .line 158
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    check-cast v3, Ll/jqm0;

    .line 163
    .line 164
    invoke-virtual {v3}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    invoke-virtual {v2, v3}, Ll/oo2;->g2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p0}, Ll/tqo0;->t4()V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/live/LiveDialogAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    goto/16 :goto_2

    .line 189
    .line 190
    :pswitch_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    check-cast p0, Ll/jqm0;

    .line 195
    .line 196
    sget-object v0, Ll/qcu;->b:Ll/qcu;

    .line 197
    .line 198
    invoke-virtual {p0, v0}, Ll/vp20;->h(Ll/jsv;)V

    .line 199
    .line 200
    .line 201
    goto/16 :goto_2

    .line 202
    .line 203
    :pswitch_2
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    check-cast p0, Ll/jqm0;

    .line 208
    .line 209
    sget-object v0, Ll/v9s;->e:Ll/v9s;

    .line 210
    .line 211
    invoke-virtual {p0, v0}, Ll/vp20;->h(Ll/jsv;)V

    .line 212
    .line 213
    .line 214
    goto/16 :goto_2

    .line 215
    .line 216
    :pswitch_3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    check-cast v1, Ll/jqm0;

    .line 221
    .line 222
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    check-cast v3, Ll/jqm0;

    .line 227
    .line 228
    invoke-virtual {v3}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 229
    .line 230
    .line 231
    move-result-object v3

    .line 232
    invoke-virtual {v1, v3}, Ll/oo2;->g2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {p0}, Ll/tqo0;->t4()V

    .line 236
    .line 237
    .line 238
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 243
    .line 244
    .line 245
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 250
    .line 251
    invoke-static {p0, v0, v1, v2}, Lcom/p1/mobile/putong/live/LiveDialogAct;->i2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 252
    .line 253
    .line 254
    goto :goto_2

    .line 255
    :pswitch_4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    check-cast p0, Ll/jqm0;

    .line 260
    .line 261
    invoke-virtual {p0}, Ll/oo2;->L1()V

    .line 262
    .line 263
    .line 264
    goto :goto_2

    .line 265
    :pswitch_5
    invoke-static {v2}, Ll/muj;->w(Z)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    check-cast v0, Ll/jqm0;

    .line 273
    .line 274
    new-instance v1, Ll/uxj$a;

    .line 275
    .line 276
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    check-cast v2, Ll/jqm0;

    .line 281
    .line 282
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    check-cast p0, Ll/jqm0;

    .line 291
    .line 292
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 297
    .line 298
    const-string v3, "live"

    .line 299
    .line 300
    invoke-direct {v1, v2, p0, v3}, Ll/uxj$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v1}, Ll/uxj$a;->f()Ll/uxj;

    .line 304
    .line 305
    .line 306
    move-result-object p0

    .line 307
    const/4 v1, 0x0

    .line 308
    invoke-virtual {v0, p0, v1}, Ll/oo2;->A1(Ll/uxj;Ll/y20;)V

    .line 309
    .line 310
    .line 311
    goto :goto_2

    .line 312
    :pswitch_6
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 313
    .line 314
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 315
    .line 316
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->y5:I

    .line 317
    .line 318
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object v1

    .line 322
    new-instance v2, Ll/sqo0;

    .line 323
    .line 324
    invoke-direct {v2}, Ll/sqo0;-><init>()V

    .line 325
    .line 326
    .line 327
    invoke-direct {p0, v0, v1, v2}, Ll/tqo0;->D4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 328
    .line 329
    .line 330
    goto :goto_2

    .line 331
    :pswitch_7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    check-cast v0, Ll/jqm0;

    .line 336
    .line 337
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 338
    .line 339
    .line 340
    move-result-object p0

    .line 341
    check-cast p0, Ll/jqm0;

    .line 342
    .line 343
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object p0

    .line 347
    invoke-virtual {v0, p0}, Ll/rwn0;->K1(Ljava/lang/String;)V

    .line 348
    .line 349
    .line 350
    :goto_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->toString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object p0

    .line 354
    const-string p1, "[live][voice]"

    .line 355
    .line 356
    const-string v0, "[passivity_exit]"

    .line 357
    .line 358
    filled-new-array {p1, v0}, [Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object p1

    .line 362
    invoke-static {p0, p1}, Ll/nsh0;->k(Ljava/lang/String;[Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    return-void

    .line 366
    nop

    .line 367
    :sswitch_data_0
    .sparse-switch
        -0x7f9401f1 -> :sswitch_9
        -0x34e38dd1 -> :sswitch_8
        -0x33a7a8db -> :sswitch_7
        -0x1ce5c8e5 -> :sswitch_6
        0x2e3af2 -> :sswitch_5
        0x360802 -> :sswitch_4
        0x65825f6 -> :sswitch_3
        0x80850d6 -> :sswitch_2
        0x169d3189 -> :sswitch_1
        0x40206119 -> :sswitch_0
    .end sparse-switch

    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_7
    .end packed-switch
.end method
