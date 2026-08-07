.class public Ll/yb50;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/dw40;",
        ">",
        "Ll/i6t<",
        "TD;",
        "Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/yb50;->i:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic K3(Ll/yb50;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yb50;->W3(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V

    return-void
.end method

.method public static synthetic L3()V
    .locals 1

    .line 1
    const-string v0, "\u8ba2\u9605\u6210\u529f"

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic M3(Ll/yb50;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yb50;->d4(Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method

.method public static synthetic N3(Ll/yb50;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yb50;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O3(Ll/yb50;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yb50;->c4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic P3(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic R3(Ll/yb50;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yb50;->a4(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S3(Ll/yb50;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yb50;->Y3(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T3(Ll/yb50;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yb50;->X3(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic U3(Ll/yb50;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yb50;->b4(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    return-void
.end method

.method private synthetic W3(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;->b()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    xor-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->m(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->KeyboardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;->show()Ll/v3f$d;

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
    new-instance v1, Ll/nb50;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/nb50;-><init>(Ll/yb50;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

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

.method public V3()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/dw40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/dw40;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/oo2;->u0()Lcom/p1/mobile/putong/data/Followship;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {v0, p0}, Ll/q0j;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Followship;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public final synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yb50;->g4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Y3(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Ll/yb50;->i:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ll/dw40;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ll/dw40;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ll/dw40;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object v7, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    const-string v4, "live"

    .line 40
    .line 41
    const-string v5, "live"

    .line 42
    .line 43
    move-object v3, v2

    .line 44
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->t7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public final synthetic Z3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yb50;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/f3t;->d(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic a4(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/dw40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic b4(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/dw40;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->p(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic c4(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/dw40;

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
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ll/dw40;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/oo2;->U(Lcom/p1/mobile/putong/data/Followship;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic d4(Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yb50;->g4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/dw40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OfficialShowCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowCardEvent;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowCardEvent;->show()Ll/v3f$d;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public f4()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/dw40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "liveRoom_topleft"

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Ll/tfs$a;->h(Ljava/lang/String;)Ll/tfs$a;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2, v1}, Ll/tfs$a;->e(Ljava/lang/String;)Ll/tfs$a;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v2, v0}, Ll/tfs$a;->d(Ljava/lang/String;)Ll/tfs$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Ll/dw40;

    .line 40
    .line 41
    invoke-virtual {v2}, Ll/dw40;->A2()Ll/ew40;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v2}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, v3}, Ll/tfs$a;->f(Ljava/lang/String;)Ll/tfs$a;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 58
    .line 59
    invoke-virtual {v3, v2}, Ll/tfs$a;->g(Lcom/p1/mobile/putong/live/base/data/BLiveState;)Ll/tfs$a;

    .line 60
    .line 61
    .line 62
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v0}, Ll/tfs$a;->a()Ll/tfs;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v2, v0}, Ll/afu;->c(Ljava/lang/String;Ll/tfs;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Ll/dw40;

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    new-instance v2, Ll/ob50;

    .line 84
    .line 85
    invoke-direct {v2}, Ll/ob50;-><init>()V

    .line 86
    .line 87
    .line 88
    const/4 v3, 0x0

    .line 89
    invoke-virtual {v0, v3, p0, v1, v2}, Ll/oo2;->e0(ZLjava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final g4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/yb50;->V3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->l(Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->l(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public h4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/dw40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0, p1}, Ll/yo1;->k(Ll/dw40;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->CHAT_INPUT:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 13
    .line 14
    filled-new-array {v2}, [Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ll/t8s;->l([Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    xor-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->m(Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/dw40;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/dw40;->A2()Ll/ew40;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/ew40;->d()Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/pb50;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/pb50;-><init>(Ll/yb50;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ll/dw40;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/oo2;->h0()Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/qb50;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/qb50;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/rb50;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/rb50;-><init>(Ll/yb50;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Ll/sb50;

    .line 86
    .line 87
    invoke-direct {v1}, Ll/sb50;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    new-instance v1, Ll/tb50;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/tb50;-><init>(Ll/yb50;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    new-instance v1, Ll/ub50;

    .line 108
    .line 109
    invoke-direct {v1, p0}, Ll/ub50;-><init>(Ll/yb50;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    new-instance v1, Ll/vb50;

    .line 117
    .line 118
    invoke-direct {v1, p0}, Ll/vb50;-><init>(Ll/yb50;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 126
    .line 127
    .line 128
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 129
    .line 130
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    check-cast v0, Ll/jfv;

    .line 135
    .line 136
    invoke-virtual {v0}, Ll/jfv;->g()Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    new-instance v1, Ll/wb50;

    .line 145
    .line 146
    invoke-direct {v1, p0}, Ll/wb50;-><init>(Ll/yb50;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    check-cast v0, Ll/dw40;

    .line 161
    .line 162
    invoke-virtual {v0}, Ll/oo2;->t0()Lrx/c;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    new-instance v1, Ll/xb50;

    .line 171
    .line 172
    invoke-direct {v1, p0}, Ll/xb50;-><init>(Ll/yb50;)V

    .line 173
    .line 174
    .line 175
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 180
    .line 181
    .line 182
    return-void
.end method
