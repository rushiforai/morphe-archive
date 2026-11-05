.class final Le/e/a/CastControls218$Disconnect;
.super Landroid/graphics/drawable/Drawable;
.source "CastControls218.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CastControls218;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Disconnect"
.end annotation


# instance fields
.field final paint:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(I)V
    .registers 4

    .line 123
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 122
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/CastControls218$Disconnect;->paint:Landroid/graphics/Paint;

    .line 123
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    sget-object p1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const p1, 0x3fe66666    # 1.8f

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    sget-object p1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 11

    .line 125
    invoke-virtual {p0}, Le/e/a/CastControls218$Disconnect;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget v1, v0, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget v2, v0, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x41c00000    # 24.0f

    div-float/2addr v1, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v2

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->scale(FF)V

    const/high16 v4, 0x41a80000    # 21.0f

    iget-object v5, p0, Le/e/a/CastControls218$Disconnect;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40400000    # 3.0f

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v3, 0x41a80000    # 21.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x40a00000    # 5.0f

    iget-object v5, p0, Le/e/a/CastControls218$Disconnect;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41000000    # 8.0f

    const/high16 v2, 0x40a00000    # 5.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41880000    # 17.0f

    iget-object v5, p0, Le/e/a/CastControls218$Disconnect;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41a80000    # 21.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v5, p0, Le/e/a/CastControls218$Disconnect;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41880000    # 17.0f

    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/4 v7, 0x0

    iget-object v8, p0, Le/e/a/CastControls218$Disconnect;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000    # 2.0f

    const/high16 v2, 0x41200000    # 10.0f

    const/high16 v3, 0x41600000    # 14.0f

    const/high16 v4, 0x41b00000    # 22.0f

    const/high16 v5, 0x43870000    # 270.0f

    const/high16 v6, 0x42b40000    # 90.0f

    invoke-virtual/range {v0 .. v8}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    iget-object v8, p0, Le/e/a/CastControls218$Disconnect;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41600000    # 14.0f

    const/high16 v3, 0x41200000    # 10.0f

    invoke-virtual/range {v0 .. v8}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    const/high16 v0, 0x41a80000    # 21.0f

    iget-object v1, p0, Le/e/a/CastControls218$Disconnect;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40400000    # 3.0f

    invoke-virtual {p1, v2, v0, v1}, Landroid/graphics/Canvas;->drawPoint(FFLandroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 2

    const/16 v0, 0x18

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    const/16 v0, 0x18

    return v0
.end method

.method public getOpacity()I
    .registers 2

    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 126
    iget-object v0, p0, Le/e/a/CastControls218$Disconnect;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 126
    iget-object v0, p0, Le/e/a/CastControls218$Disconnect;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
