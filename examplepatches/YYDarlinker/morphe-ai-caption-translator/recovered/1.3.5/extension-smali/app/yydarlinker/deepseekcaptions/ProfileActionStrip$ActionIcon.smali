.class final Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;
.super Landroid/graphics/drawable/Drawable;
.source "ProfileActionStrip.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ActionIcon"
.end annotation


# instance fields
.field final kind:I

.field final paint:Landroid/graphics/Paint;

.field final size:I


# direct methods
.method constructor <init>(Landroid/content/Context;II)V
    .registers 6

    .line 76
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 75
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->paint:Landroid/graphics/Paint;

    .line 77
    iput p2, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->kind:I

    const/high16 p2, 0x41900000    # 18.0f

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result p1

    iput p1, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->size:I

    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 78
    sget-object p0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const p0, 0x3fcccccd    # 1.6f

    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 79
    sget-object p0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    sget-object p0, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 16

    .line 82
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget v0, v0, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 83
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x41c00000    # 24.0f

    div-float/2addr v0, v1

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v1

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 84
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 85
    iget v1, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->kind:I

    const/4 v2, 0x1

    const/high16 v3, 0x41a80000    # 21.0f

    if-ne v1, v2, :cond_73

    const/high16 v1, 0x40800000    # 4.0f

    const/high16 v2, 0x41800000    # 16.0f

    .line 86
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v1, 0x41780000    # 15.5f

    const/high16 v2, 0x40900000    # 4.5f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v1, 0x419c0000    # 19.5f

    const/high16 v2, 0x41080000    # 8.5f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v1, 0x41000000    # 8.0f

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v1, 0x40400000    # 3.0f

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 87
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    const/high16 v6, 0x41280000    # 10.5f

    iget-object v7, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41580000    # 13.5f

    const/high16 v4, 0x40d00000    # 6.5f

    const/high16 v5, 0x418c0000    # 17.5f

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object v8, v2

    goto/16 :goto_101

    :cond_73
    move-object v8, p1

    const/high16 p1, 0x41400000    # 12.0f

    const/4 v2, 0x3

    if-ne v1, v2, :cond_a2

    .line 89
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/16 v0, 0xc

    const/16 v1, 0x13

    const/4 v3, 0x5

    .line 90
    filled-new-array {v3, v0, v1}, [I

    move-result-object v0

    const/4 v1, 0x0

    :goto_8a
    if-ge v1, v2, :cond_9a

    aget v3, v0, v1

    int-to-float v3, v3

    const v4, 0x3fd9999a    # 1.7f

    iget-object v5, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v8, p1, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_8a

    .line 91
    :cond_9a
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->paint:Landroid/graphics/Paint;

    sget-object p1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    goto :goto_101

    :cond_a2
    const/4 v2, 0x4

    const/high16 v4, 0x41900000    # 18.0f

    const/high16 v5, 0x40c00000    # 6.0f

    if-ne v1, v2, :cond_bc

    const/high16 v1, 0x41700000    # 15.0f

    .line 93
    invoke-virtual {v0, v5, v1}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v2, 0x41100000    # 9.0f

    invoke-virtual {v0, p1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v0, v4, v1}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v8, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_101

    :cond_bc
    const/high16 v12, 0x40c00000    # 6.0f

    .line 95
    iget-object v13, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->paint:Landroid/graphics/Paint;

    const/high16 v9, 0x40800000    # 4.0f

    const/high16 v10, 0x40c00000    # 6.0f

    const/high16 v11, 0x41a00000    # 20.0f

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v12, 0x40400000    # 3.0f

    iget-object v13, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->paint:Landroid/graphics/Paint;

    const/high16 v9, 0x41100000    # 9.0f

    const/high16 v10, 0x40400000    # 3.0f

    const/high16 v11, 0x41700000    # 15.0f

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 96
    invoke-virtual {v0, v5, v5}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 p1, 0x40e00000    # 7.0f

    invoke-virtual {v0, p1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 p1, 0x41880000    # 17.0f

    invoke-virtual {v0, p1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v0, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v8, v0, p1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    const/high16 v12, 0x41880000    # 17.0f

    .line 97
    iget-object v13, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->paint:Landroid/graphics/Paint;

    const/high16 v9, 0x41200000    # 10.0f

    const/high16 v10, 0x41200000    # 10.0f

    const/high16 v11, 0x41200000    # 10.0f

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v13, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->paint:Landroid/graphics/Paint;

    const/high16 v9, 0x41600000    # 14.0f

    const/high16 v11, 0x41600000    # 14.0f

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 99
    :goto_101
    invoke-virtual {v8}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 1

    .line 105
    iget p0, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->size:I

    return p0
.end method

.method public getIntrinsicWidth()I
    .registers 1

    .line 104
    iget p0, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->size:I

    return p0
.end method

.method public getOpacity()I
    .registers 1

    const/4 p0, -0x3

    return p0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 101
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 102
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip$ActionIcon;->invalidateSelf()V

    return-void
.end method
