.class public Ll/t31;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Ll/nn50;
.implements Ll/zl50;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/t31$c;,
        Ll/t31$d;
    }
.end annotation


# instance fields
.field public final a:[F

.field public final b:Landroid/graphics/RectF;

.field public final c:Landroid/view/animation/Interpolator;

.field public d:F

.field public e:F

.field public f:F

.field public g:F

.field public h:J

.field public i:Ll/t0e0;

.field public j:Ll/i5e;

.field public k:Ll/lmj;

.field public l:Z

.field public m:Z

.field public n:I

.field public final o:Landroid/graphics/Matrix;

.field public p:I

.field public q:I

.field public r:Ll/t31$d;

.field public s:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/facebook/drawee/view/DraweeView<",
            "Ll/wlj;",
            ">;>;"
        }
    .end annotation
.end field

.field public t:Ll/fp50;

.field public u:Landroid/view/View$OnLongClickListener;

.field public v:Ll/am50;

.field public w:Z

.field public x:Z

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>(Lcom/facebook/drawee/view/DraweeView;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/drawee/view/DraweeView<",
            "Ll/wlj;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x9

    .line 5
    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    iput-object v0, p0, Ll/t31;->a:[F

    .line 9
    .line 10
    new-instance v0, Landroid/graphics/RectF;

    .line 11
    .line 12
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/t31;->b:Landroid/graphics/RectF;

    .line 16
    .line 17
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 18
    .line 19
    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/t31;->c:Landroid/view/animation/Interpolator;

    .line 23
    .line 24
    const/high16 v0, 0x3f800000    # 1.0f

    .line 25
    .line 26
    iput v0, p0, Ll/t31;->d:F

    .line 27
    .line 28
    const/high16 v0, 0x3fe00000    # 1.75f

    .line 29
    .line 30
    iput v0, p0, Ll/t31;->e:F

    .line 31
    .line 32
    const/high16 v0, 0x40400000    # 3.0f

    .line 33
    .line 34
    iput v0, p0, Ll/t31;->f:F

    .line 35
    .line 36
    iput v0, p0, Ll/t31;->g:F

    .line 37
    .line 38
    const-wide/16 v0, 0xc8

    .line 39
    .line 40
    iput-wide v0, p0, Ll/t31;->h:J

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    iput-boolean v0, p0, Ll/t31;->l:Z

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    iput-boolean v1, p0, Ll/t31;->m:Z

    .line 47
    .line 48
    const/4 v1, 0x2

    .line 49
    iput v1, p0, Ll/t31;->n:I

    .line 50
    .line 51
    new-instance v1, Landroid/graphics/Matrix;

    .line 52
    .line 53
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v1, p0, Ll/t31;->o:Landroid/graphics/Matrix;

    .line 57
    .line 58
    const/4 v1, -0x1

    .line 59
    iput v1, p0, Ll/t31;->p:I

    .line 60
    .line 61
    iput v1, p0, Ll/t31;->q:I

    .line 62
    .line 63
    iput-boolean v0, p0, Ll/t31;->x:Z

    .line 64
    .line 65
    iput-boolean v0, p0, Ll/t31;->y:Z

    .line 66
    .line 67
    iput-boolean v0, p0, Ll/t31;->z:Z

    .line 68
    .line 69
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 70
    .line 71
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Ll/t31;->s:Ljava/lang/ref/WeakReference;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Ll/wlj;

    .line 81
    .line 82
    sget-object v1, Ll/h1e0;->e:Ll/h1e0;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ll/wlj;->w(Ll/h1e0;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 88
    .line 89
    .line 90
    new-instance v0, Ll/t0e0;

    .line 91
    .line 92
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-direct {v0, v1, p0}, Ll/t0e0;-><init>(Landroid/content/Context;Ll/nn50;)V

    .line 97
    .line 98
    .line 99
    iput-object v0, p0, Ll/t31;->i:Ll/t0e0;

    .line 100
    .line 101
    new-instance v0, Ll/i5e;

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/t31;->D()Ll/zl50;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-direct {v0, v1, v2}, Ll/i5e;-><init>(Ll/zl50;Landroid/content/Context;)V

    .line 112
    .line 113
    .line 114
    iput-object v0, p0, Ll/t31;->j:Ll/i5e;

    .line 115
    .line 116
    new-instance v0, Ll/lmj;

    .line 117
    .line 118
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    new-instance v1, Ll/t31$a;

    .line 123
    .line 124
    invoke-direct {v1, p0}, Ll/t31$a;-><init>(Ll/t31;)V

    .line 125
    .line 126
    .line 127
    invoke-direct {v0, p1, v1}, Ll/lmj;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 128
    .line 129
    .line 130
    iput-object v0, p0, Ll/t31;->k:Ll/lmj;

    .line 131
    .line 132
    new-instance p1, Ll/rqd;

    .line 133
    .line 134
    invoke-direct {p1, p0}, Ll/rqd;-><init>(Ll/t31;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0, p1}, Ll/lmj;->b(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public static synthetic g(Ll/t31;FFLcom/facebook/drawee/view/DraweeView;FLandroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/t31;->J(FFLcom/facebook/drawee/view/DraweeView;FLandroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic h(Ll/t31;)Ll/i5e;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t31;->j:Ll/i5e;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/t31;)Landroid/view/View$OnLongClickListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t31;->u:Landroid/view/View$OnLongClickListener;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/t31;)Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t31;->o:Landroid/graphics/Matrix;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/t31;)Ll/am50;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t31;->v:Ll/am50;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/t31;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/t31;->h:J

    return-wide v0
.end method

.method public static bridge synthetic m(Ll/t31;)Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t31;->c:Landroid/view/animation/Interpolator;

    return-object p0
.end method

.method public static bridge synthetic n(Ll/t31;Landroid/view/View;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t31;->L(Landroid/view/View;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static s(FFF)V
    .locals 0

    .line 1
    cmpl-float p0, p0, p1

    .line 2
    .line 3
    if-gez p0, :cond_1

    .line 4
    .line 5
    cmpl-float p0, p1, p2

    .line 6
    .line 7
    if-gez p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-string p0, "MidZoom has to be less than MaxZoom"

    .line 11
    .line 12
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    const-string p0, "MinZoom has to be less than MidZoom"

    .line 17
    .line 18
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public A()F
    .locals 0

    .line 1
    iget p0, p0, Ll/t31;->e:F

    .line 2
    .line 3
    return p0
.end method

.method public C()F
    .locals 0

    .line 1
    iget p0, p0, Ll/t31;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public D()Ll/zl50;
    .locals 0

    .line 1
    return-object p0
.end method

.method public E()Ll/cn50;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public F()Ll/fp50;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t31;->t:Ll/fp50;

    .line 2
    .line 3
    return-object p0
.end method

.method public G()F
    .locals 6

    .line 1
    iget-object v0, p0, Ll/t31;->o:Landroid/graphics/Matrix;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/t31;->y(Landroid/graphics/Matrix;I)F

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    float-to-double v0, v0

    .line 9
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    double-to-float v0, v0

    .line 16
    iget-object v1, p0, Ll/t31;->o:Landroid/graphics/Matrix;

    .line 17
    .line 18
    const/4 v4, 0x3

    .line 19
    invoke-virtual {p0, v1, v4}, Ll/t31;->y(Landroid/graphics/Matrix;I)F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    float-to-double v4, p0

    .line 24
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    double-to-float p0, v1

    .line 29
    add-float/2addr v0, p0

    .line 30
    float-to-double v0, v0

    .line 31
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    double-to-float p0, v0

    .line 36
    return p0
.end method

.method public final H()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sub-int/2addr v0, v1

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    sub-int/2addr v0, p0

    .line 21
    return v0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public final I()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sub-int/2addr v0, v1

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    sub-int/2addr v0, p0

    .line 21
    return v0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public final synthetic J(FFLcom/facebook/drawee/view/DraweeView;FLandroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p6}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    mul-float/2addr v0, p1

    .line 6
    sub-float/2addr p1, v0

    .line 7
    invoke-virtual {p6}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 8
    .line 9
    .line 10
    move-result p6

    .line 11
    mul-float/2addr p6, p2

    .line 12
    sub-float/2addr p2, p6

    .line 13
    invoke-virtual {p3, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p3, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 17
    .line 18
    .line 19
    const/high16 p6, 0x3f800000    # 1.0f

    .line 20
    .line 21
    sub-float/2addr p6, p4

    .line 22
    invoke-virtual {p5}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 23
    .line 24
    .line 25
    move-result p5

    .line 26
    mul-float/2addr p6, p5

    .line 27
    add-float/2addr p4, p6

    .line 28
    invoke-virtual {p3, p4}, Landroid/view/View;->setScaleX(F)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p3, p4}, Landroid/view/View;->setScaleY(F)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/t31;->v:Ll/am50;

    .line 35
    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    invoke-interface {p0, p1, p2}, Ll/am50;->c(FF)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public K()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/t31;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final L(Landroid/view/View;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final M()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t31;->o:Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/t31;->q()Z

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public N(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/t31;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public O(Ll/i5e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t31;->j:Ll/i5e;

    .line 2
    .line 3
    return-void
.end method

.method public P(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/t31;->g:F

    .line 2
    .line 3
    return-void
.end method

.method public Q(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/t31;->w:Z

    .line 2
    .line 3
    return-void
.end method

.method public R(F)V
    .locals 2

    .line 1
    iget v0, p0, Ll/t31;->d:F

    .line 2
    .line 3
    iget v1, p0, Ll/t31;->e:F

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, Ll/t31;->s(FFF)V

    .line 6
    .line 7
    .line 8
    iput p1, p0, Ll/t31;->f:F

    .line 9
    .line 10
    return-void
.end method

.method public S(F)V
    .locals 2

    .line 1
    iget v0, p0, Ll/t31;->d:F

    .line 2
    .line 3
    iget v1, p0, Ll/t31;->f:F

    .line 4
    .line 5
    invoke-static {v0, p1, v1}, Ll/t31;->s(FFF)V

    .line 6
    .line 7
    .line 8
    iput p1, p0, Ll/t31;->e:F

    .line 9
    .line 10
    return-void
.end method

.method public T(F)V
    .locals 2

    .line 1
    iget v0, p0, Ll/t31;->e:F

    .line 2
    .line 3
    iget v1, p0, Ll/t31;->f:F

    .line 4
    .line 5
    invoke-static {p1, v0, v1}, Ll/t31;->s(FFF)V

    .line 6
    .line 7
    .line 8
    iput p1, p0, Ll/t31;->d:F

    .line 9
    .line 10
    return-void
.end method

.method public U(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t31;->k:Ll/lmj;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/lmj;->b(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p1, Ll/rqd;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Ll/rqd;-><init>(Ll/t31;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/lmj;->b(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public V(Ll/am50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t31;->v:Ll/am50;

    .line 2
    .line 3
    return-void
.end method

.method public W(Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t31;->u:Landroid/view/View$OnLongClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public X(Ll/cn50;)V
    .locals 0

    .line 1
    return-void
.end method

.method public Y(Ll/mn50;)V
    .locals 0

    .line 1
    return-void
.end method

.method public Z(Ll/fp50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t31;->t:Ll/fp50;

    .line 2
    .line 3
    return-void
.end method

.method public a(FF)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/t31;->G()F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget v2, p0, Ll/t31;->f:F

    .line 12
    .line 13
    cmpg-float v1, v1, v2

    .line 14
    .line 15
    if-gtz v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    iput-boolean v1, p0, Ll/t31;->x:Z

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 24
    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    cmpl-float v1, p2, v1

    .line 28
    .line 29
    if-lez v1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/bnl0;->w0()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    int-to-float v1, v1

    .line 36
    invoke-static {}, Ll/bnl0;->w0()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    int-to-float v2, v2

    .line 41
    add-float/2addr v2, p2

    .line 42
    div-float/2addr v1, v2

    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 47
    .line 48
    .line 49
    :cond_0
    iget-object p0, p0, Ll/t31;->v:Ll/am50;

    .line 50
    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    invoke-interface {p0, p1, p2}, Ll/am50;->c(FF)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public a0(F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/t31;->c0(FZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public b(FFFF)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p2, Ll/t31$d;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-direct {p2, p0, v0}, Ll/t31$d;-><init>(Ll/t31;Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    iput-object p2, p0, Ll/t31;->r:Ll/t31$d;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/t31;->I()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p0}, Ll/t31;->H()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    float-to-int p3, p3

    .line 28
    float-to-int p4, p4

    .line 29
    invoke-virtual {p2, v0, v1, p3, p4}, Ll/t31$d;->b(IIII)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/t31;->r:Ll/t31$d;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public b0(FFFZ)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget v1, p0, Ll/t31;->d:F

    .line 8
    .line 9
    cmpg-float v1, p1, v1

    .line 10
    .line 11
    if-ltz v1, :cond_2

    .line 12
    .line 13
    iget v1, p0, Ll/t31;->f:F

    .line 14
    .line 15
    cmpl-float v1, p1, v1

    .line 16
    .line 17
    if-lez v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    if-eqz p4, :cond_1

    .line 21
    .line 22
    new-instance v2, Ll/t31$c;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/t31;->G()F

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    move-object v3, p0

    .line 29
    move v5, p1

    .line 30
    move v6, p2

    .line 31
    move v7, p3

    .line 32
    invoke-direct/range {v2 .. v7}, Ll/t31$c;-><init>(Ll/t31;FFFF)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    move-object v3, p0

    .line 40
    move v5, p1

    .line 41
    move v6, p2

    .line 42
    move v7, p3

    .line 43
    iget-object p0, v3, Ll/t31;->o:Landroid/graphics/Matrix;

    .line 44
    .line 45
    invoke-virtual {p0, v5, v5, v6, v7}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3}, Ll/t31;->p()V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    return-void
.end method

.method public c(FF)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/t31;->w:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-interface {p0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    invoke-virtual {p0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_6

    .line 26
    .line 27
    iget-object v2, p0, Ll/t31;->i:Ll/t0e0;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/t0e0;->d()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_6

    .line 34
    .line 35
    iget-object v2, p0, Ll/t31;->o:Landroid/graphics/Matrix;

    .line 36
    .line 37
    invoke-virtual {v2, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/t31;->p()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    if-nez p2, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    iget-boolean v0, p0, Ll/t31;->m:Z

    .line 51
    .line 52
    const/4 v2, 0x1

    .line 53
    if-eqz v0, :cond_5

    .line 54
    .line 55
    iget-object v0, p0, Ll/t31;->i:Ll/t0e0;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/t0e0;->d()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_5

    .line 62
    .line 63
    iget-boolean v0, p0, Ll/t31;->l:Z

    .line 64
    .line 65
    if-nez v0, :cond_5

    .line 66
    .line 67
    iget p0, p0, Ll/t31;->n:I

    .line 68
    .line 69
    const/4 v0, 0x2

    .line 70
    if-eq p0, v0, :cond_4

    .line 71
    .line 72
    if-nez p0, :cond_3

    .line 73
    .line 74
    const/high16 v0, 0x3f800000    # 1.0f

    .line 75
    .line 76
    cmpl-float v0, p1, v0

    .line 77
    .line 78
    if-gez v0, :cond_4

    .line 79
    .line 80
    :cond_3
    if-ne p0, v2, :cond_6

    .line 81
    .line 82
    const/high16 p0, -0x40800000    # -1.0f

    .line 83
    .line 84
    cmpg-float p0, p1, p0

    .line 85
    .line 86
    if-gtz p0, :cond_6

    .line 87
    .line 88
    :cond_4
    invoke-interface {p2, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_5
    invoke-interface {p2, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 93
    .line 94
    .line 95
    :cond_6
    :goto_0
    return-void
.end method

.method public c0(FZ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    div-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    int-to-float v0, v0

    .line 14
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    div-int/lit8 p2, p2, 0x2

    .line 19
    .line 20
    int-to-float p2, p2

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {p0, p1, v0, p2, v1}, Ll/t31;->b0(FFFZ)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/t31;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d0(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-gez v0, :cond_0

    .line 6
    .line 7
    const-wide/16 p1, 0xc8

    .line 8
    .line 9
    :cond_0
    iput-wide p1, p0, Ll/t31;->h:J

    .line 10
    .line 11
    return-void
.end method

.method public e(Z)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/t31;->y:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 5
    .line 6
    .line 7
    move-result-object v5

    .line 8
    if-eqz v5, :cond_2

    .line 9
    .line 10
    iget-boolean v0, p0, Ll/t31;->x:Z

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/t31;->v:Ll/am50;

    .line 17
    .line 18
    if-eqz p0, :cond_2

    .line 19
    .line 20
    invoke-interface {p0}, Ll/am50;->d()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {v5}, Landroid/view/View;->getTranslationX()F

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-virtual {v5}, Landroid/view/View;->getTranslationY()F

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    invoke-virtual {v5}, Landroid/view/View;->getScaleX()F

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    const/4 p1, 0x0

    .line 37
    cmpl-float v0, v3, p1

    .line 38
    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    cmpl-float p1, v4, p1

    .line 42
    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    :cond_1
    const/4 p1, 0x2

    .line 46
    new-array p1, p1, [F

    .line 47
    .line 48
    fill-array-data p1, :array_0

    .line 49
    .line 50
    .line 51
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const-wide/16 v0, 0x64

    .line 56
    .line 57
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    .line 60
    move-result-object v7

    .line 61
    new-instance p1, Landroid/view/animation/AccelerateInterpolator;

    .line 62
    .line 63
    const/high16 v0, 0x40000000    # 2.0f

    .line 64
    .line 65
    invoke-direct {p1, v0}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v7, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 69
    .line 70
    .line 71
    new-instance v1, Ll/s31;

    .line 72
    .line 73
    move-object v2, p0

    .line 74
    invoke-direct/range {v1 .. v7}, Ll/s31;-><init>(Ll/t31;FFLcom/facebook/drawee/view/DraweeView;FLandroid/animation/ValueAnimator;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v7, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 78
    .line 79
    .line 80
    new-instance p0, Ll/t31$b;

    .line 81
    .line 82
    invoke-direct {p0, v2, v5}, Ll/t31$b;-><init>(Ll/t31;Lcom/facebook/drawee/view/DraweeView;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v7, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v7}, Landroid/animation/ValueAnimator;->start()V

    .line 89
    .line 90
    .line 91
    :cond_2
    return-void

    .line 92
    nop

    .line 93
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public e0(II)V
    .locals 0

    .line 1
    iput p1, p0, Ll/t31;->q:I

    .line 2
    .line 3
    iput p2, p0, Ll/t31;->p:I

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/t31;->f0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f(FFF)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/t31;->w:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/t31;->G()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget v1, p0, Ll/t31;->f:F

    .line 11
    .line 12
    cmpg-float v0, v0, v1

    .line 13
    .line 14
    if-ltz v0, :cond_2

    .line 15
    .line 16
    const/high16 v0, 0x3f800000    # 1.0f

    .line 17
    .line 18
    cmpg-float v0, p1, v0

    .line 19
    .line 20
    if-gez v0, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    :goto_0
    return-void

    .line 24
    :cond_2
    :goto_1
    iget-object v0, p0, Ll/t31;->o:Landroid/graphics/Matrix;

    .line 25
    .line 26
    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/t31;->p()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final f0()V
    .locals 2

    .line 1
    iget v0, p0, Ll/t31;->q:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget v0, p0, Ll/t31;->p:I

    .line 7
    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/t31;->M()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final o()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t31;->r:Ll/t31$d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/t31$d;->a()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/t31;->r:Ll/t31$d;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/t31;->z:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/t31;->v:Ll/am50;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-boolean v0, p0, Ll/t31;->y:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/t31;->j:Ll/i5e;

    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ll/i5e;->b(Landroid/view/MotionEvent;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v0, v1

    .line 22
    :goto_0
    invoke-static {p2}, Ll/u610;->c(Landroid/view/MotionEvent;)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const/4 v3, 0x1

    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    if-eq v2, v3, :cond_1

    .line 30
    .line 31
    const/4 v4, 0x3

    .line 32
    if-eq v2, v4, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_4

    .line 40
    .line 41
    invoke-interface {p1, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    iput-boolean v1, p0, Ll/t31;->z:Z

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    if-eqz p1, :cond_3

    .line 52
    .line 53
    invoke-interface {p1, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 54
    .line 55
    .line 56
    :cond_3
    invoke-virtual {p0}, Ll/t31;->o()V

    .line 57
    .line 58
    .line 59
    :cond_4
    :goto_1
    iget-object p1, p0, Ll/t31;->i:Ll/t0e0;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/t0e0;->d()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    iget-object v2, p0, Ll/t31;->i:Ll/t0e0;

    .line 66
    .line 67
    invoke-virtual {v2}, Ll/t0e0;->c()Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    iget-boolean v4, p0, Ll/t31;->x:Z

    .line 72
    .line 73
    if-nez v4, :cond_5

    .line 74
    .line 75
    iget-object v0, p0, Ll/t31;->i:Ll/t0e0;

    .line 76
    .line 77
    invoke-virtual {v0, p2}, Ll/t0e0;->g(Landroid/view/MotionEvent;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    :cond_5
    if-nez p1, :cond_6

    .line 82
    .line 83
    iget-object p1, p0, Ll/t31;->i:Ll/t0e0;

    .line 84
    .line 85
    invoke-virtual {p1}, Ll/t0e0;->d()Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-nez p1, :cond_6

    .line 90
    .line 91
    move p1, v3

    .line 92
    goto :goto_2

    .line 93
    :cond_6
    move p1, v1

    .line 94
    :goto_2
    if-nez v2, :cond_7

    .line 95
    .line 96
    iget-object v2, p0, Ll/t31;->i:Ll/t0e0;

    .line 97
    .line 98
    invoke-virtual {v2}, Ll/t0e0;->c()Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-nez v2, :cond_7

    .line 103
    .line 104
    move v2, v3

    .line 105
    goto :goto_3

    .line 106
    :cond_7
    move v2, v1

    .line 107
    :goto_3
    if-eqz p1, :cond_8

    .line 108
    .line 109
    if-eqz v2, :cond_8

    .line 110
    .line 111
    move v1, v3

    .line 112
    :cond_8
    iput-boolean v1, p0, Ll/t31;->l:Z

    .line 113
    .line 114
    iget-object p0, p0, Ll/t31;->k:Ll/lmj;

    .line 115
    .line 116
    invoke-virtual {p0, p2}, Ll/lmj;->a(Landroid/view/MotionEvent;)Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    if-eqz p0, :cond_9

    .line 121
    .line 122
    return v3

    .line 123
    :cond_9
    return v0
.end method

.method public p()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/t31;->q()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public q()Z
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/t31;->w()Landroid/graphics/Matrix;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/t31;->u(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {p0}, Ll/t31;->H()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    int-to-float v4, v4

    .line 26
    cmpg-float v5, v2, v4

    .line 27
    .line 28
    iget v6, v0, Landroid/graphics/RectF;->top:F

    .line 29
    .line 30
    const/high16 v7, 0x40000000    # 2.0f

    .line 31
    .line 32
    const/4 v8, 0x0

    .line 33
    if-gtz v5, :cond_1

    .line 34
    .line 35
    sub-float/2addr v4, v2

    .line 36
    div-float/2addr v4, v7

    .line 37
    sub-float/2addr v4, v6

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    cmpl-float v2, v6, v8

    .line 40
    .line 41
    if-lez v2, :cond_2

    .line 42
    .line 43
    neg-float v4, v6

    .line 44
    goto :goto_0

    .line 45
    :cond_2
    iget v2, v0, Landroid/graphics/RectF;->bottom:F

    .line 46
    .line 47
    cmpg-float v5, v2, v4

    .line 48
    .line 49
    if-gez v5, :cond_3

    .line 50
    .line 51
    sub-float/2addr v4, v2

    .line 52
    goto :goto_0

    .line 53
    :cond_3
    move v4, v8

    .line 54
    :goto_0
    invoke-virtual {p0}, Ll/t31;->I()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    iput-boolean v1, p0, Ll/t31;->y:Z

    .line 59
    .line 60
    float-to-int v5, v3

    .line 61
    iget v6, v0, Landroid/graphics/RectF;->left:F

    .line 62
    .line 63
    const/4 v9, 0x1

    .line 64
    if-gt v5, v2, :cond_5

    .line 65
    .line 66
    int-to-float v1, v2

    .line 67
    sub-float/2addr v1, v3

    .line 68
    div-float/2addr v1, v7

    .line 69
    sub-float/2addr v1, v6

    .line 70
    const/4 v2, 0x2

    .line 71
    iput v2, p0, Ll/t31;->n:I

    .line 72
    .line 73
    iget v0, v0, Landroid/graphics/RectF;->top:F

    .line 74
    .line 75
    cmpl-float v0, v0, v8

    .line 76
    .line 77
    if-ltz v0, :cond_4

    .line 78
    .line 79
    iput-boolean v9, p0, Ll/t31;->y:Z

    .line 80
    .line 81
    :cond_4
    move v8, v1

    .line 82
    goto :goto_1

    .line 83
    :cond_5
    cmpl-float v3, v6, v8

    .line 84
    .line 85
    if-lez v3, :cond_6

    .line 86
    .line 87
    neg-float v8, v6

    .line 88
    iput v1, p0, Ll/t31;->n:I

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_6
    iget v0, v0, Landroid/graphics/RectF;->right:F

    .line 92
    .line 93
    int-to-float v1, v2

    .line 94
    cmpg-float v2, v0, v1

    .line 95
    .line 96
    if-gez v2, :cond_7

    .line 97
    .line 98
    sub-float v8, v1, v0

    .line 99
    .line 100
    iput v9, p0, Ll/t31;->n:I

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_7
    const/4 v0, -0x1

    .line 104
    iput v0, p0, Ll/t31;->n:I

    .line 105
    .line 106
    :goto_1
    iget-object p0, p0, Ll/t31;->o:Landroid/graphics/Matrix;

    .line 107
    .line 108
    invoke-virtual {p0, v8, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 109
    .line 110
    .line 111
    return v9
.end method

.method public final r()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/t31;->G()F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iget v2, p0, Ll/t31;->d:F

    .line 13
    .line 14
    cmpg-float v1, v1, v2

    .line 15
    .line 16
    if-gez v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/t31;->t()Landroid/graphics/RectF;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    new-instance v2, Ll/t31$c;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/t31;->G()F

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    iget v5, p0, Ll/t31;->d:F

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    move-object v3, p0

    .line 41
    invoke-direct/range {v2 .. v7}, Ll/t31$c;-><init>(Ll/t31;FFFF)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
    return-void
.end method

.method public t()Landroid/graphics/RectF;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/t31;->q()Z

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/t31;->w()Landroid/graphics/Matrix;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ll/t31;->u(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final u(Landroid/graphics/Matrix;)Landroid/graphics/RectF;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget v1, p0, Ll/t31;->q:I

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    iget v3, p0, Ll/t31;->p:I

    .line 13
    .line 14
    if-ne v3, v2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v2, p0, Ll/t31;->b:Landroid/graphics/RectF;

    .line 18
    .line 19
    int-to-float v1, v1

    .line 20
    iget v3, p0, Ll/t31;->p:I

    .line 21
    .line 22
    int-to-float v3, v3

    .line 23
    const/4 v4, 0x0

    .line 24
    invoke-virtual {v2, v4, v4, v1, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/wlj;

    .line 32
    .line 33
    iget-object v1, p0, Ll/t31;->b:Landroid/graphics/RectF;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/wlj;->l(Landroid/graphics/RectF;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/t31;->b:Landroid/graphics/RectF;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/t31;->b:Landroid/graphics/RectF;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method public v()F
    .locals 0

    .line 1
    iget p0, p0, Ll/t31;->g:F

    .line 2
    .line 3
    return p0
.end method

.method public w()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t31;->o:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public x()Lcom/facebook/drawee/view/DraweeView;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/drawee/view/DraweeView<",
            "Ll/wlj;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/t31;->s:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/facebook/drawee/view/DraweeView;

    .line 8
    .line 9
    return-object p0
.end method

.method public final y(Landroid/graphics/Matrix;I)F
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t31;->a:[F

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/t31;->a:[F

    .line 7
    .line 8
    aget p0, p0, p2

    .line 9
    .line 10
    return p0
.end method

.method public z()F
    .locals 0

    .line 1
    iget p0, p0, Ll/t31;->f:F

    .line 2
    .line 3
    return p0
.end method
