.class final Le/e/a/Ui110$Glyph;
.super Landroid/view/View;
.source "Ui110.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Ui110;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Glyph"
.end annotation


# instance fields
.field color:I

.field final kind:Ljava/lang/String;

.field final p:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .registers 5

    .line 16
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x3

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    iput-object p2, p0, Le/e/a/Ui110$Glyph;->kind:Ljava/lang/String;

    iput p3, p0, Le/e/a/Ui110$Glyph;->color:I

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 10

    .line 16
    invoke-virtual {p0}, Le/e/a/Ui110$Glyph;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Le/e/a/Ui110$Glyph;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x42000000    # 32.0f

    div-float/2addr v0, v1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Le/e/a/Ui110$Glyph;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float v1, v1, v0

    sub-float/2addr v2, v1

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    invoke-virtual {p0}, Le/e/a/Ui110$Glyph;->getHeight()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, v1

    div-float/2addr v4, v3

    invoke-virtual {p1, v2, v4}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v0, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    iget v1, p0, Le/e/a/Ui110$Glyph;->color:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v0, p0, Le/e/a/Ui110$Glyph;->kind:Ljava/lang/String;

    const-string v1, "folder"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/high16 v6, 0x41e80000    # 29.0f

    if-eqz v0, :cond_83

    iget-object v0, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    const/high16 v1, 0x40400000    # 3.0f

    const/high16 v2, 0x41000000    # 8.0f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v3, 0x41400000    # 12.0f

    invoke-virtual {v0, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v0, v6, v3}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v2, 0x41d80000    # 27.0f

    invoke-virtual {v0, v6, v2}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_79
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    iget-object v1, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_139

    :cond_83
    iget-object v0, p0, Le/e/a/Ui110$Glyph;->kind:Ljava/lang/String;

    const-string v1, "playlist"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_cf

    const/high16 v4, 0x41000000    # 8.0f

    iget-object v5, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x40800000    # 4.0f

    const/high16 v2, 0x41000000    # 8.0f

    const/high16 v3, 0x41b00000    # 22.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41600000    # 14.0f

    iget-object v5, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41600000    # 14.0f

    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41a00000    # 20.0f

    iget-object v5, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41a00000    # 20.0f

    const/high16 v3, 0x41500000    # 13.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v0, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    const/high16 v1, 0x41880000    # 17.0f

    const/high16 v2, 0x41980000    # 19.0f

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v1, 0x41e00000    # 28.0f

    const/high16 v3, 0x41b80000    # 23.0f

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v0, v2, v6}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_79

    :cond_cf
    const/high16 v6, 0x40000000    # 2.0f

    iget-object v7, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x40c00000    # 6.0f

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v3, 0x41c00000    # 24.0f

    const/high16 v4, 0x41d80000    # 27.0f

    const/high16 v5, 0x40000000    # 2.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41200000    # 10.0f

    iget-object v5, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x41200000    # 10.0f

    const/high16 v2, 0x41200000    # 10.0f

    const/high16 v3, 0x41980000    # 19.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41700000    # 15.0f

    iget-object v5, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41700000    # 15.0f

    const/high16 v3, 0x41880000    # 17.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v0, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    invoke-virtual {p0}, Le/e/a/Ui110$Glyph;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v0, 0x40e00000    # 7.0f

    iget-object v1, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41c00000    # 24.0f

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v0, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    iget v1, p0, Le/e/a/Ui110$Glyph;->color:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v0, 0x40c00000    # 6.0f

    iget-object v1, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41e00000    # 28.0f

    iget-object v5, p0, Le/e/a/Ui110$Glyph;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x41a00000    # 20.0f

    const/high16 v2, 0x41a00000    # 20.0f

    const/high16 v3, 0x41e00000    # 28.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :goto_139
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method
