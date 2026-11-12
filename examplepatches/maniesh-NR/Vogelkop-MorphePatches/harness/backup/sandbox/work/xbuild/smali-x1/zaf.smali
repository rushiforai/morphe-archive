.class public final Lzaf;
.super Ly08;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final synthetic b:Lgbf;


# direct methods
.method public constructor <init>(Lgbf;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzaf;->b:Lgbf;

    return-void
.end method


# virtual methods
.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 3

    invoke-virtual {p0, p1}, Lzaf;->a0(Lb2l;)V

    return-void
.end method

.method public final G(Lb2l;)V
    .registers 5

    iget-object v0, p0, Lzaf;->b:Lgbf;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lgbf;->m(Z)V

    move-object v2, p1

    check-cast v2, Ld7l;

    iget-object v2, v2, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->isLoading()Z

    move-result v2

    invoke-virtual {p0, p1, v2}, Lzaf;->X(Lb2l;Z)V

    invoke-virtual {p0, p1, v1}, Lzaf;->W(Lb2l;Z)V

    iget-object v1, v0, Lgbf;->m:Ldbf;

    invoke-virtual {v1, p1}, Ldbf;->C(Lb2l;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lgbf;->t(Z)V

    move-object v1, p1

    check-cast v1, Ld7l;

    iget-object v2, v1, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->P()I

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->Y()I

    invoke-virtual {v0, p1}, Lgbf;->u(Lb2l;)V

    iget-object p1, v0, Lgbf;->i:Landroid/view/View;

    new-instance v0, Lo5f;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lo5f;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lj7n;

    invoke-direct {p0, v0, p1}, Lj7n;-><init>(Lo5f;Landroid/view/View;)V

    invoke-static {p1, p0}, Lkff;->a(Landroid/view/View;Ljava/lang/Runnable;)Lkff;

    return-void
.end method

.method public final Q(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 3

    iget-boolean p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez p2, :cond_c

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Lzaf;->X(Lb2l;Z)V

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lzaf;->W(Lb2l;Z)V

    :cond_c
    return-void
.end method

.method public final U(Lb2l;J)V
    .registers 4

    iget-object p0, p0, Lzaf;->b:Lgbf;

    iget-object p0, p0, Lgbf;->m:Ldbf;

    iget-object p1, p0, Ldbf;->n:Lk18;

    invoke-static {p1}, Ldbf;->u(Loim;)Z

    move-result p1

    if-eqz p1, :cond_15

    iget-object p0, p0, Ldbf;->n:Lk18;

    iget-object p0, p0, Lk18;->c:Ljava/lang/Object;

    check-cast p0, Lp0h;

    invoke-virtual {p0, p2, p3}, Lp0h;->e(J)V

    :cond_15
    return-void
.end method

.method public final W(Lb2l;Z)V
    .registers 9

    iget-boolean v0, p0, Lzaf;->a:Z

    iget-object v1, p0, Lzaf;->b:Lgbf;

    iget-object v2, v1, Lgbf;->n:Lshf;

    const/4 v3, 0x0

    if-eqz v0, :cond_86

    if-eqz p2, :cond_15

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->K()I

    move-result v0

    goto :goto_16

    :cond_15
    move v0, v3

    :goto_16
    iget-object v1, v1, Lgbf;->b:Lz43;

    invoke-virtual {v1}, Lz43;->j()J

    move-result-wide v4

    invoke-virtual {v2, v0, v4, v5}, Lshf;->G(IJ)V

    if-nez p2, :cond_24

    invoke-virtual {p0, p1}, Lzaf;->Y(Lb2l;)V

    :cond_24
    move-object p0, p1

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->I()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_85

    check-cast p1, Ld7l;

    iget-object p2, p1, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/opera/android/browser/UrlMangler;->d(Ljava/lang/String;)Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_50

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_50

    move p1, v0

    goto :goto_51

    :cond_50
    move p1, v3

    :goto_51
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    const-string p2, "opera-distiller"

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6f

    const-string p2, "readermode"

    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6f

    move p0, v0

    goto :goto_70

    :cond_6f
    move p0, v3

    :goto_70
    if-nez p1, :cond_74

    if-eqz p0, :cond_75

    :cond_74
    move v3, v0

    :cond_75
    iget-object p0, v2, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/ToolbarProgressBar;

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result p1

    if-eq p1, v3, :cond_85

    invoke-virtual {p0, v3}, Lcom/opera/android/custom_views/ToolbarProgressBar;->setIndeterminate(Z)V

    invoke-virtual {v2}, Lshf;->Q()V

    :cond_85
    return-void

    :cond_86
    invoke-virtual {v2, v3}, Lshf;->r(Z)V

    return-void
.end method

.method public final X(Lb2l;Z)V
    .registers 4

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->I()Ljava/lang/String;

    move-result-object v0

    if-eqz p2, :cond_19

    invoke-static {v0}, Lwqm;->w(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_19

    invoke-static {v0}, Lwqm;->z(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_19

    const/4 p2, 0x1

    goto :goto_1a

    :cond_19
    const/4 p2, 0x0

    :goto_1a
    iput-boolean p2, p0, Lzaf;->a:Z

    invoke-virtual {p0, p1}, Lzaf;->Z(Lb2l;)V

    invoke-virtual {p0, p1}, Lzaf;->a0(Lb2l;)V

    iget-object p0, p0, Lzaf;->b:Lgbf;

    invoke-virtual {p0, p1}, Lgbf;->u(Lb2l;)V

    return-void
.end method

.method public final Y(Lb2l;)V
    .registers 4

    iget-object v0, p0, Lzaf;->b:Lgbf;

    iget-object v0, v0, Lgbf;->n:Lshf;

    iget-object v1, v0, Lshf;->a:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/ToolbarProgressBar;

    invoke-virtual {v1}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result v1

    if-nez v1, :cond_37

    iget-boolean p0, p0, Lzaf;->a:Z

    if-eqz p0, :cond_1b

    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->K()I

    move-result p0

    goto :goto_1c

    :cond_1b
    const/4 p0, 0x0

    :goto_1c
    invoke-virtual {v0}, Lshf;->Q()V

    iget-object p1, v0, Lshf;->c:Ljava/lang/Object;

    check-cast p1, Ln4h;

    iget v0, p1, Ln4h;->a:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2b

    iput p0, p1, Ln4h;->b:I

    return-void

    :cond_2b
    iget-object p1, p1, Ln4h;->c:Lshf;

    iget-object p1, p1, Lshf;->a:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/ToolbarProgressBar;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/opera/android/custom_views/SmoothProgressBar;->a:Z

    invoke-virtual {p1, p0}, Lcom/opera/android/custom_views/ToolbarProgressBar;->setProgress(I)V

    :cond_37
    return-void
.end method

.method public final Z(Lb2l;)V
    .registers 5

    iget-object v0, p0, Lzaf;->b:Lgbf;

    iget-object v0, v0, Lgbf;->j:Lvbf;

    iget-boolean p0, p0, Lzaf;->a:Z

    if-eqz p0, :cond_18

    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->I()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lwqm;->w(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_18

    const/4 p0, 0x1

    goto :goto_19

    :cond_18
    const/4 p0, 0x0

    :goto_19
    invoke-virtual {v0}, Lvbf;->q()V

    const-wide/16 v1, 0x20

    invoke-virtual {v0, v1, v2, p0}, Lvbf;->r(JZ)V

    return-void
.end method

.method public final a0(Lb2l;)V
    .registers 3

    iget-object p0, p0, Lzaf;->b:Lgbf;

    iget-object v0, p0, Lgbf;->j:Lvbf;

    invoke-virtual {v0, p1}, Lvbf;->s(Lb2l;)V

    iget-object v0, p0, Lgbf;->m:Ldbf;

    invoke-virtual {v0, p1}, Ldbf;->C(Lb2l;)V

    iget-object p0, p0, Lgbf;->b:Lz43;

    invoke-virtual {p0, p1}, Lz43;->z(Lb2l;)V

    return-void
.end method

.method public final f(Lb2l;)V
    .registers 4

    iget-object v0, p0, Lzaf;->b:Lgbf;

    iget-object v0, v0, Lgbf;->n:Lshf;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lshf;->r(Z)V

    invoke-virtual {p0, p1}, Lzaf;->a0(Lb2l;)V

    return-void
.end method

.method public final g(Lb2l;J)V
    .registers 4

    iget-object p0, p0, Lzaf;->b:Lgbf;

    iget-object p0, p0, Lgbf;->m:Ldbf;

    iget-object p1, p0, Ldbf;->n:Lk18;

    invoke-static {p1}, Ldbf;->u(Loim;)Z

    move-result p1

    if-eqz p1, :cond_15

    iget-object p0, p0, Ldbf;->n:Lk18;

    iget-object p0, p0, Lk18;->c:Ljava/lang/Object;

    check-cast p0, Lp0h;

    invoke-virtual {p0, p2, p3}, Lp0h;->h(J)V

    :cond_15
    return-void
.end method

.method public final i(Lb2l;Lqwi;)V
    .registers 4

    iget-object p0, p0, Lzaf;->b:Lgbf;

    iget-object v0, p0, Lgbf;->j:Lvbf;

    invoke-virtual {v0}, Lvbf;->q()V

    invoke-virtual {v0}, Lvbf;->q()V

    iget-object v0, v0, Lvbf;->t:Ltbf;

    iput-object p2, v0, Ltbf;->d:Lqwi;

    iget-object p0, p0, Lgbf;->m:Ldbf;

    invoke-virtual {p0, p1}, Ldbf;->C(Lb2l;)V

    return-void
.end method

.method public final j(Lb2l;)V
    .registers 4

    iget-object v0, p0, Lzaf;->b:Lgbf;

    iget-object v0, v0, Lgbf;->n:Lshf;

    iget-boolean v1, p0, Lzaf;->a:Z

    invoke-virtual {v0, v1}, Lshf;->r(Z)V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lzaf;->X(Lb2l;Z)V

    return-void
.end method

.method public final l(Lb2l;I)V
    .registers 3

    invoke-virtual {p0, p1}, Lzaf;->Y(Lb2l;)V

    return-void
.end method

.method public final r(Ld7l;)V
    .registers 2

    invoke-virtual {p0, p1}, Lzaf;->a0(Lb2l;)V

    return-void
.end method

.method public final v(Lb2l;)V
    .registers 2

    invoke-virtual {p0, p1}, Lzaf;->a0(Lb2l;)V

    invoke-virtual {p0, p1}, Lzaf;->Z(Lb2l;)V

    iget-object p0, p0, Lzaf;->b:Lgbf;

    invoke-virtual {p0, p1}, Lgbf;->u(Lb2l;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lgbf;->t(Z)V

    return-void
.end method

.method public final x(Lb2l;)V
    .registers 2

    invoke-virtual {p0, p1}, Lzaf;->a0(Lb2l;)V

    return-void
.end method
