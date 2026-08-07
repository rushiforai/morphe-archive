.class public Ll/hgg;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/igg;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Ll/hgg;->b:Z

    .line 5
    .line 6
    iput-boolean p1, p0, Ll/hgg;->b:Z

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Ll/hgg;ZILcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/hgg;->k0(ZILcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V

    return-void
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
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

.method public static synthetic g0(Ll/hgg;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hgg;->m0(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ll/hgg;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hgg;->l0(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/hgg;->n0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i0(ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/igg;

    .line 4
    .line 5
    const-string v1, "approved"

    .line 6
    .line 7
    invoke-virtual {v0, p1, v1}, Ll/igg;->k(ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p2, p3, p4}, Ll/sfg;->a(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p0, p2}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    new-instance p3, Ll/fgg;

    .line 19
    .line 20
    invoke-direct {p3, p0, p4, p1}, Ll/fgg;-><init>(Ll/hgg;ZI)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Ll/ggg;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/ggg;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {p3, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public j0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/hgg;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic k0(ZILcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/igg;

    .line 6
    .line 7
    const-string p1, "approved"

    .line 8
    .line 9
    invoke-virtual {p0, p2, p1}, Ll/igg;->k(ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->s:I

    .line 13
    .line 14
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    check-cast p0, Ll/igg;

    .line 19
    .line 20
    const-string p1, "rejected"

    .line 21
    .line 22
    invoke-virtual {p0, p2, p1}, Ll/igg;->k(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->u:I

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic l0(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/hgg;->a:Z

    .line 3
    .line 4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    check-cast p0, Ll/igg;

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Ll/igg;->j(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    check-cast p0, Ll/igg;

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Ll/igg;->d(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic m0(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p0, Ll/hgg;->a:Z

    .line 3
    .line 4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    check-cast p0, Ll/igg;

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Ll/igg;->j(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    check-cast p0, Ll/igg;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/igg;->i()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public n0(Ljava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/hgg;->a:Z

    .line 3
    .line 4
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0, p1}, Ll/sfg;->f(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/dgg;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1}, Ll/dgg;-><init>(Ll/hgg;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v2, Ll/egg;

    .line 22
    .line 23
    invoke-direct {v2, p0, p1}, Ll/egg;-><init>(Ll/hgg;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method
