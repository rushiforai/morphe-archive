.class public final Luvl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpt1;

.field public final b:Landroidx/recyclerview/widget/RecyclerView;

.field public final c:Lpde;

.field public final d:Lpde;

.field public final e:Lt8k;

.field public final f:Ltsd;

.field public g:Landroid/view/View;

.field public final h:Lpde;

.field public final i:Landroid/widget/FrameLayout;

.field public j:Ljava/lang/Boolean;

.field public k:Z

.field public l:Z

.field public final m:I

.field public final n:I

.field public final o:I

.field public final p:I

.field public q:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Lpde;Lpt1;Landroidx/recyclerview/widget/RecyclerView;Lpde;Lpde;Lnjm;Llg;Lfd;Lhv3;Lkze;Lt8k;Ltsd;Ltsd;)V
    .registers 21

    move-object/from16 v1, p9

    move-object/from16 v2, p13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Luvl;->a:Lpt1;

    iput-object p3, p0, Luvl;->b:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p4, p0, Luvl;->c:Lpde;

    iput-object p5, p0, Luvl;->d:Lpde;

    move-object/from16 p3, p11

    iput-object p3, p0, Luvl;->e:Lt8k;

    iput-object v2, p0, Luvl;->f:Ltsd;

    new-instance p3, Lpde;

    new-instance v3, Ltvl;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {v3, v4, v4, v5, v5}, Ltvl;-><init>(FFII)V

    invoke-direct {p3, v3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p3, p0, Luvl;->h:Lpde;

    iget-object p3, p2, Lpt1;->b:Landroid/view/View;

    check-cast p3, Landroid/widget/FrameLayout;

    iput-object p3, p0, Luvl;->i:Landroid/widget/FrameLayout;

    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const/high16 v4, 0x41800000    # 16.0f

    invoke-static {v3, v4}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v3

    iput v3, p0, Luvl;->m:I

    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const/high16 v4, 0x41c00000    # 24.0f

    invoke-static {v3, v4}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v3

    iput v3, p0, Luvl;->n:I

    invoke-virtual {p3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f070974

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Luvl;->o:I

    invoke-virtual {p3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v3, 0x7f070975

    invoke-virtual {p3, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    iput p3, p0, Luvl;->p:I

    new-instance p3, Lbv8;

    const/4 v3, 0x3

    invoke-direct {p3, p0, v3}, Lbv8;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Lp7l;

    const/16 v6, 0x13

    invoke-direct {v4, p0, v6}, Lp7l;-><init>(Ljava/lang/Object;B)V

    invoke-static {p6, p1, p3, v4}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance p3, Lsvl;

    invoke-direct {p3, p0, v5}, Lsvl;-><init>(Luvl;B)V

    invoke-static {p4, p1, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p3, Lsvl;

    const/4 p4, 0x1

    invoke-direct {p3, p0, p4}, Lsvl;-><init>(Luvl;B)V

    invoke-static {p5, p1, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p3, Lsvl;

    const/4 p4, 0x2

    invoke-direct {p3, p0, p4}, Lsvl;-><init>(Luvl;B)V

    invoke-static {v2, p1, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p0, Lp8f;

    move-object/from16 p3, p10

    move-object/from16 p4, p12

    invoke-direct {p0, p1, p2, p3, p4}, Lp8f;-><init>(Lpde;Lpt1;Lkze;Ltsd;)V

    new-instance p0, Lzg;

    iget-object p3, p2, Lpt1;->c:Landroid/view/View;

    check-cast p3, Landroid/widget/ImageView;

    invoke-direct {p0, p1, p3, p7}, Lzg;-><init>(Likc;Landroid/widget/ImageView;Llg;)V

    new-instance p0, Lqb7;

    iget-object p4, p2, Lpt1;->d:Ljava/lang/Object;

    check-cast p4, Landroid/widget/ImageView;

    iget-object v0, p2, Lpt1;->g:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    invoke-direct {p0, p1, p4, v0, p8}, Lqb7;-><init>(Likc;Landroid/widget/ImageView;Landroid/widget/ImageView;Lfd;)V

    iget-object p0, p2, Lpt1;->f:Ljava/lang/Object;

    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance p1, Lmze;

    invoke-direct {p1, v1, v3}, Lmze;-><init>(Lhv3;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p0, Lmze;

    const/4 p1, 0x4

    invoke-direct {p0, v1, p1}, Lmze;-><init>(Lhv3;B)V

    invoke-virtual {p3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 19

    move-object/from16 v0, p0

    iget-object v1, v0, Luvl;->a:Lpt1;

    iget-object v2, v1, Lpt1;->g:Landroid/view/View;

    check-cast v2, Landroid/widget/ImageView;

    iget-object v3, v1, Lpt1;->d:Ljava/lang/Object;

    check-cast v3, Landroid/widget/ImageView;

    iget-object v4, v1, Lpt1;->f:Ljava/lang/Object;

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v1, v1, Lpt1;->e:Ljava/lang/Object;

    check-cast v1, Landroidx/constraintlayout/widget/Barrier;

    iget-object v5, v0, Luvl;->g:Landroid/view/View;

    if-eqz v5, :cond_1e

    invoke-virtual {v5}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v5

    if-nez v5, :cond_29

    :cond_1e
    iget-object v5, v0, Luvl;->b:Landroidx/recyclerview/widget/RecyclerView;

    const v6, 0x7f0a0bce

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, v0, Luvl;->g:Landroid/view/View;

    :cond_29
    iget-object v5, v0, Luvl;->i:Landroid/widget/FrameLayout;

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    instance-of v7, v6, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v7, :cond_36

    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    goto :goto_37

    :cond_36
    const/4 v6, 0x0

    :goto_37
    const/4 v7, 0x0

    if-nez v6, :cond_3b

    return v7

    :cond_3b
    invoke-virtual {v0}, Luvl;->b()Ljava/lang/Integer;

    move-result-object v9

    if-eqz v9, :cond_4d

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-virtual {v0}, Luvl;->c()I

    move-result v10

    if-ge v9, v10, :cond_51

    move v9, v10

    goto :goto_51

    :cond_4d
    invoke-virtual {v0}, Luvl;->c()I

    move-result v9

    :cond_51
    :goto_51
    iput v9, v6, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v6

    sub-int/2addr v9, v6

    if-eqz v9, :cond_5d

    invoke-virtual {v5, v9}, Landroid/view/View;->offsetTopAndBottom(I)V

    :cond_5d
    invoke-virtual {v0}, Luvl;->b()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    iget-object v11, v0, Luvl;->f:Ltsd;

    invoke-virtual {v11}, Lekc;->g()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lkl5;

    iget-object v12, v12, Lkl5;->b:Landroid/graphics/Rect;

    invoke-static {v10, v12}, Lw1h;->y(Landroid/content/Context;Landroid/graphics/Rect;)Z

    move-result v10

    if-eqz v10, :cond_77

    move v10, v7

    goto :goto_79

    :cond_77
    iget v10, v0, Luvl;->o:I

    :goto_79
    new-instance v12, Ltvl;

    invoke-virtual {v0}, Luvl;->c()I

    move-result v13

    iget v14, v0, Luvl;->m:I

    add-int/2addr v13, v14

    invoke-virtual {v0}, Luvl;->c()I

    move-result v15

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v16

    move/from16 v17, v7

    const/4 v8, 0x0

    if-ne v13, v15, :cond_91

    move v7, v8

    goto :goto_9d

    :cond_91
    sub-int v7, v16, v13

    int-to-float v7, v7

    sub-int/2addr v15, v13

    int-to-float v13, v15

    div-float/2addr v7, v13

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-static {v7, v8, v13}, Ldjh;->b(FFF)F

    move-result v7

    :goto_9d
    if-nez v6, :cond_a2

    const/high16 v13, 0x3f800000    # 1.0f

    goto :goto_bd

    :cond_a2
    invoke-virtual {v0}, Luvl;->c()I

    move-result v13

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    sub-int/2addr v13, v6

    if-gez v13, :cond_af

    move/from16 v13, v17

    :cond_af
    if-nez v14, :cond_b3

    move v13, v8

    goto :goto_bd

    :cond_b3
    int-to-float v6, v13

    int-to-float v13, v14

    div-float/2addr v6, v13

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-static {v6, v8, v13}, Ldjh;->b(FFF)F

    move-result v6

    move v13, v6

    :goto_bd
    invoke-direct {v12, v7, v13, v10, v10}, Ltvl;-><init>(FFII)V

    iget-object v6, v0, Luvl;->h:Lpde;

    invoke-static {v6, v12}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v11}, Lekc;->g()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkl5;

    iget-object v7, v7, Lkl5;->b:Landroid/graphics/Rect;

    invoke-static {v6, v7}, Lw1h;->y(Landroid/content/Context;Landroid/graphics/Rect;)Z

    move-result v6

    if-eqz v6, :cond_104

    iget-object v6, v0, Luvl;->c:Lpde;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lmnf;

    iget v6, v6, Lmnf;->c:I

    invoke-virtual {v0}, Luvl;->c()I

    move-result v7

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v10

    if-ne v6, v7, :cond_ef

    move v6, v8

    const/high16 v13, 0x3f800000    # 1.0f

    goto :goto_fa

    :cond_ef
    sub-int/2addr v10, v6

    int-to-float v10, v10

    sub-int/2addr v7, v6

    int-to-float v6, v7

    div-float/2addr v10, v6

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-static {v10, v8, v13}, Ldjh;->b(FFF)F

    move-result v6

    :goto_fa
    const/high16 v7, 0x40000000    # 2.0f

    mul-float/2addr v6, v7

    sub-float v7, v13, v6

    invoke-static {v7, v8, v13}, Ldjh;->b(FFF)F

    move-result v7

    goto :goto_107

    :cond_104
    const/high16 v13, 0x3f800000    # 1.0f

    move v7, v13

    :goto_107
    invoke-virtual {v5, v7}, Landroid/view/View;->setAlpha(F)V

    const/4 v6, 0x1

    if-eqz v9, :cond_10f

    move v7, v6

    goto :goto_111

    :cond_10f
    move/from16 v7, v17

    :goto_111
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    instance-of v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v9, :cond_11c

    check-cast v8, Landroid/view/ViewGroup$MarginLayoutParams;

    goto :goto_11d

    :cond_11c
    const/4 v8, 0x0

    :goto_11d
    if-eqz v8, :cond_133

    iget-object v9, v0, Luvl;->d:Lpde;

    invoke-virtual {v9}, Lekc;->g()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->intValue()I

    move-result v9

    iget v10, v8, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-ne v10, v9, :cond_136

    iget v10, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-ne v10, v9, :cond_136

    :cond_133
    move/from16 v4, v17

    goto :goto_13e

    :cond_136
    iput v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-virtual {v4}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    move v4, v6

    :goto_13e
    or-int/2addr v7, v4

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v11}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lkl5;

    iget-object v8, v8, Lkl5;->b:Landroid/graphics/Rect;

    iget-object v9, v0, Luvl;->e:Lt8k;

    iget-boolean v9, v9, Lt8k;->e:Z

    if-eqz v9, :cond_16a

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v8

    invoke-static {v8, v4}, Lddh;->s(ILandroid/content/Context;)Lgpj;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-eqz v4, :cond_16a

    if-eq v4, v6, :cond_168

    const/4 v8, 0x2

    if-eq v4, v8, :cond_168

    invoke-static {}, Lh9o;->p()V

    return v17

    :cond_168
    move v4, v6

    goto :goto_16c

    :cond_16a
    move/from16 v4, v17

    :goto_16c
    if-eqz v4, :cond_187

    invoke-virtual {v0}, Luvl;->b()Ljava/lang/Integer;

    move-result-object v8

    if-eqz v8, :cond_185

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v0}, Luvl;->c()I

    move-result v9

    sub-int/2addr v9, v8

    if-gez v9, :cond_181

    move/from16 v9, v17

    :cond_181
    iget v8, v0, Luvl;->n:I

    if-gt v9, v8, :cond_187

    :cond_185
    move v8, v6

    goto :goto_189

    :cond_187
    move/from16 v8, v17

    :goto_189
    iget-boolean v9, v0, Luvl;->k:Z

    if-eq v8, v9, :cond_1f4

    iget-object v9, v0, Luvl;->j:Ljava/lang/Boolean;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1a5

    invoke-virtual {v5}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v5

    if-eqz v5, :cond_1a5

    iget-boolean v5, v0, Luvl;->l:Z

    if-nez v5, :cond_1a5

    move v5, v6

    goto :goto_1a7

    :cond_1a5
    move/from16 v5, v17

    :goto_1a7
    iput-boolean v8, v0, Luvl;->k:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iput-object v4, v0, Luvl;->j:Ljava/lang/Boolean;

    if-eqz v8, :cond_1b8

    invoke-virtual {v1, v3}, Lho5;->i(Landroid/view/View;)V

    invoke-virtual {v1, v2}, Lho5;->i(Landroid/view/View;)V

    goto :goto_1ef

    :cond_1b8
    const/4 v4, -0x1

    if-eq v3, v1, :cond_1d4

    invoke-virtual {v3}, Landroid/view/View;->getId()I

    move-result v8

    if-eq v8, v4, :cond_1d4

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    if-eqz v8, :cond_1d4

    const/4 v8, 0x0

    iput-object v8, v1, Lho5;->e:Ljava/lang/String;

    invoke-virtual {v3}, Landroid/view/View;->getId()I

    move-result v3

    invoke-virtual {v1, v3}, Lho5;->b(I)V

    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    :cond_1d4
    if-eq v2, v1, :cond_1ef

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v3

    if-eq v3, v4, :cond_1ef

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-eqz v3, :cond_1ef

    const/4 v8, 0x0

    iput-object v8, v1, Lho5;->e:Ljava/lang/String;

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Lho5;->b(I)V

    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    :cond_1ef
    :goto_1ef
    invoke-virtual {v0, v5}, Luvl;->d(Z)V

    move/from16 v17, v6

    :cond_1f4
    or-int v7, v7, v17

    return v7
.end method

.method public final b()Ljava/lang/Integer;
    .registers 4

    iget-object v0, p0, Luvl;->g:Landroid/view/View;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return-object v1

    :cond_6
    iget-object p0, p0, Luvl;->i:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of v2, p0, Landroid/view/View;

    if-eqz v2, :cond_13

    check-cast p0, Landroid/view/View;

    goto :goto_14

    :cond_13
    move-object p0, v1

    :goto_14
    if-nez p0, :cond_17

    return-object v1

    :cond_17
    invoke-static {v0, p0}, Lq9n;->q(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Point;

    move-result-object p0

    iget p0, p0, Landroid/graphics/Point;->y:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final c()I
    .registers 3

    iget-object v0, p0, Luvl;->i:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Luvl;->f:Ltsd;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkl5;

    iget-object v1, v1, Lkl5;->b:Landroid/graphics/Rect;

    invoke-static {v0, v1}, Lw1h;->y(Landroid/content/Context;Landroid/graphics/Rect;)Z

    move-result v0

    iget-object v1, p0, Luvl;->c:Lpde;

    if-eqz v0, :cond_2c

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmnf;

    iget v0, v0, Lmnf;->c:I

    iget-object p0, p0, Luvl;->a:Lpt1;

    iget-object p0, p0, Lpt1;->b:Landroid/view/View;

    check-cast p0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    sub-int/2addr v0, p0

    return v0

    :cond_2c
    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmnf;

    iget p0, p0, Lmnf;->c:I

    return p0
.end method

.method public final d(Z)V
    .registers 8

    iget-object v0, p0, Luvl;->i:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-nez v1, :cond_9

    return-void

    :cond_9
    iget-boolean v2, p0, Luvl;->k:Z

    iget v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eqz v2, :cond_12

    iget v4, p0, Luvl;->p:I

    goto :goto_14

    :cond_12
    iget v4, p0, Luvl;->o:I

    :goto_14
    iget-object v5, p0, Luvl;->q:Landroid/animation/ValueAnimator;

    if-eqz v5, :cond_1b

    invoke-virtual {v5}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_1b
    if-eqz p1, :cond_4c

    filled-new-array {v3, v4}, [I

    move-result-object p1

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object p1

    if-eqz v2, :cond_2a

    const-wide/16 v2, 0x96

    goto :goto_2c

    :cond_2a
    const-wide/16 v2, 0xfa

    :goto_2c
    invoke-virtual {p1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    sget-object v0, Llf1;->c:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v0, Lwo1;

    const/4 v2, 0x3

    invoke-direct {v0, v1, p0, v2}, Lwo1;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v0, Ldf1;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Ldf1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    iput-object p1, p0, Luvl;->q:Landroid/animation/ValueAnimator;

    return-void

    :cond_4c
    iput v4, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    return-void
.end method
