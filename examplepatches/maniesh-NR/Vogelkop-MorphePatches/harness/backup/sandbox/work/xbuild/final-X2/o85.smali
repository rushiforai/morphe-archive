.class public final Lo85;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final o:J

.field public static final p:J

.field public static final q:J

.field public static final r:J

.field public static final s:J

.field public static final t:J

.field public static final u:Landroid/view/animation/PathInterpolator;

.field public static final v:Lfci;

.field public static final w:Landroid/view/animation/AccelerateDecelerateInterpolator;

.field public static final x:Landroid/view/animation/AccelerateInterpolator;


# instance fields
.field public final a:Lp85;

.field public final b:Lu85;

.field public final c:Landroid/content/Context;

.field public final d:Lpde;

.field public final e:Landroid/animation/ArgbEvaluator;

.field public final f:I

.field public final g:I

.field public h:Z

.field public i:Landroid/animation/ValueAnimator;

.field public j:Ljava/lang/Long;

.field public k:Lhh4;

.field public l:I

.field public final m:Lshf;

.field public final n:Ln85;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->d:Lun7;

    const/16 v1, 0x1f4

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v2

    sput-wide v2, Lo85;->o:J

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    sput-wide v1, Lo85;->p:J

    const/16 v1, 0xfa

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v2

    sput-wide v2, Lo85;->q:J

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v2

    sput-wide v2, Lo85;->r:J

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    sput-wide v1, Lo85;->s:J

    const/16 v1, 0xc8

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lo85;->t:J

    sget-object v0, Lsz7;->a:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/animation/PathInterpolator;

    sput-object v0, Lo85;->u:Landroid/view/animation/PathInterpolator;

    sget-object v0, Llf1;->n:Lfci;

    sput-object v0, Lo85;->v:Lfci;

    sget-object v0, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    sput-object v0, Lo85;->w:Landroid/view/animation/AccelerateDecelerateInterpolator;

    sget-object v0, Llf1;->b:Landroid/view/animation/AccelerateInterpolator;

    sput-object v0, Lo85;->x:Landroid/view/animation/AccelerateInterpolator;

    return-void
.end method

.method public constructor <init>(Lpde;Lp85;Lize;Lpde;Ltsd;Lu85;)V
    .registers 15

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lo85;->a:Lp85;

    iput-object p6, p0, Lo85;->b:Lu85;

    iget-object v0, p2, Lp85;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lo85;->c:Landroid/content/Context;

    new-instance v2, Lpde;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v2, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lo85;->d:Lpde;

    new-instance v2, Landroid/animation/ArgbEvaluator;

    invoke-direct {v2}, Landroid/animation/ArgbEvaluator;-><init>()V

    iput-object v2, p0, Lo85;->e:Landroid/animation/ArgbEvaluator;

    const/high16 v2, 0x42000000    # 32.0f

    invoke-static {v1, v2}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v2

    iput v2, p0, Lo85;->f:I

    const/high16 v2, 0x42600000    # 56.0f

    invoke-static {v1, v2}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v2

    iput v2, p0, Lo85;->g:I

    new-instance v2, Lshf;

    invoke-direct {v2, v1, p1, p5}, Lshf;-><init>(Landroid/content/Context;Lpde;Ltsd;)V

    iput-object v2, p0, Lo85;->m:Lshf;

    new-instance v4, Ln85;

    iget-object v5, p2, Lp85;->b:Landroid/widget/LinearLayout;

    invoke-direct {v4, v0, v5}, Ln85;-><init>(Landroid/view/View;Landroid/view/View;)V

    iput-object v4, p0, Lo85;->n:Ln85;

    sget v4, Ld03;->e:I

    iget-object v4, p2, Lp85;->f:Landroid/view/ViewGroup;

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f08024b

    invoke-static {v6, v5}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-static {v4, v5}, Lydp;->q(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    iget-object v5, p2, Lp85;->d:Landroid/widget/FrameLayout;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f0809aa

    invoke-static {v7, v6}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-static {v5, v6}, Lydp;->q(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    iget-object v5, p2, Lp85;->g:Landroid/view/ViewGroup;

    check-cast v5, Landroid/widget/FrameLayout;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v7, v6}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-static {v5, v6}, Lydp;->q(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    new-instance v5, Lk85;

    invoke-direct {v5, p0, v3}, Lk85;-><init>(Lo85;B)V

    invoke-static {p4, p1, v5}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object p4, p2, Lp85;->m:Landroid/view/View;

    check-cast p4, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    sget-object v5, Lmaj;->c:Lmaj;

    invoke-static {v1, v5}, Lu0h;->g(Landroid/content/Context;Lmaj;)Llaj;

    move-result-object v1

    invoke-virtual {p4, v1}, Lcom/opera/android/custom_views/DropShadowFrameLayout;->b(Llaj;)V

    const/4 v1, 0x0

    iget-object v5, p4, Lcom/opera/android/custom_views/DropShadowFrameLayout;->a:Lzi4;

    invoke-virtual {v5, v1}, Lzi4;->X(F)Z

    move-result v1

    if-eqz v1, :cond_96

    invoke-virtual {p4}, Landroid/view/View;->invalidate()V

    :cond_96
    iget-object p4, v2, Lshf;->c:Ljava/lang/Object;

    check-cast p4, Lpde;

    new-instance v1, Lk85;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lk85;-><init>(Lo85;B)V

    invoke-static {p4, p1, v1}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p4, Lk85;

    const/4 v1, 0x2

    invoke-direct {p4, p0, v1}, Lk85;-><init>(Lo85;B)V

    invoke-static {p3, p1, p4}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p4, Le73;

    invoke-direct {p4, p0, p3, v1}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, p4}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    iget-object p3, p6, Lu85;->k:Ljava/lang/Object;

    check-cast p3, Lpde;

    new-instance p4, Lcl4;

    invoke-direct {p4, p0, v1}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p1, p4}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p3, Lm85;

    invoke-direct {p3, p0, v3}, Lm85;-><init>(Lo85;B)V

    invoke-virtual {v4, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p2, Lp85;->j:Landroid/view/View;

    check-cast p2, Landroid/widget/ImageView;

    new-instance p3, Lm85;

    invoke-direct {p3, p0, v2}, Lm85;-><init>(Lo85;B)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lz22;

    const/4 p3, 0x5

    invoke-direct {p2, p0, p3}, Lz22;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    new-instance p2, Lk85;

    const/4 p3, 0x3

    invoke-direct {p2, p0, p3}, Lk85;-><init>(Lo85;B)V

    invoke-static {p5, p1, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method

.method public static b(Lo24;Landroid/view/ViewGroup;Lcom/opera/android/custom_views/StylingTextView;)V
    .registers 10

    iget-object v0, p0, Lo24;->b:Ljf;

    iget-object v1, v0, Ljf;->c:Lxc;

    if-nez v1, :cond_a

    iget-object v1, p0, Lo24;->a:Lpc;

    iget-object v1, v1, Lpc;->a:Lxc;

    :cond_a
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, v1, Lxc;->a:I

    iget-object v4, v1, Lxc;->b:Lrxh;

    invoke-static {v3, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v3, v1, Lxc;->f:Lrm5;

    sget-object v5, Luc;->m:Luc;

    invoke-virtual {v3, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_30

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f0402c8

    invoke-static {v5, v3, v6}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-static {v2, v3}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    goto :goto_3c

    :cond_30
    sget-object v5, Lvc;->m:Lvc;

    invoke-virtual {v3, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3c

    instance-of v3, v3, Lwc;

    if-eqz v3, :cond_69

    :cond_3c
    :goto_3c
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v4, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v3, 0x0

    invoke-virtual {p2, v2, v3}, Lcom/opera/android/custom_views/StylingTextView;->s(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {v4, p2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p2

    iget v1, v1, Lxc;->e:I

    invoke-virtual {p1, p2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-static {p1, p2, v1}, Ln1h;->o(Landroid/view/View;Ljava/lang/CharSequence;I)V

    new-instance p2, Ll85;

    invoke-direct {p2, p0, v6}, Ll85;-><init>(Lo24;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-boolean p0, v0, Ljf;->d:Z

    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :cond_69
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public static c(Lo24;Landroid/widget/ImageView;)V
    .registers 5

    iget-object v0, p0, Lo24;->b:Ljf;

    iget-object v0, v0, Ljf;->c:Lxc;

    if-nez v0, :cond_a

    iget-object v0, p0, Lo24;->a:Lpc;

    iget-object v0, v0, Lpc;->a:Lxc;

    :cond_a
    iget v1, v0, Lxc;->a:I

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v1, v0, Lxc;->b:Lrxh;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    iget v0, v0, Lxc;->e:I

    invoke-virtual {p1, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-static {p1, v1, v0}, Ln1h;->o(Landroid/view/View;Ljava/lang/CharSequence;I)V

    new-instance v0, Ll85;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ll85;-><init>(Lo24;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lo24;->b:Ljf;

    iget-boolean p0, p0, Ljf;->d:Z

    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method


# virtual methods
.method public final a(Lq85;)V
    .registers 15

    iget-object v0, p1, Lq85;->b:Leri;

    iget-boolean v1, p1, Lq85;->a:Z

    iget-object v2, p1, Lq85;->e:Lzm8;

    invoke-interface {v0}, Leri;->getId()J

    move-result-wide v3

    iget-object v5, p0, Lo85;->j:Ljava/lang/Long;

    if-eqz v5, :cond_16

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-eqz v3, :cond_3b

    :cond_16
    invoke-interface {v0}, Leri;->getId()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, p0, Lo85;->j:Ljava/lang/Long;

    iget-object v3, p0, Lo85;->k:Lhh4;

    if-eqz v3, :cond_27

    invoke-interface {v3}, Lhh4;->cancel()V

    :cond_27
    new-instance v3, Leh7;

    iget v4, p0, Lo85;->f:I

    invoke-direct {v3, v4}, Leh7;-><init>(I)V

    new-instance v4, Liu2;

    const/16 v5, 0x12

    invoke-direct {v4, p0, v5}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v3, v4}, Leri;->h(Leh7;Lcom/opera/api/Callback;)Lhh4;

    move-result-object v0

    iput-object v0, p0, Lo85;->k:Lhh4;

    :cond_3b
    iget-object v0, p1, Lq85;->c:Lo24;

    iget-object v3, p0, Lo85;->a:Lp85;

    if-eqz v0, :cond_48

    iget-object v4, v3, Lp85;->i:Landroid/view/View;

    check-cast v4, Landroid/widget/ImageView;

    invoke-static {v0, v4}, Lo85;->c(Lo24;Landroid/widget/ImageView;)V

    :cond_48
    iget-object p1, p1, Lq85;->d:Lo24;

    if-eqz p1, :cond_53

    iget-object v0, v3, Lp85;->k:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    invoke-static {p1, v0}, Lo85;->c(Lo24;Landroid/widget/ImageView;)V

    :cond_53
    if-eqz v2, :cond_6b

    iget-object p1, v2, Lzm8;->a:Lo24;

    iget-object v0, v3, Lp85;->d:Landroid/widget/FrameLayout;

    iget-object v4, v3, Lp85;->c:Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {p1, v0, v4}, Lo85;->b(Lo24;Landroid/view/ViewGroup;Lcom/opera/android/custom_views/StylingTextView;)V

    iget-object p1, v2, Lzm8;->b:Lo24;

    iget-object v0, v3, Lp85;->g:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/FrameLayout;

    iget-object v4, v3, Lp85;->h:Landroid/view/View;

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {p1, v0, v4}, Lo85;->b(Lo24;Landroid/view/ViewGroup;Lcom/opera/android/custom_views/StylingTextView;)V

    :cond_6b
    const/4 p1, 0x1

    const/4 v0, 0x0

    if-eqz v2, :cond_71

    move v4, p1

    goto :goto_72

    :cond_71
    move v4, v0

    :goto_72
    iget-object v5, p0, Lo85;->n:Ln85;

    iget-boolean v6, v5, Ln85;->e:Z

    if-eq v6, v4, :cond_7a

    move v6, p1

    goto :goto_7b

    :cond_7a
    move v6, v0

    :goto_7b
    iget-boolean v7, v5, Ln85;->f:Z

    if-eq v7, v1, :cond_81

    move v7, p1

    goto :goto_82

    :cond_81
    move v7, v0

    :goto_82
    const/4 v8, 0x2

    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v10, 0x0

    if-nez v6, :cond_8a

    if-eqz v7, :cond_ed

    :cond_8a
    iput-boolean v4, v5, Ln85;->e:Z

    iput-boolean v1, v5, Ln85;->f:Z

    iget-object v7, v5, Ln85;->h:Landroid/animation/ValueAnimator;

    if-eqz v7, :cond_95

    invoke-virtual {v7}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_95
    iget v7, v5, Ln85;->g:F

    if-eqz v4, :cond_9d

    if-nez v1, :cond_9d

    move v4, v9

    goto :goto_9e

    :cond_9d
    move v4, v10

    :goto_9e
    if-nez v6, :cond_ba

    iget-object v6, v5, Ln85;->a:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v6

    if-eqz v6, :cond_ba

    cmpl-float v6, v4, v10

    if-lez v6, :cond_b3

    sget-wide v11, Lo85;->s:J

    invoke-static {v11, v12}, Lpn7;->f(J)J

    move-result-wide v11

    goto :goto_bc

    :cond_b3
    sget-wide v11, Lo85;->t:J

    invoke-static {v11, v12}, Lpn7;->f(J)J

    move-result-wide v11

    goto :goto_bc

    :cond_ba
    const-wide/16 v11, 0x0

    :goto_bc
    long-to-float v6, v11

    sub-float v11, v4, v7

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    mul-float/2addr v11, v6

    float-to-long v11, v11

    new-array v6, v8, [F

    aput v7, v6, v0

    aput v4, v6, p1

    invoke-static {v6}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v4

    invoke-virtual {v4, v11, v12}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    sget-object v6, Llf1;->f:Landroid/view/animation/LinearInterpolator;

    invoke-virtual {v4, v6}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v6, Lnl2;

    invoke-direct {v6, v5, v8}, Lnl2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v6}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v6, Lkc;

    const/4 v7, 0x5

    invoke-direct {v6, v5, v7}, Lkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v6}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->start()V

    iput-object v4, v5, Ln85;->h:Landroid/animation/ValueAnimator;

    :cond_ed
    if-eqz v2, :cond_f1

    move v2, p1

    goto :goto_f2

    :cond_f1
    move v2, v0

    :goto_f2
    iget-boolean v4, p0, Lo85;->h:Z

    if-ne v1, v4, :cond_ff

    iget-object p1, p0, Lo85;->i:Landroid/animation/ValueAnimator;

    if-eqz p1, :cond_fb

    return-void

    :cond_fb
    invoke-virtual {p0}, Lo85;->d()V

    return-void

    :cond_ff
    iput-boolean v1, p0, Lo85;->h:Z

    iget-object v4, p0, Lo85;->i:Landroid/animation/ValueAnimator;

    if-eqz v4, :cond_10e

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    invoke-virtual {v4}, Landroid/animation/Animator;->removeAllListeners()V

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_10e
    const/4 v4, 0x0

    iput-object v4, p0, Lo85;->i:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Lo85;->e()I

    move-result v4

    iget-object v3, v3, Lp85;->f:Landroid/view/ViewGroup;

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v3

    iget v5, p0, Lo85;->g:I

    if-ne v5, v4, :cond_123

    move v3, v10

    goto :goto_12c

    :cond_123
    sub-int/2addr v3, v5

    int-to-float v3, v3

    sub-int/2addr v4, v5

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-static {v3, v10, v9}, Ldjh;->b(FFF)F

    move-result v3

    :goto_12c
    if-eqz v1, :cond_12f

    move v9, v10

    :cond_12f
    if-eqz v1, :cond_139

    if-eqz v2, :cond_136

    sget-wide v4, Lo85;->r:J

    goto :goto_140

    :cond_136
    sget-wide v4, Lo85;->p:J

    goto :goto_140

    :cond_139
    if-eqz v2, :cond_13e

    sget-wide v4, Lo85;->q:J

    goto :goto_140

    :cond_13e
    sget-wide v4, Lo85;->o:J

    :goto_140
    sub-float v1, v9, v3

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-static {v4, v5}, Lpn7;->f(J)J

    move-result-wide v4

    long-to-float v4, v4

    mul-float/2addr v4, v1

    float-to-long v4, v4

    new-array v1, v8, [F

    aput v3, v1, v0

    aput v9, v1, p1

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    if-eqz v2, :cond_15f

    sget-object v1, Lo85;->v:Lfci;

    goto :goto_161

    :cond_15f
    sget-object v1, Lo85;->u:Landroid/view/animation/PathInterpolator;

    :goto_161
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v1, Lnl2;

    invoke-direct {v1, p0, p1}, Lnl2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance p1, Lkc;

    const/4 v1, 0x6

    invoke-direct {p1, p0, v1}, Lkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    iput-object v0, p0, Lo85;->i:Landroid/animation/ValueAnimator;

    return-void
.end method

.method public final d()V
    .registers 13

    iget-object v0, p0, Lo85;->a:Lp85;

    iget-object v1, v0, Lp85;->k:Landroid/view/View;

    check-cast v1, Landroid/widget/ImageView;

    iget-object v2, v0, Lp85;->i:Landroid/view/View;

    check-cast v2, Landroid/widget/ImageView;

    iget-object v3, v0, Lp85;->l:Landroid/view/View;

    check-cast v3, Landroid/widget/TextView;

    iget-object v4, v0, Lp85;->f:Landroid/view/ViewGroup;

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-boolean v5, p0, Lo85;->h:Z

    if-eqz v5, :cond_18

    const/4 v5, -0x2

    goto :goto_19

    :cond_18
    const/4 v5, -0x1

    :goto_19
    invoke-static {v5, v4}, Lp37;->t0(ILandroid/view/View;)V

    iget-object v4, p0, Lo85;->b:Lu85;

    iget-object v4, v4, Lu85;->k:Ljava/lang/Object;

    check-cast v4, Lpde;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lq85;

    iget-boolean v5, p0, Lo85;->h:Z

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    if-eqz v5, :cond_31

    move v8, v7

    goto :goto_32

    :cond_31
    move v8, v6

    :goto_32
    invoke-virtual {v3, v8}, Landroid/view/View;->setAlpha(F)V

    const/16 v9, 0x8

    const/4 v10, 0x0

    if-nez v5, :cond_3c

    move v11, v10

    goto :goto_3d

    :cond_3c
    move v11, v9

    :goto_3d
    invoke-virtual {v3, v11}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v2, v8}, Landroid/view/View;->setAlpha(F)V

    if-nez v5, :cond_4b

    iget-object v3, v4, Lq85;->c:Lo24;

    if-eqz v3, :cond_4b

    move v3, v10

    goto :goto_4c

    :cond_4b
    move v3, v9

    :goto_4c
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, v8}, Landroid/view/View;->setAlpha(F)V

    if-nez v5, :cond_59

    iget-object v2, v4, Lq85;->d:Lo24;

    if-eqz v2, :cond_59

    move v9, v10

    :cond_59
    invoke-virtual {v1, v9}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lo85;->i:Landroid/animation/ValueAnimator;

    if-nez v1, :cond_7b

    iget-object v1, v0, Lp85;->f:Landroid/view/ViewGroup;

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-boolean v2, p0, Lo85;->h:Z

    if-eqz v2, :cond_72

    iget-object v2, p0, Lo85;->c:Landroid/content/Context;

    const v3, 0x7f0401f8

    invoke-static {v3, v2}, Lj7h;->k(ILandroid/content/Context;)I

    move-result v2

    goto :goto_74

    :cond_72
    iget v2, p0, Lo85;->l:I

    :goto_74
    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    :cond_7b
    iget-object v0, v0, Lp85;->m:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    iget-boolean p0, p0, Lo85;->h:Z

    if-nez p0, :cond_84

    move v6, v7

    :cond_84
    iget-object p0, v0, Lcom/opera/android/custom_views/DropShadowFrameLayout;->a:Lzi4;

    invoke-virtual {p0, v6}, Lzi4;->X(F)Z

    move-result p0

    if-eqz p0, :cond_8f

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    :cond_8f
    return-void
.end method

.method public final e()I
    .registers 3

    iget-object v0, p0, Lo85;->m:Lshf;

    iget-object v0, v0, Lshf;->c:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    iget-object v1, p0, Lo85;->a:Lp85;

    iget-object v1, v1, Lp85;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    sub-int/2addr v1, v0

    sub-int/2addr v1, v0

    iget p0, p0, Lo85;->g:I

    if-ge v1, p0, :cond_1f

    return p0

    :cond_1f
    return v1
.end method

.method public final f(Lrmn;)V
    .registers 6

    iget p1, p1, Lrmn;->g:I

    sget-object v0, Lv8k;->a:Lv8k;

    iget-object v1, p0, Lo85;->a:Lp85;

    iget-object v2, v1, Lp85;->f:Landroid/view/ViewGroup;

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0, v3}, Lv8k;->d(Landroid/content/Context;)I

    move-result v0

    sget-object v3, Lv8k;->b:Lv8k;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v3, v2}, Lv8k;->d(Landroid/content/Context;)I

    move-result v2

    invoke-static {p1, v0, v2}, Lp37;->F(III)I

    move-result p1

    iput p1, p0, Lo85;->l:I

    iget-object v0, v1, Lp85;->d:Landroid/widget/FrameLayout;

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    iget-object p1, v1, Lp85;->g:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/FrameLayout;

    iget v0, p0, Lo85;->l:I

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    iget-object p1, p0, Lo85;->i:Landroid/animation/ValueAnimator;

    if-eqz p1, :cond_3d

    return-void

    :cond_3d
    iget-object p1, v1, Lp85;->f:Landroid/view/ViewGroup;

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-boolean v0, p0, Lo85;->h:Z

    if-eqz v0, :cond_4f

    iget-object p0, p0, Lo85;->c:Landroid/content/Context;

    const v0, 0x7f0401f8

    invoke-static {v0, p0}, Lj7h;->k(ILandroid/content/Context;)I

    move-result p0

    goto :goto_51

    :cond_4f
    iget p0, p0, Lo85;->l:I

    :goto_51
    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method
