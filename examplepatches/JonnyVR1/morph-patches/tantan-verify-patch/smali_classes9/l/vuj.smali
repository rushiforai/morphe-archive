.class public Ll/vuj;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/oo2;",
        ">",
        "Ll/i6t<",
        "TT;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+TT;>;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    iput-object p3, p0, Ll/vuj;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic J3(Ll/vuj;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vuj;->S3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic K3(Ll/vuj;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vuj;->R3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic L3(Ll/vuj;Ll/jne0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vuj;->O3(Ll/jne0;)V

    return-void
.end method

.method public static synthetic M3(Ll/vuj;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vuj;->P3(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic P3(Ljava/lang/Boolean;)V
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
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;->n()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic R3(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;->n()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic S3(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;->v()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public N3(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vuj;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;->c(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic O3(Ll/jne0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->onSengGiftFromMultipleGift()Ll/v3f$d;

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

.method public T()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T3(Ll/ib0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;

    .line 4
    .line 5
    new-instance v1, Ll/tuj;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/tuj;-><init>(Ll/vuj;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;->u(Ll/ib0;Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public U3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vuj;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;->f()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->giftDialogStatus()Ll/v3f$d;

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
    new-instance v1, Ll/nuj;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/nuj;-><init>(Ll/vuj;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->hideGiftOperationLayer()Ll/v3f$c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/puj;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/puj;-><init>(Ll/vuj;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->giftLongPressCancel()Ll/v3f$c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lrx/c;

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/ruj;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/ruj;-><init>(Ll/vuj;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    return-void
.end method
