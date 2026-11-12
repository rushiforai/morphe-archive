.class public final Ld48;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final l:J

.field public static final m:J

.field public static final n:J

.field public static final o:J

.field public static final p:Lfci;

.field public static final q:J


# instance fields
.field public final a:Lb2l;

.field public final b:Landroid/view/ViewGroup;

.field public final c:Landroid/view/ViewGroup;

.field public final d:Landroid/view/View;

.field public final e:Landroidx/recyclerview/widget/RecyclerView;

.field public final f:Landroidx/recyclerview/widget/RecyclerView;

.field public final g:Lz5l;

.field public final h:Lf9l;

.field public final i:Lj1k;

.field public final j:Lc1f;

.field public final k:J


# direct methods
.method static constructor <clinit>()V
    .registers 3

    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->d:Lun7;

    const/16 v1, 0x64

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    sput-wide v1, Ld48;->l:J

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    sput-wide v1, Ld48;->m:J

    const/16 v1, 0x14

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    sput-wide v1, Ld48;->n:J

    const/16 v1, 0x190

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    sput-wide v1, Ld48;->o:J

    new-instance v1, Lfci;

    invoke-direct {v1}, Lfci;-><init>()V

    sput-object v1, Ld48;->p:Lfci;

    const/16 v1, 0x96

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Ld48;->q:J

    return-void
.end method

.method public constructor <init>(Lb2l;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView;Lz5l;Lf9l;Lj1k;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld48;->a:Lb2l;

    iput-object p2, p0, Ld48;->b:Landroid/view/ViewGroup;

    iput-object p3, p0, Ld48;->c:Landroid/view/ViewGroup;

    iput-object p4, p0, Ld48;->d:Landroid/view/View;

    iput-object p5, p0, Ld48;->e:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p6, p0, Ld48;->f:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p7, p0, Ld48;->g:Lz5l;

    iput-object p8, p0, Ld48;->h:Lf9l;

    iput-object p9, p0, Ld48;->i:Lj1k;

    invoke-static {p3}, Lc1f;->c(Landroid/view/View;)Lc1f;

    move-result-object p1

    iput-object p1, p0, Ld48;->j:Lc1f;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Ld48;->k:J

    invoke-virtual {p0}, Ld48;->b()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 7

    iget-object v0, p0, Ld48;->c:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-wide v1, Ld48;->l:J

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v4, Lnl2;

    const/4 v5, 0x6

    invoke-direct {v4, p0, v5}, Lnl2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v4, La48;

    const/4 v5, 0x1

    invoke-direct {v4, p0, v5}, La48;-><init>(Ld48;B)V

    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->withStartAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v4, La48;

    const/4 v5, 0x2

    invoke-direct {v4, p0, v5}, La48;-><init>(Ld48;B)V

    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    const/4 v0, 0x0

    iget-object p0, p0, Ld48;->d:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    const v0, 0x3f333333    # 0.7f

    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    sget-object v0, Llf1;->d:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    sget-wide v0, Ld48;->o:J

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v3}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v3}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final b()V
    .registers 24

    move-object/from16 v1, p0

    iget-object v0, v1, Ld48;->c:Landroid/view/ViewGroup;

    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Landroid/view/View;->setAlpha(F)V

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, v1, Ld48;->k:J

    const-wide/16 v7, 0xc8

    add-long/2addr v4, v7

    cmp-long v0, v2, v4

    if-lez v0, :cond_19

    invoke-virtual {v1}, Ld48;->a()V

    return-void

    :cond_19
    iget-object v0, v1, Ld48;->g:Lz5l;

    iget-object v2, v1, Ld48;->a:Lb2l;

    invoke-virtual {v0, v2}, Lz5l;->d(Lb2l;)Lzwg;

    move-result-object v0

    sget-object v2, Lz2l;->a:Lz2l;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_35

    new-instance v0, La48;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, La48;-><init>(Ld48;B)V

    iget-object v1, v1, Ld48;->b:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void

    :cond_35
    sget-object v2, Ly2l;->a:Ly2l;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_41

    invoke-virtual {v1}, Ld48;->a()V

    return-void

    :cond_41
    instance-of v2, v0, La3l;

    if-eqz v2, :cond_1bd

    invoke-virtual {v1}, Ld48;->a()V

    iget-object v2, v1, Ld48;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2, v6}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-virtual {v2, v7}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    sget-wide v8, Ld48;->l:J

    invoke-static {v8, v9}, Lpn7;->f(J)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    sget-wide v3, Ld48;->q:J

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    check-cast v0, La3l;

    iget-object v0, v0, La3l;->d:Landroid/view/View;

    iget-object v10, v1, Ld48;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v10}, Landroid/view/View;->invalidate()V

    invoke-static {v10}, Lq9n;->t(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v11

    invoke-static {v0}, Lq9n;->t(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v12

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const/high16 v3, 0x43480000    # 200.0f

    invoke-static {v2, v3}, Lz7h;->i(Landroid/content/Context;F)F

    move-result v13

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v2, 0x42000000    # 32.0f

    invoke-static {v0, v2}, Lz7h;->i(Landroid/content/Context;F)F

    move-result v14

    new-instance v0, Lg6n;

    invoke-direct {v0, v10}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v0}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_9c
    move-object v0, v15

    check-cast v0, Lh6n;

    invoke-virtual {v0}, Lh6n;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1bc

    invoke-virtual {v0}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroid/view/View;

    invoke-virtual {v10, v2}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v0

    iget v3, v11, Landroid/graphics/Rect;->left:I

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v4

    add-int/2addr v4, v3

    int-to-float v3, v4

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    add-float/2addr v4, v3

    invoke-virtual {v12}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v3

    sub-float/2addr v4, v3

    iget v3, v11, Landroid/graphics/Rect;->top:I

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v16

    add-int v3, v16, v3

    int-to-float v3, v3

    move/from16 v16, v5

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v5

    int-to-float v5, v5

    div-float v5, v5, v16

    add-float/2addr v5, v3

    invoke-virtual {v12}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v3

    sub-float/2addr v5, v3

    mul-float v3, v4, v4

    mul-float v17, v5, v5

    add-float v3, v17, v3

    move-wide/from16 v18, v8

    float-to-double v7, v3

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    double-to-float v3, v7

    div-float v7, v3, v13

    cmpl-float v8, v3, v6

    if-lez v8, :cond_fb

    instance-of v9, v0, Lkj8;

    if-nez v9, :cond_fb

    mul-float v9, v14, v4

    div-float/2addr v9, v3

    mul-float/2addr v9, v7

    goto :goto_fc

    :cond_fb
    move v9, v6

    :goto_fc
    if-lez v8, :cond_107

    instance-of v0, v0, Lkj8;

    if-nez v0, :cond_107

    mul-float v0, v14, v5

    div-float/2addr v0, v3

    mul-float/2addr v0, v7

    goto :goto_108

    :cond_107
    move v0, v6

    :goto_108
    invoke-static {v4}, Lzed;->b(F)I

    move-result v3

    if-nez v3, :cond_143

    invoke-static {v5}, Lzed;->b(F)I

    move-result v3

    if-nez v3, :cond_143

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float v3, v3, v16

    invoke-virtual {v11}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v4

    iget v5, v12, Landroid/graphics/Rect;->left:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    const v5, 0x3e4ccccd    # 0.2f

    invoke-static {v3, v4, v5}, Lrm5;->G(FFF)F

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float v4, v4, v16

    invoke-virtual {v11}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v7

    iget v8, v12, Landroid/graphics/Rect;->top:I

    int-to-float v8, v8

    sub-float/2addr v7, v8

    invoke-static {v4, v7, v5}, Lrm5;->G(FFF)F

    move-result v4

    const-wide/16 v7, 0x0

    const v5, 0x3f99999a    # 1.2f

    goto :goto_16c

    :cond_143
    sget-wide v3, Ld48;->m:J

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v3

    sget-wide v20, Ld48;->n:J

    move v5, v7

    invoke-static/range {v20 .. v21}, Lpn7;->f(J)J

    move-result-wide v6

    long-to-float v6, v6

    mul-float/2addr v6, v5

    invoke-static {v6}, Lzed;->b(F)I

    move-result v5

    int-to-long v5, v5

    add-long/2addr v3, v5

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v5

    int-to-float v5, v5

    div-float v5, v5, v16

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    div-float v6, v6, v16

    move-wide v7, v3

    move v3, v5

    move v4, v6

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    :goto_16c
    invoke-virtual {v2, v6}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v2, v9}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {v2, v0}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v2, v5}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {v2, v5}, Landroid/view/View;->setScaleY(F)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setPivotX(F)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setPivotY(F)V

    sget-object v3, Lx46;->b:Lx46;

    invoke-static {v2, v3}, La26;->f(Landroid/view/View;Lx46;)Landroid/animation/ValueAnimator;

    move-result-object v3

    move v4, v0

    new-instance v0, Lb48;

    move/from16 v22, v9

    move-object v9, v3

    move/from16 v3, v22

    invoke-direct/range {v0 .. v5}, Lb48;-><init>(Ld48;Landroid/view/View;FFF)V

    invoke-virtual {v9, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v0, Lc48;

    invoke-direct {v0, v2}, Lc48;-><init>(Landroid/view/View;)V

    invoke-virtual {v9, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-static/range {v18 .. v19}, Lpn7;->f(J)J

    move-result-wide v0

    add-long/2addr v0, v7

    invoke-virtual {v9, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    sget-wide v0, Ld48;->o:J

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    invoke-virtual {v9, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    sget-object v0, Ld48;->p:Lfci;

    invoke-virtual {v9, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {v9}, Landroid/animation/ValueAnimator;->start()V

    move-object/from16 v1, p0

    move-wide/from16 v8, v18

    goto/16 :goto_9c

    :cond_1bc
    return-void

    :cond_1bd
    invoke-static {}, Lh9o;->p()V

    return-void
.end method
