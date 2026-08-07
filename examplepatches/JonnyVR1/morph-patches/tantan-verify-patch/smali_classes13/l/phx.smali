.class public Ll/phx;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/phx;->b:Lrx/subjects/b;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x9

    .line 5
    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    iput-object v0, p0, Ll/phx;->a:[F

    .line 9
    .line 10
    return-void
.end method

.method public static a(Landroid/graphics/RectF;Landroid/graphics/Matrix;Landroid/graphics/RectF;)Landroid/graphics/Matrix;
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Landroid/graphics/Matrix;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 15
    .line 16
    .line 17
    new-instance p1, Landroid/graphics/RectF;

    .line 18
    .line 19
    invoke-direct {p1, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    cmpg-float p0, p0, v2

    .line 34
    .line 35
    if-gez p0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    div-float/2addr p0, v2

    .line 46
    invoke-static {v0, p0, v1, p1}, Ll/phx;->f(Landroid/graphics/RectF;FLandroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    cmpg-float p0, p0, v2

    .line 58
    .line 59
    if-gez p0, :cond_1

    .line 60
    .line 61
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    div-float/2addr p0, v2

    .line 70
    invoke-static {v0, p0, v1, p1}, Ll/phx;->f(Landroid/graphics/RectF;FLandroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    iget p0, p1, Landroid/graphics/RectF;->left:F

    .line 74
    .line 75
    iget v2, p2, Landroid/graphics/RectF;->left:F

    .line 76
    .line 77
    cmpl-float v3, p0, v2

    .line 78
    .line 79
    const/4 v4, 0x0

    .line 80
    if-lez v3, :cond_2

    .line 81
    .line 82
    sub-float/2addr v2, p0

    .line 83
    invoke-static {v0, v2, v4, v1, p1}, Ll/phx;->h(Landroid/graphics/RectF;FFLandroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    iget p0, p1, Landroid/graphics/RectF;->right:F

    .line 87
    .line 88
    iget v2, p2, Landroid/graphics/RectF;->right:F

    .line 89
    .line 90
    cmpg-float v3, p0, v2

    .line 91
    .line 92
    if-gez v3, :cond_3

    .line 93
    .line 94
    sub-float/2addr v2, p0

    .line 95
    invoke-static {v0, v2, v4, v1, p1}, Ll/phx;->h(Landroid/graphics/RectF;FFLandroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 96
    .line 97
    .line 98
    :cond_3
    iget p0, p1, Landroid/graphics/RectF;->top:F

    .line 99
    .line 100
    iget v2, p2, Landroid/graphics/RectF;->top:F

    .line 101
    .line 102
    cmpl-float v3, p0, v2

    .line 103
    .line 104
    if-lez v3, :cond_4

    .line 105
    .line 106
    sub-float/2addr v2, p0

    .line 107
    invoke-static {v0, v4, v2, v1, p1}, Ll/phx;->h(Landroid/graphics/RectF;FFLandroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 108
    .line 109
    .line 110
    :cond_4
    iget p0, p1, Landroid/graphics/RectF;->bottom:F

    .line 111
    .line 112
    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    .line 113
    .line 114
    cmpg-float v2, p0, p2

    .line 115
    .line 116
    if-gez v2, :cond_5

    .line 117
    .line 118
    sub-float/2addr p2, p0

    .line 119
    invoke-static {v0, v4, p2, v1, p1}, Ll/phx;->h(Landroid/graphics/RectF;FFLandroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 120
    .line 121
    .line 122
    :cond_5
    return-object v1
.end method

.method public static f(Landroid/graphics/RectF;FLandroid/graphics/Matrix;Landroid/graphics/RectF;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Landroid/graphics/RectF;->centerX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p3}, Landroid/graphics/RectF;->centerY()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p2, p1, p1, v0, v1}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 10
    .line 11
    .line 12
    invoke-static {p0, p2, p3}, Ll/phx;->g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Landroid/graphics/RectF;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static h(Landroid/graphics/RectF;FFLandroid/graphics/Matrix;Landroid/graphics/RectF;)V
    .locals 0

    .line 1
    invoke-virtual {p3, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p3, p4}, Ll/phx;->g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public b(Landroid/graphics/Matrix;)F
    .locals 1

    .line 1
    iget-object v0, p0, Ll/phx;->a:[F

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/phx;->a:[F

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    aget p0, p0, p1

    .line 10
    .line 11
    return p0
.end method

.method public c(Landroid/graphics/Matrix;)F
    .locals 1

    .line 1
    iget-object v0, p0, Ll/phx;->a:[F

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/phx;->a:[F

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    aget p0, p0, p1

    .line 10
    .line 11
    return p0
.end method

.method public d(Landroid/graphics/Matrix;)F
    .locals 1

    .line 1
    iget-object v0, p0, Ll/phx;->a:[F

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/phx;->a:[F

    .line 7
    .line 8
    const/4 p1, 0x2

    .line 9
    aget p0, p0, p1

    .line 10
    .line 11
    return p0
.end method

.method public e(Landroid/graphics/Matrix;)F
    .locals 1

    .line 1
    iget-object v0, p0, Ll/phx;->a:[F

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/phx;->a:[F

    .line 7
    .line 8
    const/4 p1, 0x5

    .line 9
    aget p0, p0, p1

    .line 10
    .line 11
    return p0
.end method
