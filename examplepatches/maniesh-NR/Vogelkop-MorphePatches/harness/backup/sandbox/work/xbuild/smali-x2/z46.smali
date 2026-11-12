.class public Lz46;
.super Ltq3;
.source "SourceFile"

# interfaces
.implements Lsni;


# instance fields
.field public final r:Ltni;

.field public final s:Lkp5;

.field public t:Lvq3;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .registers 3

    invoke-direct {p0, p1, p2}, Ltq3;-><init>(Landroid/content/Context;I)V

    new-instance p2, Lkp5;

    invoke-direct {p2, p0}, Lkp5;-><init>(Lz46;)V

    iput-object p2, p0, Lz46;->s:Lkp5;

    invoke-static {p1}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object p1

    if-eqz p1, :cond_14

    iget-object p1, p1, Ldx3;->l:Ltni;

    iput-object p1, p0, Lz46;->r:Ltni;

    :cond_14
    return-void
.end method


# virtual methods
.method public final Y(Z)V
    .registers 2

    iget-object p0, p0, Lz46;->t:Lvq3;

    if-eqz p0, :cond_7

    invoke-virtual {p0, p1}, Lvq3;->Y(Z)V

    :cond_7
    return-void
.end method

.method public final dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 4

    invoke-static {}, Lc37;->r()Lc37;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Lc37;->l(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_c

    return v1

    :cond_c
    invoke-super {p0, p1}, Lzp1;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public final h()V
    .registers 4

    iget-object v0, p0, Lz46;->r:Ltni;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Ly46;

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ly46;-><init>(Lz46;Landroid/content/Context;)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, Lzp1;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Ltq3;->onAttachedToWindow()V

    iget-object v0, p0, Lz46;->r:Ltni;

    if-eqz v0, :cond_a

    invoke-virtual {v0, p0}, Ltni;->a(Lsni;)V

    :cond_a
    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Ltq3;->onDetachedFromWindow()V

    iget-object v0, p0, Lz46;->r:Ltni;

    if-eqz v0, :cond_a

    invoke-virtual {v0, p0}, Ltni;->c(Lsni;)V

    :cond_a
    return-void
.end method

.method public final onStart()V
    .registers 3

    invoke-super {p0}, Ltq3;->onStart()V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    iget-object v1, p0, Lz46;->s:Lkp5;

    invoke-static {v0, v1}, Lm5n;->a(Landroid/view/View;Lq5n;)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lq9n;->i(Landroid/view/View;)V

    return-void
.end method

.method public final onStop()V
    .registers 3

    invoke-super {p0}, Lzp1;->onStop()V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    iget-object p0, p0, Lz46;->s:Lkp5;

    invoke-static {v0, p0}, Lm5n;->e(Landroid/view/View;Lq5n;)V

    return-void
.end method

.method public final setContentView(I)V
    .registers 2

    invoke-super {p0, p1}, Ltq3;->setContentView(I)V

    invoke-virtual {p0}, Lz46;->h()V

    invoke-static {p0}, Loup;->o0(Ltq3;)V

    return-void
.end method

.method public final setContentView(Landroid/view/View;)V
    .registers 2

    .line 10
    invoke-super {p0, p1}, Ltq3;->setContentView(Landroid/view/View;)V

    .line 11
    invoke-virtual {p0}, Lz46;->h()V

    .line 12
    invoke-static {p0}, Loup;->o0(Ltq3;)V

    return-void
.end method

.method public final setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 3

    .line 13
    invoke-super {p0, p1, p2}, Ltq3;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    invoke-virtual {p0}, Lz46;->h()V

    .line 15
    invoke-static {p0}, Loup;->o0(Ltq3;)V

    return-void
.end method
