.class public Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;
.super Landroid/view/ViewGroup;
.source ""

# interfaces
.implements Ld/h/l/j;
.implements Ld/h/l/f;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$g;,
        Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$h;
    }
.end annotation


# static fields
.field public static final O:Ljava/lang/String;

.field public static final P:[I


# instance fields
.field public A:I

.field public B:I

.field public C:Ld/u/a/d;

.field public D:Landroid/view/animation/Animation;

.field public E:Landroid/view/animation/Animation;

.field public F:Landroid/view/animation/Animation;

.field public G:Landroid/view/animation/Animation;

.field public H:Landroid/view/animation/Animation;

.field public I:Z

.field public J:I

.field public K:Z

.field public L:Landroid/view/animation/Animation$AnimationListener;

.field public final M:Landroid/view/animation/Animation;

.field public final N:Landroid/view/animation/Animation;

.field public a:Landroid/view/View;

.field public b:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$h;

.field public c:Z

.field public d:I

.field public e:F

.field public f:F

.field public final g:Ld/h/l/k;

.field public final i:Ld/h/l/g;

.field public final j:[I

.field public final k:[I

.field public l:Z

.field public m:I

.field public n:I

.field public o:F

.field public p:F

.field public q:Z

.field public r:I

.field public s:Z

.field public t:Z

.field public final u:Landroid/view/animation/DecelerateInterpolator;

.field public v:Ld/u/a/a;

.field public w:I

.field public x:I

.field public y:F

.field public z:I


# virtual methods
.method public final a(ZZ)V
    .registers 5

    invoke-static {p0, p1, p2}, Le/e/a/RefreshDispatch;->accept(Ljava/lang/Object;ZZ)V

    iget-boolean v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    if-eq v0, p1, :cond_43

    iput-boolean p2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->I:Z

    invoke-virtual {p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->b()V

    iput-boolean p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    iget-boolean p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    if-eqz p1, :cond_3e

    iget p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->n:I

    iget-object p2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->L:Landroid/view/animation/Animation$AnimationListener;

    .line 19
    iput p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->x:I

    iget-object p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->M:Landroid/view/animation/Animation;

    invoke-virtual {p1}, Landroid/view/animation/Animation;->reset()V

    iget-object p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->M:Landroid/view/animation/Animation;

    const-wide/16 v0, 0xc8

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    iget-object p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->M:Landroid/view/animation/Animation;

    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->u:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p1, v0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    if-eqz p2, :cond_31

    iget-object p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    .line 20
    iput-object p2, p1, Ld/u/a/a;->a:Landroid/view/animation/Animation$AnimationListener;

    .line 21
    :cond_31
    iget-object p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    invoke-virtual {p1}, Landroid/widget/ImageView;->clearAnimation()V

    iget-object p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->v:Ld/u/a/a;

    iget-object p2, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->M:Landroid/view/animation/Animation;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_43

    .line 22
    :cond_3e
    iget-object p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->L:Landroid/view/animation/Animation$AnimationListener;

    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->a(Landroid/view/animation/Animation$AnimationListener;)V

    :cond_43
    :goto_43
    return-void
.end method
