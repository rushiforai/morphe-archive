.class final Le/e/a/Nicoad190$AdIcon;
.super Landroid/widget/Button;
.source "Nicoad190.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Nicoad190;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AdIcon"
.end annotation


# instance fields
.field final p:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 27
    invoke-direct {p0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Le/e/a/Nicoad190$AdIcon;->p:Landroid/graphics/Paint;

    const-string p1, ""

    invoke-virtual {p0, p1}, Le/e/a/Nicoad190$AdIcon;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1, p1, p1}, Le/e/a/Nicoad190$AdIcon;->setPadding(IIII)V

    invoke-virtual {p0, p1}, Le/e/a/Nicoad190$AdIcon;->setMinimumWidth(I)V

    invoke-virtual {p0, p1}, Le/e/a/Nicoad190$AdIcon;->setMinimumHeight(I)V

    invoke-virtual {p0, p1}, Le/e/a/Nicoad190$AdIcon;->setMinWidth(I)V

    invoke-virtual {p0, p1}, Le/e/a/Nicoad190$AdIcon;->setMinHeight(I)V

    invoke-static {p0}, Le/e/a/Ui110;->circle(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 16

    .line 27
    invoke-virtual {p0}, Le/e/a/Nicoad190$AdIcon;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Le/e/a/Nicoad190$AdIcon;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x42000000    # 32.0f

    div-float/2addr v0, v1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Le/e/a/Nicoad190$AdIcon;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float v1, v1, v0

    sub-float/2addr v2, v1

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    invoke-virtual {p0}, Le/e/a/Nicoad190$AdIcon;->getHeight()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, v1

    div-float/2addr v4, v3

    invoke-virtual {p1, v2, v4}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    const/high16 v0, 0x41800000    # 16.0f

    invoke-virtual {p1, v0, v0}, Landroid/graphics/Canvas;->translate(FF)V

    const v1, 0x3f23d70a    # 0.64f

    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->scale(FF)V

    const/high16 v1, -0x3e800000    # -16.0f

    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v1, p0, Le/e/a/Nicoad190$AdIcon;->p:Landroid/graphics/Paint;

    invoke-virtual {p0}, Le/e/a/Nicoad190$AdIcon;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Le/e/a/Nicoad190$AdIcon;->p:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    const/high16 v2, 0x41600000    # 14.0f

    const/high16 v3, 0x41100000    # 9.0f

    invoke-virtual {v1, v3, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v2, 0x40e00000    # 7.0f

    const/high16 v4, 0x41b80000    # 23.0f

    invoke-virtual {v1, v4, v2}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1, v4, v4}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v2, 0x41900000    # 18.0f

    invoke-virtual {v1, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    iget-object v4, p0, Le/e/a/Nicoad190$AdIcon;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    const/high16 v9, 0x41980000    # 19.0f

    iget-object v10, p0, Le/e/a/Nicoad190$AdIcon;->p:Landroid/graphics/Paint;

    const/high16 v6, 0x40c00000    # 6.0f

    const/high16 v7, 0x41500000    # 13.0f

    const/high16 v8, 0x41200000    # 10.0f

    move-object v5, p1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    const/high16 v4, 0x41300000    # 11.0f

    invoke-virtual {v1, v4, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-virtual {v1, v0, v2}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v0, 0x41500000    # 13.0f

    const/high16 v2, 0x41d80000    # 27.0f

    invoke-virtual {v1, v0, v2}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v0, 0x41c80000    # 25.0f

    invoke-virtual {v1, v3, v0}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    iget-object v0, p0, Le/e/a/Nicoad190$AdIcon;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget-object v0, p0, Le/e/a/Nicoad190$AdIcon;->p:Landroid/graphics/Paint;

    const v1, 0x3fe66666    # 1.8f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/high16 v6, 0x40e00000    # 7.0f

    iget-object v7, p0, Le/e/a/Nicoad190$AdIcon;->p:Landroid/graphics/Paint;

    const/high16 v3, 0x41d00000    # 26.0f

    const/high16 v4, 0x41200000    # 10.0f

    const/high16 v5, 0x41e80000    # 29.0f

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v12, 0x41800000    # 16.0f

    iget-object v13, p0, Le/e/a/Nicoad190$AdIcon;->p:Landroid/graphics/Paint;

    const/high16 v9, 0x41d80000    # 27.0f

    const/high16 v10, 0x41800000    # 16.0f

    const/high16 v11, 0x41f80000    # 31.0f

    move-object v8, p1

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41c80000    # 25.0f

    iget-object v5, p0, Le/e/a/Nicoad190$AdIcon;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x41d00000    # 26.0f

    const/high16 v2, 0x41b00000    # 22.0f

    const/high16 v3, 0x41e80000    # 29.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method
