.class public Ll/yc50;
.super Ll/uel0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/mc50;",
        ">",
        "Ll/uel0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public x:Ll/wnc0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uel0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u6(Ll/yc50;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yc50;->x6(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic v6(Ll/yc50;Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yc50;->w6(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    return-void
.end method

.method private synthetic x6(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bjs;->E4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public P5(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/uel0;->P5(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/wnc0;

    .line 5
    .line 6
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 7
    .line 8
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v1, Ll/nhs;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/nhs;->z()Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;

    .line 17
    .line 18
    invoke-direct {p1, v0, v1}, Ll/wnc0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Ll/wnc0;

    .line 26
    .line 27
    iput-object p1, p0, Ll/yc50;->x:Ll/wnc0;

    .line 28
    .line 29
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/uel0;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/mc50;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Ll/aj1;->T:Lrx/subjects/b;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/wc50;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/wc50;-><init>(Ll/yc50;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OfficialShowEvent:Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;->updateCurrentAnchor()Ll/v3f$c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lrx/c;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/xc50;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/xc50;-><init>(Ll/yc50;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public g6(Ll/lx50;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/bjs;->g6(Ll/lx50;Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ll/mc50;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/mc50;->S2()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Ll/yc50;->x:Ll/wnc0;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ll/mc50;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/mc50;->S2()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, p0}, Ll/wnc0;->J3(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bjs;->t()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/nhs;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/nhs;->z()Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->G0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic w6(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/nhs;->Z(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
