.class public final Le/e/a/PullGestureRules;
.super Ljava/lang/Object;
.source "PullGestureRules.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static accepts(FFJ)Z
    .registers 5

    .line 5
    invoke-static {p1}, Le/e/a/PullGestureRules;->threshold(F)F

    move-result p1

    cmpl-float p0, p0, p1

    if-ltz p0, :cond_10

    const-wide/16 p0, 0x12c

    cmp-long v0, p2, p0

    if-ltz v0, :cond_10

    const/4 p0, 0x1

    goto :goto_11

    :cond_10
    const/4 p0, 0x0

    :goto_11
    return p0
.end method

.method public static threshold(F)F
    .registers 2

    .line 4
    const v0, 0x3e6147ae    # 0.22f

    mul-float p0, p0, v0

    const/high16 v0, 0x43700000    # 240.0f

    invoke-static {v0, p0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    const/high16 v0, 0x43200000    # 160.0f

    invoke-static {v0, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0
.end method
