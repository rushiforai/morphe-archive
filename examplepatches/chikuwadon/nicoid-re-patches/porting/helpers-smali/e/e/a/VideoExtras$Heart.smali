.class final Le/e/a/VideoExtras$Heart;
.super Landroid/graphics/drawable/Drawable;
.source "VideoExtras.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/VideoExtras;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Heart"
.end annotation


# instance fields
.field final color:I

.field final filled:Z

.field final paint:Landroid/graphics/Paint;

.field final size:I


# direct methods
.method constructor <init>(Landroid/content/Context;ZI)V
    .registers 6

    .line 23
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/VideoExtras$Heart;->paint:Landroid/graphics/Paint;

    iput-boolean p2, p0, Le/e/a/VideoExtras$Heart;->filled:Z

    iput p3, p0, Le/e/a/VideoExtras$Heart;->color:I

    const/16 p2, 0xe

    invoke-static {p1, p2}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result p1

    iput p1, p0, Le/e/a/VideoExtras$Heart;->size:I

    iget p1, p0, Le/e/a/VideoExtras$Heart;->size:I

    iget p2, p0, Le/e/a/VideoExtras$Heart;->size:I

    const/4 p3, 0x0

    invoke-virtual {p0, p3, p3, p1, p2}, Le/e/a/VideoExtras$Heart;->setBounds(IIII)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 11

    .line 23
    invoke-virtual {p0}, Le/e/a/VideoExtras$Heart;->getBounds()Landroid/graphics/Rect;

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

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    const/high16 v1, 0x41400000    # 12.0f

    const/high16 v2, 0x41a80000    # 21.0f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v7, 0x40000000    # 2.0f

    const/high16 v8, 0x40e00000    # 7.0f

    const/high16 v3, 0x41100000    # 9.0f

    const/high16 v4, 0x41900000    # 18.0f

    const/high16 v5, 0x40000000    # 2.0f

    const/high16 v6, 0x41500000    # 13.0f

    move-object v2, v0

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v7, 0x41400000    # 12.0f

    const/high16 v8, 0x40c00000    # 6.0f

    const/high16 v3, 0x40000000    # 2.0f

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x41100000    # 9.0f

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v7, 0x41b00000    # 22.0f

    const/high16 v8, 0x40e00000    # 7.0f

    const/high16 v3, 0x41700000    # 15.0f

    const/high16 v5, 0x41b00000    # 22.0f

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v7, 0x41400000    # 12.0f

    const/high16 v8, 0x41a80000    # 21.0f

    const/high16 v3, 0x41b00000    # 22.0f

    const/high16 v4, 0x41500000    # 13.0f

    const/high16 v5, 0x41700000    # 15.0f

    const/high16 v6, 0x41900000    # 18.0f

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    iget-object v1, p0, Le/e/a/VideoExtras$Heart;->paint:Landroid/graphics/Paint;

    iget v2, p0, Le/e/a/VideoExtras$Heart;->color:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Le/e/a/VideoExtras$Heart;->paint:Landroid/graphics/Paint;

    iget-boolean v2, p0, Le/e/a/VideoExtras$Heart;->filled:Z

    if-eqz v2, :cond_79

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    goto :goto_7b

    :cond_79
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    :goto_7b
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, p0, Le/e/a/VideoExtras$Heart;->paint:Landroid/graphics/Paint;

    const v2, 0x3fe66666    # 1.8f

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, p0, Le/e/a/VideoExtras$Heart;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .line 23
    iget v0, p0, Le/e/a/VideoExtras$Heart;->size:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .line 23
    iget v0, p0, Le/e/a/VideoExtras$Heart;->size:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 23
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 23
    iget-object v0, p0, Le/e/a/VideoExtras$Heart;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 23
    iget-object v0, p0, Le/e/a/VideoExtras$Heart;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
