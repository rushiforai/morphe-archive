.class public final Lqvk;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Landroid/view/GestureDetector;

.field public final c:Landroid/graphics/PointF;

.field public d:I

.field public e:Lpvk;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lqvk;->c:Landroid/graphics/PointF;

    const/4 v0, -0x1

    iput v0, p0, Lqvk;->d:I

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    iput v0, p0, Lqvk;->a:I

    new-instance v0, Landroid/view/GestureDetector;

    invoke-direct {v0, p1, p0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lqvk;->b:Landroid/view/GestureDetector;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/MotionEvent;)Z
    .registers 6

    iget-object v0, p0, Lqvk;->b:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    iget-object v1, p0, Lqvk;->e:Lpvk;

    if-eqz v1, :cond_19

    iget v1, p0, Lqvk;->d:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_19

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1a

    const/4 v3, 0x3

    if-eq p1, v3, :cond_1a

    :cond_19
    return v0

    :cond_1a
    iput v2, p0, Lqvk;->d:I

    iget-object p0, p0, Lqvk;->e:Lpvk;

    invoke-interface {p0}, Lpvk;->d()V

    return v1
.end method

.method public final onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 14

    iget-object p1, p0, Lqvk;->e:Lpvk;

    const/4 v0, 0x0

    if-nez p1, :cond_6

    return v0

    :cond_6
    iget p1, p0, Lqvk;->d:I

    const/4 v1, -0x1

    if-ne p1, v1, :cond_c

    return v0

    :cond_c
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    iget-object v0, p0, Lqvk;->c:Landroid/graphics/PointF;

    iget v1, v0, Landroid/graphics/PointF;->x:F

    sub-float v1, p1, v1

    iget v0, v0, Landroid/graphics/PointF;->y:F

    sub-float v0, p2, v0

    iget-object v2, p0, Lqvk;->e:Lpvk;

    float-to-int v3, p1

    float-to-int v4, p2

    float-to-int v5, v1

    float-to-int v6, v0

    float-to-int v7, p3

    float-to-int v8, p4

    invoke-interface/range {v2 .. v8}, Lpvk;->c(IIIIII)V

    const/4 p0, 0x1

    return p0
.end method

.method public final onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 18

    iget-object v0, p0, Lqvk;->e:Lpvk;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v2

    iget v3, p0, Lqvk;->d:I

    iget-object v4, p0, Lqvk;->c:Landroid/graphics/PointF;

    const/4 v5, 0x1

    const/4 v6, -0x1

    if-ne v3, v6, :cond_5e

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    sub-float v3, v0, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    sub-float p1, v2, p1

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v7

    iget v8, p0, Lqvk;->a:I

    int-to-float v9, v8

    cmpl-float v7, v7, v9

    const/4 v9, 0x0

    if-lez v7, :cond_36

    cmpl-float p1, v3, v9

    if-lez p1, :cond_34

    const/4 p1, 0x2

    goto :goto_48

    :cond_34
    move p1, v1

    goto :goto_48

    :cond_36
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v3

    int-to-float v7, v8

    cmpl-float v3, v3, v7

    if-lez v3, :cond_47

    cmpl-float p1, p1, v9

    if-lez p1, :cond_45

    const/4 p1, 0x3

    goto :goto_48

    :cond_45
    move p1, v5

    goto :goto_48

    :cond_47
    move p1, v6

    :goto_48
    if-eq p1, v6, :cond_5e

    iget-object v3, p0, Lqvk;->e:Lpvk;

    invoke-interface {v3, p1}, Lpvk;->a(I)Z

    move-result v3

    if-eqz v3, :cond_5e

    iput p1, p0, Lqvk;->d:I

    iget-object v3, p0, Lqvk;->e:Lpvk;

    float-to-int v7, v0

    float-to-int v8, v2

    invoke-interface {v3, p1, v7, v8}, Lpvk;->e(III)V

    invoke-virtual {v4, v0, v2}, Landroid/graphics/PointF;->set(FF)V

    :cond_5e
    iget p1, p0, Lqvk;->d:I

    if-eq p1, v6, :cond_7c

    iget p1, v4, Landroid/graphics/PointF;->x:F

    sub-float p1, v0, p1

    iget v1, v4, Landroid/graphics/PointF;->y:F

    sub-float v1, v2, v1

    iget-object v6, p0, Lqvk;->e:Lpvk;

    float-to-int v7, v0

    float-to-int v8, v2

    move/from16 p0, p3

    neg-float p0, p0

    float-to-int v9, p0

    move/from16 p0, p4

    neg-float p0, p0

    float-to-int v10, p0

    float-to-int v11, p1

    float-to-int v12, v1

    invoke-interface/range {v6 .. v12}, Lpvk;->b(IIIIII)V

    return v5

    :cond_7c
    return v1
.end method
