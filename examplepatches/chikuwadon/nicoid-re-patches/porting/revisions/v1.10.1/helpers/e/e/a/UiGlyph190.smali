.class public final Le/e/a/UiGlyph190;
.super Landroid/graphics/drawable/Drawable;
.source "UiGlyph190.java"


# instance fields
.field final context:Landroid/content/Context;

.field final kind:Ljava/lang/String;

.field final paint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    .line 6
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 5
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    .line 6
    iput-object p1, p0, Le/e/a/UiGlyph190;->context:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/UiGlyph190;->kind:Ljava/lang/String;

    const/16 p2, 0x20

    invoke-static {p1, p2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-static {p1, p2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    const/4 p2, 0x0

    invoke-virtual {p0, p2, p2, v0, p1}, Le/e/a/UiGlyph190;->setBounds(IIII)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 17

    .line 7
    move-object v0, p0

    move-object/from16 v10, p1

    invoke-virtual {p0}, Le/e/a/UiGlyph190;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    iget v2, v1, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget v3, v1, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {v10, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x42000000    # 32.0f

    div-float/2addr v2, v3

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v3

    invoke-virtual {v10, v2, v1}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v1, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    iget-object v2, v0, Le/e/a/UiGlyph190;->context:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v2

    invoke-static {v2}, Le/e/a/DialogColors;->muted(Z)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    const v2, 0x3fe66666    # 1.8f

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v1, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 8
    iget-object v1, v0, Le/e/a/UiGlyph190;->kind:Ljava/lang/String;

    const-string v2, "editor"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/high16 v9, 0x41900000    # 18.0f

    const/high16 v11, 0x41980000    # 19.0f

    const/high16 v12, 0x41d80000    # 27.0f

    if-eqz v1, :cond_fb

    iget-object v1, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40e00000    # 7.0f

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v1, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v1, 0x0

    :goto_6f
    const/4 v2, 0x3

    if-lt v1, v2, :cond_a5

    iget-object v1, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    const/high16 v2, 0x41a00000    # 20.0f

    const/high16 v3, 0x41c80000    # 25.0f

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v1, v12, v9}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v2, 0x41f00000    # 30.0f

    const/high16 v3, 0x41a80000    # 21.0f

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v2, 0x41b80000    # 23.0f

    const/high16 v3, 0x41e00000    # 28.0f

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v2, 0x41e80000    # 29.0f

    invoke-virtual {v1, v11, v2}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    iget-object v2, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    invoke-virtual {v10, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_150

    :cond_a5
    add-int/lit8 v13, v1, 0x1

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    mul-int/lit8 v3, v1, 0x9

    add-int/lit8 v4, v3, 0x8

    int-to-float v4, v4

    iget-object v5, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual {v10, v2, v6, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v2, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    iget-object v4, v0, Le/e/a/UiGlyph190;->context:Landroid/content/Context;

    if-nez v1, :cond_c2

    invoke-static {v4}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v4

    goto :goto_ca

    :cond_c2
    invoke-static {v4}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v4

    invoke-static {v4}, Le/e/a/DialogColors;->muted(Z)I

    move-result v4

    :goto_ca
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    add-int/lit8 v2, v3, 0x3

    int-to-float v4, v2

    mul-int/lit8 v1, v1, 0x3

    rsub-int/lit8 v1, v1, 0x19

    int-to-float v5, v1

    add-int/lit8 v3, v3, 0x6

    int-to-float v6, v3

    const/high16 v7, 0x3fc00000    # 1.5f

    iget-object v8, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41000000    # 8.0f

    const/high16 v14, 0x3fc00000    # 1.5f

    move-object/from16 v1, p1

    move v3, v4

    move v4, v5

    move v5, v6

    move v6, v14

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    iget-object v1, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    iget-object v2, v0, Le/e/a/UiGlyph190;->context:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v2

    invoke-static {v2}, Le/e/a/DialogColors;->muted(Z)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    move v1, v13

    goto/16 :goto_6f

    .line 9
    :cond_fb
    iget-object v1, v0, Le/e/a/UiGlyph190;->kind:Ljava/lang/String;

    const-string v2, "filter"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/high16 v2, 0x40a00000    # 5.0f

    const/high16 v3, 0x41200000    # 10.0f

    if-eqz v1, :cond_135

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    const/high16 v4, 0x40c00000    # 6.0f

    invoke-virtual {v1, v2, v4}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v1, v12, v4}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1, v12, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1, v11, v9}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v4, 0x41c00000    # 24.0f

    const/high16 v5, 0x41500000    # 13.0f

    invoke-virtual {v1, v5, v4}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1, v5, v9}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    iget-object v2, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    invoke-virtual {v10, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_150

    .line 10
    :cond_135
    const/high16 v1, 0x41800000    # 16.0f

    iget-object v4, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    invoke-virtual {v10, v1, v3, v2, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/4 v8, 0x0

    iget-object v9, v0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40e00000    # 7.0f

    const/high16 v3, 0x41800000    # 16.0f

    const/high16 v4, 0x41c80000    # 25.0f

    const/high16 v5, 0x42000000    # 32.0f

    const/high16 v6, 0x43340000    # 180.0f

    const/high16 v7, 0x43340000    # 180.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v9}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    :goto_150
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 11
    return-void
.end method

.method public getOpacity()I
    .registers 2

    .line 12
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 12
    iget-object v0, p0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Le/e/a/UiGlyph190;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 12
    iget-object v0, p0, Le/e/a/UiGlyph190;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Le/e/a/UiGlyph190;->invalidateSelf()V

    return-void
.end method
