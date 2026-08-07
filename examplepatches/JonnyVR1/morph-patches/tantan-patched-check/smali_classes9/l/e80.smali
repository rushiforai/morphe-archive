.class public abstract Ll/e80;
.super Ll/kf2;
.source "SourceFile"

# interfaces
.implements Ll/mqk;
.implements Ll/ztf0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Ll/kf2<",
        "TV;>;",
        "Ll/mqk;",
        "Ll/ztf0;"
    }
.end annotation


# instance fields
.field public q:Z

.field public final r:I

.field public final s:I

.field public final t:Ljava/lang/String;

.field public final u:Ljava/lang/String;

.field public v:I

.field public final w:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/vxj0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/kf2;-><init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/e80;->v:I

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/e80;->w:Lrx/subjects/b;

    .line 12
    .line 13
    iput p4, p0, Ll/e80;->r:I

    .line 14
    .line 15
    iput p5, p0, Ll/e80;->s:I

    .line 16
    .line 17
    iput-object p6, p0, Ll/e80;->t:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p7, p0, Ll/e80;->u:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic i4(Ll/e80;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e80;->l4(Z)V

    return-void
.end method


# virtual methods
.method public T3()V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    const/16 v0, 0xa8c

    .line 2
    .line 3
    iput v0, p0, Ll/kf2;->m:I

    .line 4
    .line 5
    return-void
.end method

.method public final U3()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->addModelToSettingAdapter()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public V3(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kf2;->g4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->dismissSettingDialog()Ll/v3f$c;

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

.method public W3()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->removeModelToSettingAdapter()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public X1()I
    .locals 0

    .line 1
    iget p0, p0, Ll/e80;->s:I

    .line 2
    .line 3
    return p0
.end method

.method public Z3()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kf2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 4
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
    iget-object v0, p0, Ll/kf2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x3

    .line 20
    if-lt v0, v1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/kf2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 25
    .line 26
    const/4 v0, 0x2

    .line 27
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ljava/lang/String;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_0
    const-string p0, ""

    .line 35
    .line 36
    return-object p0
.end method

.method public final b4(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v1, Ll/d80;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/d80;-><init>(Ll/e80;Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d4(Landroid/view/View;)V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/kf2;->d4(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kf2;->k:Landroid/view/View;

    .line 5
    .line 6
    new-instance v0, Ll/c80;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/c80;-><init>(Ll/e80;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/kf2;->k:Landroid/view/View;

    .line 15
    .line 16
    instance-of v0, p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDot;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDot;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/kf2;->f4()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDot;->g0(Z)V

    .line 27
    .line 28
    .line 29
    new-instance p1, Ll/ym3;

    .line 30
    .line 31
    iget v0, p0, Ll/kf2;->m:I

    .line 32
    .line 33
    invoke-direct {p1, v0}, Ll/ym3;-><init>(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/kf2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ll/ym3;->e(Ljava/lang/String;)Ll/ym3;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Ljava/lang/Boolean;

    .line 49
    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_0

    .line 57
    .line 58
    iget-object p1, p0, Ll/kf2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 59
    .line 60
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableNewlyEffect:Z

    .line 61
    .line 62
    if-eqz p1, :cond_0

    .line 63
    .line 64
    iget-object p1, p0, Ll/kf2;->k:Landroid/view/View;

    .line 65
    .line 66
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDot;

    .line 67
    .line 68
    const/4 v0, 0x1

    .line 69
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDot;->O(Z)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    iget-object p1, p0, Ll/kf2;->k:Landroid/view/View;

    .line 74
    .line 75
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDot;

    .line 76
    .line 77
    const/4 v0, 0x0

    .line 78
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDot;->O(Z)V

    .line 79
    .line 80
    .line 81
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/kf2;->k:Landroid/view/View;

    .line 82
    .line 83
    sget v0, Ll/mdc0;->A5:I

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    if-eqz p1, :cond_2

    .line 90
    .line 91
    iget-object p1, p0, Ll/kf2;->k:Landroid/view/View;

    .line 92
    .line 93
    sget v0, Ll/mdc0;->A5:I

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    instance-of p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomViewGroup;

    .line 100
    .line 101
    if-eqz p1, :cond_2

    .line 102
    .line 103
    iget-object p1, p0, Ll/kf2;->k:Landroid/view/View;

    .line 104
    .line 105
    sget v0, Ll/mdc0;->A5:I

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomViewGroup;

    .line 112
    .line 113
    iget-object p0, p0, Ll/e80;->u:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomViewGroup;->setStyle(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_2
    return-void
.end method

.method public getOrder()I
    .locals 0

    .line 1
    iget p0, p0, Ll/e80;->r:I

    .line 2
    .line 3
    return p0
.end method

.method public isFirst()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/e80;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public j4()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kf2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public k4()Z
    .locals 0

    .line 1
    iget p0, p0, Ll/e80;->v:I

    .line 2
    .line 3
    if-lez p0, :cond_0

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

.method public final synthetic l4(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->addModelToSettingAdapter()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->removeModelToSettingAdapter()Ll/v3f$d;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/e80;->m4()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public m4()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 3
    .line 4
    iget-object p0, p0, Ll/e80;->w:Lrx/subjects/b;

    .line 5
    .line 6
    sget-object v0, Ll/vxj0;->a:Ll/vxj0;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public r1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e80;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public z0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/e80;->q:Z

    .line 2
    .line 3
    return-void
.end method
