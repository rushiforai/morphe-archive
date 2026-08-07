.class public Ll/it70;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/dw40;",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/dw40;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;",
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
    return-void
.end method

.method public static synthetic J3(Ll/it70;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/it70;->L3(Ljava/lang/Long;)V

    return-void
.end method


# virtual methods
.method public K3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->e()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic L3(Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3

    .line 6
    .line 7
    cmp-long p1, v0, v2

    .line 8
    .line 9
    if-ltz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->m()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/it70;->i:Ll/kcg0;

    .line 19
    .line 20
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public M3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->k(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/it70;->i:Ll/kcg0;

    .line 13
    .line 14
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ll/dw40;

    .line 22
    .line 23
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/ht70;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/ht70;-><init>(Ll/it70;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Ll/it70;->i:Ll/kcg0;

    .line 47
    .line 48
    return-void
.end method

.method public N3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getPkBountyData()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->k(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/it70;->i:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/it70;->K3()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
