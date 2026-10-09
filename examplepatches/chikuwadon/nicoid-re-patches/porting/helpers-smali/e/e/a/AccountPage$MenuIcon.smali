.class final Le/e/a/AccountPage$MenuIcon;
.super Landroid/view/View;
.source "AccountPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/AccountPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MenuIcon"
.end annotation


# instance fields
.field final kind:I

.field final p:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Landroid/content/Context;I)V
    .registers 4

    .line 16
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x3

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    iput p2, p0, Le/e/a/AccountPage$MenuIcon;->kind:I

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 12

    .line 16
    iget-object v0, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    invoke-virtual {p0}, Le/e/a/AccountPage$MenuIcon;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    const v1, 0x3fe66666    # 1.8f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Le/e/a/AccountPage$MenuIcon;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Le/e/a/AccountPage$MenuIcon;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x41e00000    # 28.0f

    div-float/2addr v0, v1

    invoke-virtual {p1, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    iget v0, p0, Le/e/a/AccountPage$MenuIcon;->kind:I

    const/high16 v1, 0x41200000    # 10.0f

    const/high16 v6, 0x41600000    # 14.0f

    if-nez v0, :cond_61

    iget-object v0, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v6, v1, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41600000    # 14.0f

    iget-object v5, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x41600000    # 14.0f

    const/high16 v2, 0x40e00000    # 7.0f

    const/high16 v3, 0x41600000    # 14.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41880000    # 17.0f

    iget-object v5, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41600000    # 14.0f

    const/high16 v3, 0x41980000    # 19.0f

    :goto_5c
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_135

    :cond_61
    iget v0, p0, Le/e/a/AccountPage$MenuIcon;->kind:I

    const/4 v2, 0x1

    const/high16 v3, 0x41000000    # 8.0f

    const/high16 v8, 0x41300000    # 11.0f

    if-ne v0, v2, :cond_93

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    const/high16 v2, 0x40400000    # 3.0f

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1, v8}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v1, 0x41c80000    # 25.0f

    invoke-virtual {v0, v1, v8}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v3, 0x41b80000    # 23.0f

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_89
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    iget-object v1, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_135

    :cond_93
    iget v0, p0, Le/e/a/AccountPage$MenuIcon;->kind:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_d9

    const/high16 v4, 0x41900000    # 18.0f

    iget-object v5, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x41600000    # 14.0f

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v3, 0x41600000    # 14.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v5, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x41100000    # 9.0f

    const/high16 v2, 0x41500000    # 13.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41500000    # 13.0f

    iget-object v5, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x41600000    # 14.0f

    const/high16 v2, 0x41900000    # 18.0f

    const/high16 v3, 0x41980000    # 19.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41c00000    # 24.0f

    iget-object v5, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x40800000    # 4.0f

    const/high16 v2, 0x41a00000    # 20.0f

    const/high16 v3, 0x40800000    # 4.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v5, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41c00000    # 24.0f

    const/high16 v3, 0x41c00000    # 24.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41a00000    # 20.0f

    iget-object v5, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x41c00000    # 24.0f

    goto :goto_5c

    :cond_d9
    iget v0, p0, Le/e/a/AccountPage$MenuIcon;->kind:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_103

    const/high16 v6, 0x40000000    # 2.0f

    iget-object v7, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x40400000    # 3.0f

    const/high16 v2, 0x40e00000    # 7.0f

    const/high16 v3, 0x41c80000    # 25.0f

    const/high16 v4, 0x41b80000    # 23.0f

    const/high16 v5, 0x40000000    # 2.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    invoke-virtual {v0, v8, v8}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v1, 0x41700000    # 15.0f

    const/high16 v2, 0x41980000    # 19.0f

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v0, v8, v2}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_89

    :cond_103
    iget v0, p0, Le/e/a/AccountPage$MenuIcon;->kind:I

    const/4 v1, 0x4

    const/high16 v2, 0x40a00000    # 5.0f

    if-ne v0, v1, :cond_123

    iget-object v0, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v3, v2, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/4 v7, 0x0

    iget-object v8, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    const/high16 v1, 0x40800000    # 4.0f

    const/high16 v2, 0x41700000    # 15.0f

    const/high16 v3, 0x41c00000    # 24.0f

    const/high16 v4, 0x41f00000    # 30.0f

    const/high16 v5, 0x43340000    # 180.0f

    const/high16 v6, 0x43340000    # 180.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v8}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    goto :goto_135

    :cond_123
    iget-object v0, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v6, v2, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v0, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    const/high16 v7, 0x41100000    # 9.0f

    invoke-virtual {p1, v6, v6, v7, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/4 v0, 0x0

    const/4 v8, 0x0

    :goto_131
    const/16 v0, 0x8

    if-lt v8, v0, :cond_139

    :goto_135
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void

    :cond_139
    int-to-double v0, v8

    const-wide v2, 0x400921fb54442d18L    # Math.PI

    mul-double v0, v0, v2

    const-wide/high16 v2, 0x4010000000000000L    # 4.0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float v2, v2

    mul-float v2, v2, v7

    add-float/2addr v2, v6

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    double-to-float v3, v3

    mul-float v3, v3, v7

    add-float/2addr v3, v6

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    double-to-float v4, v4

    const/high16 v5, 0x41500000    # 13.0f

    mul-float v4, v4, v5

    add-float/2addr v4, v6

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    mul-float v0, v0, v5

    add-float v5, v0, v6

    iget-object v9, p0, Le/e/a/AccountPage$MenuIcon;->p:Landroid/graphics/Paint;

    move-object v0, p1

    move v1, v2

    move v2, v3

    move v3, v4

    move v4, v5

    move-object v5, v9

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_131
.end method
