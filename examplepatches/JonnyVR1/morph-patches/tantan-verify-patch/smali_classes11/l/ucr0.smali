.class public final Ll/ucr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/os/Handler;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Ll/vcr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Handler;Ll/vcr0;)V
    .locals 0
    .param p1    # Landroid/os/Handler;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/vcr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    :cond_0
    iput-object p1, p0, Ll/ucr0;->a:Landroid/os/Handler;

    .line 8
    .line 9
    iput-object p2, p0, Ll/ucr0;->b:Ll/vcr0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;JJ)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/ucr0;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/ybr0;

    .line 6
    .line 7
    move-object v2, p0

    .line 8
    move-object v3, p1

    .line 9
    move-wide v4, p2

    .line 10
    move-wide v6, p4

    .line 11
    invoke-direct/range {v1 .. v7}, Ll/ybr0;-><init>(Ll/ucr0;Ljava/lang/String;JJ)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ucr0;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/tcr0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/tcr0;-><init>(Ll/ucr0;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final c(Ll/vwx0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/vwx0;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ucr0;->a:Landroid/os/Handler;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v1, Ll/scr0;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Ll/scr0;-><init>(Ll/ucr0;Ll/vwx0;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final d(IJ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ucr0;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/mcr0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2, p3}, Ll/mcr0;-><init>(Ll/ucr0;IJ)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final e(Ll/vwx0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ucr0;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/qcr0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/qcr0;-><init>(Ll/ucr0;Ll/vwx0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final f(Ll/sqr0;Ll/zwx0;)V
    .locals 2
    .param p2    # Ll/zwx0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/ucr0;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/rcr0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2}, Ll/rcr0;-><init>(Ll/ucr0;Ll/sqr0;Ll/zwx0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic g(Ljava/lang/String;JJ)V
    .locals 1

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/ucr0;->b:Ll/vcr0;

    .line 4
    .line 5
    invoke-interface/range {p0 .. p5}, Ll/vcr0;->Y(Ljava/lang/String;JJ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic h(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/ucr0;->b:Ll/vcr0;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/vcr0;->T(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic i(Ll/vwx0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/vwx0;->a()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mpw0;->a:I

    .line 5
    .line 6
    iget-object p0, p0, Ll/ucr0;->b:Ll/vcr0;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/vcr0;->U(Ll/vwx0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic j(IJ)V
    .locals 1

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/ucr0;->b:Ll/vcr0;

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/vcr0;->a0(IJ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic k(Ll/vwx0;)V
    .locals 1

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/ucr0;->b:Ll/vcr0;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/vcr0;->V(Ll/vwx0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic l(Ll/sqr0;Ll/zwx0;)V
    .locals 1

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/ucr0;->b:Ll/vcr0;

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/vcr0;->X(Ll/sqr0;Ll/zwx0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic m(Ljava/lang/Object;J)V
    .locals 1

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/ucr0;->b:Ll/vcr0;

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/vcr0;->Z(Ljava/lang/Object;J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic n(JI)V
    .locals 1

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/ucr0;->b:Ll/vcr0;

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/vcr0;->b0(JI)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic o(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/ucr0;->b:Ll/vcr0;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/vcr0;->c0(Ljava/lang/Exception;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic p(Ll/aou0;)V
    .locals 1

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/ucr0;->b:Ll/vcr0;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/vcr0;->W(Ll/aou0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final q(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ucr0;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    new-instance v3, Ll/ncr0;

    .line 10
    .line 11
    invoke-direct {v3, p0, p1, v1, v2}, Ll/ncr0;-><init>(Ll/ucr0;Ljava/lang/Object;J)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final r(JI)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ucr0;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/ocr0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2, p3}, Ll/ocr0;-><init>(Ll/ucr0;JI)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final s(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ucr0;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/pcr0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/pcr0;-><init>(Ll/ucr0;Ljava/lang/Exception;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final t(Ll/aou0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ucr0;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/lcr0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/lcr0;-><init>(Ll/ucr0;Ll/aou0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
