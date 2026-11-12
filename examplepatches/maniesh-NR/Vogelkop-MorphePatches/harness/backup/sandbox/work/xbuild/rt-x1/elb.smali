.class public abstract Lelb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# instance fields
.field public final a:F

.field public final b:F

.field public final c:F

.field public final d:F

.field public final e:Landroidx/recyclerview/widget/i;

.field public final f:B

.field public final g:Landroid/animation/ValueAnimator;

.field public final h:B

.field public i:Z

.field public j:Z

.field public k:F

.field public l:F

.field public m:F

.field public n:F

.field public o:Ljava/lang/Float;

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:F


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/i;IIFFFF)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p3, p0, Lelb;->f:B

    iput-byte p2, p0, Lelb;->h:B

    iput-object p1, p0, Lelb;->e:Landroidx/recyclerview/widget/i;

    iput p4, p0, Lelb;->a:F

    iput p5, p0, Lelb;->b:F

    iput p6, p0, Lelb;->c:F

    iput p7, p0, Lelb;->d:F

    const/4 p2, 0x2

    new-array p2, p2, [F

    fill-array-data p2, :array_34

    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    iput-object p2, p0, Lelb;->g:Landroid/animation/ValueAnimator;

    new-instance p3, Ljq3;

    const/4 p4, 0x3

    invoke-direct {p3, p0, p4}, Ljq3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lelb;->a(F)V

    return-void

    nop

    :array_34
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public a(F)V
    .registers 2

    iput p1, p0, Lelb;->t:F

    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p0, p1}, Lelb;->a(F)V

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    iget-boolean p1, p0, Lelb;->s:Z

    if-eqz p1, :cond_e

    const/4 p1, 0x0

    iput-boolean p1, p0, Lelb;->s:Z

    iget-object v0, p0, Lelb;->e:Landroidx/recyclerview/widget/i;

    iget-object v0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setHasTransientState(Z)V

    :cond_e
    const/4 p1, 0x1

    iput-boolean p1, p0, Lelb;->r:Z

    return-void
.end method

.method public final onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method
