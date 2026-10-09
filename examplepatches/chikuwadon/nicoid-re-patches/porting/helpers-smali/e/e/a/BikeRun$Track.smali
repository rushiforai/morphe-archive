.class final Le/e/a/BikeRun$Track;
.super Landroid/view/View;
.source "BikeRun.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/BikeRun;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Track"
.end annotation


# instance fields
.field final accent:I

.field active:Z

.field final background:I

.field best:I

.field final foreground:I

.field final game:Le/e/a/BikeRunModel;

.field last:J

.field final obstacle:Landroid/graphics/Path;

.field final paint:Landroid/graphics/Paint;

.field recorded:Z

.field final road:Landroid/graphics/Path;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 6
    .param p1, "c"    # Landroid/content/Context;

    .line 56
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 48
    new-instance v0, Le/e/a/BikeRunModel;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Le/e/a/BikeRunModel;-><init>(J)V

    iput-object v0, p0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    .line 49
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    .line 50
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Le/e/a/BikeRun$Track;->road:Landroid/graphics/Path;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    .line 54
    iput-boolean v1, p0, Le/e/a/BikeRun$Track;->active:Z

    .line 56
    const v0, 0x7f03005e

    const v2, -0xad335d

    # invokes: Le/e/a/BikeRun;->color(Landroid/content/Context;II)I
    invoke-static {p1, v0, v2}, Le/e/a/BikeRun;->access$000(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Le/e/a/BikeRun$Track;->accent:I

    .line 57
    const v0, 0x1010031

    const v2, -0xe6e4e0

    # invokes: Le/e/a/BikeRun;->color(Landroid/content/Context;II)I
    invoke-static {p1, v0, v2}, Le/e/a/BikeRun;->access$000(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Le/e/a/BikeRun$Track;->background:I

    .line 58
    const v0, 0x1010036

    const v2, -0x111112

    # invokes: Le/e/a/BikeRun;->color(Landroid/content/Context;II)I
    invoke-static {p1, v0, v2}, Le/e/a/BikeRun;->access$000(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Le/e/a/BikeRun$Track;->foreground:I

    .line 59
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "bike_run_best"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Le/e/a/BikeRun$Track;->best:I

    .line 60
    const-string v0, "\u81ea\u8ee2\u8eca\u30e9\u30f3\u3002\u30bf\u30c3\u30d7\u30672\u6bb5\u30b8\u30e3\u30f3\u30d7\u3002\u969c\u5bb3\u7269\u3068\u7a74\u3092\u907f\u3051\u307e\u3059\u3002\u7d42\u4e86\u5f8c\u306f\u30bf\u30c3\u30d7\u3067\u518d\u6311\u6226\u3002"

    invoke-virtual {p0, v0}, Le/e/a/BikeRun$Track;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 61
    invoke-virtual {p0, v1}, Le/e/a/BikeRun$Track;->setFocusable(Z)V

    .line 62
    return-void
.end method


# virtual methods
.method line(Landroid/graphics/Canvas;FFFF)V
    .registers 12
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "xx"    # F
    .param p5, "yy"    # F

    .line 63
    iget-object v5, p0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    .end local p1    # "c":Landroid/graphics/Canvas;
    .end local p2    # "x":F
    .end local p3    # "y":F
    .end local p4    # "xx":F
    .end local p5    # "yy":F
    .local v0, "c":Landroid/graphics/Canvas;
    .local v1, "x":F
    .local v2, "y":F
    .local v3, "xx":F
    .local v4, "yy":F
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .line 175
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/BikeRun$Track;->active:Z

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 27
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 104
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-boolean v2, v0, Le/e/a/BikeRun$Track;->active:Z

    if-nez v2, :cond_c

    return-void

    .line 105
    :cond_c
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    .line 106
    .local v6, "now":J
    invoke-virtual {v0}, Le/e/a/BikeRun$Track;->hasWindowFocus()Z

    move-result v2

    const-wide/16 v3, 0x0

    if-eqz v2, :cond_2b

    iget-wide v8, v0, Le/e/a/BikeRun$Track;->last:J

    cmp-long v2, v8, v3

    if-eqz v2, :cond_2b

    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-wide v8, v0, Le/e/a/BikeRun$Track;->last:J

    sub-long v8, v6, v8

    long-to-float v5, v8

    const/high16 v8, 0x447a0000    # 1000.0f

    div-float/2addr v5, v8

    invoke-virtual {v2, v5}, Le/e/a/BikeRunModel;->step(F)V

    .line 107
    :cond_2b
    invoke-virtual {v0}, Le/e/a/BikeRun$Track;->hasWindowFocus()Z

    move-result v2

    if-eqz v2, :cond_32

    move-wide v3, v6

    :cond_32
    iput-wide v3, v0, Le/e/a/BikeRun$Track;->last:J

    .line 108
    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v2, v2, Le/e/a/BikeRunModel;->over:Z

    if-eqz v2, :cond_6a

    iget-boolean v2, v0, Le/e/a/BikeRun$Track;->recorded:Z

    if-nez v2, :cond_6a

    .line 109
    const/4 v2, 0x1

    iput-boolean v2, v0, Le/e/a/BikeRun$Track;->recorded:Z

    .line 110
    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    invoke-virtual {v2}, Le/e/a/BikeRunModel;->score()I

    move-result v2

    iget v3, v0, Le/e/a/BikeRun$Track;->best:I

    if-le v2, v3, :cond_6a

    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    invoke-virtual {v2}, Le/e/a/BikeRunModel;->score()I

    move-result v2

    iput v2, v0, Le/e/a/BikeRun$Track;->best:I

    invoke-virtual {v0}, Le/e/a/BikeRun$Track;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "bike_run_best"

    iget v4, v0, Le/e/a/BikeRun$Track;->best:I

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 112
    :cond_6a
    iget v2, v0, Le/e/a/BikeRun$Track;->background:I

    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 113
    invoke-virtual {v0}, Le/e/a/BikeRun$Track;->getWidth()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x44340000    # 720.0f

    div-float v8, v2, v3

    .local v8, "scale":F
    const/4 v9, 0x0

    cmpg-float v2, v8, v9

    if-gtz v2, :cond_7e

    return-void

    .line 114
    :cond_7e
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {v1, v8, v8}, Landroid/graphics/Canvas;->scale(FF)V

    .line 115
    invoke-virtual {v0}, Le/e/a/BikeRun$Track;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float v10, v2, v8

    .local v10, "height":F
    const/high16 v11, 0x40000000    # 2.0f

    mul-float v2, v10, v11

    const/high16 v3, 0x40400000    # 3.0f

    div-float/2addr v2, v3

    const/high16 v4, 0x422c0000    # 43.0f

    add-float/2addr v2, v4

    const/high16 v12, 0x43660000    # 230.0f

    invoke-static {v12, v2}, Ljava/lang/Math;->max(FF)F

    move-result v13

    .line 116
    .local v13, "ground":F
    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget v4, v0, Le/e/a/BikeRun$Track;->foreground:I

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v4, 0x41c80000    # 25.0f

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 117
    const/high16 v2, 0x42300000    # 44.0f

    iget-object v4, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const-string v5, "\u81ea\u8ee2\u8eca\u30e9\u30f3"

    const/high16 v14, 0x41c00000    # 24.0f

    invoke-virtual {v1, v5, v14, v2, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v4, 0x41900000    # 18.0f

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 118
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u8ddd\u96e2 "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    invoke-virtual {v4}, Le/e/a/BikeRunModel;->score()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " m   \u30d9\u30b9\u30c8 "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v4, v0, Le/e/a/BikeRun$Track;->best:I

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " m"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/high16 v4, 0x429c0000    # 78.0f

    iget-object v5, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v14, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 119
    invoke-virtual {v0, v1, v10}, Le/e/a/BikeRun$Track;->scenery(Landroid/graphics/Canvas;F)V

    .line 120
    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget v4, v0, Le/e/a/BikeRun$Track;->accent:I

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 121
    iget-object v2, v0, Le/e/a/BikeRun$Track;->road:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    const/4 v2, 0x0

    .line 122
    .local v2, "connected":Z
    const/4 v3, 0x0

    move v15, v2

    .end local v2    # "connected":Z
    .local v3, "sx":I
    .local v15, "connected":Z
    :goto_10b
    const/16 v2, 0x2d0

    if-gt v3, v2, :cond_174

    .line 123
    const/4 v2, 0x0

    .line 124
    .local v2, "gap":Z
    iget-object v4, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-object v4, v4, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_118
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_14b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/BikeRunModel$Hazard;

    const/16 v16, 0x0

    .local v5, "h":Le/e/a/BikeRunModel$Hazard;
    iget-boolean v9, v5, Le/e/a/BikeRunModel$Hazard;->gap:Z

    if-eqz v9, :cond_141

    int-to-float v9, v3

    const/high16 v17, 0x40000000    # 2.0f

    iget v11, v5, Le/e/a/BikeRunModel$Hazard;->x:F

    cmpl-float v9, v9, v11

    if-lez v9, :cond_143

    int-to-float v9, v3

    iget v11, v5, Le/e/a/BikeRunModel$Hazard;->x:F

    const/high16 v18, 0x43660000    # 230.0f

    iget v12, v5, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float/2addr v11, v12

    cmpg-float v9, v9, v11

    if-gez v9, :cond_145

    const/4 v2, 0x1

    goto :goto_151

    :cond_141
    const/high16 v17, 0x40000000    # 2.0f

    :cond_143
    const/high16 v18, 0x43660000    # 230.0f

    .end local v5    # "h":Le/e/a/BikeRunModel$Hazard;
    :cond_145
    const/4 v9, 0x0

    const/high16 v11, 0x40000000    # 2.0f

    const/high16 v12, 0x43660000    # 230.0f

    goto :goto_118

    :cond_14b
    const/16 v16, 0x0

    const/high16 v17, 0x40000000    # 2.0f

    const/high16 v18, 0x43660000    # 230.0f

    .line 125
    :goto_151
    iget-object v4, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    int-to-float v5, v3

    invoke-virtual {v4, v5}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v4

    add-float/2addr v4, v13

    .line 126
    .local v4, "sy":F
    if-eqz v2, :cond_15e

    const/4 v5, 0x0

    move v15, v5

    .end local v15    # "connected":Z
    .local v5, "connected":Z
    goto :goto_16c

    .line 127
    .end local v5    # "connected":Z
    .restart local v15    # "connected":Z
    :cond_15e
    iget-object v5, v0, Le/e/a/BikeRun$Track;->road:Landroid/graphics/Path;

    int-to-float v9, v3

    if-eqz v15, :cond_167

    invoke-virtual {v5, v9, v4}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_16a

    :cond_167
    invoke-virtual {v5, v9, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 128
    :goto_16a
    const/4 v5, 0x1

    move v15, v5

    .line 122
    .end local v2    # "gap":Z
    .end local v4    # "sy":F
    :goto_16c
    add-int/lit8 v3, v3, 0x4

    const/4 v9, 0x0

    const/high16 v11, 0x40000000    # 2.0f

    const/high16 v12, 0x43660000    # 230.0f

    goto :goto_10b

    :cond_174
    const/16 v16, 0x0

    const/high16 v17, 0x40000000    # 2.0f

    const/high16 v18, 0x43660000    # 230.0f

    .line 130
    .end local v3    # "sx":I
    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->road:Landroid/graphics/Path;

    iget-object v3, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 131
    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-object v2, v2, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_197
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2a9

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Le/e/a/BikeRunModel$Hazard;

    .line 132
    .local v11, "h":Le/e/a/BikeRunModel$Hazard;
    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v3, v11, Le/e/a/BikeRunModel$Hazard;->x:F

    invoke-virtual {v2, v3}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v2

    add-float v3, v13, v2

    .local v3, "left":F
    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v4, v11, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v5, v11, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float/2addr v4, v5

    invoke-virtual {v2, v4}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v2

    add-float v12, v13, v2

    .line 133
    .local v12, "right":F
    iget-boolean v2, v11, Le/e/a/BikeRunModel$Hazard;->gap:Z

    if-eqz v2, :cond_1e6

    .line 134
    iget v2, v11, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v4, v11, Le/e/a/BikeRunModel$Hazard;->x:F

    add-float v5, v3, v18

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    iget v0, v11, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v1, v11, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float v2, v0, v1

    iget v0, v11, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v1, v11, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float v4, v0, v1

    add-float v5, v12, v18

    move v0, v12

    move v12, v3

    move v3, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .local v3, "right":F
    .local v12, "left":F
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    move-wide/from16 v22, v6

    const/high16 v19, 0x41c00000    # 24.0f

    goto/16 :goto_2a3

    .line 136
    .local v3, "left":F
    .local v12, "right":F
    :cond_1e6
    move/from16 v24, v12

    move v12, v3

    move/from16 v3, v24

    .local v3, "right":F
    .local v12, "left":F
    iget-object v2, v0, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget v4, v11, Le/e/a/BikeRunModel$Hazard;->x:F

    invoke-virtual {v2, v4, v12}, Landroid/graphics/Path;->moveTo(FF)V

    .line 137
    iget-boolean v2, v11, Le/e/a/BikeRunModel$Hazard;->spikes:Z

    if-eqz v2, :cond_265

    iget v2, v11, Le/e/a/BikeRunModel$Hazard;->width:F

    const/high16 v4, 0x41a00000    # 20.0f

    div-float/2addr v2, v4

    float-to-int v2, v2

    const/4 v4, 0x2

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .local v2, "teeth":I
    const/4 v4, 0x0

    .local v4, "n":I
    :goto_207
    if-ge v4, v2, :cond_25e

    iget v5, v11, Le/e/a/BikeRunModel$Hazard;->x:F

    const/high16 v19, 0x41c00000    # 24.0f

    iget v14, v11, Le/e/a/BikeRunModel$Hazard;->width:F

    move/from16 v20, v5

    int-to-float v5, v4

    mul-float v14, v14, v5

    int-to-float v5, v2

    div-float/2addr v14, v5

    add-float v5, v20, v14

    .local v5, "x":F
    iget-object v14, v0, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    move/from16 v20, v4

    .end local v4    # "n":I
    .local v20, "n":I
    iget v4, v11, Le/e/a/BikeRunModel$Hazard;->width:F

    move/from16 v21, v4

    int-to-float v4, v2

    div-float v4, v21, v4

    div-float v4, v4, v17

    add-float/2addr v4, v5

    move/from16 v21, v5

    .end local v5    # "x":F
    .local v21, "x":F
    iget-object v5, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    move-wide/from16 v22, v6

    .end local v6    # "now":J
    .local v22, "now":J
    iget v6, v11, Le/e/a/BikeRunModel$Hazard;->width:F

    int-to-float v7, v2

    div-float/2addr v6, v7

    div-float v6, v6, v17

    add-float v6, v21, v6

    invoke-virtual {v5, v6}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v5

    add-float/2addr v5, v13

    iget v6, v11, Le/e/a/BikeRunModel$Hazard;->height:F

    sub-float/2addr v5, v6

    invoke-virtual {v14, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v4, v0, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget v5, v11, Le/e/a/BikeRunModel$Hazard;->width:F

    int-to-float v6, v2

    div-float/2addr v5, v6

    add-float v5, v21, v5

    iget-object v6, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v7, v11, Le/e/a/BikeRunModel$Hazard;->width:F

    int-to-float v14, v2

    div-float/2addr v7, v14

    add-float v7, v21, v7

    invoke-virtual {v6, v7}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v6

    add-float/2addr v6, v13

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Path;->lineTo(FF)V

    .end local v21    # "x":F
    add-int/lit8 v4, v20, 0x1

    move-wide/from16 v6, v22

    const/high16 v14, 0x41c00000    # 24.0f

    .end local v20    # "n":I
    .restart local v4    # "n":I
    goto :goto_207

    .end local v22    # "now":J
    .restart local v6    # "now":J
    :cond_25e
    move/from16 v20, v4

    move-wide/from16 v22, v6

    const/high16 v19, 0x41c00000    # 24.0f

    .end local v2    # "teeth":I
    .end local v4    # "n":I
    .end local v6    # "now":J
    .restart local v22    # "now":J
    goto :goto_28c

    .line 138
    .end local v22    # "now":J
    .restart local v6    # "now":J
    :cond_265
    move-wide/from16 v22, v6

    const/high16 v19, 0x41c00000    # 24.0f

    .end local v6    # "now":J
    .restart local v22    # "now":J
    iget-object v2, v0, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget v4, v11, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v5, v11, Le/e/a/BikeRunModel$Hazard;->height:F

    sub-float v5, v12, v5

    invoke-virtual {v2, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget v4, v11, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v5, v11, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float/2addr v4, v5

    iget v5, v11, Le/e/a/BikeRunModel$Hazard;->height:F

    sub-float v5, v3, v5

    invoke-virtual {v2, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget v4, v11, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v5, v11, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float/2addr v4, v5

    invoke-virtual {v2, v4, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 139
    :goto_28c
    iget-boolean v2, v11, Le/e/a/BikeRunModel$Hazard;->spikes:Z

    if-nez v2, :cond_295

    iget-object v2, v0, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    :cond_295
    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 140
    iget-object v2, v0, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget-object v4, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 142
    .end local v3    # "right":F
    .end local v11    # "h":Le/e/a/BikeRunModel$Hazard;
    .end local v12    # "left":F
    :goto_2a3
    move-wide/from16 v6, v22

    const/high16 v14, 0x41c00000    # 24.0f

    goto/16 :goto_197

    .line 143
    .end local v22    # "now":J
    .restart local v6    # "now":J
    :cond_2a9
    move-wide/from16 v22, v6

    const/high16 v19, 0x41c00000    # 24.0f

    .end local v6    # "now":J
    .restart local v22    # "now":J
    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget v3, v0, Le/e/a/BikeRun$Track;->accent:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v6, 0x40800000    # 4.0f

    invoke-virtual {v2, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 144
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 145
    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    const/high16 v3, 0x42f00000    # 120.0f

    invoke-virtual {v2, v3}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v2

    add-float/2addr v2, v13

    iget-object v4, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v4, v4, Le/e/a/BikeRunModel;->y:F

    add-float/2addr v2, v4

    invoke-virtual {v1, v3, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 146
    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v2, v2, Le/e/a/BikeRunModel;->y:F

    cmpl-float v2, v2, v16

    if-nez v2, :cond_2ef

    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    invoke-virtual {v2, v3}, Le/e/a/BikeRunModel;->slopeAt(F)F

    move-result v2

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->atan(D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v2

    double-to-float v9, v2

    goto :goto_2f0

    :cond_2ef
    const/4 v9, 0x0

    :goto_2f0
    invoke-virtual {v1, v9}, Landroid/graphics/Canvas;->rotate(F)V

    .line 147
    const v2, 0x3f266666    # 0.65f

    invoke-virtual {v1, v2, v2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 148
    const/4 v7, 0x0

    .local v7, "x":F
    const/high16 v3, -0x3e780000    # -17.0f

    .line 149
    .local v3, "y":F
    sub-float v2, v7, v19

    iget-object v4, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v9, 0x41800000    # 16.0f

    invoke-virtual {v1, v2, v3, v9, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    add-float v14, v7, v19

    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v14, v3, v9, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 150
    sub-float v2, v7, v19

    const/high16 v11, 0x40e00000    # 7.0f

    sub-float v4, v7, v11

    const/high16 v12, 0x41d00000    # 26.0f

    sub-float v5, v3, v12

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    sub-float v2, v7, v11

    move v5, v3

    .end local v3    # "y":F
    .local v5, "y":F
    sub-float v3, v5, v12

    const/high16 v14, 0x40a00000    # 5.0f

    add-float v4, v7, v14

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    move v3, v5

    .end local v5    # "y":F
    .restart local v3    # "y":F
    add-float v2, v7, v14

    sub-float v4, v7, v19

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    .line 151
    add-float v2, v7, v14

    const/high16 v16, 0x41980000    # 19.0f

    add-float v4, v7, v16

    const/high16 v18, 0x41e00000    # 28.0f

    sub-float v5, v3, v18

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    add-float v2, v7, v16

    move v5, v3

    .end local v3    # "y":F
    .restart local v5    # "y":F
    sub-float v3, v5, v18

    add-float v4, v7, v19

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    move/from16 v19, v5

    .end local v5    # "y":F
    .local v19, "y":F
    sub-float v2, v7, v11

    sub-float v3, v19, v12

    add-float v4, v7, v16

    sub-float v5, v19, v18

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    .line 152
    add-float v2, v7, v16

    sub-float v3, v19, v18

    const/high16 v11, 0x41700000    # 15.0f

    add-float v4, v7, v11

    const/high16 v12, 0x42100000    # 36.0f

    sub-float v5, v19, v12

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    add-float v2, v7, v11

    sub-float v3, v19, v12

    const/high16 v0, 0x41d80000    # 27.0f

    add-float v4, v7, v0

    sub-float v5, v19, v12

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    .line 153
    const/high16 v2, 0x3f800000    # 1.0f

    sub-float v2, v7, v2

    const/high16 v3, 0x42700000    # 60.0f

    sub-float v3, v19, v3

    const/high16 v4, 0x41100000    # 9.0f

    iget-object v5, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sub-float v2, v7, v6

    const/high16 v11, 0x42480000    # 50.0f

    sub-float v3, v19, v11

    const/high16 v12, 0x41500000    # 13.0f

    sub-float v4, v7, v12

    const/high16 v16, 0x41e80000    # 29.0f

    sub-float v5, v19, v16

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    sub-float v2, v7, v12

    sub-float v3, v19, v16

    add-float v4, v7, v14

    sub-float v5, v19, v9

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    .line 154
    add-float v2, v7, v14

    sub-float v3, v19, v9

    sub-float v4, v7, v6

    move/from16 v5, v19

    .end local v19    # "y":F
    .restart local v5    # "y":F
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    .end local v5    # "y":F
    .restart local v19    # "y":F
    sub-float v2, v7, v6

    sub-float v3, v19, v11

    add-float v4, v7, v9

    const/high16 v0, 0x420c0000    # 35.0f

    sub-float v5, v19, v0

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    .line 155
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 156
    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget v3, v0, Le/e/a/BikeRun$Track;->foreground:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41b00000    # 22.0f

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 158
    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v2, v2, Le/e/a/BikeRunModel;->started:Z

    if-eqz v2, :cond_3e3

    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v2, v2, Le/e/a/BikeRunModel;->over:Z

    if-eqz v2, :cond_41a

    .line 159
    :cond_3e3
    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v4, 0x42000000    # 32.0f

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v2, v2, Le/e/a/BikeRunModel;->over:Z

    if-eqz v2, :cond_3f3

    const-string v2, "\u30b2\u30fc\u30e0\u30aa\u30fc\u30d0\u30fc"

    goto :goto_3f5

    :cond_3f3
    const-string v2, "\u969c\u5bb3\u7269\u3068\u7a74\u3092\u30b8\u30e3\u30f3\u30d7\u3067\u907f\u3051\u3088\u3046"

    :goto_3f5
    div-float v4, v10, v17

    iget-object v5, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v6, 0x43b40000    # 360.0f

    invoke-virtual {v1, v2, v6, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 160
    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v2, v2, Le/e/a/BikeRunModel;->over:Z

    if-eqz v2, :cond_40c

    const-string v2, "\u30bf\u30c3\u30d7\u3067\u518d\u6311\u6226"

    goto :goto_40e

    :cond_40c
    const-string v2, "\u30bf\u30c3\u30d7\u3057\u3066\u30b9\u30bf\u30fc\u30c8"

    :goto_40e
    div-float v3, v10, v17

    const/high16 v4, 0x42280000    # 42.0f

    add-float/2addr v3, v4

    iget-object v4, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v5, 0x43b40000    # 360.0f

    invoke-virtual {v1, v2, v5, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 162
    :cond_41a
    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 163
    iget-boolean v2, v0, Le/e/a/BikeRun$Track;->active:Z

    if-eqz v2, :cond_43d

    invoke-virtual {v0}, Le/e/a/BikeRun$Track;->hasWindowFocus()Z

    move-result v2

    if-eqz v2, :cond_43d

    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v2, v2, Le/e/a/BikeRunModel;->started:Z

    if-eqz v2, :cond_43d

    iget-object v2, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v2, v2, Le/e/a/BikeRunModel;->over:Z

    if-nez v2, :cond_43d

    invoke-virtual {v0}, Le/e/a/BikeRun$Track;->postInvalidateOnAnimation()V

    .line 164
    :cond_43d
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "e"    # Landroid/view/MotionEvent;

    .line 166
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_22

    .line 167
    invoke-virtual {p0}, Le/e/a/BikeRun$Track;->performClick()Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/BikeRun$Track;->recorded:Z

    iget-object v0, p0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    invoke-virtual {v0}, Le/e/a/BikeRunModel;->tap()V

    .line 168
    iget-wide v0, p0, Le/e/a/BikeRun$Track;->last:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_1f

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/BikeRun$Track;->last:J

    .line 169
    :cond_1f
    invoke-virtual {p0}, Le/e/a/BikeRun$Track;->invalidate()V

    .line 171
    :cond_22
    const/4 v0, 0x1

    return v0
.end method

.method public onWindowFocusChanged(Z)V
    .registers 4
    .param p1, "focused"    # Z

    .line 174
    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Le/e/a/BikeRun$Track;->last:J

    if-eqz p1, :cond_c

    invoke-virtual {p0}, Le/e/a/BikeRun$Track;->invalidate()V

    :cond_c
    return-void
.end method

.method public performClick()Z
    .registers 2

    .line 173
    invoke-super {p0}, Landroid/view/View;->performClick()Z

    const/4 v0, 0x1

    return v0
.end method

.method scenery(Landroid/graphics/Canvas;F)V
    .registers 29
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "height"    # F

    .line 65
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x3fc00000    # 1.5f

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget v3, v0, Le/e/a/BikeRun$Track;->foreground:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/16 v3, 0x50

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 66
    const v2, 0x3f051eb8    # 0.52f

    mul-float v9, p2, v2

    .line 67
    .local v9, "horizon":F
    iget-object v2, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const v6, 0x44124000    # 585.0f

    const/high16 v7, 0x43110000    # 145.0f

    const/high16 v10, 0x41e80000    # 29.0f

    invoke-virtual {v1, v6, v7, v10, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 68
    const/4 v2, 0x0

    move v8, v2

    .local v8, "n":I
    :goto_33
    const/16 v2, 0x8

    if-ge v8, v2, :cond_72

    int-to-double v2, v8

    const-wide v4, 0x400921fb54442d18L    # Math.PI

    mul-double v2, v2, v4

    const-wide/high16 v4, 0x4010000000000000L    # 4.0

    div-double v11, v2, v4

    .local v11, "a":D
    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float v2, v2

    const/high16 v3, 0x42140000    # 37.0f

    mul-float v2, v2, v3

    add-float/2addr v2, v6

    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v4, v4

    mul-float v4, v4, v3

    add-float v3, v4, v7

    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    double-to-float v4, v4

    const/high16 v5, 0x423c0000    # 47.0f

    mul-float v4, v4, v5

    add-float/2addr v4, v6

    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    move-result-wide v13

    double-to-float v13, v13

    mul-float v13, v13, v5

    add-float v5, v13, v7

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    move-object v11, v0

    .end local v11    # "a":D
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v1, p1

    goto :goto_33

    :cond_72
    move-object v11, v0

    .line 69
    .end local v8    # "n":I
    iget-object v0, v11, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v0, v0, Le/e/a/BikeRunModel;->distance:F

    const v1, 0x3dcccccd    # 0.1f

    mul-float v0, v0, v1

    const/high16 v1, 0x44610000    # 900.0f

    rem-float v12, v0, v1

    .line 70
    .local v12, "clouds":F
    const/4 v0, 0x0

    move v13, v0

    .local v13, "n":I
    :goto_82
    const/4 v0, 0x4

    const/high16 v14, 0x41c00000    # 24.0f

    const/high16 v6, 0x42280000    # 42.0f

    const/high16 v15, 0x41700000    # 15.0f

    const/high16 v16, 0x41f00000    # 30.0f

    if-ge v13, v0, :cond_e4

    .line 71
    mul-int/lit16 v0, v13, 0x10e

    int-to-float v0, v0

    sub-float v1, v0, v12

    .local v1, "x":F
    rem-int/lit8 v0, v13, 0x2

    mul-int/lit8 v0, v0, 0x4b

    add-int/lit16 v0, v0, 0x9b

    int-to-float v2, v0

    .line 72
    .local v2, "y":F
    add-float v3, v1, v6

    add-float v4, v2, v16

    const/4 v7, 0x0

    iget-object v8, v11, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v5, 0x43340000    # 180.0f

    const/high16 v6, 0x43340000    # 180.0f

    move-object/from16 v0, p1

    invoke-virtual/range {v0 .. v8}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    .line 73
    move/from16 v17, v1

    move/from16 v18, v2

    .end local v1    # "x":F
    .end local v2    # "y":F
    .local v17, "x":F
    .local v18, "y":F
    add-float v1, v17, v14

    const/high16 v0, 0x41800000    # 16.0f

    sub-float v2, v18, v0

    const/high16 v0, 0x42a00000    # 80.0f

    add-float v3, v17, v0

    add-float v4, v18, v16

    iget-object v8, v11, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual/range {v0 .. v8}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    .line 74
    const/high16 v0, 0x42780000    # 62.0f

    add-float v1, v17, v0

    const/high16 v14, 0x42d40000    # 106.0f

    add-float v3, v17, v14

    add-float v4, v18, v16

    iget-object v8, v11, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move/from16 v2, v18

    .end local v18    # "y":F
    .restart local v2    # "y":F
    invoke-virtual/range {v0 .. v8}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    .line 75
    .end local v2    # "y":F
    .restart local v18    # "y":F
    add-float v3, v18, v15

    add-float v4, v17, v14

    add-float v5, v18, v15

    move-object/from16 v1, p1

    move-object v0, v11

    move/from16 v2, v17

    .end local v17    # "x":F
    .local v2, "x":F
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    .line 70
    .end local v2    # "x":F
    .end local v18    # "y":F
    add-int/lit8 v13, v13, 0x1

    goto :goto_82

    :cond_e4
    move-object v0, v11

    .line 77
    .end local v13    # "n":I
    iget-object v1, v0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v1, v1, Le/e/a/BikeRunModel;->distance:F

    const v2, 0x3e6147ae    # 0.22f

    mul-float v7, v1, v2

    .line 78
    .local v7, "offset":F
    const/high16 v1, 0x43340000    # 180.0f

    div-float v1, v7, v1

    float-to-int v1, v1

    const/4 v8, 0x1

    add-int/lit8 v11, v1, -0x1

    .line 79
    .local v11, "first":I
    move v1, v11

    move v13, v1

    .restart local v13    # "n":I
    :goto_f8
    add-int/lit8 v1, v11, 0x7

    if-ge v13, v1, :cond_2cf

    .line 80
    const v1, 0x41c64e6d

    mul-int v1, v1, v13

    add-int/lit16 v1, v1, 0x3039

    .local v1, "hash":I
    ushr-int/lit8 v2, v1, 0x10

    xor-int v17, v1, v2

    .line 81
    .end local v1    # "hash":I
    .local v17, "hash":I
    const v1, 0x7fffffff

    and-int v1, v17, v1

    rem-int/lit8 v1, v1, 0x5

    .line 82
    .local v1, "kind":I
    mul-int/lit16 v2, v13, 0xb4

    int-to-float v2, v2

    sub-float/2addr v2, v7

    ushr-int/lit8 v3, v17, 0x8

    and-int/lit8 v3, v3, 0x1f

    int-to-float v3, v3

    add-float/2addr v2, v3

    .restart local v2    # "x":F
    ushr-int/lit8 v3, v17, 0xd

    and-int/lit8 v3, v3, 0x3f

    add-int/lit8 v3, v3, 0x37

    int-to-float v3, v3

    .line 83
    .local v3, "size":F
    if-nez v1, :cond_16d

    .line 84
    const/high16 v18, 0x40000000    # 2.0f

    div-float v4, v3, v18

    add-float/2addr v4, v2

    sub-float v5, v9, v3

    move/from16 v19, v3

    move v3, v9

    move v9, v1

    move-object/from16 v1, p1

    .end local v1    # "kind":I
    .local v3, "horizon":F
    .local v9, "kind":I
    .local v19, "size":F
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    move/from16 v20, v2

    .end local v2    # "x":F
    .local v20, "x":F
    div-float v0, v19, v18

    add-float v2, v20, v0

    move v4, v3

    .end local v3    # "horizon":F
    .local v4, "horizon":F
    sub-float v3, v4, v19

    move v5, v4

    .end local v4    # "horizon":F
    .local v5, "horizon":F
    add-float v4, v20, v19

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    .line 85
    move/from16 v18, v5

    .end local v5    # "horizon":F
    .local v18, "horizon":F
    const v0, 0x3ea3d70a    # 0.32f

    mul-float v3, v19, v0

    add-float v2, v20, v3

    const v0, 0x3f23d70a    # 0.64f

    mul-float v3, v19, v0

    sub-float v3, v18, v3

    const v0, 0x3ef5c28f    # 0.48f

    mul-float v0, v0, v19

    add-float v4, v20, v0

    const v0, 0x3f07ae14    # 0.53f

    mul-float v0, v0, v19

    sub-float v5, v18, v0

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v24, 0x42280000    # 42.0f

    move-object/from16 v6, p0

    move/from16 v22, v18

    goto/16 :goto_2c5

    .line 86
    .end local v18    # "horizon":F
    .end local v19    # "size":F
    .end local v20    # "x":F
    .restart local v1    # "kind":I
    .restart local v2    # "x":F
    .local v3, "size":F
    .local v9, "horizon":F
    :cond_16d
    move/from16 v20, v2

    move/from16 v19, v3

    move/from16 v18, v9

    move v9, v1

    .end local v1    # "kind":I
    .end local v2    # "x":F
    .end local v3    # "size":F
    .local v9, "kind":I
    .restart local v18    # "horizon":F
    .restart local v19    # "size":F
    .restart local v20    # "x":F
    const/high16 v21, 0x42700000    # 60.0f

    const/high16 v0, 0x41a00000    # 20.0f

    const/high16 v22, 0x42820000    # 65.0f

    if-ne v9, v8, :cond_1b7

    .line 87
    const/high16 v23, 0x41d00000    # 26.0f

    add-float v2, v20, v23

    add-float v4, v20, v23

    sub-float v5, v18, v21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v3, v18

    const/high16 v6, 0x41a00000    # 20.0f

    const/high16 v24, 0x42280000    # 42.0f

    .end local v18    # "horizon":F
    .local v3, "horizon":F
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    add-float v2, v20, v23

    const/high16 v4, 0x42a60000    # 83.0f

    sub-float v4, v3, v4

    iget-object v5, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v4, v10, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 88
    const/high16 v2, 0x40c00000    # 6.0f

    add-float v2, v20, v2

    sub-float v4, v3, v22

    iget-object v5, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v4, v6, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v2, 0x42380000    # 46.0f

    add-float v2, v20, v2

    sub-float v4, v3, v22

    iget-object v5, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v4, v6, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    move-object v6, v0

    move/from16 v22, v3

    goto/16 :goto_2c5

    .line 89
    .end local v3    # "horizon":F
    .restart local v18    # "horizon":F
    :cond_1b7
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v3, v18

    const/high16 v6, 0x41a00000    # 20.0f

    const/high16 v24, 0x42280000    # 42.0f

    .end local v18    # "horizon":F
    .restart local v3    # "horizon":F
    const/high16 v18, 0x41200000    # 10.0f

    const/4 v2, 0x2

    if-ne v9, v2, :cond_20d

    .line 90
    add-float v4, v20, v16

    sub-float v2, v3, v19

    sub-float v5, v2, v22

    move/from16 v2, v20

    .end local v20    # "x":F
    .restart local v2    # "x":F
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    .end local v2    # "x":F
    .restart local v20    # "x":F
    add-float v2, v20, v16

    sub-float v0, v3, v19

    sub-float v0, v0, v22

    add-float v4, v20, v21

    move-object/from16 v1, p1

    move v5, v3

    move v3, v0

    move-object/from16 v0, p0

    .end local v3    # "horizon":F
    .restart local v5    # "horizon":F
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    .line 91
    move/from16 v21, v5

    .end local v5    # "horizon":F
    .local v21, "horizon":F
    add-float v2, v20, v18

    const/high16 v0, 0x420c0000    # 35.0f

    sub-float v3, v21, v0

    const/high16 v1, 0x42480000    # 50.0f

    add-float v4, v20, v1

    sub-float v5, v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v0, 0x41900000    # 18.0f

    add-float v2, v20, v0

    const/high16 v0, 0x42960000    # 75.0f

    sub-float v3, v21, v0

    add-float v4, v20, v24

    sub-float v5, v21, v0

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    move-object v6, v0

    move/from16 v22, v21

    goto/16 :goto_2c5

    .line 92
    .end local v21    # "horizon":F
    .restart local v3    # "horizon":F
    :cond_20d
    move/from16 v21, v3

    .line 97
    .end local v3    # "horizon":F
    .restart local v21    # "horizon":F
    iget-object v5, v0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    .line 92
    const/4 v1, 0x3

    if-ne v9, v1, :cond_269

    .line 93
    sub-float v2, v21, v19

    .local v2, "top":F
    const/high16 v1, 0x42800000    # 64.0f

    add-float v3, v20, v1

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v4, v21

    .end local v20    # "x":F
    .end local v21    # "horizon":F
    .local v1, "x":F
    .restart local v4    # "horizon":F
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 94
    move/from16 v18, v4

    .end local v1    # "x":F
    .end local v4    # "horizon":F
    .restart local v18    # "horizon":F
    .restart local v20    # "x":F
    const/high16 v0, 0x41000000    # 8.0f

    sub-float v0, v20, v0

    const/high16 v1, 0x42000000    # 32.0f

    add-float v4, v20, v1

    const/high16 v1, 0x42080000    # 34.0f

    sub-float v5, v2, v1

    move-object/from16 v1, p1

    move v3, v2

    move v2, v0

    move-object/from16 v0, p0

    .end local v2    # "top":F
    .local v3, "top":F
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    move v2, v3

    .end local v3    # "top":F
    .restart local v2    # "top":F
    const/high16 v0, 0x42000000    # 32.0f

    add-float v0, v20, v0

    const/high16 v1, 0x42080000    # 34.0f

    sub-float v3, v2, v1

    const/high16 v1, 0x42900000    # 72.0f

    add-float v4, v20, v1

    move-object/from16 v1, p1

    move v5, v2

    move v2, v0

    move-object/from16 v0, p0

    .end local v2    # "top":F
    .local v5, "top":F
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    .line 95
    move-object v6, v0

    move/from16 v21, v5

    .end local v5    # "top":F
    .local v21, "top":F
    add-float v1, v20, v14

    sub-float v2, v18, v16

    const/high16 v0, 0x42200000    # 40.0f

    add-float v3, v20, v0

    iget-object v5, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move/from16 v4, v18

    .end local v18    # "horizon":F
    .restart local v4    # "horizon":F
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 96
    move v3, v4

    .end local v4    # "horizon":F
    .end local v21    # "top":F
    .local v3, "horizon":F
    move/from16 v22, v3

    goto/16 :goto_2c5

    .line 97
    .end local v3    # "horizon":F
    .local v21, "horizon":F
    :cond_269
    move/from16 v3, v21

    .end local v21    # "horizon":F
    .restart local v3    # "horizon":F
    sub-float v0, v3, v19

    const/high16 v2, 0x42200000    # 40.0f

    sub-float v2, v0, v2

    const/high16 v0, 0x42900000    # 72.0f

    add-float v0, v20, v0

    move-object/from16 v6, p0

    move v4, v3

    move/from16 v1, v20

    const/4 v8, 0x3

    const/high16 v21, 0x41a00000    # 20.0f

    move v3, v0

    move-object/from16 v0, p1

    .end local v3    # "horizon":F
    .end local v20    # "x":F
    .restart local v1    # "x":F
    .restart local v4    # "horizon":F
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 98
    move/from16 v23, v1

    move/from16 v22, v4

    .end local v1    # "x":F
    .end local v4    # "horizon":F
    .local v22, "horizon":F
    .local v23, "x":F
    const/4 v0, 0x0

    .local v0, "row":I
    :goto_288
    if-ge v0, v8, :cond_2c4

    const/4 v1, 0x0

    .local v1, "col":I
    :goto_28b
    if-ge v1, v8, :cond_2bd

    add-float v2, v23, v18

    mul-int/lit8 v3, v1, 0x12

    int-to-float v3, v3

    add-float/2addr v2, v3

    sub-float v3, v22, v19

    const/high16 v4, 0x41d80000    # 27.0f

    sub-float/2addr v3, v4

    mul-int/lit8 v4, v0, 0x1b

    int-to-float v4, v4

    add-float/2addr v3, v4

    add-float v4, v23, v21

    mul-int/lit8 v5, v1, 0x12

    int-to-float v5, v5

    add-float/2addr v4, v5

    sub-float v5, v22, v19

    sub-float/2addr v5, v15

    mul-int/lit8 v8, v0, 0x1b

    int-to-float v8, v8

    add-float/2addr v5, v8

    move v8, v1

    move v1, v2

    move v2, v3

    move v3, v4

    move v4, v5

    .end local v1    # "col":I
    .local v8, "col":I
    iget-object v5, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    move/from16 v25, v8

    move v8, v0

    move-object/from16 v0, p1

    .end local v0    # "row":I
    .local v8, "row":I
    .local v25, "col":I
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v1, v25, 0x1

    move v0, v8

    const/4 v8, 0x3

    .end local v25    # "col":I
    .restart local v1    # "col":I
    goto :goto_28b

    .end local v8    # "row":I
    .restart local v0    # "row":I
    :cond_2bd
    move v8, v0

    move/from16 v25, v1

    .end local v0    # "row":I
    .end local v1    # "col":I
    .restart local v8    # "row":I
    add-int/lit8 v0, v8, 0x1

    const/4 v8, 0x3

    .end local v8    # "row":I
    .restart local v0    # "row":I
    goto :goto_288

    :cond_2c4
    move v8, v0

    .line 79
    .end local v0    # "row":I
    .end local v9    # "kind":I
    .end local v17    # "hash":I
    .end local v19    # "size":F
    .end local v23    # "x":F
    :goto_2c5
    add-int/lit8 v13, v13, 0x1

    move-object v0, v6

    move/from16 v9, v22

    const/high16 v6, 0x42280000    # 42.0f

    const/4 v8, 0x1

    goto/16 :goto_f8

    .end local v22    # "horizon":F
    .local v9, "horizon":F
    :cond_2cf
    move-object v6, v0

    .line 101
    .end local v13    # "n":I
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 102
    return-void
.end method
