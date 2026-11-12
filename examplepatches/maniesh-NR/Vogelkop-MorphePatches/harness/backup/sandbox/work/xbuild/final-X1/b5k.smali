.class public final Lb5k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;
.implements Lile;


# instance fields
.field public final a:La5k;

.field public final b:La5k;

.field public c:Z

.field public d:Z

.field public e:Z

.field public final synthetic f:Lc5k;


# direct methods
.method public constructor <init>(Lc5k;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb5k;->f:Lc5k;

    new-instance p1, La5k;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, La5k;-><init>(Lb5k;B)V

    iput-object p1, p0, Lb5k;->a:La5k;

    new-instance p1, La5k;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, La5k;-><init>(Lb5k;B)V

    iput-object p1, p0, Lb5k;->b:La5k;

    return-void
.end method


# virtual methods
.method public final a(Landroidx/core/widget/NestedScrollView;IIII)V
    .registers 6

    if-eq p3, p5, :cond_e

    iget-object p1, p0, Lb5k;->f:Lc5k;

    iget-object p1, p1, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    iget-boolean p2, p1, Lcom/opera/android/feed/FeedScrollView;->S:Z

    if-nez p2, :cond_f

    iget p1, p1, Lcom/opera/android/feed/FeedScrollView;->R:I

    if-gtz p1, :cond_f

    :cond_e
    return-void

    :cond_f
    invoke-virtual {p0}, Lb5k;->b()V

    return-void
.end method

.method public final b()V
    .registers 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lb5k;->d:Z

    iput-boolean v0, p0, Lb5k;->e:Z

    iget-boolean v1, p0, Lb5k;->c:Z

    if-nez v1, :cond_a

    return-void

    :cond_a
    iput-boolean v0, p0, Lb5k;->c:Z

    iget-object v0, p0, Lb5k;->f:Lc5k;

    iget-object v1, v0, Lc5k;->p:Lcom/opera/android/feed/FeedScrollViewContentWrapper;

    invoke-virtual {v1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v0, v0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    iget-object v0, v0, Lcom/opera/android/feed/FeedScrollView;->D:Li7f;

    invoke-virtual {v0, p0}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lb5k;->a:La5k;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object p0, p0, Lb5k;->b:La5k;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final c()V
    .registers 7

    iget-object v0, p0, Lb5k;->f:Lc5k;

    iget-object v1, v0, Lc5k;->p:Lcom/opera/android/feed/FeedScrollViewContentWrapper;

    iget-object v2, v0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    const/4 v3, 0x0

    iput-boolean v3, p0, Lb5k;->d:Z

    iget-boolean v3, p0, Lb5k;->c:Z

    if-eqz v3, :cond_44

    iget-object v3, p0, Lb5k;->b:La5k;

    invoke-static {v3}, Lvml;->a(Ljava/lang/Runnable;)V

    const-wide/16 v4, 0x32

    invoke-static {v3, v4, v5}, Lvml;->d(Ljava/lang/Runnable;J)V

    iget-boolean v3, v1, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->e:Z

    if-eqz v3, :cond_45

    invoke-virtual {v2}, Landroid/view/View;->getScrollY()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v4

    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    sub-int/2addr v1, v4

    if-lt v3, v1, :cond_45

    iget-boolean v1, p0, Lb5k;->e:Z

    invoke-virtual {p0}, Lb5k;->b()V

    if-eqz v1, :cond_44

    invoke-virtual {v0}, Lc5k;->b()Lxw8;

    move-result-object p0

    if-eqz p0, :cond_44

    invoke-virtual {p0}, Lxw8;->g()V

    :cond_44
    return-void

    :cond_45
    iget-object v1, v0, Lc5k;->r:Lcom/opera/android/feed/FeedContainerView;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_59

    const/4 v1, 0x1

    invoke-virtual {v2, v1}, Lcom/opera/android/feed/FeedScrollView;->canScrollVertically(I)Z

    move-result v2

    if-eqz v2, :cond_59

    iput-boolean v1, p0, Lb5k;->e:Z

    invoke-virtual {v0}, Lc5k;->f()V

    :cond_59
    return-void
.end method

.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    iget-boolean p1, p0, Lb5k;->d:Z

    if-eqz p1, :cond_5

    return-void

    :cond_5
    const/4 p1, 0x1

    iput-boolean p1, p0, Lb5k;->d:Z

    new-instance p1, La5k;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, La5k;-><init>(Lb5k;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method
