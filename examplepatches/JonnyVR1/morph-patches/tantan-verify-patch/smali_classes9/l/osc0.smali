.class public Ll/osc0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/jxd0;",
            ">;"
        }
    .end annotation
.end field

.field public l:Z

.field public m:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

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
    iput-object p1, p0, Ll/osc0;->j:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/osc0;->k:Ljava/util/Map;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Ll/osc0;->l:Z

    .line 20
    .line 21
    const-string p1, "layered"

    .line 22
    .line 23
    iput-object p1, p0, Ll/osc0;->m:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic J3(Ll/osc0;Ll/gve0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/osc0;->Y3(Ll/gve0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/osc0;Ll/fve0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/osc0;->X3(Ll/fve0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic M3(Ll/osc0;Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/osc0;->b4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic N3(Ljava/lang/Integer;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->id:I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic O3(Ll/osc0;Ll/bsc0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/osc0;->V3(Ll/bsc0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ll/osc0;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/osc0;->a4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    return-void
.end method

.method public static synthetic R3(Ll/osc0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/osc0;->Z3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic S3(Ll/osc0;Ll/ym3;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/osc0;->W3(Ll/ym3;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private synthetic Z3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/osc0;->d4()Ll/jxd0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
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
    new-instance v0, Ll/fsc0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/fsc0;-><init>(Ll/osc0;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/bsc0;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/gsc0;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/gsc0;-><init>(Ll/osc0;)V

    .line 17
    .line 18
    .line 19
    const-class v1, Ll/ym3;

    .line 20
    .line 21
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/hsc0;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/hsc0;-><init>(Ll/osc0;)V

    .line 27
    .line 28
    .line 29
    const-class v1, Ll/fve0;

    .line 30
    .line 31
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/isc0;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/isc0;-><init>(Ll/osc0;)V

    .line 37
    .line 38
    .line 39
    const-class v1, Ll/gve0;

    .line 40
    .line 41
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->onClearSignRedDot()Ll/v3f$c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lrx/c;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/jsc0;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/jsc0;-><init>(Ll/osc0;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->markButtonClicked()Ll/v3f$d;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lrx/c;

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/ksc0;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/ksc0;-><init>(Ll/osc0;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public T3(Ljava/lang/String;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/osc0;->k:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jxd0;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/jxd0;

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "button_clicked_"

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 24
    .line 25
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/osc0;->k:Ljava/util/Map;

    .line 42
    .line 43
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    :cond_0
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Ljava/lang/Boolean;

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    return p0
.end method

.method public U3(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/osc0;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->t()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/lsc0;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/lsc0;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 17
    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableRedDot:Z

    .line 23
    .line 24
    return p0
.end method

.method public final synthetic V3(Ll/bsc0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/bsc0;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/osc0;->U3(Ljava/lang/String;)Z

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

.method public final synthetic W3(Ll/ym3;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/ym3;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/osc0;->T3(Ljava/lang/String;)Z

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

.method public final synthetic X3(Ll/fve0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/osc0;->l:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic Y3(Ll/gve0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/osc0;->d4()Ll/jxd0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Boolean;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic a4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/osc0;->c4(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic b4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->v()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->buttons:Ljava/util/List;

    .line 6
    .line 7
    new-instance v0, Ll/nsc0;

    .line 8
    .line 9
    invoke-direct {v0, p2}, Ll/nsc0;-><init>(Ljava/lang/Integer;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/osc0;->j:Ljava/util/List;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public c4(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/osc0;->k:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jxd0;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/jxd0;

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "button_clicked_"

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 24
    .line 25
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/osc0;->k:Ljava/util/Map;

    .line 42
    .line 43
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    :cond_0
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    new-instance v0, Ll/zit;

    .line 52
    .line 53
    invoke-direct {v0, p1}, Ll/zit;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, v0, Ll/hyr;->a:Ljava/lang/String;

    .line 57
    .line 58
    const-string v1, "setting"

    .line 59
    .line 60
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    iget-object v0, p0, Ll/osc0;->m:Ljava/lang/String;

    .line 67
    .line 68
    const-string v1, "layered"

    .line 69
    .line 70
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->setSettingButtonRedDot()Ll/v3f$d;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    const/4 v0, 0x1

    .line 92
    iput-boolean v0, p0, Ll/osc0;->l:Z

    .line 93
    .line 94
    :cond_1
    iget-object v0, p0, Ll/osc0;->j:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_2

    .line 101
    .line 102
    iget-object p1, p0, Ll/osc0;->m:Ljava/lang/String;

    .line 103
    .line 104
    const-string v0, "interaction"

    .line 105
    .line 106
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eqz p1, :cond_2

    .line 111
    .line 112
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->refreshSettingButtonRedDot()Ll/v3f$c;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 123
    .line 124
    .line 125
    :cond_2
    return-void
.end method

.method public final d4()Ll/jxd0;
    .locals 3

    .line 1
    sget-object p0, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    new-instance v0, Ljava/util/Date;

    .line 4
    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Ll/jxd0;

    .line 17
    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v2, "sign_clear"

    .line 21
    .line 22
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-direct {v0, p0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;Z)V

    .line 45
    .line 46
    .line 47
    return-object v0
.end method

.method public e4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/osc0;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->v()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->n()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/osc0;->m:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->v()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableSettingButton:Z

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->v()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->v()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->settingZone:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->v()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->settingZone:Ljava/util/List;

    .line 52
    .line 53
    new-instance v1, Ll/msc0;

    .line 54
    .line 55
    invoke-direct {v1, p0, p1}, Ll/msc0;-><init>(Ll/osc0;Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/osc0;->k:Ljava/util/Map;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
