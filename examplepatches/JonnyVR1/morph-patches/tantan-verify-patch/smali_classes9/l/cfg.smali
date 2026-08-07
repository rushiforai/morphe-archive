.class public Ll/cfg;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ll/veg;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
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
    new-instance v0, Ll/veg;

    .line 5
    .line 6
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, p1, p0}, Ll/veg;-><init>(Lcom/p1/mobile/android/app/Act;Ll/cfg;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic S3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic T3(Ll/cfg;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cfg;->a4(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U3(Ll/cfg;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cfg;->Z3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic V3(Ll/cfg;Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cfg;->b4(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V

    return-void
.end method

.method public static synthetic W3(Ll/cfg;Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cfg;->Y3(Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;)V

    return-void
.end method


# virtual methods
.method public X3(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/eb20;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->t3:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->G3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/afg;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/afg;-><init>(Ll/cfg;)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Ll/bfg;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/bfg;-><init>(Ll/cfg;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic Y3(Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/veg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getCode()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const v0, 0xc351

    .line 13
    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->s3:I

    .line 18
    .line 19
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getCode()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const p1, 0xc352

    .line 28
    .line 29
    .line 30
    if-ne p0, p1, :cond_1

    .line 31
    .line 32
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->w3:I

    .line 33
    .line 34
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->n3:I

    .line 39
    .line 40
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic Z3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/veg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 6
    .line 7
    .line 8
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 13
    .line 14
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->c3:I

    .line 29
    .line 30
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic a4(Ljava/lang/String;)Lrx/c;
    .locals 1

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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    :cond_0
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->P4(Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final synthetic b4(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/veg;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/veg;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/veg;->I(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V

    .line 13
    .line 14
    .line 15
    return-void
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansGroupEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;->showApplyDialog()Ll/v3f$d;

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
    new-instance v1, Ll/xeg;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/xeg;-><init>(Ll/cfg;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/yeg;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/yeg;-><init>(Ll/cfg;)V

    .line 36
    .line 37
    .line 38
    new-instance p0, Ll/zeg;

    .line 39
    .line 40
    invoke-direct {p0}, Ll/zeg;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method
