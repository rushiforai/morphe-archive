.class public final Lxs2;
.super Ls75;
.source "SourceFile"


# instance fields
.field public d:Z

.field public e:F

.field public f:F

.field public g:Lus2;

.field public final synthetic h:Lbt2;


# direct methods
.method public constructor <init>(Lbt2;)V
    .registers 2

    iput-object p1, p0, Lxs2;->h:Lbt2;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Ls75;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final h(Ln2o;)V
    .registers 2

    iget-boolean p1, p0, Lxs2;->d:Z

    if-eqz p1, :cond_e

    iget-object p1, p0, Lxs2;->g:Lus2;

    if-eqz p1, :cond_b

    invoke-virtual {p1}, Lus2;->run()V

    :cond_b
    const/4 p1, 0x0

    iput-object p1, p0, Lxs2;->g:Lus2;

    :cond_e
    const/4 p1, 0x0

    iput-boolean p1, p0, Lxs2;->d:Z

    return-void
.end method

.method public final i(Ln2o;)V
    .registers 2

    iget-object p1, p0, Lxs2;->h:Lbt2;

    iget-object p1, p1, Lbt2;->b:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lxs2;->e:F

    return-void
.end method

.method public final j(Lg3o;Ljava/util/List;)Lg3o;
    .registers 5

    iget-boolean v0, p0, Lxs2;->d:Z

    if-eqz v0, :cond_27

    check-cast p2, Ljava/lang/Iterable;

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_a
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ln2o;

    iget-object v1, v1, Ln2o;->a:Lm2o;

    invoke-virtual {v1}, Lm2o;->d()I

    move-result v1

    and-int/lit8 v1, v1, 0x8

    if-eqz v1, :cond_a

    goto :goto_23

    :cond_22
    const/4 v0, 0x0

    :goto_23
    check-cast v0, Ln2o;

    if-nez v0, :cond_28

    :cond_27
    return-object p1

    :cond_28
    iget-object p2, p0, Lxs2;->h:Lbt2;

    iget-object p2, p2, Lbt2;->b:Landroid/view/ViewGroup;

    iget v1, p0, Lxs2;->e:F

    iget p0, p0, Lxs2;->f:F

    sub-float/2addr v1, p0

    iget-object p0, v0, Ln2o;->a:Lm2o;

    invoke-virtual {p0}, Lm2o;->c()F

    move-result p0

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p0

    mul-float/2addr v0, v1

    invoke-virtual {p2, v0}, Landroid/view/View;->setTranslationY(F)V

    return-object p1
.end method

.method public final k(Ln2o;Lmgh;)Lmgh;
    .registers 5

    iget-object p1, p0, Lxs2;->h:Lbt2;

    iget-object p1, p1, Lbt2;->b:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lxs2;->f:F

    iget v1, p0, Lxs2;->e:F

    cmpl-float v0, v1, v0

    if-lez v0, :cond_19

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    if-eqz p1, :cond_19

    const/4 p1, 0x1

    goto :goto_1a

    :cond_19
    const/4 p1, 0x0

    :goto_1a
    iput-boolean p1, p0, Lxs2;->d:Z

    if-nez p1, :cond_28

    iget-object p1, p0, Lxs2;->g:Lus2;

    if-eqz p1, :cond_25

    invoke-virtual {p1}, Lus2;->run()V

    :cond_25
    const/4 p1, 0x0

    iput-object p1, p0, Lxs2;->g:Lus2;

    :cond_28
    return-object p2
.end method
