.class public Ll/ta50;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/mu40;",
        "Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Lv/VImage;

.field public j:Z

.field public k:Z

.field public l:Ll/s950;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;Lv/VImage;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/mu40;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;",
            "Lv/VImage;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/ta50;->j:Z

    .line 6
    .line 7
    iput-object p3, p0, Ll/ta50;->i:Lv/VImage;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic J3(Ll/ta50;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ta50;->Z3(Z)V

    return-void
.end method

.method public static synthetic K3(Ll/ta50;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ta50;->d4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic L3(Ll/ta50;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ta50;->j4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic M3(Ll/ta50;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ta50;->c4(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic N3(Ll/ta50;Ll/fa50;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ta50;->X3(Ll/fa50;)V

    return-void
.end method

.method public static synthetic O3(Ll/ta50;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ta50;->a4(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ll/ta50;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ta50;->e4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic R3(Ll/ta50;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ta50;->g4(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic S3(Ll/ta50;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ta50;->h4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic T3(Ll/ta50;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ta50;->Y3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic U3(Ll/ta50;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ta50;->i4(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic V3(Ll/ta50;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ta50;->f4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic W3(Ll/ta50;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ta50;->b4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private synthetic a4(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mu40;->O2()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ObsPreviewEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;->pushTypeChanged()Ll/v3f$d;

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
    new-instance v1, Ll/ga50;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/ga50;-><init>(Ll/ta50;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/ka50;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/ka50;-><init>(Ll/ta50;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final X3(Ll/fa50;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/jsv;->f()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/ta50;->i:Lv/VImage;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->q(Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Ll/mu40;

    .line 44
    .line 45
    invoke-virtual {v2}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->push:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->s(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/ta50;->l:Ll/s950;

    .line 57
    .line 58
    if-nez v0, :cond_0

    .line 59
    .line 60
    new-instance v0, Ll/s950;

    .line 61
    .line 62
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 63
    .line 64
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 65
    .line 66
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;

    .line 67
    .line 68
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->a:Landroid/widget/FrameLayout;

    .line 69
    .line 70
    invoke-direct {v0, v1, v2}, Ll/s950;-><init>(Ll/dum;Landroid/widget/FrameLayout;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Ll/s950;

    .line 78
    .line 79
    iput-object v0, p0, Ll/ta50;->l:Ll/s950;

    .line 80
    .line 81
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ObsPlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;->startObsPlay()Ll/v3f$d;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    iget-object p1, p1, Ll/fa50;->b:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    check-cast p0, Ll/mu40;

    .line 102
    .line 103
    sget-object p1, Ll/j2t;->c:Ll/j2t;

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Ll/mu40;->h(Ll/jsv;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final Y3(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/mu40;->O2()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->ObsPreviewEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;->onObsLiveStart()Ll/v3f$d;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lrx/c;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/na50;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/na50;-><init>(Ll/ta50;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->ObsPlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;->onVideoEnable()Ll/v3f$d;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lrx/c;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    new-instance v0, Ll/oa50;

    .line 70
    .line 71
    invoke-direct {v0, p0}, Ll/oa50;-><init>(Ll/ta50;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    const/4 v0, 0x0

    .line 86
    invoke-virtual {p0, p1, v0}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    new-instance v0, Ll/pa50;

    .line 91
    .line 92
    invoke-direct {v0, p0}, Ll/pa50;-><init>(Ll/ta50;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Ll/mu40;

    .line 107
    .line 108
    invoke-virtual {p1}, Ll/vp20;->l()Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    new-instance v0, Ll/qa50;

    .line 117
    .line 118
    invoke-direct {v0, p0}, Ll/qa50;-><init>(Ll/ta50;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->ObsPreviewEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;

    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;->onBackPressed()Ll/v3f$c;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    check-cast p1, Lrx/c;

    .line 143
    .line 144
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    new-instance v0, Ll/ra50;

    .line 149
    .line 150
    invoke-direct {v0, p0}, Ll/ra50;-><init>(Ll/ta50;)V

    .line 151
    .line 152
    .line 153
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 158
    .line 159
    .line 160
    :cond_0
    return-void
.end method

.method public final Z3(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Ll/ta50;->j:Z

    .line 2
    .line 3
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->n(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->p(Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/mu40;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/jsv;->f()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ll/mu40;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/jsv;->c()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-boolean v0, p0, Ll/ta50;->k:Z

    .line 51
    .line 52
    if-nez v0, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    if-nez p1, :cond_2

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->suspendLive()Ll/v3f$d;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->recoverLive()Ll/v3f$c;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 84
    .line 85
    .line 86
    :cond_3
    :goto_0
    return-void
.end method

.method public final synthetic b4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Ll/ta50;->k:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Ll/ta50;->k:Z

    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public final synthetic c4(Ll/uxj0;)V
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
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->notifyPushStreamReady()Ll/v3f$c;

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

.method public final synthetic d4(Ljava/lang/Throwable;)V
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
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->notifyPushStreamReady()Ll/v3f$c;

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

.method public final synthetic e4(Ll/jsv;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/jsv;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p0, Ll/ta50;->j:Z

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ll/mu40;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->v6(Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance v0, Ll/ia50;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/ia50;-><init>(Ll/ta50;)V

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/ja50;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/ja50;-><init>(Ll/ta50;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public final synthetic f4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/jsv;->f()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ta50;->k4()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic g4(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/mu40;

    .line 6
    .line 7
    sget-object v0, Ll/yct;->b:Ll/yct;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ll/mu40;->h(Ll/jsv;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->q(Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/ta50;->i:Lv/VImage;

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic h4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->q(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/ta50;->i:Lv/VImage;

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic i4(Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->notifyPushStreamReady()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/ta50;->i:Lv/VImage;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->i()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ll/mu40;

    .line 32
    .line 33
    sget-object p1, Ll/j2t;->c:Ll/j2t;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/mu40;->h(Ll/jsv;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic j4(Ljava/lang/Throwable;)V
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
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->notifyPushStreamReady()Ll/v3f$c;

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

.method public k4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L7(Ljava/lang/String;Z)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/la50;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/la50;-><init>(Ll/ta50;)V

    .line 23
    .line 24
    .line 25
    new-instance v2, Ll/ma50;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/ma50;-><init>(Ll/ta50;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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

.method public l4()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/ta50;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "OBS\u63a5\u5165\u540e\u5373\u53ef\u5f00\u64ad"

    .line 6
    .line 7
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/mu40;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->v6(Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/sa50;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/sa50;-><init>(Ll/ta50;)V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ll/ha50;

    .line 35
    .line 36
    invoke-direct {v2, p0}, Ll/ha50;-><init>(Ll/ta50;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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

.method public m4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "clipboard"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/content/ClipboardManager;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/mu40;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->push:Ljava/lang/String;

    .line 26
    .line 27
    const-string v1, "Label"

    .line 28
    .line 29
    invoke-static {v1, p0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 34
    .line 35
    .line 36
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->uc:I

    .line 37
    .line 38
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public n4()V
    .locals 1

    .line 1
    sget-object v0, Ll/efv;->u:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->d2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
