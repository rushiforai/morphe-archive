.class public Ll/lc50;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/dw40;",
        "Ll/gc50;",
        ">;"
    }
.end annotation


# instance fields
.field public final j:Ll/xak0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/dw40;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/xak0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/xak0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/lc50;->j:Ll/xak0;

    .line 10
    .line 11
    new-instance p1, Ll/gc50;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/gc50;-><init>(Ll/lc50;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic S3(Ll/lc50;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lc50;->W3()V

    return-void
.end method

.method public static synthetic T3(Ll/lc50;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lc50;->Y3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic U3(Ll/lc50;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lc50;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method


# virtual methods
.method public O3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/lc50;->j:Ll/xak0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xak0;->b()V

    .line 7
    .line 8
    .line 9
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OfficialShowCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowCardEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowCardEvent;->show()Ll/v3f$d;

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
    new-instance v1, Ll/ic50;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/ic50;-><init>(Ll/lc50;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public V3()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/dw40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, Ll/kc50;

    .line 12
    .line 13
    invoke-direct {v2, p0}, Ll/kc50;-><init>(Ll/lc50;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    const-string v3, "OfficialShowCardDialog"

    .line 18
    .line 19
    invoke-virtual {v0, p0, v1, v3, v2}, Ll/oo2;->e0(ZLjava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic W3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/gc50;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gc50;->K()V

    .line 6
    .line 7
    .line 8
    const-string p0, "\u8ba2\u9605\u6210\u529f"

    .line 9
    .line 10
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/gc50;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowUser:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/gc50;->L(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/lc50;->j:Ll/xak0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ll/dw40;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Ll/dw40;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 35
    .line 36
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    const/4 v6, 0x0

    .line 43
    const/4 v7, 0x1

    .line 44
    const-string v2, "p_live_profile"

    .line 45
    .line 46
    invoke-virtual/range {v1 .. v7}, Ll/xak0;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final Y3(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/dw40;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->m7(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/jc50;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/jc50;-><init>(Ll/lc50;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method
