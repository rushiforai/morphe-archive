.class public final Lh/E;
.super Lh/v;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;
.implements Landroid/view/View$OnKeyListener;


# instance fields
.field public final b:Landroid/content/Context;

.field public final c:Lh/n;

.field public final d:Lh/k;

.field public final e:Z

.field public final f:I

.field public final g:I

.field public final h:Li/L0;

.field public final i:Lh/d;

.field public final j:Lh/e;

.field public k:Lh/w;

.field public l:Landroid/view/View;

.field public m:Landroid/view/View;

.field public n:Lh/y;

.field public o:Landroid/view/ViewTreeObserver;

.field public p:Z

.field public q:Z

.field public r:I

.field public s:I

.field public t:Z


# direct methods
.method public constructor <init>(ILandroid/content/Context;Landroid/view/View;Lh/n;Z)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh/d;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p0}, Lh/d;-><init>(ILjava/lang/Object;)V

    iput-object v0, p0, Lh/E;->i:Lh/d;

    new-instance v0, Lh/e;

    invoke-direct {v0, p0, v1}, Lh/e;-><init>(Lh/v;I)V

    iput-object v0, p0, Lh/E;->j:Lh/e;

    const/4 v0, 0x0

    iput v0, p0, Lh/E;->s:I

    iput-object p2, p0, Lh/E;->b:Landroid/content/Context;

    iput-object p4, p0, Lh/E;->c:Lh/n;

    iput-boolean p5, p0, Lh/E;->e:Z

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    new-instance v1, Lh/k;

    const v2, 0x7f0b0013

    invoke-direct {v1, p4, v0, p5, v2}, Lh/k;-><init>(Lh/n;Landroid/view/LayoutInflater;ZI)V

    iput-object v1, p0, Lh/E;->d:Lh/k;

    iput p1, p0, Lh/E;->g:I

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p5

    invoke-virtual {p5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit8 v0, v0, 0x2

    const v1, 0x7f060017

    invoke-virtual {p5, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p5

    invoke-static {v0, p5}, Ljava/lang/Math;->max(II)I

    move-result p5

    iput p5, p0, Lh/E;->f:I

    iput-object p3, p0, Lh/E;->l:Landroid/view/View;

    new-instance p3, Li/L0;

    const/4 p5, 0x0

    invoke-direct {p3, p2, p5, p1}, Li/G0;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object p3, p0, Lh/E;->h:Li/L0;

    invoke-virtual {p4, p0, p2}, Lh/n;->b(Lh/z;Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 1

    iget-boolean v0, p0, Lh/E;->p:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lh/E;->h:Li/L0;

    iget-object v0, v0, Li/G0;->y:Li/D;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final b(Lh/n;Z)V
    .locals 1

    iget-object v0, p0, Lh/E;->c:Lh/n;

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lh/E;->dismiss()V

    iget-object v0, p0, Lh/E;->n:Lh/y;

    if-eqz v0, :cond_1

    invoke-interface {v0, p1, p2}, Lh/y;->b(Lh/n;Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method public final c()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lh/E;->q:Z

    iget-object v0, p0, Lh/E;->d:Lh/k;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lh/k;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method public final dismiss()V
    .locals 1

    invoke-virtual {p0}, Lh/E;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lh/E;->h:Li/L0;

    invoke-virtual {v0}, Li/G0;->dismiss()V

    :cond_0
    return-void
.end method

.method public final e(Lh/y;)V
    .locals 0

    iput-object p1, p0, Lh/E;->n:Lh/y;

    return-void
.end method

.method public final f()Li/t0;
    .locals 1

    iget-object v0, p0, Lh/E;->h:Li/L0;

    iget-object v0, v0, Li/G0;->c:Li/t0;

    return-object v0
.end method

.method public final h()V
    .locals 8

    invoke-virtual {p0}, Lh/E;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-boolean v0, p0, Lh/E;->p:Z

    if-nez v0, :cond_7

    iget-object v0, p0, Lh/E;->l:Landroid/view/View;

    if-eqz v0, :cond_7

    iput-object v0, p0, Lh/E;->m:Landroid/view/View;

    iget-object v0, p0, Lh/E;->h:Li/L0;

    iget-object v1, v0, Li/G0;->y:Li/D;

    invoke-virtual {v1, p0}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    iput-object p0, v0, Li/G0;->p:Landroid/widget/AdapterView$OnItemClickListener;

    const/4 v1, 0x1

    iput-boolean v1, v0, Li/G0;->x:Z

    iget-object v2, v0, Li/G0;->y:Li/D;

    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    iget-object v2, p0, Lh/E;->m:Landroid/view/View;

    iget-object v3, p0, Lh/E;->o:Landroid/view/ViewTreeObserver;

    const/4 v4, 0x0

    if-nez v3, :cond_1

    move v3, v1

    goto :goto_0

    :cond_1
    move v3, v4

    :goto_0
    invoke-virtual {v2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v5

    iput-object v5, p0, Lh/E;->o:Landroid/view/ViewTreeObserver;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lh/E;->i:Lh/d;

    invoke-virtual {v5, v3}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_2
    iget-object v3, p0, Lh/E;->j:Lh/e;

    invoke-virtual {v2, v3}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iput-object v2, v0, Li/G0;->o:Landroid/view/View;

    iget v2, p0, Lh/E;->s:I

    iput v2, v0, Li/G0;->l:I

    iget-boolean v2, p0, Lh/E;->q:Z

    iget-object v3, p0, Lh/E;->b:Landroid/content/Context;

    iget-object v5, p0, Lh/E;->d:Lh/k;

    if-nez v2, :cond_3

    iget v2, p0, Lh/E;->f:I

    invoke-static {v5, v3, v2}, Lh/v;->m(Landroid/widget/ListAdapter;Landroid/content/Context;I)I

    move-result v2

    iput v2, p0, Lh/E;->r:I

    iput-boolean v1, p0, Lh/E;->q:Z

    :cond_3
    iget v1, p0, Lh/E;->r:I

    invoke-virtual {v0, v1}, Li/G0;->p(I)V

    const/4 v1, 0x2

    iget-object v2, v0, Li/G0;->y:Li/D;

    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    iget-object v1, p0, Lh/v;->a:Landroid/graphics/Rect;

    const/4 v2, 0x0

    if-eqz v1, :cond_4

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    goto :goto_1

    :cond_4
    move-object v6, v2

    :goto_1
    iput-object v6, v0, Li/G0;->w:Landroid/graphics/Rect;

    invoke-virtual {v0}, Li/G0;->h()V

    iget-object v1, v0, Li/G0;->c:Li/t0;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    iget-boolean v6, p0, Lh/E;->t:Z

    if-eqz v6, :cond_6

    iget-object v6, p0, Lh/E;->c:Lh/n;

    iget-object v7, v6, Lh/n;->m:Ljava/lang/CharSequence;

    if-eqz v7, :cond_6

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v7, 0x7f0b0012

    invoke-virtual {v3, v7, v1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    const v7, 0x1020016

    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    if-eqz v7, :cond_5

    iget-object v6, v6, Lh/n;->m:Ljava/lang/CharSequence;

    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_5
    invoke-virtual {v3, v4}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {v1, v3, v2, v4}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    :cond_6
    invoke-virtual {v0, v5}, Li/G0;->m(Landroid/widget/ListAdapter;)V

    invoke-virtual {v0}, Li/G0;->h()V

    return-void

    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "StandardMenuPopup cannot be used without an anchor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final i()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final j(Lh/F;)Z
    .locals 8

    invoke-virtual {p1}, Lh/n;->hasVisibleItems()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    new-instance v2, Lh/x;

    iget-object v5, p0, Lh/E;->m:Landroid/view/View;

    iget-object v4, p0, Lh/E;->b:Landroid/content/Context;

    iget-boolean v7, p0, Lh/E;->e:Z

    iget v3, p0, Lh/E;->g:I

    move-object v6, p1

    invoke-direct/range {v2 .. v7}, Lh/x;-><init>(ILandroid/content/Context;Landroid/view/View;Lh/n;Z)V

    iget-object p1, p0, Lh/E;->n:Lh/y;

    iput-object p1, v2, Lh/x;->h:Lh/y;

    iget-object v0, v2, Lh/x;->i:Lh/v;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lh/z;->e(Lh/y;)V

    :cond_0
    invoke-static {v6}, Lh/v;->u(Lh/n;)Z

    move-result p1

    iput-boolean p1, v2, Lh/x;->g:Z

    iget-object v0, v2, Lh/x;->i:Lh/v;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Lh/v;->o(Z)V

    :cond_1
    iget-object p1, p0, Lh/E;->k:Lh/w;

    iput-object p1, v2, Lh/x;->j:Lh/w;

    const/4 p1, 0x0

    iput-object p1, p0, Lh/E;->k:Lh/w;

    iget-object p1, p0, Lh/E;->c:Lh/n;

    invoke-virtual {p1, v1}, Lh/n;->c(Z)V

    iget-object p1, p0, Lh/E;->h:Li/L0;

    iget v0, p1, Li/G0;->f:I

    invoke-virtual {p1}, Li/G0;->i()I

    move-result p1

    iget v3, p0, Lh/E;->s:I

    iget-object v4, p0, Lh/E;->l:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutDirection()I

    move-result v4

    invoke-static {v3, v4}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result v3

    and-int/lit8 v3, v3, 0x7

    const/4 v4, 0x5

    if-ne v3, v4, :cond_2

    iget-object v3, p0, Lh/E;->l:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v3

    add-int/2addr v0, v3

    :cond_2
    invoke-virtual {v2}, Lh/x;->b()Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_3

    goto :goto_0

    :cond_3
    iget-object v3, v2, Lh/x;->e:Landroid/view/View;

    if-nez v3, :cond_4

    goto :goto_1

    :cond_4
    invoke-virtual {v2, v0, p1, v4, v4}, Lh/x;->d(IIZZ)V

    :goto_0
    iget-object p1, p0, Lh/E;->n:Lh/y;

    if-eqz p1, :cond_5

    invoke-interface {p1, v6}, Lh/y;->m(Lh/n;)Z

    :cond_5
    return v4

    :cond_6
    :goto_1
    return v1
.end method

.method public final l(Lh/n;)V
    .locals 0

    return-void
.end method

.method public final n(Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lh/E;->l:Landroid/view/View;

    return-void
.end method

.method public final o(Z)V
    .locals 1

    iget-object v0, p0, Lh/E;->d:Lh/k;

    iput-boolean p1, v0, Lh/k;->c:Z

    return-void
.end method

.method public final onDismiss()V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lh/E;->p:Z

    iget-object v1, p0, Lh/E;->c:Lh/n;

    invoke-virtual {v1, v0}, Lh/n;->c(Z)V

    iget-object v0, p0, Lh/E;->o:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lh/E;->m:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iput-object v0, p0, Lh/E;->o:Landroid/view/ViewTreeObserver;

    :cond_0
    iget-object v0, p0, Lh/E;->o:Landroid/view/ViewTreeObserver;

    iget-object v1, p0, Lh/E;->i:Lh/d;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lh/E;->o:Landroid/view/ViewTreeObserver;

    :cond_1
    iget-object v0, p0, Lh/E;->m:Landroid/view/View;

    iget-object v1, p0, Lh/E;->j:Lh/e;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object v0, p0, Lh/E;->k:Lh/w;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lh/w;->onDismiss()V

    :cond_2
    return-void
.end method

.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    const/4 p3, 0x1

    if-ne p1, p3, :cond_0

    const/16 p1, 0x52

    if-ne p2, p1, :cond_0

    invoke-virtual {p0}, Lh/E;->dismiss()V

    return p3

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final p(I)V
    .locals 0

    iput p1, p0, Lh/E;->s:I

    return-void
.end method

.method public final q(I)V
    .locals 1

    iget-object v0, p0, Lh/E;->h:Li/L0;

    iput p1, v0, Li/G0;->f:I

    return-void
.end method

.method public final r(Landroid/widget/PopupWindow$OnDismissListener;)V
    .locals 0

    check-cast p1, Lh/w;

    iput-object p1, p0, Lh/E;->k:Lh/w;

    return-void
.end method

.method public final s(Z)V
    .locals 0

    iput-boolean p1, p0, Lh/E;->t:Z

    return-void
.end method

.method public final t(I)V
    .locals 1

    iget-object v0, p0, Lh/E;->h:Li/L0;

    invoke-virtual {v0, p1}, Li/G0;->k(I)V

    return-void
.end method
