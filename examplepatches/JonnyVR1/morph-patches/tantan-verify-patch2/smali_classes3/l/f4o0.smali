.class public Ll/f4o0;
.super Ll/t4o0;
.source "SourceFile"


# instance fields
.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/erp;

.field public l:Ll/rrp;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/jlm0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/t4o0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/f4o0;->j:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic N3(Ll/f4o0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/f4o0;->P3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic O3(Ll/f4o0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f4o0;->R3()V

    return-void
.end method

.method private synthetic P3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f4o0;->S3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private init()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/f4o0;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/v4o0;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/v4o0;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/urp;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/urp;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/hrp;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/hrp;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/erp;

    .line 25
    .line 26
    iget-object v3, p0, Ll/xzs;->e:Ll/dum;

    .line 27
    .line 28
    invoke-direct {v2, v3, v1}, Ll/erp;-><init>(Ll/dum;Ll/hrp;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Ll/erp;

    .line 36
    .line 37
    iput-object v2, p0, Ll/f4o0;->k:Ll/erp;

    .line 38
    .line 39
    new-instance v2, Ll/rrp;

    .line 40
    .line 41
    iget-object v3, p0, Ll/xzs;->e:Ll/dum;

    .line 42
    .line 43
    invoke-direct {v2, v3, v0}, Ll/rrp;-><init>(Ll/dum;Ll/urp;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Ll/rrp;

    .line 51
    .line 52
    iput-object v2, p0, Ll/f4o0;->l:Ll/rrp;

    .line 53
    .line 54
    iget-object v2, p0, Ll/f4o0;->j:Ljava/util/List;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/urp;->d()Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Ll/f4o0;->j:Ljava/util/List;

    .line 64
    .line 65
    invoke-virtual {v1}, Ll/hrp;->d()Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    return-void
.end method


# virtual methods
.method public K3()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/f4o0;->j:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public M3(I)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/f4o0;->l:Ll/rrp;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rrp;->U3()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Ll/f4o0;->k:Ll/erp;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/erp;->R3()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic R3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/v4o0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/v4o0;->i()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final S3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ll/f4o0;->init()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/v4o0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/v4o0;->q()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public T()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/t4o0;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceRoomBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceRoomBgEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceRoomBgEvent;->openVoiceRoomBgDialog()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/d4o0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/d4o0;-><init>(Ll/f4o0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceRoomBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceRoomBgEvent;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceRoomBgEvent;->changeMeTab()Ll/v3f$c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/e4o0;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/e4o0;-><init>(Ll/f4o0;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0, v1}, Ll/i6t;->g3(Ll/v3f$b;Ll/x20;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
