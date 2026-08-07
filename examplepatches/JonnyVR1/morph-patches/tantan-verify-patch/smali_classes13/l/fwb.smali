.class public abstract Ll/fwb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dw5;


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Paint;

.field public e:Ll/bwb;


# direct methods
.method public constructor <init>(Ll/bwb;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fwb;->e:Ll/bwb;

    .line 5
    .line 6
    new-instance p1, Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ll/fwb;->a:Landroid/graphics/Paint;

    .line 13
    .line 14
    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    .line 15
    .line 16
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 17
    .line 18
    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 22
    .line 23
    .line 24
    new-instance p1, Landroid/graphics/Paint;

    .line 25
    .line 26
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/fwb;->c:Landroid/graphics/Paint;

    .line 30
    .line 31
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/fwb;->c:Landroid/graphics/Paint;

    .line 37
    .line 38
    sget-object v2, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    .line 39
    .line 40
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 41
    .line 42
    .line 43
    new-instance p1, Landroid/graphics/Paint;

    .line 44
    .line 45
    iget-object v2, p0, Ll/fwb;->c:Landroid/graphics/Paint;

    .line 46
    .line 47
    invoke-direct {p1, v2}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Ll/fwb;->d:Landroid/graphics/Paint;

    .line 51
    .line 52
    new-instance p1, Landroid/graphics/Paint;

    .line 53
    .line 54
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Ll/fwb;->b:Landroid/graphics/Paint;

    .line 58
    .line 59
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/fwb;->b:Landroid/graphics/Paint;

    .line 63
    .line 64
    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/fwb;->h()V

    .line 70
    .line 71
    .line 72
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fwb;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public abstract b(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
.end method

.method public final c(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fwb;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Ll/fwb;->b(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/fwb;->e:Ll/bwb;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/bwb;->Q()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/fwb;->c:Landroid/graphics/Paint;

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2, v0}, Ll/fwb;->f(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/fwb;->d:Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-virtual {p0, p1, p2, v0}, Ll/fwb;->d(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public abstract d(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
.end method

.method public e(Landroid/graphics/Canvas;FFFF)V
    .locals 6

    .line 1
    add-float v3, p2, p4

    .line 2
    .line 3
    iget-object v5, p0, Ll/fwb;->b:Landroid/graphics/Paint;

    .line 4
    .line 5
    move v4, p3

    .line 6
    move-object v0, p1

    .line 7
    move v1, p2

    .line 8
    move v2, p3

    .line 9
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 10
    .line 11
    .line 12
    move p1, v1

    .line 13
    move p2, v2

    .line 14
    add-float p4, p2, p5

    .line 15
    .line 16
    iget-object p5, p0, Ll/fwb;->b:Landroid/graphics/Paint;

    .line 17
    .line 18
    move p3, p1

    .line 19
    move-object p0, v0

    .line 20
    invoke-virtual/range {p0 .. p5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public f(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 14

    .line 1
    move-object/from16 p0, p2

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const v1, 0x3eaa7efa    # 0.333f

    .line 8
    .line 9
    .line 10
    mul-float/2addr v0, v1

    .line 11
    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    mul-float/2addr v2, v1

    .line 16
    iget v1, p0, Landroid/graphics/RectF;->left:F

    .line 17
    .line 18
    iget v3, p0, Landroid/graphics/RectF;->top:F

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    :goto_0
    const/4 v5, 0x2

    .line 22
    if-ge v4, v5, :cond_0

    .line 23
    .line 24
    add-float v7, v1, v0

    .line 25
    .line 26
    add-float/2addr v3, v2

    .line 27
    iget v8, p0, Landroid/graphics/RectF;->top:F

    .line 28
    .line 29
    iget v10, p0, Landroid/graphics/RectF;->bottom:F

    .line 30
    .line 31
    move v9, v7

    .line 32
    move-object v6, p1

    .line 33
    move-object/from16 v11, p3

    .line 34
    .line 35
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 36
    .line 37
    .line 38
    iget v9, p0, Landroid/graphics/RectF;->left:F

    .line 39
    .line 40
    iget v11, p0, Landroid/graphics/RectF;->right:F

    .line 41
    .line 42
    move v12, v3

    .line 43
    move-object v8, p1

    .line 44
    move-object/from16 v13, p3

    .line 45
    .line 46
    move v10, v3

    .line 47
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 48
    .line 49
    .line 50
    add-int/lit8 v4, v4, 0x1

    .line 51
    .line 52
    move v1, v7

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    return-void
.end method

.method public abstract g()Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaShapeMask;
.end method

.method public final h()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fwb;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fwb;->e:Ll/bwb;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/bwb;->i()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/fwb;->b:Landroid/graphics/Paint;

    .line 14
    .line 15
    iget-object v1, p0, Ll/fwb;->e:Ll/bwb;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/bwb;->h()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/fwb;->c:Landroid/graphics/Paint;

    .line 25
    .line 26
    iget-object v1, p0, Ll/fwb;->e:Ll/bwb;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/bwb;->k()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/fwb;->c:Landroid/graphics/Paint;

    .line 36
    .line 37
    iget-object v1, p0, Ll/fwb;->e:Ll/bwb;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/bwb;->l()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    int-to-float v1, v1

    .line 44
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/fwb;->d:Landroid/graphics/Paint;

    .line 48
    .line 49
    iget-object v1, p0, Ll/fwb;->e:Ll/bwb;

    .line 50
    .line 51
    invoke-virtual {v1}, Ll/bwb;->f()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/fwb;->d:Landroid/graphics/Paint;

    .line 59
    .line 60
    iget-object p0, p0, Ll/fwb;->e:Ll/bwb;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/bwb;->g()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    int-to-float p0, p0

    .line 67
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 68
    .line 69
    .line 70
    return-void
.end method
