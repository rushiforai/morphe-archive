.class final Le/e/a/VideoMarks119$Done;
.super Landroid/graphics/drawable/Drawable;
.source "VideoMarks119.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/VideoMarks119;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Done"
.end annotation


# instance fields
.field final p:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(II)V
    .registers 5

    .line 15
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/VideoMarks119$Done;->p:Landroid/graphics/Paint;

    iget-object v0, p0, Le/e/a/VideoMarks119$Done;->p:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Le/e/a/VideoMarks119$Done;->p:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Le/e/a/VideoMarks119$Done;->p:Landroid/graphics/Paint;

    const v0, 0x3fe66666    # 1.8f

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p1, p0, Le/e/a/VideoMarks119$Done;->p:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1, p2, p2}, Le/e/a/VideoMarks119$Done;->setBounds(IIII)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 16

    .line 15
    invoke-virtual {p0}, Le/e/a/VideoMarks119$Done;->getBounds()Landroid/graphics/Rect;

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

    const/high16 v2, 0x41800000    # 16.0f

    div-float/2addr v1, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v2

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->scale(FF)V

    const/high16 v6, 0x41200000    # 10.0f

    iget-object v7, p0, Le/e/a/VideoMarks119$Done;->p:Landroid/graphics/Paint;

    const/high16 v3, 0x40400000    # 3.0f

    const/high16 v4, 0x40e00000    # 7.0f

    const/high16 v5, 0x40c00000    # 6.0f

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v12, 0x40400000    # 3.0f

    iget-object v13, p0, Le/e/a/VideoMarks119$Done;->p:Landroid/graphics/Paint;

    const/high16 v9, 0x40c00000    # 6.0f

    const/high16 v10, 0x41200000    # 10.0f

    const/high16 v11, 0x41400000    # 12.0f

    move-object v8, p1

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41600000    # 14.0f

    iget-object v5, p0, Le/e/a/VideoMarks119$Done;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000    # 2.0f

    const/high16 v2, 0x41600000    # 14.0f

    const/high16 v3, 0x41600000    # 14.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getOpacity()I
    .registers 2

    .line 15
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 15
    iget-object v0, p0, Le/e/a/VideoMarks119$Done;->p:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 15
    iget-object v0, p0, Le/e/a/VideoMarks119$Done;->p:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
