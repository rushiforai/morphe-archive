.class public final Lyc3;
.super Loph;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lyc3;->a:B

    iput-object p1, p0, Lyc3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .registers 7

    iget-byte p1, p0, Lyc3;->a:B

    const/4 v0, 0x1

    iget-object p0, p0, Lyc3;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_d0

    :pswitch_8
    return-void

    :pswitch_9
    check-cast p0, Laan;

    invoke-virtual {p0}, Lcan;->d()V

    return-void

    :pswitch_f
    check-cast p0, Lp77;

    sget-object p1, Lc6l;->c:Lc6l;

    new-instance p2, Ldnj;

    const/16 v0, 0x1c

    invoke-direct {p2, p0, v0}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1, p2}, Lp77;->f(Lc6l;Lkotlin/jvm/functions/Function0;)V

    return-void

    :pswitch_1e
    check-cast p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    iget-object p1, p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->K0:Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;

    if-eqz p1, :cond_34

    if-nez p2, :cond_34

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    iget p2, p1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->f:I

    new-instance v0, Lv1k;

    invoke-direct {v0, p2, p0, p1}, Lv1k;-><init>(ILandroid/content/Context;Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/f;->startSmoothScroll(Luph;)V

    :cond_34
    return-void

    :pswitch_35
    check-cast p0, Ld0k;

    if-nez p2, :cond_60

    iget-object p1, p0, Ld0k;->k:Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;

    invoke-virtual {p1}, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->D()V

    iget-boolean p1, p0, Ld0k;->l:Z

    if-nez p1, :cond_60

    iput-boolean v0, p0, Ld0k;->l:Z

    iget-object p0, p0, Ld0k;->c:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_60

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p2

    invoke-static {p1, p2}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object p1

    iget-object p1, p1, Lhi0;->b:Lfi0;

    const/16 v1, 0x12

    const-wide/16 v2, 0x1

    invoke-virtual {p1, v1, v0, v2, v3}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, p2}, Lx5f;->U0(Lx56;)V

    :cond_60
    return-void

    :pswitch_61
    check-cast p0, Lxoi;

    if-nez p2, :cond_70

    invoke-virtual {p0}, Lxoi;->a()Z

    move-result p1

    if-eqz p1, :cond_70

    iget-object p1, p0, Lxoi;->b:Ls9i;

    invoke-virtual {p1, p0}, Ls9i;->U(Lxoi;)V

    :cond_70
    return-void

    :pswitch_71
    if-nez p2, :cond_b1

    check-cast p0, Lfge;

    iget-object p1, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz p1, :cond_b1

    invoke-virtual {p1, v0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p1

    iget-boolean p2, p0, Lfge;->E:Z

    if-eq p1, p2, :cond_b1

    iput-boolean p1, p0, Lfge;->E:Z

    iget-object p2, p0, Lfge;->D:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    if-eqz p1, :cond_8e

    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_8f

    :cond_8e
    const/4 v0, 0x0

    :goto_8f
    invoke-virtual {p2, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    new-instance v0, Lyqd;

    const/16 v1, 0x8

    invoke-direct {v0, p0, v1}, Lyqd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Landroid/view/ViewPropertyAnimator;->withStartAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    new-instance v0, Lgh2;

    const/4 v1, 0x5

    invoke-direct {v0, v1, p0, p1}, Lgh2;-><init>(BLjava/lang/Object;Z)V

    invoke-virtual {p2, v0}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 p1, 0x96

    invoke-virtual {p0, p1, p2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_b1
    return-void

    :pswitch_b2
    check-cast p0, Lzc3;

    const/4 p1, -0x1

    if-ne p2, v0, :cond_cc

    iget p2, p0, Lzc3;->j:I

    if-ne p2, p1, :cond_ce

    iget-object p2, p0, Lzc3;->i:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p2, :cond_c9

    invoke-virtual {p0}, Lzc3;->y()Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_c9

    invoke-static {p2}, Landroidx/recyclerview/widget/RecyclerView;->S(Landroid/view/View;)I

    move-result p1

    :cond_c9
    iput p1, p0, Lzc3;->j:I

    goto :goto_ce

    :cond_cc
    iput p1, p0, Lzc3;->j:I

    :cond_ce
    :goto_ce
    return-void

    nop

    :pswitch_data_d0
    .packed-switch 0x0
        :pswitch_b2
        :pswitch_8
        :pswitch_8
        :pswitch_71
        :pswitch_8
        :pswitch_61
        :pswitch_35
        :pswitch_1e
        :pswitch_f
        :pswitch_9
    .end packed-switch
.end method

.method public final onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .registers 12

    iget-byte v0, p0, Lyc3;->a:B

    iget-object p0, p0, Lyc3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_bc

    :pswitch_7
    return-void

    :pswitch_8
    check-cast p0, Laan;

    invoke-virtual {p0}, Lcan;->d()V

    return-void

    :pswitch_e
    check-cast p0, Lxoi;

    if-gtz p3, :cond_1e

    invoke-virtual {p0}, Lxoi;->a()Z

    move-result p1

    if-nez p1, :cond_1e

    invoke-static {}, Lsle;->d()Z

    move-result p1

    if-nez p1, :cond_23

    :cond_1e
    iget-object p1, p0, Lxoi;->b:Ls9i;

    invoke-virtual {p1, p0}, Ls9i;->U(Lxoi;)V

    :cond_23
    return-void

    :pswitch_24
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p1

    if-lez p1, :cond_2f

    check-cast p0, Lknh;

    invoke-virtual {p0}, Lknh;->I0()V

    :cond_2f
    return-void

    :pswitch_30
    if-nez p2, :cond_34

    if-eqz p3, :cond_41

    :cond_34
    check-cast p0, Lar8;

    iget-boolean p1, p0, Lar8;->m:Z

    if-eqz p1, :cond_41

    iget-object p1, p0, Lar8;->i:Lo63;

    iget-object p0, p0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, p0}, Lh6e;->d(Landroidx/recyclerview/widget/RecyclerView;)V

    :cond_41
    return-void

    :pswitch_42
    check-cast p0, Leq8;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeHorizontalScrollOffset()I

    move-result p2

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    move-result p1

    iget p3, p0, Leq8;->a:I

    iget-object v0, p0, Leq8;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollRange()I

    move-result v0

    iget v1, p0, Leq8;->r:I

    sub-int v2, v0, v1

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-lez v2, :cond_60

    if-lt v1, p3, :cond_60

    move v2, v4

    goto :goto_61

    :cond_60
    move v2, v3

    :goto_61
    iput-boolean v2, p0, Leq8;->t:Z

    iget-object v2, p0, Leq8;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->computeHorizontalScrollRange()I

    move-result v2

    iget v5, p0, Leq8;->q:I

    sub-int v6, v2, v5

    if-lez v6, :cond_73

    if-lt v5, p3, :cond_73

    move p3, v4

    goto :goto_74

    :cond_73
    move p3, v3

    :goto_74
    iput-boolean p3, p0, Leq8;->u:Z

    iget-boolean v6, p0, Leq8;->t:Z

    const/high16 v7, 0x40000000    # 2.0f

    if-nez v6, :cond_86

    if-nez p3, :cond_9a

    iget-byte p1, p0, Leq8;->v:B

    if-eqz p1, :cond_bb

    invoke-virtual {p0, v3}, Leq8;->h(I)V

    goto :goto_bb

    :cond_86
    int-to-float p1, p1

    int-to-float p3, v1

    div-float v3, p3, v7

    add-float/2addr v3, p1

    mul-float/2addr v3, p3

    int-to-float p1, v0

    div-float/2addr v3, p1

    float-to-int p1, v3

    iput p1, p0, Leq8;->l:I

    mul-int p1, v1, v1

    div-int/2addr p1, v0

    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p0, Leq8;->k:I

    :cond_9a
    iget-boolean p1, p0, Leq8;->u:Z

    if-eqz p1, :cond_b2

    int-to-float p1, p2

    int-to-float p2, v5

    div-float p3, p2, v7

    add-float/2addr p3, p1

    mul-float/2addr p3, p2

    int-to-float p1, v2

    div-float/2addr p3, p1

    float-to-int p1, p3

    iput p1, p0, Leq8;->o:I

    mul-int p1, v5, v5

    div-int/2addr p1, v2

    invoke-static {v5, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p0, Leq8;->n:I

    :cond_b2
    iget-byte p1, p0, Leq8;->v:B

    if-eqz p1, :cond_b8

    if-ne p1, v4, :cond_bb

    :cond_b8
    invoke-virtual {p0, v4}, Leq8;->h(I)V

    :cond_bb
    :goto_bb
    return-void

    :pswitch_data_bc
    .packed-switch 0x1
        :pswitch_42
        :pswitch_30
        :pswitch_7
        :pswitch_24
        :pswitch_e
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method
