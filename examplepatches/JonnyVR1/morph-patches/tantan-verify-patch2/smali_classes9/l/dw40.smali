.class public Ll/dw40;
.super Ll/oo2;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/ew40;Ll/ajt;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/oo2;-><init>(Ll/ipl;Ll/ajt;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o2(Ll/dw40;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dw40;->C2(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic p2(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic q2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r2(Ll/dw40;ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dw40;->F2(ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic s2(Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->reference:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u2(Ljava/util/HashMap;Ll/nsv;)Ll/nsv;
    .locals 5

    .line 1
    iget-object v0, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->reference:Ljava/lang/String;

    .line 6
    .line 7
    sget-object v1, Ll/htd0;->b:Ll/htd0;

    .line 8
    .line 9
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ll/jfv;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p1, v1}, Ll/nsv;->a(Lcom/p1/mobile/putong/data/User;)Ll/nsv;

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ll/vwt;->u7()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-static {p1}, Ll/iek0;->b(Ll/nsv;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    invoke-static {p1}, Ll/iek0;->a(Ll/nsv;)Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    iget-object v1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 49
    .line 50
    sget-object v2, Ll/htd0;->c:Ll/htd0;

    .line 51
    .line 52
    invoke-static {v2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Ll/hiv;

    .line 57
    .line 58
    invoke-static {p1}, Ll/iek0;->a(Ll/nsv;)Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 63
    .line 64
    iget-wide v3, v3, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 65
    .line 66
    invoke-virtual {v2, v3, v4}, Ll/hiv;->v(J)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 71
    .line 72
    :cond_0
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_1

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 83
    .line 84
    invoke-virtual {p1, p0}, Ll/nsv;->e(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/nsv;

    .line 85
    .line 86
    .line 87
    :cond_1
    return-object p1
.end method

.method public static synthetic v2(Ll/dw40;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dw40;->D2(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic w2(Ll/dw40;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dw40;->E2(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic x2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic y2(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static z2(Ljava/util/List;Ljava/util/List;)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ">;)",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/aw40;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/aw40;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/bw40;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/bw40;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v0, v1}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/cw40;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/cw40;-><init>(Ljava/util/HashMap;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;->convert(Ljava/util/List;Ll/qcj;)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method


# virtual methods
.method public A0()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live"

    .line 2
    .line 3
    return-object p0
.end method

.method public A2()Ll/ew40;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vp20;->a:Ll/ipl;

    .line 2
    .line 3
    check-cast p0, Ll/ew40;

    .line 4
    .line 5
    return-object p0
.end method

.method public B2()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/dw40;->A2()Ll/ew40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ew40;->e()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->EMPTY:Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public C0()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "room"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic C2(Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oo2;->z:Ll/p1w;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p1w;->n()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic D2(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/oo2;->z:Ll/p1w;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p1w;->n()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->managers:Ljava/util/List;

    .line 12
    .line 13
    new-instance v1, Ll/xv40;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/xv40;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic E2(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->members:Ljava/util/List;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/oo2;->h:Lrx/subjects/a;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/dw40;->z2(Ljava/util/List;Ljava/util/List;)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic F2(ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oo2;->z:Ll/p1w;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveChatMessages:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/p1w;->s(ZLjava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public K1(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/rooms/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, "/managers"

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v0, "refreshRoomManager"

    .line 29
    .line 30
    invoke-static {p1, v0}, Ll/vrv;->w(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Ll/sv40;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/sv40;-><init>(Ll/dw40;)V

    .line 37
    .line 38
    .line 39
    new-instance p0, Ll/uv40;

    .line 40
    .line 41
    invoke-direct {p0}, Ll/uv40;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public N1(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->K4()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/oo2;->u:I

    .line 10
    .line 11
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->i7(Ljava/lang/String;I)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/yv40;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/yv40;-><init>(Ll/dw40;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/zv40;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/zv40;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public O1(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->j7(ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance p3, Ll/vv40;

    .line 6
    .line 7
    invoke-direct {p3, p0, p1}, Ll/vv40;-><init>(Ll/dw40;Z)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Ll/wv40;

    .line 11
    .line 12
    invoke-direct {p0}, Ll/wv40;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p3, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public p()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public r1(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->p6(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/tv40;

    .line 6
    .line 7
    invoke-direct {p2, p0}, Ll/tv40;-><init>(Ll/dw40;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method
