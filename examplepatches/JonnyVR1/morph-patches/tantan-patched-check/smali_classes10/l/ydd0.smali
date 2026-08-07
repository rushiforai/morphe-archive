.class public final Ll/ydd0;
.super Ll/hj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/hj2<",
        "TD;",
        "Ll/tdd0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0018\u0000*\u0008\u0008\u0000\u0010\u0002*\u00020\u00012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00040\u0003B\u0015\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\u000c\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Ll/ydd0;",
        "Ll/oo2;",
        "D",
        "Ll/hj2;",
        "Ll/tdd0;",
        "Ll/dum;",
        "info",
        "<init>",
        "(Ll/dum;)V",
        "",
        "t",
        "()V",
        "T3",
        "()Ll/tdd0;",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .param p1    # Ll/dum;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/hj2;-><init>(Ll/dum;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static O3(Ll/ydd0;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/tdd0;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static P3(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static R3(Ll/ydd0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hj2;->L3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/hj2;->N3()V

    .line 5
    .line 6
    .line 7
    sget-object p1, Ll/bf10;->INSTANCE:Ll/bf10;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ll/bf10;->f0(Ll/i6t;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static S3(Ll/ydd0;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/tdd0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/tdd0;->w(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public bridge synthetic K3()Ll/isl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ydd0;->T3()Ll/tdd0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public T3()Ll/tdd0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Ll/tdd0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/tdd0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/bf10;->INSTANCE:Ll/bf10;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/bf10;->f0(Ll/i6t;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->showAnnouncementDlg()Ll/v3f$d;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lrx/c;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/udd0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/udd0;-><init>(Ll/ydd0;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    invoke-direct {v0, v1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->announcementData()Ll/v3f$d;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lrx/c;

    .line 62
    .line 63
    new-instance v1, Ll/vdd0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/vdd0;-><init>(Ll/ydd0;)V

    .line 66
    .line 67
    .line 68
    new-instance v2, Ll/wdd0;

    .line 69
    .line 70
    invoke-direct {v2, v1}, Ll/wdd0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Ll/xdd0;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/xdd0;-><init>(Ll/ydd0;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 91
    .line 92
    .line 93
    return-void
.end method
