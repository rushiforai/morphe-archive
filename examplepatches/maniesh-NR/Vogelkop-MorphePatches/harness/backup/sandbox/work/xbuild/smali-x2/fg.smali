.class public final Lfg;
.super Lskb;
.source "SourceFile"


# instance fields
.field public final k:Lro3;

.field public l:Lxo8;


# direct methods
.method public constructor <init>(Lvo3;Lro3;)V
    .registers 3

    invoke-direct {p0, p1}, Lskb;-><init>(Lvo3;)V

    iput-object p2, p0, Lfg;->k:Lro3;

    return-void
.end method


# virtual methods
.method public final o(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V
    .registers 8

    invoke-super/range {p0 .. p7}, Lskb;->o(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V

    iget-object p1, p0, Lfg;->l:Lxo8;

    if-eqz p1, :cond_c

    iget-object p2, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, p1, p2}, Lfg;->y(Lxo8;Landroid/view/View;)V

    :cond_c
    return-void
.end method

.method public final r(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;Landroidx/recyclerview/widget/i;)Z
    .registers 6

    invoke-virtual {p2}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget-object p2, p0, Lfg;->k:Lro3;

    invoke-virtual {p2, p1}, Lro3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lpc;

    if-eqz p1, :cond_5a

    invoke-virtual {p3}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p2, p3}, Lro3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lpc;

    if-eqz p2, :cond_5a

    iget-object p0, p0, Lskb;->e:Lvo3;

    iget-object p0, p0, Lvo3;->d:Lwo3;

    iget-object p3, p0, Lwo3;->t:Lcom/opera/android/settings/SettingsManager;

    iget-object v0, p0, Lwo3;->x:Lfw3;

    invoke-static {p3, v0}, Lvtp;->I(Lcom/opera/android/settings/SettingsManager;Lfw3;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p2

    const/4 v0, -0x1

    if-eq p1, v0, :cond_5a

    if-eq p2, v0, :cond_5a

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v1, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-object p1, p0, Lwo3;->F:Lwf;

    invoke-virtual {p1, v1}, Lwf;->P(Ljava/util/List;)V

    invoke-static {p3, v1}, Lvtp;->U(Lcom/opera/android/settings/SettingsManager;Ljava/util/ArrayList;)V

    iget-object p0, p0, Lwo3;->I:Lnp1;

    if-nez p0, :cond_56

    const/4 p0, 0x0

    :cond_56
    const/4 p1, 0x1

    iput-boolean p1, p0, Lnp1;->b:Z

    return p1

    :cond_5a
    const/4 p0, 0x0

    return p0
.end method

.method public final w(Landroidx/recyclerview/widget/i;)V
    .registers 8

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lfg;->k:Lro3;

    invoke-virtual {v1, v0}, Lro3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpc;

    if-nez v0, :cond_13

    return-void

    :cond_13
    sget v1, Lxo8;->l:I

    iget-object v1, p0, Lskb;->e:Lvo3;

    iget-object v2, v1, Lvo3;->c:Landroid/widget/FrameLayout;

    iget-object v3, v1, Lvo3;->d:Lwo3;

    iget-object v3, v3, Lwo3;->H:Lt79;

    if-eqz v3, :cond_28

    invoke-virtual {v3}, Lt79;->s0()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_29

    :cond_28
    const/4 v3, 0x0

    :goto_29
    iget-object v4, v1, Lvo3;->a:Lxj;

    iget-object v5, v1, Lvo3;->b:Lso3;

    invoke-static {v2, v3, v4, v5}, Lsgb;->r(Landroid/widget/FrameLayout;Ljava/lang/Integer;Lxj;Lso3;)Lxo8;

    move-result-object v2

    iput-object v2, p0, Lfg;->l:Lxo8;

    iget-object v3, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, v2, v3}, Lfg;->y(Lxo8;Landroid/view/View;)V

    iget-object p0, v2, Lxo8;->i:Lpc;

    if-eq v0, p0, :cond_41

    iput-object v0, v2, Lxo8;->i:Lpc;

    invoke-virtual {v2}, Lxo8;->b()V

    :cond_41
    iget-object p0, v1, Lvo3;->c:Landroid/widget/FrameLayout;

    iget-object v0, v2, Lxo8;->c:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object p0, v2, Lxo8;->e:Landroid/widget/RelativeLayout;

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lskb;->i:Lixh;

    invoke-virtual {v1, v0}, Ly7h;->l(Landroid/content/Context;)F

    move-result v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationZ(F)V

    iget-object p0, v2, Lxo8;->d:Landroid/widget/RelativeLayout;

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    sget-wide v3, Lskb;->j:J

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v3

    invoke-virtual {p0, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v1, p1}, Ly7h;->l(Landroid/content/Context;)F

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->translationZ(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    new-instance p1, Leg;

    const/4 v0, 0x0

    invoke-direct {p1, v2, v0}, Leg;-><init>(Lxo8;B)V

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final x(Landroidx/recyclerview/widget/i;Lxj7;)V
    .registers 5

    iget-object p1, p0, Lfg;->l:Lxo8;

    if-eqz p1, :cond_17

    iget-object p2, p1, Lxo8;->c:Landroid/widget/FrameLayout;

    new-instance v0, Lx2;

    const/4 v1, 0x3

    invoke-direct {v0, p0, p1, v1}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Ly1n;

    const/4 p1, 0x7

    invoke-direct {p0, v0, p1}, Ly1n;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v0, 0xc8

    invoke-virtual {p2, p0, v0, v1}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    :cond_17
    return-void
.end method

.method public final y(Lxo8;Landroid/view/View;)V
    .registers 8

    iget-object p0, p0, Lskb;->e:Lvo3;

    iget-object v0, p0, Lvo3;->c:Landroid/widget/FrameLayout;

    const/4 v1, 0x2

    new-array v2, v1, [I

    invoke-virtual {p2, v2}, Landroid/view/View;->getLocationInWindow([I)V

    new-array v3, v1, [I

    invoke-virtual {v0, v3}, Landroid/view/View;->getLocationInWindow([I)V

    const/4 v0, 0x0

    aget v4, v2, v0

    aget v0, v3, v0

    sub-int/2addr v4, v0

    const/4 v0, 0x1

    aget v2, v2, v0

    aget v0, v3, v0

    sub-int/2addr v2, v0

    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v3

    add-int/2addr v3, v4

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    add-int/2addr p2, v2

    invoke-direct {v0, v4, v2, v3, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object p2, p1, Lxo8;->c:Landroid/widget/FrameLayout;

    iget v2, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    iget-object p1, p1, Lxo8;->c:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v4

    sub-int/2addr v3, v4

    div-int/2addr v3, v1

    add-int/2addr v3, v2

    iget-object p0, p0, Lvo3;->c:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v3, v2

    int-to-float v2, v3

    invoke-virtual {p2, v2}, Landroid/view/View;->setTranslationX(F)V

    iget p2, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int/2addr v0, v2

    div-int/2addr v0, v1

    add-int/2addr v0, p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p0

    sub-int/2addr v0, p0

    int-to-float p0, v0

    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationY(F)V

    return-void
.end method
