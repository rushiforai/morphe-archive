.class public final Lckf;
.super Lqxe;
.source "SourceFile"


# instance fields
.field public k:Ljava/util/ArrayList;

.field public l:Ljava/util/ArrayList;

.field public m:I

.field public n:I

.field public o:I

.field public p:Z

.field public q:I

.field public r:I


# virtual methods
.method public final b(II)V
    .registers 3

    iput p1, p0, Lckf;->n:I

    iput p2, p0, Lckf;->o:I

    invoke-virtual {p0}, Lckf;->g()V

    return-void
.end method

.method public final c(Lorg/chromium/content_public/browser/WebContents;)V
    .registers 3

    invoke-super {p0, p1}, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->c(Lorg/chromium/content_public/browser/WebContents;)V

    if-eqz p1, :cond_10

    iget-boolean p1, p0, Lckf;->p:Z

    if-eqz p1, :cond_10

    iget p1, p0, Lckf;->q:I

    iget v0, p0, Lckf;->r:I

    invoke-super {p0, p1, v0}, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->e(II)V

    :cond_10
    return-void
.end method

.method public final didSwapBuffers()V
    .registers 4

    iget-object v0, p0, Lckf;->l:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_29

    iget-object v0, p0, Lckf;->l:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lckf;->l:Ljava/util/ArrayList;

    iget-wide v1, p0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    const/4 p0, 0x0

    invoke-static {v1, v2, p0}, LJ/N;->MTRhfnYH(JZ)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_1b
    if-ge p0, v1, :cond_29

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 p0, p0, 0x1

    check-cast v2, Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    goto :goto_1b

    :cond_29
    return-void
.end method

.method public final didSwapFrame()V
    .registers 4

    invoke-super {p0}, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->didSwapFrame()V

    iget-object v0, p0, Lckf;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_27

    iget-object v0, p0, Lckf;->k:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lckf;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 v1, 0x0

    :goto_19
    if-ge v1, p0, :cond_27

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    goto :goto_19

    :cond_27
    return-void
.end method

.method public final e(II)V
    .registers 4

    invoke-super {p0, p1, p2}, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->e(II)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lckf;->p:Z

    iput p1, p0, Lckf;->q:I

    iput p2, p0, Lckf;->r:I

    return-void
.end method

.method public final g()V
    .registers 4

    iget v0, p0, Lckf;->n:I

    iget v1, p0, Lckf;->o:I

    iget v2, p0, Lckf;->m:I

    sub-int/2addr v1, v2

    invoke-super {p0, v0, v1}, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->b(II)V

    return-void
.end method
