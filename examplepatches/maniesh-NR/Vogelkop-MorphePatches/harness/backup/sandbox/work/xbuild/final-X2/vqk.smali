.class public final Lvqk;
.super Lk56;
.source "SourceFile"


# instance fields
.field public final t:Lp79;

.field public final u:Landroid/animation/TimeAnimator;

.field public v:Z

.field public w:Z


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Z)V
    .registers 6

    invoke-direct {p0}, Lk56;-><init>()V

    new-instance v0, Lp79;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x3

    new-array v1, v1, [I

    iput-object v1, v0, Lp79;->a:[I

    iput-object v0, p0, Lvqk;->t:Lp79;

    new-instance v0, Landroid/animation/TimeAnimator;

    invoke-direct {v0}, Landroid/animation/TimeAnimator;-><init>()V

    iput-object v0, p0, Lvqk;->u:Landroid/animation/TimeAnimator;

    iput-boolean p2, p0, Lvqk;->w:Z

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v1, 0x7f0c0091

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    int-to-long v1, p2

    iput-wide v1, p0, Landroidx/recyclerview/widget/e;->c:J

    iput-wide v1, p0, Landroidx/recyclerview/widget/e;->d:J

    iput-wide v1, p0, Landroidx/recyclerview/widget/e;->e:J

    const/4 p2, 0x0

    iput-boolean p2, p0, Lxkj;->g:Z

    new-instance p2, Luqk;

    invoke-direct {p2, p0, p1}, Luqk;-><init>(Lvqk;Landroidx/recyclerview/widget/RecyclerView;)V

    invoke-virtual {v0, p2}, Landroid/animation/TimeAnimator;->setTimeListener(Landroid/animation/TimeAnimator$TimeListener;)V

    return-void
.end method


# virtual methods
.method public final f()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lvqk;->w:Z

    return-void
.end method

.method public final i(Lvph;Landroidx/recyclerview/widget/i;ILjava/util/List;)Lfr;
    .registers 8

    iget-object v0, p0, Lvqk;->t:Lp79;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-boolean v1, p1, Lvph;->g:Z

    if-eqz v1, :cond_18

    invoke-virtual {p2}, Landroidx/recyclerview/widget/i;->getLayoutPosition()I

    move-result v1

    iget-object v0, v0, Lp79;->a:[I

    array-length v2, v0

    if-ge v1, v2, :cond_18

    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    aput v2, v0, v1

    :cond_18
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/e;->i(Lvph;Landroidx/recyclerview/widget/i;ILjava/util/List;)Lfr;

    move-result-object p0

    return-object p0
.end method

.method public final k(Landroidx/recyclerview/widget/i;)Z
    .registers 3

    iget-boolean v0, p0, Lvqk;->w:Z

    if-nez v0, :cond_9

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    const/4 p0, 0x0

    return p0

    :cond_9
    invoke-super {p0, p1}, Lk56;->k(Landroidx/recyclerview/widget/i;)Z

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/high16 v0, 0x42f00000    # 120.0f

    invoke-static {v0, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    const/4 p0, 0x1

    return p0
.end method

.method public final l(Landroidx/recyclerview/widget/i;Landroidx/recyclerview/widget/i;IIII)Z
    .registers 7

    const/4 p3, 0x0

    if-ne p2, p1, :cond_7

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    return p3

    :cond_7
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    return p3
.end method

.method public final m(Landroidx/recyclerview/widget/i;IIII)Z
    .registers 7

    iget-boolean v0, p0, Lvqk;->v:Z

    if-eqz v0, :cond_9

    invoke-super/range {p0 .. p5}, Lk56;->m(Landroidx/recyclerview/widget/i;IIII)Z

    move-result p0

    return p0

    :cond_9
    invoke-virtual {p0, p1}, Lxkj;->o(Landroidx/recyclerview/widget/i;)V

    const/4 p0, 0x0

    return p0
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    const/4 p0, 0x0

    return p0
.end method

.method public final p()V
    .registers 1

    iget-object p0, p0, Lvqk;->u:Landroid/animation/TimeAnimator;

    invoke-virtual {p0}, Landroid/animation/TimeAnimator;->start()V

    return-void
.end method

.method public final r()V
    .registers 1

    iget-object p0, p0, Lvqk;->u:Landroid/animation/TimeAnimator;

    invoke-virtual {p0}, Landroid/animation/TimeAnimator;->start()V

    return-void
.end method

.method public final s(Landroidx/recyclerview/widget/i;)V
    .registers 9

    iget-boolean v0, p0, Lvqk;->w:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getLayoutPosition()I

    iget-object v0, p0, Lk56;->p:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v4, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v5

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {v5, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-object v1, Llf1;->l:Landroid/view/animation/PathInterpolator;

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-wide v1, p0, Landroidx/recyclerview/widget/e;->c:J

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lf56;

    const/4 v6, 0x2

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v1 .. v6}, Lf56;-><init>(Lk56;Landroidx/recyclerview/widget/i;Landroid/view/View;Landroid/view/ViewPropertyAnimator;B)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final u(Landroidx/recyclerview/widget/i;)V
    .registers 2

    return-void
.end method
