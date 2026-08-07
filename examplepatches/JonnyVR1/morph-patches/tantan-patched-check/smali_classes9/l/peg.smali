.class public Ll/peg;
.super Ll/tk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/tk2<",
        "Ll/qct;",
        ">;"
    }
.end annotation


# instance fields
.field public final j:Ljava/lang/String;

.field public k:J

.field public l:Ll/aeg;

.field public final m:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final n:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

.field public o:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/oo2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/tk2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/peg;->j:Ljava/lang/String;

    .line 13
    .line 14
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    iput-wide v0, p0, Ll/peg;->k:J

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/peg;->l:Ll/aeg;

    .line 20
    .line 21
    new-instance v0, Ljava/util/HashSet;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/peg;->m:Ljava/util/HashSet;

    .line 27
    .line 28
    new-instance v0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 29
    .line 30
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/peg;->n:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 34
    .line 35
    return-void
.end method

.method private synthetic F4(Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/peg;->J4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i4(Ll/peg;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/peg;->F4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic j4(Ll/peg;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/peg;->z4(Z)V

    return-void
.end method

.method public static synthetic k4(Ll/peg;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/peg;->G4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic l4(Ll/peg;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/peg;->E4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic m4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n4(Ll/peg;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/peg;->C4(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p4(Ll/peg;Ll/aeg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/peg;->L4(Ll/aeg;)V

    return-void
.end method

.method public static synthetic q4(Ll/peg;ZLl/aeg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/peg;->A4(ZLl/aeg;)V

    return-void
.end method

.method public static synthetic r4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic s4(Ll/peg;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/peg;->B4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic t4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u4(Ll/peg;Lcom/p1/mobile/putong/live/base/data/BLiveTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/peg;->y4(Lcom/p1/mobile/putong/live/base/data/BLiveTask;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic v4(Ll/peg;Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/peg;->D4(Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic A4(ZLl/aeg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/peg;->L4(Ll/aeg;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/l6t;->w2()Ll/l6t;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/l6t;->w2()Ll/l6t;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    instance-of p1, p1, Ll/acg;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/l6t;->w2()Ll/l6t;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ll/acg;

    .line 25
    .line 26
    invoke-virtual {p0, p2}, Ll/tk2;->h4(Ll/aeg;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final synthetic B4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic C4(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 20
    .line 21
    const-string p1, "onlive"

    .line 22
    .line 23
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public final synthetic D4(Ljava/lang/Long;)Lrx/c;
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/peg;->k:J

    .line 2
    .line 3
    const-wide/16 v2, 0xa

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Ll/peg;->k:J

    .line 7
    .line 8
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/peg;->w4(Ljava/lang/Long;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/16 v0, 0x1e

    .line 20
    .line 21
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    invoke-virtual {p1, v0, v1}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/4 p1, 0x1

    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->take(I)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public final synthetic E4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/peg;->H4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic G4(Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/peg;->J4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final H4()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    iget-object v1, p0, Ll/peg;->m:Ljava/util/HashSet;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget-object v2, v2, Ll/oo2;->B:Ll/x7g;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v3}, Ll/oo2;->A0()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v2, v1, v3}, Ll/x7g;->y(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Ll/ceg;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/ceg;-><init>()V

    .line 49
    .line 50
    .line 51
    new-instance v3, Ll/deg;

    .line 52
    .line 53
    invoke-direct {v3}, Ll/deg;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {v2, v3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    iget-object p0, p0, Ll/peg;->m:Ljava/util/HashSet;

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final I4(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->r0()Ll/v5g;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 10
    .line 11
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/v5g;->c(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Ll/oo2;->B:Ll/x7g;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/x7g;->T()Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/beg;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1}, Ll/beg;-><init>(Ll/peg;Z)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/geg;

    .line 47
    .line 48
    invoke-direct {v1, p0, p1}, Ll/geg;-><init>(Ll/peg;Z)V

    .line 49
    .line 50
    .line 51
    new-instance p1, Ll/heg;

    .line 52
    .line 53
    invoke-direct {p1, p0}, Ll/heg;-><init>(Ll/peg;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public final J4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/peg;->K4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/16 v1, 0xa

    .line 9
    .line 10
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/keg;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/keg;-><init>(Ll/peg;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/leg;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/leg;-><init>(Ll/peg;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/meg;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/meg;-><init>(Ll/peg;)V

    .line 41
    .line 42
    .line 43
    new-instance v2, Ll/neg;

    .line 44
    .line 45
    invoke-direct {v2}, Ll/neg;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Ll/peg;->o:Ll/kcg0;

    .line 57
    .line 58
    return-void
.end method

.method public final K4()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/peg;->k:J

    .line 4
    .line 5
    iget-object p0, p0, Ll/peg;->o:Ll/kcg0;

    .line 6
    .line 7
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final L4(Ll/aeg;)V
    .locals 4

    .line 1
    iput-object p1, p0, Ll/peg;->l:Ll/aeg;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/aeg;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/peg;->K4()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-wide v0, p0, Ll/peg;->k:J

    .line 14
    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmp-long p1, v0, v2

    .line 18
    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/peg;->J4()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public P3()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Ll/peg;->I4(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/peg;->n:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->d()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/peg;->K4()V

    .line 10
    .line 11
    .line 12
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
    invoke-virtual {v0}, Ll/vp20;->v()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/ieg;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/ieg;-><init>(Ll/peg;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/vp20;->u()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/jeg;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/jeg;-><init>(Ll/peg;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    invoke-virtual {p0, v0}, Ll/peg;->I4(Z)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final w4(Ljava/lang/Long;)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/peg;->l:Ll/aeg;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/aeg;->c()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v0, p0, Ll/peg;->l:Ll/aeg;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/aeg;->d()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x0

    .line 23
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_4

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveTask;

    .line 34
    .line 35
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->rule:Lcom/p1/mobile/putong/live/base/data/BLiveTaskRule;

    .line 36
    .line 37
    iget-wide v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveTaskRule;->duration:J

    .line 38
    .line 39
    const-wide/16 v5, 0x0

    .line 40
    .line 41
    cmp-long v3, v3, v5

    .line 42
    .line 43
    if-nez v3, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 47
    .line 48
    .line 49
    move-result-wide v3

    .line 50
    cmp-long v3, v3, v5

    .line 51
    .line 52
    if-lez v3, :cond_1

    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 55
    .line 56
    .line 57
    move-result-wide v3

    .line 58
    iget-object v7, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->rule:Lcom/p1/mobile/putong/live/base/data/BLiveTaskRule;

    .line 59
    .line 60
    iget-wide v7, v7, Lcom/p1/mobile/putong/live/base/data/BLiveTaskRule;->duration:J

    .line 61
    .line 62
    const-wide/16 v9, 0x3c

    .line 63
    .line 64
    mul-long/2addr v7, v9

    .line 65
    rem-long/2addr v3, v7

    .line 66
    cmp-long v3, v3, v5

    .line 67
    .line 68
    if-nez v3, :cond_1

    .line 69
    .line 70
    invoke-static {}, Ll/eb20;->b()Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eqz v3, :cond_3

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 78
    .line 79
    invoke-virtual {p0, v2}, Ll/peg;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveTask;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    if-lez v1, :cond_5

    .line 84
    .line 85
    iget-object p1, p0, Ll/peg;->n:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v0, v0, Ll/oo2;->B:Ll/x7g;

    .line 92
    .line 93
    invoke-virtual {v0}, Ll/x7g;->T()Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const-string v1, "refreshTask"

    .line 98
    .line 99
    invoke-virtual {p1, v1, v0}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->e(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    new-instance v0, Ll/oeg;

    .line 108
    .line 109
    invoke-direct {v0, p0}, Ll/oeg;-><init>(Ll/peg;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 117
    .line 118
    .line 119
    :cond_5
    :goto_1
    return-void
.end method

.method public final x4(Lcom/p1/mobile/putong/live/base/data/BLiveTask;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/peg;->n:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "finishTask"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v2, v2, Ll/oo2;->B:Ll/x7g;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-virtual {v4}, Ll/oo2;->A0()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {v2, v3, v4}, Ll/x7g;->y(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->e(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/eeg;

    .line 48
    .line 49
    invoke-direct {v1}, Ll/eeg;-><init>()V

    .line 50
    .line 51
    .line 52
    new-instance v2, Ll/feg;

    .line 53
    .line 54
    invoke-direct {v2, p0, p1}, Ll/feg;-><init>(Ll/peg;Lcom/p1/mobile/putong/live/base/data/BLiveTask;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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

.method public final synthetic y4(Lcom/p1/mobile/putong/live/base/data/BLiveTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/peg;->m:Ljava/util/HashSet;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic z4(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l6t;->w2()Ll/l6t;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/l6t;->w2()Ll/l6t;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    instance-of p1, p1, Ll/acg;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/l6t;->w2()Ll/l6t;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ll/acg;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/tk2;->d4()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
