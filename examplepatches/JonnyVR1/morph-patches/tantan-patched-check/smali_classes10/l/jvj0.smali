.class public Ll/jvj0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/qwj0;

.field public j:Ll/mvj0;

.field public k:Ll/rvj0;

.field public l:Ll/uvj0;

.field public m:Ll/awj0;

.field public n:Ll/fwj0;

.field public o:Ll/lwj0;

.field public p:Ll/kcg0;

.field public q:Ll/ouj0;

.field public r:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

.field public s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/jvj0;->s:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    new-instance p2, Ll/qwj0;

    .line 15
    .line 16
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v0, Lv/VFrame;

    .line 19
    .line 20
    invoke-direct {p2, p1, v0, p0}, Ll/qwj0;-><init>(Ll/dum;Lv/VFrame;Ll/jvj0;)V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Ll/jvj0;->i:Ll/qwj0;

    .line 24
    .line 25
    new-instance p2, Ll/uvj0;

    .line 26
    .line 27
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast v0, Lv/VFrame;

    .line 30
    .line 31
    invoke-direct {p2, p1, v0}, Ll/uvj0;-><init>(Ll/dum;Lv/VFrame;)V

    .line 32
    .line 33
    .line 34
    iput-object p2, p0, Ll/jvj0;->l:Ll/uvj0;

    .line 35
    .line 36
    new-instance p2, Ll/rvj0;

    .line 37
    .line 38
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 39
    .line 40
    check-cast v0, Lv/VFrame;

    .line 41
    .line 42
    invoke-direct {p2, p1, v0}, Ll/rvj0;-><init>(Ll/dum;Lv/VFrame;)V

    .line 43
    .line 44
    .line 45
    iput-object p2, p0, Ll/jvj0;->k:Ll/rvj0;

    .line 46
    .line 47
    new-instance p2, Ll/fwj0;

    .line 48
    .line 49
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast v0, Lv/VFrame;

    .line 52
    .line 53
    invoke-direct {p2, p1, v0, p0}, Ll/fwj0;-><init>(Ll/dum;Lv/VFrame;Ll/jvj0;)V

    .line 54
    .line 55
    .line 56
    iput-object p2, p0, Ll/jvj0;->n:Ll/fwj0;

    .line 57
    .line 58
    new-instance p2, Ll/lwj0;

    .line 59
    .line 60
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 61
    .line 62
    check-cast v0, Lv/VFrame;

    .line 63
    .line 64
    invoke-direct {p2, p1, v0, p0}, Ll/lwj0;-><init>(Ll/dum;Lv/VFrame;Ll/jvj0;)V

    .line 65
    .line 66
    .line 67
    iput-object p2, p0, Ll/jvj0;->o:Ll/lwj0;

    .line 68
    .line 69
    new-instance p2, Ll/mvj0;

    .line 70
    .line 71
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 72
    .line 73
    check-cast v0, Lv/VFrame;

    .line 74
    .line 75
    invoke-direct {p2, p1, v0}, Ll/mvj0;-><init>(Ll/dum;Lv/VFrame;)V

    .line 76
    .line 77
    .line 78
    iput-object p2, p0, Ll/jvj0;->j:Ll/mvj0;

    .line 79
    .line 80
    new-instance p2, Ll/awj0;

    .line 81
    .line 82
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 83
    .line 84
    check-cast v0, Lv/VFrame;

    .line 85
    .line 86
    invoke-direct {p2, p1, v0, p0}, Ll/awj0;-><init>(Ll/dum;Lv/VFrame;Ll/jvj0;)V

    .line 87
    .line 88
    .line 89
    iput-object p2, p0, Ll/jvj0;->m:Ll/awj0;

    .line 90
    .line 91
    return-void
.end method

.method public static synthetic J3(Ll/jvj0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jvj0;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic K3(Ll/jvj0;Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jvj0;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V

    return-void
.end method

.method public static synthetic L3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->c3:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic M3(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x4

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic N3(Ll/jvj0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jvj0;->p4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic O3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P3(Ll/jvj0;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jvj0;->s4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    return-void
.end method

.method public static synthetic R3(Ll/jvj0;Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jvj0;->o4(Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S3(Ll/jvj0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jvj0;->j4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic T3(Ll/jvj0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jvj0;->n4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic U3(Ll/jvj0;Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jvj0;->l4(Ll/hrk0$a;)V

    return-void
.end method

.method public static synthetic V3(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic W3(Ll/jvj0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jvj0;->r4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V

    return-void
.end method

.method public static synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "undercover"

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic Y3(Ll/jvj0;Ll/qvj0;)Ll/pvj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jvj0;->t4(Ll/qvj0;)Ll/pvj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z3(Ll/jvj0;Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jvj0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V

    return-void
.end method

.method public static synthetic a4(Ll/jvj0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jvj0;->q4(Ll/jsv;)V

    return-void
.end method

.method private synthetic n4(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jvj0;->w4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic o4(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x4

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method private synthetic p4(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jvj0;->b4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public T()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jvj0;->i:Ll/qwj0;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/jvj0;->l:Ll/uvj0;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/jvj0;->k:Ll/rvj0;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/jvj0;->n:Ll/fwj0;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/jvj0;->o:Ll/lwj0;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/jvj0;->j:Ll/mvj0;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/jvj0;->m:Ll/awj0;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public b4()V
    .locals 3

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
    iget-object v1, p0, Ll/jvj0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->id:Ljava/lang/String;

    .line 14
    .line 15
    const-string v2, "stop"

    .line 16
    .line 17
    invoke-static {v0, v1, v2}, Ll/nuj0;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/vuj0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/vuj0;-><init>(Ll/jvj0;)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/wuj0;

    .line 31
    .line 32
    invoke-direct {v2, p0}, Ll/wuj0;-><init>(Ll/jvj0;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final c4()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/jvj0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 3
    .line 4
    iget-object v1, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v1, p0, Ll/jvj0;->p:Ll/kcg0;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v1}, Ll/kcg0;->unsubscribe()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/jvj0;->p:Ll/kcg0;

    .line 17
    .line 18
    :cond_1
    invoke-static {}, Ll/ain0;->f()Ll/ain0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/ain0;->k()V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;->w(Z)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/ouj0;->L3()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->UndercoverPlayerChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$UndercoverPlayerChangeEvent;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$UndercoverPlayerChangeEvent;->undercoverPlayerChange()Ll/v3f$d;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGameChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;->stopVoiceGame()Ll/v3f$d;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const/4 v0, 0x4

    .line 66
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final d4(Ljava/lang/String;)Ll/pvj0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jvj0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->currentPlayers:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 16
    .line 17
    instance-of v0, v0, Ll/qwj0;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    return-object v1

    .line 22
    :cond_1
    iget-object p0, p0, Ll/jvj0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->currentPlayers:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;

    .line 41
    .line 42
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->userId:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    new-instance p0, Ll/pvj0;

    .line 51
    .line 52
    invoke-direct {p0, v0}, Ll/pvj0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;)V

    .line 53
    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_3
    new-instance p0, Ll/pvj0;

    .line 57
    .line 58
    invoke-direct {p0, v1}, Ll/pvj0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;)V

    .line 59
    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_4
    :goto_0
    return-object v1
.end method

.method public final e4()I
    .locals 1

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
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x2

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/rwn0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_1
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public final f4(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
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
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/nsv;->g()Ll/pyl;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/l6o0;

    .line 24
    .line 25
    iget-object p0, p0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 26
    .line 27
    return-object p0
.end method

.method public final g4()V
    .locals 3

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
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/hrk0;->p()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/jvj0;->s:Ljava/util/List;

    .line 21
    .line 22
    new-instance v1, Ll/zuj0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/zuj0;-><init>(Ll/jvj0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 31
    .line 32
    instance-of v1, v0, Ll/fwj0;

    .line 33
    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    instance-of v1, v0, Ll/qwj0;

    .line 37
    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-void

    .line 42
    :cond_1
    :goto_0
    iget-object v1, p0, Ll/jvj0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/jvj0;->e4()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    iget-object p0, p0, Ll/jvj0;->s:Ljava/util/List;

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2, p0}, Ll/ouj0;->M3(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;ILjava/util/List;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final h4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jvj0;->p:Ll/kcg0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/rwn0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/yuj0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/yuj0;-><init>(Ll/jvj0;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Ll/jvj0;->p:Ll/kcg0;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/jvj0;->g4()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic i4(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jvj0;->c4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jvj0;->c4()V

    .line 2
    .line 3
    .line 4
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->c3:I

    .line 25
    .line 26
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic k4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jvj0;->f4(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/jvj0;->s:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic l4(Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jvj0;->g4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m4(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jvj0;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->UndercoverPlayerChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$UndercoverPlayerChangeEvent;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$UndercoverPlayerChangeEvent;->undercoverPlayerChange()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic q4(Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jvj0;->c4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jvj0;->u4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jvj0;->u4()V

    .line 2
    .line 3
    .line 4
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
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGameChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;->startVoiceGame()Ll/v3f$d;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lrx/c;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/ruj0;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/ruj0;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/dvj0;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/dvj0;-><init>(Ll/jvj0;)V

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGameChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;->stopVoiceGame()Ll/v3f$d;

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
    new-instance v1, Ll/evj0;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/evj0;-><init>(Ll/jvj0;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/fvj0;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/fvj0;-><init>(Ll/jvj0;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Ll/rwn0;

    .line 104
    .line 105
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/obt;

    .line 114
    .line 115
    invoke-direct {v1}, Ll/obt;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    new-instance v1, Ll/gvj0;

    .line 123
    .line 124
    invoke-direct {v1, p0}, Ll/gvj0;-><init>(Ll/jvj0;)V

    .line 125
    .line 126
    .line 127
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 132
    .line 133
    .line 134
    :goto_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 135
    .line 136
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;

    .line 137
    .line 138
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    check-cast v1, Ll/rwn0;

    .line 143
    .line 144
    invoke-virtual {v1}, Ll/rwn0;->p()Z

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;->v(Z)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    check-cast v0, Ll/rwn0;

    .line 156
    .line 157
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iget-object v0, v0, Ll/aj1;->Y:Lrx/subjects/b;

    .line 162
    .line 163
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    new-instance v1, Ll/bun0;

    .line 168
    .line 169
    invoke-direct {v1}, Ll/bun0;-><init>()V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    new-instance v1, Ll/hvj0;

    .line 177
    .line 178
    invoke-direct {v1, p0}, Ll/hvj0;-><init>(Ll/jvj0;)V

    .line 179
    .line 180
    .line 181
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    check-cast v0, Ll/rwn0;

    .line 193
    .line 194
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-virtual {v0}, Ll/aj1;->l0()Lrx/c;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    new-instance v1, Ll/ivj0;

    .line 207
    .line 208
    invoke-direct {v1, p0}, Ll/ivj0;-><init>(Ll/jvj0;)V

    .line 209
    .line 210
    .line 211
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    check-cast v0, Ll/rwn0;

    .line 223
    .line 224
    invoke-virtual {v0}, Ll/rwn0;->O2()Ll/szn0;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {v0}, Ll/szn0;->d()Lrx/c;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    new-instance v1, Ll/suj0;

    .line 237
    .line 238
    invoke-direct {v1}, Ll/suj0;-><init>()V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    new-instance v1, Ll/avj0;

    .line 246
    .line 247
    invoke-direct {v1}, Ll/avj0;-><init>()V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    new-instance v1, Ll/bvj0;

    .line 255
    .line 256
    invoke-direct {v1, p0}, Ll/bvj0;-><init>(Ll/jvj0;)V

    .line 257
    .line 258
    .line 259
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 264
    .line 265
    .line 266
    new-instance v0, Ll/cvj0;

    .line 267
    .line 268
    invoke-direct {v0, p0}, Ll/cvj0;-><init>(Ll/jvj0;)V

    .line 269
    .line 270
    .line 271
    const-class v1, Ll/qvj0;

    .line 272
    .line 273
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 274
    .line 275
    .line 276
    return-void
.end method

.method public final synthetic t4(Ll/qvj0;)Ll/pvj0;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/qvj0;->e()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/jvj0;->d4(Ljava/lang/String;)Ll/pvj0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public u4()V
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
    invoke-static {v0}, Ll/nuj0;->l(Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/tuj0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/tuj0;-><init>(Ll/jvj0;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/uuj0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/uuj0;-><init>()V

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

.method public v4()V
    .locals 5

    .line 1
    new-instance v0, Ll/px50$a;

    .line 2
    .line 3
    const/16 v1, 0x2328

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/px50$a;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Ll/efv;->x:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 11
    .line 12
    .line 13
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    .line 14
    .line 15
    const-wide v3, 0x3fdc28f5c28f5c29L    # 0.44

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/px50$a;->z(DD)Ll/px50$a;

    .line 21
    .line 22
    .line 23
    const/16 v1, 0x50

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 26
    .line 27
    .line 28
    const/16 v1, 0x18

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/px50$a;->s(I)Ll/px50$a;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0}, Ll/px50$a;->q()Ll/px50;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public w4()V
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
    invoke-static {v0}, Ll/nuj0;->m(Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/hvj0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/hvj0;-><init>(Ll/jvj0;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/xuj0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/xuj0;-><init>()V

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

.method public x4(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->toast:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->toast:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->status:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "end"

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v2, 0x4

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    invoke-static {}, Ll/ain0;->f()Ll/ain0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0, v2}, Ll/ain0;->i(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iput-object p1, p0, Ll/jvj0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/jvj0;->h4()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->status:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    const/4 v4, 0x0

    .line 50
    const/4 v5, -0x1

    .line 51
    sparse-switch v3, :sswitch_data_0

    .line 52
    .line 53
    .line 54
    :goto_0
    move v2, v5

    .line 55
    goto :goto_1

    .line 56
    :sswitch_0
    const-string v1, "waiting"

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_2

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    const/4 v2, 0x6

    .line 66
    goto :goto_1

    .line 67
    :sswitch_1
    const-string v1, "resultAnnouncing"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_3

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    const/4 v2, 0x5

    .line 77
    goto :goto_1

    .line 78
    :sswitch_2
    const-string v1, "votingResult"

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_8

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :sswitch_3
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_4

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_4
    const/4 v2, 0x3

    .line 95
    goto :goto_1

    .line 96
    :sswitch_4
    const-string v1, "voting"

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_5

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_5
    const/4 v2, 0x2

    .line 106
    goto :goto_1

    .line 107
    :sswitch_5
    const-string v1, "speakingInTurn"

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_6

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_6
    const/4 v2, 0x1

    .line 117
    goto :goto_1

    .line 118
    :sswitch_6
    const-string v1, "questionAnnouncing"

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-nez v0, :cond_7

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_7
    move v2, v4

    .line 128
    :cond_8
    :goto_1
    packed-switch v2, :pswitch_data_0

    .line 129
    .line 130
    .line 131
    goto/16 :goto_3

    .line 132
    .line 133
    :pswitch_0
    iget-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 134
    .line 135
    if-eqz v0, :cond_9

    .line 136
    .line 137
    instance-of v1, v0, Ll/qwj0;

    .line 138
    .line 139
    if-nez v1, :cond_9

    .line 140
    .line 141
    invoke-virtual {v0}, Ll/ouj0;->L3()V

    .line 142
    .line 143
    .line 144
    :cond_9
    iget-object v0, p0, Ll/jvj0;->i:Ll/qwj0;

    .line 145
    .line 146
    iput-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 147
    .line 148
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->UndercoverPlayerChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$UndercoverPlayerChangeEvent;

    .line 153
    .line 154
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$UndercoverPlayerChangeEvent;->undercoverPlayerChange()Ll/v3f$d;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    goto/16 :goto_3

    .line 164
    .line 165
    :pswitch_1
    iget-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 166
    .line 167
    if-eqz v0, :cond_a

    .line 168
    .line 169
    instance-of v1, v0, Ll/awj0;

    .line 170
    .line 171
    if-nez v1, :cond_a

    .line 172
    .line 173
    invoke-virtual {v0}, Ll/ouj0;->L3()V

    .line 174
    .line 175
    .line 176
    :cond_a
    iget-object v0, p0, Ll/jvj0;->m:Ll/awj0;

    .line 177
    .line 178
    iput-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 179
    .line 180
    goto/16 :goto_3

    .line 181
    .line 182
    :pswitch_2
    iget-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 183
    .line 184
    if-eqz v0, :cond_b

    .line 185
    .line 186
    instance-of v1, v0, Ll/mvj0;

    .line 187
    .line 188
    if-nez v1, :cond_b

    .line 189
    .line 190
    invoke-virtual {v0}, Ll/ouj0;->L3()V

    .line 191
    .line 192
    .line 193
    :cond_b
    iget-object v0, p0, Ll/jvj0;->j:Ll/mvj0;

    .line 194
    .line 195
    iput-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 196
    .line 197
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->UndercoverPlayerChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$UndercoverPlayerChangeEvent;

    .line 202
    .line 203
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$UndercoverPlayerChangeEvent;->undercoverPlayerChange()Ll/v3f$d;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 208
    .line 209
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 210
    .line 211
    .line 212
    goto :goto_3

    .line 213
    :pswitch_3
    invoke-virtual {p0}, Ll/jvj0;->c4()V

    .line 214
    .line 215
    .line 216
    goto :goto_3

    .line 217
    :pswitch_4
    iget-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 218
    .line 219
    if-eqz v0, :cond_c

    .line 220
    .line 221
    instance-of v1, v0, Ll/lwj0;

    .line 222
    .line 223
    if-nez v1, :cond_c

    .line 224
    .line 225
    invoke-virtual {v0}, Ll/ouj0;->L3()V

    .line 226
    .line 227
    .line 228
    :cond_c
    iget-object v0, p0, Ll/jvj0;->o:Ll/lwj0;

    .line 229
    .line 230
    iput-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 231
    .line 232
    goto :goto_3

    .line 233
    :pswitch_5
    iget-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 234
    .line 235
    if-eqz v0, :cond_d

    .line 236
    .line 237
    instance-of v1, v0, Ll/fwj0;

    .line 238
    .line 239
    if-nez v1, :cond_d

    .line 240
    .line 241
    invoke-virtual {v0}, Ll/ouj0;->L3()V

    .line 242
    .line 243
    .line 244
    :cond_d
    iget-object v0, p0, Ll/jvj0;->n:Ll/fwj0;

    .line 245
    .line 246
    iput-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 247
    .line 248
    goto :goto_3

    .line 249
    :pswitch_6
    iget-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 250
    .line 251
    if-eqz v0, :cond_f

    .line 252
    .line 253
    instance-of v1, v0, Ll/rvj0;

    .line 254
    .line 255
    if-nez v1, :cond_f

    .line 256
    .line 257
    instance-of v1, v0, Ll/uvj0;

    .line 258
    .line 259
    if-nez v1, :cond_f

    .line 260
    .line 261
    invoke-virtual {v0}, Ll/ouj0;->L3()V

    .line 262
    .line 263
    .line 264
    invoke-virtual {p0}, Ll/jvj0;->e4()I

    .line 265
    .line 266
    .line 267
    move-result v0

    .line 268
    if-nez v0, :cond_e

    .line 269
    .line 270
    iget-object v0, p0, Ll/jvj0;->k:Ll/rvj0;

    .line 271
    .line 272
    iput-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 273
    .line 274
    goto :goto_2

    .line 275
    :cond_e
    iget-object v0, p0, Ll/jvj0;->l:Ll/uvj0;

    .line 276
    .line 277
    iput-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 278
    .line 279
    :cond_f
    :goto_2
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->UndercoverPlayerChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$UndercoverPlayerChangeEvent;

    .line 284
    .line 285
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$UndercoverPlayerChangeEvent;->undercoverPlayerChange()Ll/v3f$d;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 290
    .line 291
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 292
    .line 293
    .line 294
    :goto_3
    iget-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 295
    .line 296
    if-eqz v0, :cond_10

    .line 297
    .line 298
    invoke-virtual {v0}, Ll/ouj0;->K3()V

    .line 299
    .line 300
    .line 301
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 302
    .line 303
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;

    .line 304
    .line 305
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;->w(Z)V

    .line 306
    .line 307
    .line 308
    iget-object v0, p0, Ll/jvj0;->q:Ll/ouj0;

    .line 309
    .line 310
    invoke-virtual {p0}, Ll/jvj0;->e4()I

    .line 311
    .line 312
    .line 313
    move-result v1

    .line 314
    iget-object p0, p0, Ll/jvj0;->s:Ljava/util/List;

    .line 315
    .line 316
    invoke-virtual {v0, p1, v1, p0}, Ll/ouj0;->M3(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;ILjava/util/List;)V

    .line 317
    .line 318
    .line 319
    :cond_10
    return-void

    .line 320
    nop

    .line 321
    :sswitch_data_0
    .sparse-switch
        -0x68ccd494 -> :sswitch_6
        -0x635ed9ce -> :sswitch_5
        -0x3051a2d9 -> :sswitch_4
        0x188db -> :sswitch_3
        0x197a5824 -> :sswitch_2
        0x32221ee3 -> :sswitch_1
        0x4289964d -> :sswitch_0
    .end sparse-switch

    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    .line 350
    .line 351
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
