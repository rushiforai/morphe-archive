.class final Le/e/a/Ui110$ActionGlyph;
.super Landroid/graphics/drawable/Drawable;
.source "Ui110.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Ui110;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ActionGlyph"
.end annotation


# instance fields
.field final c:Landroid/content/Context;

.field final kind:Ljava/lang/String;

.field final paint:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    .line 13
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/Ui110$ActionGlyph;->paint:Landroid/graphics/Paint;

    iput-object p1, p0, Le/e/a/Ui110$ActionGlyph;->c:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/Ui110$ActionGlyph;->kind:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 16

    .line 13
    invoke-virtual {p0}, Le/e/a/Ui110$ActionGlyph;->getBounds()Landroid/graphics/Rect;

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

    iget-object v0, p0, Le/e/a/Ui110$ActionGlyph;->paint:Landroid/graphics/Paint;

    iget-object v1, p0, Le/e/a/Ui110$ActionGlyph;->c:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Le/e/a/Ui110$ActionGlyph;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Le/e/a/Ui110$ActionGlyph;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v0, p0, Le/e/a/Ui110$ActionGlyph;->kind:Ljava/lang/String;

    const-string v1, "back"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_68

    iget-object v0, p0, Le/e/a/Ui110$ActionGlyph;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v6, 0x41400000    # 12.0f

    iget-object v7, p0, Le/e/a/Ui110$ActionGlyph;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41600000    # 14.0f

    const/high16 v4, 0x40a00000    # 5.0f

    const/high16 v5, 0x40e00000    # 7.0f

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v12, 0x41980000    # 19.0f

    iget-object v13, p0, Le/e/a/Ui110$ActionGlyph;->paint:Landroid/graphics/Paint;

    const/high16 v9, 0x40e00000    # 7.0f

    const/high16 v10, 0x41400000    # 12.0f

    const/high16 v11, 0x41600000    # 14.0f

    move-object v8, p1

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_7c

    :cond_68
    iget-object v0, p0, Le/e/a/Ui110$ActionGlyph;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/16 v0, 0xc

    const/16 v1, 0x13

    const/4 v2, 0x5

    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    const/4 v1, 0x0

    :goto_79
    const/4 v2, 0x3

    if-lt v1, v2, :cond_80

    :goto_7c
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void

    :cond_80
    aget v2, v0, v1

    int-to-float v2, v2

    const v3, 0x3fd9999a    # 1.7f

    iget-object v4, p0, Le/e/a/Ui110$ActionGlyph;->paint:Landroid/graphics/Paint;

    const/high16 v5, 0x41400000    # 12.0f

    invoke-virtual {p1, v5, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_79
.end method

.method public getIntrinsicHeight()I
    .registers 3

    .line 13
    iget-object v0, p0, Le/e/a/Ui110$ActionGlyph;->c:Landroid/content/Context;

    const/16 v1, 0x18

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 3

    .line 13
    iget-object v0, p0, Le/e/a/Ui110$ActionGlyph;->c:Landroid/content/Context;

    const/16 v1, 0x18

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 13
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 13
    iget-object v0, p0, Le/e/a/Ui110$ActionGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 13
    iget-object v0, p0, Le/e/a/Ui110$ActionGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
