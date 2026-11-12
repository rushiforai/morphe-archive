.class public final Lrgh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Luu5;
.implements Lbnj;
.implements Ln8k;
.implements Lx9l;
.implements Lgi2;
.implements Lbcf;
.implements Lnxi;
.implements Lylo;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 39
    iput-object p1, p0, Lrgh;->a:Ljava/lang/Object;

    iput-object p2, p0, Lrgh;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Z)V
    .registers 4

    .line 38
    iput-object p2, p0, Lrgh;->a:Ljava/lang/Object;

    iput-object p1, p0, Lrgh;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lpt1;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrgh;->a:Ljava/lang/Object;

    iget-object v0, p1, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    new-instance v1, Lqgh;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lqgh;-><init>(Z)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p1, Lpt1;->g:Landroid/view/View;

    check-cast p1, Landroid/widget/ImageView;

    new-instance v0, Lqgh;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lqgh;-><init>(Z)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v1, v2}, Lrgh;->n(IZ)V

    invoke-virtual {p0, v1, v1}, Lrgh;->n(IZ)V

    return-void
.end method


# virtual methods
.method public final C()Likc;
    .registers 1

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    iget-object p0, p0, La21;->m:Ljava/lang/Object;

    check-cast p0, Lpde;

    return-object p0
.end method

.method public final D(I)Z
    .registers 2

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0, p1}, Lp9l;->D(I)Z

    const/4 p0, 0x1

    return p0
.end method

.method public final E(I)Lb2l;
    .registers 2

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0, p1}, Lp9l;->E(I)Lb2l;

    move-result-object p0

    return-object p0
.end method

.method public final F(Landroid/graphics/Bitmap;)V
    .registers 6

    iget-object v0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Li3j;

    iget-object p0, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    iget-object v1, v0, Li3j;->d:Ljava/lang/Object;

    check-cast v1, Lumi;

    new-instance v2, Lmgf;

    const/16 v3, 0x19

    invoke-direct {v2, v0, p1, v3}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    new-instance v1, Lo62;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lo62;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v1}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Loml;->a(Ljava/lang/Object;Ljri;)V

    return-void
.end method

.method public final L(Ljava/lang/Long;)V
    .registers 2

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0, p1}, La21;->L(Ljava/lang/Long;)V

    return-void
.end method

.method public final N(Lz3;)V
    .registers 2

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0, p1}, La21;->N(Lz3;)V

    return-void
.end method

.method public final O(Ljava/lang/Iterable;ZZ)V
    .registers 4

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2, p3}, La21;->O(Ljava/lang/Iterable;ZZ)V

    return-void
.end method

.method public final P(Ljava/lang/Integer;Ljava/util/Set;Lvr0;)V
    .registers 4

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0, p1, p2, p3}, La21;->P(Ljava/lang/Integer;Ljava/util/Set;Lvr0;)V

    return-void
.end method

.method public final X(Ljava/util/List;)Z
    .registers 2

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0, p1}, Lp9l;->X(Ljava/util/List;)Z

    move-result p0

    return p0
.end method

.method public final a()Ljava/lang/Object;
    .registers 4

    new-instance v0, Lmgh;

    iget-object v1, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast v1, Lh61;

    iget-object p0, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast p0, Lylo;

    const/16 v2, 0xd

    invoke-direct {v0, v1, p0, v2}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0
.end method

.method public final b(Lq8l;)V
    .registers 3

    iget-object p1, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p1, Lw6j;

    iget-object p0, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast p0, Ln4k;

    iget-object v0, p1, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Lknf;

    if-eq v0, p0, :cond_f

    return-void

    :cond_f
    iget-object p0, p1, Lw6j;->e:Ljava/lang/Object;

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->p0()V

    return-void
.end method

.method public final c(Lyul;)V
    .registers 4

    iget-object v0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Lw6j;

    iget-object p0, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast p0, Ln4k;

    iget-object v1, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v1, Lknf;

    if-eq v1, p0, :cond_f

    return-void

    :cond_f
    iget-object p0, v0, Lw6j;->e:Ljava/lang/Object;

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->d:Ltw2;

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/BrowserFragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lt5d;

    invoke-virtual {p0, p1}, Ldx3;->a0(Lyul;)V

    return-void
.end method

.method public final d(I)I
    .registers 5

    iget-object v0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/CharSequence;

    :cond_4
    iget-object v1, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast v1, Li1;

    invoke-virtual {v1, p1}, Li1;->D(I)I

    move-result p1

    const/4 v1, -0x1

    if-eq p1, v1, :cond_20

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-eq p1, v2, :cond_20

    invoke-interface {v0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-nez v1, :cond_4

    return p1

    :cond_20
    return v1
.end method

.method public final d0(Lb2l;)V
    .registers 2

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0, p1}, La21;->d0(Lb2l;)V

    return-void
.end method

.method public final e(ILandroid/view/View;)V
    .registers 7

    invoke-virtual {p2}, Landroid/view/View;->isLaidOut()Z

    move-result v0

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-nez v0, :cond_10

    invoke-virtual {p2, v2}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_10
    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    sget-object v0, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Lc48;

    invoke-direct {v0, v1, p2, p0}, Lc48;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final f(Z)V
    .registers 2

    iget-object p0, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final g(I)I
    .registers 3

    :cond_0
    iget-object v0, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast v0, Li1;

    invoke-virtual {v0, p1}, Li1;->R(I)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_c

    return v0

    :cond_c
    iget-object v0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/CharSequence;

    invoke-interface {v0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v0

    if-nez v0, :cond_0

    return p1
.end method

.method public final g0(Ljava/util/Set;Lpdb;Lvr0;Z)V
    .registers 5

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0, p1, p2, p3, p4}, La21;->g0(Ljava/util/Set;Lpdb;Lvr0;Z)V

    return-void
.end method

.method public final h(I)I
    .registers 4

    :cond_0
    iget-object v0, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast v0, Li1;

    invoke-virtual {v0, p1}, Li1;->D(I)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_c

    return v0

    :cond_c
    iget-object v0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/CharSequence;

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v0

    if-nez v0, :cond_0

    return p1
.end method

.method public final h0(Lb2l;Lcom/opera/android/browser/TabInfo;)Lb2l;
    .registers 3

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0, p1, p2}, La21;->h0(Lb2l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    move-result-object p0

    return-object p0
.end method

.method public final i(ILandroid/view/View;)V
    .registers 6

    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    sget-object v0, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Lc48;

    const/4 v1, 0x7

    invoke-direct {v0, v1, p2, p0}, Lc48;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final j(ZZ)I
    .registers 3

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lpt1;

    if-eqz p1, :cond_f

    iget-object p0, p0, Lpt1;->c:Landroid/view/View;

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result p0

    goto :goto_17

    :cond_f
    iget-object p0, p0, Lpt1;->b:Landroid/view/View;

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result p0

    :goto_17
    const/high16 p1, 0x43960000    # 300.0f

    if-eqz p2, :cond_21

    const/high16 p2, 0x3f800000    # 1.0f

    sub-float/2addr p2, p0

    mul-float/2addr p2, p1

    float-to-int p0, p2

    return p0

    :cond_21
    mul-float/2addr p0, p1

    float-to-int p0, p0

    return p0
.end method

.method public final j0(Lp6l;Lcom/opera/android/browser/TabInfo;)Lb2l;
    .registers 3

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0, p1, p2}, La21;->j0(Lp6l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    move-result-object p0

    return-object p0
.end method

.method public final k(Lp6l;)Lb2l;
    .registers 2

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0, p1}, La21;->k(Lp6l;)Lb2l;

    move-result-object p0

    return-object p0
.end method

.method public final k0()V
    .registers 1

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0}, Lp9l;->k0()V

    return-void
.end method

.method public final l(Lnyb;Lmt5;)Ljava/lang/Object;
    .registers 14

    iget-object v0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Ls9m;

    instance-of v1, p2, Lwzh;

    if-eqz v1, :cond_17

    move-object v1, p2

    check-cast v1, Lwzh;

    iget v2, v1, Lwzh;->y:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_17

    sub-int/2addr v2, v3

    iput v2, v1, Lwzh;->y:I

    goto :goto_1c

    :cond_17
    new-instance v1, Lwzh;

    invoke-direct {v1, p0, p2}, Lwzh;-><init>(Lrgh;Lmt5;)V

    :goto_1c
    iget-object p2, v1, Lwzh;->w:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v1, Lwzh;->y:I

    const-string v4, "rawResponse must be successful response"

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz v3, :cond_50

    if-eq v3, v7, :cond_49

    if-eq v3, v6, :cond_3d

    if-ne v3, v5, :cond_37

    iget-object p0, v1, Lwzh;->u:Lfr6;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_b6

    :cond_37
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v8

    :cond_3d
    iget p0, v1, Lwzh;->v:I

    iget-object p1, v1, Lwzh;->u:Lfr6;

    iget-object v0, v1, Lwzh;->t:Lx9m;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    move v9, p0

    move-object p0, p1

    goto :goto_9f

    :cond_49
    iget-object p0, v1, Lwzh;->u:Lfr6;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_103

    :cond_50
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    instance-of p2, p1, Lmyb;

    if-eqz p2, :cond_121

    iget-object p2, v0, Ls9m;->b:Ljava/util/List;

    invoke-static {p2}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ls9m;

    iget-object p2, p2, Ls9m;->c:Lx9m;

    move-object v3, p1

    check-cast v3, Lmyb;

    iget-object v3, v3, Lmyb;->a:Lfr6;

    invoke-virtual {v3}, Lfr6;->e()Lzqa;

    move-result-object v9

    iget v9, v9, Lzqa;->a:I

    const/16 v10, 0xc8

    if-lt v9, v10, :cond_de

    const/16 v10, 0x12c

    if-ge v9, v10, :cond_de

    const/16 v7, 0xcc

    if-eq v9, v7, :cond_ca

    const/16 v7, 0xcd

    if-eq v9, v7, :cond_ca

    iget-object p0, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast p0, Ljyb;

    iget-object v0, v0, Ls9m;->b:Ljava/util/List;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ls9m;

    invoke-virtual {p0, v0}, Ljyb;->a(Ls9m;)Luu5;

    move-result-object p0

    if-eqz p0, :cond_a3

    iput-object p2, v1, Lwzh;->t:Lx9m;

    iput-object v3, v1, Lwzh;->u:Lfr6;

    iput v9, v1, Lwzh;->v:I

    iput v6, v1, Lwzh;->y:I

    invoke-interface {p0, p1, v1}, Luu5;->l(Lnyb;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v2, :cond_101

    move-object v0, p2

    move-object p2, p0

    move-object p0, v3

    :goto_9f
    if-nez p2, :cond_b6

    move-object p2, v0

    goto :goto_a4

    :cond_a3
    move-object p0, v3

    :goto_a4
    iput-object v8, v1, Lwzh;->t:Lx9m;

    iput-object p0, v1, Lwzh;->u:Lfr6;

    iput v9, v1, Lwzh;->v:I

    iput v5, v1, Lwzh;->y:I

    invoke-virtual {p0}, Lfr6;->T()Ltna;

    move-result-object p1

    invoke-virtual {p1, p2, v1}, Ltna;->b(Lx9m;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v2, :cond_101

    :cond_b6
    :goto_b6
    invoke-virtual {p0}, Lfr6;->e()Lzqa;

    move-result-object p1

    invoke-static {p1}, Lalo;->X(Lzqa;)Z

    move-result p1

    if-eqz p1, :cond_c6

    new-instance p1, Lozh;

    invoke-direct {p1, p0, p2, v8}, Lozh;-><init>(Lfr6;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p1

    :cond_c6
    invoke-static {v4}, Lqp2;->o(Ljava/lang/String;)V

    return-object v8

    :cond_ca
    invoke-virtual {v3}, Lfr6;->e()Lzqa;

    move-result-object p0

    invoke-static {p0}, Lalo;->X(Lzqa;)Z

    move-result p0

    if-eqz p0, :cond_da

    new-instance p0, Lozh;

    invoke-direct {p0, v3, v8, v8}, Lozh;-><init>(Lfr6;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0

    :cond_da
    invoke-static {v4}, Lqp2;->o(Ljava/lang/String;)V

    return-object v8

    :cond_de
    invoke-virtual {v3}, Lfr6;->T()Ltna;

    move-result-object p0

    const-class p1, Ljava/lang/Object;

    invoke-static {p1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p2

    :try_start_e8
    invoke-static {p1}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object p1
    :try_end_ec
    .catchall {:try_start_e8 .. :try_end_ec} :catchall_ed

    goto :goto_ee

    :catchall_ed
    move-object p1, v8

    :goto_ee
    new-instance v0, Lx9m;

    invoke-direct {v0, p2, p1}, Lx9m;-><init>(Litb;Lcam;)V

    iput-object v8, v1, Lwzh;->t:Lx9m;

    iput-object v3, v1, Lwzh;->u:Lfr6;

    iput v9, v1, Lwzh;->v:I

    iput v7, v1, Lwzh;->y:I

    invoke-virtual {p0, v0, v1}, Ltna;->b(Lx9m;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v2, :cond_102

    :cond_101
    return-object v2

    :cond_102
    move-object p0, v3

    :goto_103
    if-eqz p2, :cond_11b

    invoke-virtual {p0}, Lfr6;->e()Lzqa;

    move-result-object p1

    invoke-static {p1}, Lalo;->X(Lzqa;)Z

    move-result p1

    if-nez p1, :cond_115

    new-instance p1, Lozh;

    invoke-direct {p1, p0, v8, p2}, Lozh;-><init>(Lfr6;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p1

    :cond_115
    const-string p0, "rawResponse should not be successful response"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v8

    :cond_11b
    const-string p0, "null cannot be cast to non-null type kotlin.Any"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v8

    :cond_121
    instance-of p0, p1, Llyb;

    if-nez p0, :cond_129

    invoke-static {}, Lh9o;->p()V

    return-object v8

    :cond_129
    check-cast p1, Llyb;

    iget-object p0, p1, Llyb;->a:Ljava/lang/Throwable;

    throw p0
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 6

    iget-object v0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Lo9n;

    new-instance v1, Lsv2;

    iget-object p0, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast p0, Lsv2;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iget v2, p0, Lsv2;->a:I

    iput v2, v1, Lsv2;->a:I

    iget v2, p0, Lsv2;->b:I

    iput v2, v1, Lsv2;->b:I

    iget p0, p0, Lsv2;->c:I

    iput p0, v1, Lsv2;->c:I

    invoke-interface {v0, p1, p2, v1}, Lo9n;->m(Landroid/view/View;Lg3o;Lsv2;)Lg3o;

    move-result-object p0

    return-object p0
.end method

.method public final m(Lb2l;)V
    .registers 2

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0, p1}, Lp9l;->m(Lb2l;)V

    return-void
.end method

.method public final m0(Ljava/util/LinkedHashSet;)V
    .registers 2

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0, p1}, La21;->m0(Ljava/util/LinkedHashSet;)V

    return-void
.end method

.method public final n(IZ)V
    .registers 4

    iget-object v0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Lpt1;

    if-eqz p2, :cond_15

    iget-object p2, v0, Lpt1;->c:Landroid/view/View;

    check-cast p2, Landroid/widget/TextView;

    invoke-virtual {p0, p1, p2}, Lrgh;->e(ILandroid/view/View;)V

    iget-object p2, v0, Lpt1;->f:Ljava/lang/Object;

    check-cast p2, Landroid/widget/ImageView;

    invoke-virtual {p0, p1, p2}, Lrgh;->e(ILandroid/view/View;)V

    return-void

    :cond_15
    iget-object p2, v0, Lpt1;->b:Landroid/view/View;

    check-cast p2, Landroid/widget/TextView;

    invoke-virtual {p0, p1, p2}, Lrgh;->e(ILandroid/view/View;)V

    iget-object p2, v0, Lpt1;->g:Landroid/view/View;

    check-cast p2, Landroid/widget/ImageView;

    invoke-virtual {p0, p1, p2}, Lrgh;->e(ILandroid/view/View;)V

    return-void
.end method

.method public final o()V
    .registers 1

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0}, Lp9l;->o()V

    return-void
.end method

.method public final o0(Ljava/lang/Iterable;ZZ)V
    .registers 4

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2, p3}, La21;->o0(Ljava/lang/Iterable;ZZ)V

    return-void
.end method

.method public final p(Ljava/lang/String;Ls14;)V
    .registers 6

    iget-object v0, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast v0, Lsa4;

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lc5o;

    new-instance v1, Ljbd;

    const/16 v2, 0x1c

    invoke-direct {v1, p0, p1, p2, v2}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lsa4;->b(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final p0(I)V
    .registers 2

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0, p1}, La21;->p0(I)V

    return-void
.end method

.method public final q(Landroid/content/Context;Lcue;Ljava/lang/String;)V
    .registers 7

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "__sd"

    if-eqz v0, :cond_9

    move-object p3, v1

    :cond_9
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_20

    new-instance p2, Ltu3;

    const-string p3, "startpage"

    invoke-static {p3}, Lwqm;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p1}, Ld5k;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p3, p1, v1}, Ltu3;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    goto :goto_45

    :cond_20
    const-string v0, "topnews"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_37

    new-instance p3, Ltu3;

    invoke-static {p2, v0}, Ld5k;->b(Lcue;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1}, Ld5k;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p2, p1, v1}, Ltu3;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    move-object p2, p3

    goto :goto_45

    :cond_37
    new-instance v0, Ltu3;

    invoke-static {p2, p3}, Ld5k;->b(Lcue;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1}, Ld5k;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p2, p1, v1}, Ltu3;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    move-object p2, v0

    :goto_45
    iget-object p1, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    if-nez p1, :cond_52

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lrgh;->b:Ljava/lang/Object;

    :cond_52
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final r(I)I
    .registers 4

    :cond_0
    iget-object v0, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast v0, Li1;

    invoke-virtual {v0, p1}, Li1;->R(I)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_1e

    if-eqz p1, :cond_1e

    iget-object v0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/CharSequence;

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v0

    if-nez v0, :cond_0

    return p1

    :cond_1e
    return v0
.end method

.method public final s()V
    .registers 4

    iget-object v0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z

    move-result v1

    if-eqz v1, :cond_e

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCursorVisible(Z)V

    :cond_e
    invoke-virtual {v0}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    move-result-object v0

    const/4 v1, -0x1

    if-eqz v0, :cond_20

    iget-object v2, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast v2, Landroid/text/style/BackgroundColorSpan;

    if-eqz v2, :cond_20

    invoke-interface {v0, v2}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v2

    goto :goto_21

    :cond_20
    move v2, v1

    :goto_21
    if-ne v2, v1, :cond_24

    return-void

    :cond_24
    iget-object v1, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast v1, Landroid/text/style/BackgroundColorSpan;

    invoke-interface {v0, v1}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-interface {v0, v2, v1}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    const/4 v0, 0x0

    iput-object v0, p0, Lrgh;->b:Ljava/lang/Object;

    return-void
.end method

.method public final w(Ljava/util/LinkedHashSet;)V
    .registers 2

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0, p1}, La21;->w(Ljava/util/LinkedHashSet;)V

    return-void
.end method

.method public final y()V
    .registers 1

    iget-object p0, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast p0, Lp9l;

    invoke-virtual {p0}, La21;->y()V

    return-void
.end method
