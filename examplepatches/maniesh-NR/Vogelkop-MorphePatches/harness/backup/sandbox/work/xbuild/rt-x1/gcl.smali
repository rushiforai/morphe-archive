.class public final Lgcl;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final j:Lixh;

.field public static final k:Lixh;

.field public static final l:Lixh;

.field public static final m:Lixh;

.field public static final n:Lixh;

.field public static final o:Lixh;

.field public static final p:Lixh;

.field public static final q:Lixh;

.field public static final r:Lixh;

.field public static final s:Landroid/view/animation/DecelerateInterpolator;


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Landroid/view/ViewOverlay;

.field public final c:Lw05;

.field public final d:I

.field public final e:I

.field public final f:F

.field public final g:I

.field public final h:Landroid/graphics/Rect;

.field public i:Landroid/animation/ValueAnimator;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lixh;

    const/high16 v1, 0x435c0000    # 220.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lgcl;->j:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x42800000    # 64.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lgcl;->k:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lgcl;->l:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x41800000    # 16.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lgcl;->m:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lgcl;->n:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x40800000    # 4.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lgcl;->o:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x40400000    # 3.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lgcl;->p:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lgcl;->q:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x43480000    # 200.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lgcl;->r:Lixh;

    sget-object v0, Llf1;->c:Landroid/view/animation/DecelerateInterpolator;

    sput-object v0, Lgcl;->s:Landroid/view/animation/DecelerateInterpolator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lgcl;->a:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object p2

    iput-object p2, p0, Lgcl;->b:Landroid/view/ViewOverlay;

    new-instance v0, Lw05;

    sget-object p2, Lgcl;->m:Lixh;

    invoke-virtual {p2, p1}, Ly7h;->l(Landroid/content/Context;)F

    move-result v1

    sget-object p2, Lgcl;->n:Lixh;

    invoke-virtual {p2, p1}, Ly7h;->l(Landroid/content/Context;)F

    move-result v2

    sget-object p2, Lgcl;->o:Lixh;

    invoke-virtual {p2, p1}, Ly7h;->l(Landroid/content/Context;)F

    move-result v3

    sget-object p2, Lgcl;->p:Lixh;

    invoke-virtual {p2, p1}, Ly7h;->l(Landroid/content/Context;)F

    move-result v4

    sget-object p2, Lgcl;->q:Lixh;

    invoke-virtual {p2, p1}, Ly7h;->l(Landroid/content/Context;)F

    move-result v5

    invoke-direct/range {v0 .. v5}, Lw05;-><init>(FFFFF)V

    iput-object v0, p0, Lgcl;->c:Lw05;

    sget-object p2, Lgcl;->k:Lixh;

    invoke-virtual {p2, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result p2

    iput p2, p0, Lgcl;->d:I

    sget-object p2, Lgcl;->j:Lixh;

    invoke-virtual {p2, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result p2

    iput p2, p0, Lgcl;->e:I

    sget-object p2, Lgcl;->r:Lixh;

    invoke-virtual {p2, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Lgcl;->f:F

    sget-object p2, Lgcl;->l:Lixh;

    invoke-virtual {p2, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result p1

    iput p1, p0, Lgcl;->g:I

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lgcl;->h:Landroid/graphics/Rect;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 7

    iget-object v0, p0, Lgcl;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    new-instance v2, Landroid/graphics/Rect;

    iget v3, p0, Lgcl;->e:I

    div-int/lit8 v3, v3, 0x2

    sub-int v4, v1, v3

    sub-int v5, v0, v3

    add-int/2addr v1, v3

    add-int/2addr v3, v0

    invoke-direct {v2, v4, v5, v1, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p0, v2}, Lgcl;->b(Landroid/graphics/Rect;)V

    return-void
.end method

.method public final b(Landroid/graphics/Rect;)V
    .registers 9

    iget-object v0, p0, Lgcl;->b:Landroid/view/ViewOverlay;

    iget-object v1, p0, Lgcl;->c:Lw05;

    invoke-virtual {v0, v1}, Landroid/view/ViewOverlay;->remove(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v3

    iget v4, p0, Lgcl;->g:I

    shl-int/lit8 v4, v4, 0x1

    add-int/2addr v3, v4

    iget v5, p0, Lgcl;->d:I

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    add-int/2addr p1, v4

    invoke-static {p1, v5}, Ljava/lang/Math;->max(II)I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    new-instance v4, Landroid/graphics/Rect;

    sub-int v5, v0, v3

    sub-int v6, v2, p1

    add-int/2addr v0, v3

    add-int/2addr v2, p1

    invoke-direct {v4, v5, v6, v0, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object p1, p0, Lgcl;->h:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_50

    invoke-virtual {p1, v4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    new-instance p0, Landroid/graphics/Rect;

    invoke-direct {p0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-virtual {v1, p0}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :cond_50
    invoke-virtual {v4}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-virtual {v4}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v2

    sub-float/2addr v1, v2

    mul-float/2addr v0, v0

    mul-float/2addr v1, v1

    add-float/2addr v1, v0

    float-to-double v0, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    iget v1, p0, Lgcl;->f:F

    div-float/2addr v0, v1

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v2}, Ldjh;->b(FFF)F

    move-result v0

    const/high16 v1, 0x42c80000    # 100.0f

    mul-float/2addr v0, v1

    const/high16 v1, 0x43480000    # 200.0f

    sub-float/2addr v1, v0

    float-to-long v0, v1

    iget-object v2, p0, Lgcl;->i:Landroid/animation/ValueAnimator;

    if-eqz v2, :cond_83

    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_83
    new-instance v2, Landroid/animation/RectEvaluator;

    invoke-direct {v2}, Landroid/animation/RectEvaluator;-><init>()V

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/animation/ValueAnimator;->ofObject(Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ValueAnimator;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    sget-object v0, Lgcl;->s:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v0, Lnl2;

    const/16 v1, 0x11

    invoke-direct {v0, p0, v1}, Lnl2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    iput-object p1, p0, Lgcl;->i:Landroid/animation/ValueAnimator;

    return-void
.end method
