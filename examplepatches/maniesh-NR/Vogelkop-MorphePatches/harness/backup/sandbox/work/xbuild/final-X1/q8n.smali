.class public final Lq8n;
.super Lk8;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# instance fields
.field public final o:Landroid/view/View;

.field public final p:Lvz5;

.field public q:Landroid/view/ViewTreeObserver;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 5

    const/16 v0, 0xd

    invoke-direct {p0, v0}, Lk8;-><init>(B)V

    iput-object p1, p0, Lq8n;->o:Landroid/view/View;

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Rect;

    new-instance v1, Ly1n;

    const/16 v2, 0x8

    invoke-direct {v1, p0, v2}, Ly1n;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lvz5;

    invoke-direct {v2, p1, v0, v1}, Lvz5;-><init>(Landroid/view/View;Landroid/graphics/Rect;Ly1n;)V

    iput-object v2, p0, Lq8n;->p:Lvz5;

    return-void
.end method


# virtual methods
.method public final n0(Li21;)V
    .registers 4

    iget-object v0, p0, Lq8n;->o:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iput-object v0, p0, Lq8n;->q:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object v0, p0, Lq8n;->q:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    const/4 v0, 0x0

    iget-object v1, p0, Lq8n;->p:Lvz5;

    invoke-virtual {v1, v0}, Lvz5;->d(Z)V

    invoke-super {p0, p1}, Lk8;->n0(Li21;)V

    return-void
.end method

.method public final o0()V
    .registers 2

    iget-object v0, p0, Lq8n;->o:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object v0, p0, Lq8n;->q:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_19

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_19

    iget-object v0, p0, Lq8n;->q:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object v0, p0, Lq8n;->q:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_19
    const/4 v0, 0x0

    iput-object v0, p0, Lq8n;->q:Landroid/view/ViewTreeObserver;

    invoke-super {p0}, Lk8;->o0()V

    return-void
.end method

.method public final onGlobalLayout()V
    .registers 2

    iget-object v0, p0, Lq8n;->o:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-virtual {p0}, Lk8;->c0()V

    :cond_b
    return-void
.end method

.method public final onPreDraw()Z
    .registers 2

    iget-object v0, p0, Lq8n;->o:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {p0}, Lk8;->c0()V

    goto :goto_12

    :cond_c
    const/4 v0, 0x0

    iget-object p0, p0, Lq8n;->p:Lvz5;

    invoke-virtual {p0, v0}, Lvz5;->d(Z)V

    :goto_12
    const/4 p0, 0x1

    return p0
.end method

.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    return-void
.end method
