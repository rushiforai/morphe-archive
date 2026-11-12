.class public final Li03;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final a:Lh03;

.field public b:Lc1f;

.field public c:Z

.field public final d:Lpde;

.field public e:I

.field public f:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance p1, Lh03;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lh03;-><init>(Landroid/widget/FrameLayout;B)V

    iput-object p1, p0, Li03;->a:Lh03;

    new-instance p1, Lpde;

    new-instance v0, Lg03;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lg03;-><init>(II)V

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Li03;->d:Lpde;

    invoke-virtual {p0, v1}, Landroid/view/View;->setWillNotDraw(Z)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    iget-object v1, p0, Li03;->a:Lh03;

    if-eqz v0, :cond_1d

    invoke-static {p0}, Lq9n;->x(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1d

    iget-boolean v0, p0, Li03;->c:Z

    if-nez v0, :cond_2b

    iget-object v0, p0, Li03;->b:Lc1f;

    if-eqz v0, :cond_2b

    const/4 v2, 0x1

    iput-boolean v2, p0, Li03;->c:Z

    invoke-virtual {v0, v1}, Lc1f;->d(Lfck;)V

    return-void

    :cond_1d
    iget-boolean v0, p0, Li03;->c:Z

    if-eqz v0, :cond_2b

    iget-object v0, p0, Li03;->b:Lc1f;

    if-eqz v0, :cond_2b

    const/4 v2, 0x0

    iput-boolean v2, p0, Li03;->c:Z

    invoke-virtual {v0, v1}, Lc1f;->g(Lfck;)V

    :cond_2b
    return-void
.end method

.method public final onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .registers 6

    invoke-static {p0, p1}, Lg3o;->g(Landroid/view/View;Landroid/view/WindowInsets;)Lg3o;

    move-result-object v0

    iget-object v0, v0, Lg3o;->a:Ld3o;

    const/16 v1, 0x207

    invoke-virtual {v0, v1}, Ld3o;->i(I)Lr9b;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Ld3o;->i(I)Lr9b;

    move-result-object v0

    iget v2, v1, Lr9b;->b:I

    iget v1, v1, Lr9b;->d:I

    iget v0, v0, Lr9b;->d:I

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    new-instance v3, Lg03;

    invoke-direct {v3, v1, v0}, Lg03;-><init>(II)V

    iget-object v0, p0, Li03;->d:Lpde;

    invoke-static {v0, v3}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v2, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    invoke-super {p0, p1}, Landroid/view/View;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object p0

    return-object p0
.end method

.method public final onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    invoke-static {p0}, Lc1f;->c(Landroid/view/View;)Lc1f;

    move-result-object v0

    iput-object v0, p0, Li03;->b:Lc1f;

    invoke-virtual {p0}, Li03;->a()V

    invoke-virtual {p0}, Landroid/view/View;->requestApplyInsets()V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-boolean v0, p0, Li03;->c:Z

    if-eqz v0, :cond_13

    iget-object v0, p0, Li03;->b:Lc1f;

    if-eqz v0, :cond_13

    const/4 v1, 0x0

    iput-boolean v1, p0, Li03;->c:Z

    iget-object v1, p0, Li03;->a:Lh03;

    invoke-virtual {v0, v1}, Lc1f;->g(Lfck;)V

    :cond_13
    const/4 v0, 0x0

    iput-object v0, p0, Li03;->b:Lc1f;

    return-void
.end method

.method public final onVisibilityAggregated(Z)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onVisibilityAggregated(Z)V

    invoke-virtual {p0}, Li03;->a()V

    return-void
.end method

.method public final setAlpha(F)V
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    cmpg-float v0, p1, v0

    if-eqz v0, :cond_15

    invoke-super {p0, p1}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iget-object p0, p0, Li03;->b:Lc1f;

    if-eqz p0, :cond_15

    invoke-virtual {p0}, Lc1f;->e()V

    :cond_15
    return-void
.end method
