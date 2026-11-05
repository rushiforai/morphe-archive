.class public final Le/e/a/PopupPinchGeometry;
.super Ljava/lang/Object;
.source "PopupPinchGeometry.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bounds(FFFFIIFFFF)[I
    .registers 21
    .param p0, "requestedHeight"    # F
    .param p1, "ratio"    # F
    .param p2, "minHeight"    # F
    .param p3, "maxHeight"    # F
    .param p4, "screenWidth"    # I
    .param p5, "screenHeight"    # I
    .param p6, "anchorX"    # F
    .param p7, "anchorY"    # F
    .param p8, "fractionX"    # F
    .param p9, "fractionY"    # F

    .line 10
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_b

    invoke-static {p1}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_b
    const p1, 0x3fe38e39

    .line 11
    :cond_e
    const/4 v0, 0x1

    move v1, p4

    invoke-static {v0, p4}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 12
    .end local p4    # "screenWidth":I
    .local v1, "screenWidth":I
    move/from16 v2, p5

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 13
    .end local p5    # "screenHeight":I
    .local v2, "screenHeight":I
    int-to-float v3, v2

    int-to-float v4, v1

    div-float/2addr v4, p1

    .line 14
    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 13
    invoke-static {p3, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v5, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 15
    .local v3, "upper":F
    invoke-static {v5, p2}, Ljava/lang/Math;->max(FF)F

    move-result v5

    invoke-static {v3, v5}, Ljava/lang/Math;->min(FF)F

    move-result v5

    .line 16
    .local v5, "lower":F
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    if-eqz v6, :cond_3a

    move p0, v5

    .line 17
    :cond_3a
    nop

    .line 18
    invoke-static {v3, p0}, Ljava/lang/Math;->min(FF)F

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 17
    invoke-static {v2, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-static {v0, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 19
    .local v6, "height":I
    int-to-float v7, v6

    mul-float v7, v7, p1

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-static {v0, v7}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 20
    .local v0, "width":I
    sub-int v7, v1, v0

    int-to-float v8, v0

    mul-float v8, v8, p8

    sub-float v8, p6, v8

    .line 21
    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 20
    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    const/4 v8, 0x0

    invoke-static {v8, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 22
    .local v7, "x":I
    sub-int v9, v2, v6

    int-to-float v10, v6

    mul-float v10, v10, p9

    sub-float v10, p7, v10

    .line 23
    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v10

    .line 22
    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 24
    .local v8, "y":I
    filled-new-array {v0, v6, v7, v8}, [I

    move-result-object v9

    return-object v9
.end method
