.class Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;
.super Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;
    }
.end annotation


# static fields
.field public static final t:F


# instance fields
.field public o:[[F

.field public p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

.field public q:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;",
            ">;"
        }
    .end annotation
.end field

.field public r:Landroid/graphics/PointF;

.field public s:Landroid/graphics/RectF;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x18

    .line 2
    .line 3
    invoke-static {v0}, Ll/gwb;->e(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    sput v0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->t:F

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/bwb;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;-><init>(Landroid/content/Context;Ll/bwb;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic p()F
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->t:F

    return v0
.end method


# virtual methods
.method public final A(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, v1, v2, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->z(IFF)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public final B()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 7
    .line 8
    iget v2, v1, Landroid/graphics/RectF;->left:F

    .line 9
    .line 10
    iget v1, v1, Landroid/graphics/RectF;->top:F

    .line 11
    .line 12
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->e(FF)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    aget-object v0, v0, v1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 21
    .line 22
    iget v1, p0, Landroid/graphics/RectF;->right:F

    .line 23
    .line 24
    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    .line 25
    .line 26
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->e(FF)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public C()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->f()F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iget-object v3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 13
    .line 14
    aget-object v2, v3, v2

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->g()F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iget-object v3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 21
    .line 22
    const/4 v4, 0x3

    .line 23
    aget-object v3, v3, v4

    .line 24
    .line 25
    invoke-virtual {v3}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->f()F

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 30
    .line 31
    aget-object p0, p0, v4

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->g()F

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {v0, v1, v2, v3, p0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public a()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->a()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->s()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public b(Landroid/graphics/RectF;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->b(Landroid/graphics/RectF;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->s()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d(Ll/bwb;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->d(Ll/bwb;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->q:Landroid/util/SparseArray;

    .line 10
    .line 11
    const/4 v0, 0x4

    .line 12
    new-array v0, v0, [Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/bwb;->n()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p1}, Ll/bwb;->m()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    int-to-float p1, p1

    .line 29
    const v0, 0x3e99999a    # 0.3f

    .line 30
    .line 31
    .line 32
    mul-float/2addr p1, v0

    .line 33
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->r(F)[[F

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->o:[[F

    .line 38
    .line 39
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->r:Landroid/graphics/PointF;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->q:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->onDraw(Landroid/graphics/Canvas;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->q()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->g:Ll/bwb;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/bwb;->j()Ll/fwb;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 v0, 0x0

    .line 21
    move v7, v0

    .line 22
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 23
    .line 24
    array-length v3, v2

    .line 25
    if-ge v7, v3, :cond_0

    .line 26
    .line 27
    aget-object v2, v2, v7

    .line 28
    .line 29
    invoke-virtual {v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->f()F

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 34
    .line 35
    aget-object v2, v2, v7

    .line 36
    .line 37
    invoke-virtual {v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->g()F

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->o:[[F

    .line 42
    .line 43
    aget-object v2, v2, v7

    .line 44
    .line 45
    aget v5, v2, v0

    .line 46
    .line 47
    const/4 v6, 0x1

    .line 48
    aget v6, v2, v6

    .line 49
    .line 50
    move-object v2, p1

    .line 51
    invoke-virtual/range {v1 .. v6}, Ll/fwb;->e(Landroid/graphics/Canvas;FFFF)V

    .line 52
    .line 53
    .line 54
    add-int/lit8 v7, v7, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->h:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v0, :cond_5

    .line 13
    .line 14
    if-eq v0, v2, :cond_4

    .line 15
    .line 16
    const/4 v3, 0x2

    .line 17
    if-eq v0, v3, :cond_3

    .line 18
    .line 19
    const/4 v3, 0x3

    .line 20
    if-eq v0, v3, :cond_4

    .line 21
    .line 22
    const/4 v3, 0x5

    .line 23
    if-eq v0, v3, :cond_2

    .line 24
    .line 25
    const/4 v3, 0x6

    .line 26
    if-eq v0, v3, :cond_1

    .line 27
    .line 28
    return v1

    .line 29
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->x(Landroid/view/MotionEvent;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->v(Landroid/view/MotionEvent;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->w(Landroid/view/MotionEvent;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->u()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->y(Landroid/view/MotionEvent;)V

    .line 46
    .line 47
    .line 48
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 49
    .line 50
    .line 51
    return v2
.end method

.method public final q()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->d()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    return v0
.end method

.method public final r(F)[[F
    .locals 5

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array v0, p0, [I

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    aput p0, v0, v1

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x4

    .line 9
    aput v3, v0, v2

    .line 10
    .line 11
    sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 12
    .line 13
    invoke-static {v3, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, [[F

    .line 18
    .line 19
    new-array v3, p0, [F

    .line 20
    .line 21
    aput p1, v3, v2

    .line 22
    .line 23
    aput p1, v3, v1

    .line 24
    .line 25
    aput-object v3, v0, v2

    .line 26
    .line 27
    neg-float v3, p1

    .line 28
    new-array v4, p0, [F

    .line 29
    .line 30
    aput p1, v4, v2

    .line 31
    .line 32
    aput v3, v4, v1

    .line 33
    .line 34
    aput-object v4, v0, p0

    .line 35
    .line 36
    new-array v4, p0, [F

    .line 37
    .line 38
    aput v3, v4, v2

    .line 39
    .line 40
    aput p1, v4, v1

    .line 41
    .line 42
    aput-object v4, v0, v1

    .line 43
    .line 44
    new-array p0, p0, [F

    .line 45
    .line 46
    aput v3, p0, v2

    .line 47
    .line 48
    aput v3, p0, v1

    .line 49
    .line 50
    const/4 p1, 0x3

    .line 51
    aput-object p0, v0, p1

    .line 52
    .line 53
    return-object v0
.end method

.method public final s()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-lez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    cmpl-float v0, v0, v1

    .line 19
    .line 20
    if-lez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 23
    .line 24
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ll/gwb;->g(Ljava/lang/Iterable;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    new-instance v0, Landroid/graphics/PointF;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 37
    .line 38
    iget v2, v1, Landroid/graphics/RectF;->left:F

    .line 39
    .line 40
    iget v1, v1, Landroid/graphics/RectF;->top:F

    .line 41
    .line 42
    invoke-direct {v0, v2, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 43
    .line 44
    .line 45
    new-instance v1, Landroid/graphics/PointF;

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 48
    .line 49
    iget v3, v2, Landroid/graphics/RectF;->left:F

    .line 50
    .line 51
    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    .line 52
    .line 53
    invoke-direct {v1, v3, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 54
    .line 55
    .line 56
    new-instance v2, Landroid/graphics/PointF;

    .line 57
    .line 58
    iget-object v3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 59
    .line 60
    iget v4, v3, Landroid/graphics/RectF;->right:F

    .line 61
    .line 62
    iget v3, v3, Landroid/graphics/RectF;->top:F

    .line 63
    .line 64
    invoke-direct {v2, v4, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 65
    .line 66
    .line 67
    new-instance v3, Landroid/graphics/PointF;

    .line 68
    .line 69
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 70
    .line 71
    iget v5, v4, Landroid/graphics/RectF;->right:F

    .line 72
    .line 73
    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    .line 74
    .line 75
    invoke-direct {v3, v5, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 76
    .line 77
    .line 78
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 79
    .line 80
    new-instance v5, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 81
    .line 82
    invoke-direct {v5, p0, v0, v2, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    .line 83
    .line 84
    .line 85
    const/4 v6, 0x0

    .line 86
    aput-object v5, v4, v6

    .line 87
    .line 88
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 89
    .line 90
    new-instance v5, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 91
    .line 92
    invoke-direct {v5, p0, v1, v3, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    .line 93
    .line 94
    .line 95
    const/4 v6, 0x2

    .line 96
    aput-object v5, v4, v6

    .line 97
    .line 98
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 99
    .line 100
    new-instance v5, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 101
    .line 102
    invoke-direct {v5, p0, v2, v0, v3}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    .line 103
    .line 104
    .line 105
    const/4 v0, 0x1

    .line 106
    aput-object v5, v4, v0

    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 109
    .line 110
    new-instance v4, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 111
    .line 112
    invoke-direct {v4, p0, v3, v1, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    .line 113
    .line 114
    .line 115
    const/4 p0, 0x3

    .line 116
    aput-object v4, v0, p0

    .line 117
    .line 118
    return-void

    .line 119
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->B()V

    .line 120
    .line 121
    .line 122
    :cond_1
    return-void
.end method

.method public t()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->s:Landroid/graphics/RectF;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->l()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->q:Landroid/util/SparseArray;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-lez v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->l()V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->q:Landroid/util/SparseArray;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->r:Landroid/graphics/PointF;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->s:Landroid/graphics/RectF;

    .line 36
    .line 37
    return-void
.end method

.method public final v(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->A(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public w(Landroid/view/MotionEvent;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-ge v0, v1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->q:Landroid/util/SparseArray;

    .line 19
    .line 20
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 25
    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    int-to-float v3, v3

    .line 37
    const/4 v4, 0x0

    .line 38
    invoke-static {v2, v4, v3}, Ll/gwb;->a(FFF)F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    int-to-float v5, v5

    .line 51
    invoke-static {v3, v4, v5}, Ll/gwb;->a(FFF)F

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->e(FF)V

    .line 56
    .line 57
    .line 58
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->C()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->e()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->r:Landroid/graphics/PointF;

    .line 76
    .line 77
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 78
    .line 79
    sub-float v3, v0, v1

    .line 80
    .line 81
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->r:Landroid/graphics/PointF;

    .line 86
    .line 87
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 88
    .line 89
    sub-float v4, p1, v0

    .line 90
    .line 91
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->s:Landroid/graphics/RectF;

    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    iget-object v7, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 102
    .line 103
    invoke-static/range {v2 .. v7}, Ll/gwb;->h(Landroid/graphics/RectF;FFIILandroid/graphics/RectF;)Landroid/graphics/RectF;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->B()V

    .line 110
    .line 111
    .line 112
    :cond_3
    return-void
.end method

.method public final x(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->q:Landroid/util/SparseArray;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public y(Landroid/view/MotionEvent;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->A(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->t()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-virtual {v1, v2, v3}, Landroid/graphics/RectF;->contains(FF)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    new-instance v1, Landroid/graphics/PointF;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-direct {v1, v2, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 45
    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->r:Landroid/graphics/PointF;

    .line 48
    .line 49
    new-instance p1, Landroid/graphics/RectF;

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 52
    .line 53
    invoke-direct {p1, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->s:Landroid/graphics/RectF;

    .line 57
    .line 58
    :cond_1
    :goto_0
    return-void
.end method

.method public final z(IFF)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->p:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    move v3, v2

    .line 6
    :goto_0
    if-ge v3, v1, :cond_1

    .line 7
    .line 8
    aget-object v4, v0, v3

    .line 9
    .line 10
    invoke-virtual {v4, p2, p3}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->b(FF)Z

    .line 11
    .line 12
    .line 13
    move-result v5

    .line 14
    if-eqz v5, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->q:Landroid/util/SparseArray;

    .line 17
    .line 18
    invoke-virtual {p0, p1, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return v2
.end method
