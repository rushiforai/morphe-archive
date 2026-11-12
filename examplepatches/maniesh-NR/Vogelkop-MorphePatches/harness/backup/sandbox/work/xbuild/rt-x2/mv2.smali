.class public final Lmv2;
.super Lskb;
.source "SourceFile"


# instance fields
.field public final k:Lro3;


# direct methods
.method public constructor <init>(Lvo3;Lro3;)V
    .registers 3

    invoke-direct {p0, p1}, Lskb;-><init>(Lvo3;)V

    iput-object p2, p0, Lmv2;->k:Lro3;

    return-void
.end method


# virtual methods
.method public final v()Lxj7;
    .registers 14

    iget-object v0, p0, Lskb;->f:Landroidx/recyclerview/widget/i;

    if-eqz v0, :cond_16

    invoke-virtual {v0}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lmv2;->k:Lro3;

    invoke-virtual {v2, v1}, Lro3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpc;

    if-nez v1, :cond_19

    :cond_16
    sget-object p0, Luj7;->a:Luj7;

    return-object p0

    :cond_19
    iget-object v0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object p0, p0, Lskb;->e:Lvo3;

    iget-object p0, p0, Lvo3;->d:Lwo3;

    invoke-static {v0}, Lq9n;->r(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Lwo3;->J0()Lel9;

    move-result-object v3

    iget-object v3, v3, Lel9;->b:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v4, Lg6n;

    invoke-direct {v4, v3}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v4}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_37
    :goto_37
    move-object v4, v3

    check-cast v4, Lh6n;

    invoke-virtual {v4}, Lh6n;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_bd

    invoke-virtual {v4}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-virtual {p0}, Lwo3;->J0()Lel9;

    move-result-object v5

    iget-object v5, v5, Lel9;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5, v4}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v5

    if-eqz v5, :cond_57

    invoke-virtual {v5}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v6

    goto :goto_58

    :cond_57
    const/4 v6, -0x1

    :goto_58
    iget-object v7, p0, Lwo3;->F:Lwf;

    invoke-virtual {v7, v6}, Ldt1;->H(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lvf;

    if-eqz v6, :cond_37

    iget-object v6, v6, Lvf;->a:Lpc;

    invoke-static {v4}, Lq9n;->r(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v4

    sget-object v7, Lwo3;->K:Lpsp;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v7

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v8

    mul-int/2addr v8, v7

    iget v7, v0, Landroid/graphics/Rect;->left:I

    iget v9, v4, Landroid/graphics/Rect;->left:I

    if-ge v7, v9, :cond_7d

    move v7, v9

    :cond_7d
    iget v9, v0, Landroid/graphics/Rect;->top:I

    iget v10, v4, Landroid/graphics/Rect;->top:I

    if-ge v9, v10, :cond_84

    move v9, v10

    :cond_84
    iget v10, v0, Landroid/graphics/Rect;->right:I

    iget v11, v4, Landroid/graphics/Rect;->right:I

    if-le v10, v11, :cond_8b

    move v10, v11

    :cond_8b
    iget v11, v0, Landroid/graphics/Rect;->bottom:I

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    if-le v11, v4, :cond_92

    move v11, v4

    :cond_92
    sub-int/2addr v10, v7

    sub-int/2addr v11, v9

    if-lez v10, :cond_9a

    if-lez v11, :cond_9a

    mul-int/2addr v10, v11

    goto :goto_9b

    :cond_9a
    const/4 v10, 0x0

    :goto_9b
    const/4 v4, 0x0

    if-lez v10, :cond_a4

    if-lez v8, :cond_a4

    int-to-float v7, v10

    int-to-float v8, v8

    div-float/2addr v7, v8

    goto :goto_a5

    :cond_a4
    move v7, v4

    :goto_a5
    cmpl-float v4, v7, v4

    if-lez v4, :cond_37

    sget-object v4, Ldq3;->b:Ljava/util/Set;

    invoke-interface {v4, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_37

    new-instance v4, Lsm7;

    check-cast v5, Ltf;

    invoke-direct {v4, v6, v5, v7}, Lsm7;-><init>(Lpc;Ltf;F)V

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_37

    :cond_bd
    sget-object p0, Lo1i;->a:Lo1i;

    invoke-static {p0, v2}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsm7;

    const/4 v0, 0x0

    if-eqz p0, :cond_d4

    iget v2, p0, Lsm7;->c:F

    const/high16 v3, 0x3e800000    # 0.25f

    cmpg-float v2, v2, v3

    if-gez v2, :cond_d5

    :cond_d4
    move-object p0, v0

    :cond_d5
    new-instance v2, Lwj7;

    if-eqz p0, :cond_e1

    iget-object v0, p0, Lsm7;->a:Lpc;

    iget-object p0, p0, Lsm7;->b:Ltf;

    move-object v12, v0

    move-object v0, p0

    move-object p0, v12

    goto :goto_e2

    :cond_e1
    move-object p0, v0

    :goto_e2
    invoke-direct {v2, v1, p0, v0}, Lwj7;-><init>(Lpc;Lpc;Ltf;)V

    return-object v2
.end method

.method public final x(Landroidx/recyclerview/widget/i;Lxj7;)V
    .registers 11

    instance-of v0, p2, Lwj7;

    if-eqz v0, :cond_d4

    check-cast p2, Lwj7;

    iget-object v0, p2, Lwj7;->a:Lpc;

    iget-object v1, p2, Lwj7;->c:Ltf;

    if-eqz v1, :cond_d4

    iget-object p2, p2, Lwj7;->b:Lpc;

    if-eqz p2, :cond_d4

    iget-object p0, p0, Lskb;->e:Lvo3;

    iget-object v2, p0, Lvo3;->d:Lwo3;

    iget-object v3, v2, Lwo3;->t:Lcom/opera/android/settings/SettingsManager;

    iget-object v4, v2, Lwo3;->x:Lfw3;

    invoke-static {v3, v4}, Lvtp;->I(Lcom/opera/android/settings/SettingsManager;Lfw3;)Ljava/util/List;

    move-result-object v4

    check-cast v4, Ljava/util/Collection;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v5, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p2

    const/4 v4, -0x1

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eq p2, v4, :cond_39

    invoke-virtual {v5, p2, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-static {v3, v5}, Lvtp;->U(Lcom/opera/android/settings/SettingsManager;Ljava/util/ArrayList;)V

    iget-object p2, v2, Lwo3;->I:Lnp1;

    if-nez p2, :cond_37

    move-object p2, v7

    :cond_37
    iput-boolean v6, p2, Lnp1;->c:Z

    :cond_39
    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object p2, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object v1, p0, Lvo3;->c:Landroid/widget/FrameLayout;

    sget v2, Lxo8;->l:I

    iget-object v2, p0, Lvo3;->d:Lwo3;

    iget-object v2, v2, Lwo3;->H:Lt79;

    if-eqz v2, :cond_4f

    invoke-virtual {v2}, Lt79;->s0()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    :cond_4f
    iget-object v2, p0, Lvo3;->a:Lxj;

    iget-object p0, p0, Lvo3;->b:Lso3;

    invoke-static {v1, v7, v2, p0}, Lsgb;->r(Landroid/widget/FrameLayout;Ljava/lang/Integer;Lxj;Lso3;)Lxo8;

    move-result-object p0

    invoke-static {p1, v1}, Lw7d;->F(Landroid/view/View;Landroid/widget/FrameLayout;)Landroid/graphics/Rect;

    move-result-object v2

    invoke-static {p2, v1}, Lw7d;->F(Landroid/view/View;Landroid/widget/FrameLayout;)Landroid/graphics/Rect;

    move-result-object p2

    iget-object v3, p0, Lxo8;->c:Landroid/widget/FrameLayout;

    iget v4, v2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setTranslationX(F)V

    iget v4, v2, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setTranslationY(F)V

    iget-object v4, p0, Lxo8;->d:Landroid/widget/RelativeLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    sget-object v7, Lskb;->i:Lixh;

    invoke-virtual {v7, v5}, Ly7h;->l(Landroid/content/Context;)F

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setTranslationZ(F)V

    iget-object v4, p0, Lxo8;->e:Landroid/widget/RelativeLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v7, p1}, Ly7h;->l(Landroid/content/Context;)F

    move-result p1

    invoke-virtual {v4, p1}, Landroid/view/View;->setTranslationZ(F)V

    iget-object p1, p0, Lxo8;->i:Lpc;

    if-eq v0, p1, :cond_92

    iput-object v0, p0, Lxo8;->i:Lpc;

    invoke-virtual {p0}, Lxo8;->b()V

    :cond_92
    sget-object p1, Lwo8;->a:Lwo8;

    invoke-virtual {p0, p1}, Lxo8;->c(Lwo8;)V

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget p1, p2, Landroid/graphics/Rect;->left:I

    int-to-float p1, p1

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    add-float/2addr v0, p1

    iget p1, p2, Landroid/graphics/Rect;->top:I

    int-to-float p1, p1

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result p2

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    sub-int/2addr p2, v2

    int-to-float p2, p2

    div-float/2addr p2, v1

    add-float/2addr p2, p1

    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v0, 0xc8

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance p2, Leg;

    invoke-direct {p2, p0, v6}, Leg;-><init>(Lxo8;B)V

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    :cond_d4
    return-void
.end method
