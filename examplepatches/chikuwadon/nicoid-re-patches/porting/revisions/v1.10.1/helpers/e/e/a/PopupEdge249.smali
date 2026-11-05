.class public final Le/e/a/PopupEdge249;
.super Ljava/lang/Object;
.source "PopupEdge249.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static hit(FFIIF)Z
    .registers 9

    .line 7
    const/4 v0, 0x0

    if-lez p2, :cond_44

    if-lez p3, :cond_44

    const/4 v1, 0x0

    cmpg-float v1, p4, v1

    if-lez v1, :cond_44

    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_44

    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_17

    goto :goto_44

    .line 8
    :cond_17
    int-to-float p2, p2

    const/high16 v1, 0x40800000    # 4.0f

    div-float v2, p2, v1

    const/high16 v3, 0x41800000    # 16.0f

    mul-float/2addr v3, p4

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 9
    int-to-float p3, p3

    div-float v1, p3, v1

    const/high16 v3, 0x41f00000    # 30.0f

    mul-float/2addr p4, v3

    invoke-static {v1, p4}, Ljava/lang/Math;->min(FF)F

    move-result p4

    .line 10
    sub-float v1, p2, v2

    cmpl-float v1, p0, v1

    if-ltz v1, :cond_43

    cmpg-float p0, p0, p2

    if-gez p0, :cond_43

    sub-float p0, p3, p4

    cmpl-float p0, p1, p0

    if-ltz p0, :cond_43

    cmpg-float p0, p1, p3

    if-gez p0, :cond_43

    const/4 p0, 0x1

    return p0

    :cond_43
    return v0

    .line 7
    :cond_44
    :goto_44
    return v0
.end method

.method static hit(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 7

    .line 13
    const/4 v0, 0x2

    new-array v0, v0, [I

    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_37

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    aget v4, v0, v2

    int-to-float v4, v4

    sub-float/2addr v1, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    aget v0, v0, v3

    int-to-float v0, v0

    sub-float/2addr p1, v0

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v4

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 14
    invoke-static {v1, p1, v0, v4, p0}, Le/e/a/PopupEdge249;->hit(FFIIF)Z

    move-result p0

    .line 15
    if-eqz p0, :cond_37

    .line 14
    return v3

    :cond_37
    return v2
.end method
