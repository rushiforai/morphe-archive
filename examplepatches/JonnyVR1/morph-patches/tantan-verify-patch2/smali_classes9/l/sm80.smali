.class public Ll/sm80;
.super Ll/i6t;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/c6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/sm80;",
        ">;",
        "Ll/iam;",
        "Ll/c6m;"
    }
.end annotation


# instance fields
.field public final i:Ll/kcg0;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->PreLoadEvent:Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;->cleanPreLoad()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lrx/c;

    .line 19
    .line 20
    new-instance v0, Ll/qm80;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/qm80;-><init>(Ll/sm80;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PreLoadEvent:Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;->preLoad()Ll/v3f$d;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lrx/c;

    .line 48
    .line 49
    new-instance v1, Ll/rm80;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/rm80;-><init>(Ll/sm80;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const/4 v1, 0x2

    .line 63
    new-array v1, v1, [Ll/kcg0;

    .line 64
    .line 65
    const/4 v2, 0x0

    .line 66
    aput-object p1, v1, v2

    .line 67
    .line 68
    const/4 p1, 0x1

    .line 69
    aput-object v0, v1, p1

    .line 70
    .line 71
    invoke-static {v1}, Ll/pcg0;->c([Ll/kcg0;)Ll/ft5;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iput-object p1, p0, Ll/sm80;->i:Ll/kcg0;

    .line 76
    .line 77
    return-void
.end method

.method public static synthetic J3(Ll/sm80;Ll/om80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sm80;->N3(Ll/om80;)V

    return-void
.end method

.method public static synthetic K3(Ll/sm80;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sm80;->M3(Ll/vxj0;)V

    return-void
.end method


# virtual methods
.method public L3()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/sm80;->j:Ljava/lang/String;

    .line 3
    .line 4
    iput-object v0, p0, Ll/sm80;->k:Ljava/lang/Boolean;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->restorePlayerView()Ll/v3f$c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic M3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sm80;->L3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic N3(Ll/om80;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Ll/om80;->a:Z

    .line 2
    .line 3
    iget-object p1, p1, Ll/om80;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ll/sm80;->O3(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public O3(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sm80;->j:Ljava/lang/String;

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
    iget-object v0, p0, Ll/sm80;->k:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-ne v0, p1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->restorePlayerView()Ll/v3f$c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v0, p0, Ll/sm80;->j:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Ll/sm80;->k:Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->prePlay()Ll/v3f$d;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public i1(Ll/k3m;)V
    .locals 0

    .line 1
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public m1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sm80;->i:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/sm80;->L3()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
