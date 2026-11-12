.class public final Lli7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/TimeInterpolator;


# virtual methods
.method public final getInterpolation(F)F
    .registers 6

    const-wide/high16 v0, -0x3fdc000000000000L    # -10.0

    float-to-double v2, p1

    mul-double/2addr v2, v0

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    const/high16 p0, 0x40a00000    # 5.0f

    mul-float/2addr p1, p0

    float-to-double p0, p1

    const-wide/high16 v2, 0x3fe8000000000000L    # 0.75

    sub-double/2addr p0, v2

    const-wide v2, 0x4000c152382d7365L    # 2.0943951023931953

    mul-double/2addr p0, v2

    invoke-static {p0, p1}, Ljava/lang/Math;->sin(D)D

    move-result-wide p0

    mul-double/2addr p0, v0

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    add-double/2addr p0, v0

    double-to-float p0, p0

    return p0
.end method
