.class public Ll/xup;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/rwn0;",
        "Ll/rvp;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/xup;->j:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ll/rvp;

    .line 9
    .line 10
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-direct {v0, p1, p0}, Ll/rvp;-><init>(Lcom/p1/mobile/android/app/Act;Ll/xup;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic S3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->D:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic T3(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;

    .line 3
    .line 4
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic U3(Ll/xup;ZLcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xup;->i4(ZLcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    return-void
.end method

.method public static synthetic V3(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;

    .line 3
    .line 4
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic W3(Ll/x20;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X3(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;

    .line 3
    .line 4
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic Y3(Ll/x20;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->D:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->D:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b4(Ll/x20;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c4(Ll/xup;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public d4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rvp;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rvp;->d()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e4(Ljava/util/ArrayList;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/itv;->K(Ljava/util/ArrayList;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/mup;

    .line 10
    .line 11
    invoke-direct {p1, p2}, Ll/mup;-><init>(Ll/x20;)V

    .line 12
    .line 13
    .line 14
    new-instance p2, Ll/oup;

    .line 15
    .line 16
    invoke-direct {p2}, Ll/oup;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public f4()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xup;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Ljava/lang/String;)V
    .locals 9

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->viewType:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->z1:I

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance v0, Ll/hne0$a;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/hne0$a;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v2, Ll/xup$a;

    .line 18
    .line 19
    invoke-direct {v2, p0, p1}, Ll/xup$a;-><init>(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    .line 20
    .line 21
    .line 22
    const-string p1, "fans"

    .line 23
    .line 24
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    invoke-virtual {p0}, Ll/xup;->f4()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v7

    .line 36
    const-string v8, "source_voice_fan_base"

    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    const-string v4, "fans_club"

    .line 40
    .line 41
    const-string v5, "join_club"

    .line 42
    .line 43
    move-object v1, p2

    .line 44
    invoke-virtual/range {v0 .. v8}, Ll/hne0$a;->v(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;Ljava/lang/String;Ljava/lang/String;)Ll/hne0$a;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Ll/hne0$a;->t()Ll/hne0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public h4(Ljava/util/ArrayList;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/itv;->N(Ljava/util/ArrayList;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/vup;

    .line 10
    .line 11
    invoke-direct {p1, p2}, Ll/vup;-><init>(Ll/x20;)V

    .line 12
    .line 13
    .line 14
    new-instance p2, Ll/wup;

    .line 15
    .line 16
    invoke-direct {p2}, Ll/wup;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic i4(ZLcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ll/xup;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j4(Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/itv;->U(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/pup;

    .line 10
    .line 11
    invoke-direct {p1, p2}, Ll/pup;-><init>(Ll/x20;)V

    .line 12
    .line 13
    .line 14
    new-instance p2, Ll/qup;

    .line 15
    .line 16
    invoke-direct {p2}, Ll/qup;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public k4(Ljava/lang/String;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    iget-object v0, p0, Ll/xup;->j:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, p1}, Ll/itv;->G(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance p1, Ll/uup;

    .line 19
    .line 20
    invoke-direct {p1, p2}, Ll/uup;-><init>(Ll/y20;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p2, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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

.method public l4(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/itv;->F()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/tup;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/tup;-><init>(Ll/y20;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public m4(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/itv;->E(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/sup;

    .line 10
    .line 11
    invoke-direct {v0, p0, p2}, Ll/sup;-><init>(Ll/xup;Z)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public n4(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/itv;->H()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/nup;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/nup;-><init>(Ll/y20;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final o4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Z)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p2, Ll/rvp;

    .line 6
    .line 7
    invoke-virtual {p2}, Ll/rvp;->b()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->viewType:I

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    if-ne p2, v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Ll/rvp;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/rvp;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const/4 v0, 0x1

    .line 28
    if-ne p2, v0, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast p0, Ll/rvp;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/rvp;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    if-eqz p2, :cond_4

    .line 39
    .line 40
    const/4 v0, 0x3

    .line 41
    if-ne p2, v0, :cond_3

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_3
    :goto_0
    return-void

    .line 45
    :cond_4
    :goto_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast p0, Ll/rvp;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/rvp;->i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public p4(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xup;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/rvp;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/rvp;->d()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iput-object p1, p0, Ll/xup;->j:Ljava/lang/String;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, p1, v0}, Ll/xup;->m4(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->showVoiceFansClubDialog()Ll/v3f$d;

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
    new-instance v1, Ll/rup;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/rup;-><init>(Ll/xup;)V

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
