.class public final Le/e/a/PopupPinchLayout;
.super Landroid/widget/LinearLayout;
.source "PopupPinchLayout.java"


# instance fields
.field private anchorX:F

.field private anchorY:F

.field private changed:Z

.field private consuming:Z

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

    .line 20
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 15
    new-instance p1, Ljava/lang/ref/WeakReference;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Le/e/a/PopupPinchLayout;->owner:Ljava/lang/ref/WeakReference;

    .line 20
    return-void
.end method

.method private static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private resize(Ljava/lang/Object;F)V
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 94
    const-string v0, "U"

    invoke-static {p1, v0}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager$LayoutParams;

    .line 95
    const-string v1, "o"

    invoke-static {p1, v1}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 96
    const-string v1, "p"

    invoke-static {p1, v1}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v2, "l"

    invoke-static {p1, v2}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v12, 0x0

    invoke-static {v12, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    sub-int v7, v1, v2

    .line 97
    invoke-virtual {p0}, Le/e/a/PopupPinchLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 98
    const-string v2, "T"

    invoke-static {p1, v2}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/high16 v3, 0x42b40000    # 90.0f

    mul-float v3, v3, v1

    const/high16 v4, 0x43200000    # 160.0f

    mul-float v1, v1, v4

    iget v4, p0, Le/e/a/PopupPinchLayout;->ratio:F

    div-float/2addr v1, v4

    invoke-static {v3, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v4

    .line 99
    iget v3, p0, Le/e/a/PopupPinchLayout;->ratio:F

    .line 100
    const-string v1, "S"

    invoke-static {p1, v1}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v5

    .line 101
    iget v8, p0, Le/e/a/PopupPinchLayout;->anchorX:F

    iget v9, p0, Le/e/a/PopupPinchLayout;->anchorY:F

    iget v10, p0, Le/e/a/PopupPinchLayout;->fractionX:F

    iget v11, p0, Le/e/a/PopupPinchLayout;->fractionY:F

    .line 99
    move v2, p2

    invoke-static/range {v2 .. v11}, Le/e/a/PopupPinchGeometry;->bounds(FFFFIIFFFF)[I

    move-result-object p2

    .line 102
    const-string v1, "e"

    invoke-static {p1, v1}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 103
    const-string v2, "w"

    invoke-static {p1, v2}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 104
    const-string v3, "k0"

    invoke-static {p1, v3}, Le/e/a/PopupPinchLayout;->staticField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 105
    const-string v5, "a"

    const/4 v6, 0x1

    if-eqz v3, :cond_a9

    invoke-static {v3, v5}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 106
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    aget v8, p2, v12

    aget v9, p2, v6

    invoke-direct {v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 105
    invoke-virtual {v3, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 107
    :cond_a9
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    aget v7, p2, v12

    aget v8, p2, v6

    invoke-direct {v3, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 108
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    aget v3, p2, v12

    aget v7, p2, v6

    invoke-direct {v1, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    const/4 v1, 0x2

    aget v2, p2, v1

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 110
    const/4 v2, 0x3

    aget v3, p2, v2

    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 111
    const-string v3, "w0"

    invoke-static {p1, v3}, Le/e/a/PopupPinchLayout;->staticField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    aget v7, p2, v6

    int-to-float v7, v7

    invoke-virtual {v3, v4, v7}, Ljava/lang/reflect/Field;->setFloat(Ljava/lang/Object;F)V

    .line 112
    const-string v3, "u0"

    invoke-static {p1, v3}, Le/e/a/PopupPinchLayout;->staticField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    aget v1, p2, v1

    invoke-virtual {v3, v4, v1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 113
    const-string v1, "v0"

    invoke-static {p1, v1}, Le/e/a/PopupPinchLayout;->staticField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    aget p2, p2, v2

    invoke-virtual {v1, v4, p2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 114
    const-string p2, "b"

    invoke-static {p1, p2}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/WindowManager;

    invoke-static {p1, v5}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-interface {p2, p1, v0}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    iput-boolean v6, p0, Le/e/a/PopupPinchLayout;->changed:Z

    .line 116
    return-void
.end method

.method private save(Ljava/lang/Object;)V
    .registers 6

    .line 120
    :try_start_0
    const-string v0, "e"

    invoke-static {p1, v0}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 122
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 123
    const-string v1, "U"

    invoke-static {p1, v1}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager$LayoutParams;

    .line 124
    const-string v2, "Q"

    invoke-static {p1, v2}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 125
    const-string v2, "pop_ivw"

    iget v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-interface {p1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v2, "pop_poh"

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-interface {p1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 126
    const-string v0, "pop_pox"

    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "pop_poy"

    iget v1, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_43} :catch_44

    .line 127
    goto :goto_4c

    :catch_44
    move-exception p1

    const-string v0, "nicoid-pinch"

    const-string v1, "Cannot save popup size"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 128
    :goto_4c
    return-void
.end method

.method private span(Landroid/view/MotionEvent;II)F
    .registers 6

    .line 30
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, p3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    sub-float/2addr v0, v1

    float-to-double v0, v0

    .line 31
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p2

    invoke-virtual {p1, p3}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr p2, p1

    float-to-double p1, p2

    .line 30
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide p1

    double-to-float p1, p1

    return p1
.end method

.method private static staticField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bind(Ljava/lang/Object;)V
    .registers 3

    .line 21
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/PopupPinchLayout;->owner:Ljava/lang/ref/WeakReference;

    invoke-static {p1}, Le/e/a/PlaybackReturn;->bind(Ljava/lang/Object;)V

    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 19

    .line 35
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    iget-object v0, v1, Le/e/a/PopupPinchLayout;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    .line 36
    if-nez v3, :cond_11

    invoke-super/range {p0 .. p1}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 37
    :cond_11
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v4

    .line 38
    const/4 v5, 0x0

    if-nez v4, :cond_1e

    .line 40
    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->changed:Z

    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->scaling:Z

    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->consuming:Z

    .line 42
    :cond_1e
    iget-boolean v0, v1, Le/e/a/PopupPinchLayout;->consuming:Z

    const-string v6, "nicoid-pinch"

    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v9, 0x1

    if-nez v0, :cond_d9

    const/4 v0, 0x5

    if-ne v4, v0, :cond_d9

    .line 43
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-lt v0, v8, :cond_d9

    .line 44
    iput-boolean v9, v1, Le/e/a/PopupPinchLayout;->consuming:Z

    .line 45
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    .line 46
    invoke-virtual {v0, v7}, Landroid/view/MotionEvent;->setAction(I)V

    .line 47
    invoke-super {v1, v0}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 48
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 50
    :try_start_3f
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v10, "f0"

    invoke-virtual {v0, v10}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v10, 0x0

    invoke-virtual {v0, v3, v10}, Ljava/lang/reflect/Field;->setFloat(Ljava/lang/Object;F)V

    .line 51
    const-string v0, "e"

    invoke-static {v3, v0}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 52
    const-string v11, "U"

    invoke-static {v3, v11}, Le/e/a/PopupPinchLayout;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/view/WindowManager$LayoutParams;

    .line 53
    invoke-virtual {v2, v5}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v12

    iput v12, v1, Le/e/a/PopupPinchLayout;->firstId:I

    .line 54
    invoke-virtual {v2, v9}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v12

    iput v12, v1, Le/e/a/PopupPinchLayout;->secondId:I

    .line 55
    invoke-direct {v1, v2, v5, v9}, Le/e/a/PopupPinchLayout;->span(Landroid/view/MotionEvent;II)F

    move-result v12

    iput v12, v1, Le/e/a/PopupPinchLayout;->startSpan:F

    .line 56
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v12

    int-to-float v12, v12

    iput v12, v1, Le/e/a/PopupPinchLayout;->startHeight:F

    .line 57
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    .line 58
    iget v12, v1, Le/e/a/PopupPinchLayout;->startSpan:F

    const/high16 v13, 0x3f800000    # 1.0f

    cmpl-float v12, v12, v13

    if-lez v12, :cond_d9

    iget v12, v1, Le/e/a/PopupPinchLayout;->startHeight:F

    cmpl-float v12, v12, v10

    if-lez v12, :cond_d9

    cmpl-float v12, v0, v10

    if-lez v12, :cond_d9

    .line 59
    iget v12, v1, Le/e/a/PopupPinchLayout;->startHeight:F

    div-float v12, v0, v12

    iput v12, v1, Le/e/a/PopupPinchLayout;->ratio:F

    .line 60
    invoke-virtual {v2, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v12

    invoke-virtual {v2, v9}, Landroid/view/MotionEvent;->getX(I)F

    move-result v14

    add-float/2addr v12, v14

    const/high16 v14, 0x40000000    # 2.0f

    div-float/2addr v12, v14

    .line 61
    invoke-virtual {v2, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v15

    invoke-virtual {v2, v9}, Landroid/view/MotionEvent;->getY(I)F

    move-result v16

    add-float v15, v15, v16

    div-float/2addr v15, v14

    .line 62
    div-float v0, v12, v0

    invoke-static {v13, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v10, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, v1, Le/e/a/PopupPinchLayout;->fractionX:F

    .line 63
    iget v0, v1, Le/e/a/PopupPinchLayout;->startHeight:F

    div-float v0, v15, v0

    invoke-static {v13, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v10, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, v1, Le/e/a/PopupPinchLayout;->fractionY:F

    .line 64
    iget v0, v11, Landroid/view/WindowManager$LayoutParams;->x:I

    int-to-float v0, v0

    add-float/2addr v0, v12

    iput v0, v1, Le/e/a/PopupPinchLayout;->anchorX:F

    .line 65
    iget v0, v11, Landroid/view/WindowManager$LayoutParams;->y:I

    int-to-float v0, v0

    add-float/2addr v0, v15

    iput v0, v1, Le/e/a/PopupPinchLayout;->anchorY:F

    .line 66
    iput-boolean v9, v1, Le/e/a/PopupPinchLayout;->scaling:Z
    :try_end_d2
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_d2} :catch_d3

    .line 68
    goto :goto_d9

    :catch_d3
    move-exception v0

    const-string v10, "Cannot begin resize"

    invoke-static {v6, v10, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 70
    :cond_d9
    :goto_d9
    iget-boolean v0, v1, Le/e/a/PopupPinchLayout;->consuming:Z

    if-nez v0, :cond_e2

    invoke-super/range {p0 .. p1}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 71
    :cond_e2
    if-ne v4, v8, :cond_112

    iget-boolean v0, v1, Le/e/a/PopupPinchLayout;->scaling:Z

    if-eqz v0, :cond_112

    .line 72
    iget v0, v1, Le/e/a/PopupPinchLayout;->firstId:I

    invoke-virtual {v2, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    iget v8, v1, Le/e/a/PopupPinchLayout;->secondId:I

    invoke-virtual {v2, v8}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v8

    .line 73
    if-ltz v0, :cond_110

    if-ltz v8, :cond_110

    .line 74
    :try_start_f8
    iget v10, v1, Le/e/a/PopupPinchLayout;->startHeight:F

    invoke-direct {v1, v2, v0, v8}, Le/e/a/PopupPinchLayout;->span(Landroid/view/MotionEvent;II)F

    move-result v0

    mul-float v10, v10, v0

    iget v0, v1, Le/e/a/PopupPinchLayout;->startSpan:F

    div-float/2addr v10, v0

    invoke-direct {v1, v3, v10}, Le/e/a/PopupPinchLayout;->resize(Ljava/lang/Object;F)V
    :try_end_106
    .catch Ljava/lang/Exception; {:try_start_f8 .. :try_end_106} :catch_107

    goto :goto_112

    .line 75
    :catch_107
    move-exception v0

    .line 76
    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->scaling:Z

    .line 77
    const-string v8, "Cannot resize popup"

    invoke-static {v6, v8, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 79
    goto :goto_112

    :cond_110
    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->scaling:Z

    .line 81
    :cond_112
    :goto_112
    const/4 v0, 0x6

    if-ne v4, v0, :cond_127

    .line 82
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    .line 83
    iget v2, v1, Le/e/a/PopupPinchLayout;->firstId:I

    if-eq v0, v2, :cond_125

    iget v2, v1, Le/e/a/PopupPinchLayout;->secondId:I

    if-ne v0, v2, :cond_127

    :cond_125
    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->scaling:Z

    .line 85
    :cond_127
    if-eq v4, v9, :cond_12b

    if-ne v4, v7, :cond_138

    .line 86
    :cond_12b
    iget-boolean v0, v1, Le/e/a/PopupPinchLayout;->changed:Z

    if-eqz v0, :cond_132

    invoke-direct {v1, v3}, Le/e/a/PopupPinchLayout;->save(Ljava/lang/Object;)V

    .line 87
    :cond_132
    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->changed:Z

    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->scaling:Z

    iput-boolean v5, v1, Le/e/a/PopupPinchLayout;->consuming:Z

    .line 90
    :cond_138
    return v9
.end method
