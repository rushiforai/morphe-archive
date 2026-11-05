.class final Le/e/a/Review181$Heart;
.super Landroid/graphics/drawable/Drawable;
.source "Review181.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Review181;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Heart"
.end annotation


# instance fields
.field final color:I

.field final fill:Z


# direct methods
.method constructor <init>(IZ)V
    .registers 3

    .line 123
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    iput p1, p0, Le/e/a/Review181$Heart;->color:I

    iput-boolean p2, p0, Le/e/a/Review181$Heart;->fill:Z

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 11

    .line 123
    invoke-virtual {p0}, Le/e/a/Review181$Heart;->getBounds()Landroid/graphics/Rect;

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

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iget v1, p0, Le/e/a/Review181$Heart;->color:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-boolean v1, p0, Le/e/a/Review181$Heart;->fill:Z

    if-eqz v1, :cond_33

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    goto :goto_35

    :cond_33
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    :goto_35
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v1, 0x3fe66666    # 1.8f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    const/high16 v2, 0x41400000    # 12.0f

    const/high16 v3, 0x41a80000    # 21.0f

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v7, 0x40000000    # 2.0f

    const/high16 v8, 0x40e00000    # 7.0f

    const/high16 v3, 0x41200000    # 10.0f

    const/high16 v4, 0x41980000    # 19.0f

    const/high16 v5, 0x40000000    # 2.0f

    const/high16 v6, 0x41500000    # 13.0f

    move-object v2, v1

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v7, 0x41400000    # 12.0f

    const/high16 v8, 0x40c00000    # 6.0f

    const/high16 v3, 0x40000000    # 2.0f

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x41200000    # 10.0f

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v7, 0x41b00000    # 22.0f

    const/high16 v8, 0x40e00000    # 7.0f

    const/high16 v3, 0x41600000    # 14.0f

    const/high16 v5, 0x41b00000    # 22.0f

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v7, 0x41400000    # 12.0f

    const/high16 v8, 0x41a80000    # 21.0f

    const/high16 v3, 0x41b00000    # 22.0f

    const/high16 v4, 0x41500000    # 13.0f

    const/high16 v5, 0x41600000    # 14.0f

    const/high16 v6, 0x41980000    # 19.0f

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getOpacity()I
    .registers 2

    .line 123
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 2

    .line 123
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    .line 123
    return-void
.end method
