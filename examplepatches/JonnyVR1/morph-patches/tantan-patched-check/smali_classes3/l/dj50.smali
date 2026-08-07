.class public Ll/dj50;
.super Ll/xi5;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/hk50;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/hk50;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/xi5;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/dj50;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/dj50;->b:Ljava/util/ArrayList;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/data/OmsCounterEnvelope;)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/rj50;->e0()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, v1}, Ll/rj50;->w0(Z)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v0, v0, Ll/rj50;->f:Ll/lxd0;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsCounterEnvelope;->data:Lcom/p1/mobile/putong/data/OmsCounter;

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ll/lxd0;->i(Lcom/p1/mobile/putong/data/OmsCounter;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/data/OMSData;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/cj50;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cj50;-><init>(Lcom/p1/mobile/putong/data/OMSData;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/data/OMSConfigEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic C(ZLcom/p1/mobile/putong/data/OmsCounter;)Ll/x1d0;
    .locals 5

    .line 1
    sget-object v0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 8
    .line 9
    invoke-static {}, Ll/yp50;->d()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v3, Ll/uqb0;->w:Ll/byd0;

    .line 18
    .line 19
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const-string v4, "3.1.0"

    .line 24
    .line 25
    filled-new-array {v4, v2, p0, v3}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v2, "/oms/me/counters?version=%s&deviceID=%s&login=%b&reinstallTimestamp=%d"

    .line 30
    .line 31
    invoke-static {v1, v2, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0}, Ll/xi5;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/OmsCounter;->toJson()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public static synthetic x(ZLcom/p1/mobile/putong/data/OmsCounter;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/si20;

    .line 2
    .line 3
    new-instance v1, Ll/bj50;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/bj50;-><init>(ZLcom/p1/mobile/putong/data/OmsCounter;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/data/OmsCounterEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    invoke-direct {v0, v1, p0}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic y(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of p0, p0, Lcom/tantanapp/common/network/ApiExcep;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "network_state"

    .line 6
    .line 7
    const-string v0, "fail"

    .line 8
    .line 9
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {p0}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "e_oms_counters"

    .line 18
    .line 19
    const-string v1, ""

    .line 20
    .line 21
    invoke-static {v0, v1, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/data/OMSData;)Ll/x1d0;
    .locals 3

    .line 1
    sget-object v0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "/oms/me/counters?deviceID="

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/yp50;->d()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Ll/xi5;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSData;->toJson()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method


# virtual methods
.method public final D()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/DialogShowInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dj50;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/dj50;->b:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ll/hk50;

    .line 33
    .line 34
    new-instance v2, Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 35
    .line 36
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/DialogShowInfo;-><init>()V

    .line 37
    .line 38
    .line 39
    iget-object v3, v1, Ll/hk50;->a:Ljava/lang/String;

    .line 40
    .line 41
    iput-object v3, v2, Lcom/p1/mobile/putong/data/DialogShowInfo;->resourceId:Ljava/lang/String;

    .line 42
    .line 43
    iget v3, v1, Ll/hk50;->b:I

    .line 44
    .line 45
    iput v3, v2, Lcom/p1/mobile/putong/data/DialogShowInfo;->totalShownCount:I

    .line 46
    .line 47
    iget-wide v3, v1, Ll/hk50;->c:J

    .line 48
    .line 49
    iput-wide v3, v2, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 50
    .line 51
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    return-object v0
.end method

.method public final E()Lcom/p1/mobile/putong/data/OmsCounter;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/dj50;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsCounter;->new_()Lcom/p1/mobile/putong/data/OmsCounter;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/dj50;->a:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ll/hk50;

    .line 32
    .line 33
    iget-object v3, v0, Lcom/p1/mobile/putong/data/OmsCounter;->counters:Ljava/util/List;

    .line 34
    .line 35
    iget-object v4, v2, Ll/hk50;->a:Ljava/lang/String;

    .line 36
    .line 37
    iget v5, v2, Ll/hk50;->b:I

    .line 38
    .line 39
    iget-wide v6, v2, Ll/hk50;->c:J

    .line 40
    .line 41
    invoke-virtual {p0, v4, v5, v6, v7}, Ll/dj50;->I(Ljava/lang/String;IJ)Lcom/p1/mobile/putong/data/OMSCounterInfo;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    return-object v0
.end method

.method public F(Lcom/p1/mobile/putong/data/DialogShowInfo;)Lcom/p1/mobile/putong/data/OMSCounterInfo;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSConstraint;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSConstraint;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v0, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->totalShownCount:I

    .line 7
    .line 8
    int-to-long v0, v0

    .line 9
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/OMSConstraint;->count:J

    .line 10
    .line 11
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/OMSConstraint;->latestMs:J

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/data/OMSCounterInfo;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSCounterInfo;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v1, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->version:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSCounterInfo;->version:Ljava/lang/String;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->resourceId:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p1, v0, Lcom/p1/mobile/putong/data/OMSCounterInfo;->id:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p0, v0, Lcom/p1/mobile/putong/data/OMSCounterInfo;->constraint:Lcom/p1/mobile/putong/data/OMSConstraint;

    .line 29
    .line 30
    return-object v0
.end method

.method public final G()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dj50;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Ll/rj50;->e:Ll/lxd0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/dj50;->D()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Ll/lxd0;->j(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public H(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dj50;->G()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/dj50;->J(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final I(Ljava/lang/String;IJ)Lcom/p1/mobile/putong/data/OMSCounterInfo;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSCounterInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSCounterInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSCounterInfo;->id:Ljava/lang/String;

    .line 7
    .line 8
    new-instance p1, Lcom/p1/mobile/putong/data/OMSConstraint;

    .line 9
    .line 10
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/OMSConstraint;-><init>()V

    .line 11
    .line 12
    .line 13
    int-to-long v0, p2

    .line 14
    iput-wide v0, p1, Lcom/p1/mobile/putong/data/OMSConstraint;->count:J

    .line 15
    .line 16
    iput-wide p3, p1, Lcom/p1/mobile/putong/data/OMSConstraint;->latestMs:J

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSCounterInfo;->constraint:Lcom/p1/mobile/putong/data/OMSConstraint;

    .line 19
    .line 20
    return-object p0
.end method

.method public final J(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/dj50;->E()Lcom/p1/mobile/putong/data/OmsCounter;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OmsCounter;->counters:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsCounter;->new_()Lcom/p1/mobile/putong/data/OmsCounter;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v1, v1, Ll/rj50;->f:Ll/lxd0;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->showInfos:Ljava/util/Map;

    .line 42
    .line 43
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 62
    .line 63
    iget-object v3, v0, Lcom/p1/mobile/putong/data/OmsCounter;->counters:Ljava/util/List;

    .line 64
    .line 65
    invoke-virtual {p0, v2}, Ll/dj50;->F(Lcom/p1/mobile/putong/data/DialogShowInfo;)Lcom/p1/mobile/putong/data/OMSCounterInfo;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    invoke-virtual {p0, v0, p1}, Ll/dj50;->O(Lcom/p1/mobile/putong/data/OmsCounter;Z)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public K()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/pk50;->f()Ll/rj50;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Ll/rj50;->e:Ll/lxd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->showInfos:Ljava/util/Map;

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-gtz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public L()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/pk50;->f()Ll/rj50;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/rj50;->e0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/pk50;->f()Ll/rj50;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object p0, p0, Ll/rj50;->f:Ll/lxd0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->showInfos:Ljava/util/Map;

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-gtz p0, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return p0

    .line 42
    :cond_1
    :goto_0
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ll/pk50;->f()Ll/rj50;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Ll/rj50;->e0()Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_2

    .line 55
    .line 56
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ll/pk50;->f()Ll/rj50;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iget-object p0, p0, Ll/rj50;->f:Ll/lxd0;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    check-cast p0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->showInfos:Ljava/util/Map;

    .line 73
    .line 74
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 75
    .line 76
    .line 77
    :cond_2
    const/4 p0, 0x1

    .line 78
    return p0
.end method

.method public M(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hk50;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/dj50;->b:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public N(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hk50;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/dj50;->a:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/data/OmsCounter;Z)V
    .locals 1

    .line 1
    new-instance v0, Ll/xi50;

    .line 2
    .line 3
    invoke-direct {v0, p2, p1}, Ll/xi50;-><init>(ZLcom/p1/mobile/putong/data/OmsCounter;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "post_oms_counter"

    .line 7
    .line 8
    const/4 p2, -0x1

    .line 9
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p1, Ll/yi50;

    .line 14
    .line 15
    invoke-direct {p1}, Ll/yi50;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance p2, Ll/zi50;

    .line 19
    .line 20
    invoke-direct {p2}, Ll/zi50;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/data/OMSData;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/OMSData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/OMSConfigEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "default"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/dj50;->Q(Lcom/p1/mobile/putong/data/OMSData;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Q(Lcom/p1/mobile/putong/data/OMSData;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/OMSData;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/OMSConfigEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "oms_counter_refresh_"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    new-instance v0, Ll/aj50;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/aj50;-><init>(Lcom/p1/mobile/putong/data/OMSData;)V

    .line 18
    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p2, p1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
