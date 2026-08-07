.class Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;
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
        Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;
    }
.end annotation


# instance fields
.field public o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

.field public p:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;",
            ">;"
        }
    .end annotation
.end field

.field public q:I

.field public r:I

.field public s:Ll/yvb;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/bwb;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;-><init>(Landroid/content/Context;Ll/bwb;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x43710000    # 241.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->q:I

    .line 11
    .line 12
    const/high16 p1, 0x440b0000    # 556.0f

    .line 13
    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->r:I

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->c:Ll/fwb;

    .line 21
    .line 22
    check-cast p1, Ll/yvb;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->s:Ll/yvb;

    .line 25
    .line 26
    return-void
.end method

.method private q()V
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
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

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
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 79
    .line 80
    new-instance v5, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 81
    .line 82
    invoke-direct {v5, p0, v0, v2, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    .line 83
    .line 84
    .line 85
    const/4 v6, 0x0

    .line 86
    aput-object v5, v4, v6

    .line 87
    .line 88
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 89
    .line 90
    new-instance v5, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 91
    .line 92
    invoke-direct {v5, p0, v1, v3, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    .line 93
    .line 94
    .line 95
    const/4 v6, 0x2

    .line 96
    aput-object v5, v4, v6

    .line 97
    .line 98
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 99
    .line 100
    new-instance v5, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 101
    .line 102
    invoke-direct {v5, p0, v2, v0, v3}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    .line 103
    .line 104
    .line 105
    const/4 v0, 0x1

    .line 106
    aput-object v5, v4, v0

    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 109
    .line 110
    new-instance v4, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 111
    .line 112
    invoke-direct {v4, p0, v3, v1, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)V

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
    invoke-direct {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->w()V

    .line 120
    .line 121
    .line 122
    :cond_1
    return-void
.end method

.method private s()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->g:Ll/bwb;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/bwb;->o()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->i:Ll/wm50;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->i:Ll/wm50;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 23
    .line 24
    invoke-interface {v0, v1}, Ll/wm50;->a(Landroid/graphics/RectF;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->r(Landroid/graphics/RectF;)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->m(Z)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->p:Landroid/util/SparseArray;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/util/SparseArray;->clear()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private t(Landroid/view/MotionEvent;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->a:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget v2, Ll/z8c0;->E:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-ge v0, v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->p:Landroid/util/SparseArray;

    .line 34
    .line 35
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 40
    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->d()F

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-virtual {p0, v1, v3}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->p(Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;F)F

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->c(FF)V

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
    invoke-direct {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->x()V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->p:Landroid/util/SparseArray;

    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-lez p1, :cond_2

    .line 71
    .line 72
    const/4 p1, 0x1

    .line 73
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->m(Z)V

    .line 74
    .line 75
    .line 76
    :cond_2
    return-void
.end method

.method private u(IFF)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->s:Ll/yvb;

    .line 2
    .line 3
    invoke-virtual {v0, p2, p3}, Ll/yvb;->j(FF)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 p3, -0x1

    .line 8
    const/4 v0, 0x0

    .line 9
    if-eq p2, p3, :cond_2

    .line 10
    .line 11
    const/4 p3, 0x4

    .line 12
    if-ne p2, p3, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->p:Landroid/util/SparseArray;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 17
    .line 18
    aget-object p0, p0, v0

    .line 19
    .line 20
    invoke-virtual {p2, p1, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->p:Landroid/util/SparseArray;

    .line 25
    .line 26
    const/4 v0, 0x5

    .line 27
    if-ne p2, v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 30
    .line 31
    const/4 p2, 0x3

    .line 32
    aget-object p0, p0, p2

    .line 33
    .line 34
    invoke-virtual {p3, p1, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 39
    .line 40
    aget-object p0, p0, p2

    .line 41
    .line 42
    invoke-virtual {p3, p1, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    :goto_0
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_2
    return v0
.end method

.method private v(Landroid/view/MotionEvent;)Z
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
    invoke-direct {p0, v1, v2, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->u(IFF)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method private w()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

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
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->c(FF)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

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
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->c(FF)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private x()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->d()F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iget-object v3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 13
    .line 14
    aget-object v2, v3, v2

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->e()F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iget-object v3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 21
    .line 22
    const/4 v4, 0x3

    .line 23
    aget-object v3, v3, v4

    .line 24
    .line 25
    invoke-virtual {v3}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->d()F

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 30
    .line 31
    aget-object p0, p0, v4

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->e()F

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


# virtual methods
.method public a()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->a()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->q()V

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
    invoke-direct {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->q()V

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
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->d(Ll/bwb;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->p:Landroid/util/SparseArray;

    .line 10
    .line 11
    const/4 p1, 0x4

    .line 12
    new-array p1, p1, [Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->o:[Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;

    .line 15
    .line 16
    return-void
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->p:Landroid/util/SparseArray;

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

.method public o()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    const/4 v2, 0x0

    .line 12
    cmpl-float v3, v0, v2

    .line 13
    .line 14
    if-eqz v3, :cond_6

    .line 15
    .line 16
    cmpl-float v3, v1, v2

    .line 17
    .line 18
    if-nez v3, :cond_0

    .line 19
    .line 20
    goto/16 :goto_3

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->getAspectRatio()Ll/q11;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    if-eqz v3, :cond_6

    .line 27
    .line 28
    invoke-virtual {v3}, Ll/q11;->b()F

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    cmpl-float v4, v4, v2

    .line 33
    .line 34
    if-nez v4, :cond_1

    .line 35
    .line 36
    goto :goto_3

    .line 37
    :cond_1
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 38
    .line 39
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    cmpl-float v4, v4, v2

    .line 44
    .line 45
    if-eqz v4, :cond_2

    .line 46
    .line 47
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 48
    .line 49
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    cmpl-float v2, v4, v2

    .line 54
    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 58
    .line 59
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 64
    .line 65
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    div-float/2addr v2, v4

    .line 70
    invoke-virtual {v3}, Ll/q11;->b()F

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    sub-float/2addr v2, v3

    .line 75
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    float-to-double v2, v2

    .line 80
    const-wide v4, 0x3f50624dd2f1a9fcL    # 0.001

    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    cmpg-double v2, v2, v4

    .line 86
    .line 87
    if-gez v2, :cond_2

    .line 88
    .line 89
    goto :goto_3

    .line 90
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->g:Ll/bwb;

    .line 91
    .line 92
    invoke-virtual {v2}, Ll/bwb;->p()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    int-to-float v2, v2

    .line 97
    iget v3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->j:I

    .line 98
    .line 99
    if-lez v3, :cond_3

    .line 100
    .line 101
    int-to-float v3, v3

    .line 102
    div-float v3, v2, v3

    .line 103
    .line 104
    iget v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->k:I

    .line 105
    .line 106
    int-to-float v4, v4

    .line 107
    mul-float/2addr v3, v4

    .line 108
    goto :goto_0

    .line 109
    :cond_3
    const/high16 v3, -0x40800000    # -1.0f

    .line 110
    .line 111
    :goto_0
    const/high16 v4, 0x3f000000    # 0.5f

    .line 112
    .line 113
    mul-float/2addr v1, v4

    .line 114
    mul-float/2addr v0, v4

    .line 115
    mul-float/2addr v2, v4

    .line 116
    iget v5, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->q:I

    .line 117
    .line 118
    int-to-float v6, v5

    .line 119
    cmpg-float v6, v3, v6

    .line 120
    .line 121
    if-gez v6, :cond_4

    .line 122
    .line 123
    :goto_1
    int-to-float v3, v5

    .line 124
    goto :goto_2

    .line 125
    :cond_4
    iget v5, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->r:I

    .line 126
    .line 127
    int-to-float v6, v5

    .line 128
    cmpl-float v6, v3, v6

    .line 129
    .line 130
    if-lez v6, :cond_5

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_5
    :goto_2
    mul-float/2addr v3, v4

    .line 134
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 135
    .line 136
    sub-float v4, v0, v2

    .line 137
    .line 138
    sub-float v5, v1, v3

    .line 139
    .line 140
    add-float/2addr v0, v2

    .line 141
    add-float/2addr v1, v3

    .line 142
    invoke-virtual {p0, v4, v5, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 143
    .line 144
    .line 145
    :cond_6
    :goto_3
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    if-eq v0, v1, :cond_2

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    if-eq v0, v2, :cond_1

    .line 18
    .line 19
    const/4 v2, 0x3

    .line 20
    if-eq v0, v2, :cond_2

    .line 21
    .line 22
    invoke-super {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->t(Landroid/view/MotionEvent;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    invoke-direct {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->s()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_3
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->v(Landroid/view/MotionEvent;)Z

    .line 36
    .line 37
    .line 38
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 39
    .line 40
    .line 41
    return v1
.end method

.method public final p(Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;F)F
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->a(Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;)Landroid/graphics/PointF;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 6
    .line 7
    sub-float v0, p2, v0

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->q:I

    .line 14
    .line 15
    int-to-float v1, v1

    .line 16
    cmpg-float v1, v1, v0

    .line 17
    .line 18
    if-gtz v1, :cond_0

    .line 19
    .line 20
    iget v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->r:I

    .line 21
    .line 22
    int-to-float v1, v1

    .line 23
    cmpg-float v0, v0, v1

    .line 24
    .line 25
    if-gtz v0, :cond_0

    .line 26
    .line 27
    return p2

    .line 28
    :cond_0
    invoke-static {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->a(Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;)Landroid/graphics/PointF;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 33
    .line 34
    cmpg-float v0, p2, v0

    .line 35
    .line 36
    if-gez v0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->e()F

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    cmpg-float p2, p2, v0

    .line 43
    .line 44
    if-gez p2, :cond_1

    .line 45
    .line 46
    invoke-static {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->a(Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;)Landroid/graphics/PointF;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 51
    .line 52
    iget p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->r:I

    .line 53
    .line 54
    int-to-float p0, p0

    .line 55
    sub-float/2addr p1, p0

    .line 56
    return p1

    .line 57
    :cond_1
    invoke-static {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->a(Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;)Landroid/graphics/PointF;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 62
    .line 63
    iget p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->q:I

    .line 64
    .line 65
    int-to-float p0, p0

    .line 66
    sub-float/2addr p1, p0

    .line 67
    return p1

    .line 68
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->e()F

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    cmpg-float p2, p2, v0

    .line 73
    .line 74
    if-gez p2, :cond_3

    .line 75
    .line 76
    invoke-static {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->a(Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;)Landroid/graphics/PointF;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 81
    .line 82
    iget p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->q:I

    .line 83
    .line 84
    int-to-float p0, p0

    .line 85
    add-float/2addr p1, p0

    .line 86
    return p1

    .line 87
    :cond_3
    invoke-static {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;->a(Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView$a;)Landroid/graphics/PointF;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 92
    .line 93
    iget p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->r:I

    .line 94
    .line 95
    int-to-float p0, p0

    .line 96
    add-float/2addr p1, p0

    .line 97
    return p1
.end method

.method public r(Landroid/graphics/RectF;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    sub-float/2addr v0, p1

    .line 14
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 15
    .line 16
    iget v1, p1, Landroid/graphics/RectF;->left:F

    .line 17
    .line 18
    iget v2, p1, Landroid/graphics/RectF;->top:F

    .line 19
    .line 20
    add-float/2addr v2, v0

    .line 21
    iget v3, p1, Landroid/graphics/RectF;->right:F

    .line 22
    .line 23
    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    .line 24
    .line 25
    add-float/2addr v4, v0

    .line 26
    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIDynamicOverlayView;->w()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 33
    .line 34
    .line 35
    return-void
.end method
