.class public final Lrh8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final n:J

.field public static final o:J

.field public static final p:Landroid/view/animation/AccelerateInterpolator;

.field public static final q:Landroid/view/animation/DecelerateInterpolator;

.field public static final r:J

.field public static final s:J

.field public static final t:Lfci;

.field public static final u:Landroid/view/animation/LinearInterpolator;

.field public static final v:J

.field public static final w:J


# instance fields
.field public final a:Lpde;

.field public final b:Lb2l;

.field public final c:Landroid/view/ViewGroup;

.field public final d:Landroid/view/ViewGroup;

.field public final e:Landroid/view/View;

.field public final f:Landroidx/recyclerview/widget/RecyclerView;

.field public final g:Landroidx/recyclerview/widget/RecyclerView;

.field public final h:Lz5l;

.field public final i:Lwv3;

.field public final j:Lnqi;

.field public final k:Lj1k;

.field public final l:Lc1f;

.field public final m:J


# direct methods
.method static constructor <clinit>()V
    .registers 8

    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->d:Lun7;

    const/16 v1, 0x96

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v2

    sput-wide v2, Lrh8;->n:J

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v4

    sput-wide v4, Lrh8;->o:J

    sget-object v1, Llf1;->b:Landroid/view/animation/AccelerateInterpolator;

    sput-object v1, Lrh8;->p:Landroid/view/animation/AccelerateInterpolator;

    sget-object v1, Llf1;->c:Landroid/view/animation/DecelerateInterpolator;

    sput-object v1, Lrh8;->q:Landroid/view/animation/DecelerateInterpolator;

    const/16 v1, 0x14

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v6

    sput-wide v6, Lrh8;->r:J

    const/16 v1, 0x2bc

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v6

    sput-wide v6, Lrh8;->s:J

    new-instance v1, Lfci;

    invoke-direct {v1}, Lfci;-><init>()V

    sput-object v1, Lrh8;->t:Lfci;

    sget-object v1, Llf1;->f:Landroid/view/animation/LinearInterpolator;

    sput-object v1, Lrh8;->u:Landroid/view/animation/LinearInterpolator;

    const/16 v1, 0x15e

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v6

    invoke-static {v4, v5, v2, v3}, Lpn7;->m(JJ)J

    move-result-wide v1

    invoke-static {v6, v7}, Lpn7;->f(J)J

    move-result-wide v3

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Long;->max(JJ)J

    move-result-wide v1

    invoke-static {v1, v2, v0}, Lcs5;->y0(JLun7;)J

    move-result-wide v1

    sput-wide v1, Lrh8;->v:J

    const/16 v1, 0x64

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lrh8;->w:J

    return-void
.end method

.method public constructor <init>(Lpde;Lb2l;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView;Lz5l;Lwv3;Lnqi;Lj1k;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrh8;->a:Lpde;

    iput-object p2, p0, Lrh8;->b:Lb2l;

    iput-object p3, p0, Lrh8;->c:Landroid/view/ViewGroup;

    iput-object p4, p0, Lrh8;->d:Landroid/view/ViewGroup;

    iput-object p5, p0, Lrh8;->e:Landroid/view/View;

    iput-object p6, p0, Lrh8;->f:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p7, p0, Lrh8;->g:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p8, p0, Lrh8;->h:Lz5l;

    iput-object p9, p0, Lrh8;->i:Lwv3;

    iput-object p10, p0, Lrh8;->j:Lnqi;

    iput-object p11, p0, Lrh8;->k:Lj1k;

    invoke-static {p4}, Lc1f;->c(Landroid/view/View;)Lc1f;

    move-result-object p3

    iput-object p3, p0, Lrh8;->l:Lc1f;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p3

    iput-wide p3, p0, Lrh8;->m:J

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Leyj;

    iget-boolean p1, p1, Leyj;->b:Z

    if-eqz p1, :cond_145

    iget-object p1, p8, Lz5l;->v:Lx2l;

    iget-object p3, p8, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lg6n;

    invoke-direct {p1, p3}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {p1}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3f
    move-object p4, p1

    check-cast p4, Lh6n;

    invoke-virtual {p4}, Lh6n;->hasNext()Z

    move-result p5

    if-eqz p5, :cond_145

    invoke-virtual {p4}, Lh6n;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Landroid/view/View;

    invoke-virtual {p3, p4}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object p4

    instance-of p5, p4, Lh5l;

    if-eqz p5, :cond_3f

    check-cast p4, Lh5l;

    invoke-virtual {p4}, Lh5l;->X()Ljava/util/List;

    move-result-object p5

    invoke-static {p5}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p5

    invoke-static {p5, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_3f

    iget-object p1, p4, Lh5l;->l:Lkol;

    if-eqz p1, :cond_145

    iget-boolean p2, p1, Lkol;->g:Z

    if-nez p2, :cond_145

    invoke-virtual {p1}, Lkol;->a()Lcyj;

    move-result-object p2

    iget-object p2, p2, Lcyj;->a:Ljsc;

    iget-object p3, p1, Lkol;->a:Landroid/content/Context;

    invoke-virtual {p1}, Lkol;->a()Lcyj;

    move-result-object p4

    iget-object p4, p4, Lcyj;->d:Lrxj;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p4, p4, Lrxj;->a:I

    sget-object p5, Ljsc;->c:Lixh;

    invoke-virtual {p5, p3}, Ly7h;->k(Landroid/content/Context;)I

    move-result p3

    if-ge p4, p3, :cond_8c

    iget-object p2, p2, Ljsc;->a:Lshf;

    goto :goto_8e

    :cond_8c
    iget-object p2, p2, Ljsc;->b:Lshf;

    :goto_8e
    iget-object p3, p1, Lkol;->e:Lhol;

    iget-object p3, p3, Lhol;->e:Lzyk;

    invoke-virtual {p3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    if-eqz p3, :cond_a3

    iget-object p2, p2, Lshf;->a:Ljava/lang/Object;

    check-cast p2, [Ldol;

    goto :goto_bc

    :cond_a3
    iget-object p3, p1, Lkol;->e:Lhol;

    iget-object p3, p3, Lhol;->d:Lzyk;

    invoke-virtual {p3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    if-eqz p3, :cond_b8

    iget-object p2, p2, Lshf;->b:Ljava/lang/Object;

    check-cast p2, [Ldol;

    goto :goto_bc

    :cond_b8
    iget-object p2, p2, Lshf;->c:Ljava/lang/Object;

    check-cast p2, [Ldol;

    :goto_bc
    iget-object p3, p1, Lkol;->e:Lhol;

    iget-object p3, p3, Lhol;->b:Lbwg;

    instance-of p4, p3, Lznl;

    const/4 p5, 0x0

    const/4 p6, 0x1

    if-eqz p4, :cond_db

    sget-object p4, Lkol;->r:Landroid/graphics/drawable/ColorDrawable;

    check-cast p3, Lznl;

    iget-object p3, p3, Lznl;->a:Leol;

    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    if-eqz p3, :cond_145

    if-eq p3, p6, :cond_145

    const/4 p4, 0x2

    if-eq p3, p4, :cond_db

    invoke-static {}, Lh9o;->p()V

    throw p5

    :cond_db
    sget-object p3, Ldol;->d:Ldol;

    invoke-static {p3, p2}, Le82;->u(Ljava/lang/Object;[Ljava/lang/Object;)I

    move-result p4

    const/4 p7, -0x1

    if-eq p4, p7, :cond_145

    iget-object p8, p1, Lkol;->e:Lhol;

    iget-object p8, p8, Lhol;->b:Lbwg;

    sget-object p9, Lvnl;->a:Lvnl;

    invoke-virtual {p8, p9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p9

    if-nez p9, :cond_12a

    sget-object p9, Lwnl;->a:Lwnl;

    invoke-virtual {p8, p9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p9

    if-nez p9, :cond_12a

    sget-object p9, Lxnl;->a:Lxnl;

    invoke-virtual {p8, p9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p9

    if-nez p9, :cond_12a

    sget-object p9, Lynl;->a:Lynl;

    invoke-virtual {p8, p9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p9

    if-nez p9, :cond_12a

    instance-of p9, p8, Lznl;

    if-eqz p9, :cond_10e

    move-object p5, p3

    goto :goto_12a

    :cond_10e
    sget-object p3, Laol;->a:Laol;

    invoke-virtual {p8, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_119

    sget-object p5, Ldol;->a:Ldol;

    goto :goto_12a

    :cond_119
    sget-object p3, Lbol;->a:Lbol;

    invoke-virtual {p8, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_124

    sget-object p5, Ldol;->b:Ldol;

    goto :goto_12a

    :cond_124
    instance-of p3, p8, Lcol;

    if-eqz p3, :cond_141

    sget-object p5, Ldol;->e:Ldol;

    :cond_12a
    :goto_12a
    if-eqz p5, :cond_134

    invoke-static {p5, p2}, Le82;->u(Ljava/lang/Object;[Ljava/lang/Object;)I

    move-result p2

    if-eq p2, p7, :cond_134

    if-lt p2, p4, :cond_145

    :cond_134
    iput-boolean p6, p1, Lkol;->g:Z

    new-instance p2, Lthk;

    const/16 p3, 0x12

    invoke-direct {p2, p3}, Lthk;-><init>(B)V

    invoke-virtual {p1, p2}, Lkol;->e(Lkotlin/jvm/functions/Function0;)V

    goto :goto_145

    :cond_141
    invoke-static {}, Lh9o;->p()V

    throw p5

    :cond_145
    :goto_145
    invoke-virtual {p0}, Lrh8;->b()V

    return-void
.end method


# virtual methods
.method public final a(J)V
    .registers 9

    new-instance v0, Lpn7;

    invoke-direct {v0, p1, p2}, Lpn7;-><init>(J)V

    new-instance v1, Lpn7;

    sget-wide v2, Lrh8;->n:J

    invoke-direct {v1, v2, v3}, Lpn7;-><init>(J)V

    iget-object v4, p0, Lrh8;->j:Lnqi;

    invoke-virtual {v4, v0, v1}, Lnqi;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lrh8;->d:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-static {v2, v3}, Lpn7;->f(J)J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-static {p1, p2}, Lpn7;->f(J)J

    move-result-wide p1

    invoke-virtual {v0, p1, p2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Lnl2;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lnl2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Lnh8;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lnh8;-><init>(Lrh8;B)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    iget-object p0, p0, Lrh8;->e:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    sget-object p1, Llf1;->n:Lfci;

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-static {v2, v3}, Lpn7;->f(J)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const p1, 0x3f333333    # 0.7f

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final b()V
    .registers 30

    move-object/from16 v0, p0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, v0, Lrh8;->m:J

    const-wide/16 v5, 0xc8

    add-long/2addr v3, v5

    cmp-long v1, v1, v3

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lez v1, :cond_13

    move v1, v3

    goto :goto_14

    :cond_13
    move v1, v2

    :goto_14
    iget-object v4, v0, Lrh8;->h:Lz5l;

    iget-object v5, v0, Lrh8;->b:Lb2l;

    invoke-virtual {v4, v5}, Lz5l;->d(Lb2l;)Lzwg;

    move-result-object v4

    sget-object v5, Lz2l;->a:Lz2l;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    iget-object v6, v0, Lrh8;->c:Landroid/view/ViewGroup;

    if-eqz v5, :cond_3d

    if-eqz v1, :cond_34

    sget-object v1, Lpn7;->b:Lon7;

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v2, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lrh8;->a(J)V

    return-void

    :cond_34
    new-instance v1, Lnh8;

    invoke-direct {v1, v0, v2}, Lnh8;-><init>(Lrh8;B)V

    invoke-virtual {v6, v1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void

    :cond_3d
    sget-object v5, Ly2l;->a:Ly2l;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_51

    sget-object v1, Lpn7;->b:Lon7;

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v2, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lrh8;->a(J)V

    return-void

    :cond_51
    instance-of v5, v4, La3l;

    if-eqz v5, :cond_2b8

    if-nez v1, :cond_67

    move-object v1, v4

    check-cast v1, La3l;

    iget-boolean v1, v1, La3l;->e:Z

    if-eqz v1, :cond_67

    new-instance v1, Lnh8;

    invoke-direct {v1, v0, v3}, Lnh8;-><init>(Lrh8;B)V

    invoke-virtual {v6, v1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void

    :cond_67
    sget-wide v7, Lrh8;->o:J

    invoke-virtual {v0, v7, v8}, Lrh8;->a(J)V

    iget-object v1, v0, Lrh8;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v9, 0x0

    invoke-virtual {v1, v9, v10}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    sget-wide v11, Lrh8;->w:J

    invoke-static {v11, v12}, Lpn7;->f(J)J

    move-result-wide v11

    invoke-virtual {v1, v11, v12}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    check-cast v4, La3l;

    iget-object v1, v4, La3l;->d:Landroid/view/View;

    iget-object v5, v0, Lrh8;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v5}, Lq9n;->t(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v11

    invoke-static {v1}, Lq9n;->t(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v12

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    const v14, 0x7f0402b9

    const v15, 0x7f06063b

    invoke-static {v14, v13, v15}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v13

    const v14, 0x3ec28f5c    # 0.38f

    invoke-static {v14, v13}, Lp37;->a0(FI)I

    move-result v13

    invoke-static {v13}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v13

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v14

    const/high16 v15, 0x41800000    # 16.0f

    invoke-static {v14, v15}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v14

    const/4 v15, 0x0

    invoke-static {v15, v13, v14}, Lxgh;->i(Landroid/graphics/drawable/ShapeDrawable;Landroid/content/res/ColorStateList;I)Landroid/graphics/drawable/RippleDrawable;

    move-result-object v13

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v14

    int-to-float v14, v14

    const/high16 v15, 0x40000000    # 2.0f

    div-float/2addr v14, v15

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v15

    invoke-virtual {v13, v14, v2}, Landroid/graphics/drawable/RippleDrawable;->setHotspot(FF)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setPressed(Z)V

    invoke-virtual {v1, v13}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, v0, Lrh8;->a:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Leyj;

    iget-boolean v2, v2, Leyj;->b:Z

    if-eqz v2, :cond_1a0

    invoke-static {v6}, Lq9n;->t(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v2

    new-instance v16, Lir;

    iget-object v13, v4, La3l;->a:Lir;

    iget v14, v13, Lir;->a:I

    move-wide/from16 v25, v9

    iget v9, v13, Lir;->b:I

    iget v10, v13, Lir;->c:I

    move/from16 v27, v15

    iget v15, v13, Lir;->d:I

    iget v3, v13, Lir;->e:I

    move-object/from16 v28, v1

    iget-object v1, v13, Lir;->f:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v17

    if-eqz v17, :cond_10c

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v17

    if-eqz v17, :cond_10c

    move-object/from16 v22, v17

    goto :goto_10e

    :cond_10c
    move-object/from16 v22, v1

    :goto_10e
    iget-object v1, v13, Lir;->g:Ler;

    iget-object v13, v13, Lir;->h:Lgr;

    move-object/from16 v23, v1

    move/from16 v21, v3

    move/from16 v18, v9

    move/from16 v19, v10

    move-object/from16 v24, v13

    move/from16 v17, v14

    move/from16 v20, v15

    invoke-direct/range {v16 .. v24}, Lir;-><init>(IIIIILandroid/graphics/drawable/Drawable;Ler;Lgr;)V

    move-object/from16 v1, v16

    iget-object v3, v4, La3l;->b:Landroid/graphics/Rect;

    iget v9, v2, Landroid/graphics/Rect;->left:I

    neg-int v9, v9

    iget v2, v2, Landroid/graphics/Rect;->top:I

    neg-int v2, v2

    invoke-virtual {v3, v9, v2}, Landroid/graphics/Rect;->offset(II)V

    invoke-virtual {v3}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_138

    const/4 v3, 0x1

    goto :goto_1a6

    :cond_138
    iget-object v2, v1, Lir;->h:Lgr;

    invoke-interface {v2}, Lgr;->j()Z

    move-result v20

    iget-object v9, v0, Lrh8;->i:Lwv3;

    invoke-interface {v2, v1, v9}, Lgr;->a(Lir;Lwv3;)Landroid/graphics/Rect;

    move-result-object v2

    invoke-static {v6}, Lq9n;->t(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v9

    iget v10, v9, Landroid/graphics/Rect;->left:I

    neg-int v10, v10

    iget v9, v9, Landroid/graphics/Rect;->top:I

    neg-int v9, v9

    invoke-virtual {v2, v10, v9}, Landroid/graphics/Rect;->offset(II)V

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    new-instance v10, Lqh8;

    invoke-direct {v10, v1, v3, v4, v9}, Lqh8;-><init>(Lir;Landroid/graphics/Rect;La3l;Landroid/content/Context;)V

    const/4 v4, -0x1

    invoke-virtual {v6, v10, v4, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    const/4 v4, 0x2

    new-array v4, v4, [F

    fill-array-data v4, :array_2bc

    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v4

    if-eqz v20, :cond_171

    sget-wide v13, Lrh8;->v:J

    invoke-static {v13, v14}, Lpn7;->f(J)J

    move-result-wide v13

    goto :goto_177

    :cond_171
    sget-wide v13, Lrh8;->s:J

    invoke-static {v13, v14}, Lpn7;->f(J)J

    move-result-wide v13

    :goto_177
    invoke-virtual {v4, v13, v14}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    sget-object v6, Lrh8;->t:Lfci;

    invoke-virtual {v4, v6}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v16, Lph8;

    move-object/from16 v17, v1

    move-object/from16 v19, v2

    move-object/from16 v18, v3

    move-object/from16 v21, v10

    invoke-direct/range {v16 .. v21}, Lph8;-><init>(Lir;Landroid/graphics/Rect;Landroid/graphics/Rect;ZLqh8;)V

    move-object/from16 v2, v16

    move-object/from16 v1, v21

    invoke-virtual {v4, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v2, Lt05;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v1, v3}, Lt05;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_1a6

    :cond_1a0
    move-object/from16 v28, v1

    move-wide/from16 v25, v9

    move/from16 v27, v15

    :goto_1a6
    new-instance v0, Lg6n;

    invoke-direct {v0, v5}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v0}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1af
    move-object v1, v0

    check-cast v1, Lh6n;

    invoke-virtual {v1}, Lh6n;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2b7

    invoke-virtual {v1}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    iget v2, v11, Landroid/graphics/Rect;->left:I

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v4

    add-int/2addr v4, v2

    int-to-float v2, v4

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float v4, v4, v27

    add-float/2addr v4, v2

    invoke-virtual {v12}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v2

    sub-float/2addr v4, v2

    iget v2, v11, Landroid/graphics/Rect;->top:I

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v5

    add-int/2addr v5, v2

    int-to-float v2, v5

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v5

    int-to-float v5, v5

    div-float v5, v5, v27

    add-float/2addr v5, v2

    invoke-virtual {v12}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v2

    sub-float/2addr v5, v2

    invoke-virtual {v12}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    div-float v2, v4, v2

    invoke-virtual {v12}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-float v6, v6

    div-float v6, v5, v6

    mul-float/2addr v2, v2

    mul-float/2addr v6, v6

    add-float/2addr v6, v2

    float-to-double v9, v6

    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v9

    double-to-float v2, v9

    invoke-static {v4}, Lzed;->b(F)I

    move-result v4

    if-nez v4, :cond_217

    invoke-static {v5}, Lzed;->b(F)I

    move-result v4

    if-nez v4, :cond_217

    invoke-virtual/range {v28 .. v28}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Leyj;

    iget-boolean v4, v4, Leyj;->b:Z

    if-nez v4, :cond_217

    move v4, v3

    goto :goto_218

    :cond_217
    const/4 v4, 0x0

    :goto_218
    if-nez v4, :cond_22e

    sget-wide v5, Lrh8;->r:J

    invoke-static {v5, v6}, Lpn7;->f(J)J

    move-result-wide v5

    long-to-float v5, v5

    const/high16 v6, 0x3f800000    # 1.0f

    sub-float/2addr v2, v6

    mul-float/2addr v2, v5

    float-to-double v5, v2

    invoke-static {v5, v6}, Lzed;->c(D)J

    move-result-wide v5

    cmp-long v2, v5, v25

    if-gez v2, :cond_230

    :cond_22e
    move-wide/from16 v5, v25

    :cond_230
    if-eqz v4, :cond_239

    sget-wide v9, Lrh8;->n:J

    invoke-static {v7, v8, v9, v10}, Lpn7;->m(JJ)J

    move-result-wide v9

    goto :goto_23a

    :cond_239
    move-wide v9, v7

    :goto_23a
    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    move-result v18

    invoke-virtual {v1}, Landroid/view/View;->getScaleX()F

    move-result v23

    invoke-virtual {v1}, Landroid/view/View;->getTranslationX()F

    move-result v19

    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    move-result v21

    if-eqz v4, :cond_252

    const v2, 0x3f99999a    # 1.2f

    move/from16 v24, v2

    goto :goto_254

    :cond_252
    move/from16 v24, v23

    :goto_254
    if-eqz v4, :cond_288

    invoke-virtual {v11}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v2

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v13

    int-to-float v13, v13

    div-float v13, v13, v27

    sub-float/2addr v2, v13

    iget v13, v12, Landroid/graphics/Rect;->left:I

    int-to-float v13, v13

    sub-float/2addr v2, v13

    sub-float v2, v2, v19

    const v13, 0x3c75c28f    # 0.015f

    mul-float/2addr v2, v13

    add-float v2, v2, v19

    invoke-virtual {v11}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v14

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v15

    int-to-float v15, v15

    div-float v15, v15, v27

    sub-float/2addr v14, v15

    iget v15, v12, Landroid/graphics/Rect;->top:I

    int-to-float v15, v15

    sub-float/2addr v14, v15

    sub-float v14, v14, v21

    mul-float/2addr v14, v13

    add-float v14, v14, v21

    move/from16 v20, v2

    move/from16 v22, v14

    goto :goto_28c

    :cond_288
    move/from16 v20, v19

    move/from16 v22, v21

    :goto_28c
    sget-object v2, Lx46;->c:Lx46;

    invoke-static {v1, v2}, La26;->f(Landroid/view/View;Lx46;)Landroid/animation/ValueAnimator;

    move-result-object v2

    invoke-static {v9, v10}, Lpn7;->f(J)J

    move-result-wide v9

    invoke-virtual {v2, v9, v10}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    invoke-virtual {v2, v5, v6}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    if-eqz v4, :cond_2a1

    sget-object v4, Lrh8;->p:Landroid/view/animation/AccelerateInterpolator;

    goto :goto_2a3

    :cond_2a1
    sget-object v4, Lrh8;->q:Landroid/view/animation/DecelerateInterpolator;

    :goto_2a3
    invoke-virtual {v2, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v16, Loh8;

    move-object/from16 v17, v1

    invoke-direct/range {v16 .. v24}, Loh8;-><init>(Landroid/view/View;FFFFFFF)V

    move-object/from16 v1, v16

    invoke-virtual {v2, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->start()V

    goto/16 :goto_1af

    :cond_2b7
    return-void

    :cond_2b8
    invoke-static {}, Lh9o;->p()V

    return-void

    :array_2bc
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
