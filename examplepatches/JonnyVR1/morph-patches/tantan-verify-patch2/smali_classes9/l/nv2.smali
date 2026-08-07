.class public Ll/nv2;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/qct<",
        "TD;>;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public final j:Ll/gx2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gx2<",
            "TD;>;"
        }
    .end annotation
.end field

.field public final k:Ll/tmi;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/tmi<",
            "TD;>;"
        }
    .end annotation
.end field

.field public final l:Ll/stw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/stw<",
            "TD;>;"
        }
    .end annotation
.end field

.field public m:Z


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/gx2;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/gx2;-><init>(Ll/dum;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/gx2;

    .line 14
    .line 15
    iput-object v0, p0, Ll/nv2;->j:Ll/gx2;

    .line 16
    .line 17
    new-instance v0, Ll/tmi;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Ll/tmi;-><init>(Ll/dum;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/tmi;

    .line 27
    .line 28
    iput-object v0, p0, Ll/nv2;->k:Ll/tmi;

    .line 29
    .line 30
    new-instance v0, Ll/stw;

    .line 31
    .line 32
    invoke-direct {v0, p1}, Ll/stw;-><init>(Ll/dum;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Ll/stw;

    .line 40
    .line 41
    iput-object p1, p0, Ll/nv2;->l:Ll/stw;

    .line 42
    .line 43
    return-void
.end method

.method public static synthetic J3(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Ll/zrv;->c:Ll/tyr;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tyr;->S()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic K3(Ll/nv2;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nv2;->b4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic L3(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "beauty"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic M3(Ll/nv2;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nv2;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)V

    return-void
.end method

.method public static synthetic N3(Ll/nv2;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nv2;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)V

    return-void
.end method

.method public static synthetic O3(Ll/nv2;Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nv2;->e4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;)V

    return-void
.end method

.method public static synthetic P3(Ll/nv2;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nv2;->d4(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic R3(Ll/nv2;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nv2;->c4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method

.method public static synthetic S3(Ll/nv2;Ll/hx2;)Ljava/util/Map;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nv2;->a4(Ll/hx2;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T3(Ll/nv2;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nv2;->g4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic U3(Ll/nv2;)Ll/gx2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nv2;->j:Ll/gx2;

    return-object p0
.end method

.method public static bridge synthetic V3(Ll/nv2;)Ll/tmi;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nv2;->k:Ll/tmi;

    return-object p0
.end method

.method public static bridge synthetic W3(Ll/nv2;)Ll/stw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nv2;->l:Ll/stw;

    return-object p0
.end method

.method private X3()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/yec0;->o:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 13
    .line 14
    new-instance v1, Ll/c0s;

    .line 15
    .line 16
    invoke-direct {v1, p0, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Ll/iv2;

    .line 20
    .line 21
    invoke-direct {v2, v1}, Ll/iv2;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0, v2}, Ll/nv2;->Y3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/jv2;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/jv2;-><init>(Ll/nv2;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 33
    .line 34
    .line 35
    return-object v1
.end method

.method private h4()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/nv2;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/nv2;->m:Z

    .line 8
    .line 9
    new-instance v1, Ll/k210;

    .line 10
    .line 11
    const/16 v2, 0x9c4

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ll/k210;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/uzl;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-interface {v1}, Ll/uzl;->v()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    invoke-interface {v1}, Ll/uzl;->v()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/kv2;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/kv2;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/lv2;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/lv2;-><init>(Ll/nv2;)V

    .line 54
    .line 55
    .line 56
    new-instance v2, Ll/mv2;

    .line 57
    .line 58
    invoke-direct {v2, p0}, Ll/mv2;-><init>(Ll/nv2;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    :cond_1
    :goto_0
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->showDialog()Ll/v3f$d;

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
    new-instance v1, Ll/cv2;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/cv2;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/ev2;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/ev2;-><init>(Ll/nv2;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    new-instance v0, Ll/fv2;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ll/fv2;-><init>(Ll/nv2;)V

    .line 48
    .line 49
    .line 50
    const-class v1, Ll/hx2;

    .line 51
    .line 52
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BeautyEvent:Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;->loadBeautyConfig()Ll/v3f$c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lrx/c;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/gv2;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/gv2;-><init>(Ll/nv2;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->hangUpSelfCall()Ll/v3f$d;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Lrx/c;

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    new-instance v1, Ll/hv2;

    .line 108
    .line 109
    invoke-direct {v1, p0}, Ll/hv2;-><init>(Ll/nv2;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 117
    .line 118
    .line 119
    invoke-direct {p0}, Ll/nv2;->h4()V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public Y3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nv2;->j:Ll/gx2;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/gx2;->g4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/nv2;->k:Ll/tmi;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/tmi;->Y3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/nv2;->l:Ll/stw;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/stw;->c4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/nv2$a;

    .line 17
    .line 18
    invoke-direct {v0, p0, p1, p2}, Ll/nv2$a;-><init>(Ll/nv2;Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->setOnEmptyFlingListener(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;)V

    .line 22
    .line 23
    .line 24
    new-instance p2, Ll/nv2$b;

    .line 25
    .line 26
    invoke-direct {p2, p0}, Ll/nv2$b;-><init>(Ll/nv2;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->setOnContrastListener(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;)V

    .line 30
    .line 31
    .line 32
    new-instance p2, Ll/dv2;

    .line 33
    .line 34
    invoke-direct {p2, p0, p1}, Ll/dv2;-><init>(Ll/nv2;Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->setOnPageChangeAction(Ll/y20;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/nv2;->j:Ll/gx2;

    .line 41
    .line 42
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic Z3(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nv2;->i4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic a4(Ll/hx2;)Ljava/util/Map;
    .locals 1

    .line 1
    new-instance p1, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/nv2;->j:Ll/gx2;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/gx2;->W3()Ljava/util/Map;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {p1, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/nv2;->k:Ll/tmi;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/tmi;->R3()Ljava/util/Map;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {p1, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/nv2;->l:Ll/stw;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/stw;->V3()Ljava/util/Map;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p1, p0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 31
    .line 32
    .line 33
    return-object p1
.end method

.method public final synthetic b4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nv2;->h4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic c4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/nv2;->i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/nv2;->i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic d4(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->dismissBeautyDialog()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic e4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->BEAUTY:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    iget-object p2, p0, Ll/nv2;->j:Ll/gx2;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->setOnSecondSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/nv2;->j:Ll/gx2;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/gx2;->j4()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->MAKE_UP:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 21
    .line 22
    if-ne p2, v0, :cond_1

    .line 23
    .line 24
    iget-object p2, p0, Ll/nv2;->l:Ll/stw;

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p0, Ll/nv2;->l:Ll/stw;

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->setOnSecondSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/nv2;->l:Ll/stw;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/stw;->e4()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    iget-object p2, p0, Ll/nv2;->k:Ll/tmi;

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->setOnSecondSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/nv2;->k:Ll/tmi;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/tmi;->a4()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic f4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/nv2;->m:Z

    .line 3
    .line 4
    new-instance v0, Ll/k210;

    .line 5
    .line 6
    const/16 v1, 0x8ff

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/k210;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/uzl;

    .line 16
    .line 17
    invoke-static {}, Ll/coi;->o()Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {}, Ll/coi;->q()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v0, v1, v2}, Ll/uzl;->z(Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/nv2;->j:Ll/gx2;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->beautyConfig:Ljava/util/List;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/gx2;->X3(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/nv2;->k:Ll/tmi;

    .line 36
    .line 37
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->filterConfig:Ljava/util/List;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/tmi;->S3(Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/nv2;->l:Ll/stw;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->makeUpConfig:Ljava/util/List;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/stw;->W3(Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic g4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/nv2;->m:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/nv2;->k:Ll/tmi;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/tmi;->T3()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/nv2;->l:Ll/stw;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/stw;->X3()V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v0, "beauty filter failed:"

    .line 17
    .line 18
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    const-string p1, "null"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p1, "[live]beauty_filter"

    .line 38
    .line 39
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public i4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nv2;->i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ll/nv2;->X3()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/nv2;->i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/nv2;->i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 14
    .line 15
    .line 16
    return-void
.end method
