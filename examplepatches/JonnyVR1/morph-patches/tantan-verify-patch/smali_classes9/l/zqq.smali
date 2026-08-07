.class public Ll/zqq;
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
.field public i:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

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
    iput-object p1, p0, Ll/zqq;->i:Ljava/util/Map;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic J3(Ll/zqq;Ll/qqq;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zqq;->O3(Ll/qqq;)V

    return-void
.end method

.method public static synthetic K3(Ll/zqq;Ll/frq;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zqq;->P3(Ll/frq;)V

    return-void
.end method

.method public static synthetic L3(Ll/zqq;Ll/iqq;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zqq;->R3(Ll/iqq;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;)V

    return-void
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;->callJs:Ll/z20;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic O3(Ll/qqq;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/qqq;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/zqq;->U3(Ll/qqq;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p1}, Ll/qqq;->c()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/zqq;->S3(Ll/qqq;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public final synthetic P3(Ll/frq;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/frq;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/frq;->c()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->dismiss()Ll/v3f$c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ll/frq;->a()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "js"

    .line 32
    .line 33
    invoke-static {p0, p1, v0}, Ll/jlk0;->j(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic R3(Ll/iqq;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/zqq;->i:Ljava/util/Map;

    .line 11
    .line 12
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;->name:Ljava/lang/String;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final S3(Ll/qqq;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/qqq;->a()Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/zqq;->i:Ljava/util/Map;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;->name:Ljava/lang/String;

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/zqq;->i:Ljava/util/Map;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;->name:Ljava/lang/String;

    .line 26
    .line 27
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->nativeDialogController()Ll/v3f$d;

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
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/uqq;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/uqq;-><init>(Ll/zqq;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->userCardController()Ll/v3f$d;

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
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/vqq;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/vqq;-><init>(Ll/zqq;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final T3(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;->types:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/zqq;->i:Ljava/util/Map;

    .line 19
    .line 20
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;->name:Ljava/lang/String;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v1, Ll/yec0;->V2:I

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;

    .line 51
    .line 52
    new-instance v1, Ll/iqq;

    .line 53
    .line 54
    invoke-direct {v1, p0, v0}, Ll/iqq;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 55
    .line 56
    .line 57
    new-instance v2, Ll/wqq;

    .line 58
    .line 59
    invoke-direct {v2, v0}, Ll/wqq;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 63
    .line 64
    .line 65
    new-instance v2, Ll/xqq;

    .line 66
    .line 67
    invoke-direct {v2, p1}, Ll/xqq;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;)V

    .line 68
    .line 69
    .line 70
    new-instance v3, Ll/yqq;

    .line 71
    .line 72
    invoke-direct {v3, p0, v1, p1}, Ll/yqq;-><init>(Ll/zqq;Ll/iqq;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, p1, p2, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;->g(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;Ljava/lang/String;Ll/z20;Ll/x20;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/zqq;->i:Ljava/util/Map;

    .line 82
    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;->name:Ljava/lang/String;

    .line 84
    .line 85
    invoke-interface {p0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    :cond_2
    :goto_0
    return-void
.end method

.method public final U3(Ll/qqq;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/qqq;->a()Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p1}, Ll/qqq;->b()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, v0, p1}, Ll/zqq;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogConfig;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/zqq;->i:Ljava/util/Map;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
