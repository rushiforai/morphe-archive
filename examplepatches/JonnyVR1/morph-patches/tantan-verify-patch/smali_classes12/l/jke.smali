.class public Ll/jke;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Interpolator;


# instance fields
.field private a:I

.field private final b:Landroid/graphics/PointF;

.field private final c:Landroid/graphics/PointF;


# direct methods
.method public constructor <init>(FFFF)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/jke;->a:I

    .line 6
    .line 7
    new-instance v0, Landroid/graphics/PointF;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/jke;->b:Landroid/graphics/PointF;

    .line 13
    .line 14
    new-instance v1, Landroid/graphics/PointF;

    .line 15
    .line 16
    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Ll/jke;->c:Landroid/graphics/PointF;

    .line 20
    .line 21
    iput p1, v0, Landroid/graphics/PointF;->x:F

    .line 22
    .line 23
    iput p2, v0, Landroid/graphics/PointF;->y:F

    .line 24
    .line 25
    iput p3, v1, Landroid/graphics/PointF;->x:F

    .line 26
    .line 27
    iput p4, v1, Landroid/graphics/PointF;->y:F

    .line 28
    .line 29
    return-void
.end method

.method public static a(DDDDD)D
    .locals 10

    .line 1
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 2
    .line 3
    sub-double/2addr v0, p0

    .line 4
    mul-double v2, p0, p0

    .line 5
    .line 6
    mul-double v4, v0, v0

    .line 7
    .line 8
    mul-double v6, v4, v0

    .line 9
    .line 10
    mul-double v8, v2, p0

    .line 11
    .line 12
    mul-double/2addr v6, p2

    .line 13
    const-wide/high16 p2, 0x4008000000000000L    # 3.0

    .line 14
    .line 15
    mul-double/2addr v4, p2

    .line 16
    mul-double/2addr v4, p0

    .line 17
    mul-double/2addr v4, p4

    .line 18
    add-double/2addr v6, v4

    .line 19
    mul-double/2addr v0, p2

    .line 20
    mul-double/2addr v0, v2

    .line 21
    mul-double v0, v0, p6

    .line 22
    .line 23
    add-double/2addr v6, v0

    .line 24
    mul-double v8, v8, p8

    .line 25
    .line 26
    add-double/2addr v6, v8

    .line 27
    return-wide v6
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 12

    .line 1
    iget v0, p0, Ll/jke;->a:I

    .line 2
    .line 3
    move v1, p1

    .line 4
    :goto_0
    const/16 v2, 0x1000

    .line 5
    .line 6
    if-ge v0, v2, :cond_1

    .line 7
    .line 8
    const/high16 v1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    int-to-float v2, v0

    .line 11
    mul-float/2addr v2, v1

    .line 12
    const/high16 v1, 0x45800000    # 4096.0f

    .line 13
    .line 14
    div-float v1, v2, v1

    .line 15
    .line 16
    float-to-double v2, v1

    .line 17
    iget-object v4, p0, Ll/jke;->b:Landroid/graphics/PointF;

    .line 18
    .line 19
    iget v4, v4, Landroid/graphics/PointF;->x:F

    .line 20
    .line 21
    float-to-double v6, v4

    .line 22
    iget-object v4, p0, Ll/jke;->c:Landroid/graphics/PointF;

    .line 23
    .line 24
    iget v4, v4, Landroid/graphics/PointF;->x:F

    .line 25
    .line 26
    float-to-double v8, v4

    .line 27
    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    .line 28
    .line 29
    const-wide/16 v4, 0x0

    .line 30
    .line 31
    invoke-static/range {v2 .. v11}, Ll/jke;->a(DDDDD)D

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    float-to-double v4, p1

    .line 36
    cmpl-double v2, v2, v4

    .line 37
    .line 38
    if-ltz v2, :cond_0

    .line 39
    .line 40
    iput v0, p0, Ll/jke;->a:I

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    :goto_1
    float-to-double v2, v1

    .line 47
    iget-object p1, p0, Ll/jke;->b:Landroid/graphics/PointF;

    .line 48
    .line 49
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 50
    .line 51
    float-to-double v6, p1

    .line 52
    iget-object p1, p0, Ll/jke;->c:Landroid/graphics/PointF;

    .line 53
    .line 54
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 55
    .line 56
    float-to-double v8, p1

    .line 57
    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    .line 58
    .line 59
    const-wide/16 v4, 0x0

    .line 60
    .line 61
    invoke-static/range {v2 .. v11}, Ll/jke;->a(DDDDD)D

    .line 62
    .line 63
    .line 64
    move-result-wide v0

    .line 65
    const-wide v2, 0x3feff7ced916872bL    # 0.999

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    cmpl-double p1, v0, v2

    .line 71
    .line 72
    if-lez p1, :cond_2

    .line 73
    .line 74
    const/4 p1, 0x0

    .line 75
    iput p1, p0, Ll/jke;->a:I

    .line 76
    .line 77
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 78
    .line 79
    :cond_2
    double-to-float p0, v0

    .line 80
    return p0
.end method
