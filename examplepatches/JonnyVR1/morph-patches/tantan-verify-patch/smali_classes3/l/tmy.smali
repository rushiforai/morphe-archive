.class public Ll/tmy;
.super Ll/djy;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        "VM:",
        "Ll/mmy;",
        ">",
        "Ll/djy<",
        "TD;TVM;>;"
    }
.end annotation


# instance fields
.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Ll/mmy;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;TVM;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/djy;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/tmy;->j:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic X3(Ll/tmy;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/tmy;->e4(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Y3(Ll/tmy;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tmy;->g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V

    return-void
.end method

.method public static synthetic Z3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic a4(Ll/tmy;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tmy;->h4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V

    return-void
.end method

.method public static synthetic b4(Ll/tmy;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tmy;->i4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic c4(Ll/tmy;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tmy;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V

    return-void
.end method

.method private j4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->P5(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/rmy;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/rmy;-><init>(Ll/tmy;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/z2e0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/z2e0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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


# virtual methods
.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/tmy;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S3()Ll/sjy;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/sjy;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/mmy;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mmy;->c()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v1, 0x2

    .line 12
    const-string v2, "\u5165\u9a7b\u7533\u8bf7"

    .line 13
    .line 14
    invoke-direct {v0, v2, p0, v1}, Ll/sjy;-><init>(Ljava/lang/String;Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public T3()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public V3()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tmy;->j4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d4(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/rwn0;->p()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Ll/rwn0;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Ll/rwn0;

    .line 32
    .line 33
    invoke-virtual {v3}, Ll/vp20;->k()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const-string v4, "management_host"

    .line 38
    .line 39
    invoke-static {v0, v1, v2, v3, v4}, Ll/eky;->a(ZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ll/rwn0;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->I3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/qmy;

    .line 61
    .line 62
    invoke-direct {v1, p0, p1, p2}, Ll/qmy;-><init>(Ll/tmy;Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    new-instance p0, Ll/z2e0;

    .line 66
    .line 67
    invoke-direct {p0}, Ll/z2e0;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final synthetic e4(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

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
    const-string p1, "\u5df2\u540c\u610f\u8be5\u7533\u8bf7"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p1, "\u5df2\u62d2\u7edd\u8be5\u7533\u8bf7"

    .line 11
    .line 12
    :goto_0
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/tmy;->j:Ljava/util/List;

    .line 16
    .line 17
    new-instance p3, Ll/smy;

    .line 18
    .line 19
    invoke-direct {p3, p2}, Ll/smy;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1, p3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;

    .line 27
    .line 28
    iget-object p2, p0, Ll/tmy;->j:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p2, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    iget-object p3, p0, Ll/tmy;->j:Ljava/util/List;

    .line 35
    .line 36
    invoke-static {p3, p1}, Ll/jyb;->c0(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Ll/tmy;->j:Ljava/util/List;

    .line 41
    .line 42
    iget-object p3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast p3, Ll/mmy;

    .line 45
    .line 46
    invoke-virtual {p3, p2, p1}, Ll/mmy;->e(ILjava/util/List;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast p1, Ll/mmy;

    .line 52
    .line 53
    iget-object p0, p0, Ll/tmy;->j:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    const/4 p2, 0x2

    .line 60
    if-ge p0, p2, :cond_1

    .line 61
    .line 62
    const/4 p0, 0x1

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    const/4 p0, 0x0

    .line 65
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p1, p0}, Ll/mmy;->b(Ljava/lang/Boolean;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final synthetic f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/djy;->W3(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ll/tmy;->d4(Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic h4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ll/tmy;->d4(Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic i4(Ljava/util/List;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/tmy;->j:Ljava/util/List;

    .line 2
    .line 3
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast v0, Ll/mmy;

    .line 6
    .line 7
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, p1}, Ll/mmy;->b(Ljava/lang/Boolean;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p1, Ll/mmy;

    .line 21
    .line 22
    iget-object p0, p0, Ll/tmy;->j:Ljava/util/List;

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Ll/mmy;->f(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public init()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/mmy;

    .line 4
    .line 5
    new-instance v1, Ll/nmy;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/nmy;-><init>(Ll/tmy;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/omy;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Ll/omy;-><init>(Ll/tmy;)V

    .line 13
    .line 14
    .line 15
    new-instance v3, Ll/pmy;

    .line 16
    .line 17
    invoke-direct {v3, p0}, Ll/pmy;-><init>(Ll/tmy;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p0, v1, v2, v3}, Ll/mmy;->d(Ll/tmy;Ll/y20;Ll/y20;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Ll/tmy;->j4()V

    .line 24
    .line 25
    .line 26
    return-void
.end method
