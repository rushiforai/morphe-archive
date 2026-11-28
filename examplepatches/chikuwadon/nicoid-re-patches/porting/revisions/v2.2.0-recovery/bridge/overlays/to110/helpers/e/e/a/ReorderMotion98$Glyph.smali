.class public final Le/e/a/ReorderMotion98$Glyph;
.super Landroid/graphics/drawable/Drawable;
.source "ReorderMotion98.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ReorderMotion98;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Glyph"
.end annotation


# instance fields
.field final color:I

.field final p:Landroid/graphics/Paint;

.field final size:I

.field final type:I


# direct methods
.method constructor <init>(III)V
    .registers 6

    .line 15
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/ReorderMotion98$Glyph;->p:Landroid/graphics/Paint;

    iput p1, p0, Le/e/a/ReorderMotion98$Glyph;->size:I

    iput p2, p0, Le/e/a/ReorderMotion98$Glyph;->color:I

    iput p3, p0, Le/e/a/ReorderMotion98$Glyph;->type:I

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 15

    .line 17
    invoke-virtual {p0}, Le/e/a/ReorderMotion98$Glyph;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x41c00000    # 24.0f

    div-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v2

    const/high16 v3, 0x41400000    # 12.0f

    mul-float v3, v3, v1

    sub-float/2addr v2, v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v0

    sub-float/2addr v0, v3

    invoke-virtual {p1, v2, v0}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v0, p0, Le/e/a/ReorderMotion98$Glyph;->p:Landroid/graphics/Paint;

    iget v1, p0, Le/e/a/ReorderMotion98$Glyph;->color:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Le/e/a/ReorderMotion98$Glyph;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Le/e/a/ReorderMotion98$Glyph;->p:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v0, p0, Le/e/a/ReorderMotion98$Glyph;->p:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget-object v0, p0, Le/e/a/ReorderMotion98$Glyph;->p:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget v0, p0, Le/e/a/ReorderMotion98$Glyph;->type:I

    if-nez v0, :cond_0

    const/high16 v5, 0x40e00000    # 7.0f

    const/high16 v6, 0x40400000    # 3.0f

    const/high16 v3, 0x40e00000    # 7.0f

    const/high16 v4, 0x41a80000    # 21.0f

    move-object v1, p0

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Le/e/a/ReorderMotion98$Glyph;->line(Landroid/graphics/Canvas;FFFF)V

    move-object v8, v2

    const/high16 v11, 0x40e00000    # 7.0f

    const/high16 v12, 0x40400000    # 3.0f

    const/high16 v9, 0x40400000    # 3.0f

    const/high16 v10, 0x40e00000    # 7.0f

    move-object v7, p0

    invoke-virtual/range {v7 .. v12}, Le/e/a/ReorderMotion98$Glyph;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v11, 0x41300000    # 11.0f

    const/high16 v12, 0x40e00000    # 7.0f

    const/high16 v9, 0x40e00000    # 7.0f

    const/high16 v10, 0x40400000    # 3.0f

    invoke-virtual/range {v7 .. v12}, Le/e/a/ReorderMotion98$Glyph;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v11, 0x41880000    # 17.0f

    const/high16 v12, 0x41a80000    # 21.0f

    const/high16 v9, 0x41880000    # 17.0f

    invoke-virtual/range {v7 .. v12}, Le/e/a/ReorderMotion98$Glyph;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v9, 0x41500000    # 13.0f

    const/high16 v10, 0x41880000    # 17.0f

    invoke-virtual/range {v7 .. v12}, Le/e/a/ReorderMotion98$Glyph;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v11, 0x41a80000    # 21.0f

    const/high16 v12, 0x41880000    # 17.0f

    const/high16 v9, 0x41880000    # 17.0f

    const/high16 v10, 0x41a80000    # 21.0f

    :goto_0
    invoke-virtual/range {v7 .. v12}, Le/e/a/ReorderMotion98$Glyph;->line(Landroid/graphics/Canvas;FFFF)V

    goto :goto_3

    :cond_0
    move-object v8, p1

    iget p1, p0, Le/e/a/ReorderMotion98$Glyph;->type:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    const/high16 v11, 0x41100000    # 9.0f

    const/high16 v12, 0x41880000    # 17.0f

    const/high16 v9, 0x40800000    # 4.0f

    const/high16 v10, 0x41400000    # 12.0f

    move-object v7, p0

    invoke-virtual/range {v7 .. v12}, Le/e/a/ReorderMotion98$Glyph;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v11, 0x41a00000    # 20.0f

    const/high16 v12, 0x40a00000    # 5.0f

    const/high16 v9, 0x41100000    # 9.0f

    const/high16 v10, 0x41880000    # 17.0f

    goto :goto_0

    :cond_1
    iget-object p1, p0, Le/e/a/ReorderMotion98$Glyph;->p:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/16 p1, 0x9

    :goto_1
    const/16 v0, 0xf

    if-gt p1, v0, :cond_3

    const/4 v0, 0x5

    :goto_2
    const/16 v1, 0x13

    if-gt v0, v1, :cond_2

    int-to-float v1, p1

    int-to-float v2, v0

    const/high16 v3, 0x3fc00000    # 1.5f

    iget-object v4, p0, Le/e/a/ReorderMotion98$Glyph;->p:Landroid/graphics/Paint;

    invoke-virtual {v8, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    add-int/lit8 v0, v0, 0x7

    goto :goto_2

    :cond_2
    add-int/lit8 p1, p1, 0x6

    goto :goto_1

    :cond_3
    :goto_3
    invoke-virtual {v8}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .line 16
    iget v0, p0, Le/e/a/ReorderMotion98$Glyph;->size:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .line 16
    iget v0, p0, Le/e/a/ReorderMotion98$Glyph;->size:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 18
    const/4 v0, -0x3

    return v0
.end method

.method line(Landroid/graphics/Canvas;FFFF)V
    .registers 12

    .line 18
    iget-object v5, p0, Le/e/a/ReorderMotion98$Glyph;->p:Landroid/graphics/Paint;

    move-object v0, p1

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public setAlpha(I)V
    .registers 2

    .line 18
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    .line 18
    return-void
.end method
