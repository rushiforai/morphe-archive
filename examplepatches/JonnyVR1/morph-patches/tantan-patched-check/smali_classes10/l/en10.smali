.class public abstract Ll/en10;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/iam<",
        "*>;>;"
    }
.end annotation


# instance fields
.field public i:Ll/td10;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/td10<",
            "TD;>;"
        }
    .end annotation
.end field

.field public j:Ll/sc10;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/sc10<",
            "TD;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Ll/td10;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Ll/td10<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/en10;->i:Ll/td10;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/en10;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/en10;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method

.method public static synthetic K3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L3(Ll/en10;Ll/le10;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/en10;->X3(Ll/le10;)V

    return-void
.end method

.method public static synthetic M3(Ll/en10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/en10;->b4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic N3(Ll/en10;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/en10;->c4(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O3(Ll/en10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/en10;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method

.method public static synthetic P3(Ll/en10;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/en10;->d4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic R3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    const-string p0, "join call failed in 30s  "

    .line 2
    .line 3
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic S3(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x1e

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method


# virtual methods
.method public final T3()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/en10;->i:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/td10;->b4()Ll/le10;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/le10;->u()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "1plus5"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const-string v0, "big"

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string v0, "small"

    .line 29
    .line 30
    :goto_0
    iget-object p0, p0, Ll/en10;->i:Ll/td10;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/td10;->b4()Ll/le10;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/le10;->u()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L5(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public U3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/en10;->V3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/en10;->T3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    new-instance v0, Ll/cn10;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/cn10;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, p2, v0}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 p2, 0x0

    .line 19
    invoke-virtual {p0, p1, p2}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public V3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->n7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public W3(Ll/le10;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final X3(Ll/le10;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/en10;->i:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/td10;->e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/fp10;->d(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/en10;->W3(Ll/le10;)V

    .line 14
    .line 15
    .line 16
    iget p1, p1, Ll/le10;->d:I

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    if-eq p1, v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/en10;->f4()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public Y3(Ll/x84;)Ll/x84;
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/x84;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "handleSDKCallback:"

    .line 12
    .line 13
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ll/x84;->c()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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
    :cond_0
    invoke-virtual {p1}, Ll/x84;->b()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v2, 0x1

    .line 35
    if-eq v0, v2, :cond_4

    .line 36
    .line 37
    const/4 v2, 0x4

    .line 38
    if-eq v0, v2, :cond_3

    .line 39
    .line 40
    const/4 v2, 0x7

    .line 41
    if-eq v0, v2, :cond_2

    .line 42
    .line 43
    if-eq v0, v1, :cond_1

    .line 44
    .line 45
    return-object p1

    .line 46
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->updateMemberVolume()Ll/v3f$d;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p1}, Ll/x84;->d()Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    return-object p1

    .line 64
    :cond_2
    invoke-virtual {p0}, Ll/en10;->a4()V

    .line 65
    .line 66
    .line 67
    return-object p1

    .line 68
    :cond_3
    iget-object p0, p0, Ll/en10;->j:Ll/sc10;

    .line 69
    .line 70
    invoke-virtual {p1}, Ll/x84;->g()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p0, v0}, Ll/sc10;->L3(Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    invoke-virtual {p1, p0}, Ll/x84;->r(I)Ll/x84;

    .line 79
    .line 80
    .line 81
    return-object p1

    .line 82
    :cond_4
    invoke-virtual {p1}, Ll/x84;->f()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p0, v0}, Ll/en10;->l4(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-object p1
.end method

.method public final Z3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/fp10;->a(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/en10;->i:Ll/td10;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/td10;->b4()Ll/le10;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ll/le10;->o()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/en10;->j4()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {p1}, Ll/fp10;->c(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/en10;->k4()V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public final a4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/en10;->i:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/td10;->e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Ll/cd10;->J:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->state:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    sget-object v1, Ll/cd10;->p:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->state:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v1, p0, Ll/en10;->i:Ll/td10;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/td10;->e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 32
    .line 33
    const-string v2, "anchor-sdk-push-failed"

    .line 34
    .line 35
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->e6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    new-instance v2, Ll/an10;

    .line 44
    .line 45
    invoke-direct {v2}, Ll/an10;-><init>()V

    .line 46
    .line 47
    .line 48
    new-instance v3, Ll/bn10;

    .line 49
    .line 50
    invoke-direct {v3, p0, v0}, Ll/bn10;-><init>(Ll/en10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v2, v3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public final synthetic b4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/en10;->i:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/td10;->v4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic c4(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/en10;->i:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/td10;->e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/fp10;->d(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic d4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/en10;->a4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 2

    .line 1
    new-instance v0, Ll/r410;

    .line 2
    .line 3
    const/16 v1, 0x1770

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/r410;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/xzl;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ll/xzl;->o(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    return-void
.end method

.method public g4(Ljava/lang/String;Ljava/lang/String;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "requestRtcToken roomId:"

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
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1, p2}, Ll/en10;->V3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 p2, 0x0

    .line 23
    invoke-virtual {p0, p1, p2}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p3}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public h4(Ljava/lang/String;Ljava/lang/String;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "requestRtcTokenAndBitrate roomId:"

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
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1, p2}, Ll/en10;->V3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0}, Ll/en10;->T3()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    new-instance v0, Ll/cn10;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/cn10;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, p2, v0}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const/4 p2, 0x0

    .line 36
    invoke-virtual {p0, p1, p2}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p3}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public i4(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public j4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/wm10;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/wm10;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/xm10;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/xm10;-><init>(Ll/en10;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/ym10;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/ym10;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/zm10;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/zm10;-><init>(Ll/en10;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public abstract k4()V
.end method

.method public l4(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "updateRtcToken"

    .line 2
    .line 3
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/en10;->i:Ll/td10;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/td10;->e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerRoomId:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v1, Ll/dn10;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/dn10;-><init>(Ll/en10;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, p1, v1}, Ll/en10;->g4(Ljava/lang/String;Ljava/lang/String;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/en10;->i:Ll/td10;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/td10;->f4()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/um10;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/um10;-><init>(Ll/en10;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/en10;->i:Ll/td10;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/td10;->c4()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/vm10;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/vm10;-><init>(Ll/en10;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method
