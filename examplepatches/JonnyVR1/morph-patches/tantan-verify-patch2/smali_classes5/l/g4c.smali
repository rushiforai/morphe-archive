.class public Ll/g4c;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/Path;

.field public b:Landroid/graphics/Paint;

.field public c:F

.field public d:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 72
    const-string v0, "#edb54e"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Ll/g4c;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x40200000    # 2.5f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Ll/g4c;->d:I

    .line 11
    .line 12
    new-instance v0, Landroid/graphics/Path;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/g4c;->a:Landroid/graphics/Path;

    .line 18
    .line 19
    new-instance v0, Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/g4c;->b:Landroid/graphics/Paint;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/g4c;->b:Landroid/graphics/Paint;

    .line 30
    .line 31
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/g4c;->b:Landroid/graphics/Paint;

    .line 37
    .line 38
    iget v0, p0, Ll/g4c;->d:I

    .line 39
    .line 40
    int-to-float v0, v0

    .line 41
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 42
    .line 43
    .line 44
    const/high16 p1, 0x40400000    # 3.0f

    .line 45
    .line 46
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    new-instance v0, Landroid/graphics/DashPathEffect;

    .line 51
    .line 52
    int-to-float p1, p1

    .line 53
    const/4 v1, 0x2

    .line 54
    new-array v1, v1, [F

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    aput p1, v1, v2

    .line 58
    .line 59
    const/4 v2, 0x1

    .line 60
    aput p1, v1, v2

    .line 61
    .line 62
    const/4 p1, 0x0

    .line 63
    invoke-direct {v0, v1, p1}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/g4c;->b:Landroid/graphics/Paint;

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 69
    .line 70
    .line 71
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g4c;->a:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/g4c;->a:Landroid/graphics/Path;

    .line 7
    .line 8
    invoke-virtual {v0, p2, p3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Ll/g4c;->a:Landroid/graphics/Path;

    .line 12
    .line 13
    invoke-virtual {p2, p4, p5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/g4c;->a:Landroid/graphics/Path;

    .line 17
    .line 18
    invoke-virtual {p1, p0, p6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/g4c;->d:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/g4c;->c:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p0, Ll/g4c;->c:F

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    mul-float/2addr v2, v3

    .line 16
    sub-float/2addr v1, v2

    .line 17
    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    int-to-float v5, v2

    .line 20
    iget v3, p0, Ll/g4c;->c:F

    .line 21
    .line 22
    int-to-float v2, v2

    .line 23
    mul-float/2addr v2, v3

    .line 24
    add-float v6, v2, v1

    .line 25
    .line 26
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 27
    .line 28
    int-to-float v7, v0

    .line 29
    int-to-float v0, v0

    .line 30
    mul-float/2addr v3, v0

    .line 31
    add-float v8, v3, v1

    .line 32
    .line 33
    iget-object v9, p0, Ll/g4c;->b:Landroid/graphics/Paint;

    .line 34
    .line 35
    move-object v3, p0

    .line 36
    move-object v4, p1

    .line 37
    invoke-virtual/range {v3 .. v9}, Ll/g4c;->a(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public scheduleSelf(Ljava/lang/Runnable;J)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    return-void
.end method
