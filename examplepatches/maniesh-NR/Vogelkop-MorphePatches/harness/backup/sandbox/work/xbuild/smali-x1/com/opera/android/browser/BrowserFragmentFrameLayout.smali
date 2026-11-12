.class public Lcom/opera/android/browser/BrowserFragmentFrameLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lqt3;

.field public final b:Lpde;

.field public final c:Lpde;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Lpde;

    new-instance p2, Landroid/util/Size;

    const/4 v0, 0x0

    invoke-direct {p2, v0, v0}, Landroid/util/Size;-><init>(II)V

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/opera/android/browser/BrowserFragmentFrameLayout;->b:Lpde;

    new-instance p1, Lpde;

    new-instance p2, Ljzk;

    invoke-direct {p2, v0, v0}, Ljzk;-><init>(II)V

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/opera/android/browser/BrowserFragmentFrameLayout;->c:Lpde;

    return-void
.end method


# virtual methods
.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragmentFrameLayout;->a:Lqt3;

    if-eqz v0, :cond_f

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_f

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragmentFrameLayout;->a:Lqt3;

    invoke-virtual {v0}, Lqt3;->run()V

    :cond_f
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .registers 5

    invoke-static {p0, p1}, Lg3o;->g(Landroid/view/View;Landroid/view/WindowInsets;)Lg3o;

    move-result-object v0

    const/16 v1, 0x207

    iget-object v0, v0, Lg3o;->a:Ld3o;

    invoke-virtual {v0, v1}, Ld3o;->i(I)Lr9b;

    move-result-object v0

    new-instance v1, Ljzk;

    iget v2, v0, Lr9b;->b:I

    iget v0, v0, Lr9b;->d:I

    invoke-direct {v1, v2, v0}, Ljzk;-><init>(II)V

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragmentFrameLayout;->c:Lpde;

    invoke-static {v0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    invoke-super {p0, p1}, Landroid/view/View;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object p0

    return-object p0
.end method

.method public final onSizeChanged(IIII)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p2

    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragmentFrameLayout;->b:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/util/Size;

    invoke-virtual {p3}, Landroid/util/Size;->getWidth()I

    move-result p4

    if-ne p4, p1, :cond_20

    invoke-virtual {p3}, Landroid/util/Size;->getHeight()I

    move-result p3

    if-ne p3, p2, :cond_20

    return-void

    :cond_20
    new-instance p3, Landroid/util/Size;

    invoke-direct {p3, p1, p2}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {p0, p3}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
