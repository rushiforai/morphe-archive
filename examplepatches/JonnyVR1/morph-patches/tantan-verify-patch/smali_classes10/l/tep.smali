.class public Ll/tep;
.super Ll/y8s;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ll/yep;",
        ">;",
        "Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;"
    }
.end annotation


# instance fields
.field public j:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/yep;

    .line 5
    .line 6
    iget-object v1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, v1, p0}, Ll/yep;-><init>(Lcom/p1/mobile/android/app/Act;Ll/tep;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;

    .line 15
    .line 16
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/tep;->j:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic S3(Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;->isPass:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic T3(Ll/y20;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    const-string p1, "intl_sud_sdk"

    .line 5
    .line 6
    const-string v0, "load  sud sdk failed"

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic U3(Ll/tep;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tep;->i4()V

    return-void
.end method

.method public static synthetic V3(Ll/tep;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tep;->o4()V

    return-void
.end method

.method public static synthetic W3(Ll/tep;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tep;->l4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic X3(Ll/tep;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tep;->m4()V

    return-void
.end method

.method public static synthetic Y3(Ll/tep;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tep;->n4()V

    return-void
.end method

.method public static synthetic Z3(Ll/y20;Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic a4(Ll/tep;Ll/mkj;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tep;->j4(Ll/mkj;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic b4(Ll/x20;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c4(Ll/mkj;)Lrx/c;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/intl/api/IntlLivingNormalApiProvider;->intlCheckUserCompliance()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/sep;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/sep;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/gep;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/gep;-><init>(Ll/mkj;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic d4(Ll/tep;Ll/mkj;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tep;->k4(Ll/mkj;)V

    return-void
.end method

.method public static synthetic e4(Ll/mkj;Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;)Ll/mkj;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic f4(Ll/tep;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tep;->p4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private synthetic l4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yep;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic p4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/tep;->j:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;

    .line 6
    .line 7
    new-instance v0, Ll/oep;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/oep;-><init>(Ll/tep;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Ll/tep;->g4(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;Ll/x20;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 17
    .line 18
    if-ne p1, v0, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Ll/tep;->j:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;

    .line 21
    .line 22
    new-instance v0, Ll/pep;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/pep;-><init>(Ll/tep;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1, v0}, Ll/tep;->g4(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;Ll/x20;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 32
    .line 33
    if-ne p1, v0, :cond_2

    .line 34
    .line 35
    iget-object p1, p0, Ll/tep;->j:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;

    .line 36
    .line 37
    new-instance v0, Ll/qep;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/qep;-><init>(Ll/tep;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1, v0}, Ll/tep;->g4(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;Ll/x20;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    return-void
.end method


# virtual methods
.method public O3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/tep;->j:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->w()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public P3()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ll/q4f;

    .line 5
    .line 6
    invoke-direct {p0}, Ll/q4f;-><init>()V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->PAGE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 10
    .line 11
    iput-object v0, p0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 12
    .line 13
    const-string v0, "p_sudgames_game_start"

    .line 14
    .line 15
    iput-object v0, p0, Ll/q4f;->n:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Ll/i4g0;->m(Ll/q4f;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public T()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/elt;->C()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public Z(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yep;

    .line 4
    .line 5
    iget-object p0, p0, Ll/yep;->m:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    invoke-virtual {p0, p1, v0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final g4(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p2}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final h4(Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/elt;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/elt;->w()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/iep;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/iep;-><init>(Ll/y20;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ll/jep;

    .line 21
    .line 22
    invoke-direct {v1, p1}, Ll/jep;-><init>(Ll/y20;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic i4()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/tep;->j:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->I(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic j4(Ll/mkj;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p2, Ll/yep;

    .line 10
    .line 11
    invoke-virtual {p2, p1}, Ll/yep;->L(Ll/mkj;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/tep;->r4()V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Ll/tep;->j:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1}, Ll/mkj;->c()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    invoke-virtual {p2, p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->D(Ljava/lang/String;J)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->F9:I

    .line 40
    .line 41
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic k4(Ll/mkj;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/mkj;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance v0, Ll/rep;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1}, Ll/rep;-><init>(Ll/tep;Ll/mkj;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/tep;->h4(Ll/y20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic m4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tep;->j:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->z()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n0()V
    .locals 1

    .line 1
    new-instance v0, Ll/nep;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nep;-><init>(Ll/tep;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/tep;->q4(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tep;->j:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->x()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic o4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tep;->j:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->w()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onGameDestroyed()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yep;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onGameStarted()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/16 v0, 0x13

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/u8n;->a()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->qc:I

    .line 19
    .line 20
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->pc:I

    .line 25
    .line 26
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final q4(Ll/x20;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FastRechargeEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;->showFastRechargeDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/bkg$a;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/bkg$a;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-virtual {v0, v1}, Ll/bkg$a;->g(I)Ll/bkg$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "liveIntlSudGame"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/bkg$a;->j(Ljava/lang/String;)Ll/bkg$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/hep;

    .line 28
    .line 29
    invoke-direct {v1, p1}, Ll/hep;-><init>(Ll/x20;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/bkg$a;->f(Ll/x20;)Ll/bkg$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Ll/bkg$a;->e()Ll/bkg;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final r4()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;->left:I

    .line 8
    .line 9
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;->top:I

    .line 10
    .line 11
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;->right:I

    .line 12
    .line 13
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;->bottom:I

    .line 14
    .line 15
    iget-object p0, p0, Ll/tep;->j:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->k:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->G()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;->ui:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameUi;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameUi;->ping:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GamePing;

    .line 26
    .line 27
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GamePing;->hide:Z

    .line 28
    .line 29
    invoke-static {}, Ll/i9n;->d()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;->gameCPU:I

    .line 34
    .line 35
    invoke-static {}, Ltech/sud/mgp/core/SudMGP;->getCfg()Ltech/sud/gip/core/ISudCfg;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {p0, v1}, Ltech/sud/gip/core/ISudCfg;->setShowLoadingGameBg(Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/tep;->j:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->O(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->IntlSudGameEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlSudGameEvent;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$IntlSudGameEvent;->show()Ll/v3f$d;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lrx/c;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/fep;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/fep;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/kep;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/kep;-><init>(Ll/tep;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->IntlSudGameEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlSudGameEvent;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$IntlSudGameEvent;->close()Ll/v3f$c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Lrx/c;

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/lep;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/lep;-><init>(Ll/tep;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    new-instance v1, Ll/mep;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/mep;-><init>(Ll/tep;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public t0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yep;

    .line 4
    .line 5
    iget-object p0, p0, Ll/yep;->m:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
