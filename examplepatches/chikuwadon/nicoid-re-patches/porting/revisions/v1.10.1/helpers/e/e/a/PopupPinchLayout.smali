.class public final Le/e/a/PopupPinchLayout;
.super Landroid/widget/LinearLayout;
.source "PopupPinchLayout.java"


# instance fields
.field private anchorX:F

.field private anchorY:F

.field private changed:Z

.field private consuming:Z

.field private edgeResizing:Z

.field private firstId:I

.field private fractionX:F

.field private fractionY:F

.field private owner:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private ratio:F

.field private scaling:Z

.field private secondId:I

.field private startHeight:F

.field private startSpan:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 19
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    new-instance p1, Ljava/lang/ref/WeakReference;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Le/e/a/PopupPinchLayout;->owner:Ljava/lang/ref/WeakReference;

    .line 19
    return-void
.end method

.method static applyBounds(Landroid/view/WindowManager$LayoutParams;[I)V
    .registers 3

    .line 135
    const/4 v0, 0x0

    aget v0, p1, v0

    iput v0, p0, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v0, 0x1

    aget v0, p1, v0

    iput v0, p0, Landroid/view/WindowManager$LayoutParams;->height:I

    const/4 v0, 0x2

    aget v0, p1, v0

    iput v0, p0, Landroid/view/WindowManager$LayoutParams;->x:I

    const/4 v0, 0x3

    aget p1, p1, v0

    iput p1, p0, Landroid/view/WindowManager$LayoutParams;->y:I

    return-void
.end method

.method private static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private resize(Ljava/lang/Object;F)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 123
    const-string v0, "U"

    invoke-static {p1, v0}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager$LayoutParams;

    .line 124
    const-string v0, "o"

    invoke-static {p1, v0}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 125
    const-string v0, "p"

    invoke-static {p1, v0}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const-string v1, "l"

    invoke-static {p1, v1}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v11, 0x0

    invoke-static {v11, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    sub-int v6, v0, v1

    .line 126
    invoke-virtual {p0}, Le/e/a/PopupPinchLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 127
    const-string v1, "T"

    invoke-static {p1, v1}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    const/high16 v2, 0x42b40000    # 90.0f

    mul-float/2addr v2, v0

    const/high16 v3, 0x43200000    # 160.0f

    mul-float/2addr v0, v3

    iget v3, p0, Le/e/a/PopupPinchLayout;->ratio:F

    div-float/2addr v0, v3

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 128
    iget v2, p0, Le/e/a/PopupPinchLayout;->ratio:F

    .line 129
    const-string v0, "S"

    invoke-static {p1, v0}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v4

    .line 130
    iget v7, p0, Le/e/a/PopupPinchLayout;->anchorX:F

    iget v8, p0, Le/e/a/PopupPinchLayout;->anchorY:F

    iget v9, p0, Le/e/a/PopupPinchLayout;->fractionX:F

    iget v10, p0, Le/e/a/PopupPinchLayout;->fractionY:F

    .line 128
    move v1, p2

    invoke-static/range {v1 .. v10}, Le/e/a/PopupPinchGeometry;->bounds(FFFFIIFFFF)[I

    move-result-object p2

    .line 131
    aget v0, p2, v11

    const/4 v1, 0x2

    aget v1, p2, v1

    const/4 v2, 0x3

    aget p2, p2, v2

    invoke-static {p1, v0, v1, p2}, Le/e/a/PopupLayout236;->request(Ljava/lang/Object;III)V

    .line 132
    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/PopupPinchLayout;->changed:Z

    .line 133
    return-void
.end method

.method private save(Ljava/lang/Object;)V
    .registers 2

    .line 137
    invoke-static {p1}, Le/e/a/PopupResize236;->save(Ljava/lang/Object;)V

    return-void
.end method

.method private span(Landroid/view/MotionEvent;II)F
    .registers 6

    .line 26
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, p3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    sub-float/2addr v0, v1

    float-to-double v0, v0

    .line 27
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p2

    invoke-virtual {p1, p3}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr p2, p1

    float-to-double p1, p2

    .line 26
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide p1

    double-to-float p1, p1

    return p1
.end method


# virtual methods
.method public bind(Ljava/lang/Object;)V
    .registers 3

    .line 20
    iget-object v0, p0, Le/e/a/PopupPinchLayout;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/PopupPinchLayout;->owner:Ljava/lang/ref/WeakReference;

    invoke-static {p1}, Le/e/a/PlaybackReturn;->bind(Ljava/lang/Object;)V

    invoke-static {p1}, Le/e/a/PopupFrame233;->attach(Ljava/lang/Object;)V

    return-void
.end method

.method public cancelHoldTargets()V
    .registers 9

    .line 113
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 114
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 113
    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    .line 115
    :try_start_10
    invoke-super {p0, v0}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_17

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 116
    return-void

    .line 115
    :catchall_17
    move-exception v1

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    throw v1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 19

    .line 31
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    iget-object v0, v1, Le/e/a/PopupPinchLayout;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    .line 32
    if-nez v3, :cond_11

    invoke-super/range {p0 .. p1}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 33
    :cond_11
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v4

    .line 34
    const/4 v5, 0x0

    if-nez v4, :cond_23

    .line 36
    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->changed:Z

    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->scaling:Z

    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->consuming:Z

    .line 37
    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->edgeResizing:Z

    .line 38
    invoke-static {v3}, Le/e/a/PopupResize236;->cancel(Ljava/lang/Object;)V

    .line 42
    :cond_23
    const/4 v6, 0x1

    if-nez v4, :cond_38

    invoke-static/range {p0 .. p1}, Le/e/a/PopupEdge249;->hit(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 43
    invoke-static {v3, v1, v2}, Le/e/a/PopupResize236;->touch(Ljava/lang/Object;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 44
    iput-boolean v6, v1, Le/e/a/PopupPinchLayout;->edgeResizing:Z

    .line 45
    invoke-static {v3}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    .line 46
    return v6

    .line 48
    :cond_38
    iget-boolean v0, v1, Le/e/a/PopupPinchLayout;->edgeResizing:Z

    const/4 v7, 0x5

    const/4 v8, 0x3

    if-eqz v0, :cond_4a

    if-eq v4, v7, :cond_4a

    .line 49
    invoke-static {v3, v1, v2}, Le/e/a/PopupResize236;->touch(Ljava/lang/Object;Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 50
    if-eq v4, v6, :cond_47

    if-ne v4, v8, :cond_49

    .line 51
    :cond_47
    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->edgeResizing:Z

    .line 52
    :cond_49
    return v6

    .line 54
    :cond_4a
    iget-boolean v0, v1, Le/e/a/PopupPinchLayout;->edgeResizing:Z

    if-eqz v0, :cond_53

    .line 55
    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->edgeResizing:Z

    .line 56
    invoke-static {v3}, Le/e/a/PopupResize236;->cancel(Ljava/lang/Object;)V

    .line 58
    :cond_53
    iget-boolean v0, v1, Le/e/a/PopupPinchLayout;->consuming:Z

    const-string v9, "nicoid-pinch"

    const/4 v10, 0x2

    if-nez v0, :cond_111

    if-ne v4, v7, :cond_111

    .line 59
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-lt v0, v10, :cond_111

    .line 60
    iput-boolean v6, v1, Le/e/a/PopupPinchLayout;->consuming:Z

    .line 61
    invoke-static {v3}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    .line 62
    invoke-static {v3}, Le/e/a/PopupResize236;->cancel(Ljava/lang/Object;)V

    .line 63
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    .line 64
    invoke-virtual {v0, v8}, Landroid/view/MotionEvent;->setAction(I)V

    .line 65
    invoke-super {v1, v0}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 66
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 68
    :try_start_77
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v7, "f0"

    invoke-virtual {v0, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v7, 0x0

    invoke-virtual {v0, v3, v7}, Ljava/lang/reflect/Field;->setFloat(Ljava/lang/Object;F)V

    .line 69
    const-string v0, "e"

    invoke-static {v3, v0}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 70
    const-string v11, "U"

    invoke-static {v3, v11}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/view/WindowManager$LayoutParams;

    .line 71
    invoke-virtual {v2, v5}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v12

    iput v12, v1, Le/e/a/PopupPinchLayout;->firstId:I

    .line 72
    invoke-virtual {v2, v6}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v12

    iput v12, v1, Le/e/a/PopupPinchLayout;->secondId:I

    .line 73
    invoke-direct {v1, v2, v5, v6}, Le/e/a/PopupPinchLayout;->span(Landroid/view/MotionEvent;II)F

    move-result v12

    iput v12, v1, Le/e/a/PopupPinchLayout;->startSpan:F

    .line 74
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v12

    int-to-float v12, v12

    iput v12, v1, Le/e/a/PopupPinchLayout;->startHeight:F

    .line 75
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    .line 76
    iget v12, v1, Le/e/a/PopupPinchLayout;->startSpan:F

    const/high16 v13, 0x3f800000    # 1.0f

    cmpl-float v12, v12, v13

    if-lez v12, :cond_111

    iget v12, v1, Le/e/a/PopupPinchLayout;->startHeight:F

    cmpl-float v12, v12, v7

    if-lez v12, :cond_111

    cmpl-float v12, v0, v7

    if-lez v12, :cond_111

    .line 77
    iget v12, v1, Le/e/a/PopupPinchLayout;->startHeight:F

    div-float v12, v0, v12

    iput v12, v1, Le/e/a/PopupPinchLayout;->ratio:F

    .line 78
    invoke-virtual {v2, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v12

    invoke-virtual {v2, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v14

    add-float/2addr v12, v14

    const/high16 v14, 0x40000000    # 2.0f

    div-float/2addr v12, v14

    .line 79
    invoke-virtual {v2, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v15

    invoke-virtual {v2, v6}, Landroid/view/MotionEvent;->getY(I)F

    move-result v16

    add-float v15, v15, v16

    div-float/2addr v15, v14

    .line 80
    div-float v0, v12, v0

    invoke-static {v13, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v7, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, v1, Le/e/a/PopupPinchLayout;->fractionX:F

    .line 81
    iget v0, v1, Le/e/a/PopupPinchLayout;->startHeight:F

    div-float v0, v15, v0

    invoke-static {v13, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v7, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, v1, Le/e/a/PopupPinchLayout;->fractionY:F

    .line 82
    iget v0, v11, Landroid/view/WindowManager$LayoutParams;->x:I

    int-to-float v0, v0

    add-float/2addr v0, v12

    iput v0, v1, Le/e/a/PopupPinchLayout;->anchorX:F

    .line 83
    iget v0, v11, Landroid/view/WindowManager$LayoutParams;->y:I

    int-to-float v0, v0

    add-float/2addr v0, v15

    iput v0, v1, Le/e/a/PopupPinchLayout;->anchorY:F

    .line 84
    iput-boolean v6, v1, Le/e/a/PopupPinchLayout;->scaling:Z
    :try_end_10a
    .catch Ljava/lang/Exception; {:try_start_77 .. :try_end_10a} :catch_10b

    .line 86
    goto :goto_111

    :catch_10b
    move-exception v0

    const-string v7, "Cannot begin resize"

    invoke-static {v9, v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 88
    :cond_111
    :goto_111
    iget-boolean v0, v1, Le/e/a/PopupPinchLayout;->consuming:Z

    if-nez v0, :cond_12e

    invoke-static {v3, v1, v2}, Le/e/a/PopupHoldSpeed;->touch(Ljava/lang/Object;Landroid/view/ViewGroup;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_129

    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/view/MotionEvent;->setAction(I)V

    invoke-super {v1, v0}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    return v6

    :cond_129
    invoke-super/range {p0 .. p1}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 89
    :cond_12e
    if-ne v4, v10, :cond_15d

    iget-boolean v0, v1, Le/e/a/PopupPinchLayout;->scaling:Z

    if-eqz v0, :cond_15d

    .line 90
    iget v0, v1, Le/e/a/PopupPinchLayout;->firstId:I

    invoke-virtual {v2, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    iget v7, v1, Le/e/a/PopupPinchLayout;->secondId:I

    invoke-virtual {v2, v7}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v7

    .line 91
    if-ltz v0, :cond_15b

    if-ltz v7, :cond_15b

    .line 92
    :try_start_144
    iget v10, v1, Le/e/a/PopupPinchLayout;->startHeight:F

    invoke-direct {v1, v2, v0, v7}, Le/e/a/PopupPinchLayout;->span(Landroid/view/MotionEvent;II)F

    move-result v0

    mul-float/2addr v10, v0

    iget v0, v1, Le/e/a/PopupPinchLayout;->startSpan:F

    div-float/2addr v10, v0

    invoke-direct {v1, v3, v10}, Le/e/a/PopupPinchLayout;->resize(Ljava/lang/Object;F)V
    :try_end_151
    .catch Ljava/lang/Exception; {:try_start_144 .. :try_end_151} :catch_152

    goto :goto_15d

    .line 93
    :catch_152
    move-exception v0

    .line 94
    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->scaling:Z

    .line 95
    const-string v7, "Cannot resize popup"

    invoke-static {v9, v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 97
    goto :goto_15d

    :cond_15b
    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->scaling:Z

    .line 99
    :cond_15d
    :goto_15d
    const/4 v0, 0x6

    if-ne v4, v0, :cond_172

    .line 100
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    .line 101
    iget v2, v1, Le/e/a/PopupPinchLayout;->firstId:I

    if-eq v0, v2, :cond_170

    iget v2, v1, Le/e/a/PopupPinchLayout;->secondId:I

    if-ne v0, v2, :cond_172

    :cond_170
    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->scaling:Z

    .line 103
    :cond_172
    if-eq v4, v6, :cond_176

    if-ne v4, v8, :cond_183

    .line 104
    :cond_176
    iget-boolean v0, v1, Le/e/a/PopupPinchLayout;->changed:Z

    if-eqz v0, :cond_17d

    invoke-direct {v1, v3}, Le/e/a/PopupPinchLayout;->save(Ljava/lang/Object;)V

    .line 105
    :cond_17d
    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->changed:Z

    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->scaling:Z

    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->consuming:Z

    .line 108
    :cond_183
    return v6
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .line 118
    iget-object v0, p0, Le/e/a/PopupPinchLayout;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    iget-object v0, p0, Le/e/a/PopupPinchLayout;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PopupResize236;->cancel(Ljava/lang/Object;)V

    .line 119
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/PopupPinchLayout;->edgeResizing:Z

    iput-boolean v0, p0, Le/e/a/PopupPinchLayout;->changed:Z

    iput-boolean v0, p0, Le/e/a/PopupPinchLayout;->scaling:Z

    iput-boolean v0, p0, Le/e/a/PopupPinchLayout;->consuming:Z

    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 120
    return-void
.end method
