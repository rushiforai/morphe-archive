.class public final Le/e/a/CommentLayoutRules;
.super Ljava/lang/Object;
.source "CommentLayoutRules.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static baseline(IIIF)F
    .registers 5

    .line 11
    int-to-float p0, p0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p0, v0

    int-to-float p2, p2

    mul-float p0, p0, p2

    int-to-float p1, p1

    div-float/2addr p0, p1

    const p1, 0x3eb33333    # 0.35f

    mul-float p3, p3, p1

    add-float/2addr p0, p3

    return p0
.end method

.method public static clears(FFFFF)Z
    .registers 8

    .line 6
    add-float v0, p0, p4

    const/4 v1, 0x0

    cmpl-float v0, v0, p3

    if-lez v0, :cond_8

    return v1

    .line 7
    :cond_8
    const/4 v0, 0x0

    const/4 v2, 0x1

    cmpg-float v0, p0, v0

    if-lez v0, :cond_1e

    cmpg-float v0, p2, p1

    if-gtz v0, :cond_13

    goto :goto_1e

    .line 8
    :cond_13
    sub-float/2addr p3, p0

    sub-float/2addr p3, p4

    sub-float/2addr p2, p1

    div-float/2addr p3, p2

    div-float/2addr p0, p1

    cmpl-float p0, p3, p0

    if-ltz p0, :cond_1d

    const/4 v1, 0x1

    :cond_1d
    return v1

    .line 7
    :cond_1e
    :goto_1e
    return v2
.end method

.method public static occupiedRows(FII)I
    .registers 3

    .line 10
    int-to-float p1, p1

    int-to-float p2, p2

    div-float/2addr p1, p2

    div-float/2addr p0, p1

    float-to-double p0, p0

    invoke-static {p0, p1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide p0

    double-to-int p0, p0

    const/4 p1, 0x1

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method
