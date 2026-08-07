.class public Ll/lcd0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/ocd0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Frag;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Ll/ar2;-><init>(Ll/ner;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1}, Ll/lcd0;->l0(Lcom/p1/mobile/android/app/Frag;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e0(Ll/lcd0;Ljava/lang/String;ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/lcd0;->m0(Ljava/lang/String;ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic f0(Ll/lcd0;Ll/kr40;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lcd0;->p0(Ll/kr40;)V

    return-void
.end method

.method public static synthetic g0(Ll/lcd0;Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lcd0;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;)V

    return-void
.end method

.method public static synthetic h0(Ll/lcd0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lcd0;->n0(Ljava/lang/Throwable;)V

    return-void
.end method

.method private l0(Lcom/p1/mobile/android/app/Frag;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string v0, "right_type"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/lcd0;->a:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 18
    .line 19
    const-string v0, "anchor_id"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/lcd0;->b:Ljava/lang/String;

    .line 26
    .line 27
    :cond_0
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
    invoke-virtual {p0}, Ll/lcd0;->s0()V

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

.method public i0(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lcd0;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->equipNiceNumber(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/icd0;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, p2}, Ll/icd0;-><init>(Ll/lcd0;Ljava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ll/jcd0;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Ll/jcd0;-><init>(Ll/lcd0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final j0(ILjava/lang/String;)V
    .locals 1

    .line 1
    const v0, 0xa49c

    .line 2
    .line 3
    .line 4
    if-eq p1, v0, :cond_1

    .line 5
    .line 6
    const v0, 0xa4a1

    .line 7
    .line 8
    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    invoke-static {p2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/lcd0;->q0()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final k0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 4
    .line 5
    const v1, 0xa49c

    .line 6
    .line 7
    .line 8
    if-eq v0, v1, :cond_2

    .line 9
    .line 10
    const v1, 0xa4a1

    .line 11
    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    if-eqz p3, :cond_1

    .line 17
    .line 18
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->h1:I

    .line 19
    .line 20
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->j1:I

    .line 25
    .line 26
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p0, Ll/ocd0;

    .line 32
    .line 33
    invoke-virtual {p0, p2}, Ll/ocd0;->j(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, v0, p1}, Ll/lcd0;->j0(ILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic m0(Ljava/lang/String;ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p3, p1, p2}, Ll/lcd0;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, v0, p1}, Ll/lcd0;->j0(ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ocd0;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, v0}, Ll/ocd0;->s(Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic p0(Ll/kr40;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ocd0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ocd0;->v(Ll/kr40;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lcd0;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getNiceNumberList(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/kcd0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/kcd0;-><init>(Ll/lcd0;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public r0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ocd0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/lcd0;->a:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/ocd0;->l(Lcom/p1/mobile/putong/live/base/bean/UserRightType;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final s0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lcd0;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getNiceNumberDetails(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/lcd0;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getNiceNumberList(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/gcd0;

    .line 14
    .line 15
    invoke-direct {v2}, Ll/gcd0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1, v2}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/hcd0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/hcd0;-><init>(Ll/lcd0;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method
