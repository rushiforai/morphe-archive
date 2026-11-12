.class public final Lgg2;
.super Lhi7;
.source "SourceFile"


# static fields
.field public static final F:J

.field public static G:Landroid/graphics/Point;


# instance fields
.field public final A:Lt02;

.field public final B:Lbqj;

.field public final C:Lwl2;

.field public D:Lx79;

.field public E:Z

.field public final v:Lji;

.field public final w:Lsf2;

.field public final x:Lrf2;

.field public final y:Lz8b;

.field public final z:Lp12;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x96

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lgg2;->F:J

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->getLayoutDirectionFromLocale(Ljava/util/Locale;)I

    move-result v0

    const/4 v1, 0x1

    const v2, 0x7fffffff

    if-ne v0, v1, :cond_20

    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0, v2, v2}, Landroid/graphics/Point;-><init>(II)V

    goto :goto_26

    :cond_20
    new-instance v0, Landroid/graphics/Point;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    :goto_26
    sput-object v0, Lgg2;->G:Landroid/graphics/Point;

    return-void
.end method

.method public constructor <init>(Lzh7;Ltjg;Ldll;Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/ViewGroup;Lqim;Lorm;Lji;Lkze;Lsf2;Ligi;Lrf2;Lt02;)V
    .registers 30

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move-object/from16 v11, p10

    move-object/from16 v12, p12

    sget-object v1, Lyh7;->a:Lyh7;

    sget-object v8, Lgg2;->G:Landroid/graphics/Point;

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p9

    move-object/from16 v5, p11

    invoke-direct/range {v0 .. v8}, Lhi7;-><init>(Lyh7;Lzh7;Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/ViewGroup;Ligi;Lqim;Lkze;Landroid/graphics/Point;)V

    move-object/from16 v1, p8

    iput-object v1, v0, Lgg2;->v:Lji;

    iput-object v11, v0, Lgg2;->w:Lsf2;

    iput-object v12, v0, Lgg2;->x:Lrf2;

    iget-object v1, v11, Lsf2;->b:Landroid/widget/ImageView;

    new-instance v2, Lz61;

    invoke-direct {v2, v1}, Lz61;-><init>(Landroid/view/View;)V

    iget-object v2, v2, Lz61;->b:Ljava/lang/Object;

    check-cast v2, Lkze;

    new-instance v3, Lz8b;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    move-object/from16 v4, p7

    iput-object v4, v3, Lz8b;->a:Ljava/lang/Object;

    new-instance v4, Lt02;

    const/16 v5, 0xd

    invoke-direct {v4, v3, v5}, Lt02;-><init>(Ljava/lang/Object;B)V

    new-instance v6, Lpb;

    invoke-direct {v6, v4, v5}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v6}, Lekc;->k(Lf7f;)V

    iput-object v3, v0, Lgg2;->y:Lz8b;

    new-instance v3, Lp12;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v9, v3, Lp12;->a:Ljava/lang/Object;

    new-instance v4, Lkze;

    sget-object v5, Lvjd;->K:Lvjd;

    invoke-direct {v4, v5}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v4, v3, Lp12;->b:Ljava/lang/Object;

    new-instance v4, Lkze;

    const-wide/16 v5, 0x0

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-direct {v4, v5}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v4, v3, Lp12;->c:Ljava/lang/Object;

    new-instance v4, Lkze;

    invoke-direct {v4, v5}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v4, v3, Lp12;->d:Ljava/lang/Object;

    new-instance v4, Lkze;

    sget-object v5, Lzf2;->c:Lzf2;

    invoke-direct {v4, v5}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v4, v3, Lp12;->e:Ljava/lang/Object;

    new-instance v4, Lkze;

    new-instance v5, Lbg2;

    const/4 v6, 0x0

    invoke-direct {v5, v6, v6, v6}, Lbg2;-><init>(ZZZ)V

    invoke-direct {v4, v5}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v4, v3, Lp12;->f:Ljava/lang/Object;

    new-instance v4, Lkze;

    sget-object v5, Lag2;->a:Lag2;

    invoke-direct {v4, v5}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v4, v3, Lp12;->g:Ljava/lang/Object;

    new-instance v4, Lmig;

    new-instance v5, Lci8;

    invoke-direct {v5, v3}, Lci8;-><init>(Lp12;)V

    invoke-direct {v4, v5}, Lmig;-><init>(Llig;)V

    iput-object v4, v3, Lp12;->h:Ljava/lang/Object;

    new-instance v4, Ltu7;

    const/4 v5, 0x7

    invoke-direct {v4, v3, v5}, Ltu7;-><init>(Ljava/lang/Object;B)V

    new-instance v7, Lcl4;

    const/16 v8, 0x11

    invoke-direct {v7, v4, v8}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v7}, Lekc;->k(Lf7f;)V

    iput-object v3, v0, Lgg2;->z:Lp12;

    move-object/from16 v4, p13

    iput-object v4, v0, Lgg2;->A:Lt02;

    new-instance v4, Lbqj;

    invoke-direct {v4, v12, v1}, Lbqj;-><init>(Lrf2;Landroid/view/View;)V

    iput-object v4, v0, Lgg2;->B:Lbqj;

    new-instance v7, Lt59;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    new-instance v8, Lw05;

    invoke-direct {v8}, Lw05;-><init>()V

    iput-object v8, v7, Lt59;->c:Ljava/lang/Object;

    new-instance v8, Lrw0;

    invoke-direct {v8, v7, v5}, Lrw0;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Ld8e;

    const/16 v11, 0x16

    invoke-direct {v5, v7, v11}, Ld8e;-><init>(Ljava/lang/Object;B)V

    invoke-static {v10, v2, v8, v5}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    iget-object v5, v3, Lp12;->c:Ljava/lang/Object;

    check-cast v5, Lkze;

    new-instance v8, Lp4h;

    invoke-direct {v8, v7, v6}, Lp4h;-><init>(Lt59;B)V

    invoke-static {v5, v2, v8}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object v5, v3, Lp12;->d:Ljava/lang/Object;

    check-cast v5, Lkze;

    new-instance v8, Lp4h;

    const/4 v11, 0x1

    invoke-direct {v8, v7, v11}, Lp4h;-><init>(Lt59;B)V

    invoke-static {v5, v2, v8}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v5, Lowa;

    invoke-virtual/range {p5 .. p5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v5, v8, v2, v3, v10}, Lowa;-><init>(Landroid/content/Context;Lkze;Lp12;Ldll;)V

    new-instance v8, Lw04;

    invoke-virtual/range {p5 .. p5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v8, v13, v2, v3, v10}, Lw04;-><init>(Landroid/content/Context;Lkze;Lp12;Ldll;)V

    new-instance v10, Lwl2;

    new-instance v13, Ldg2;

    invoke-direct {v13, v0, v6}, Ldg2;-><init>(Lgg2;B)V

    invoke-direct {v10, v13}, Lwl2;-><init>(Ldg2;)V

    iput-object v10, v0, Lgg2;->C:Lwl2;

    iput-boolean v11, v0, Lgg2;->E:Z

    new-instance v10, Ltl2;

    new-instance v13, Ldg2;

    invoke-direct {v13, v0, v11}, Ldg2;-><init>(Lgg2;B)V

    invoke-direct {v10, v2, v3, v13}, Ltl2;-><init>(Lkze;Lp12;Ldg2;)V

    iget-object v10, v12, Lrf2;->h:Landroid/view/View;

    check-cast v10, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v13, Leg2;

    invoke-direct {v13, v0, v6}, Leg2;-><init>(Lgg2;B)V

    invoke-virtual {v10, v13}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v10, v12, Lrf2;->i:Ljava/lang/Object;

    check-cast v10, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v13, Leg2;

    invoke-direct {v13, v0, v11}, Leg2;-><init>(Lgg2;B)V

    invoke-virtual {v10, v13}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v10, v12, Lrf2;->g:Landroid/view/View;

    check-cast v10, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v13, Leg2;

    const/4 v14, 0x2

    invoke-direct {v13, v0, v14}, Leg2;-><init>(Lgg2;B)V

    invoke-virtual {v10, v13}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v10, v12, Lrf2;->f:Landroid/view/View;

    check-cast v10, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v13, Leg2;

    const/4 v15, 0x3

    invoke-direct {v13, v0, v15}, Leg2;-><init>(Lgg2;B)V

    invoke-virtual {v10, v13}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v10, v12, Lrf2;->c:Landroid/view/View;

    check-cast v10, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v12, Leg2;

    const/4 v13, 0x4

    invoke-direct {v12, v0, v13}, Leg2;-><init>(Lgg2;B)V

    invoke-virtual {v10, v12}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v10, Leg2;

    const/4 v12, 0x5

    invoke-direct {v10, v0, v12}, Leg2;-><init>(Lgg2;B)V

    invoke-virtual {v1, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v10, Landroid/graphics/drawable/LayerDrawable;

    iget-object v7, v7, Lt59;->c:Ljava/lang/Object;

    check-cast v7, Lw05;

    new-array v12, v15, [Landroid/graphics/drawable/Drawable;

    aput-object v7, v12, v6

    iget-object v7, v8, Lw04;->b:Lx05;

    aput-object v7, v12, v11

    iget-object v5, v5, Lowa;->d:Lo92;

    aput-object v5, v12, v14

    invoke-direct {v10, v12}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, v3, Lp12;->e:Ljava/lang/Object;

    check-cast v1, Lkze;

    new-instance v5, Lfg2;

    invoke-direct {v5, v0, v6}, Lfg2;-><init>(Lgg2;B)V

    invoke-static {v1, v2, v5}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object v1, v3, Lp12;->f:Ljava/lang/Object;

    check-cast v1, Lkze;

    new-instance v3, Lfg2;

    invoke-direct {v3, v0, v11}, Lfg2;-><init>(Lgg2;B)V

    invoke-static {v1, v2, v3}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v0, Ls14;

    iget-object v1, v4, Lbqj;->c:Lpde;

    invoke-direct {v0, v2, v9, v1}, Ls14;-><init>(Lkze;Ltjg;Lpde;)V

    return-void
.end method


# virtual methods
.method public final c(Lei7;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_21

    const/4 v1, 0x1

    if-eq v0, v1, :cond_10

    const/4 v1, 0x2

    if-eq v0, v1, :cond_21

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_10
    iget-object v0, p0, Lgg2;->y:Lz8b;

    iget-object v0, v0, Lz8b;->b:Ljava/lang/Object;

    check-cast v0, Lqb7;

    if-eqz v0, :cond_21

    iget-object v0, v0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    sget-object v1, Ld90;->d:Ld90;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_21
    iget-object v0, p0, Lhi7;->e:Ligi;

    iget-object v0, v0, Ligi;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Lhi7;->d:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object p0, p0, Lgg2;->A:Lt02;

    invoke-virtual {p0, p1}, Lt02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final d()V
    .registers 3

    new-instance v0, Lvk1;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Lvk1;-><init>(B)V

    invoke-virtual {p0, v0}, Lgg2;->h(Lkotlin/jvm/functions/Function0;)V

    iget-object p0, p0, Lgg2;->y:Lz8b;

    iget-object p0, p0, Lz8b;->b:Ljava/lang/Object;

    check-cast p0, Lqb7;

    if-eqz p0, :cond_1b

    iget-object p0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    sget-object v0, Ld90;->c:Ld90;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1b
    return-void
.end method

.method public final f()V
    .registers 2

    iget-object v0, p0, Lgg2;->B:Lbqj;

    invoke-virtual {v0}, Lbqj;->b()V

    iget-boolean v0, p0, Lgg2;->E:Z

    if-eqz v0, :cond_f

    const/4 v0, 0x0

    iput-boolean v0, p0, Lgg2;->E:Z

    invoke-virtual {p0}, Lgg2;->i()V

    :cond_f
    return-void
.end method

.method public final h(Lkotlin/jvm/functions/Function0;)V
    .registers 6

    iget-object v0, p0, Lgg2;->B:Lbqj;

    invoke-virtual {v0}, Lbqj;->a()Z

    move-result v1

    if-nez v1, :cond_c

    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    :cond_c
    iget-object p0, p0, Lgg2;->C:Lwl2;

    invoke-virtual {p0}, Lwl2;->a()V

    invoke-virtual {v0}, Lbqj;->a()Z

    move-result p0

    if-nez p0, :cond_1b

    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    :cond_1b
    iget-object p0, v0, Lbqj;->c:Lpde;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, v0, Lbqj;->e:Landroid/animation/ValueAnimator;

    if-eqz p0, :cond_29

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_29
    iget-object p0, v0, Lbqj;->a:Lrf2;

    iget-object p0, p0, Lrf2;->e:Landroid/view/View;

    check-cast p0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    const/4 v1, 0x0

    filled-new-array {p0, v1}, [I

    move-result-object p0

    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object p0

    sget-object v2, Llf1;->n:Lfci;

    invoke-virtual {p0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    sget-wide v2, Lbqj;->h:J

    invoke-static {v2, v3}, Lpn7;->f(J)J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v2, Lzpj;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Lzpj;-><init>(Lbqj;B)V

    invoke-virtual {p0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v2, Laqj;

    invoke-direct {v2, p1, v1}, Laqj;-><init>(Lkotlin/jvm/functions/Function0;B)V

    invoke-virtual {p0, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    iput-object p0, v0, Lbqj;->e:Landroid/animation/ValueAnimator;

    return-void
.end method

.method public final i()V
    .registers 12

    iget-object v0, p0, Lgg2;->B:Lbqj;

    invoke-virtual {v0}, Lbqj;->a()Z

    move-result v1

    iget-object v2, v0, Lbqj;->d:Landroid/util/Size;

    iget-object v3, v0, Lbqj;->a:Lrf2;

    if-nez v1, :cond_145

    iget-object v1, p0, Lgg2;->C:Lwl2;

    invoke-virtual {v1}, Lwl2;->a()V

    iget-object v1, p0, Lgg2;->w:Lsf2;

    iget-object v1, v1, Lsf2;->b:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    instance-of v4, v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_29

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const/4 v4, 0x5

    and-int/2addr v1, v4

    if-ne v1, v4, :cond_29

    move v1, v5

    goto :goto_2a

    :cond_29
    move v1, v6

    :goto_2a
    xor-int/lit8 v4, v1, 0x1

    invoke-virtual {v0}, Lbqj;->a()Z

    move-result v7

    if-nez v7, :cond_a1

    iget-object v7, v0, Lbqj;->c:Lpde;

    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v7, v8}, Lekc;->r(Ljava/lang/Object;)V

    iput-boolean v4, v0, Lbqj;->f:Z

    iget-object v4, v3, Lrf2;->f:Landroid/view/View;

    check-cast v4, Lcom/opera/android/custom_views/StylingImageView;

    const/16 v7, 0x8

    if-eqz v1, :cond_45

    move v8, v6

    goto :goto_46

    :cond_45
    move v8, v7

    :goto_46
    invoke-virtual {v4, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object v4, v3, Lrf2;->c:Landroid/view/View;

    check-cast v4, Lcom/opera/android/custom_views/StylingImageView;

    if-nez v1, :cond_51

    move v8, v6

    goto :goto_52

    :cond_51
    move v8, v7

    :goto_52
    invoke-virtual {v4, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object v4, v3, Lrf2;->k:Landroid/view/View;

    check-cast v4, Landroid/widget/Space;

    if-nez v1, :cond_5d

    move v8, v6

    goto :goto_5e

    :cond_5d
    move v8, v7

    :goto_5e
    invoke-virtual {v4, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object v4, v3, Lrf2;->j:Landroid/view/View;

    check-cast v4, Landroid/widget/Space;

    if-eqz v1, :cond_68

    move v7, v6

    :cond_68
    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v0, Lbqj;->e:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_72

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_72
    iget-object v1, v3, Lrf2;->e:Landroid/view/View;

    check-cast v1, Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v4

    filled-new-array {v1, v4}, [I

    move-result-object v1

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v1

    sget-object v4, Llf1;->n:Lfci;

    invoke-virtual {v1, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    sget-wide v7, Lbqj;->g:J

    invoke-static {v7, v8}, Lpn7;->f(J)J

    move-result-wide v7

    invoke-virtual {v1, v7, v8}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v4, Lzpj;

    invoke-direct {v4, v0, v6}, Lzpj;-><init>(Lbqj;B)V

    invoke-virtual {v1, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    iput-object v1, v0, Lbqj;->e:Landroid/animation/ValueAnimator;

    :cond_a1
    sget-object v1, Lbqj;->i:Lixh;

    iget-object v4, v0, Lbqj;->b:Landroid/view/View;

    iget-object v3, v3, Lrf2;->e:Landroid/view/View;

    check-cast v3, Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    instance-of v8, v7, Landroid/view/View;

    if-eqz v8, :cond_f2

    invoke-virtual {v3}, Landroid/view/View;->isLaidOut()Z

    move-result v3

    if-eqz v3, :cond_f2

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v3

    iget-boolean v0, v0, Lbqj;->f:Z

    if-eqz v0, :cond_df

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v0

    add-int/2addr v0, v4

    check-cast v7, Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v1, v3}, Ly7h;->k(Landroid/content/Context;)I

    move-result v1

    sub-int/2addr v2, v1

    if-le v0, v2, :cond_f2

    sub-int v6, v2, v0

    goto :goto_f2

    :cond_df
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v0

    sub-int/2addr v4, v0

    check-cast v7, Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Ly7h;->k(Landroid/content/Context;)I

    move-result v0

    if-ge v4, v0, :cond_f2

    sub-int v6, v0, v4

    :cond_f2
    :goto_f2
    if-eqz v6, :cond_145

    iget-object p0, p0, Lhi7;->i:Lni7;

    iget-object v0, p0, Lni7;->t:Landroid/view/VelocityTracker;

    iget-object v1, p0, Lni7;->x:Lji7;

    if-nez v0, :cond_145

    iget-object v0, v1, Lji7;->c:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_109

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-ne v0, v5, :cond_109

    iget-object v0, v1, Lji7;->b:Lmi7;

    goto :goto_10b

    :cond_109
    sget-object v0, Lmi7;->a:Lmi7;

    :goto_10b
    sget-object v2, Lmi7;->a:Lmi7;

    if-ne v0, v2, :cond_145

    iget-object v0, p0, Lni7;->n:Lii7;

    invoke-virtual {v0}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    float-to-int v0, v0

    add-int/2addr v0, v6

    invoke-virtual {p0, v0}, Lni7;->c(I)I

    move-result v0

    int-to-float v0, v0

    iget-object v2, p0, Lni7;->o:Lii7;

    invoke-virtual {v2}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p0, v2}, Lni7;->d(I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v0, v2}, Lji7;->c(FF)V

    iget-object v3, p0, Lni7;->x:Lji7;

    sget-object v4, Lmi7;->d:Lmi7;

    sget-wide v5, Lni7;->B:J

    const/4 v9, 0x0

    const/16 v10, 0x1c

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v3 .. v10}, Lji7;->b(Lji7;Lmi7;JLli7;Lwg5;Lkotlin/jvm/functions/Function0;I)V

    :cond_145
    return-void
.end method

.method public final j(Lphg;Lf90;)V
    .registers 11

    iget-object v0, p0, Lgg2;->y:Lz8b;

    iget-object v1, v0, Lz8b;->b:Ljava/lang/Object;

    check-cast v1, Lqb7;

    if-eqz v1, :cond_e

    iget-object v1, v1, Lqb7;->b:Ljava/lang/Object;

    check-cast v1, Lf90;

    if-eq p2, v1, :cond_28

    :cond_e
    invoke-virtual {v0}, Lz8b;->F()V

    new-instance v1, Lqb7;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p2, v1, Lqb7;->b:Ljava/lang/Object;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, v1, Lqb7;->a:Ljava/lang/Object;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, v1, Lqb7;->c:Ljava/lang/Object;

    iput-object v1, v0, Lz8b;->b:Ljava/lang/Object;

    :cond_28
    iget-object p2, p1, Lphg;->b:Lvjd;

    iget-object v0, p2, Lvjd;->I:Landroid/os/Bundle;

    iget-object v1, p2, Lvjd;->I:Landroid/os/Bundle;

    const-string v2, "com.opera.android.media.AI_POD_ID"

    const/4 v3, 0x0

    if-eqz v1, :cond_38

    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_39

    :cond_38
    move-object v1, v3

    :goto_39
    if-eqz v1, :cond_74

    iget-object v1, p0, Lgg2;->v:Lji;

    invoke-virtual {v1}, Lji;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Luqe;

    if-eqz v0, :cond_4a

    invoke-virtual {v0, v2, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_4b

    :cond_4a
    move-object v2, v3

    :goto_4b
    const-string v4, ""

    if-nez v2, :cond_50

    move-object v2, v4

    :cond_50
    if-eqz v0, :cond_59

    const-string v5, "com.opera.android.media.AI_POD_CATEGORY_ID"

    invoke-virtual {v0, v5, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_5a

    :cond_59
    move-object v5, v3

    :goto_5a
    if-nez v5, :cond_5d

    move-object v5, v4

    :cond_5d
    if-eqz v0, :cond_66

    const-string v6, "com.opera.android.media.AI_POD_REQUEST_ID"

    invoke-virtual {v0, v6, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_67

    :cond_66
    move-object v0, v3

    :goto_67
    if-eqz v0, :cond_6a

    move-object v4, v0

    :cond_6a
    new-instance v0, Lx79;

    iget-object v1, v1, Luqe;->h:Luy8;

    invoke-direct {v0, v1, v2, v5, v4}, Lx79;-><init>(Luy8;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lgg2;->D:Lx79;

    goto :goto_76

    :cond_74
    iput-object v3, p0, Lgg2;->D:Lx79;

    :goto_76
    iget-object p0, p0, Lgg2;->z:Lp12;

    iget-object p0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast p0, Ltjg;

    iget-object v0, p1, Lphg;->a:Legd;

    iget-object p1, p1, Lphg;->c:Landroid/graphics/Bitmap;

    iget-object v1, p0, Ltjg;->i:Lujc;

    iget-object v2, v1, Lgk9;->b:Lgig;

    invoke-interface {v2}, Lgig;->getShuffleModeEnabled()Z

    move-result v2

    const/4 v4, 0x1

    if-eqz v2, :cond_c2

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x0

    move v6, v5

    :goto_92
    invoke-virtual {v1}, Lgk9;->p()I

    move-result v7

    if-ge v6, v7, :cond_a2

    invoke-virtual {v1, v6}, Lgk9;->Q(I)Lqjd;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_92

    :cond_a2
    invoke-static {v1}, Lw7d;->C(Lgig;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v1}, Lgk9;->getShuffleModeEnabled()Z

    move-result v7

    if-eqz v7, :cond_c2

    new-instance v7, Levc;

    invoke-direct {v7, v2, v6}, Levc;-><init>(Ljava/util/List;Ljava/util/List;)V

    invoke-static {v7, v4}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object v2

    new-instance v6, Lqie;

    const/16 v7, 0x8

    invoke-direct {v6, p0, v7}, Lqie;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v6}, Lj87;->a(Lsic;)V

    invoke-virtual {v1, v5}, Lgk9;->setShuffleModeEnabled(Z)V

    :cond_c2
    new-instance v1, Lljg;

    invoke-direct {v1, p0, v4}, Lljg;-><init>(Ltjg;B)V

    iget-object v2, p0, Ltjg;->v:Ljava/util/ArrayList;

    new-instance v4, Lq2g;

    const/4 v5, 0x3

    invoke-direct {v4, p0, v1, v5}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Ltjg;->k:Lokg;

    new-instance v1, Lmkg;

    invoke-direct {v1, p2, v0, p1, v3}, Lmkg;-><init>(Lvjd;Legd;Landroid/graphics/Bitmap;Ljava/lang/String;)V

    filled-new-array {v1}, [Lmkg;

    move-result-object p1

    const/4 p2, -0x1

    invoke-virtual {p0, p2, p1}, Lokg;->a(I[Lmkg;)V

    return-void
.end method

.method public final k(Lzlg;)V
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lgg2;->D:Lx79;

    if-eqz v1, :cond_90

    sget-object v2, Lpn7;->b:Lon7;

    iget-object v0, v0, Lgg2;->z:Lp12;

    iget-object v2, v0, Lp12;->c:Ljava/lang/Object;

    check-cast v2, Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    sget-object v4, Lun7;->d:Lun7;

    invoke-static {v2, v3, v4}, Lcs5;->y0(JLun7;)J

    move-result-wide v2

    iget-object v0, v0, Lp12;->d:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    invoke-static {v5, v6, v4}, Lcs5;->y0(JLun7;)J

    move-result-wide v4

    iget-object v0, v1, Lx79;->a:Ljava/lang/Object;

    check-cast v0, Luy8;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    if-eqz v6, :cond_5d

    const/4 v7, 0x1

    if-eq v6, v7, :cond_5a

    const/4 v7, 0x2

    if-eq v6, v7, :cond_57

    const/4 v7, 0x3

    if-eq v6, v7, :cond_54

    const/4 v7, 0x4

    if-eq v6, v7, :cond_51

    const/4 v7, 0x5

    if-ne v6, v7, :cond_4d

    const-string v6, "audio_close"

    :goto_4b
    move-object v12, v6

    goto :goto_60

    :cond_4d
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_51
    const-string v6, "audio_speed"

    goto :goto_4b

    :cond_54
    const-string v6, "audio_previous"

    goto :goto_4b

    :cond_57
    const-string v6, "audio_next"

    goto :goto_4b

    :cond_5a
    const-string v6, "audio_play"

    goto :goto_4b

    :cond_5d
    const-string v6, "audio_pause"

    goto :goto_4b

    :goto_60
    invoke-static {v2, v3}, Lpn7;->f(J)J

    move-result-wide v8

    invoke-static {v4, v5}, Lpn7;->f(J)J

    move-result-wide v10

    iget-object v2, v1, Lx79;->e:Ljava/lang/Object;

    check-cast v2, Lkotlin/time/TimeMark;

    invoke-interface {v2}, Lkotlin/time/TimeMark;->a()J

    move-result-wide v2

    invoke-static {v2, v3}, Lpn7;->f(J)J

    move-result-wide v13

    iget-object v2, v1, Lx79;->b:Ljava/lang/Object;

    move-object v15, v2

    check-cast v15, Ljava/lang/String;

    iget-object v2, v1, Lx79;->c:Ljava/lang/Object;

    move-object/from16 v16, v2

    check-cast v16, Ljava/lang/String;

    iget-object v1, v1, Lx79;->d:Ljava/lang/Object;

    move-object/from16 v17, v1

    check-cast v17, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Lay8;

    invoke-direct/range {v7 .. v17}, Lay8;-><init>(JJLjava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v7}, Luy8;->c(Ldy8;)V

    :cond_90
    return-void
.end method
