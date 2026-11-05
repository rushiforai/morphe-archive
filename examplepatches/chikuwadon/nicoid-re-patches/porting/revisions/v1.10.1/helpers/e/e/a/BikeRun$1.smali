.class Le/e/a/BikeRun$1;
.super Landroid/view/View;
.source "BikeRun.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/BikeRun;->open(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final pen:Landroid/graphics/Paint;

.field private final synthetic val$track:Le/e/a/BikeRun$Track;


# direct methods
.method constructor <init>(Landroid/content/Context;Le/e/a/BikeRun$Track;)V
    .registers 3

    .line 79
    iput-object p2, p0, Le/e/a/BikeRun$1;->val$track:Le/e/a/BikeRun$Track;

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 80
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x3

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 16

    .line 82
    invoke-virtual {p0}, Le/e/a/BikeRun$1;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 83
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Le/e/a/BikeRun$1;->getWidth()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    invoke-virtual {p0}, Le/e/a/BikeRun$1;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v2

    invoke-virtual {p1, v1, v3}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    .line 84
    iget-object v0, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    iget-object v1, p0, Le/e/a/BikeRun$1;->val$track:Le/e/a/BikeRun$Track;

    iget v1, v1, Le/e/a/BikeRun$Track;->foreground:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    const v1, 0x3fcccccd    # 1.6f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/high16 v6, -0x3ef00000    # -9.0f

    .line 86
    iget-object v7, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    const/high16 v3, -0x3f200000    # -7.0f

    const/high16 v4, -0x3ef00000    # -9.0f

    const/high16 v5, 0x40e00000    # 7.0f

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v12, 0x3f800000    # 1.0f

    iget-object v13, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    const/high16 v9, -0x3f200000    # -7.0f

    const/high16 v10, -0x3ef00000    # -9.0f

    const/high16 v11, -0x3f600000    # -5.0f

    move-object v8, p1

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x3f800000    # 1.0f

    .line 87
    iget-object v5, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    const/high16 v1, 0x40e00000    # 7.0f

    const/high16 v2, -0x3ef00000    # -9.0f

    const/high16 v3, 0x40a00000    # 5.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v10, 0x40a00000    # 5.0f

    iget-object v11, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    const/high16 v7, -0x3f600000    # -5.0f

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    move-object v6, p1

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x40a00000    # 5.0f

    iget-object v5, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    const/high16 v1, 0x40a00000    # 5.0f

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v10, 0x41200000    # 10.0f

    .line 88
    iget-object v11, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    const/4 v7, 0x0

    const/high16 v8, 0x40a00000    # 5.0f

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41200000    # 10.0f

    iget-object v5, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    const/high16 v1, -0x3f600000    # -5.0f

    const/high16 v2, 0x41200000    # 10.0f

    const/high16 v3, 0x40a00000    # 5.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v10, -0x3f200000    # -7.0f

    .line 89
    iget-object v11, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    const/high16 v7, -0x3f200000    # -7.0f

    const/high16 v8, -0x3f200000    # -7.0f

    const/high16 v9, -0x3ed00000    # -11.0f

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, -0x40800000    # -1.0f

    iget-object v5, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    const/high16 v1, -0x3ed00000    # -11.0f

    const/high16 v2, -0x3f200000    # -7.0f

    const/high16 v3, -0x3ee00000    # -10.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v10, 0x3f800000    # 1.0f

    iget-object v11, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    const/high16 v7, -0x3ee00000    # -10.0f

    const/high16 v8, -0x40800000    # -1.0f

    const/high16 v9, -0x3f600000    # -5.0f

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, -0x3f200000    # -7.0f

    .line 90
    iget-object v5, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    const/high16 v1, 0x40e00000    # 7.0f

    const/high16 v3, 0x41300000    # 11.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v10, -0x40800000    # -1.0f

    iget-object v11, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    const/high16 v7, 0x41300000    # 11.0f

    const/high16 v8, -0x3f200000    # -7.0f

    const/high16 v9, 0x41200000    # 10.0f

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x3f800000    # 1.0f

    iget-object v5, p0, Le/e/a/BikeRun$1;->pen:Landroid/graphics/Paint;

    const/high16 v1, 0x41200000    # 10.0f

    const/high16 v2, -0x40800000    # -1.0f

    const/high16 v3, 0x40a00000    # 5.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 91
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method
