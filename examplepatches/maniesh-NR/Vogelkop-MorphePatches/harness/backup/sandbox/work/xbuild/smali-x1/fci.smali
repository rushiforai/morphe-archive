.class public final Lfci;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Interpolator;


# instance fields
.field public a:F


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x3f59999a    # 0.85f

    iput v0, p0, Lfci;->a:F

    return-void
.end method


# virtual methods
.method public final getInterpolation(F)F
    .registers 5

    iget p0, p0, Lfci;->a:F

    mul-float v0, p0, p1

    const/high16 v1, 0x40000000    # 2.0f

    mul-float v2, p0, v1

    mul-float/2addr v2, p1

    sub-float/2addr v2, p0

    sub-float/2addr v2, p1

    const/high16 p0, 0x3f800000    # 1.0f

    add-float/2addr v2, p0

    div-float/2addr v0, v2

    const/high16 p1, 0x3f000000    # 0.5f

    sub-float/2addr v0, p1

    mul-float/2addr v0, v1

    const/4 v1, 0x0

    cmpg-float v1, v0, v1

    if-gez v1, :cond_1b

    const/high16 v1, -0x40800000    # -1.0f

    goto :goto_1c

    :cond_1b
    move v1, p0

    :goto_1c
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    mul-float v2, v0, v0

    add-float/2addr v2, p0

    div-float/2addr v0, v2

    div-float/2addr v0, p1

    mul-float/2addr v0, v1

    mul-float/2addr v0, p1

    add-float/2addr v0, p1

    return v0
.end method
