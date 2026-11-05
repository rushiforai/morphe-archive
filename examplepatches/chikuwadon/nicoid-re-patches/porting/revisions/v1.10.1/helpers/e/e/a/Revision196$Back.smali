.class final Le/e/a/Revision196$Back;
.super Landroid/graphics/drawable/Drawable;
.source "Revision196.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Revision196;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Back"
.end annotation


# instance fields
.field final p:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(I)V
    .registers 4

    .line 51
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/Revision196$Back;->p:Landroid/graphics/Paint;

    iget-object v0, p0, Le/e/a/Revision196$Back;->p:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Le/e/a/Revision196$Back;->p:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Le/e/a/Revision196$Back;->p:Landroid/graphics/Paint;

    const/high16 v0, 0x40000000    # 2.0f

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p1, p0, Le/e/a/Revision196$Back;->p:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object p1, p0, Le/e/a/Revision196$Back;->p:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 7

    .line 52
    invoke-virtual {p0}, Le/e/a/Revision196$Back;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x3f000000    # 0.5f

    mul-float v1, v1, v2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v4, v1, v4

    sub-float/2addr v3, v4

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v0

    sub-float/2addr v0, v4

    invoke-virtual {p1, v3, v0}, Landroid/graphics/Canvas;->translate(FF)V

    const/high16 v0, 0x41c00000    # 24.0f

    div-float/2addr v1, v0

    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->scale(FF)V

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    const/high16 v1, 0x40a00000    # 5.0f

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v0, v3, v1}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v1, 0x40e00000    # 7.0f

    const/high16 v4, 0x41400000    # 12.0f

    invoke-virtual {v0, v1, v4}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v1, 0x41980000    # 19.0f

    invoke-virtual {v0, v3, v1}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v1, p0, Le/e/a/Revision196$Back;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

.method public getOpacity()I
    .registers 2

    .line 53
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 53
    iget-object v0, p0, Le/e/a/Revision196$Back;->p:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Le/e/a/Revision196$Back;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 53
    iget-object v0, p0, Le/e/a/Revision196$Back;->p:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Le/e/a/Revision196$Back;->invalidateSelf()V

    return-void
.end method
