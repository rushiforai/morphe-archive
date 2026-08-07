.class public Ll/td10;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/qct<",
        "TD;>;"
    }
.end annotation


# instance fields
.field public final i:Ll/le10;

.field public final j:Ll/le10$a;

.field public final k:Ll/mo10;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/mo10<",
            "TD;>;"
        }
    .end annotation
.end field

.field public l:Ll/en10;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/en10<",
            "TD;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Ll/dj10;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Ll/dj10;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/le10$a;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/le10$a;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/td10;->j:Ll/le10$a;

    .line 10
    .line 11
    new-instance v1, Ll/le10;

    .line 12
    .line 13
    invoke-virtual {p2}, Ll/dj10;->a()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {p2}, Ll/dj10;->c()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-direct {v1, v0, v2, p2}, Ll/le10;-><init>(Ll/le10$a;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Ll/td10;->i:Ll/le10;

    .line 25
    .line 26
    new-instance p2, Ll/cj10;

    .line 27
    .line 28
    invoke-direct {p2, p1, p0}, Ll/cj10;-><init>(Ll/dum;Ll/td10;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 32
    .line 33
    .line 34
    new-instance p2, Ll/mo10;

    .line 35
    .line 36
    invoke-direct {p2, p1}, Ll/mo10;-><init>(Ll/dum;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    check-cast p2, Ll/mo10;

    .line 44
    .line 45
    iput-object p2, p0, Ll/td10;->k:Ll/mo10;

    .line 46
    .line 47
    new-instance p2, Ll/zk10;

    .line 48
    .line 49
    invoke-direct {p2, p1, p0}, Ll/zk10;-><init>(Ll/dum;Ll/td10;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 53
    .line 54
    .line 55
    new-instance p2, Ll/tp10;

    .line 56
    .line 57
    invoke-direct {p2, p1, p0}, Ll/tp10;-><init>(Ll/dum;Ll/td10;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 61
    .line 62
    .line 63
    new-instance p2, Ll/jh10;

    .line 64
    .line 65
    invoke-direct {p2, p1, p0}, Ll/jh10;-><init>(Ll/dum;Ll/td10;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 69
    .line 70
    .line 71
    new-instance p2, Ll/ug10;

    .line 72
    .line 73
    invoke-direct {p2, p1, p0}, Ll/ug10;-><init>(Ll/dum;Ll/td10;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public static synthetic J3(Ll/td10;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/td10;->i4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic K3(Ll/td10;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/td10;->s4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;)V

    return-void
.end method

.method public static synthetic L3(Ll/td10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/td10;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/td10;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/td10;->r4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic N3(Ll/td10;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/td10;->o4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic O3(Ll/td10;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/td10;->n4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic P3(Ll/td10;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/td10;->h4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic R3(Ll/td10;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/td10;->l4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic S3(Ll/td10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/td10;->m4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)V

    return-void
.end method

.method public static synthetic T3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->isRewardChange()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->isAllChange()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic U3(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

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

.method public static synthetic V3(Ll/td10;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/td10;->g4(Z)V

    return-void
.end method

.method public static synthetic W3(Ll/td10;Ll/al10;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/td10;->q4(Ll/al10;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X3(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "request close multi call fail , msg:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic Y3(Ll/td10;Ll/smj;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/td10;->p4(Ll/smj;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public Z3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/td10;->k:Ll/mo10;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/mo10;->L3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/td10;->j:Ll/le10$a;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/le10$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public a4(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "closeMultiCallMotion ,reason="

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
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Ll/bf10;->k(Ll/i6t;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public b4()Ll/le10;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/td10;->i:Ll/le10;

    .line 2
    .line 3
    return-object p0
.end method

.method public c4()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/le10;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/td10;->i:Ll/le10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/le10;->p()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d4()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/td10;->i:Ll/le10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/le10;->w()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/td10;->k:Ll/mo10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mo10;->M3()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public f4()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/td10;->k:Ll/mo10;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/mo10;->N3()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/hd10;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/hd10;-><init>(Ll/td10;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final g4(Z)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/td10;->k:Ll/mo10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mo10;->M3()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v1, "Act front is "

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->d4(Ljava/lang/String;)Lrx/c;

    .line 35
    .line 36
    .line 37
    invoke-static {p0}, Ll/fn10;->f(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->liveId:Ljava/lang/String;

    .line 44
    .line 45
    const-string p1, ""

    .line 46
    .line 47
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->c6(Ljava/lang/String;)Lrx/c;

    .line 54
    .line 55
    .line 56
    invoke-static {p0}, Ll/fn10;->f(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_1

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->liveId:Ljava/lang/String;

    .line 63
    .line 64
    const/4 p1, 0x0

    .line 65
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L7(Ljava/lang/String;Z)Lrx/c;

    .line 66
    .line 67
    .line 68
    :cond_1
    return-void
.end method

.method public final h4(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->c4(Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v0, Ll/fd10;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/fd10;-><init>(Ll/td10;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/gd10;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/gd10;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-object p0, p0, Ll/td10;->l:Ll/en10;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/en10;->k4()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final i4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/td10;->u4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerMultiCallOrder:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/td10;->d4()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic k4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerMultiCallOrder:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/td10;->d4()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v0, "filter self info :"

    .line 19
    .line 20
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->toJson()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 38
    .line 39
    return-object p0
.end method

.method public final synthetic l4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/td10;->l:Ll/en10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/en10;->k4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic m4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/td10;->i:Ll/le10;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;->getUserId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/le10;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

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
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->receivedRewardPoint:J

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/td10;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n4(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/td10;->w4(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/bf10;->D(Ll/i6t;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Ll/fn10;->k(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-static {p1}, Ll/fn10;->c(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    invoke-static {p1}, Ll/fn10;->g(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    :cond_0
    invoke-static {p0}, Ll/bf10;->B(Ll/i6t;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->isLeadRole:Z

    .line 33
    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    const-string p1, "big"

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const-string p1, "small"

    .line 40
    .line 41
    :goto_0
    iget-object v0, p0, Ll/td10;->i:Ll/le10;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/le10;->u()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L5(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance v0, Ll/jd10;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Ll/jd10;-><init>(Ll/td10;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    :cond_2
    return-void
.end method

.method public final synthetic o4(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    new-instance v0, Ll/z310;

    .line 2
    .line 3
    const/16 v1, 0x1770

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/h0m;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_MULTI_CALL_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    check-cast p0, Ll/p910;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/p910;->J1(Ljava/lang/Integer;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    if-eqz p0, :cond_1

    .line 35
    .line 36
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_MULTI_CALL_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    check-cast p0, Ll/ab10;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/ab10;->A1(Ljava/lang/Integer;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public final synthetic p4(Ll/smj;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/td10;->i:Ll/le10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/le10;->x()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic q4(Ll/al10;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/td10;->d4()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic r4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/td10;->u4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final s4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->multiCallRewardPoint:Ljava/util/List;

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
    new-instance v0, Ll/sd10;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/sd10;-><init>(Ll/td10;)V

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

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/dd10;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/dd10;-><init>(Ll/td10;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/smj;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/kd10;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/kd10;-><init>(Ll/td10;)V

    .line 17
    .line 18
    .line 19
    const-class v1, Ll/al10;

    .line 20
    .line 21
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->prepareCloseMultiCall()Ll/v3f$d;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lrx/c;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/ld10;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/ld10;-><init>(Ll/td10;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->front()Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/md10;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/md10;-><init>(Ll/td10;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Ll/aj1;->C()Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v1, Ll/nd10;

    .line 93
    .line 94
    invoke-direct {v1}, Ll/nd10;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    new-instance v1, Ll/od10;

    .line 102
    .line 103
    invoke-direct {v1, p0}, Ll/od10;-><init>(Ll/td10;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/pd10;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/pd10;-><init>(Ll/td10;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 123
    .line 124
    .line 125
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    new-instance v1, Ll/qd10;

    .line 138
    .line 139
    invoke-direct {v1}, Ll/qd10;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    const/4 v1, 0x1

    .line 151
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    new-instance v1, Ll/rd10;

    .line 160
    .line 161
    invoke-direct {v1, p0}, Ll/rd10;-><init>(Ll/td10;)V

    .line 162
    .line 163
    .line 164
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method public t4()V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/bf10;->z(Ll/i6t;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerLiveId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->B5(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/id10;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/id10;-><init>(Ll/td10;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final u4()V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/bf10;->z(Ll/i6t;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerLiveId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->B5(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/ed10;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/ed10;-><init>(Ll/td10;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public v4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/td10;->k:Ll/mo10;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/mo10;->O3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/td10;->j:Ll/le10$a;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/le10$a;->c(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public w4(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/td10;->k:Ll/mo10;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/mo10;->S3(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/td10;->j:Ll/le10$a;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/le10$a;->d(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public x4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/td10;->k:Ll/mo10;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/mo10;->R3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/td10;->j:Ll/le10$a;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/le10$a;->e(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
