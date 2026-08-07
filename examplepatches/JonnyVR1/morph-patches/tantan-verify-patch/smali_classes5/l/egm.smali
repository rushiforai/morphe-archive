.class public Ll/egm;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(II)Landroid/graphics/drawable/ShapeDrawable;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/drawable/shapes/RoundRectShape;

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    const/16 v1, 0x8

    .line 5
    .line 6
    new-array v1, v1, [F

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    aput p1, v1, v2

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    aput p1, v1, v2

    .line 13
    .line 14
    const/4 v2, 0x2

    .line 15
    aput p1, v1, v2

    .line 16
    .line 17
    const/4 v2, 0x3

    .line 18
    aput p1, v1, v2

    .line 19
    .line 20
    const/4 v2, 0x4

    .line 21
    aput p1, v1, v2

    .line 22
    .line 23
    const/4 v2, 0x5

    .line 24
    aput p1, v1, v2

    .line 25
    .line 26
    const/4 v2, 0x6

    .line 27
    aput p1, v1, v2

    .line 28
    .line 29
    const/4 v2, 0x7

    .line 30
    aput p1, v1, v2

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-direct {v0, v1, p1, p1}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    .line 34
    .line 35
    .line 36
    new-instance p1, Landroid/graphics/drawable/ShapeDrawable;

    .line 37
    .line 38
    invoke-direct {p1, v0}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 55
    .line 56
    .line 57
    return-object p1
.end method
