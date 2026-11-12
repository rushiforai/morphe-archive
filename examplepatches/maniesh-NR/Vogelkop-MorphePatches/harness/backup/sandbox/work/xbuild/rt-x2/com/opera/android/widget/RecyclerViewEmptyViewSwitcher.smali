.class public Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;
.super Landroid/widget/ViewSwitcher;
.source "SourceFile"


# static fields
.field public static final synthetic d:I


# instance fields
.field public a:Lzph;

.field public b:Ljava/lang/Runnable;

.field public final c:Ls03;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/widget/ViewSwitcher;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Ls03;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Ls03;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->c:Ls03;

    return-void
.end method


# virtual methods
.method public final a(Lzph;)V
    .registers 4

    iput-object p1, p0, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->a:Lzph;

    invoke-interface {p1}, Lzph;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_9

    return-void

    :cond_9
    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->getInAnimation()Landroid/view/animation/Animation;

    move-result-object p1

    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->getOutAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    invoke-virtual {p0, v1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->showNext()V

    invoke-virtual {p0, p1}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    invoke-virtual {p0, v0}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method public final b()V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->c:Ls03;

    iget-boolean v0, p0, Ls03;->b:Z

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x1

    iput-boolean v0, p0, Ls03;->b:Z

    iget-object v0, p0, Ls03;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    invoke-virtual {v0, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
