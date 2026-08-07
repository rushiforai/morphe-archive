.class public Ll/qz50;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/oo2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ll/qz50;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qz50;->K3()V

    return-void
.end method


# virtual methods
.method public final synthetic K3()V
    .locals 2

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, v0, Ll/hiv;->i:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->REFRESH_UNIT:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/oo2;->G1(Lcom/p1/mobile/putong/live/base/data/BLiveOperation;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public L3(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->showOperationsItem()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/q260$a;

    .line 12
    .line 13
    const/16 v2, 0x1fa4

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ll/q260$a;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p1}, Ll/q260$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/q260$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/q260$a;->a()Ll/q260;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    new-instance p1, Ll/pz50;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Ll/pz50;-><init>(Ll/qz50;)V

    .line 32
    .line 33
    .line 34
    const-wide/16 v0, 0x1f4

    .line 35
    .line 36
    invoke-virtual {p0, v0, v1, p1}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
