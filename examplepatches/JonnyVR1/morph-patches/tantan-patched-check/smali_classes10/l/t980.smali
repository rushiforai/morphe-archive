.class public Ll/t980;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/v2m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;",
        "Ll/v2m;"
    }
.end annotation


# instance fields
.field public i:Ll/xx70;

.field public j:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ll/t980;Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t980;->N3(Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/t980;Ll/pf60;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t980;->M3(Ll/pf60;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;
    .locals 1

    .line 1
    const-string v0, "PkRoomMonitor pkTimeOut requestPk callback"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/n180;->i(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 8
    .line 9
    return-object p0
.end method


# virtual methods
.method public final synthetic M3(Ll/pf60;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 8
    .line 9
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 12
    .line 13
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Ljava/util/List;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-direct {v0, v1, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;-><init>(Lcom/p1/mobile/putong/live/base/data/BLivePk;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V

    .line 26
    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method public final synthetic N3(Ljava/lang/Long;)Lrx/c;
    .locals 1

    .line 1
    iget-object p1, p0, Ll/t980;->i:Ll/xx70;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xx70;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->e7(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/s980;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/s980;-><init>(Ll/t980;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance p1, Ll/ea80;

    .line 29
    .line 30
    invoke-direct {p1}, Ll/ea80;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public O3(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "PkRoomMonitor pkTimeOut ,stage="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Ll/n180;->j(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/16 v0, 0xa

    .line 27
    .line 28
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance v0, Ll/q980;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/q980;-><init>(Ll/t980;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    new-instance v0, Ll/r980;

    .line 57
    .line 58
    invoke-direct {v0}, Ll/r980;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object p0, p0, Ll/t980;->j:Ll/y20;

    .line 66
    .line 67
    new-instance v0, Ll/ga80;

    .line 68
    .line 69
    invoke-direct {v0}, Ll/ga80;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-static {p0, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public a0(Ll/xx70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t980;->i:Ll/xx70;

    .line 2
    .line 3
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    return-void
.end method

.method public k(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/t980;->j:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public reset()V
    .locals 0

    .line 1
    return-void
.end method
