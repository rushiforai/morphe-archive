.class public Ll/ljd0;
.super Ll/x5;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/x5<",
        "Ll/ou40;",
        "Lcom/p1/mobile/putong/live/base/data/BLive;",
        "Ll/ow40;",
        "Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;",
        ">;"
    }
.end annotation


# static fields
.field public static r:Ljava/lang/String; = ""


# instance fields
.field public j:Ll/ow40;

.field public final k:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

.field public final l:Ll/ogd0;

.field public m:Ll/kcg0;

.field public n:Ll/kcg0;

.field public o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ljava/lang/String;

.field public q:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/ow40;Ll/ogd0;Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/x5;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ljd0;->j:Ll/ow40;

    .line 5
    .line 6
    iget-object v0, p1, Ll/dum;->f:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 9
    .line 10
    iput-object v0, p0, Ll/ljd0;->k:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 11
    .line 12
    iput-object p2, p0, Ll/ljd0;->l:Ll/ogd0;

    .line 13
    .line 14
    invoke-virtual {p0, p3}, Ll/l6t;->C(Ll/iam;)V

    .line 15
    .line 16
    .line 17
    new-instance p2, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Ll/ljd0;->o:Ljava/util/List;

    .line 23
    .line 24
    iget-object p2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast p2, Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-virtual {p1, p0, p2}, Ll/dum;->a(Ll/njt;Landroid/view/ViewGroup;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private A4()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/ou40;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/ou40;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Ll/ou40;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 53
    .line 54
    const-string v0, "rtc"

    .line 55
    .line 56
    invoke-static {p0, v0}, Ll/sjt;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0

    .line 61
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 62
    return p0
.end method

.method private P4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
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

.method public static synthetic j4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k4(Ll/ljd0;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ljd0;->G4(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    return-void
.end method

.method public static synthetic l4(Ll/ljd0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ljd0;->I4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method public static synthetic m4(Ljava/lang/String;Ljava/util/Map;)V
    .locals 1

    .line 1
    const-string v0, "leave_type"

    .line 2
    .line 3
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic n4(Ll/ljd0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ljd0;->D4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o4(Ll/ljd0;Ll/qwl;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ljd0;->E4(Ll/qwl;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic p4(Ll/y20;Ll/ugd0;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic q4(Ll/ljd0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ljd0;->F4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic r4(Ll/ljd0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ljd0;->C4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic s4(Ll/ljd0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ljd0;->H4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic t4(Ljava/lang/Integer;)Ljava/lang/Boolean;
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

.method public static synthetic u4()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v4(Ll/ljd0;Ll/hmd0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ljd0;->J4(Ll/hmd0;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method private w4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ljd0;->n:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->getGiftWidthObs()Lrx/c;

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
    new-instance v1, Ll/zid0;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/zid0;-><init>()V

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
    new-instance v1, Ll/ajd0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/ajd0;-><init>(Ll/ljd0;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/bjd0;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/bjd0;-><init>()V

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
    iput-object v0, p0, Ll/ljd0;->n:Ll/kcg0;

    .line 54
    .line 55
    return-void
.end method


# virtual methods
.method public B4()Z
    .locals 7

    .line 1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/p6s;->G1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/wrv;->u()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    sget-object v0, Ll/htd0;->e:Ll/htd0;

    .line 32
    .line 33
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Ll/ifv;

    .line 38
    .line 39
    iget-object v2, v2, Ll/ifv;->u:Ll/byd0;

    .line 40
    .line 41
    invoke-static {}, Ll/pzi0;->o()J

    .line 42
    .line 43
    .line 44
    move-result-wide v3

    .line 45
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Ljava/lang/Long;

    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 52
    .line 53
    .line 54
    move-result-wide v5

    .line 55
    sub-long/2addr v3, v5

    .line 56
    const-wide/32 v5, 0x48190800

    .line 57
    .line 58
    .line 59
    cmp-long v2, v3, v5

    .line 60
    .line 61
    if-gez v2, :cond_1

    .line 62
    .line 63
    return v1

    .line 64
    :cond_1
    new-instance v1, Ll/th0$a;

    .line 65
    .line 66
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    invoke-direct {v1, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 69
    .line 70
    .line 71
    const-string v2, "\u60ac\u6d6e\u7a97\u64ad\u653e,\u7cbe\u5f69\u4e0d\u65ad"

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    const-string v2, "\u5f00\u542f\u60ac\u6d6e\u7a97\u64ad\u653e\u529f\u80fd\uff0c\u9000\u51fa\u76f4\u64ad\u95f4\u8fd8\u80fd\u7ee7\u7eed\u89c2\u770b\u7cbe\u5f69\u76f4\u64ad"

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    new-instance v2, Ll/yid0;

    .line 84
    .line 85
    invoke-direct {v2, p0}, Ll/yid0;-><init>(Ll/ljd0;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, v2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const/4 v1, 0x1

    .line 93
    invoke-virtual {p0, v1}, Ll/th0$a;->b(Z)Ll/th0$a;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    const-string v2, "\u6682\u4e0d\u4f7f\u7528"

    .line 98
    .line 99
    invoke-virtual {p0, v2}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const-string v2, "\u7acb\u5373\u8bbe\u7f6e"

    .line 104
    .line 105
    invoke-virtual {p0, v2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 114
    .line 115
    .line 116
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    check-cast p0, Ll/ifv;

    .line 121
    .line 122
    iget-object p0, p0, Ll/ifv;->u:Ll/byd0;

    .line 123
    .line 124
    invoke-static {}, Ll/pzi0;->o()J

    .line 125
    .line 126
    .line 127
    move-result-wide v2

    .line 128
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    :cond_2
    :goto_0
    return v1
.end method

.method public final synthetic C4(Ljava/lang/Integer;)V
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
    sget p1, Ll/qa00;->E:I

    .line 23
    .line 24
    sub-int/2addr v1, p1

    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-direct {v0, v1, p1}, Landroid/util/Size;-><init>(II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic D4(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/wrv;->q(Landroid/content/Context;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic E4(Ll/qwl;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 p2, 0x0

    .line 9
    iput-boolean p2, p0, Ll/ljd0;->q:Z

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    invoke-interface {p1, p0}, Ll/qwl;->b(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic F4(Ll/jsv;)V
    .locals 1

    .line 1
    sget-object p1, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 2
    .line 3
    const-string v0, "live_valid_state_module"

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

.method public final synthetic G4(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/ou40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/oo2;->T0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic H4(Ll/jsv;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/jsv;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/ou40;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/ou40;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v0, v2, v1}, Ll/ou40;->e2(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 25
    .line 26
    .line 27
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 28
    .line 29
    const-string v1, "enter_live_room"

    .line 30
    .line 31
    const-string v2, "startLive"

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p1}, Ll/jsv;->c()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    iget-object p1, p0, Ll/ljd0;->o:Ljava/util/List;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Ll/ou40;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iget-object p1, p0, Ll/ljd0;->l:Ll/ogd0;

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/ogd0;->l1()V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/ljd0;->o:Ljava/util/List;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    check-cast p0, Ll/ou40;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method public final synthetic I4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "room presenter received control message,"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "[live]msg_observer_handler"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/4 v2, 0x1

    .line 30
    const/4 v3, 0x2

    .line 31
    const/4 v4, -0x1

    .line 32
    sparse-switch v1, :sswitch_data_0

    .line 33
    .line 34
    .line 35
    goto/16 :goto_0

    .line 36
    .line 37
    :sswitch_0
    const-string v1, "delete_manager"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    goto/16 :goto_0

    .line 46
    .line 47
    :cond_0
    const/16 v4, 0xb

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :sswitch_1
    const-string v1, "forbidden_multidevice"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    goto/16 :goto_0

    .line 60
    .line 61
    :cond_1
    const/16 v4, 0xa

    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :sswitch_2
    const-string v1, "force_stop"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_2

    .line 72
    .line 73
    goto/16 :goto_0

    .line 74
    .line 75
    :cond_2
    const/16 v4, 0x9

    .line 76
    .line 77
    goto/16 :goto_0

    .line 78
    .line 79
    :sswitch_3
    const-string v1, "start"

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_3

    .line 86
    .line 87
    goto/16 :goto_0

    .line 88
    .line 89
    :cond_3
    const/16 v4, 0x8

    .line 90
    .line 91
    goto/16 :goto_0

    .line 92
    .line 93
    :sswitch_4
    const-string v1, "pause"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_4

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_4
    const/4 v4, 0x7

    .line 103
    goto :goto_0

    .line 104
    :sswitch_5
    const-string v1, "stop"

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_5

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_5
    const/4 v4, 0x6

    .line 114
    goto :goto_0

    .line 115
    :sswitch_6
    const-string v1, "boot"

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_6

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_6
    const/4 v4, 0x5

    .line 125
    goto :goto_0

    .line 126
    :sswitch_7
    const-string v1, "chat_tip_change"

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-nez v0, :cond_7

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_7
    const/4 v4, 0x4

    .line 136
    goto :goto_0

    .line 137
    :sswitch_8
    const-string v1, "re_request_room_gift_list"

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_8

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_8
    const/4 v4, 0x3

    .line 147
    goto :goto_0

    .line 148
    :sswitch_9
    const-string v1, "system"

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-nez v0, :cond_9

    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_9
    move v4, v3

    .line 158
    goto :goto_0

    .line 159
    :sswitch_a
    const-string v1, "live_pull_update_video_quality"

    .line 160
    .line 161
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_a

    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_a
    move v4, v2

    .line 169
    goto :goto_0

    .line 170
    :sswitch_b
    const-string v1, "add_manager"

    .line 171
    .line 172
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-nez v0, :cond_b

    .line 177
    .line 178
    goto :goto_0

    .line 179
    :cond_b
    const/4 v4, 0x0

    .line 180
    :goto_0
    const-string v0, ""

    .line 181
    .line 182
    packed-switch v4, :pswitch_data_0

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :pswitch_0
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->isAnchor:Z

    .line 187
    .line 188
    if-eqz p1, :cond_c

    .line 189
    .line 190
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 191
    .line 192
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->T5:I

    .line 193
    .line 194
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    goto :goto_1

    .line 199
    :cond_c
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 200
    .line 201
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->R5:I

    .line 202
    .line 203
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    :goto_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    check-cast v1, Ll/ou40;

    .line 212
    .line 213
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    check-cast v2, Ll/ou40;

    .line 218
    .line 219
    invoke-virtual {v2}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    invoke-virtual {v1, v2}, Ll/oo2;->g2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {p0}, Ll/ljd0;->y4()V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 234
    .line 235
    .line 236
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/live/LiveDialogAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    return-void

    .line 244
    :pswitch_1
    iget-object p0, p0, Ll/ljd0;->o:Ljava/util/List;

    .line 245
    .line 246
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 247
    .line 248
    .line 249
    return-void

    .line 250
    :pswitch_2
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 251
    .line 252
    .line 253
    move-result-object p0

    .line 254
    check-cast p0, Ll/ou40;

    .line 255
    .line 256
    sget-object p1, Ll/qcu;->b:Ll/qcu;

    .line 257
    .line 258
    invoke-virtual {p0, p1}, Ll/vp20;->h(Ll/jsv;)V

    .line 259
    .line 260
    .line 261
    return-void

    .line 262
    :pswitch_3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    check-cast p0, Ll/ou40;

    .line 267
    .line 268
    sget-object p1, Ll/v9s;->e:Ll/v9s;

    .line 269
    .line 270
    invoke-virtual {p0, p1}, Ll/vp20;->h(Ll/jsv;)V

    .line 271
    .line 272
    .line 273
    return-void

    .line 274
    :pswitch_4
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 275
    .line 276
    new-instance v4, Ljava/lang/StringBuilder;

    .line 277
    .line 278
    const-string v5, "live boot handle with content"

    .line 279
    .line 280
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    iget-object v5, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 284
    .line 285
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v4

    .line 292
    invoke-direct {v1, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    check-cast v1, Ll/ou40;

    .line 303
    .line 304
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 305
    .line 306
    .line 307
    move-result-object v4

    .line 308
    check-cast v4, Ll/ou40;

    .line 309
    .line 310
    invoke-virtual {v4}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 311
    .line 312
    .line 313
    move-result-object v4

    .line 314
    invoke-virtual {v1, v4}, Ll/oo2;->g2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 315
    .line 316
    .line 317
    invoke-virtual {p0}, Ll/ljd0;->y4()V

    .line 318
    .line 319
    .line 320
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 321
    .line 322
    .line 323
    move-result-object v1

    .line 324
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 325
    .line 326
    .line 327
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->isFromLiveRoomBlock()Z

    .line 328
    .line 329
    .line 330
    move-result v1

    .line 331
    if-eqz v1, :cond_d

    .line 332
    .line 333
    invoke-static {v3}, Ll/wft;->b(I)Z

    .line 334
    .line 335
    .line 336
    move-result v1

    .line 337
    if-eqz v1, :cond_d

    .line 338
    .line 339
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 340
    .line 341
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 342
    .line 343
    .line 344
    return-void

    .line 345
    :cond_d
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 346
    .line 347
    .line 348
    move-result-object p0

    .line 349
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 350
    .line 351
    invoke-static {v3}, Ll/wft;->b(I)Z

    .line 352
    .line 353
    .line 354
    move-result v1

    .line 355
    xor-int/2addr v1, v2

    .line 356
    invoke-static {p0, v0, p1, v1}, Lcom/p1/mobile/putong/live/LiveDialogAct;->i2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 357
    .line 358
    .line 359
    return-void

    .line 360
    :pswitch_5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 361
    .line 362
    .line 363
    move-result-object p0

    .line 364
    check-cast p0, Ll/ou40;

    .line 365
    .line 366
    invoke-virtual {p0}, Ll/oo2;->L1()V

    .line 367
    .line 368
    .line 369
    return-void

    .line 370
    :pswitch_6
    invoke-static {v2}, Ll/muj;->w(Z)V

    .line 371
    .line 372
    .line 373
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 374
    .line 375
    .line 376
    move-result-object p1

    .line 377
    check-cast p1, Ll/ou40;

    .line 378
    .line 379
    new-instance v0, Ll/uxj$a;

    .line 380
    .line 381
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 382
    .line 383
    .line 384
    move-result-object v1

    .line 385
    check-cast v1, Ll/ou40;

    .line 386
    .line 387
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v1

    .line 391
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 392
    .line 393
    .line 394
    move-result-object v2

    .line 395
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 396
    .line 397
    .line 398
    move-result-object p0

    .line 399
    check-cast p0, Ll/ou40;

    .line 400
    .line 401
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 402
    .line 403
    .line 404
    move-result-object p0

    .line 405
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 406
    .line 407
    invoke-static {v2, p0}, Ll/mc50;->R2(Ll/oo2;Ljava/lang/String;)Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object p0

    .line 411
    const-string v2, "live"

    .line 412
    .line 413
    invoke-direct {v0, v1, p0, v2}, Ll/uxj$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 414
    .line 415
    .line 416
    invoke-virtual {v0}, Ll/uxj$a;->f()Ll/uxj;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    const/4 v0, 0x0

    .line 421
    invoke-virtual {p1, p0, v0}, Ll/oo2;->A1(Ll/uxj;Ll/y20;)V

    .line 422
    .line 423
    .line 424
    return-void

    .line 425
    :pswitch_7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 426
    .line 427
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 428
    .line 429
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->y5:I

    .line 430
    .line 431
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object v0

    .line 435
    new-instance v1, Ll/kjd0;

    .line 436
    .line 437
    invoke-direct {v1}, Ll/kjd0;-><init>()V

    .line 438
    .line 439
    .line 440
    invoke-direct {p0, p1, v0, v1}, Ll/ljd0;->P4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 441
    .line 442
    .line 443
    return-void

    .line 444
    :pswitch_8
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 445
    .line 446
    .line 447
    move-result-object p0

    .line 448
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 449
    .line 450
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->refreshPlayAddress()Ll/v3f$c;

    .line 451
    .line 452
    .line 453
    move-result-object p0

    .line 454
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 455
    .line 456
    .line 457
    return-void

    .line 458
    :pswitch_9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 459
    .line 460
    .line 461
    move-result-object p1

    .line 462
    check-cast p1, Ll/ou40;

    .line 463
    .line 464
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 465
    .line 466
    .line 467
    move-result-object p0

    .line 468
    check-cast p0, Ll/ou40;

    .line 469
    .line 470
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object p0

    .line 474
    invoke-virtual {p1, p0}, Ll/dw40;->K1(Ljava/lang/String;)V

    .line 475
    .line 476
    .line 477
    return-void

    .line 478
    nop

    .line 479
    :sswitch_data_0
    .sparse-switch
        -0x7f9401f1 -> :sswitch_b
        -0x71054394 -> :sswitch_a
        -0x34e38dd1 -> :sswitch_9
        -0x33a7a8db -> :sswitch_8
        -0x1ce5c8e5 -> :sswitch_7
        0x2e3af2 -> :sswitch_6
        0x360802 -> :sswitch_5
        0x65825f6 -> :sswitch_4
        0x68ac462 -> :sswitch_3
        0x80850d6 -> :sswitch_2
        0x169d3189 -> :sswitch_1
        0x40206119 -> :sswitch_0
    .end sparse-switch

    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    .line 494
    .line 495
    .line 496
    .line 497
    .line 498
    .line 499
    .line 500
    .line 501
    .line 502
    .line 503
    .line 504
    .line 505
    .line 506
    .line 507
    .line 508
    .line 509
    .line 510
    .line 511
    .line 512
    .line 513
    .line 514
    .line 515
    .line 516
    .line 517
    .line 518
    .line 519
    .line 520
    .line 521
    .line 522
    .line 523
    .line 524
    .line 525
    .line 526
    .line 527
    .line 528
    .line 529
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_9
    .end packed-switch
.end method

.method public J3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/njt;->J3()V

    .line 2
    .line 3
    .line 4
    const-string p0, "context_single_room"

    .line 5
    .line 6
    invoke-static {p0}, Ll/r230;->p(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic J4(Ll/hmd0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public K4()Z
    .locals 2

    .line 1
    const-string v0, "square-curated"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/i6t;->m3()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

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
    check-cast p0, Ll/ou40;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/vp20;->r()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public L4(Z)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ljd0;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-static {}, Ll/lwr;->b()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ljd0;->K4()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ll/ljd0;->l:Ll/ogd0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/ogd0;->C0()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0, p1}, Ll/ljd0;->Q4(Ljava/lang/String;Z)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput-boolean p1, p0, Ll/ljd0;->q:Z

    .line 27
    .line 28
    :cond_1
    iget-boolean p0, p0, Ll/ljd0;->q:Z

    .line 29
    .line 30
    return p0
.end method

.method public M4(ZLcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ljd0;->p:Ljava/lang/String;

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
    iput-object v0, p0, Ll/ljd0;->p:Ljava/lang/String;

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

.method public N3()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/ljd0;->p:Ljava/lang/String;

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

.method public N4(Lcom/p1/mobile/putong/live/base/data/BLive;)V
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
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->quickPlay()Ll/v3f$d;

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

.method public final O4(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ljd0;->K4()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    xor-int/2addr v0, p1

    .line 9
    :cond_0
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/iti;->c()Ll/iti;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/iti;->b()V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public P3()V
    .locals 1

    .line 1
    invoke-static {}, Ll/lti;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Ll/ljd0;->L4(Z)Z

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Ll/ljd0;->O4(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public Q4(Ljava/lang/String;Z)Z
    .locals 6

    .line 1
    new-instance v0, Ll/gyb;

    .line 2
    .line 3
    const/16 v1, 0x7d0

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/gyb;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/fyb;

    .line 13
    .line 14
    new-instance v2, Ll/hti;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    check-cast v3, Ll/dw40;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/i6t;->n3()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    if-eqz v5, :cond_0

    .line 31
    .line 32
    iget v0, v0, Ll/fyb;->c:F

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v0, 0x0

    .line 36
    :goto_0
    invoke-direct {v2, v3, v4, p1, v0}, Ll/hti;-><init>(Ll/oo2;Ljava/lang/String;Ljava/lang/String;F)V

    .line 37
    .line 38
    .line 39
    new-instance p1, Ll/xsi;

    .line 40
    .line 41
    invoke-direct {p1, v1}, Ll/xsi;-><init>(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Ll/qwl;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/ljd0;->x4(Ll/qwl;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2, p1}, Ll/hti;->i(Ll/qwl;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2}, Ll/hti;->b()Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const/4 v1, 0x1

    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v3, Ll/hjd0;

    .line 70
    .line 71
    invoke-direct {v3, p0, p1}, Ll/hjd0;-><init>(Ll/ljd0;Ll/qwl;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v3}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1}, Ll/p6s;->G1()Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_1

    .line 90
    .line 91
    invoke-static {}, Ll/pzm;->c()Ll/pzm;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0, v2, v1}, Ll/pzm;->f(Ll/hti;Z)Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    return p0

    .line 100
    :cond_1
    invoke-static {}, Ll/lti;->d()Ll/lti;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 105
    .line 106
    invoke-virtual {p1, v2, p0, p2}, Ll/lti;->i(Ll/hti;Lcom/p1/mobile/android/app/Act;Z)Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    return p0
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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/ljd0;->z4(Lcom/p1/mobile/putong/live/base/data/BLive;ZLl/y20;Ll/y20;Z)V

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
    invoke-virtual {p0, p1}, Ll/ljd0;->X3(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public V3()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ljd0;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public W3()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ljd0;->p:Ljava/lang/String;

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
    .locals 3

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
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/Boolean;

    .line 13
    .line 14
    new-instance v2, Ll/jc10;

    .line 15
    .line 16
    invoke-direct {v2, v1, p1}, Ll/jc10;-><init>(II)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v2}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0

    .line 40
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 41
    return p0
.end method

.method public Y3(ZZ)Z
    .locals 2

    .line 1
    const/4 p2, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Ll/nfd0;

    .line 6
    .line 7
    const/16 v1, 0xd48

    .line 8
    .line 9
    invoke-direct {p1, v1}, Ll/nfd0;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    move p1, p2

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move p1, v0

    .line 27
    :goto_0
    if-nez p1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ljd0;->B4()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    return p2

    .line 36
    :cond_1
    if-nez p1, :cond_2

    .line 37
    .line 38
    invoke-static {}, Ll/lti;->f()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    invoke-virtual {p0, p2}, Ll/ljd0;->L4(Z)Z

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/ljd0;->O4(Z)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return p1
.end method

.method public Z3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ljd0;->l:Ll/ogd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ogd0;->h1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a4()V
    .locals 1

    .line 1
    invoke-static {}, Ll/lti;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Ll/ljd0;->L4(Z)Z

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Ll/ljd0;->O4(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public bridge synthetic b4(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ljd0;->M4(ZLcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic c4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ljd0;->N4(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/x5;->d4(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ijd0;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/ijd0;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string p1, "audience_stop_live_confirm"

    .line 10
    .line 11
    invoke-static {p0, p1, v0}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 12
    .line 13
    .line 14
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
    check-cast p0, Ll/ou40;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/ou40;->O2(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

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
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->setSwallowAllTouchEvent(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public i4()V
    .locals 3

    .line 1
    invoke-static {}, Ll/lwr;->d()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/pvn$a;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/pvn$a;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "live"

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/pvn;->c(Ljava/lang/String;Ll/ga1;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-static {}, Ll/zrv;->r()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/ljd0;->l:Ll/ogd0;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/ogd0;->x0()Ll/u4j;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0}, Ll/njt;->K3()Ll/dum;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ll/mer;->I2(Ll/dum;)Ll/l6t;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/njt;->K3()Ll/dum;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Ll/ow40;

    .line 46
    .line 47
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    .line 50
    .line 51
    invoke-static {p0, v0, v1}, Ll/sid0;->a(Ll/ljd0;Ll/ow40;Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;)V

    .line 52
    .line 53
    .line 54
    invoke-super {p0}, Ll/l6t;->T()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ll/ou40;

    .line 62
    .line 63
    iget-object v1, p0, Ll/x5;->i:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ll/vp20;->w(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Ll/ou40;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/oo2;->c2()V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 78
    .line 79
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    .line 80
    .line 81
    const/4 v1, 0x1

    .line 82
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->C(Z)V

    .line 83
    .line 84
    .line 85
    invoke-direct {p0}, Ll/ljd0;->w4()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Ll/ou40;

    .line 93
    .line 94
    invoke-virtual {v0}, Ll/vp20;->y()Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v2, Ll/cjd0;

    .line 103
    .line 104
    invoke-direct {v2, p0}, Ll/cjd0;-><init>(Ll/ljd0;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 112
    .line 113
    .line 114
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    new-instance v2, Ll/djd0;

    .line 127
    .line 128
    invoke-direct {v2, p0}, Ll/djd0;-><init>(Ll/ljd0;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    check-cast v0, Ll/ou40;

    .line 143
    .line 144
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    new-instance v2, Ll/ejd0;

    .line 153
    .line 154
    invoke-direct {v2, p0}, Ll/ejd0;-><init>(Ll/ljd0;)V

    .line 155
    .line 156
    .line 157
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    check-cast v0, Ll/ou40;

    .line 169
    .line 170
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 171
    .line 172
    invoke-virtual {v0, v2}, Ll/oo2;->o1(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    new-instance v2, Ll/fjd0;

    .line 177
    .line 178
    invoke-direct {v2, p0}, Ll/fjd0;-><init>(Ll/ljd0;)V

    .line 179
    .line 180
    .line 181
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    iput-object v0, p0, Ll/ljd0;->m:Ll/kcg0;

    .line 190
    .line 191
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    check-cast v0, Ll/ou40;

    .line 196
    .line 197
    invoke-virtual {v0}, Ll/oo2;->P1()V

    .line 198
    .line 199
    .line 200
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->f(I)V

    .line 205
    .line 206
    .line 207
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->g(I)V

    .line 212
    .line 213
    .line 214
    const/4 v0, 0x0

    .line 215
    iput-object v0, p0, Ll/ljd0;->p:Ljava/lang/String;

    .line 216
    .line 217
    new-instance v0, Ll/gjd0;

    .line 218
    .line 219
    invoke-direct {v0, p0}, Ll/gjd0;-><init>(Ll/ljd0;)V

    .line 220
    .line 221
    .line 222
    const-class v1, Ll/hmd0;

    .line 223
    .line 224
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 225
    .line 226
    .line 227
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
    iget-object v2, p0, Ll/ljd0;->l:Ll/ogd0;

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
    check-cast v0, Ll/ow40;

    .line 18
    .line 19
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    .line 22
    .line 23
    invoke-static {p0, v0, v1}, Ll/sid0;->b(Ll/ljd0;Ll/ow40;Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    .line 29
    .line 30
    iget-object p0, p0, Ll/ljd0;->k:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->w(Ll/rgd0;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public m(Z)V
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
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->showLoading()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 5
    .line 6
    iget-object v0, v0, Ll/dum;->j:Ll/x6t;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/l6t;->destroy()V

    .line 9
    .line 10
    .line 11
    const-string v0, "context_single_room"

    .line 12
    .line 13
    invoke-static {v0}, Ll/r230;->p(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ljd0;->m:Ll/kcg0;

    .line 17
    .line 18
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/ljd0;->o:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ljd0;->V3()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 33
    .line 34
    iget-object p0, p0, Ll/dum;->h:Ll/oo2;

    .line 35
    .line 36
    check-cast p0, Ll/ou40;

    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    invoke-virtual {p0, v0}, Ll/ou40;->c0(Z)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-static {}, Ll/lwr;->b()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Ll/ou40;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/ou40;->exit()V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 56
    .line 57
    iget-object p0, p0, Ll/dum;->h:Ll/oo2;

    .line 58
    .line 59
    check-cast p0, Ll/ou40;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/ou40;->H2()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public s2()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->s2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ljd0;->n:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->destroy()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final x4(Ll/qwl;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/qwl;->isPlaying()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-direct {p0}, Ll/ljd0;->A4()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    invoke-interface {p1, p0}, Ll/qwl;->b(Z)V

    .line 24
    .line 25
    .line 26
    invoke-interface {p1}, Ll/qwl;->reset()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public y4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ljd0;->J3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z4(Lcom/p1/mobile/putong/live/base/data/BLive;ZLl/y20;Ll/y20;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/Exception;

    .line 10
    .line 11
    const-string v1, "initRoomInfo live.id is Null"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "[live][trace_problem]"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    move-object v0, p4

    .line 26
    move-object p4, p3

    .line 27
    move p3, p2

    .line 28
    move-object p2, p1

    .line 29
    new-instance p1, Ll/jjd0;

    .line 30
    .line 31
    invoke-direct {p1, v0}, Ll/jjd0;-><init>(Ll/y20;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;->initRoomInfo()Ll/v3f$d;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance p0, Ll/vgd0;

    .line 45
    .line 46
    invoke-direct/range {p0 .. p5}, Ll/vgd0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ZLl/y20;Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
