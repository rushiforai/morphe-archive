.class public final Le/e/a/GestureRules219;
.super Ljava/lang/Object;
.source "GestureRules219.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/GestureRules219$Burst;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static center(FF)Z
    .registers 3

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_19

    const v0, 0x3eb33333    # 0.35f

    mul-float v0, v0, p1

    cmpl-float v0, p0, v0

    if-ltz v0, :cond_19

    const v0, 0x3f266666    # 0.65f

    mul-float p1, p1, v0

    cmpg-float p0, p0, p1

    if-gtz p0, :cond_19

    const/4 p0, 0x1

    return p0

    :cond_19
    const/4 p0, 0x0

    return p0
.end method

.method public static direction(FFFF)I
    .registers 6

    const/high16 v0, 0x42800000    # 64.0f

    mul-float v0, v0, p3

    const/high16 v1, 0x430c0000    # 140.0f

    mul-float p3, p3, v1

    const v1, 0x3e6147ae    # 0.22f

    mul-float p2, p2, v1

    .line 5
    invoke-static {p3, p2}, Ljava/lang/Math;->min(FF)F

    move-result p2

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p3

    cmpl-float p2, p3, p2

    if-ltz p2, :cond_37

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p2

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    const p3, 0x3fcccccd    # 1.6f

    mul-float p0, p0, p3

    cmpl-float p0, p2, p0

    if-lez p0, :cond_37

    const/4 p0, 0x0

    cmpl-float p0, p1, p0

    if-lez p0, :cond_35

    const/4 p0, 0x1

    goto :goto_38

    :cond_35
    const/4 p0, -0x1

    goto :goto_38

    :cond_37
    const/4 p0, 0x0

    :goto_38
    return p0
.end method

.method public static start(FFFFF)Z
    .registers 6

    const/high16 v0, 0x41c00000    # 24.0f

    mul-float p4, p4, v0

    cmpl-float v0, p0, p4

    if-ltz v0, :cond_18

    sub-float/2addr p2, p4

    cmpg-float p0, p0, p2

    if-gez p0, :cond_18

    cmpl-float p0, p1, p4

    if-ltz p0, :cond_18

    sub-float/2addr p3, p4

    cmpg-float p0, p1, p3

    if-gez p0, :cond_18

    const/4 p0, 0x1

    return p0

    :cond_18
    const/4 p0, 0x0

    return p0
.end method
