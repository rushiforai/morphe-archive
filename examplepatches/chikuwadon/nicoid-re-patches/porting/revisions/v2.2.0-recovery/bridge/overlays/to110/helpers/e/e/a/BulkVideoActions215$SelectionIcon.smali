.class final Le/e/a/BulkVideoActions215$SelectionIcon;
.super Landroid/graphics/drawable/Drawable;
.source "BulkVideoActions215.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/BulkVideoActions215;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SelectionIcon"
.end annotation


# instance fields
.field private final active:Z

.field private final color:I

.field private final intrinsic:I

.field private final paint:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(ZII)V
    .registers 6

    .line 315
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 312
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->paint:Landroid/graphics/Paint;

    .line 315
    iput-boolean p1, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->active:Z

    iput p2, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->color:I

    iput p3, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->intrinsic:I

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 12

    .line 317
    invoke-virtual {p0}, Le/e/a/BulkVideoActions215$SelectionIcon;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    .line 318
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    int-to-float v2, v2

    .line 319
    const/high16 v3, 0x41c00000    # 24.0f

    div-float/2addr v2, v3

    .line 320
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 321
    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x41400000    # 12.0f

    mul-float/2addr v4, v2

    sub-float/2addr v3, v4

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v1, v4

    invoke-virtual {p1, v3, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 322
    invoke-virtual {p1, v2, v2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 323
    iget-object v1, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->paint:Landroid/graphics/Paint;

    iget v2, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->color:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 324
    iget-object v1, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 325
    iget-object v1, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->paint:Landroid/graphics/Paint;

    const/high16 v8, 0x40000000    # 2.0f

    invoke-virtual {v1, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 326
    iget-object v1, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 327
    iget-boolean v1, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->active:Z

    if-eqz v1, :cond_0

    .line 328
    const/high16 v6, 0x40400000    # 3.0f

    iget-object v7, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000    # 2.0f

    const/high16 v2, 0x40000000    # 2.0f

    const/high16 v3, 0x41b00000    # 22.0f

    const/high16 v4, 0x41b00000    # 22.0f

    const/high16 v5, 0x40400000    # 3.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 329
    const/high16 v4, 0x41880000    # 17.0f

    iget-object v5, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40e00000    # 7.0f

    const/high16 v2, 0x40e00000    # 7.0f

    const/high16 v3, 0x41880000    # 17.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 330
    iget-object v5, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41880000    # 17.0f

    const/high16 v3, 0x40e00000    # 7.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_1

    .line 332
    :cond_0
    const/4 v0, 0x0

    move v9, v0

    :goto_0
    const/4 v0, 0x2

    if-ge v9, v0, :cond_1

    .line 333
    mul-int/lit8 v0, v9, 0xb

    add-int/lit8 v0, v0, 0x3

    int-to-float v2, v0

    .line 334
    const/high16 v0, 0x41000000    # 8.0f

    add-float v4, v2, v0

    const/high16 v6, 0x3f800000    # 1.0f

    iget-object v7, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v3, 0x41100000    # 9.0f

    const/high16 v5, 0x3f800000    # 1.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 335
    move v6, v2

    const/high16 v0, 0x40800000    # 4.0f

    add-float v2, v6, v0

    const/high16 v0, 0x40c00000    # 6.0f

    add-float v4, v6, v0

    iget-object v5, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40400000    # 3.0f

    const/high16 v3, 0x40a00000    # 5.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 336
    move v7, v2

    move v2, v4

    add-float v4, v6, v8

    iget-object v5, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40a00000    # 5.0f

    const/high16 v3, 0x41000000    # 8.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 337
    const/high16 v3, 0x41c00000    # 24.0f

    iget-object v5, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41500000    # 13.0f

    move v4, v7

    move v2, v7

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 332
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 340
    :cond_1
    :goto_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 341
    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .line 346
    iget v0, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->intrinsic:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .line 345
    iget v0, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->intrinsic:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 344
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 342
    iget-object v0, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Le/e/a/BulkVideoActions215$SelectionIcon;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 343
    iget-object v0, p0, Le/e/a/BulkVideoActions215$SelectionIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Le/e/a/BulkVideoActions215$SelectionIcon;->invalidateSelf()V

    return-void
.end method
