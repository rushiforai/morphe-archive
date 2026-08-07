.class public Ll/qgg;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/live/external/page/fansgroup/a;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/qgg;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qgg;->q0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/qgg;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qgg;->m0(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V

    return-void
.end method

.method public static synthetic g0(Ll/qgg;Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qgg;->p0(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V

    return-void
.end method

.method public static synthetic h0(Ll/qgg;Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupCountBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qgg;->n0(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupCountBean;)V

    return-void
.end method

.method public static synthetic i0(Ll/qgg;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qgg;->o0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Ljava/lang/Throwable;)V
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
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->r:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->C(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/qgg;->r0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public k0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/sfg;->c(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/ogg;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/ogg;-><init>(Ll/qgg;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/pgg;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/pgg;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public l0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/sfg;->d(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/mgg;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/mgg;-><init>(Ll/qgg;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/ngg;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/ngg;-><init>(Ll/qgg;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic m0(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V
    .locals 0

    .line 1
    sget p1, Lcom/p1/mobile/putong/live/external/R$string;->t:I

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/qgg;->r0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupCountBean;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->f(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic o0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;

    .line 4
    .line 5
    const-string p1, "0"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->f(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic p0(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->e(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic q0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->e(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public r0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/sfg;->e(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/kgg;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/kgg;-><init>(Ll/qgg;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/lgg;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/lgg;-><init>(Ll/qgg;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method
