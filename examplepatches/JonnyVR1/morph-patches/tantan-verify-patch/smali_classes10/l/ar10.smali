.class public Ll/ar10;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Ll/td10;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/td10<",
            "TD;>;"
        }
    .end annotation
.end field

.field public final k:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/kcg0;

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Ll/td10;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;",
            "Ll/td10<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/ar10;->i:Lrx/subjects/a;

    .line 9
    .line 10
    new-instance p1, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/ar10;->k:Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    iput-object p3, p0, Ll/ar10;->j:Ll/td10;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->L4:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic K3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L3(Ll/ar10;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ar10;->n4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic M3(Ll/ar10;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ar10;->t4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic N3(Ll/le10;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic O3(Ll/ar10;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ar10;->r4(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ll/ar10;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ar10;->I4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V

    return-void
.end method

.method public static synthetic R3(Ll/ar10;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ar10;->u4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic S3(Ll/ar10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ar10;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method

.method public static synthetic T3(Ljava/lang/Integer;)Ljava/lang/Boolean;
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

.method public static synthetic U3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V3(Ll/ar10;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ar10;->v4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic W3(Ll/ar10;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ar10;->p4(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic X3(Ll/ar10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ar10;->E4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method

.method public static synthetic Y3(Ll/ar10;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ar10;->s4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic Z3(Ll/ar10;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar10;->w4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic a4(Ll/ar10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ar10;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic b4(Ll/ar10;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ar10;->q4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method

.method private synthetic w4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->v()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public A4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getPlayersList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public B4(Landroid/util/Pair;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Ll/le10;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_4

    .line 15
    .line 16
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move-object v1, v0

    .line 22
    check-cast v1, Ll/le10;

    .line 23
    .line 24
    iget v1, v1, Ll/le10;->d:I

    .line 25
    .line 26
    check-cast v0, Ll/le10;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/le10;->v()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-static {v1}, Ll/bf10;->y(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    new-instance v3, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v4, "renderCallView stream: operation:"

    .line 43
    .line 44
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v2, ", size:"

    .line 51
    .line 52
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v0, Ll/le10;

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ll/ar10;->y4(Ll/le10;)V

    .line 70
    .line 71
    .line 72
    const/4 v0, 0x1

    .line 73
    if-eq v1, v0, :cond_3

    .line 74
    .line 75
    const/4 v0, 0x3

    .line 76
    if-eq v1, v0, :cond_2

    .line 77
    .line 78
    const/4 v0, 0x4

    .line 79
    if-eq v1, v0, :cond_1

    .line 80
    .line 81
    return-void

    .line 82
    :cond_1
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast p1, Ll/le10;

    .line 85
    .line 86
    iget-object p1, p1, Ll/le10;->c:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Ll/ar10;->E4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    iget-object p0, p0, Ll/ar10;->k:Ljava/util/HashMap;

    .line 93
    .line 94
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast p1, Ll/le10;

    .line 97
    .line 98
    iget-object p1, p1, Ll/le10;->c:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 99
    .line 100
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_3
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 107
    .line 108
    check-cast p1, Ll/le10;

    .line 109
    .line 110
    invoke-virtual {p1}, Ll/le10;->v()Ljava/util/List;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    new-instance v0, Ll/lq10;

    .line 115
    .line 116
    invoke-direct {v0, p0}, Ll/lq10;-><init>(Ll/ar10;)V

    .line 117
    .line 118
    .line 119
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_4
    :goto_0
    const-string p1, "renderCallView stream is false or manager is null"

    .line 124
    .line 125
    invoke-static {p1}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 129
    .line 130
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 131
    .line 132
    const/4 p1, 0x0

    .line 133
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->setViewVisible(Z)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public final C4(Lcom/p1/mobile/putong/data/User;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar10;->j:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/td10;->b4()Ll/le10;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p2}, Ll/le10;->r(I)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/ar10;->j:Ll/td10;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/td10;->b4()Ll/le10;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/le10;->t()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 30
    .line 31
    invoke-virtual {p0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->u(Lcom/p1/mobile/putong/data/User;II)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final D4(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->StickerEvent:Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;->changeVisible()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    xor-int/lit8 p1, p1, 0x1

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final E4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar10;->k:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/ar10;->k:Ljava/util/HashMap;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->position:I

    .line 22
    .line 23
    invoke-virtual {p0, v0, p1}, Ll/ar10;->C4(Lcom/p1/mobile/putong/data/User;I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 28
    .line 29
    const-string v1, ""

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->s7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/oq10;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/oq10;-><init>(Ll/ar10;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/qq10;

    .line 49
    .line 50
    invoke-direct {v1, p0, p1}, Ll/qq10;-><init>(Ll/ar10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final F4(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/view/View;

    .line 10
    .line 11
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v1, Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Ll/vp20;->p()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {p1, v1, v0, v2}, Ll/j35;->g(ZLandroid/view/View;Landroid/view/View;Ljava/lang/Boolean;)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->changeInputSize()Ll/v3f$d;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    new-instance v0, Landroid/util/Size;

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-direct {v0, v1, p1}, Landroid/util/Size;-><init>(II)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final G4(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/view/View;

    .line 10
    .line 11
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v1, Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Ll/vp20;->p()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {p1, v1, v0, v2}, Ll/j35;->f(ZLandroid/view/View;Landroid/view/View;Ljava/lang/Boolean;)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->TraysViewEvent:Lcom/tantan/live/eventbus/LiveEventBus$TraysViewEvent;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$TraysViewEvent;->changeBottomSpace()Ll/v3f$d;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$a;

    .line 42
    .line 43
    const/16 v1, 0x1770

    .line 44
    .line 45
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$a;-><init>(I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$a;->a(I)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$a;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$a;->b()Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public H4(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar10;->l:Ll/kcg0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x5

    .line 10
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/rq10;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Ll/rq10;-><init>(Ll/ar10;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Ll/ar10;->l:Ll/kcg0;

    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public final I4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/ar10;->j:Ll/td10;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/td10;->b4()Ll/le10;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/le10;->v()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/mq10;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Ll/mq10;-><init>(Ll/ar10;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 20
    .line 21
    .line 22
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

.method public final c4(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ar10;->D4(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    xor-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bf10;->i(Lcom/p1/mobile/android/app/Act;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final d4(ZI)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ar10;->F4(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/ar10;->G4(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->topViewVisible()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public e4(I)V
    .locals 3

    .line 1
    invoke-static {p0}, Ll/bf10;->M(Ll/i6t;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/ar10;->j:Ll/td10;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/td10;->e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1, v0}, Ll/bf10;->C(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Z)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/ar10;->j:Ll/td10;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/td10;->b4()Ll/le10;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-boolean v1, v1, Ll/le10;->b:Z

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Ll/vp20;->p()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-static {v1, v2}, Ll/jr10;->k(ZZ)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0}, Ll/fn10;->o(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->s()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->M8:I

    .line 47
    .line 48
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->openApplyDlg()Ll/v3f$d;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    invoke-static {v0}, Ll/fn10;->k(Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->openManageDialog()Ll/v3f$d;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    const/4 p1, -0x1

    .line 87
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_2
    invoke-static {v0}, Ll/fn10;->p(Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-eqz p0, :cond_3

    .line 100
    .line 101
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->W7:I

    .line 102
    .line 103
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_3
    invoke-static {v0}, Ll/fn10;->g(Ljava/lang/String;)Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-eqz p0, :cond_4

    .line 116
    .line 117
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->t8:I

    .line 118
    .line 119
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_4
    invoke-static {v0}, Ll/fn10;->c(Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    if-eqz p0, :cond_5

    .line 132
    .line 133
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->s8:I

    .line 134
    .line 135
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    :cond_5
    return-void
.end method

.method public f4(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar10;->j:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/td10;->b4()Ll/le10;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/le10;->r(I)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/ar10;->e4(I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {p0}, Ll/bf10;->M(Ll/i6t;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object v1, p0, Ll/ar10;->j:Ll/td10;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/td10;->e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1, p1}, Ll/bf10;->C(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Z)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, v0, p1}, Ll/ar10;->g4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->openCallingOperateDialog()Ll/v3f$d;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    invoke-virtual {p0, v0}, Ll/ar10;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final g4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bf10;->W(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    invoke-static {p1, p2}, Ll/bf10;->F(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ljava/lang/String;)Landroid/util/Pair;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    invoke-static {p2}, Ll/fn10;->c(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-static {p1}, Ll/fn10;->f(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 31
    return p0
.end method

.method public h4()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar10;->j:Ll/td10;

    .line 2
    .line 3
    instance-of v1, v0, Ll/jn10;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Ll/jn10;

    .line 8
    .line 9
    iget-boolean v0, v0, Ll/jn10;->n:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/eb20;->c()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {p0}, Ll/bf10;->D(Ll/i6t;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/fn10;->o(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public i4(Lcom/p1/mobile/putong/data/User;)V
    .locals 9

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v7

    .line 11
    const-string v8, "multiCall"

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    const-string v4, "liveRoom"

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    const-string v6, ""

    .line 18
    .line 19
    move-object v2, p1

    .line 20
    invoke-virtual/range {v0 .. v8}, Ll/wrv;->d(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance p1, Ll/nq10;

    .line 29
    .line 30
    invoke-direct {p1}, Ll/nq10;-><init>()V

    .line 31
    .line 32
    .line 33
    new-instance v0, Ll/r5k;

    .line 34
    .line 35
    invoke-direct {v0}, Ll/r5k;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public j4()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar10;->j:Ll/td10;

    .line 2
    .line 3
    instance-of v0, p0, Ll/jn10;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/jn10;

    .line 8
    .line 9
    iget-boolean p0, p0, Ll/jn10;->m:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public k4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar10;->j:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/td10;->b4()Ll/le10;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-boolean p0, p0, Ll/le10;->b:Z

    .line 8
    .line 9
    return p0
.end method

.method public final l4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/kfd0$a;->g(Ljava/lang/String;)Ll/kfd0$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->liveId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/kfd0$a;->r(Ljava/lang/String;)Ll/kfd0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "onlive"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/kfd0$a;->u(Ljava/lang/String;)Ll/kfd0$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "video_live"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/kfd0$a;->t(Ljava/lang/String;)Ll/kfd0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "e_pk_gotoliveroom_button"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v0, v1}, Ll/afu;->h(Ll/kfd0;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/oo2;->o0()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 55
    .line 56
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v2}, Ll/oo2;->o0()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->r(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v2}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 92
    .line 93
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->liveId:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->roomId:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->u(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->CHANGE_SOURCE_WITH_BACK:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->n(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->JumpRoomEvent:Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;

    .line 144
    .line 145
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;->jumpRoom()Ll/v3f$d;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public final synthetic m4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ar10;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->setViewVisible(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/ar10;->k:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/oo2;->X0()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    const-string v0, "live"

    .line 25
    .line 26
    invoke-static {p0, v0}, Ll/ve10;->i(Ll/i6t;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0, v1}, Ll/ar10;->c4(Z)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1, v1}, Ll/ar10;->d4(ZI)V

    .line 33
    .line 34
    .line 35
    invoke-super {p0}, Ll/i6t;->n()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic n4(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar10;->k:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic o4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->position:I

    .line 2
    .line 3
    invoke-virtual {p0, p2, p1}, Ll/ar10;->C4(Lcom/p1/mobile/putong/data/User;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic p4(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Ljava/lang/Long;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/ar10;->j:Ll/td10;

    .line 2
    .line 3
    instance-of v0, p2, Ll/jn10;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p2, Ll/jn10;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p2, Ll/jn10;->n:Z

    .line 11
    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->o0()V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Ll/ar10;->l:Ll/kcg0;

    .line 17
    .line 18
    return-void
.end method

.method public final synthetic q4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->volumes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Float;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const v1, 0x3ca3d70a    # 0.02f

    .line 18
    .line 19
    .line 20
    cmpl-float v0, v0, v1

    .line 21
    .line 22
    if-lez v0, :cond_0

    .line 23
    .line 24
    invoke-static {p2}, Ll/fp10;->e(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 33
    .line 34
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->position:I

    .line 35
    .line 36
    iget-object p0, p0, Ll/ar10;->j:Ll/td10;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/td10;->b4()Ll/le10;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ll/le10;->t()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    const/4 v1, 0x1

    .line 47
    invoke-virtual {v0, p2, p0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->q(IIZLjava/lang/Float;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 54
    .line 55
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->position:I

    .line 56
    .line 57
    iget-object p0, p0, Ll/ar10;->j:Ll/td10;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/td10;->b4()Ll/le10;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Ll/le10;->t()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    const/4 v1, 0x0

    .line 68
    invoke-virtual {v0, p2, p0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->q(IIZLjava/lang/Float;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic r4(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar10;->j:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/td10;->b4()Ll/le10;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/le10;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final synthetic s4(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar10;->k:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    iget-object v0, p0, Ll/ar10;->j:Ll/td10;

    .line 3
    invoke-virtual {v0}, Ll/td10;->c4()Lrx/c;

    move-result-object v0

    new-instance v1, Ll/eq10;

    invoke-direct {v1}, Ll/eq10;-><init>()V

    .line 4
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    move-result-object v0

    iget-object v1, p0, Ll/ar10;->i:Lrx/subjects/a;

    .line 5
    invoke-virtual {v1}, Lrx/c;->asObservable()Lrx/c;

    move-result-object v1

    new-instance v2, Ll/xq10;

    invoke-direct {v2}, Ll/xq10;-><init>()V

    .line 6
    invoke-virtual {v1, v2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    move-result-object v1

    new-instance v2, Ll/yq10;

    invoke-direct {v2}, Ll/yq10;-><init>()V

    .line 7
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/zq10;

    invoke-direct {v1, p0}, Ll/zq10;-><init>(Ll/ar10;)V

    new-instance v2, Ll/fq10;

    invoke-direct {v2}, Ll/fq10;-><init>()V

    .line 9
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 11
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ll/jfv;

    invoke-virtual {v0}, Ll/jfv;->g()Lrx/c;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/td;

    invoke-direct {v1}, Ll/td;-><init>()V

    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/gq10;

    invoke-direct {v1, p0}, Ll/gq10;-><init>(Ll/ar10;)V

    .line 13
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/hq10;

    invoke-direct {v1, p0}, Ll/hq10;-><init>(Ll/ar10;)V

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/iq10;

    invoke-direct {v1, p0}, Ll/iq10;-><init>(Ll/ar10;)V

    .line 15
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->callVolumeChanged()Ll/v3f$d;

    move-result-object v0

    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/c;

    .line 18
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v1

    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->updateMemberVolume()Ll/v3f$d;

    move-result-object v1

    invoke-virtual {v1}, Ll/v3f$b;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrx/c;

    .line 19
    invoke-static {v0, v1}, Lrx/c;->merge(Lrx/c;Lrx/c;)Lrx/c;

    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/jq10;

    invoke-direct {v1, p0}, Ll/jq10;-><init>(Ll/ar10;)V

    .line 21
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->refreshCallView()Ll/v3f$d;

    move-result-object v0

    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/c;

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/pq10;

    invoke-direct {v1, p0}, Ll/pq10;-><init>(Ll/ar10;)V

    .line 23
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    const/4 v0, 0x1

    .line 25
    invoke-virtual {p0, v0}, Ll/ar10;->c4(Z)V

    .line 26
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Ll/bnl0;->K(Landroid/view/View;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/sq10;

    invoke-direct {v1}, Ll/sq10;-><init>()V

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    move-result-object v0

    new-instance v1, Ll/tq10;

    invoke-direct {v1, p0}, Ll/tq10;-><init>(Ll/ar10;)V

    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnUpdatePoints()Ll/v3f$d;

    move-result-object v0

    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/c;

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/uq10;

    invoke-direct {v1, p0}, Ll/uq10;-><init>(Ll/ar10;)V

    .line 31
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnStart()Ll/v3f$d;

    move-result-object v0

    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/c;

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/vq10;

    invoke-direct {v1, p0}, Ll/vq10;-><init>(Ll/ar10;)V

    .line 33
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnPunishing()Ll/v3f$d;

    move-result-object v0

    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/c;

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/vq10;

    invoke-direct {v1, p0}, Ll/vq10;-><init>(Ll/ar10;)V

    .line 35
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnEnd()Ll/v3f$c;

    move-result-object v0

    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/c;

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/wq10;

    invoke-direct {v1, p0}, Ll/wq10;-><init>(Ll/ar10;)V

    .line 37
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object p0

    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    return-void
.end method

.method public final synthetic t4(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar10;->j:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/td10;->b4()Ll/le10;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/le10;->y(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0, p1, v0}, Ll/ar10;->C4(Lcom/p1/mobile/putong/data/User;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic u4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/ar10;->l:Ll/kcg0;

    .line 8
    .line 9
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Ll/ar10;->l:Ll/kcg0;

    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Ll/ar10;->j:Ll/td10;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/td10;->b4()Ll/le10;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ll/ar10;->y4(Ll/le10;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic v4(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    invoke-virtual {p0, v0, p1}, Ll/ar10;->d4(ZI)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final x4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 5

    .line 1
    invoke-static {p0}, Ll/bf10;->B(Ll/i6t;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/16 v2, 0x1770

    .line 16
    .line 17
    invoke-static {v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->builder(I)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {v0}, Ll/csq;->c(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {p1}, Ll/csq;->c(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    const-string v3, "multiCall"

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    const-string v3, "anchor"

    .line 50
    .line 51
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setMultiCall(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->liveId:Ljava/lang/String;

    .line 62
    .line 63
    new-instance v4, Ll/kq10;

    .line 64
    .line 65
    invoke-direct {v4, p0, p1}, Ll/kq10;-><init>(Ll/ar10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v2, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->jumpToOtherRoom(Ljava/lang/String;Ljava/lang/String;Ll/x20;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p1, "liveRoom"

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->trackFrom(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {v1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public y4(Ll/le10;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/le10;->v()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/ar10;->m:Ljava/util/List;

    .line 6
    .line 7
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->setViewVisible(Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ll/le10;->u()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 29
    .line 30
    iget-object v1, p0, Ll/ar10;->m:Ljava/util/List;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/le10;->u()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->s(Ljava/util/List;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/z310;

    .line 40
    .line 41
    const/16 v1, 0x1770

    .line 42
    .line 43
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Ll/h0m;

    .line 51
    .line 52
    invoke-interface {p0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    if-eqz p0, :cond_1

    .line 57
    .line 58
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_MULTI_CALL_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    check-cast p0, Ll/p910;

    .line 67
    .line 68
    invoke-virtual {p1}, Ll/le10;->u()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, p1}, Ll/p910;->I1(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    if-eqz p0, :cond_2

    .line 77
    .line 78
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_MULTI_CALL_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    check-cast p0, Ll/ab10;

    .line 87
    .line 88
    invoke-virtual {p1}, Ll/le10;->u()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p0, p1}, Ll/ab10;->y1(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_2
    return-void
.end method

.method public z4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPoints;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPoints;->getPlayerList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPoints;->getPlayerList()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->w(Ljava/util/List;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
