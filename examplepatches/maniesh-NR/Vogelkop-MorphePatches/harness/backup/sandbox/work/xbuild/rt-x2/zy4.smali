.class public final Lzy4;
.super Liz4;
.source "SourceFile"

# interfaces
.implements Lj0b;


# instance fields
.field public final a:Lb7f;

.field public b:Lr9b;

.field public c:Lr9b;

.field public final d:Llb4;

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:Z

.field public l:I

.field public m:I

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:I


# direct methods
.method public constructor <init>(Llb4;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ldtl;

    invoke-direct {v0}, Ldtl;-><init>()V

    invoke-static {v0}, Luup;->m(Ljava/lang/Object;)Lb7f;

    move-result-object v0

    iput-object v0, p0, Lzy4;->a:Lb7f;

    sget-object v0, Lr9b;->e:Lr9b;

    iput-object v0, p0, Lzy4;->b:Lr9b;

    iput-object v0, p0, Lzy4;->c:Lr9b;

    const/4 v0, 0x1

    iput v0, p0, Lzy4;->q:I

    iput-object p1, p0, Lzy4;->d:Llb4;

    return-void
.end method


# virtual methods
.method public final K(I)V
    .registers 3

    iget v0, p0, Lzy4;->q:I

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput p1, p0, Lzy4;->q:I

    invoke-virtual {p0}, Lzy4;->T()V

    return-void
.end method

.method public final M()I
    .registers 3

    iget v0, p0, Lzy4;->q:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_12

    iget v0, p0, Lzy4;->e:I

    if-lez v0, :cond_12

    iget-boolean v0, p0, Lzy4;->o:Z

    if-nez v0, :cond_12

    iget-object p0, p0, Lzy4;->c:Lr9b;

    iget p0, p0, Lr9b;->d:I

    return p0

    :cond_12
    iget v0, p0, Lzy4;->e:I

    if-lez v0, :cond_22

    iget-boolean v0, p0, Lzy4;->o:Z

    if-nez v0, :cond_22

    iget-object v0, p0, Lzy4;->c:Lr9b;

    iget v0, v0, Lr9b;->d:I

    iget p0, p0, Lzy4;->f:I

    :goto_20
    add-int/2addr v0, p0

    return v0

    :cond_22
    iget-object v0, p0, Lzy4;->c:Lr9b;

    iget v0, v0, Lr9b;->d:I

    iget p0, p0, Lzy4;->i:I

    goto :goto_20
.end method

.method public final N()I
    .registers 5

    iget-boolean v0, p0, Lzy4;->n:Z

    if-eqz v0, :cond_9

    iget-object p0, p0, Lzy4;->c:Lr9b;

    iget p0, p0, Lr9b;->d:I

    return p0

    :cond_9
    iget-boolean v0, p0, Lzy4;->o:Z

    if-eqz v0, :cond_12

    invoke-virtual {p0}, Lzy4;->M()I

    move-result p0

    return p0

    :cond_12
    iget v1, p0, Lzy4;->e:I

    if-lez v1, :cond_1b

    invoke-virtual {p0}, Lzy4;->M()I

    move-result p0

    return p0

    :cond_1b
    iget v2, p0, Lzy4;->j:I

    const/4 v3, 0x2

    and-int/2addr v2, v3

    if-eqz v2, :cond_26

    iget-object p0, p0, Lzy4;->c:Lr9b;

    iget p0, p0, Lr9b;->d:I

    return p0

    :cond_26
    iget v2, p0, Lzy4;->q:I

    if-ne v2, v3, :cond_33

    if-lez v1, :cond_33

    if-nez v0, :cond_33

    iget-object p0, p0, Lzy4;->c:Lr9b;

    iget p0, p0, Lr9b;->d:I

    return p0

    :cond_33
    iget-object v0, p0, Lzy4;->c:Lr9b;

    iget v0, v0, Lr9b;->d:I

    iget p0, p0, Lzy4;->h:I

    add-int/2addr v0, p0

    return v0
.end method

.method public final O()I
    .registers 2

    iget-boolean v0, p0, Lzy4;->n:Z

    if-eqz v0, :cond_9

    iget-object p0, p0, Lzy4;->c:Lr9b;

    iget p0, p0, Lr9b;->b:I

    return p0

    :cond_9
    iget-boolean v0, p0, Lzy4;->p:Z

    if-eqz v0, :cond_15

    iget v0, p0, Lzy4;->g:I

    iget-object p0, p0, Lzy4;->c:Lr9b;

    iget p0, p0, Lr9b;->b:I

    :goto_13
    add-int/2addr v0, p0

    return v0

    :cond_15
    iget v0, p0, Lzy4;->j:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_20

    iget-object p0, p0, Lzy4;->c:Lr9b;

    iget p0, p0, Lr9b;->b:I

    return p0

    :cond_20
    iget v0, p0, Lzy4;->g:I

    iget-object p0, p0, Lzy4;->c:Lr9b;

    iget p0, p0, Lr9b;->b:I

    goto :goto_13
.end method

.method public final Q()I
    .registers 4

    iget v0, p0, Lzy4;->q:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eq v0, v1, :cond_28

    const/4 v1, 0x3

    if-eq v0, v1, :cond_28

    iget-boolean v0, p0, Lzy4;->o:Z

    iget v1, p0, Lzy4;->e:I

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lzy4;->c:Lr9b;

    iget v0, v0, Lr9b;->d:I

    sub-int/2addr v1, v0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget p0, p0, Lzy4;->f:I

    :goto_1a
    add-int/2addr v0, p0

    return v0

    :cond_1c
    invoke-virtual {p0}, Lzy4;->N()I

    move-result v0

    sub-int/2addr v1, v0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget p0, p0, Lzy4;->f:I

    goto :goto_1a

    :cond_28
    return v2
.end method

.method public final R()I
    .registers 4

    iget-boolean v0, p0, Lzy4;->o:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    return v1

    :cond_6
    iget-object v0, p0, Lzy4;->a:Lb7f;

    iget-object v0, v0, Lb7f;->b:Ljava/lang/Object;

    check-cast v0, Ldtl;

    iget-boolean v2, v0, Ldtl;->g:Z

    if-eqz v2, :cond_13

    iget v0, v0, Ldtl;->c:I

    goto :goto_15

    :cond_13
    iget v0, v0, Ldtl;->d:I

    :goto_15
    iget v2, p0, Lzy4;->e:I

    sub-int/2addr v2, v0

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget p0, p0, Lzy4;->f:I

    add-int/2addr v0, p0

    return v0
.end method

.method public final S()V
    .registers 12

    iget v0, p0, Lzy4;->q:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eq v0, v1, :cond_d

    iget-object v0, p0, Lzy4;->b:Lr9b;

    iput-object v0, p0, Lzy4;->c:Lr9b;

    move-object v1, v0

    move v0, v2

    goto :goto_3b

    :cond_d
    iget v0, p0, Lzy4;->f:I

    iget v1, p0, Lzy4;->e:I

    iget-object v3, p0, Lzy4;->b:Lr9b;

    iget v3, v3, Lr9b;->d:I

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget-object v3, p0, Lzy4;->c:Lr9b;

    iget v4, v3, Lr9b;->a:I

    iget-object v5, p0, Lzy4;->b:Lr9b;

    iget v6, v5, Lr9b;->a:I

    iget v7, v5, Lr9b;->c:I

    iget v5, v5, Lr9b;->b:I

    if-ne v4, v6, :cond_35

    iget v4, v3, Lr9b;->b:I

    if-ne v4, v5, :cond_35

    iget v4, v3, Lr9b;->c:I

    if-ne v4, v7, :cond_35

    iget v4, v3, Lr9b;->d:I

    if-ne v4, v1, :cond_35

    move-object v1, v3

    goto :goto_3b

    :cond_35
    invoke-static {v6, v5, v7, v1}, Lr9b;->c(IIII)Lr9b;

    move-result-object v1

    iput-object v1, p0, Lzy4;->c:Lr9b;

    :goto_3b
    new-instance v3, Ldtl;

    iget v4, p0, Lzy4;->g:I

    iget v1, v1, Lr9b;->b:I

    add-int/2addr v4, v1

    invoke-virtual {p0}, Lzy4;->O()I

    move-result v5

    invoke-virtual {p0}, Lzy4;->M()I

    move-result v1

    add-int v7, v1, v0

    invoke-virtual {p0}, Lzy4;->N()I

    move-result v1

    add-int v8, v1, v0

    iget v9, p0, Lzy4;->i:I

    iget v10, p0, Lzy4;->e:I

    iget v0, p0, Lzy4;->l:I

    if-nez v0, :cond_5e

    iget v0, p0, Lzy4;->g:I

    if-gtz v0, :cond_6c

    :cond_5e
    iget v0, p0, Lzy4;->m:I

    if-nez v0, :cond_6d

    invoke-virtual {p0}, Lzy4;->M()I

    move-result v0

    invoke-virtual {p0}, Lzy4;->N()I

    move-result v1

    if-le v0, v1, :cond_6d

    :cond_6c
    const/4 v2, 0x1

    :cond_6d
    move v6, v2

    invoke-direct/range {v3 .. v10}, Ldtl;-><init>(IIZIIII)V

    iget-object v0, p0, Lzy4;->a:Lb7f;

    iget-object v1, v0, Lb7f;->b:Ljava/lang/Object;

    invoke-virtual {v3, v1}, Ldtl;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7c

    return-void

    :cond_7c
    invoke-virtual {v0, v3}, Lb7f;->d(Ljava/lang/Object;)V

    iget-object p0, p0, Lzy4;->d:Llb4;

    invoke-virtual {p0}, Llb4;->run()V

    return-void
.end method

.method public final T()V
    .registers 5

    iget-boolean v0, p0, Lzy4;->k:Z

    if-nez v0, :cond_3b

    iget v0, p0, Lzy4;->l:I

    iget-object v1, p0, Lzy4;->a:Lb7f;

    if-gez v0, :cond_1e

    iget-object v2, v1, Lb7f;->b:Ljava/lang/Object;

    check-cast v2, Ldtl;

    iget v3, v2, Ldtl;->a:I

    iget v2, v2, Ldtl;->b:I

    sub-int/2addr v3, v2

    neg-int v2, v3

    if-le v0, v2, :cond_1e

    iget v0, p0, Lzy4;->g:I

    invoke-virtual {p0}, Lzy4;->O()I

    move-result v2

    if-gt v0, v2, :cond_3b

    :cond_1e
    iget v0, p0, Lzy4;->m:I

    if-lez v0, :cond_38

    iget-object v1, v1, Lb7f;->b:Ljava/lang/Object;

    check-cast v1, Ldtl;

    iget v2, v1, Ldtl;->c:I

    iget v1, v1, Ldtl;->d:I

    sub-int/2addr v2, v1

    if-ge v0, v2, :cond_38

    invoke-virtual {p0}, Lzy4;->M()I

    move-result v0

    invoke-virtual {p0}, Lzy4;->N()I

    move-result v1

    if-le v0, v1, :cond_38

    return-void

    :cond_38
    invoke-virtual {p0}, Lzy4;->S()V

    :cond_3b
    return-void
.end method

.method public final b(ZZ)V
    .registers 3

    iget-boolean p2, p0, Lzy4;->p:Z

    if-ne p2, p1, :cond_5

    return-void

    :cond_5
    iput-boolean p1, p0, Lzy4;->p:Z

    invoke-virtual {p0}, Lzy4;->T()V

    return-void
.end method

.method public final i(Lcom/opera/android/browser/chromium/ChromiumContent;III)V
    .registers 5

    iget p1, p0, Lzy4;->l:I

    if-ne p2, p1, :cond_9

    iget p1, p0, Lzy4;->m:I

    if-ne p4, p1, :cond_9

    return-void

    :cond_9
    iput p2, p0, Lzy4;->l:I

    iput p4, p0, Lzy4;->m:I

    invoke-virtual {p0}, Lzy4;->T()V

    return-void
.end method

.method public final l(Lcom/opera/android/browser/chromium/ChromiumContent;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 4

    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez v0, :cond_13

    iget-boolean p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz p2, :cond_13

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->x0()I

    move-result p1

    invoke-virtual {p0, p1}, Lzy4;->K(I)V

    :cond_13
    return-void
.end method
