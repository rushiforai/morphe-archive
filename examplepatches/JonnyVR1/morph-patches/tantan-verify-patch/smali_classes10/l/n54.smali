.class public Ll/n54;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/dw40;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/lang/String;

.field public final j:Ll/qvd;

.field public k:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Ll/z34;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "CallConstant"

    .line 5
    .line 6
    iput-object v0, p0, Ll/n54;->i:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/n54;->k:Lrx/subjects/a;

    .line 13
    .line 14
    new-instance v0, Ll/qvd;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-direct {v0, v1}, Ll/qvd;-><init>(Z)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/n54;->j:Ll/qvd;

    .line 24
    .line 25
    new-instance v0, Ll/d74;

    .line 26
    .line 27
    iget-object p2, p2, Ll/z34;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 28
    .line 29
    invoke-direct {v0, p1, p2, p0}, Ll/d74;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;Ll/n54;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic J3(Ll/qvd;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Ll/qvd;->e:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x4

    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic K3(Ll/n54;Ll/x34;)Ll/q54;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n54;->b4(Ll/x34;)Ll/q54;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/n54;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n54;->f4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->isRewardChange()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic N3(Ll/n54;Ll/e74;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n54;->h4(Ll/e74;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O3(Ll/n54;Ll/ml50;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n54;->c4(Ll/ml50;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ll/n54;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/n54;->j4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;)V

    return-void
.end method

.method public static synthetic R3(Ll/n54;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n54;->g4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)V

    return-void
.end method

.method public static synthetic S3(Ll/n54;Ll/rmj;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n54;->d4(Ll/rmj;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T3(Ll/n54;Ll/qvd;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n54;->e4(Ll/qvd;)V

    return-void
.end method

.method private j4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->callRewardPoint:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/d54;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/d54;-><init>(Ll/n54;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/f54;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/f54;-><init>(Ll/n54;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/ml50;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/g54;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/g54;-><init>(Ll/n54;)V

    .line 17
    .line 18
    .line 19
    const-class v1, Ll/x34;

    .line 20
    .line 21
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/h54;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/h54;-><init>(Ll/n54;)V

    .line 27
    .line 28
    .line 29
    const-class v1, Ll/rmj;

    .line 30
    .line 31
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/i54;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/i54;-><init>(Ll/n54;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Ll/pcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/j54;

    .line 44
    .line 45
    invoke-direct {v1}, Ll/j54;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/k54;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/k54;-><init>(Ll/n54;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

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

.method public U3(Ll/y34;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n54;->j:Ll/qvd;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qvd;->c(Ll/y34;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public V3(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 9
    .line 10
    const v1, 0xa05c

    .line 11
    .line 12
    .line 13
    if-eq p0, v1, :cond_1

    .line 14
    .line 15
    const v1, 0xa02a

    .line 16
    .line 17
    .line 18
    if-eq p0, v1, :cond_1

    .line 19
    .line 20
    const v1, 0xa02c

    .line 21
    .line 22
    .line 23
    if-eq p0, v1, :cond_1

    .line 24
    .line 25
    const v1, 0xa028

    .line 26
    .line 27
    .line 28
    if-eq p0, v1, :cond_1

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    :cond_1
    :goto_0
    if-nez v0, :cond_2

    .line 35
    .line 36
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->J9:I

    .line 37
    .line 38
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    invoke-static {v0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v1, "error cause code = "

    .line 48
    .line 49
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p0, " message = "

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public W3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/n54;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ljava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-static {p1}, Ll/u54;->f(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v1, "finish call :"

    .line 21
    .line 22
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, ",reason:"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-static {p1, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->f6(Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance p2, Ll/a54;

    .line 60
    .line 61
    invoke-direct {p2, p0}, Ll/a54;-><init>(Ll/n54;)V

    .line 62
    .line 63
    .line 64
    new-instance v0, Ll/e54;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/e54;-><init>(Ll/n54;)V

    .line 67
    .line 68
    .line 69
    invoke-static {p2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    :cond_1
    :goto_0
    return-void
.end method

.method public Y3(Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/j2s;",
            ">;)V"
        }
    .end annotation

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
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/dw40;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/dw40;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->N3(Ljava/lang/String;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/e54;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/e54;-><init>(Ll/n54;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p1, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    :cond_1
    :goto_0
    return-void
.end method

.method public Z3()Ll/qvd;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n54;->j:Ll/qvd;

    .line 2
    .line 3
    return-object p0
.end method

.method public a4()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/qvd;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/n54;->j:Ll/qvd;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qvd;->j()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final b4(Ll/x34;)Ll/q54;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n54;->j:Ll/qvd;

    .line 2
    .line 3
    iget-object v1, p1, Ll/x34;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/qvd;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/n54;->j:Ll/qvd;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/qvd;->m()Ll/j2s;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p1, p1, Ll/x34;->c:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/j2s;->k(Ljava/lang/String;)Ll/h64;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 26
    .line 27
    const-string v1, "gift-audience-none-callaudience"

    .line 28
    .line 29
    iget v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 30
    .line 31
    invoke-static {p1, v1, v2}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance v1, Ll/q54;

    .line 36
    .line 37
    invoke-static {p0, p1}, Ll/coj;->c(Ll/h64;Ll/p54;)Ll/coj;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v0}, Ll/u54;->c(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-direct {v1, p0, p1}, Ll/q54;-><init>(Ll/coj;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-object v1

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method public final synthetic c4(Ll/ml50;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n54;->j:Ll/qvd;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qvd;->m()Ll/j2s;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/j2s;->m()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic d4(Ll/rmj;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n54;->j:Ll/qvd;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qvd;->n()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic e4(Ll/qvd;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n54;->j:Ll/qvd;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/qvd;->m()Ll/j2s;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/j2s;->m()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget p1, p1, Ll/qvd;->e:I

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-ne p1, v1, :cond_1

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void

    .line 24
    :cond_1
    const/4 p1, 0x1

    .line 25
    if-ne v0, p1, :cond_2

    .line 26
    .line 27
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->callBottomButtonApiDiffRefresh()Ll/v3f$c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 38
    .line 39
    .line 40
    :cond_2
    return-void
.end method

.method public final synthetic f4(Ljava/util/List;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/n54;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic g4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n54;->j:Ll/qvd;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;->getUserId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/qvd;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;->getRewardPoint()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userRecvRewardPoint:J

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/n54;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic h4(Ll/e74;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n54;->j:Ll/qvd;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qvd;->h()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public i4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/g64;->h(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->bulletText()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/dw40;

    .line 19
    .line 20
    new-instance v1, Ll/i64;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->bulletText()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-direct {v1, v2}, Ll/i64;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/oo2;->W1(Ll/pf2;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getType()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    packed-switch v0, :pswitch_data_0

    .line 37
    .line 38
    .line 39
    :pswitch_0
    goto :goto_0

    .line 40
    :pswitch_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Ll/n54;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :pswitch_2
    invoke-virtual {p0}, Ll/n54;->Z3()Ll/qvd;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ll/qvd;->m()Ll/j2s;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCallId()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Ll/j2s;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0, p1}, Ll/n54;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    :goto_0
    return-void

    .line 74
    :pswitch_3
    new-instance v0, Ll/y34;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCallUser()Ll/h64;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-direct {v0, v1, p1}, Ll/y34;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/h64;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v0}, Ll/n54;->U3(Ll/y34;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n54;->j:Ll/qvd;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/qvd;->t(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public l4()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/n54;->k:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n54;->j:Ll/qvd;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qvd;->w(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n4(Ll/j2s;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n54;->j:Ll/qvd;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qvd;->x(Ll/j2s;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/dw40;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->f()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/l54;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/l54;-><init>(Ll/n54;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/dw40;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/aj1;->C()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/m54;

    .line 49
    .line 50
    invoke-direct {v1}, Ll/m54;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/b54;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/b54;-><init>(Ll/n54;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    new-instance v0, Ll/c54;

    .line 66
    .line 67
    invoke-direct {v0, p0}, Ll/c54;-><init>(Ll/n54;)V

    .line 68
    .line 69
    .line 70
    const-class v1, Ll/e74;

    .line 71
    .line 72
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method
