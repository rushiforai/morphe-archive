.class public final Le/e/a/GestureRules;
.super Ljava/lang/Object;
.source "GestureRules.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static startArea(FFFFF)Z
    .registers 9
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "width"    # F
    .param p3, "height"    # F
    .param p4, "density"    # F

    .line 10
    const/high16 v0, 0x41c00000    # 24.0f

    mul-float v0, v0, p4

    const v1, 0x3da3d70a    # 0.08f

    mul-float v1, v1, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .local v0, "side":F
    const/high16 v1, 0x42400000    # 48.0f

    mul-float v1, v1, p4

    const v2, 0x3e4ccccd    # 0.2f

    mul-float v2, v2, p3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .local v1, "top":F
    const/high16 v2, 0x42600000    # 56.0f

    mul-float v2, v2, p4

    const v3, 0x3e6b851f    # 0.23f

    mul-float v3, v3, p3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 11
    .local v2, "bottom":F
    cmpl-float v3, p0, v0

    if-ltz v3, :cond_3d

    sub-float v3, p2, v0

    cmpg-float v3, p0, v3

    if-gtz v3, :cond_3d

    cmpl-float v3, p1, v1

    if-ltz v3, :cond_3d

    sub-float v3, p3, v2

    cmpg-float v3, p1, v3

    if-gtz v3, :cond_3d

    const/4 v3, 0x1

    goto :goto_3e

    :cond_3d
    const/4 v3, 0x0

    :goto_3e
    return v3
.end method

.method public static target(ZZFF)I
    .registers 7
    .param p0, "volume"    # Z
    .param p1, "brightness"    # Z
    .param p2, "x"    # F
    .param p3, "width"    # F

    .line 5
    const/4 v0, 0x2

    const/4 v1, 0x1

    if-eqz p0, :cond_10

    if-eqz p1, :cond_10

    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, p3, v2

    cmpl-float v2, p2, v2

    if-ltz v2, :cond_f

    const/4 v0, 0x1

    :cond_f
    return v0

    .line 6
    :cond_10
    if-eqz p0, :cond_14

    const/4 v0, 0x1

    goto :goto_18

    :cond_14
    if-eqz p1, :cond_17

    goto :goto_18

    :cond_17
    const/4 v0, 0x0

    :goto_18
    return v0
.end method

.method public static value(FFFFF)F
    .registers 7
    .param p0, "start"    # F
    .param p1, "dy"    # F
    .param p2, "height"    # F
    .param p3, "min"    # F
    .param p4, "max"    # F

    .line 14
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    div-float v0, p1, v0

    sub-float v1, p4, p3

    mul-float v0, v0, v1

    const/high16 v1, 0x3fc00000    # 1.5f

    mul-float v0, v0, v1

    sub-float v0, p0, v0

    invoke-static {p4, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {p3, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method public static vertical(FFF)Z
    .registers 6
    .param p0, "dx"    # F
    .param p1, "dy"    # F
    .param p2, "slop"    # F

    .line 8
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpl-float v0, v0, p2

    if-lez v0, :cond_1a

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    mul-float v1, v1, v2

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1a

    const/4 v0, 0x1

    goto :goto_1b

    :cond_1a
    const/4 v0, 0x0

    :goto_1b
    return v0
.end method
