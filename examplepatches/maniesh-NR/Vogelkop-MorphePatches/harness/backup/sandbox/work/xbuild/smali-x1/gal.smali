.class public final Lgal;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final A:Ldxh;

.field public static final B:Ldxh;

.field public static final C:Ldxh;

.field public static final D:Ldxh;

.field public static final E:Ldxh;

.field public static final F:Ldxh;

.field public static final G:Ldxh;

.field public static final H:Ldxh;

.field public static final I:Ldxh;

.field public static final J:Ldxh;

.field public static final v:Lixh;

.field public static final w:Lixh;

.field public static final x:Ldxh;

.field public static final y:Ldxh;

.field public static final z:Ldxh;


# instance fields
.field public final a:Lpde;

.field public final b:Li03;

.field public final c:Lebl;

.field public final d:Lj1k;

.field public e:Lp6l;

.field public f:F

.field public final g:Lpde;

.field public h:Ljava/lang/Float;

.field public final i:Lpde;

.field public final j:Lpde;

.field public k:Landroid/animation/ValueAnimator;

.field public l:Landroid/animation/ValueAnimator;

.field public final m:Lfal;

.field public final n:Ldal;

.field public o:Z

.field public final p:Ljava/util/List;

.field public q:Lcal;

.field public r:Lcal;

.field public final s:Lm2a;

.field public final t:Lm2a;

.field public final u:Lk26;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lixh;

    const/high16 v1, 0x42800000    # 64.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lgal;->v:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x42c00000    # 96.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lgal;->w:Lixh;

    new-instance v0, Ldxh;

    const v1, 0x7f0402ed

    invoke-direct {v0, v1}, Ldxh;-><init>(I)V

    sput-object v0, Lgal;->x:Ldxh;

    new-instance v0, Ldxh;

    const v1, 0x7f040303

    invoke-direct {v0, v1}, Ldxh;-><init>(I)V

    sput-object v0, Lgal;->y:Ldxh;

    new-instance v0, Ldxh;

    const v1, 0x7f040307

    invoke-direct {v0, v1}, Ldxh;-><init>(I)V

    sput-object v0, Lgal;->z:Ldxh;

    new-instance v0, Ldxh;

    const v1, 0x7f040304

    invoke-direct {v0, v1}, Ldxh;-><init>(I)V

    sput-object v0, Lgal;->A:Ldxh;

    new-instance v0, Ldxh;

    const v1, 0x7f040305

    invoke-direct {v0, v1}, Ldxh;-><init>(I)V

    sput-object v0, Lgal;->B:Ldxh;

    new-instance v0, Ldxh;

    const v1, 0x7f040306

    invoke-direct {v0, v1}, Ldxh;-><init>(I)V

    sput-object v0, Lgal;->C:Ldxh;

    new-instance v0, Ldxh;

    const v1, 0x7f040308

    invoke-direct {v0, v1}, Ldxh;-><init>(I)V

    sput-object v0, Lgal;->D:Ldxh;

    new-instance v0, Ldxh;

    const v1, 0x7f0402d7

    invoke-direct {v0, v1}, Ldxh;-><init>(I)V

    sput-object v0, Lgal;->E:Ldxh;

    new-instance v0, Ldxh;

    const v2, 0x7f040309

    invoke-direct {v0, v2}, Ldxh;-><init>(I)V

    sput-object v0, Lgal;->F:Ldxh;

    new-instance v0, Ldxh;

    invoke-direct {v0, v1}, Ldxh;-><init>(I)V

    sput-object v0, Lgal;->G:Ldxh;

    new-instance v0, Ldxh;

    const v2, 0x7f0402c8

    invoke-direct {v0, v2}, Ldxh;-><init>(I)V

    sput-object v0, Lgal;->H:Ldxh;

    new-instance v0, Ldxh;

    invoke-direct {v0, v2}, Ldxh;-><init>(I)V

    sput-object v0, Lgal;->I:Ldxh;

    new-instance v0, Ldxh;

    invoke-direct {v0, v1}, Ldxh;-><init>(I)V

    sput-object v0, Lgal;->J:Ldxh;

    return-void
.end method

.method public constructor <init>(Lpde;Li03;Lebl;Lj1k;Lp6l;)V
    .registers 11

    iget-object v0, p3, Lebl;->A:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget-object v1, p3, Lebl;->b:Lcom/opera/android/custom_views/EqualWidthLinearLayout;

    iget-object v2, p3, Lebl;->a:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgal;->a:Lpde;

    iput-object p2, p0, Lgal;->b:Li03;

    iput-object p3, p0, Lgal;->c:Lebl;

    iput-object p4, p0, Lgal;->d:Lj1k;

    iput-object p5, p0, Lgal;->e:Lp6l;

    sget-object p1, Lp6l;->b:Lp6l;

    const/4 p4, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    if-ne p5, p1, :cond_1c

    move p1, v3

    goto :goto_1d

    :cond_1c
    move p1, p4

    :goto_1d
    iput p1, p0, Lgal;->f:F

    new-instance p5, Lpde;

    const/high16 v4, 0x3f000000    # 0.5f

    cmpl-float p1, p1, v4

    if-lez p1, :cond_28

    move p4, v3

    :cond_28
    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-direct {p5, p1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p5, p0, Lgal;->g:Lpde;

    new-instance p1, Lpde;

    sget-object p4, Log;->a:Log;

    invoke-direct {p1, p4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lgal;->i:Lpde;

    new-instance p1, Lpde;

    invoke-direct {p1, p4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lgal;->j:Lpde;

    new-instance p1, Lfal;

    invoke-direct {p1, p0, v1, v0}, Lfal;-><init>(Lgal;Lcom/opera/android/custom_views/EqualWidthLinearLayout;Landroid/view/View;)V

    iput-object p1, p0, Lgal;->m:Lfal;

    new-instance p1, Ldal;

    invoke-direct {p1, p0}, Ldal;-><init>(Lgal;)V

    const/4 p4, 0x1

    invoke-virtual {v2, p4}, Landroid/view/View;->setNestedScrollingEnabled(Z)V

    iput-object p1, v2, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->f:Ldal;

    iput-object p1, p0, Lgal;->n:Ldal;

    iget-object p1, p3, Lebl;->C:Landroid/widget/RelativeLayout;

    iget-object p5, p3, Lebl;->r:Landroid/widget/RelativeLayout;

    iget-object p3, p3, Lebl;->q:Landroid/widget/RelativeLayout;

    const/4 v3, 0x5

    new-array v3, v3, [Landroid/view/View;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    aput-object p5, v3, p4

    const/4 p1, 0x2

    aput-object p3, v3, p1

    const/4 p1, 0x3

    aput-object v1, v3, p1

    const/4 p1, 0x4

    aput-object v0, v3, p1

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p3

    iput-object p3, p0, Lgal;->p:Ljava/util/List;

    new-instance p3, Lcal;

    const/high16 p4, -0x1000000

    invoke-direct {p3, p4, p4}, Lcal;-><init>(II)V

    iput-object p3, p0, Lgal;->q:Lcal;

    new-instance p3, Lcal;

    invoke-direct {p3, p4, p4}, Lcal;-><init>(II)V

    iput-object p3, p0, Lgal;->r:Lcal;

    new-instance p3, Lm2a;

    invoke-direct {p3}, Lm2a;-><init>()V

    iput-object p3, p0, Lgal;->s:Lm2a;

    new-instance p4, Lm2a;

    invoke-direct {p4}, Lm2a;-><init>()V

    iput-object p4, p0, Lgal;->t:Lm2a;

    new-instance p5, Lk26;

    invoke-direct {p5, p3, p4}, Lk26;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p2, p5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iput-object p5, p0, Lgal;->u:Lk26;

    new-instance p2, Lsvk;

    invoke-direct {p2, p0, p1}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p0}, Lgal;->c()V

    const-wide/16 p1, 0x0

    invoke-virtual {p0, p1, p2}, Lgal;->b(J)V

    invoke-virtual {p0, p1, p2}, Lgal;->a(J)V

    return-void
.end method


# virtual methods
.method public final a(J)V
    .registers 7

    iget-object v0, p0, Lgal;->l:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_7
    iget-object v0, p0, Lgal;->g:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    iget v1, p0, Lgal;->f:F

    const/high16 v2, 0x3f000000    # 0.5f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_1e

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_1f

    :cond_1e
    const/4 v1, 0x0

    :goto_1f
    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput v0, v2, v3

    const/4 v0, 0x1

    aput v1, v2, v0

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    sget-object p1, Llf1;->f:Landroid/view/animation/LinearInterpolator;

    invoke-virtual {v1, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance p1, Lbal;

    invoke-direct {p1, p0, v0}, Lbal;-><init>(Lgal;B)V

    invoke-virtual {v1, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    iput-object v1, p0, Lgal;->l:Landroid/animation/ValueAnimator;

    return-void
.end method

.method public final b(J)V
    .registers 7

    iget-object v0, p0, Lgal;->m:Lfal;

    iget-object v0, v0, Lfal;->c:Lqvk;

    iget v0, v0, Lqvk;->d:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_a

    return-void

    :cond_a
    iget-object v0, p0, Lgal;->n:Ldal;

    iget-boolean v0, v0, Ldal;->a:Z

    if-eqz v0, :cond_11

    return-void

    :cond_11
    iget-object v0, p0, Lgal;->k:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_18
    iget v0, p0, Lgal;->f:F

    iget-object v1, p0, Lgal;->e:Lp6l;

    sget-object v2, Lp6l;->b:Lp6l;

    if-ne v1, v2, :cond_23

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_24

    :cond_23
    const/4 v1, 0x0

    :goto_24
    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput v0, v2, v3

    const/4 v0, 0x1

    aput v1, v2, v0

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    sget-object p1, Llf1;->n:Lfci;

    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance p1, Lbal;

    invoke-direct {p1, p0, v3}, Lbal;-><init>(Lgal;B)V

    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    iput-object v0, p0, Lgal;->k:Landroid/animation/ValueAnimator;

    return-void
.end method

.method public final c()V
    .registers 22

    move-object/from16 v0, p0

    iget-object v1, v0, Lgal;->c:Lebl;

    iget-object v2, v1, Lebl;->j:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v1, v1, Lebl;->g:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v3, Lgal;->y:Ldxh;

    invoke-virtual {v3, v2}, Lcxh;->a(Landroid/content/Context;)I

    move-result v4

    sget-object v10, Lgal;->z:Ldxh;

    invoke-virtual {v10, v2}, Lcxh;->a(Landroid/content/Context;)I

    move-result v5

    sget-object v11, Lgal;->A:Ldxh;

    invoke-virtual {v11, v2}, Lcxh;->a(Landroid/content/Context;)I

    move-result v6

    sget-object v12, Lgal;->B:Ldxh;

    invoke-virtual {v12, v2}, Lcxh;->a(Landroid/content/Context;)I

    move-result v7

    sget-object v13, Lgal;->C:Ldxh;

    invoke-virtual {v13, v2}, Lcxh;->a(Landroid/content/Context;)I

    move-result v8

    sget-object v14, Lgal;->D:Ldxh;

    invoke-virtual {v14, v2}, Lcxh;->a(Landroid/content/Context;)I

    move-result v9

    invoke-static/range {v4 .. v9}, Lt0h;->j(IIIIII)Ljava/util/List;

    move-result-object v2

    iget-object v4, v0, Lgal;->s:Lm2a;

    iget-object v5, v4, Lm2a;->a:Ljava/util/List;

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_47

    iput-object v2, v4, Lm2a;->a:Ljava/util/List;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_47
    new-instance v4, Lcal;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ll2a;

    iget v5, v5, Ll2a;->a:I

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->Q(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ll2a;

    iget v2, v2, Ll2a;->a:I

    invoke-direct {v4, v5, v2}, Lcal;-><init>(II)V

    iput-object v4, v0, Lgal;->q:Lcal;

    invoke-virtual {v3, v1}, Lcxh;->a(Landroid/content/Context;)I

    move-result v15

    invoke-virtual {v10, v1}, Lcxh;->a(Landroid/content/Context;)I

    move-result v16

    invoke-virtual {v11, v1}, Lcxh;->a(Landroid/content/Context;)I

    move-result v17

    invoke-virtual {v12, v1}, Lcxh;->a(Landroid/content/Context;)I

    move-result v18

    invoke-virtual {v13, v1}, Lcxh;->a(Landroid/content/Context;)I

    move-result v19

    invoke-virtual {v14, v1}, Lcxh;->a(Landroid/content/Context;)I

    move-result v20

    invoke-static/range {v15 .. v20}, Lt0h;->j(IIIIII)Ljava/util/List;

    move-result-object v1

    iget-object v2, v0, Lgal;->t:Lm2a;

    iget-object v3, v2, Lm2a;->a:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_89

    iput-object v1, v2, Lm2a;->a:Ljava/util/List;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_89
    new-instance v2, Lcal;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ll2a;

    iget v3, v3, Ll2a;->a:I

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->Q(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ll2a;

    iget v1, v1, Ll2a;->a:I

    invoke-direct {v2, v3, v1}, Lcal;-><init>(II)V

    iput-object v2, v0, Lgal;->r:Lcal;

    return-void
.end method

.method public final d()V
    .registers 11

    iget-object v0, p0, Lgal;->c:Lebl;

    iget-object v1, v0, Lebl;->x:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v2, v0, Lebl;->y:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v3, v0, Lebl;->j:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, v0, Lebl;->g:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lgal;->g:Lpde;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->floatValue()F

    move-result v6

    iget-object v7, p0, Lgal;->u:Lk26;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/high16 v8, 0x437f0000    # 255.0f

    mul-float/2addr v6, v8

    invoke-static {v6}, Lzed;->b(F)I

    move-result v6

    iget v8, v7, Lk26;->c:I

    if-eq v8, v6, :cond_38

    iput v6, v7, Lk26;->c:I

    iget-object v8, v7, Lk26;->b:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v8, v6}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_38
    iget-object v6, p0, Lgal;->q:Lcal;

    iget v6, v6, Lcal;->a:I

    iget-object v7, p0, Lgal;->r:Lcal;

    iget v7, v7, Lcal;->a:I

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->floatValue()F

    move-result v8

    invoke-static {v8, v6, v7}, Lp37;->R(FII)I

    move-result v6

    iget-object v7, p0, Lgal;->b:Li03;

    iget v8, v7, Li03;->e:I

    if-eq v6, v8, :cond_60

    iput v6, v7, Li03;->e:I

    invoke-virtual {v7}, Landroid/view/View;->invalidate()V

    iget-object v6, v7, Li03;->b:Lc1f;

    if-eqz v6, :cond_60

    invoke-virtual {v6}, Lc1f;->e()V

    :cond_60
    iget-object v6, p0, Lgal;->q:Lcal;

    iget v6, v6, Lcal;->b:I

    iget-object v8, p0, Lgal;->r:Lcal;

    iget v8, v8, Lcal;->b:I

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->floatValue()F

    move-result v9

    invoke-static {v9, v6, v8}, Lp37;->R(FII)I

    move-result v6

    iget v8, v7, Li03;->f:I

    if-eq v6, v8, :cond_86

    iput v6, v7, Li03;->f:I

    invoke-virtual {v7}, Landroid/view/View;->invalidate()V

    iget-object v6, v7, Li03;->b:Lc1f;

    if-eqz v6, :cond_86

    invoke-virtual {v6}, Lc1f;->e()V

    :cond_86
    sget-object v6, Lgal;->E:Ldxh;

    invoke-virtual {v6, v3}, Lcxh;->a(Landroid/content/Context;)I

    move-result v7

    invoke-virtual {v6, v4}, Lcxh;->a(Landroid/content/Context;)I

    move-result v6

    iget-object v8, v0, Lebl;->z:Lcom/opera/android/tabui2/TabGalleryButtonContainer;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->floatValue()F

    move-result v9

    invoke-static {v9, v7, v6}, Lp37;->R(FII)I

    move-result v6

    iget-object v7, v8, Lcom/opera/android/tabui2/TabGalleryButtonContainer;->g:Landroid/graphics/Paint;

    invoke-virtual {v7, v6}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v8}, Landroid/view/View;->invalidate()V

    iget-object v6, v0, Lebl;->m:Lcom/opera/android/custom_views/StylingImageButton;

    sget-object v7, Lgal;->F:Ldxh;

    invoke-virtual {v7, v3}, Lcxh;->a(Landroid/content/Context;)I

    move-result v8

    invoke-virtual {v7, v4}, Lcxh;->a(Landroid/content/Context;)I

    move-result v7

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->floatValue()F

    move-result v9

    invoke-static {v9, v8, v7}, Lp37;->R(FII)I

    move-result v7

    invoke-static {v7}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    sget-object v6, Lgal;->G:Ldxh;

    invoke-virtual {v6, v3}, Lcxh;->a(Landroid/content/Context;)I

    move-result v6

    sget-object v7, Lgal;->H:Ldxh;

    invoke-virtual {v7, v4}, Lcxh;->a(Landroid/content/Context;)I

    move-result v7

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->floatValue()F

    move-result v8

    invoke-static {v8, v6, v7}, Lp37;->R(FII)I

    move-result v6

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextColor(I)V

    sget-object v6, Lgal;->I:Ldxh;

    invoke-virtual {v6, v3}, Lcxh;->a(Landroid/content/Context;)I

    move-result v6

    sget-object v7, Lgal;->J:Ldxh;

    invoke-virtual {v7, v4}, Lcxh;->a(Landroid/content/Context;)I

    move-result v7

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->floatValue()F

    move-result v8

    invoke-static {v8, v6, v7}, Lp37;->R(FII)I

    move-result v6

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setTextColor(I)V

    sget-object v6, Lgal;->x:Ldxh;

    invoke-virtual {v6, v3}, Lcxh;->a(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v6, v4}, Lcxh;->a(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->floatValue()F

    move-result v6

    invoke-static {v6, v3, v4}, Lp37;->R(FII)I

    move-result v3

    iget-object v0, v0, Lebl;->b:Lcom/opera/android/custom_views/EqualWidthLinearLayout;

    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    const/high16 v3, 0x3f000000    # 0.5f

    cmpl-float v0, v0, v3

    const/4 v4, 0x0

    const/4 v6, 0x1

    if-lez v0, :cond_138

    move v0, v6

    goto :goto_139

    :cond_138
    move v0, v4

    :goto_139
    iget-boolean v7, p0, Lgal;->o:Z

    if-eq v0, v7, :cond_160

    iput-boolean v0, p0, Lgal;->o:Z

    iget-object p0, p0, Lgal;->p:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_147
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_160

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    if-eqz v0, :cond_159

    const v8, 0x7f1503a3

    goto :goto_15c

    :cond_159
    const v8, 0x7f1503a4

    :goto_15c
    invoke-static {v8, v7}, Lu8n;->d(ILandroid/view/View;)V

    goto :goto_147

    :cond_160
    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    move-result p0

    cmpl-float p0, p0, v3

    if-lez p0, :cond_16f

    move v4, v6

    :cond_16f
    xor-int/lit8 p0, v4, 0x1

    invoke-virtual {v2, p0}, Landroid/view/View;->setSelected(Z)V

    invoke-virtual {v1, v4}, Landroid/view/View;->setSelected(Z)V

    return-void
.end method

.method public final e()V
    .registers 12

    iget-object v0, p0, Lgal;->c:Lebl;

    iget-object v1, v0, Lebl;->l:Landroid/widget/FrameLayout;

    iget-object v2, v0, Lebl;->k:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lgal;->a:Lpde;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Lng;->a:Lng;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    iget-object v5, p0, Lgal;->m:Lfal;

    iget-object v5, v5, Lfal;->c:Lqvk;

    iget v5, v5, Lqvk;->d:I

    const/4 v6, -0x1

    const/4 v7, 0x0

    if-ne v5, v6, :cond_22

    iget-object v5, p0, Lgal;->n:Ldal;

    iget-boolean v5, v5, Ldal;->a:Z

    if-eqz v5, :cond_24

    :cond_22
    const/4 v5, 0x1

    goto :goto_25

    :cond_24
    move v5, v7

    :goto_25
    sget-object v6, Log;->a:Log;

    const/high16 v8, 0x3f800000    # 1.0f

    if-eqz v3, :cond_35

    iget v9, p0, Lgal;->f:F

    cmpg-float v9, v9, v8

    if-ltz v9, :cond_33

    if-eqz v5, :cond_35

    :cond_33
    move-object v9, v4

    goto :goto_36

    :cond_35
    move-object v9, v6

    :goto_36
    iget-object v10, p0, Lgal;->i:Lpde;

    invoke-static {v10, v9}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    const/4 v9, 0x0

    if-eqz v3, :cond_47

    iget v3, p0, Lgal;->f:F

    cmpl-float v3, v3, v9

    if-gtz v3, :cond_46

    if-eqz v5, :cond_47

    :cond_46
    move-object v6, v4

    :cond_47
    iget-object v3, p0, Lgal;->j:Lpde;

    invoke-static {v3, v6}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    invoke-virtual {v10}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    const/16 v6, 0x8

    if-eqz v5, :cond_5a

    move v5, v7

    goto :goto_5b

    :cond_5a
    move v5, v6

    :goto_5b
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_69

    move v7, v6

    :cond_69
    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    iget v3, p0, Lgal;->f:F

    sub-float v3, v8, v3

    const/high16 v4, 0x40000000    # 2.0f

    mul-float/2addr v3, v4

    sub-float/2addr v3, v8

    invoke-static {v3, v9, v8}, Ldjh;->b(FFF)F

    move-result v3

    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    iget v3, p0, Lgal;->f:F

    mul-float/2addr v3, v4

    sub-float/2addr v3, v8

    invoke-static {v3, v9, v8}, Ldjh;->b(FFF)F

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    iget-object v3, v0, Lebl;->a:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lgal;->v:Lixh;

    invoke-virtual {v4, v3}, Ly7h;->l(Landroid/content/Context;)F

    move-result v3

    invoke-virtual {p0}, Lgal;->f()Z

    move-result v4

    if-eqz v4, :cond_a7

    iget v4, p0, Lgal;->f:F

    mul-float/2addr v4, v3

    invoke-virtual {v1, v4}, Landroid/view/View;->setTranslationX(F)V

    neg-float v1, v3

    iget v4, p0, Lgal;->f:F

    mul-float/2addr v3, v4

    add-float/2addr v3, v1

    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationX(F)V

    goto :goto_b5

    :cond_a7
    neg-float v4, v3

    iget v5, p0, Lgal;->f:F

    mul-float/2addr v4, v5

    invoke-virtual {v1, v4}, Landroid/view/View;->setTranslationX(F)V

    iget v1, p0, Lgal;->f:F

    mul-float/2addr v1, v3

    sub-float/2addr v3, v1

    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationX(F)V

    :goto_b5
    iget-object v0, v0, Lebl;->z:Lcom/opera/android/tabui2/TabGalleryButtonContainer;

    iget v1, p0, Lgal;->f:F

    iget v2, v0, Lcom/opera/android/tabui2/TabGalleryButtonContainer;->f:F

    cmpl-float v2, v1, v2

    if-eqz v2, :cond_c4

    iput v1, v0, Lcom/opera/android/tabui2/TabGalleryButtonContainer;->f:F

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    :cond_c4
    iget v0, p0, Lgal;->f:F

    const/high16 v1, 0x3f000000    # 0.5f

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_cd

    move v8, v9

    :cond_cd
    iget-object v0, p0, Lgal;->h:Ljava/lang/Float;

    if-eqz v0, :cond_da

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    cmpl-float v0, v8, v0

    if-nez v0, :cond_da

    return-void

    :cond_da
    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lgal;->h:Ljava/lang/Float;

    const-wide/16 v0, 0x64

    invoke-virtual {p0, v0, v1}, Lgal;->a(J)V

    return-void
.end method

.method public final f()Z
    .registers 2

    iget-object p0, p0, Lgal;->c:Lebl;

    iget-object p0, p0, Lebl;->a:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_c

    return v0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public final g(Lp6l;)V
    .registers 4

    iget-object v0, p0, Lgal;->e:Lp6l;

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iput-object p1, p0, Lgal;->e:Lp6l;

    const-wide/16 v0, 0xc8

    invoke-virtual {p0, v0, v1}, Lgal;->b(J)V

    iget-object p0, p0, Lgal;->d:Lj1k;

    invoke-virtual {p0}, Lj1k;->invoke()Ljava/lang/Object;

    return-void
.end method
