.class public final Lydb;
.super Landroid/widget/ImageView;
.source "SourceFile"


# static fields
.field public static final synthetic H:I


# instance fields
.field public A:Landroid/view/GestureDetector;

.field public B:Lv35;

.field public C:Ld0b;

.field public D:Z

.field public E:Z

.field public F:Z

.field public G:J

.field public final a:Landroid/graphics/Matrix;

.field public final b:Landroid/graphics/Matrix;

.field public c:Landroid/graphics/Matrix;

.field public d:Lvr9;

.field public e:Z

.field public f:F

.field public g:F

.field public h:Z

.field public i:Z

.field public final j:Landroid/graphics/Matrix;

.field public final k:[F

.field public l:Z

.field public final m:I

.field public final n:I

.field public final o:I

.field public final p:Landroid/graphics/PointF;

.field public final q:Landroid/graphics/RectF;

.field public final r:Landroid/graphics/RectF;

.field public final s:Landroid/graphics/RectF;

.field public final t:Landroid/graphics/PointF;

.field public final u:Landroid/graphics/RectF;

.field public final v:Landroid/graphics/RectF;

.field public w:Landroid/animation/AnimatorSet;

.field public final x:I

.field public y:F

.field public z:Landroid/view/ScaleGestureDetector;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 7

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Lydb;->a:Landroid/graphics/Matrix;

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Lydb;->b:Landroid/graphics/Matrix;

    iput-object v0, p0, Lydb;->d:Lvr9;

    iput-boolean v1, p0, Lydb;->e:Z

    const/high16 v2, -0x40800000    # -1.0f

    iput v2, p0, Lydb;->f:F

    iput v2, p0, Lydb;->g:F

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Lydb;->j:Landroid/graphics/Matrix;

    const/16 v2, 0x9

    new-array v2, v2, [F

    iput-object v2, p0, Lydb;->k:[F

    const/4 v2, 0x3

    iput v2, p0, Lydb;->x:I

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2}, Landroid/graphics/PointF;-><init>()V

    iput-object v2, p0, Lydb;->p:Landroid/graphics/PointF;

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lydb;->q:Landroid/graphics/RectF;

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lydb;->r:Landroid/graphics/RectF;

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lydb;->s:Landroid/graphics/RectF;

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2}, Landroid/graphics/PointF;-><init>()V

    iput-object v2, p0, Lydb;->t:Landroid/graphics/PointF;

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lydb;->u:Landroid/graphics/RectF;

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lydb;->v:Landroid/graphics/RectF;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v2

    iput v2, p0, Lydb;->n:I

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result p1

    iput p1, p0, Lydb;->o:I

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/high16 v2, 0x10e0000

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Lydb;->m:I

    sget-object p1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    new-instance p1, Lv35;

    const/4 v2, 0x2

    invoke-direct {p1, p0, v2}, Lv35;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lydb;->B:Lv35;

    new-instance p1, Ld0b;

    invoke-direct {p1, p0}, Ld0b;-><init>(Lydb;)V

    iput-object p1, p0, Lydb;->C:Ld0b;

    new-instance p1, Landroid/view/ScaleGestureDetector;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lydb;->C:Ld0b;

    invoke-direct {p1, v2, v3}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object p1, p0, Lydb;->z:Landroid/view/ScaleGestureDetector;

    new-instance p1, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lydb;->B:Lv35;

    const/4 v4, 0x1

    invoke-direct {p1, v2, v3, v0, v4}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;Z)V

    iput-object p1, p0, Lydb;->A:Landroid/view/GestureDetector;

    iget-object p0, p0, Lydb;->z:Landroid/view/ScaleGestureDetector;

    invoke-virtual {p0, v1}, Landroid/view/ScaleGestureDetector;->setQuickScaleEnabled(Z)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_19

    iget-object v0, p0, Lydb;->b:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lydb;->c(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    iget v1, v0, Landroid/graphics/RectF;->left:F

    const/4 v2, 0x0

    cmpl-float v3, v1, v2

    if-nez v3, :cond_1a

    iget v3, v0, Landroid/graphics/RectF;->top:F

    cmpl-float v2, v3, v2

    if-nez v2, :cond_1a

    :cond_19
    return-void

    :cond_1a
    iget v0, v0, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0, v1, v0}, Lydb;->l(FF)V

    return-void
.end method

.method public final b(Landroid/graphics/Matrix;)Landroid/graphics/RectF;
    .registers 3

    invoke-virtual {p0, p1}, Lydb;->e(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    move-result-object p1

    iget-object v0, p0, Lydb;->q:Landroid/graphics/RectF;

    iget-object p0, p0, Lydb;->r:Landroid/graphics/RectF;

    invoke-virtual {p1, p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    return-object p0
.end method

.method public final c(Landroid/graphics/Matrix;)Landroid/graphics/RectF;
    .registers 9

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_d

    new-instance p0, Landroid/graphics/RectF;

    invoke-direct {p0, v1, v1, v1, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object p0

    :cond_d
    iget-object v0, p0, Lydb;->s:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-virtual {p0, p1}, Lydb;->b(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget-object p0, p0, Lydb;->u:Landroid/graphics/RectF;

    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    move-result v4

    cmpg-float v4, v2, v4

    const/high16 v5, 0x40000000    # 2.0f

    if-gez v4, :cond_37

    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    move-result v4

    sub-float/2addr v4, v2

    div-float/2addr v4, v5

    iget v2, p1, Landroid/graphics/RectF;->top:F

    iget v6, p0, Landroid/graphics/RectF;->top:F

    sub-float/2addr v2, v6

    :cond_35
    sub-float/2addr v4, v2

    goto :goto_4b

    :cond_37
    iget v2, p1, Landroid/graphics/RectF;->top:F

    iget v4, p0, Landroid/graphics/RectF;->top:F

    cmpl-float v6, v2, v4

    if-lez v6, :cond_42

    sub-float/2addr v2, v4

    neg-float v4, v2

    goto :goto_4b

    :cond_42
    iget v2, p1, Landroid/graphics/RectF;->bottom:F

    iget v4, p0, Landroid/graphics/RectF;->bottom:F

    cmpg-float v6, v2, v4

    if-ltz v6, :cond_35

    move v4, v1

    :goto_4b
    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    move-result v2

    cmpg-float v2, v3, v2

    if-gez v2, :cond_60

    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    move-result v2

    sub-float/2addr v2, v3

    div-float/2addr v2, v5

    iget p1, p1, Landroid/graphics/RectF;->left:F

    iget p0, p0, Landroid/graphics/RectF;->left:F

    sub-float/2addr p1, p0

    sub-float/2addr v2, p1

    goto :goto_77

    :cond_60
    iget v2, p1, Landroid/graphics/RectF;->left:F

    iget v3, p0, Landroid/graphics/RectF;->left:F

    cmpl-float v5, v2, v3

    if-lez v5, :cond_6b

    sub-float/2addr v2, v3

    neg-float v2, v2

    goto :goto_77

    :cond_6b
    iget p1, p1, Landroid/graphics/RectF;->right:F

    iget p0, p0, Landroid/graphics/RectF;->right:F

    cmpg-float v2, p1, p0

    if-gez v2, :cond_76

    sub-float v2, p0, p1

    goto :goto_77

    :cond_76
    move v2, v1

    :goto_77
    invoke-virtual {v0, v2, v4, v1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    return-object v0
.end method

.method public final d(I)F
    .registers 7

    const/4 v0, 0x2

    const/high16 v1, 0x3f800000    # 1.0f

    if-ne p1, v0, :cond_6

    return v1

    :cond_6
    const/4 v0, 0x3

    const/4 v2, 0x0

    iget-object v3, p0, Lydb;->a:Landroid/graphics/Matrix;

    if-ne p1, v0, :cond_17

    invoke-virtual {p0, v3, v2}, Lydb;->i(Landroid/graphics/Matrix;I)F

    move-result p0

    div-float p0, v1, p0

    invoke-static {v1, p0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    return p0

    :cond_17
    const/4 v0, 0x4

    iget-object v4, p0, Lydb;->q:Landroid/graphics/RectF;

    if-ne p1, v0, :cond_2c

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0, v3, v0}, Lydb;->i(Landroid/graphics/Matrix;I)F

    move-result p0

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v0

    :goto_29
    mul-float/2addr v0, p0

    div-float/2addr p1, v0

    return p1

    :cond_2c
    const/4 v0, 0x5

    if-ne p1, v0, :cond_3d

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0, v3, v2}, Lydb;->i(Landroid/graphics/Matrix;I)F

    move-result p0

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v0

    goto :goto_29

    :cond_3d
    invoke-virtual {p0, v3, v2}, Lydb;->i(Landroid/graphics/Matrix;I)F

    move-result p0

    div-float/2addr v1, p0

    return v1
.end method

.method public final e(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;
    .registers 3

    iget-object v0, p0, Lydb;->a:Landroid/graphics/Matrix;

    iget-object p0, p0, Lydb;->j:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    invoke-virtual {p0, p1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    return-object p0
.end method

.method public final f()F
    .registers 5

    iget v0, p0, Lydb;->f:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v1, v0, v1

    if-nez v1, :cond_30

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_11

    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_2e

    :cond_11
    iget-object v0, p0, Lydb;->q:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    iget-object v2, p0, Lydb;->u:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v3

    div-float/2addr v1, v3

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v0, v2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    const/high16 v1, 0x40800000    # 4.0f

    mul-float/2addr v0, v1

    :goto_2e
    iput v0, p0, Lydb;->f:F

    :cond_30
    return v0
.end method

.method public final g()F
    .registers 4

    iget v0, p0, Lydb;->g:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v1, v0, v1

    if-nez v1, :cond_21

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    if-nez v0, :cond_12

    move v0, v1

    goto :goto_1f

    :cond_12
    iget-object v0, p0, Lydb;->a:Landroid/graphics/Matrix;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lydb;->i(Landroid/graphics/Matrix;I)F

    move-result v0

    div-float v0, v1, v0

    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    :goto_1f
    iput v0, p0, Lydb;->g:F

    :cond_21
    return v0
.end method

.method public final getRotation()F
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final h()F
    .registers 3

    iget-object v0, p0, Lydb;->b:Landroid/graphics/Matrix;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lydb;->i(Landroid/graphics/Matrix;I)F

    move-result p0

    return p0
.end method

.method public final i(Landroid/graphics/Matrix;I)F
    .registers 3

    iget-object p0, p0, Lydb;->k:[F

    invoke-virtual {p1, p0}, Landroid/graphics/Matrix;->getValues([F)V

    aget p0, p0, p2

    return p0
.end method

.method public final j()V
    .registers 3

    invoke-virtual {p0}, Lydb;->g()F

    invoke-virtual {p0}, Lydb;->f()F

    invoke-virtual {p0}, Lydb;->f()F

    invoke-virtual {p0}, Lydb;->g()F

    invoke-virtual {p0}, Lydb;->f()F

    move-result v0

    invoke-virtual {p0}, Lydb;->g()F

    move-result v1

    sub-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    iput v0, p0, Lydb;->y:F

    return-void
.end method

.method public final k(DD)V
    .registers 6

    iget-object v0, p0, Lydb;->b:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lydb;->b(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    double-to-float p1, p1

    double-to-float p2, p3

    iget-object p3, p0, Lydb;->t:Landroid/graphics/PointF;

    invoke-virtual {p3, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    iget p1, p3, Landroid/graphics/PointF;->x:F

    const/4 p2, 0x0

    cmpl-float p4, p1, p2

    if-nez p4, :cond_1a

    iget p4, p3, Landroid/graphics/PointF;->y:F

    cmpl-float p2, p4, p2

    if-nez p2, :cond_1a

    return-void

    :cond_1a
    iget p2, p3, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0, p1, p2}, Lydb;->l(FF)V

    invoke-virtual {p0}, Lydb;->a()V

    return-void
.end method

.method public final l(FF)V
    .registers 5

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-nez v1, :cond_a

    cmpl-float v0, p2, v0

    if-nez v0, :cond_a

    return-void

    :cond_a
    iget-object v0, p0, Lydb;->b:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {p0, v0}, Lydb;->e(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    move-result-object p1

    invoke-virtual {p0, p1}, Lydb;->setImageMatrix(Landroid/graphics/Matrix;)V

    return-void
.end method

.method public final m(Landroid/graphics/drawable/Drawable;)V
    .registers 6

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    const/4 v1, 0x0

    if-gtz v0, :cond_11

    new-instance v0, Lvr9;

    const/16 v2, 0xd

    invoke-direct {v0, v2, p0, p1, v1}, Lvr9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iput-object v0, p0, Lydb;->d:Lvr9;

    return-void

    :cond_11
    iget-object v0, p0, Lydb;->a:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lydb;->g:F

    iput v0, p0, Lydb;->f:F

    iput-boolean v1, p0, Lydb;->i:Z

    iput-boolean v1, p0, Lydb;->h:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lydb;->l:Z

    iget-object v1, p0, Lydb;->q:Landroid/graphics/RectF;

    if-eqz p1, :cond_39

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p1

    int-to-float p1, p1

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v3, v2, p1}, Landroid/graphics/RectF;->set(FFFF)V

    goto :goto_3c

    :cond_39
    invoke-virtual {v1}, Landroid/graphics/RectF;->setEmpty()V

    :goto_3c
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    instance-of v1, p1, Lcom/opera/hype/image/editor/EditImage;

    if-eqz v1, :cond_53

    check-cast p1, Lcom/opera/hype/image/editor/EditImage;

    iget-object v1, p1, Lcom/opera/hype/image/editor/EditImage;->g:Lbpd;

    new-instance v2, Lws7;

    invoke-direct {v2, p1, v0}, Lws7;-><init>(Lcom/opera/hype/image/editor/EditImage;B)V

    invoke-virtual {v1, v2}, Lbpd;->c0(Lkotlin/jvm/functions/Function1;)Z

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    :cond_53
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public final n(F)V
    .registers 4

    invoke-virtual {p0}, Lydb;->f()F

    move-result v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_c

    invoke-virtual {p0}, Lydb;->f()F

    move-result p1

    :cond_c
    invoke-virtual {p0}, Lydb;->g()F

    move-result v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_18

    invoke-virtual {p0}, Lydb;->g()F

    move-result p1

    :cond_18
    iget-object v0, p0, Lydb;->p:Landroid/graphics/PointF;

    iget v1, v0, Landroid/graphics/PointF;->x:F

    iget v0, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0, p1, v1, v0}, Lydb;->o(FFF)V

    return-void
.end method

.method public final o(FFF)V
    .registers 5

    invoke-virtual {p0}, Lydb;->f()F

    move-result v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_c

    invoke-virtual {p0}, Lydb;->f()F

    move-result p1

    :cond_c
    invoke-virtual {p0}, Lydb;->h()F

    move-result v0

    div-float/2addr p1, v0

    iget-object v0, p0, Lydb;->b:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    invoke-virtual {p0, v0}, Lydb;->e(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    move-result-object p1

    invoke-virtual {p0, p1}, Lydb;->setImageMatrix(Landroid/graphics/Matrix;)V

    invoke-virtual {p0}, Lydb;->h()F

    invoke-virtual {p0}, Lydb;->a()V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-boolean p1, p0, Lydb;->e:Z

    if-eqz p1, :cond_20

    invoke-virtual {p0}, Lydb;->h()F

    move-result p1

    invoke-virtual {p0}, Lydb;->g()F

    move-result v0

    sub-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const v0, 0x3dcccccd    # 0.1f

    cmpl-float p1, p1, v0

    if-lez p1, :cond_1d

    const/4 p1, 0x1

    goto :goto_1e

    :cond_1d
    const/4 p1, 0x0

    :goto_1e
    iput-boolean p1, p0, Lydb;->e:Z

    :cond_20
    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 4

    invoke-virtual {p0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    if-ne v0, v1, :cond_12

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_11

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_11
    return-void

    :cond_12
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 23

    move-object/from16 v0, p0

    iget-object v1, v0, Lydb;->u:Landroid/graphics/RectF;

    if-eqz p1, :cond_3b

    iget-object v2, v0, Lydb;->v:Landroid/graphics/RectF;

    invoke-virtual {v2, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    move/from16 v3, p2

    int-to-float v4, v3

    move/from16 v5, p3

    int-to-float v6, v5

    move/from16 v7, p4

    int-to-float v8, v7

    move/from16 v9, p5

    int-to-float v10, v9

    invoke-virtual {v1, v4, v6, v8, v10}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    iget-object v6, v0, Lydb;->p:Landroid/graphics/PointF;

    iput v4, v6, Landroid/graphics/PointF;->x:F

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v4

    iput v4, v6, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v4

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v6

    sub-float/2addr v4, v6

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v6

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    sub-float/2addr v6, v2

    goto :goto_45

    :cond_3b
    move/from16 v3, p2

    move/from16 v5, p3

    move/from16 v7, p4

    move/from16 v9, p5

    const/4 v4, 0x0

    move v6, v4

    :goto_45
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    iget-object v2, v0, Lydb;->d:Lvr9;

    const/4 v3, 0x0

    if-eqz v2, :cond_52

    iput-object v3, v0, Lydb;->d:Lvr9;

    invoke-virtual {v2}, Lvr9;->run()V

    :cond_52
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/4 v5, 0x0

    if-eqz v2, :cond_17e

    if-nez p1, :cond_5f

    iget-boolean v2, v0, Lydb;->l:Z

    if-eqz v2, :cond_17d

    :cond_5f
    iget-boolean v2, v0, Lydb;->l:Z

    const/high16 v7, -0x40800000    # -1.0f

    iget-object v8, v0, Lydb;->a:Landroid/graphics/Matrix;

    if-eqz v2, :cond_78

    iput-boolean v5, v0, Lydb;->e:Z

    invoke-virtual {v8}, Landroid/graphics/Matrix;->reset()V

    iget-boolean v2, v0, Lydb;->i:Z

    if-nez v2, :cond_72

    iput v7, v0, Lydb;->g:F

    :cond_72
    iget-boolean v2, v0, Lydb;->h:Z

    if-nez v2, :cond_78

    iput v7, v0, Lydb;->f:F

    :cond_78
    iget v2, v0, Lydb;->x:I

    invoke-virtual {v0, v2}, Lydb;->d(I)F

    invoke-virtual {v0, v8, v5}, Lydb;->i(Landroid/graphics/Matrix;I)F

    move-result v9

    invoke-virtual {v0}, Lydb;->h()F

    move-result v10

    const/high16 v11, 0x3f800000    # 1.0f

    div-float v12, v11, v9

    invoke-static {v11, v12}, Ljava/lang/Math;->min(FF)F

    move-result v12

    iget-object v13, v0, Lydb;->q:Landroid/graphics/RectF;

    invoke-virtual {v13}, Landroid/graphics/RectF;->width()F

    move-result v14

    invoke-virtual {v13}, Landroid/graphics/RectF;->height()F

    move-result v13

    invoke-virtual {v8}, Landroid/graphics/Matrix;->reset()V

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v15

    div-float/2addr v15, v14

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v16

    div-float v11, v16, v13

    invoke-static {v15, v11}, Ljava/lang/Math;->min(FF)F

    move-result v11

    invoke-virtual {v8, v11, v11}, Landroid/graphics/Matrix;->postScale(FF)Z

    iget v15, v1, Landroid/graphics/RectF;->left:F

    move/from16 p3, v5

    iget v5, v1, Landroid/graphics/RectF;->top:F

    invoke-virtual {v8, v15, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v5

    mul-float/2addr v14, v11

    sub-float/2addr v5, v14

    const/high16 v14, 0x40000000    # 2.0f

    div-float/2addr v5, v14

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    mul-float/2addr v13, v11

    sub-float/2addr v1, v13

    div-float/2addr v1, v14

    invoke-virtual {v8, v5, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v1, v0, Lydb;->k:[F

    invoke-virtual {v8, v1}, Landroid/graphics/Matrix;->getValues([F)V

    aget v5, v1, p3

    invoke-virtual {v8, v1}, Landroid/graphics/Matrix;->getValues([F)V

    const/4 v5, 0x4

    aget v5, v1, v5

    invoke-virtual {v8, v1}, Landroid/graphics/Matrix;->getValues([F)V

    const/4 v5, 0x2

    aget v5, v1, v5

    invoke-virtual {v8, v1}, Landroid/graphics/Matrix;->getValues([F)V

    const/4 v5, 0x5

    aget v5, v1, v5

    invoke-virtual {v8, v1}, Landroid/graphics/Matrix;->getValues([F)V

    aget v1, v1, p3

    iget-boolean v5, v0, Lydb;->l:Z

    iget-object v8, v0, Lydb;->b:Landroid/graphics/Matrix;

    if-nez v5, :cond_12d

    if-eqz p1, :cond_12a

    iget-boolean v3, v0, Lydb;->i:Z

    if-nez v3, :cond_f4

    iput v7, v0, Lydb;->g:F

    :cond_f4
    iget-boolean v3, v0, Lydb;->h:Z

    if-nez v3, :cond_fa

    iput v7, v0, Lydb;->f:F

    :cond_fa
    invoke-virtual {v0, v8}, Lydb;->e(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {v0, v3}, Lydb;->setImageMatrix(Landroid/graphics/Matrix;)V

    neg-float v3, v4

    neg-float v4, v6

    invoke-virtual {v0, v3, v4}, Lydb;->l(FF)V

    iget-boolean v3, v0, Lydb;->e:Z

    if-nez v3, :cond_113

    invoke-virtual {v0, v2}, Lydb;->d(I)F

    move-result v1

    invoke-virtual {v0, v1}, Lydb;->n(F)V

    move v11, v1

    goto :goto_156

    :cond_113
    sub-float v2, v10, v12

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const v3, 0x3dcccccd    # 0.1f

    cmpl-float v2, v2, v3

    if-lez v2, :cond_124

    div-float/2addr v9, v1

    mul-float v11, v9, v10

    goto :goto_126

    :cond_124
    const/high16 v11, 0x3f800000    # 1.0f

    :goto_126
    invoke-virtual {v0, v11}, Lydb;->n(F)V

    goto :goto_156

    :cond_12a
    const/high16 v11, 0x3f800000    # 1.0f

    goto :goto_156

    :cond_12d
    iget-object v1, v0, Lydb;->c:Landroid/graphics/Matrix;

    if-eqz v1, :cond_13c

    invoke-virtual {v8, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    iput-object v3, v0, Lydb;->c:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Lydb;->h()F

    move-result v1

    :goto_13a
    move v11, v1

    goto :goto_144

    :cond_13c
    invoke-virtual {v8}, Landroid/graphics/Matrix;->reset()V

    invoke-virtual {v0, v2}, Lydb;->d(I)F

    move-result v1

    goto :goto_13a

    :goto_144
    invoke-virtual {v0, v8}, Lydb;->e(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v0, v1}, Lydb;->setImageMatrix(Landroid/graphics/Matrix;)V

    invoke-virtual {v0}, Lydb;->h()F

    move-result v1

    cmpl-float v1, v11, v1

    if-eqz v1, :cond_156

    invoke-virtual {v0, v11}, Lydb;->n(F)V

    :cond_156
    :goto_156
    invoke-virtual {v0}, Lydb;->f()F

    move-result v1

    cmpl-float v1, v11, v1

    if-gtz v1, :cond_166

    invoke-virtual {v0}, Lydb;->g()F

    move-result v1

    cmpg-float v1, v11, v1

    if-gez v1, :cond_169

    :cond_166
    invoke-virtual {v0, v11}, Lydb;->n(F)V

    :cond_169
    invoke-virtual {v0}, Lydb;->a()V

    iget-boolean v1, v0, Lydb;->l:Z

    if-nez p1, :cond_172

    if-eqz v1, :cond_175

    :cond_172
    invoke-virtual {v0}, Lydb;->j()V

    :cond_175
    iget-boolean v1, v0, Lydb;->l:Z

    if-eqz v1, :cond_17d

    move/from16 v1, p3

    iput-boolean v1, v0, Lydb;->l:Z

    :cond_17d
    return-void

    :cond_17e
    iget-boolean v1, v0, Lydb;->l:Z

    if-nez p1, :cond_184

    if-eqz v1, :cond_187

    :cond_184
    invoke-virtual {v0}, Lydb;->j()V

    :cond_187
    iget-boolean v1, v0, Lydb;->l:Z

    if-eqz v1, :cond_18e

    const/4 v1, 0x0

    iput-boolean v1, v0, Lydb;->l:Z

    :cond_18e
    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 9

    iget-boolean v0, p0, Lydb;->l:Z

    if-nez v0, :cond_2a

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_11

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v1

    iput-wide v1, p0, Lydb;->G:J

    :cond_11
    iget-object v1, p0, Lydb;->z:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v1, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object v1, p0, Lydb;->z:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v1}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v1

    if-nez v1, :cond_23

    iget-object v1, p0, Lydb;->A:Landroid/view/GestureDetector;

    invoke-virtual {v1, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    :cond_23
    const/4 p1, 0x1

    if-ne v0, p1, :cond_48

    iget-boolean v0, p0, Lydb;->l:Z

    if-eqz v0, :cond_2c

    :cond_2a
    const/4 p0, 0x0

    return p0

    :cond_2c
    invoke-virtual {p0}, Lydb;->h()F

    move-result v0

    invoke-virtual {p0}, Lydb;->g()F

    move-result v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_48

    invoke-virtual {p0}, Lydb;->g()F

    move-result v2

    iget-object v0, p0, Lydb;->p:Landroid/graphics/PointF;

    iget v3, v0, Landroid/graphics/PointF;->x:F

    iget v4, v0, Landroid/graphics/PointF;->y:F

    const-wide/16 v5, 0x32

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lydb;->p(FFFJ)V

    :cond_48
    return p1
.end method

.method public final p(FFFJ)V
    .registers 9

    invoke-virtual {p0}, Lydb;->f()F

    move-result v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_c

    invoke-virtual {p0}, Lydb;->f()F

    move-result p1

    :cond_c
    invoke-virtual {p0}, Lydb;->h()F

    move-result v0

    new-instance v1, Landroid/graphics/Matrix;

    iget-object v2, p0, Lydb;->b:Landroid/graphics/Matrix;

    invoke-direct {v1, v2}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    invoke-virtual {v1, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    invoke-virtual {p0, v1}, Lydb;->c(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v1

    iget v2, v1, Landroid/graphics/RectF;->left:F

    mul-float/2addr v2, p1

    add-float/2addr v2, p2

    iget p2, v1, Landroid/graphics/RectF;->top:F

    mul-float/2addr p2, p1

    add-float/2addr p2, p3

    iget-object p3, p0, Lydb;->w:Landroid/animation/AnimatorSet;

    if-eqz p3, :cond_30

    invoke-virtual {p3}, Landroid/animation/Animator;->cancel()V

    const/4 p3, 0x0

    iput-object p3, p0, Lydb;->w:Landroid/animation/AnimatorSet;

    :cond_30
    const/4 p3, 0x2

    new-array p3, p3, [F

    const/4 v1, 0x0

    aput v0, p3, v1

    const/4 v0, 0x1

    aput p1, p3, v0

    invoke-static {p3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    invoke-virtual {p1, p4, p5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance p3, Landroid/view/animation/DecelerateInterpolator;

    const/high16 p4, 0x3f800000    # 1.0f

    invoke-direct {p3, p4}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {p1, p3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance p3, Lf0b;

    invoke-direct {p3, p0, v2, p2}, Lf0b;-><init>(Lydb;FF)V

    invoke-virtual {p1, p3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public final setImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 4

    if-eqz p1, :cond_27

    new-instance v0, Lqp8;

    invoke-direct {v0}, Landroid/graphics/drawable/Drawable;-><init>()V

    iput-object p1, v0, Lqp8;->a:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iput v1, v0, Lqp8;->c:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    iput p1, v0, Lqp8;->d:I

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, v0, Lqp8;->b:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setDither(Z)V

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    invoke-virtual {p0, v0}, Lydb;->m(Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_27
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lydb;->m(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    invoke-virtual {p0, p1}, Lydb;->m(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final setImageMatrix(Landroid/graphics/Matrix;)V
    .registers 4

    invoke-virtual {p0}, Landroid/widget/ImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    const/4 v1, 0x1

    if-nez p1, :cond_e

    invoke-virtual {v0}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v0

    if-eqz v0, :cond_14

    goto :goto_16

    :cond_e
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    :cond_14
    move v0, v1

    goto :goto_17

    :cond_16
    :goto_16
    const/4 v0, 0x0

    :goto_17
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    if-eqz v0, :cond_33

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of p1, p0, Lcom/opera/hype/image/editor/EditImage;

    if-eqz p1, :cond_33

    check-cast p0, Lcom/opera/hype/image/editor/EditImage;

    iget-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->g:Lbpd;

    new-instance v0, Lws7;

    invoke-direct {v0, p0, v1}, Lws7;-><init>(Lcom/opera/hype/image/editor/EditImage;B)V

    invoke-virtual {p1, v0}, Lbpd;->c0(Lkotlin/jvm/functions/Function1;)Z

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_33
    return-void
.end method

.method public final setImageResource(I)V
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lydb;->m(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
