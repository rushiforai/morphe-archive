.class public Ll/xx70;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/sx70;

.field public j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

.field public k:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/v2m;


# direct methods
.method public constructor <init>(Ll/dum;Ll/sx70;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 5
    .line 6
    const-string v0, "unknown_"

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePkStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;-><init>(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/xx70;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 16
    .line 17
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Ll/xx70;->k:Lrx/subjects/a;

    .line 22
    .line 23
    iput-object p2, p0, Ll/xx70;->i:Ll/sx70;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic J3(Ll/y20;ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->setOnceMore(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic K3(Ll/xx70;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xx70;->U3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    return-void
.end method

.method public static synthetic L3(Ll/xx70;Ll/pf60;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xx70;->T3(Ll/pf60;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    move-result-object p0

    return-object p0
.end method

.method private M3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)Z
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "pk_created"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "pk_start"

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "pk_result"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

    .line 32
    .line 33
    const-string p1, "pk_end"

    .line 34
    .line 35
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method private synthetic T3(Ll/pf60;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;
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

.method private U3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "next stage = "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->currentStageInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;->stage:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/xx70;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isUnknown()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Ll/xx70;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xx70;->Y3()V

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->currentStageInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;->stage:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iget-object v1, p0, Ll/xx70;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-gt v0, v1, :cond_2

    .line 77
    .line 78
    :goto_0
    return-void

    .line 79
    :cond_2
    iget-object v0, p0, Ll/xx70;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 82
    .line 83
    iput-object p1, p0, Ll/xx70;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 84
    .line 85
    iput-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->lastState:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 86
    .line 87
    invoke-direct {p0, p1}, Ll/xx70;->a4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method private W3(Ljava/lang/String;ZLl/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->e7(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/vx70;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/vx70;-><init>(Ll/xx70;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

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
    new-instance p1, Ll/ea80;

    .line 19
    .line 20
    invoke-direct {p1}, Ll/ea80;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance p1, Ll/wx70;

    .line 28
    .line 29
    invoke-direct {p1, p3, p2}, Ll/wx70;-><init>(Ll/y20;Z)V

    .line 30
    .line 31
    .line 32
    new-instance p2, Ll/ga80;

    .line 33
    .line 34
    invoke-direct {p2}, Ll/ga80;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private a4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->currentStageInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;->stage:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 8
    .line 9
    iput-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 10
    .line 11
    iget-object v0, p0, Ll/xx70;->k:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/xx70;->l:Ll/v2m;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ll/v2m;->f(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v0, "state change to "

    .line 26
    .line 27
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xx70;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    return-object p0
.end method

.method public O3()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xx70;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isRandom()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/xx70;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isBountyPk()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x3

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x2

    .line 22
    return p0
.end method

.method public P3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xx70;->k:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public R3(Ll/v2m;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/xx70;->l:Ll/v2m;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/v2m;->a0(Ll/xx70;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/tx70;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/tx70;-><init>(Ll/xx70;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1, v0}, Ll/v2m;->k(Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public S3()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xx70;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPking()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public V3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/xx70;->M3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkInfo:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInfo;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInfo;->getIsOnceMore()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    new-instance v1, Ll/tx70;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/tx70;-><init>(Ll/xx70;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, v0, p1, v1}, Ll/xx70;->W3(Ljava/lang/String;ZLl/y20;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public X3(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/tx70;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tx70;-><init>(Ll/xx70;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {p0, p1, v1, v0}, Ll/xx70;->W3(Ljava/lang/String;ZLl/y20;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Y3()V
    .locals 2

    .line 1
    const-string v0, "resetState"

    .line 2
    .line 3
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/xx70;->l:Ll/v2m;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/v2m;->reset()V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 12
    .line 13
    const-string v1, "unknown_"

    .line 14
    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;-><init>(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/xx70;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 23
    .line 24
    iget-object p0, p0, Ll/xx70;->k:Lrx/subjects/a;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public Z3()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xx70;->i:Ll/sx70;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sx70;->j:Ll/k780;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Ll/k780;->y4(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xx70;->Y3()V

    .line 5
    .line 6
    .line 7
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
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/aj1;->U()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/ux70;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/ux70;-><init>(Ll/xx70;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method
