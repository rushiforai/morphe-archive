.class public final Lh/h;
.super Lh/v;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnKeyListener;
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public final b:Landroid/content/Context;

.field public final c:I

.field public final d:I

.field public final e:Z

.field public final f:Landroid/os/Handler;

.field public final g:Ljava/util/ArrayList;

.field public final h:Ljava/util/ArrayList;

.field public final i:Lh/d;

.field public final j:Lh/e;

.field public final k:LC/j;

.field public l:I

.field public m:I

.field public n:Landroid/view/View;

.field public o:Landroid/view/View;

.field public p:I

.field public q:Z

.field public r:Z

.field public s:I

.field public t:I

.field public u:Z

.field public v:Z

.field public w:Lh/y;

.field public x:Landroid/view/ViewTreeObserver;

.field public y:Lh/w;

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View;IZ)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lh/h;->g:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lh/h;->h:Ljava/util/ArrayList;

    new-instance v0, Lh/d;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lh/d;-><init>(ILjava/lang/Object;)V

    iput-object v0, p0, Lh/h;->i:Lh/d;

    new-instance v0, Lh/e;

    invoke-direct {v0, p0, v1}, Lh/e;-><init>(Lh/v;I)V

    iput-object v0, p0, Lh/h;->j:Lh/e;

    new-instance v0, LC/j;

    const/16 v1, 0xe

    invoke-direct {v0, v1, p0}, LC/j;-><init>(ILjava/lang/Object;)V

    iput-object v0, p0, Lh/h;->k:LC/j;

    const/4 v0, 0x0

    iput v0, p0, Lh/h;->l:I

    iput v0, p0, Lh/h;->m:I

    iput-object p1, p0, Lh/h;->b:Landroid/content/Context;

    iput-object p2, p0, Lh/h;->n:Landroid/view/View;

    iput p3, p0, Lh/h;->d:I

    iput-boolean p4, p0, Lh/h;->e:Z

    iput-boolean v0, p0, Lh/h;->u:Z

    invoke-virtual {p2}, Landroid/view/View;->getLayoutDirection()I

    move-result p2

    const/4 p3, 0x1

    if-ne p2, p3, :cond_0

    goto :goto_0

    :cond_0
    move v0, p3

    :goto_0
    iput v0, p0, Lh/h;->p:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit8 p2, p2, 0x2

    const p3, 0x7f060017

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lh/h;->c:I

    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lh/h;->f:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 3

    iget-object v0, p0, Lh/h;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lh/g;

    iget-object v0, v0, Lh/g;->a:Li/L0;

    iget-object v0, v0, Li/G0;->y:Li/D;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    return v2
.end method

.method public final b(Lh/n;Z)V
    .locals 6

    iget-object v0, p0, Lh/h;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lh/g;

    iget-object v4, v4, Lh/g;->b:Lh/n;

    if-ne p1, v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, -0x1

    :goto_1
    if-gez v3, :cond_2

    goto/16 :goto_4

    :cond_2
    add-int/lit8 v1, v3, 0x1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_3

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lh/g;

    iget-object v1, v1, Lh/g;->b:Lh/n;

    invoke-virtual {v1, v2}, Lh/n;->c(Z)V

    :cond_3
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lh/g;

    iget-object v3, v1, Lh/g;->b:Lh/n;

    invoke-virtual {v3, p0}, Lh/n;->r(Lh/z;)V

    iget-boolean v3, p0, Lh/h;->z:Z

    iget-object v1, v1, Lh/g;->a:Li/L0;

    const/4 v4, 0x0

    if-eqz v3, :cond_4

    iget-object v3, v1, Li/G0;->y:Li/D;

    invoke-static {v3, v4}, Li/I0;->b(Landroid/widget/PopupWindow;Landroid/transition/Transition;)V

    iget-object v3, v1, Li/G0;->y:Li/D;

    invoke-virtual {v3, v2}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    :cond_4
    invoke-virtual {v1}, Li/G0;->dismiss()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x1

    if-lez v1, :cond_5

    add-int/lit8 v5, v1, -0x1

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lh/g;

    iget v5, v5, Lh/g;->c:I

    iput v5, p0, Lh/h;->p:I

    goto :goto_3

    :cond_5
    iget-object v5, p0, Lh/h;->n:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getLayoutDirection()I

    move-result v5

    if-ne v5, v3, :cond_6

    move v5, v2

    goto :goto_2

    :cond_6
    move v5, v3

    :goto_2
    iput v5, p0, Lh/h;->p:I

    :goto_3
    if-nez v1, :cond_a

    invoke-virtual {p0}, Lh/h;->dismiss()V

    iget-object p2, p0, Lh/h;->w:Lh/y;

    if-eqz p2, :cond_7

    invoke-interface {p2, p1, v3}, Lh/y;->b(Lh/n;Z)V

    :cond_7
    iget-object p1, p0, Lh/h;->x:Landroid/view/ViewTreeObserver;

    if-eqz p1, :cond_9

    invoke-virtual {p1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result p1

    if-eqz p1, :cond_8

    iget-object p1, p0, Lh/h;->x:Landroid/view/ViewTreeObserver;

    iget-object p2, p0, Lh/h;->i:Lh/d;

    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_8
    iput-object v4, p0, Lh/h;->x:Landroid/view/ViewTreeObserver;

    :cond_9
    iget-object p1, p0, Lh/h;->o:Landroid/view/View;

    iget-object p2, p0, Lh/h;->j:Lh/e;

    invoke-virtual {p1, p2}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object p1, p0, Lh/h;->y:Lh/w;

    invoke-virtual {p1}, Lh/w;->onDismiss()V

    return-void

    :cond_a
    if-eqz p2, :cond_b

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lh/g;

    iget-object p1, p1, Lh/g;->b:Lh/n;

    invoke-virtual {p1, v2}, Lh/n;->c(Z)V

    :cond_b
    :goto_4
    return-void
.end method

.method public final c()V
    .locals 5

    iget-object v0, p0, Lh/h;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lh/g;

    iget-object v3, v3, Lh/g;->a:Li/L0;

    iget-object v3, v3, Li/G0;->c:Li/t0;

    invoke-virtual {v3}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v3

    instance-of v4, v3, Landroid/widget/HeaderViewListAdapter;

    if-eqz v4, :cond_0

    check-cast v3, Landroid/widget/HeaderViewListAdapter;

    invoke-virtual {v3}, Landroid/widget/HeaderViewListAdapter;->getWrappedAdapter()Landroid/widget/ListAdapter;

    move-result-object v3

    check-cast v3, Lh/k;

    goto :goto_1

    :cond_0
    check-cast v3, Lh/k;

    :goto_1
    invoke-virtual {v3}, Lh/k;->notifyDataSetChanged()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final dismiss()V
    .locals 4

    iget-object v0, p0, Lh/h;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    new-array v2, v1, [Lh/g;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lh/g;

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_1

    aget-object v2, v0, v1

    iget-object v3, v2, Lh/g;->a:Li/L0;

    iget-object v3, v3, Li/G0;->y:Li/D;

    invoke-virtual {v3}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v2, v2, Lh/g;->a:Li/L0;

    invoke-virtual {v2}, Li/G0;->dismiss()V

    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final e(Lh/y;)V
    .locals 0

    iput-object p1, p0, Lh/h;->w:Lh/y;

    return-void
.end method

.method public final f()Li/t0;
    .locals 2

    iget-object v0, p0, Lh/h;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lh/g;

    iget-object v0, v0, Lh/g;->a:Li/L0;

    iget-object v0, v0, Li/G0;->c:Li/t0;

    return-object v0
.end method

.method public final h()V
    .locals 5

    invoke-virtual {p0}, Lh/h;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lh/h;->g:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lh/n;

    invoke-virtual {p0, v4}, Lh/h;->v(Lh/n;)V

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lh/h;->n:Landroid/view/View;

    iput-object v0, p0, Lh/h;->o:Landroid/view/View;

    if-eqz v0, :cond_4

    iget-object v1, p0, Lh/h;->x:Landroid/view/ViewTreeObserver;

    if-nez v1, :cond_2

    const/4 v2, 0x1

    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iput-object v0, p0, Lh/h;->x:Landroid/view/ViewTreeObserver;

    if-eqz v2, :cond_3

    iget-object v1, p0, Lh/h;->i:Lh/d;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_3
    iget-object v0, p0, Lh/h;->o:Landroid/view/View;

    iget-object v1, p0, Lh/h;->j:Lh/e;

    invoke-virtual {v0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_4
    :goto_1
    return-void
.end method

.method public final i()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final j(Lh/F;)Z
    .locals 7

    iget-object v0, p0, Lh/h;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :cond_0
    const/4 v4, 0x1

    if-ge v3, v1, :cond_1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v3, v3, 0x1

    check-cast v5, Lh/g;

    iget-object v6, v5, Lh/g;->b:Lh/n;

    if-ne p1, v6, :cond_0

    iget-object p1, v5, Lh/g;->a:Li/L0;

    iget-object p1, p1, Li/G0;->c:Li/t0;

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    return v4

    :cond_1
    invoke-virtual {p1}, Lh/n;->hasVisibleItems()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0, p1}, Lh/h;->l(Lh/n;)V

    iget-object v0, p0, Lh/h;->w:Lh/y;

    if-eqz v0, :cond_2

    invoke-interface {v0, p1}, Lh/y;->m(Lh/n;)Z

    :cond_2
    return v4

    :cond_3
    return v2
.end method

.method public final l(Lh/n;)V
    .locals 1

    iget-object v0, p0, Lh/h;->b:Landroid/content/Context;

    invoke-virtual {p1, p0, v0}, Lh/n;->b(Lh/z;Landroid/content/Context;)V

    invoke-virtual {p0}, Lh/h;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lh/h;->v(Lh/n;)V

    return-void

    :cond_0
    iget-object v0, p0, Lh/h;->g:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final n(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lh/h;->n:Landroid/view/View;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lh/h;->n:Landroid/view/View;

    iget v0, p0, Lh/h;->l:I

    invoke-virtual {p1}, Landroid/view/View;->getLayoutDirection()I

    move-result p1

    invoke-static {v0, p1}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result p1

    iput p1, p0, Lh/h;->m:I

    :cond_0
    return-void
.end method

.method public final o(Z)V
    .locals 0

    iput-boolean p1, p0, Lh/h;->u:Z

    return-void
.end method

.method public final onDismiss()V
    .locals 6

    iget-object v0, p0, Lh/h;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lh/g;

    iget-object v5, v4, Lh/g;->a:Li/L0;

    iget-object v5, v5, Li/G0;->y:Li/D;

    invoke-virtual {v5}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v5

    if-nez v5, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    :goto_1
    if-eqz v4, :cond_2

    iget-object v0, v4, Lh/g;->b:Lh/n;

    invoke-virtual {v0, v2}, Lh/n;->c(Z)V

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

    invoke-virtual {p0}, Lh/h;->dismiss()V

    return p3

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final p(I)V
    .locals 1

    iget v0, p0, Lh/h;->l:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lh/h;->l:I

    iget-object v0, p0, Lh/h;->n:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutDirection()I

    move-result v0

    invoke-static {p1, v0}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result p1

    iput p1, p0, Lh/h;->m:I

    :cond_0
    return-void
.end method

.method public final q(I)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lh/h;->q:Z

    iput p1, p0, Lh/h;->s:I

    return-void
.end method

.method public final r(Landroid/widget/PopupWindow$OnDismissListener;)V
    .locals 0

    check-cast p1, Lh/w;

    iput-object p1, p0, Lh/h;->y:Lh/w;

    return-void
.end method

.method public final s(Z)V
    .locals 0

    iput-boolean p1, p0, Lh/h;->v:Z

    return-void
.end method

.method public final t(I)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lh/h;->r:Z

    iput p1, p0, Lh/h;->t:I

    return-void
.end method

.method public final v(Lh/n;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lh/h;->b:Landroid/content/Context;

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    new-instance v4, Lh/k;

    iget-boolean v5, v0, Lh/h;->e:Z

    const v6, 0x7f0b000b

    invoke-direct {v4, v1, v3, v5, v6}, Lh/k;-><init>(Lh/n;Landroid/view/LayoutInflater;ZI)V

    invoke-virtual {v0}, Lh/h;->a()Z

    move-result v5

    const/4 v6, 0x1

    if-nez v5, :cond_0

    iget-boolean v5, v0, Lh/h;->u:Z

    if-eqz v5, :cond_0

    iput-boolean v6, v4, Lh/k;->c:Z

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lh/h;->a()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-static {v1}, Lh/v;->u(Lh/n;)Z

    move-result v5

    iput-boolean v5, v4, Lh/k;->c:Z

    :cond_1
    :goto_0
    iget v5, v0, Lh/h;->c:I

    invoke-static {v4, v2, v5}, Lh/v;->m(Landroid/widget/ListAdapter;Landroid/content/Context;I)I

    move-result v5

    new-instance v7, Li/L0;

    iget v8, v0, Lh/h;->d:I

    const/4 v9, 0x0

    invoke-direct {v7, v2, v9, v8}, Li/G0;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iget-object v2, v0, Lh/h;->k:LC/j;

    iput-object v2, v7, Li/L0;->B:LC/j;

    iput-object v0, v7, Li/G0;->p:Landroid/widget/AdapterView$OnItemClickListener;

    iget-object v2, v7, Li/G0;->y:Li/D;

    invoke-virtual {v2, v0}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    iget-object v2, v0, Lh/h;->n:Landroid/view/View;

    iput-object v2, v7, Li/G0;->o:Landroid/view/View;

    iget v2, v0, Lh/h;->m:I

    iput v2, v7, Li/G0;->l:I

    iput-boolean v6, v7, Li/G0;->x:Z

    iget-object v2, v7, Li/G0;->y:Li/D;

    invoke-virtual {v2, v6}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    iget-object v2, v7, Li/G0;->y:Li/D;

    const/4 v8, 0x2

    invoke-virtual {v2, v8}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    invoke-virtual {v7, v4}, Li/G0;->m(Landroid/widget/ListAdapter;)V

    invoke-virtual {v7, v5}, Li/G0;->p(I)V

    iget v2, v0, Lh/h;->m:I

    iput v2, v7, Li/G0;->l:I

    iget-object v2, v0, Lh/h;->h:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v10, 0x0

    if-lez v4, :cond_a

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v6

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lh/g;

    iget-object v11, v4, Lh/g;->b:Lh/n;

    iget-object v12, v11, Lh/n;->f:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    move v13, v10

    :goto_1
    if-ge v13, v12, :cond_3

    invoke-virtual {v11, v13}, Lh/n;->getItem(I)Landroid/view/MenuItem;

    move-result-object v14

    invoke-interface {v14}, Landroid/view/MenuItem;->hasSubMenu()Z

    move-result v15

    if-eqz v15, :cond_2

    invoke-interface {v14}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v15

    if-ne v1, v15, :cond_2

    goto :goto_2

    :cond_2
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    :cond_3
    move-object v14, v9

    :goto_2
    if-nez v14, :cond_4

    move/from16 v16, v6

    move-object v6, v9

    goto :goto_7

    :cond_4
    iget-object v11, v4, Lh/g;->a:Li/L0;

    iget-object v11, v11, Li/G0;->c:Li/t0;

    invoke-virtual {v11}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v12

    instance-of v13, v12, Landroid/widget/HeaderViewListAdapter;

    if-eqz v13, :cond_5

    check-cast v12, Landroid/widget/HeaderViewListAdapter;

    invoke-virtual {v12}, Landroid/widget/HeaderViewListAdapter;->getHeadersCount()I

    move-result v13

    invoke-virtual {v12}, Landroid/widget/HeaderViewListAdapter;->getWrappedAdapter()Landroid/widget/ListAdapter;

    move-result-object v12

    check-cast v12, Lh/k;

    goto :goto_3

    :cond_5
    check-cast v12, Lh/k;

    move v13, v10

    :goto_3
    invoke-virtual {v12}, Lh/k;->getCount()I

    move-result v15

    move/from16 v16, v6

    move v6, v10

    :goto_4
    const/4 v8, -0x1

    if-ge v6, v15, :cond_7

    invoke-virtual {v12, v6}, Lh/k;->b(I)Lh/p;

    move-result-object v9

    if-ne v14, v9, :cond_6

    goto :goto_5

    :cond_6
    add-int/lit8 v6, v6, 0x1

    const/4 v9, 0x0

    goto :goto_4

    :cond_7
    move v6, v8

    :goto_5
    if-ne v6, v8, :cond_8

    goto :goto_6

    :cond_8
    add-int/2addr v6, v13

    invoke-virtual {v11}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    move-result v8

    sub-int/2addr v6, v8

    if-ltz v6, :cond_b

    invoke-virtual {v11}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    if-lt v6, v8, :cond_9

    goto :goto_6

    :cond_9
    invoke-virtual {v11, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    goto :goto_7

    :cond_a
    move/from16 v16, v6

    const/4 v4, 0x0

    :cond_b
    :goto_6
    const/4 v6, 0x0

    :goto_7
    if-eqz v6, :cond_17

    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    iget-object v9, v7, Li/G0;->y:Li/D;

    const/16 v11, 0x1c

    if-gt v8, v11, :cond_c

    sget-object v8, Li/L0;->C:Ljava/lang/reflect/Method;

    if-eqz v8, :cond_d

    :try_start_0
    sget-object v11, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    filled-new-array {v11}, [Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v8, v9, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_8

    :catch_0
    const-string v8, "MenuPopupWindow"

    const-string v9, "Could not invoke setTouchModal() on PopupWindow. Oh well."

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8

    :cond_c
    invoke-static {v9, v10}, Li/J0;->a(Landroid/widget/PopupWindow;Z)V

    :cond_d
    :goto_8
    iget-object v8, v7, Li/G0;->y:Li/D;

    const/4 v9, 0x0

    invoke-static {v8, v9}, Li/I0;->a(Landroid/widget/PopupWindow;Landroid/transition/Transition;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lh/g;

    iget-object v8, v8, Lh/g;->a:Li/L0;

    iget-object v8, v8, Li/G0;->c:Li/t0;

    const/4 v9, 0x2

    new-array v11, v9, [I

    invoke-virtual {v8, v11}, Landroid/view/View;->getLocationOnScreen([I)V

    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9}, Landroid/graphics/Rect;-><init>()V

    iget-object v12, v0, Lh/h;->o:Landroid/view/View;

    invoke-virtual {v12, v9}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    iget v12, v0, Lh/h;->p:I

    move/from16 v13, v16

    if-ne v12, v13, :cond_10

    aget v11, v11, v10

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v8

    add-int/2addr v8, v11

    add-int/2addr v8, v5

    iget v9, v9, Landroid/graphics/Rect;->right:I

    if-le v8, v9, :cond_f

    :cond_e
    move v8, v10

    :goto_9
    const/4 v13, 0x1

    goto :goto_b

    :cond_f
    :goto_a
    const/4 v8, 0x1

    goto :goto_9

    :cond_10
    aget v8, v11, v10

    sub-int/2addr v8, v5

    if-gez v8, :cond_e

    goto :goto_a

    :goto_b
    if-ne v8, v13, :cond_11

    const/4 v13, 0x1

    goto :goto_c

    :cond_11
    move v13, v10

    :goto_c
    iput v8, v0, Lh/h;->p:I

    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x1a

    const/4 v11, 0x5

    if-lt v8, v9, :cond_12

    iput-object v6, v7, Li/G0;->o:Landroid/view/View;

    move v9, v10

    move v12, v9

    goto :goto_d

    :cond_12
    const/4 v9, 0x2

    new-array v8, v9, [I

    iget-object v12, v0, Lh/h;->n:Landroid/view/View;

    invoke-virtual {v12, v8}, Landroid/view/View;->getLocationOnScreen([I)V

    new-array v9, v9, [I

    invoke-virtual {v6, v9}, Landroid/view/View;->getLocationOnScreen([I)V

    iget v12, v0, Lh/h;->m:I

    and-int/lit8 v12, v12, 0x7

    if-ne v12, v11, :cond_13

    aget v12, v8, v10

    iget-object v14, v0, Lh/h;->n:Landroid/view/View;

    invoke-virtual {v14}, Landroid/view/View;->getWidth()I

    move-result v14

    add-int/2addr v14, v12

    aput v14, v8, v10

    aget v12, v9, v10

    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v14

    add-int/2addr v14, v12

    aput v14, v9, v10

    :cond_13
    aget v12, v9, v10

    aget v14, v8, v10

    sub-int/2addr v12, v14

    const/16 v16, 0x1

    aget v9, v9, v16

    aget v8, v8, v16

    sub-int/2addr v9, v8

    :goto_d
    iget v8, v0, Lh/h;->m:I

    and-int/2addr v8, v11

    if-ne v8, v11, :cond_16

    if-eqz v13, :cond_14

    add-int/2addr v12, v5

    goto :goto_e

    :cond_14
    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v5

    :cond_15
    sub-int/2addr v12, v5

    goto :goto_e

    :cond_16
    if-eqz v13, :cond_15

    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v5

    add-int/2addr v12, v5

    :goto_e
    iput v12, v7, Li/G0;->f:I

    const/4 v13, 0x1

    iput-boolean v13, v7, Li/G0;->k:Z

    iput-boolean v13, v7, Li/G0;->j:Z

    invoke-virtual {v7, v9}, Li/G0;->k(I)V

    goto :goto_10

    :cond_17
    iget-boolean v5, v0, Lh/h;->q:Z

    if-eqz v5, :cond_18

    iget v5, v0, Lh/h;->s:I

    iput v5, v7, Li/G0;->f:I

    :cond_18
    iget-boolean v5, v0, Lh/h;->r:Z

    if-eqz v5, :cond_19

    iget v5, v0, Lh/h;->t:I

    invoke-virtual {v7, v5}, Li/G0;->k(I)V

    :cond_19
    iget-object v5, v0, Lh/v;->a:Landroid/graphics/Rect;

    if-eqz v5, :cond_1a

    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9, v5}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    goto :goto_f

    :cond_1a
    const/4 v9, 0x0

    :goto_f
    iput-object v9, v7, Li/G0;->w:Landroid/graphics/Rect;

    :goto_10
    new-instance v5, Lh/g;

    iget v6, v0, Lh/h;->p:I

    invoke-direct {v5, v7, v1, v6}, Lh/g;-><init>(Li/L0;Lh/n;I)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v7}, Li/G0;->h()V

    iget-object v2, v7, Li/G0;->c:Li/t0;

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    if-nez v4, :cond_1b

    iget-boolean v4, v0, Lh/h;->v:Z

    if-eqz v4, :cond_1b

    iget-object v4, v1, Lh/n;->m:Ljava/lang/CharSequence;

    if-eqz v4, :cond_1b

    const v4, 0x7f0b0012

    invoke-virtual {v3, v4, v2, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    const v4, 0x1020016

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v3, v10}, Landroid/view/View;->setEnabled(Z)V

    iget-object v1, v1, Lh/n;->m:Ljava/lang/CharSequence;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v9, 0x0

    invoke-virtual {v2, v3, v9, v10}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    invoke-virtual {v7}, Li/G0;->h()V

    :cond_1b
    return-void
.end method
