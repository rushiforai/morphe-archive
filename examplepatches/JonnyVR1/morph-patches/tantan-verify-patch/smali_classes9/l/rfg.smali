.class public Ll/rfg;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ll/efg;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Z

.field public k:Z


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
    new-instance v0, Ll/efg;

    .line 5
    .line 6
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, p1, p0}, Ll/efg;-><init>(Lcom/p1/mobile/android/app/Act;Ll/rfg;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic S3(Ll/rfg;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rfg;->i4(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V

    return-void
.end method

.method public static synthetic T3(Ll/rfg;Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rfg;->n4(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V

    return-void
.end method

.method public static synthetic U3(Ll/rfg;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rfg;->m4(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic V3(Ll/rfg;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rfg;->o4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic W3(Ll/rfg;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rfg;->k4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic X3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->c3:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->C(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic Y3(Ll/rfg;Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupCountBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rfg;->j4(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupCountBean;)V

    return-void
.end method

.method public static synthetic Z3(Ll/rfg;ZILcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/rfg;->h4(ZILcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V

    return-void
.end method

.method public static synthetic a4(Ll/rfg;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rfg;->l4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    return-void
.end method

.method public static synthetic b4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->c3:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->C(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic c4(Ll/rfg;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rfg;->p4(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic p4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/rfg;->k:Z

    .line 6
    .line 7
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/efg;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public P3()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/rfg;->k:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/rfg;->r4()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/rfg;->s4()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public d4(ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-static {p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->A3(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p2}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    new-instance p3, Ll/kfg;

    .line 10
    .line 11
    invoke-direct {p3, p0, p4, p1}, Ll/kfg;-><init>(Ll/rfg;ZI)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/lfg;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/lfg;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p3, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public e4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->e4(Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/mfg;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/mfg;-><init>(Ll/rfg;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/nfg;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/nfg;-><init>()V

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

.method public f4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->E4(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/qfg;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/qfg;-><init>(Ll/rfg;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/hfg;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/hfg;-><init>(Ll/rfg;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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

.method public g4()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/rfg;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic h4(ZILcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/efg;

    .line 6
    .line 7
    const-string p1, "approved"

    .line 8
    .line 9
    invoke-virtual {p0, p2, p1}, Ll/efg;->Q(ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->l3:I

    .line 13
    .line 14
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    check-cast p0, Ll/efg;

    .line 19
    .line 20
    const-string p1, "rejected"

    .line 21
    .line 22
    invoke-virtual {p0, p2, p1}, Ll/efg;->Q(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->v3:I

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic i4(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V
    .locals 0

    .line 1
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->q3:I

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/rfg;->r4()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic j4(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupCountBean;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/efg;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupCountBean;->getCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x64

    .line 10
    .line 11
    if-lt v0, v1, :cond_0

    .line 12
    .line 13
    const-string p1, "99+"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupCountBean;->getCount()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :goto_0
    invoke-virtual {p0, p1}, Ll/efg;->P(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic k4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/efg;

    .line 4
    .line 5
    const-string p1, "0"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/efg;->P(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic l4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/rfg;->j:Z

    .line 3
    .line 4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    check-cast p0, Ll/efg;

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Ll/efg;->O(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    check-cast p0, Ll/efg;

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Ll/efg;->L(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic m4(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p0, Ll/rfg;->j:Z

    .line 3
    .line 4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    check-cast p0, Ll/efg;

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Ll/efg;->O(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    check-cast p0, Ll/efg;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/efg;->M()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic n4(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/efg;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/vp20;->p()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {v0, p0, p1}, Ll/efg;->N(ZLcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic o4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/efg;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/vp20;->p()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p1, p0, v0}, Ll/efg;->N(ZLcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public q4(Ljava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/rfg;->j:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->A5(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/gfg;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1}, Ll/gfg;-><init>(Ll/rfg;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/ifg;

    .line 28
    .line 29
    invoke-direct {v2, p0, p1}, Ll/ifg;-><init>(Ll/rfg;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public r4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->P4(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/ofg;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/ofg;-><init>(Ll/rfg;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/pfg;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/pfg;-><init>(Ll/rfg;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/rfg;->f4()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public s4()V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/rfg;->q4(Ljava/lang/String;)V

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
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansGroupEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;->showFansGroupPanel()Ll/v3f$d;

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
    new-instance v1, Ll/jfg;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/jfg;-><init>(Ll/rfg;)V

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
