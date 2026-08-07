.class public Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveCounterApi;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveCounter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->liveCounters:Lcom/p1/mobile/putong/live/base/data/BLiveCounter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveCounter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->liveCounters:Lcom/p1/mobile/putong/live/base/data/BLiveCounter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCounter;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/fk3;->e(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic d(ZLcom/p1/mobile/putong/live/base/data/BLiveCounter;)V
    .locals 0

    .line 1
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->ignoredByLiveActivitiesModule:Z

    .line 2
    .line 3
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 4
    .line 5
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/fk3;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/fk3;->e(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveCounter;
    .locals 2

    .line 1
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/fk3;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->liveCounters:Lcom/p1/mobile/putong/live/base/data/BLiveCounter;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/fk3;->e(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->liveCounters:Lcom/p1/mobile/putong/live/base/data/BLiveCounter;

    .line 15
    .line 16
    return-object p0
.end method

.method public static patchReddot(Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCounter;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/live-counters"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/rnl;->p()Ll/rnl$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "intent"

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "patchReddot"

    .line 28
    .line 29
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v1, ""

    .line 40
    .line 41
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLivePostNetReqObs(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance v0, Ll/cwn;

    .line 46
    .line 47
    invoke-direct {v0}, Ll/cwn;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public static refreshLiveCounter()V
    .locals 1

    const/4 v0, 0x0

    .line 44
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveCounterApi;->refreshLiveCounter(Z)V

    return-void
.end method

.method public static refreshLiveCounter(Z)V
    .locals 2

    .line 1
    const-string v0, "/live-counters"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "refreshLiveCounter"

    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/yvn;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/yvn;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/zvn;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/zvn;-><init>(Z)V

    .line 29
    .line 30
    .line 31
    new-instance p0, Ll/awn;

    .line 32
    .line 33
    invoke-direct {p0}, Ll/awn;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static requestLiveCounter()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCounter;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/live-counters"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    new-array v1, v1, [Ll/st0;

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "requestLiveCounter"

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/bwn;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/bwn;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    return-object v0
.end method
