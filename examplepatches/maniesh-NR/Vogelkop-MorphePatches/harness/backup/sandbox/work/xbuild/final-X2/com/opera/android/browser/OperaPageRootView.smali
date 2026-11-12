.class public Lcom/opera/android/browser/OperaPageRootView;
.super Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;
.source "SourceFile"


# instance fields
.field public final c:Lh03;

.field public final d:Li7f;

.field public e:Lc1f;

.field public f:I

.field public g:I

.field public final h:Lpde;


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

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lh03;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lh03;-><init>(Landroid/widget/FrameLayout;B)V

    iput-object p1, p0, Lcom/opera/android/browser/OperaPageRootView;->c:Lh03;

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Lcom/opera/android/browser/OperaPageRootView;->d:Li7f;

    iput v0, p0, Lcom/opera/android/browser/OperaPageRootView;->f:I

    iput v0, p0, Lcom/opera/android/browser/OperaPageRootView;->g:I

    new-instance p1, Lpde;

    new-instance p2, Landroid/util/Size;

    invoke-direct {p2, v0, v0}, Landroid/util/Size;-><init>(II)V

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/opera/android/browser/OperaPageRootView;->h:Lpde;

    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    return-void
.end method


# virtual methods
.method public final onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    invoke-static {p0}, Lc1f;->c(Landroid/view/View;)Lc1f;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/browser/OperaPageRootView;->e:Lc1f;

    if-eqz v0, :cond_10

    iget-object p0, p0, Lcom/opera/android/browser/OperaPageRootView;->c:Lh03;

    invoke-virtual {v0, p0}, Lc1f;->d(Lfck;)V

    :cond_10
    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/opera/android/browser/OperaPageRootView;->e:Lc1f;

    if-eqz v0, :cond_f

    iget-object v1, p0, Lcom/opera/android/browser/OperaPageRootView;->c:Lh03;

    invoke-virtual {v0, v1}, Lc1f;->g(Lfck;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/browser/OperaPageRootView;->e:Lc1f;

    :cond_f
    return-void
.end method

.method public final onSizeChanged(IIII)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    new-instance p3, Lqg2;

    const/16 p4, 0x9

    invoke-direct {p3, p4}, Lqg2;-><init>(B)V

    iget-object p4, p0, Lcom/opera/android/browser/OperaPageRootView;->d:Li7f;

    invoke-interface {p4, p3}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    new-instance p3, Landroid/util/Size;

    invoke-direct {p3, p1, p2}, Landroid/util/Size;-><init>(II)V

    iget-object p0, p0, Lcom/opera/android/browser/OperaPageRootView;->h:Lpde;

    invoke-virtual {p0, p3}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
