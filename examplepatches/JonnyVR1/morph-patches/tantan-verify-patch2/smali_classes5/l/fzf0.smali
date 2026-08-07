.class public Ll/fzf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Interpolator;


# instance fields
.field public a:F


# direct methods
.method public constructor <init>(F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/fzf0;->a:F

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 6

    .line 1
    const/high16 v0, -0x3ee00000    # -10.0f

    .line 2
    .line 3
    mul-float/2addr v0, p1

    .line 4
    float-to-double v0, v0

    .line 5
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 6
    .line 7
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->pow(DD)D

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget p0, p0, Ll/fzf0;->a:F

    .line 12
    .line 13
    const/high16 v2, 0x40800000    # 4.0f

    .line 14
    .line 15
    div-float v2, p0, v2

    .line 16
    .line 17
    sub-float/2addr p1, v2

    .line 18
    float-to-double v2, p1

    .line 19
    const-wide v4, 0x401921fb54442d18L    # 6.283185307179586

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    mul-double/2addr v2, v4

    .line 25
    float-to-double p0, p0

    .line 26
    div-double/2addr v2, p0

    .line 27
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 28
    .line 29
    .line 30
    move-result-wide p0

    .line 31
    mul-double/2addr v0, p0

    .line 32
    const-wide/high16 p0, 0x3ff0000000000000L    # 1.0

    .line 33
    .line 34
    add-double/2addr v0, p0

    .line 35
    double-to-float p0, v0

    .line 36
    return p0
.end method
