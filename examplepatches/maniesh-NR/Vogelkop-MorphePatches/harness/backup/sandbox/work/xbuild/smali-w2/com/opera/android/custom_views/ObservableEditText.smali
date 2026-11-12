.class public Lcom/opera/android/custom_views/ObservableEditText;
.super Lcom/opera/android/custom_views/OperaEditText;
.source "SourceFile"

# interfaces
.implements Lw6f;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/opera/android/custom_views/OperaEditText;",
        "Lw6f;"
    }
.end annotation


# static fields
.field public static final synthetic u:I


# instance fields
.field public final s:Lh7f;

.field public final t:Lrn9;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/opera/android/custom_views/OperaEditText;-><init>(Landroid/content/Context;)V

    new-instance p1, Lh7f;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/custom_views/ObservableEditText;->s:Lh7f;

    new-instance p1, Lyqd;

    const/16 v0, 0x17

    invoke-direct {p1, p0, v0}, Lyqd;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lrn9;

    invoke-direct {v0, p1, p0}, Lrn9;-><init>(Ljava/lang/Runnable;Lcom/opera/android/custom_views/ObservableEditText;)V

    iput-object v0, p0, Lcom/opera/android/custom_views/ObservableEditText;->t:Lrn9;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 25
    invoke-direct {p0, p1, p2}, Lcom/opera/android/custom_views/OperaEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    new-instance p1, Lh7f;

    .line 27
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/opera/android/custom_views/ObservableEditText;->s:Lh7f;

    .line 29
    new-instance p1, Lyqd;

    const/16 p2, 0x17

    invoke-direct {p1, p0, p2}, Lyqd;-><init>(Ljava/lang/Object;B)V

    .line 30
    new-instance p2, Lrn9;

    invoke-direct {p2, p1, p0}, Lrn9;-><init>(Ljava/lang/Runnable;Lcom/opera/android/custom_views/ObservableEditText;)V

    .line 31
    iput-object p2, p0, Lcom/opera/android/custom_views/ObservableEditText;->t:Lrn9;

    return-void
.end method


# virtual methods
.method public final bridge synthetic F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lz6f;

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/ObservableEditText;->m(Lz6f;)V

    return-void
.end method

.method public final bridge synthetic H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lz6f;

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/ObservableEditText;->n(Lz6f;)V

    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 5

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_24

    iget-object v0, p0, Lcom/opera/android/custom_views/ObservableEditText;->s:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :cond_c
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_24

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lz6f;

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    invoke-interface {v1, v2, p1}, Lz6f;->c(ILandroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_24
    invoke-super {p0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public final m(Lz6f;)V
    .registers 3

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object v0, p0, Lcom/opera/android/custom_views/ObservableEditText;->s:Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lh7f;->isEmpty()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iget-object p0, p0, Lcom/opera/android/custom_views/ObservableEditText;->t:Lrn9;

    iput-boolean p1, p0, Lrn9;->b:Z

    return-void
.end method

.method public final n(Lz6f;)V
    .registers 3

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object v0, p0, Lcom/opera/android/custom_views/ObservableEditText;->s:Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lh7f;->isEmpty()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iget-object p0, p0, Lcom/opera/android/custom_views/ObservableEditText;->t:Lrn9;

    iput-boolean p1, p0, Lrn9;->b:Z

    return-void
.end method

.method public onFocusChanged(ZILandroid/graphics/Rect;)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/custom_views/ObservableEditText;->t:Lrn9;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/opera/android/custom_views/ObservableEditText;->s:Lh7f;

    if-eqz v0, :cond_1e

    new-instance v1, Lg7f;

    invoke-direct {v1, v0}, Lg7f;-><init>(Lh7f;)V

    :goto_e
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lz6f;

    invoke-interface {v0, p1}, Lz6f;->f(Z)V

    goto :goto_e

    :cond_1e
    invoke-super {p0, p1, p2, p3}, Lcom/opera/android/custom_views/OperaEditText;->onFocusChanged(ZILandroid/graphics/Rect;)V

    return-void
.end method

.method public final onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .registers 6

    const/4 v0, 0x4

    iget-object v1, p0, Lcom/opera/android/custom_views/ObservableEditText;->t:Lrn9;

    if-ne p1, v0, :cond_30

    iget-boolean v0, v1, Lrn9;->b:Z

    if-eqz v0, :cond_33

    iget-object v0, v1, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/ObservableEditText;

    sget-object v2, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v0}, Li5n;->a(Landroid/view/View;)Lg3o;

    move-result-object v0

    if-eqz v0, :cond_21

    const/16 v2, 0x8

    iget-object v0, v0, Lg3o;->a:Ld3o;

    invoke-virtual {v0, v2}, Ld3o;->i(I)Lr9b;

    move-result-object v0

    iget v0, v0, Lr9b;->d:I

    if-nez v0, :cond_33

    :cond_21
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result p0

    const/4 p1, 0x1

    if-ne p0, p1, :cond_2f

    iget-object p0, v1, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_2f
    return p1

    :cond_30
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_33
    invoke-super {p0, p1, p2}, Landroid/view/View;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public onSelectionChanged(II)V
    .registers 4

    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onSelectionChanged(II)V

    iget-object p0, p0, Lcom/opera/android/custom_views/ObservableEditText;->s:Lh7f;

    if-eqz p0, :cond_1c

    new-instance v0, Lg7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_c
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_1c

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lz6f;

    invoke-interface {p0, p1, p2}, Lz6f;->d(II)V

    goto :goto_c

    :cond_1c
    return-void
.end method

.method public onTextContextMenuItem(I)Z
    .registers 6

    iget-object v0, p0, Lcom/opera/android/custom_views/ObservableEditText;->s:Lh7f;

    const v1, 0x1020022

    if-ne p1, v1, :cond_1b

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v2

    :goto_b
    invoke-virtual {v2}, Lg7f;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1b

    invoke-virtual {v2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lz6f;

    invoke-interface {v3}, Lz6f;->h()V

    goto :goto_b

    :cond_1b
    invoke-super {p0, p1}, Lcom/opera/android/custom_views/OperaEditText;->onTextContextMenuItem(I)Z

    move-result p0

    if-eqz p0, :cond_37

    if-ne p1, v1, :cond_37

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_27
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_37

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lz6f;

    invoke-interface {v0}, Lz6f;->i()V

    goto :goto_27

    :cond_37
    return p0
.end method

.method public final onWindowFocusChanged(Z)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    iget-object p0, p0, Lcom/opera/android/custom_views/ObservableEditText;->s:Lh7f;

    if-eqz p0, :cond_1c

    new-instance p1, Lg7f;

    invoke-direct {p1, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_c
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_1c

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lz6f;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_c

    :cond_1c
    return-void
.end method
