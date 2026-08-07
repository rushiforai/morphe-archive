.class public Ll/uav;
.super Ll/dvs;
.source "SourceFile"

# interfaces
.implements Ll/sm50;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dvs<",
        "Ll/yav;",
        ">;",
        "Ll/sm50;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonVoiceView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dvs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/yav;

    .line 5
    .line 6
    invoke-direct {p1, p3}, Ll/yav;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonVoiceView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic P2(Ll/uav;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uav;->Z2(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic Q2(Ll/uav;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uav;->c3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic R2(Ll/uav;Ll/vxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uav;->a3(Ll/vxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic T2(Ll/uav;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uav;->b3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic U2(Ll/uav;Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uav;->X2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V2(Ll/uav;Lcom/p1/mobile/android/app/c;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uav;->Y2(Lcom/p1/mobile/android/app/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method private synthetic X2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    new-instance p1, Ll/jcs;

    .line 2
    .line 3
    invoke-direct {p1}, Ll/jcs;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/lang/Boolean;

    .line 11
    .line 12
    return-object p0
.end method

.method private synthetic Z2(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/yav;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mus;->H2()Ll/nus;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0, p1}, Ll/yav;->p(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic b3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/uav;->d3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private d3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/uav;->W2()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/tav;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/tav;-><init>(Ll/uav;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public S(ZLjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/yav;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/yav;->e(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/mqr;->m()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/cyr;->lifecycle()Lrx/c;

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
    new-instance v1, Ll/nav;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/nav;-><init>(Ll/uav;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/oav;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/oav;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/pav;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/pav;-><init>(Ll/uav;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/qav;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/qav;-><init>(Ll/uav;)V

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
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeMenuEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->refresh()Ll/v3f$c;

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
    new-instance v1, Ll/rav;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/rav;-><init>(Ll/uav;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/sav;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/sav;-><init>(Ll/uav;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    :cond_0
    return-void
.end method

.method public final W2()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->getVoiceSquareButtons()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic Y2(Lcom/p1/mobile/android/app/c;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uav;->W2()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic a3(Ll/vxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    new-instance p1, Ll/jcs;

    .line 2
    .line 3
    invoke-direct {p1}, Ll/jcs;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/lang/Boolean;

    .line 11
    .line 12
    return-object p0
.end method

.method public b2(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "fakeLiveSquare"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic c3(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/yav;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mus;->H2()Ll/nus;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0, p1}, Ll/yav;->p(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
