.class public Ll/ipk0;
.super Ll/i6t;
.source "SourceFile"

# interfaces
.implements Ll/ork0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Ll/lpk0;",
        ">;",
        "Ll/ork0;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/ipk0;->i:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance p1, Ll/lpk0;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/lpk0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private A4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->updateApplyCountEvent()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Ll/ipk0;->i:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic J3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/r35;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K3(Ll/ipk0;Ll/hrk0$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ipk0;->p4(Ll/hrk0$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/ipk0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ipk0;->n4(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic M3(Ll/ipk0;Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ipk0;->i4(Ll/hrk0$a;)V

    return-void
.end method

.method public static synthetic N3(Ll/ipk0;Ll/gvn0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ipk0;->g4(Ll/gvn0;)V

    return-void
.end method

.method public static synthetic O3(Ll/ipk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ipk0;->t4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic P3(Ll/ipk0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ipk0;->m4()V

    return-void
.end method

.method public static synthetic R3(Ll/ipk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/ook0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ipk0;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/ook0;)V

    return-void
.end method

.method public static synthetic S3(Ll/ipk0;Ll/ovn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/d3q;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ipk0;->k4(Ll/ovn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/d3q;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic U3(Ll/ipk0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ipk0;->z4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)V

    return-void
.end method

.method public static synthetic V3(Ll/ipk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ipk0;->q4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W3(Ll/ipk0;Ll/ovn0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ipk0;->x4(Ll/ovn0;)V

    return-void
.end method

.method public static synthetic X3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Y3(Ll/ipk0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ipk0;->o4(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic Z3(Ll/ipk0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ipk0;->v4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic a4(Ll/ipk0;Ll/bzm0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ipk0;->r4(Ll/bzm0;)V

    return-void
.end method

.method public static synthetic b4(Ll/ipk0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ipk0;->s4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private c4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/guk0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p2, p0, Ll/ipk0;->i:Ljava/util/HashMap;

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p2, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Ll/ipk0;->A4()V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Ll/ipk0;->isShowing()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    :goto_0
    return-void

    .line 25
    :cond_1
    invoke-virtual {p0}, Ll/ipk0;->c()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private e4(Ll/ovn0;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ovn0;",
            ")",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/ovn0;->i()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/qok0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/qok0;-><init>(Ll/ipk0;Ll/ovn0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method private g4(Ll/gvn0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/gvn0;->j()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_3

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x6

    .line 15
    if-eq v0, v1, :cond_3

    .line 16
    .line 17
    const/16 v1, 0x9

    .line 18
    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    const/16 v1, 0xc

    .line 22
    .line 23
    if-eq v0, v1, :cond_0

    .line 24
    .line 25
    const/16 v1, 0xd

    .line 26
    .line 27
    if-eq v0, v1, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/ipk0;->w4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Ll/ipk0;->w4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p1}, Ll/gvn0;->g()Ll/nsv;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-direct {p0, v0, p1}, Ll/ipk0;->c4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_3
    :goto_0
    iget-object v0, p0, Ll/ipk0;->i:Ljava/util/HashMap;

    .line 59
    .line 60
    invoke-virtual {p1}, Ll/gvn0;->f()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    invoke-direct {p0}, Ll/ipk0;->A4()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method private i4(Ll/hrk0$a;)V
    .locals 2

    .line 1
    iget v0, p1, Ll/hrk0$a;->b:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p1}, Ll/hrk0$a;->a()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object p1, p1, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/ipk0;->w4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method

.method private isShowing()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->VOICE_CALL_ALL_LIST_DIALOG:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/t8s;->f(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private synthetic p4(Ll/hrk0$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ipk0;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private synthetic q4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ipk0;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private synthetic r4(Ll/bzm0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/bzm0;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ipk0;->d4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private t4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ipk0;->i:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/ipk0;->A4()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Ll/lpk0;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/lpk0;->n(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callAgreedEvent()Ll/v3f$d;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private u4()V
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
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->openFreeCall(Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/vok0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/vok0;-><init>(Ll/ipk0;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/wok0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/wok0;-><init>()V

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

.method private v4(Ljava/lang/String;)V
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
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private x4(Ll/ovn0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ipk0;->i:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ipk0;->i:Ljava/util/HashMap;

    .line 7
    .line 8
    iget-object v1, p1, Ll/ovn0;->b:Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ll/ipk0;->A4()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, p1}, Ll/ipk0;->e4(Ll/ovn0;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-direct {p0, p1}, Ll/ipk0;->y4(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private y4(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/lpk0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/lpk0;->l(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private z4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)V
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
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;->getUserId()Ljava/lang/String;

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
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast v0, Ll/lpk0;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;->getFreeCall()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {v0, p1}, Ll/lpk0;->m(Z)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ipk0;->c()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method


# virtual methods
.method public c()V
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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/rwn0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/rwn0;->W0()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->callApplyList(Ljava/lang/String;Z)Lrx/c;

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
    new-instance v1, Ll/gpk0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/gpk0;-><init>(Ll/ipk0;)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Ll/hpk0;

    .line 35
    .line 36
    invoke-direct {p0}, Ll/hpk0;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public d4(Ljava/lang/String;)V
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
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 8
    .line 9
    .line 10
    move-result v0

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
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Ll/rwn0;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v0, v1, v2}, Ll/v1n0;->b(ZLjava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->agreeVoiceCall(Ljava/lang/String;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance v0, Ll/uok0;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/uok0;-><init>(Ll/ipk0;)V

    .line 47
    .line 48
    .line 49
    new-instance p0, Ll/wnt;

    .line 50
    .line 51
    invoke-direct {p0}, Ll/wnt;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)Ll/ook0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)",
            "Ll/ook0;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ook0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/ook0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Ll/xok0;

    .line 7
    .line 8
    invoke-direct {p2, p0, p1}, Ll/xok0;-><init>(Ll/ipk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ll/ook0;->O(Ll/y20;)Ll/ook0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance p2, Ll/yok0;

    .line 16
    .line 17
    invoke-direct {p2, p0}, Ll/yok0;-><init>(Ll/ipk0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p2}, Ll/ook0;->P(Ll/y20;)Ll/ook0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public getTabName()Ljava/lang/String;
    .locals 2

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->yf:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/ipk0;->i:Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v0, "("

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/ipk0;->i:Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p0, ")"

    .line 39
    .line 40
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public getView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/lpk0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/lpk0;->i()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public h4(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Cg:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/rok0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/rok0;-><init>(Ll/ipk0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Ll/rwn0;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->closeFreeCall(Ljava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    new-instance v0, Ll/sok0;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/sok0;-><init>(Ll/ipk0;)V

    .line 71
    .line 72
    .line 73
    new-instance p0, Ll/tok0;

    .line 74
    .line 75
    invoke-direct {p0}, Ll/tok0;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public j4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    invoke-static {p0}, Ll/f2m0;->c(Ll/dum;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic k4(Ll/ovn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/d3q;
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/ovn0;->h(Ljava/lang/String;)Ll/nsv;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p2, p1}, Ll/ipk0;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)Ll/ook0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic l4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/ook0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ipk0;->d4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic m4()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ipk0;->u4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n4(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/lpk0;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/lpk0;->m(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic o4(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/lpk0;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Ll/lpk0;->m(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic s4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_1

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
    const-string p1, ""

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/oo2;->S0(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
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
    invoke-virtual {v0}, Ll/aj1;->x0()Lrx/c;

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
    new-instance v1, Ll/pok0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/pok0;-><init>(Ll/ipk0;)V

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
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/zok0;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/zok0;-><init>(Ll/ipk0;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/apk0;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/apk0;-><init>(Ll/ipk0;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->removeWaitCallEvent()Ll/v3f$d;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Lrx/c;

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/bpk0;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/bpk0;-><init>(Ll/ipk0;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/cpk0;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/cpk0;-><init>(Ll/ipk0;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 111
    .line 112
    check-cast v0, Ll/lpk0;

    .line 113
    .line 114
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    check-cast v1, Ll/rwn0;

    .line 119
    .line 120
    invoke-virtual {v1}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->freeCall:Z

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Ll/lpk0;->m(Z)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->agreeVoiceCallEvent()Ll/v3f$d;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Lrx/c;

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    new-instance v1, Ll/dpk0;

    .line 150
    .line 151
    invoke-direct {v1, p0}, Ll/dpk0;-><init>(Ll/ipk0;)V

    .line 152
    .line 153
    .line 154
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    check-cast v0, Ll/rwn0;

    .line 166
    .line 167
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v0}, Ll/aj1;->a1()Lrx/c;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    new-instance v1, Ll/epk0;

    .line 180
    .line 181
    invoke-direct {v1, p0}, Ll/epk0;-><init>(Ll/ipk0;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    new-instance v1, Ll/fpk0;

    .line 189
    .line 190
    invoke-direct {v1, p0}, Ll/fpk0;-><init>(Ll/ipk0;)V

    .line 191
    .line 192
    .line 193
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public w4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ipk0;->i:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/ipk0;->A4()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ll/ipk0;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p0, Ll/lpk0;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/lpk0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
