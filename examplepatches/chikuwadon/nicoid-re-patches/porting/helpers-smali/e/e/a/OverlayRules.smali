.class public final Le/e/a/OverlayRules;
.super Ljava/lang/Object;
.source "OverlayRules.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static central(IF)I
    .registers 5
    .param p0, "height"    # I
    .param p1, "density"    # F

    .line 6
    const/high16 v0, 0x42800000    # 64.0f

    mul-float v0, v0, p1

    int-to-float v1, p0

    const v2, 0x3e8a3d71    # 0.27f

    mul-float v1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public static slot(I)I
    .registers 3
    .param p0, "height"    # I

    .line 5
    int-to-float v0, p0

    const/high16 v1, 0x3fa00000    # 1.25f

    mul-float v0, v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public static toolbar(IIF)I
    .registers 6
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "density"    # F

    .line 4
    const/high16 v0, 0x42100000    # 36.0f

    mul-float v0, v0, p2

    int-to-float v1, p1

    const v2, 0x3e23d70a    # 0.16f

    mul-float v1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    int-to-float v1, p0

    const/high16 v2, 0x41080000    # 8.5f

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method
