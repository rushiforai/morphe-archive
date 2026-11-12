.class public final Le6n;
.super Llim;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;
.implements Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;


# instance fields
.field public final a:Landroid/view/Window;

.field public final b:Landroid/view/View;

.field public final c:Lpad;

.field public final d:Ly1n;

.field public e:Ljava/lang/ref/WeakReference;

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/view/Window;Landroid/view/View;Lpad;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ly1n;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Ly1n;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Le6n;->d:Ly1n;

    iput-object p1, p0, Le6n;->a:Landroid/view/Window;

    iput-object p2, p0, Le6n;->b:Landroid/view/View;

    iput-object p3, p0, Le6n;->c:Lpad;

    return-void
.end method


# virtual methods
.method public final R()V
    .registers 4

    iget-boolean v0, p0, Le6n;->f:Z

    if-eqz v0, :cond_2b

    iget-object v0, p0, Le6n;->a:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_2b

    invoke-virtual {v0}, Landroid/view/Window;->isActive()Z

    move-result v1

    if-eqz v1, :cond_2b

    iget-object v1, p0, Le6n;->b:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v2

    if-eqz v2, :cond_2b

    iget-object p0, p0, Le6n;->c:Lpad;

    iget-object p0, p0, Lpad;->c:Ljava/lang/Object;

    check-cast p0, Ll24;

    if-eqz p0, :cond_2c

    invoke-interface {p0}, Ll24;->S()V

    invoke-virtual {v0}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_2c

    :cond_2b
    return-void

    :cond_2c
    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    return-void
.end method

.method public final W(Lndc;)V
    .registers 3

    iget-object p1, p0, Le6n;->b:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalFocusChangeListener(Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;)V

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnWindowFocusChangeListener(Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 3

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Le6n;->b:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalFocusChangeListener(Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;)V

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnWindowFocusChangeListener(Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    iget-object p0, p0, Le6n;->d:Ly1n;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onGlobalFocusChanged(Landroid/view/View;Landroid/view/View;)V
    .registers 3

    if-eqz p1, :cond_d

    if-nez p2, :cond_d

    iget-object p2, p0, Le6n;->b:Landroid/view/View;

    if-eq p1, p2, :cond_d

    iget-object p0, p0, Le6n;->d:Ly1n;

    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_d
    return-void
.end method

.method public final onWindowFocusChanged(Z)V
    .registers 4

    iput-boolean p1, p0, Le6n;->f:Z

    const/4 v0, 0x0

    iget-object v1, p0, Le6n;->a:Landroid/view/Window;

    if-nez p1, :cond_18

    invoke-virtual {v1}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_10

    iput-object v0, p0, Le6n;->e:Ljava/lang/ref/WeakReference;

    return-void

    :cond_10
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le6n;->e:Ljava/lang/ref/WeakReference;

    return-void

    :cond_18
    iget-object p1, p0, Le6n;->e:Ljava/lang/ref/WeakReference;

    if-eqz p1, :cond_23

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    goto :goto_24

    :cond_23
    move-object p1, v0

    :goto_24
    iput-object v0, p0, Le6n;->e:Ljava/lang/ref/WeakReference;

    if-eqz p1, :cond_48

    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_48

    invoke-virtual {v1}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_41

    instance-of v1, p1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_41

    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-static {v1, v0}, Lq9n;->w(Landroid/view/ViewGroup;Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_47

    :cond_41
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    move-result p1

    if-eqz p1, :cond_48

    :cond_47
    return-void

    :cond_48
    invoke-virtual {p0}, Le6n;->R()V

    return-void
.end method
