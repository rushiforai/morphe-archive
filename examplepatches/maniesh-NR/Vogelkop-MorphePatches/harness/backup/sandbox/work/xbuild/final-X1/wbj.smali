.class public final Lwbj;
.super Ln1f;
.source "SourceFile"


# instance fields
.field public e:Z

.field public f:F


# direct methods
.method public constructor <init>(Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;)V
    .registers 3

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Ln1f;-><init>(B)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lwbj;->e:Z

    const/4 v0, 0x0

    iput v0, p0, Lwbj;->f:F

    invoke-direct {p0, p1}, Lwbj;->q(Landroid/view/View;)V

    return-void
.end method

.method private q(Landroid/view/View;)V
    .registers 4

    new-instance v0, Ltk4;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Ltk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    return-void
.end method


# virtual methods
.method public final e(Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;)V
    .registers 5

    iget-object v0, p0, Ln1f;->b:Ljava/lang/Object;

    check-cast v0, Lsaj;

    if-eqz v0, :cond_13

    iget-object v1, p0, Ln1f;->c:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/RectF;

    if-eqz v1, :cond_13

    iget-object v0, v0, Lsaj;->f:Lzw5;

    invoke-interface {v0, v1}, Lzw5;->a(Landroid/graphics/RectF;)F

    move-result v0

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    iput v0, p0, Lwbj;->f:F

    iget-object v0, p0, Ln1f;->c:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_30

    iget-object v0, p0, Ln1f;->b:Ljava/lang/Object;

    check-cast v0, Lsaj;

    if-eqz v0, :cond_30

    iget-object v2, p0, Ln1f;->c:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/RectF;

    invoke-virtual {v0, v2}, Lsaj;->l(Landroid/graphics/RectF;)Z

    move-result v0

    goto :goto_31

    :cond_30
    move v0, v1

    :goto_31
    const/4 v2, 0x1

    if-nez v0, :cond_3c

    iget-object v0, p0, Ln1f;->c:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    goto :goto_3d

    :cond_3c
    move v1, v2

    :goto_3d
    iput-boolean v1, p0, Lwbj;->e:Z

    invoke-virtual {p0}, Lwbj;->m()Z

    move-result v0

    xor-int/2addr v0, v2

    invoke-virtual {p1, v0}, Landroid/view/View;->setClipToOutline(Z)V

    invoke-virtual {p0}, Lwbj;->m()Z

    move-result p0

    if-eqz p0, :cond_51

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    return-void

    :cond_51
    invoke-virtual {p1}, Landroid/view/View;->invalidateOutline()V

    return-void
.end method

.method public final m()Z
    .registers 2

    iget-boolean v0, p0, Lwbj;->e:Z

    if-eqz v0, :cond_a

    iget-boolean p0, p0, Ln1f;->a:Z

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    const/4 p0, 0x1

    return p0
.end method
