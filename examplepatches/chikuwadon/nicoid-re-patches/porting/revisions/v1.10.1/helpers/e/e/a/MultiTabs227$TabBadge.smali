.class final Le/e/a/MultiTabs227$TabBadge;
.super Landroid/graphics/drawable/Drawable;
.source "MultiTabs227.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/MultiTabs227;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "TabBadge"
.end annotation


# instance fields
.field final kind:I

.field final paint:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(III)V
    .registers 6

    .line 33
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 32
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;

    .line 33
    iput p1, p0, Le/e/a/MultiTabs227$TabBadge;->kind:I

    iget-object p1, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;

    const p2, 0x3fcccccd    # 1.6f

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p1, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object p1, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1, p3, p3}, Le/e/a/MultiTabs227$TabBadge;->setBounds(IIII)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 12

    .line 34
    invoke-virtual {p0}, Le/e/a/MultiTabs227$TabBadge;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v9

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

    iget v0, p0, Le/e/a/MultiTabs227$TabBadge;->kind:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_42

    const v0, 0x4089999a    # 4.3f

    iget-object v1, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40d00000    # 6.5f

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41600000    # 14.0f

    iget-object v5, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;

    const v1, 0x411ccccd    # 9.8f

    const v2, 0x411ccccd    # 9.8f

    const/high16 v3, 0x41600000    # 14.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_93

    :cond_42
    iget v0, p0, Le/e/a/MultiTabs227$TabBadge;->kind:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_64

    const/high16 v0, 0x40400000    # 3.0f

    iget-object v1, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41000000    # 8.0f

    const/high16 v3, 0x40900000    # 4.5f

    invoke-virtual {p1, v2, v3, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/4 v7, 0x0

    iget-object v8, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000    # 2.0f

    const/high16 v3, 0x41600000    # 14.0f

    const/high16 v4, 0x41980000    # 19.0f

    const/high16 v5, 0x433e0000    # 190.0f

    const/high16 v6, 0x43200000    # 160.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v8}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    goto :goto_93

    :cond_64
    const/4 v1, 0x4

    if-ne v0, v1, :cond_76

    move-object v0, p1

    const/high16 v1, 0x40800000    # 4.0f

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x41400000    # 12.0f

    const/high16 v4, 0x41700000    # 15.0f

    iget-object v5, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_93

    :cond_76
    move-object v0, p1

    iget-object v5, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;

    const/high16 v4, 0x41600000    # 14.0f

    const/high16 v1, 0x40400000    # 3.0f

    const/high16 v2, 0x41200000    # 10.0f

    move v3, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x41000000    # 8.0f

    const/high16 v2, 0x40c00000    # 6.0f

    move v3, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x41500000    # 13.0f

    const/high16 v2, 0x40000000    # 2.0f

    move v3, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :goto_93
    invoke-virtual {p1, v9}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

.method public getOpacity()I
    .registers 2

    .line 35
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 35
    iget-object v0, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Le/e/a/MultiTabs227$TabBadge;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 35
    iget-object v0, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Le/e/a/MultiTabs227$TabBadge;->invalidateSelf()V

    return-void
.end method
