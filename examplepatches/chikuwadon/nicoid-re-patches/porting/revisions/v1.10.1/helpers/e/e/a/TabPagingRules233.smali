.class public final Le/e/a/TabPagingRules233;
.super Ljava/lang/Object;
.source "TabPagingRules233.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static claim(FFI)Z
    .registers 4

    .line 4
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    mul-int/lit8 p2, p2, 0x2

    int-to-float p2, p2

    cmpl-float p2, v0, p2

    if-lez p2, :cond_1d

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const p2, 0x3fe66666    # 1.8f

    mul-float/2addr p1, p2

    cmpl-float p0, p0, p1

    if-lez p0, :cond_1d

    const/4 p0, 0x1

    return p0

    :cond_1d
    const/4 p0, 0x0

    return p0
.end method

.method public static commit(FIF)Z
    .registers 7

    .line 5
    const/4 v0, 0x0

    if-lez p1, :cond_28

    const/4 v1, 0x0

    cmpl-float v2, p0, v1

    if-nez v2, :cond_9

    goto :goto_28

    :cond_9
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result v2

    int-to-float p1, p1

    const v3, 0x3e99999a    # 0.3f

    mul-float/2addr p1, v3

    cmpl-float p1, v2, p1

    if-gtz p1, :cond_26

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const/high16 v2, 0x44160000    # 600.0f

    cmpl-float p1, p1, v2

    if-lez p1, :cond_25

    mul-float/2addr p2, p0

    cmpl-float p0, p2, v1

    if-gtz p0, :cond_26

    :cond_25
    return v0

    :cond_26
    const/4 p0, 0x1

    return p0

    :cond_28
    :goto_28
    return v0
.end method
