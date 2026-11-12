.class public final Ldal;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:F

.field public final synthetic c:Lgal;


# direct methods
.method public constructor <init>(Lgal;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldal;->c:Lgal;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 6

    iget-boolean v0, p0, Ldal;->a:Z

    iget-object v1, p0, Ldal;->c:Lgal;

    const/high16 v2, 0x3f000000    # 0.5f

    if-eqz v0, :cond_15

    iget v3, p0, Ldal;->b:F

    cmpg-float v3, v3, v2

    if-gez v3, :cond_15

    iget v3, v1, Lgal;->f:F

    const/4 v4, 0x0

    cmpg-float v3, v3, v4

    if-nez v3, :cond_25

    :cond_15
    if-eqz v0, :cond_27

    iget p0, p0, Ldal;->b:F

    cmpl-float p0, p0, v2

    if-lez p0, :cond_27

    iget p0, v1, Lgal;->f:F

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float p0, p0, v0

    if-eqz p0, :cond_27

    :cond_25
    const/4 p0, 0x1

    return p0

    :cond_27
    const/4 p0, 0x0

    return p0
.end method

.method public final b(I[I)V
    .registers 11

    iget-object v0, p0, Ldal;->c:Lgal;

    invoke-virtual {v0}, Lgal;->f()Z

    move-result v1

    if-eqz v1, :cond_a

    neg-int v1, p1

    goto :goto_b

    :cond_a
    move v1, p1

    :goto_b
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-gez v1, :cond_18

    iget v5, v0, Lgal;->f:F

    cmpl-float v5, v5, v2

    if-lez v5, :cond_18

    move v5, v4

    goto :goto_19

    :cond_18
    move v5, v3

    :goto_19
    const/high16 v6, 0x3f800000    # 1.0f

    if-lez v1, :cond_25

    iget v7, v0, Lgal;->f:F

    cmpg-float v7, v7, v6

    if-gez v7, :cond_25

    move v7, v4

    goto :goto_26

    :cond_25
    move v7, v3

    :goto_26
    if-nez v5, :cond_2a

    if-eqz v7, :cond_5d

    :cond_2a
    iget-boolean v5, p0, Ldal;->a:Z

    if-nez v5, :cond_3b

    iput-boolean v4, p0, Ldal;->a:Z

    iget v4, v0, Lgal;->f:F

    iput v4, p0, Ldal;->b:F

    iget-object v4, v0, Lgal;->k:Landroid/animation/ValueAnimator;

    if-eqz v4, :cond_3b

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_3b
    iget-boolean p0, p0, Ldal;->a:Z

    if-eqz p0, :cond_5d

    int-to-float p0, v1

    iget-object v1, v0, Lgal;->c:Lebl;

    iget-object v1, v1, Lebl;->a:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v4, Lgal;->w:Lixh;

    invoke-virtual {v4, v1}, Ly7h;->l(Landroid/content/Context;)F

    move-result v1

    div-float/2addr p0, v1

    iget v1, v0, Lgal;->f:F

    add-float/2addr v1, p0

    invoke-static {v1, v2, v6}, Ldjh;->b(FFF)F

    move-result p0

    iput p0, v0, Lgal;->f:F

    invoke-virtual {v0}, Lgal;->e()V

    aput p1, p2, v3

    :cond_5d
    return-void
.end method
