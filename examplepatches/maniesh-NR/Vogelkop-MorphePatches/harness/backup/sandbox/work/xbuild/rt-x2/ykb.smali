.class public final Lykb;
.super Lelb;
.source "SourceFile"


# instance fields
.field public u:Z

.field public final synthetic v:F

.field public final synthetic w:F

.field public final synthetic x:Lflb;


# direct methods
.method public constructor <init>(Lflb;Landroidx/recyclerview/widget/i;FFFF)V
    .registers 15

    iput p5, p0, Lykb;->v:F

    iput p6, p0, Lykb;->w:F

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lykb;->x:Lflb;

    const/4 v2, 0x4

    const/4 v3, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v7}, Lelb;-><init>(Landroidx/recyclerview/widget/i;IIFFFF)V

    return-void
.end method


# virtual methods
.method public final a(F)V
    .registers 3

    iput p1, p0, Lelb;->t:F

    iget-boolean v0, p0, Lykb;->u:Z

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lelb;->e:Landroidx/recyclerview/widget/i;

    iget-object v0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lelb;->p:Z

    iget p1, p0, Lykb;->v:F

    iput p1, p0, Lelb;->m:F

    iget p1, p0, Lykb;->w:F

    iput p1, p0, Lelb;->n:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lelb;->o:Ljava/lang/Float;

    return-void
.end method

.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .registers 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lykb;->u:Z

    invoke-super {p0, p1}, Lelb;->onAnimationCancel(Landroid/animation/Animator;)V

    iget-object p0, p0, Lelb;->e:Landroidx/recyclerview/widget/i;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 4

    invoke-super {p0, p1}, Lelb;->onAnimationEnd(Landroid/animation/Animator;)V

    iget-object p1, p0, Lelb;->e:Landroidx/recyclerview/widget/i;

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    iget-boolean v0, p0, Lykb;->u:Z

    if-nez v0, :cond_28

    iget-boolean v0, p0, Lelb;->q:Z

    if-nez v0, :cond_28

    iget-object p0, p0, Lykb;->x:Lflb;

    iget-object v0, p0, Lflb;->q:Lblb;

    iget-object v1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v1, p1}, Lblb;->d(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)V

    iget-object v0, p0, Lflb;->A:Landroid/view/View;

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-ne v0, p1, :cond_28

    if-ne p1, v0, :cond_28

    const/4 p1, 0x0

    iput-object p1, p0, Lflb;->A:Landroid/view/View;

    :cond_28
    return-void
.end method
