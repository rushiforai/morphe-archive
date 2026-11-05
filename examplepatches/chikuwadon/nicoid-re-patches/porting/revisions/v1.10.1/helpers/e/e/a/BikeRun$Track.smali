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

.field final arcBounds:Landroid/graphics/RectF;

.field final background:I

.field best:I

.field final foreground:I

.field final game:Le/e/a/BikeRunModel;

.field historyOpen:Z

.field last:J

.field final obstacle:Landroid/graphics/Path;

.field final paint:Landroid/graphics/Paint;

.field paused:Z

.field final prefs:Landroid/content/SharedPreferences;

.field recorded:Z

.field final records:Le/e/a/BikeRunRecords;

.field recordsPage:I

.field final road:Landroid/graphics/Path;

.field runId:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 8

    .line 266
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 247
    new-instance v0, Le/e/a/BikeRunModel;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Le/e/a/BikeRunModel;-><init>(J)V

    iput-object v0, p0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    .line 248
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    .line 249
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Le/e/a/BikeRun$Track;->road:Landroid/graphics/Path;

    .line 250
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    .line 256
    iput-boolean v1, p0, Le/e/a/BikeRun$Track;->active:Z

    .line 259
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/BikeRun$Track;->runId:Ljava/lang/String;

    .line 263
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Le/e/a/BikeRun$Track;->arcBounds:Landroid/graphics/RectF;

    const v0, 0x7f03005e

    const v2, -0xad335d

    .line 267
    # invokes: Le/e/a/BikeRun;->color(Landroid/content/Context;II)I
    invoke-static {p1, v0, v2}, Le/e/a/BikeRun;->access$0(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Le/e/a/BikeRun$Track;->accent:I

    const v0, 0x1010031

    const v2, -0xe6e4e0

    .line 268
    # invokes: Le/e/a/BikeRun;->color(Landroid/content/Context;II)I
    invoke-static {p1, v0, v2}, Le/e/a/BikeRun;->access$0(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Le/e/a/BikeRun$Track;->background:I

    const v0, 0x1010036

    const v2, -0x111112

    .line 269
    # invokes: Le/e/a/BikeRun;->color(Landroid/content/Context;II)I
    invoke-static {p1, v0, v2}, Le/e/a/BikeRun;->access$0(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Le/e/a/BikeRun$Track;->foreground:I

    .line 270
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Le/e/a/BikeRun$Track;->prefs:Landroid/content/SharedPreferences;

    .line 271
    new-instance v0, Le/e/a/BikeRunRecords;

    const-string v2, ""

    const-string v3, "bike_run_records_v1"

    invoke-interface {p1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Le/e/a/BikeRunRecords;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Le/e/a/BikeRun$Track;->records:Le/e/a/BikeRunRecords;

    .line 272
    const-string v2, "bike_run_records_migrated_130"

    const/4 v4, 0x0

    invoke-interface {p1, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_95

    .line 273
    const-string v5, "bike_run_best"

    invoke-interface {p1, v5, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    invoke-virtual {v0, v5}, Le/e/a/BikeRunRecords;->migrateBeforeRelease(I)V

    .line 274
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-virtual {v0}, Le/e/a/BikeRunRecords;->encode()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1, v3, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 275
    invoke-interface {p1, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 277
    :cond_95
    const-string p1, "1.3.1"

    invoke-virtual {v0, p1}, Le/e/a/BikeRunRecords;->best(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    .line 278
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a2

    goto :goto_aa

    :cond_a2
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/BikeRunRecords$Entry;

    iget v4, p1, Le/e/a/BikeRunRecords$Entry;->score:I

    :goto_aa
    iput v4, p0, Le/e/a/BikeRun$Track;->best:I

    .line 279
    const-string p1, "\u81ea\u8ee2\u8eca\u30e9\u30f3\u3002\u30bf\u30c3\u30d7\u30672\u6bb5\u30b8\u30e3\u30f3\u30d7\u3002\u969c\u5bb3\u7269\u3068\u7a74\u3092\u907f\u3051\u307e\u3059\u3002\u7d42\u4e86\u5f8c\u306f\u30bf\u30c3\u30d7\u3067\u518d\u6311\u6226\u3002"

    invoke-virtual {p0, p1}, Le/e/a/BikeRun$Track;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 280
    invoke-virtual {p0, v1}, Le/e/a/BikeRun$Track;->setFocusable(Z)V

    return-void
.end method


# virtual methods
.method arc(Landroid/graphics/Canvas;FFFFFFZLandroid/graphics/Paint;)V
    .registers 18

    move-object v0, p0

    .line 329
    iget-object v1, v0, Le/e/a/BikeRun$Track;->arcBounds:Landroid/graphics/RectF;

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual {v1, p2, p3, p4, p5}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v3, v0, Le/e/a/BikeRun$Track;->arcBounds:Landroid/graphics/RectF;

    move-object v2, p1

    move v4, p6

    move v5, p7

    move/from16 v6, p8

    move-object/from16 v7, p9

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    return-void
.end method

.method synthetic lambda$0$e-e-a-BikeRun$Track(Landroid/content/DialogInterface;)V
    .registers 4

    .line 0
    const/4 p1, 0x0

    .line 325
    iput-boolean p1, p0, Le/e/a/BikeRun$Track;->historyOpen:Z

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Le/e/a/BikeRun$Track;->last:J

    invoke-virtual {p0}, Le/e/a/BikeRun$Track;->invalidate()V

    return-void
.end method

.method line(Landroid/graphics/Canvas;FFFF)V
    .registers 12

    .line 333
    iget-object v5, p0, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    const/4 v0, 0x0

    .line 587
    iput-boolean v0, p0, Le/e/a/BikeRun$Track;->active:Z

    .line 588
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 23

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    .line 408
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 409
    iget-boolean v0, v6, Le/e/a/BikeRun$Track;->active:Z

    if-nez v0, :cond_c

    return-void

    .line 412
    :cond_c
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 413
    iget-boolean v2, v6, Le/e/a/BikeRun$Track;->paused:Z

    const-wide/16 v3, 0x0

    if-nez v2, :cond_2d

    invoke-virtual/range {p0 .. p0}, Le/e/a/BikeRun$Track;->hasWindowFocus()Z

    move-result v2

    if-eqz v2, :cond_2d

    iget-wide v8, v6, Le/e/a/BikeRun$Track;->last:J

    cmp-long v2, v8, v3

    if-eqz v2, :cond_2d

    .line 414
    iget-object v2, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    sub-long v8, v0, v8

    long-to-float v5, v8

    const/high16 v8, 0x447a0000    # 1000.0f

    div-float/2addr v5, v8

    invoke-virtual {v2, v5}, Le/e/a/BikeRunModel;->step(F)V

    .line 416
    :cond_2d
    iget-boolean v2, v6, Le/e/a/BikeRun$Track;->paused:Z

    if-nez v2, :cond_38

    invoke-virtual/range {p0 .. p0}, Le/e/a/BikeRun$Track;->hasWindowFocus()Z

    move-result v2

    if-eqz v2, :cond_38

    goto :goto_39

    :cond_38
    move-wide v0, v3

    :goto_39
    iput-wide v0, v6, Le/e/a/BikeRun$Track;->last:J

    .line 417
    invoke-virtual/range {p0 .. p0}, Le/e/a/BikeRun$Track;->saveResult()V

    .line 418
    iget v0, v6, Le/e/a/BikeRun$Track;->background:I

    invoke-virtual {v7, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 419
    invoke-virtual/range {p0 .. p0}, Le/e/a/BikeRun$Track;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x44340000    # 720.0f

    div-float/2addr v0, v1

    const/4 v8, 0x0

    cmpg-float v1, v0, v8

    if-gtz v1, :cond_51

    return-void

    .line 423
    :cond_51
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 424
    invoke-virtual {v7, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    .line 425
    invoke-virtual/range {p0 .. p0}, Le/e/a/BikeRun$Track;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float v9, v1, v0

    const/high16 v10, 0x40000000    # 2.0f

    mul-float v0, v9, v10

    const/high16 v1, 0x40400000    # 3.0f

    div-float/2addr v0, v1

    const/high16 v2, 0x422c0000    # 43.0f

    add-float/2addr v0, v2

    const/high16 v11, 0x43660000    # 230.0f

    .line 426
    invoke-static {v11, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 427
    iget-object v2, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 428
    iget-object v2, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget v3, v6, Le/e/a/BikeRun$Track;->foreground:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 429
    iget-object v2, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41c80000    # 25.0f

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 430
    invoke-static {}, Le/e/a/BikeRunModel;->title()Ljava/lang/String;

    move-result-object v2

    const/high16 v3, 0x42300000    # 44.0f

    iget-object v4, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v5, 0x41c00000    # 24.0f

    invoke-virtual {v7, v2, v5, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 431
    iget-object v2, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 432
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u8ddd\u96e2 "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    invoke-virtual {v3}, Le/e/a/BikeRunModel;->score()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " m   \u30d9\u30b9\u30c8 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v6, Le/e/a/BikeRun$Track;->best:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, " m"

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/high16 v3, 0x429c0000    # 78.0f

    iget-object v4, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v2, v5, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 433
    invoke-virtual {v6, v7, v9}, Le/e/a/BikeRun$Track;->scenery(Landroid/graphics/Canvas;F)V

    .line 435
    iget-object v2, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    const/high16 v13, 0x42f00000    # 120.0f

    invoke-virtual {v2, v13}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v2

    add-float/2addr v2, v0

    iget-object v3, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v3, v3, Le/e/a/BikeRunModel;->y:F

    add-float/2addr v2, v3

    const/high16 v3, 0x432a0000    # 170.0f

    sub-float/2addr v3, v2

    invoke-static {v8, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    add-float v14, v0, v2

    .line 436
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget v2, v6, Le/e/a/BikeRun$Track;->accent:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 437
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 438
    iget-object v0, v6, Le/e/a/BikeRun$Track;->road:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_ee
    const/16 v5, 0x2d0

    const/4 v4, 0x1

    if-le v0, v5, :cond_46d

    .line 461
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 462
    iget-object v0, v6, Le/e/a/BikeRun$Track;->road:Landroid/graphics/Path;

    iget-object v1, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 463
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v0, 0x4

    const/4 v3, 0x4

    :goto_10a
    const/high16 v2, 0x40800000    # 4.0f

    if-le v3, v5, :cond_42d

    .line 473
    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-object v0, v0, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_116
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_335

    .line 503
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget v1, v6, Le/e/a/BikeRun$Track;->accent:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 504
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 505
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 506
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 507
    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    invoke-virtual {v0, v13}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v0

    add-float/2addr v14, v0

    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v0, v0, Le/e/a/BikeRunModel;->y:F

    add-float/2addr v14, v0

    invoke-virtual {v7, v13, v14}, Landroid/graphics/Canvas;->translate(FF)V

    .line 508
    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v0, v0, Le/e/a/BikeRunModel;->y:F

    cmpl-float v0, v0, v8

    if-nez v0, :cond_159

    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    invoke-virtual {v0, v13}, Le/e/a/BikeRunModel;->slopeAt(F)F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->atan(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v0

    double-to-float v8, v0

    :cond_159
    invoke-virtual {v7, v8}, Landroid/graphics/Canvas;->rotate(F)V

    const v0, 0x3f266666    # 0.65f

    .line 509
    invoke-virtual {v7, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    .line 512
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v8, -0x3e400000    # -24.0f

    const/high16 v11, -0x3e780000    # -17.0f

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v7, v8, v11, v1, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 513
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v13, 0x41c00000    # 24.0f

    invoke-virtual {v7, v13, v11, v1, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v14, -0x3f200000    # -7.0f

    const/high16 v15, -0x3dd40000    # -43.0f

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v2, v8

    move v3, v11

    const/4 v5, 0x1

    move v4, v14

    move v5, v15

    .line 514
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v16, 0x40a00000    # 5.0f

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    move v5, v11

    .line 515
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    move/from16 v2, v16

    move v3, v11

    move v4, v8

    .line 516
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v8, 0x41980000    # 19.0f

    const/high16 v18, -0x3dcc0000    # -45.0f

    move v4, v8

    move/from16 v5, v18

    .line 517
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    move v2, v8

    move/from16 v3, v18

    move v4, v13

    move v5, v11

    .line 518
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    move v2, v14

    move v3, v15

    move v4, v8

    move/from16 v5, v18

    .line 519
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v13, 0x41700000    # 15.0f

    const/high16 v14, -0x3dac0000    # -53.0f

    move v2, v8

    move/from16 v3, v18

    move v4, v13

    move v5, v14

    .line 520
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v4, 0x41d80000    # 27.0f

    move v2, v13

    move v3, v14

    .line 521
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v0, 0x41100000    # 9.0f

    .line 522
    iget-object v1, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v2, -0x40800000    # -1.0f

    const/high16 v3, -0x3d660000    # -77.0f

    invoke-virtual {v7, v2, v3, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v8, -0x3f800000    # -4.0f

    const/high16 v13, -0x3d7a0000    # -67.0f

    const/high16 v14, -0x3eb00000    # -13.0f

    const/high16 v15, -0x3dc80000    # -46.0f

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v2, v8

    move v3, v13

    move v4, v14

    move v5, v15

    .line 523
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v18, -0x3dfc0000    # -33.0f

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    move/from16 v5, v18

    .line 524
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    move/from16 v2, v16

    move/from16 v3, v18

    move v4, v8

    move v5, v11

    .line 525
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v4, 0x41800000    # 16.0f

    const/high16 v5, -0x3db00000    # -52.0f

    move v2, v8

    move v3, v13

    .line 526
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    .line 527
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 528
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 529
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget v1, v6, Le/e/a/BikeRun$Track;->foreground:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 530
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 531
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41b00000    # 22.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 532
    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/BikeRunModel;->started:Z

    const/high16 v2, 0x43b40000    # 360.0f

    if-eqz v0, :cond_22a

    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/BikeRunModel;->over:Z

    if-eqz v0, :cond_25b

    .line 533
    :cond_22a
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x42000000    # 32.0f

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 534
    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/BikeRunModel;->over:Z

    if-eqz v0, :cond_23a

    const-string v0, "\u30b2\u30fc\u30e0\u30aa\u30fc\u30d0\u30fc"

    goto :goto_23c

    :cond_23a
    const-string v0, "\u969c\u5bb3\u7269\u3068\u7a74\u3092\u30b8\u30e3\u30f3\u30d7\u3067\u907f\u3051\u3088\u3046"

    :goto_23c
    div-float v3, v9, v10

    iget-object v4, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 535
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 536
    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/BikeRunModel;->over:Z

    if-eqz v0, :cond_251

    const-string v0, "\u30bf\u30c3\u30d7\u3067\u518d\u6311\u6226"

    goto :goto_253

    :cond_251
    const-string v0, "\u30bf\u30c3\u30d7\u3057\u3066\u30b9\u30bf\u30fc\u30c8"

    :goto_253
    const/high16 v4, 0x42280000    # 42.0f

    add-float/2addr v3, v4

    iget-object v4, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 538
    :cond_25b
    iget-boolean v0, v6, Le/e/a/BikeRun$Track;->paused:Z

    if-eqz v0, :cond_281

    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/BikeRunModel;->started:Z

    if-eqz v0, :cond_281

    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/BikeRunModel;->over:Z

    if-nez v0, :cond_281

    .line 539
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 540
    const-string v0, "Tap to resume"

    const-string v1, "\u70b9\u51fb\u7ee7\u7eed"

    const-string v3, "\u30bf\u30c3\u30d7\u3067\u518d\u958b"

    invoke-virtual {v6, v3, v0, v1}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    div-float v1, v9, v10

    iget-object v3, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 542
    :cond_281
    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/BikeRunModel;->over:Z

    if-eqz v0, :cond_30d

    .line 543
    iget-object v0, v6, Le/e/a/BikeRun$Track;->records:Le/e/a/BikeRunRecords;

    const-string v1, "1.3.1"

    iget-object v3, v6, Le/e/a/BikeRun$Track;->runId:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Le/e/a/BikeRunRecords;->rank(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 544
    iget-object v1, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41880000    # 17.0f

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 545
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "This run "

    const-string v4, "\u672c\u6b21 "

    const-string v5, "\u4eca\u56de "

    invoke-virtual {v6, v5, v3, v4}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    invoke-virtual {v3}, Le/e/a/BikeRunModel;->score()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " m  \u00b7  "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "Best "

    const-string v4, "\u6700\u4f73 "

    const-string v5, "\u30d9\u30b9\u30c8 "

    invoke-virtual {v6, v5, v3, v4}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v6, Le/e/a/BikeRun$Track;->best:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    div-float/2addr v9, v10

    const/high16 v3, 0x42980000    # 76.0f

    add-float/2addr v3, v9

    .line 546
    iget-object v4, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    if-lez v0, :cond_30d

    const/4 v5, 0x1

    if-ne v0, v5, :cond_2eb

    .line 547
    const-string v0, "Personal best!"

    const-string v1, "\u6700\u4f73\u6210\u7ee9\uff01"

    const-string v3, "\u81ea\u5df1\u30d9\u30b9\u30c8\uff01"

    invoke-virtual {v6, v3, v0, v1}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_305

    :cond_2eb
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Version rank "

    const-string v4, "\u7248\u672c\u6392\u540d "

    const-string v5, "\u540c\u30d0\u30fc\u30b8\u30e7\u30f3 "

    invoke-virtual {v6, v5, v3, v4}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_305
    const/high16 v1, 0x42cc0000    # 102.0f

    add-float/2addr v9, v1

    iget-object v1, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v0, v2, v9, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 549
    :cond_30d
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 550
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 551
    iget-boolean v0, v6, Le/e/a/BikeRun$Track;->active:Z

    if-eqz v0, :cond_334

    iget-boolean v0, v6, Le/e/a/BikeRun$Track;->paused:Z

    if-nez v0, :cond_334

    invoke-virtual/range {p0 .. p0}, Le/e/a/BikeRun$Track;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_334

    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/BikeRunModel;->started:Z

    if-eqz v0, :cond_334

    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/BikeRunModel;->over:Z

    if-nez v0, :cond_334

    .line 552
    invoke-virtual/range {p0 .. p0}, Le/e/a/BikeRun$Track;->postInvalidateOnAnimation()V

    :cond_334
    return-void

    :cond_335
    const/4 v5, 0x1

    .line 473
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Le/e/a/BikeRunModel$Hazard;

    .line 474
    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v1, v4, Le/e/a/BikeRunModel$Hazard;->x:F

    invoke-virtual {v0, v1}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v0

    add-float v3, v14, v0

    .line 475
    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v1, v4, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v2, v4, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float/2addr v1, v2

    invoke-virtual {v0, v1}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v0

    add-float v2, v14, v0

    .line 476
    iget-boolean v0, v4, Le/e/a/BikeRunModel$Hazard;->gap:Z

    if-eqz v0, :cond_393

    .line 477
    iget v1, v4, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v0, v4, Le/e/a/BikeRunModel$Hazard;->x:F

    add-float v18, v3, v11

    move/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v20, v1

    move-object/from16 v1, p1

    move v8, v2

    const/high16 v17, 0x40800000    # 4.0f

    move/from16 v2, v20

    move-object v13, v4

    move/from16 v4, v19

    const/16 v19, 0x1

    move/from16 v5, v18

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    .line 478
    iget v0, v13, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v1, v13, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float v2, v0, v1

    iget v0, v13, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v1, v13, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float v4, v0, v1

    add-float v5, v8, v11

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v3, v8

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    :goto_38b
    const/high16 v2, 0x40800000    # 4.0f

    const/4 v4, 0x1

    const/4 v8, 0x0

    const/high16 v13, 0x42f00000    # 120.0f

    goto/16 :goto_116

    :cond_393
    move v8, v2

    move-object v13, v4

    const/high16 v17, 0x40800000    # 4.0f

    const/16 v19, 0x1

    .line 481
    iget-object v0, v6, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 482
    iget-object v0, v6, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget v1, v13, Le/e/a/BikeRunModel$Hazard;->x:F

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 483
    iget-boolean v0, v13, Le/e/a/BikeRunModel$Hazard;->spikes:Z

    if-eqz v0, :cond_3f2

    .line 484
    iget v0, v13, Le/e/a/BikeRunModel$Hazard;->width:F

    const/high16 v1, 0x41a00000    # 20.0f

    div-float/2addr v0, v1

    float-to-int v0, v0

    const/4 v1, 0x2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/4 v1, 0x0

    :goto_3b5
    if-lt v1, v0, :cond_3b8

    goto :goto_414

    .line 487
    :cond_3b8
    iget v2, v13, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v3, v13, Le/e/a/BikeRunModel$Hazard;->width:F

    int-to-float v4, v1

    mul-float v3, v3, v4

    int-to-float v4, v0

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    .line 488
    iget-object v3, v6, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget v5, v13, Le/e/a/BikeRunModel$Hazard;->width:F

    div-float/2addr v5, v4

    div-float/2addr v5, v10

    add-float/2addr v5, v2

    iget-object v8, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v15, v13, Le/e/a/BikeRunModel$Hazard;->width:F

    div-float/2addr v15, v4

    div-float/2addr v15, v10

    add-float/2addr v15, v2

    invoke-virtual {v8, v15}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v8

    add-float/2addr v8, v14

    iget v15, v13, Le/e/a/BikeRunModel$Hazard;->height:F

    sub-float/2addr v8, v15

    invoke-virtual {v3, v5, v8}, Landroid/graphics/Path;->lineTo(FF)V

    .line 489
    iget-object v3, v6, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget v5, v13, Le/e/a/BikeRunModel$Hazard;->width:F

    div-float/2addr v5, v4

    add-float/2addr v5, v2

    iget-object v8, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v15, v13, Le/e/a/BikeRunModel$Hazard;->width:F

    div-float/2addr v15, v4

    add-float/2addr v2, v15

    invoke-virtual {v8, v2}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v2

    add-float/2addr v2, v14

    invoke-virtual {v3, v5, v2}, Landroid/graphics/Path;->lineTo(FF)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_3b5

    .line 493
    :cond_3f2
    iget-object v0, v6, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget v1, v13, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v2, v13, Le/e/a/BikeRunModel$Hazard;->height:F

    sub-float/2addr v3, v2

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 494
    iget-object v0, v6, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget v1, v13, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v2, v13, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float/2addr v1, v2

    iget v2, v13, Le/e/a/BikeRunModel$Hazard;->height:F

    sub-float v2, v8, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 495
    iget-object v0, v6, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget v1, v13, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v2, v13, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float/2addr v1, v2

    invoke-virtual {v0, v1, v8}, Landroid/graphics/Path;->lineTo(FF)V

    .line 497
    :goto_414
    iget-boolean v0, v13, Le/e/a/BikeRunModel$Hazard;->spikes:Z

    if-nez v0, :cond_41d

    .line 498
    iget-object v0, v6, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 500
    :cond_41d
    iget-object v0, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 501
    iget-object v0, v6, Le/e/a/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget-object v1, v6, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_38b

    :cond_42d
    const/high16 v17, 0x40800000    # 4.0f

    const/16 v19, 0x1

    .line 466
    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v1, v0, Le/e/a/BikeRunModel;->distance:F

    int-to-float v4, v3

    add-float/2addr v1, v4

    sub-float v1, v1, v17

    invoke-virtual {v0, v1}, Le/e/a/BikeRunModel;->terrainGapAt(F)Z

    move-result v0

    .line 467
    iget-object v1, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v2, v1, Le/e/a/BikeRunModel;->distance:F

    add-float/2addr v2, v4

    invoke-virtual {v1, v2}, Le/e/a/BikeRunModel;->terrainGapAt(F)Z

    move-result v1

    if-eq v0, v1, :cond_460

    .line 469
    iget-object v0, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    invoke-virtual {v0, v4}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v0

    add-float v8, v14, v0

    add-float v13, v8, v11

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v2, v4

    move v15, v3

    move v3, v8

    const/16 v8, 0x2d0

    move v5, v13

    .line 470
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    goto :goto_463

    :cond_460
    move v15, v3

    const/16 v8, 0x2d0

    :goto_463
    add-int/lit8 v3, v15, 0x4

    const/4 v4, 0x1

    const/16 v5, 0x2d0

    const/4 v8, 0x0

    const/high16 v13, 0x42f00000    # 120.0f

    goto/16 :goto_10a

    :cond_46d
    const/16 v19, 0x1

    .line 442
    iget-object v2, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v3, v2, Le/e/a/BikeRunModel;->distance:F

    int-to-float v4, v0

    add-float/2addr v3, v4

    invoke-virtual {v2, v3}, Le/e/a/BikeRunModel;->terrainGapAt(F)Z

    move-result v2

    .line 443
    iget-object v3, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-object v3, v3, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_481
    :goto_481
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_488

    goto :goto_4a3

    :cond_488
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/BikeRunModel$Hazard;

    .line 444
    iget-boolean v8, v5, Le/e/a/BikeRunModel$Hazard;->gap:Z

    if-eqz v8, :cond_481

    iget v8, v5, Le/e/a/BikeRunModel$Hazard;->x:F

    cmpl-float v8, v4, v8

    if-lez v8, :cond_481

    iget v8, v5, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v5, v5, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float/2addr v8, v5

    cmpg-float v5, v4, v8

    if-ltz v5, :cond_4a2

    goto :goto_481

    :cond_4a2
    const/4 v2, 0x1

    .line 448
    :goto_4a3
    iget-object v3, v6, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    invoke-virtual {v3, v4}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v3

    add-float/2addr v3, v14

    if-eqz v2, :cond_4ae

    const/4 v1, 0x0

    goto :goto_4bc

    :cond_4ae
    if-eqz v1, :cond_4b6

    .line 453
    iget-object v1, v6, Le/e/a/BikeRun$Track;->road:Landroid/graphics/Path;

    invoke-virtual {v1, v4, v3}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_4bb

    .line 455
    :cond_4b6
    iget-object v1, v6, Le/e/a/BikeRun$Track;->road:Landroid/graphics/Path;

    invoke-virtual {v1, v4, v3}, Landroid/graphics/Path;->moveTo(FF)V

    :goto_4bb
    const/4 v1, 0x1

    :goto_4bc
    add-int/lit8 v0, v0, 0x4

    const/4 v8, 0x0

    const/high16 v13, 0x42f00000    # 120.0f

    goto/16 :goto_ee
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7

    .line 557
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 v0, 0x1

    if-nez p1, :cond_44

    .line 558
    invoke-virtual {p0}, Le/e/a/BikeRun$Track;->performClick()Z

    .line 559
    iget-boolean p1, p0, Le/e/a/BikeRun$Track;->historyOpen:Z

    if-eqz p1, :cond_f

    return v0

    .line 560
    :cond_f
    iget-boolean p1, p0, Le/e/a/BikeRun$Track;->paused:Z

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    if-eqz p1, :cond_1e

    .line 561
    iput-boolean v3, p0, Le/e/a/BikeRun$Track;->paused:Z

    iput-wide v1, p0, Le/e/a/BikeRun$Track;->last:J

    invoke-virtual {p0}, Le/e/a/BikeRun$Track;->invalidate()V

    return v0

    .line 563
    :cond_1e
    iget-object p1, p0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean p1, p1, Le/e/a/BikeRunModel;->over:Z

    if-eqz p1, :cond_30

    iput-boolean v3, p0, Le/e/a/BikeRun$Track;->recorded:Z

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/BikeRun$Track;->runId:Ljava/lang/String;

    .line 564
    :cond_30
    iget-object p1, p0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    invoke-virtual {p1}, Le/e/a/BikeRunModel;->tap()V

    .line 565
    iget-wide v3, p0, Le/e/a/BikeRun$Track;->last:J

    cmp-long p1, v3, v1

    if-nez p1, :cond_41

    .line 566
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Le/e/a/BikeRun$Track;->last:J

    .line 568
    :cond_41
    invoke-virtual {p0}, Le/e/a/BikeRun$Track;->invalidate()V

    :cond_44
    return v0
.end method

.method public onWindowFocusChanged(Z)V
    .registers 4

    .line 579
    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    const-wide/16 v0, 0x0

    .line 580
    iput-wide v0, p0, Le/e/a/BikeRun$Track;->last:J

    if-eqz p1, :cond_c

    .line 582
    invoke-virtual {p0}, Le/e/a/BikeRun$Track;->invalidate()V

    :cond_c
    return-void
.end method

.method public performClick()Z
    .registers 2

    .line 574
    invoke-super {p0}, Landroid/view/View;->performClick()Z

    const/4 v0, 0x1

    return v0
.end method

.method recordsText(I)Ljava/lang/String;
    .registers 13

    const/4 v0, 0x2

    const/4 v1, 0x1

    if-ne p1, v0, :cond_b

    .line 304
    iget-object v0, p0, Le/e/a/BikeRun$Track;->records:Le/e/a/BikeRunRecords;

    invoke-virtual {v0}, Le/e/a/BikeRunRecords;->highScores()Ljava/util/List;

    move-result-object v0

    goto :goto_1a

    :cond_b
    iget-object v0, p0, Le/e/a/BikeRun$Track;->records:Le/e/a/BikeRunRecords;

    if-ne p1, v1, :cond_16

    const-string v2, "1.3.1"

    invoke-virtual {v0, v2}, Le/e/a/BikeRunRecords;->best(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    goto :goto_1a

    :cond_16
    invoke-virtual {v0}, Le/e/a/BikeRunRecords;->recent()Ljava/util/List;

    move-result-object v0

    .line 305
    :goto_1a
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2b

    const-string p1, "No records yet"

    const-string v0, "\u6682\u65e0\u8bb0\u5f55"

    const-string v1, "\u8a18\u9332\u306f\u307e\u3060\u3042\u308a\u307e\u305b\u3093"

    invoke-virtual {p0, v1, p1, v0}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 306
    :cond_2b
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 307
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyy/MM/dd HH:mm"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 309
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v4, 0x0

    :goto_40
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_4b

    .line 316
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 309
    :cond_4b
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/BikeRunRecords$Entry;

    add-int/2addr v4, v1

    .line 311
    iget-object v6, v5, Le/e/a/BikeRunRecords$Entry;->id:Ljava/lang/String;

    iget-object v7, p0, Le/e/a/BikeRun$Track;->runId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_61

    const-string v6, "\u25b6 "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_61
    if-ne p1, v1, :cond_6b

    .line 312
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ". "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    :cond_6b
    iget v6, v5, Le/e/a/BikeRunRecords$Entry;->score:I

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " m  \u00b7  v"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v5, Le/e/a/BikeRunRecords$Entry;->version:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v6, 0xa

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 314
    iget-wide v6, v5, Le/e/a/BikeRunRecords$Entry;->time:J

    const-wide/16 v8, 0x0

    cmp-long v10, v6, v8

    if-nez v10, :cond_92

    const-string v5, "Date unknown"

    const-string v6, "\u65e5\u671f\u672a\u77e5"

    const-string v7, "\u65e5\u6642\u4e0d\u660e"

    invoke-virtual {p0, v7, v5, v6}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_9d

    :cond_92
    new-instance v6, Ljava/util/Date;

    iget-wide v7, v5, Le/e/a/BikeRunRecords$Entry;->time:J

    invoke-direct {v6, v7, v8}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, v6}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    :goto_9d
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\n\n"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_40
.end method

.method recordsText(Z)Ljava/lang/String;
    .registers 2

    .line 301
    invoke-virtual {p0, p1}, Le/e/a/BikeRun$Track;->recordsText(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method saveResult()V
    .registers 9

    .line 292
    iget-object v0, p0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/BikeRunModel;->over:Z

    if-eqz v0, :cond_56

    iget-boolean v0, p0, Le/e/a/BikeRun$Track;->recorded:Z

    if-eqz v0, :cond_b

    goto :goto_56

    :cond_b
    const/4 v0, 0x1

    .line 293
    iput-boolean v0, p0, Le/e/a/BikeRun$Track;->recorded:Z

    .line 294
    iget-object v0, p0, Le/e/a/BikeRun$Track;->records:Le/e/a/BikeRunRecords;

    new-instance v7, Le/e/a/BikeRunRecords$Entry;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-object v1, p0, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    invoke-virtual {v1}, Le/e/a/BikeRunModel;->score()I

    move-result v5

    iget-object v6, p0, Le/e/a/BikeRun$Track;->runId:Ljava/lang/String;

    const-string v2, "1.3.1"

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Le/e/a/BikeRunRecords$Entry;-><init>(Ljava/lang/String;JILjava/lang/String;)V

    invoke-virtual {v0, v7}, Le/e/a/BikeRunRecords;->add(Le/e/a/BikeRunRecords$Entry;)Z

    .line 295
    iget-object v0, p0, Le/e/a/BikeRun$Track;->records:Le/e/a/BikeRunRecords;

    const-string v1, "1.3.1"

    invoke-virtual {v0, v1}, Le/e/a/BikeRunRecords;->best(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 296
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_37

    goto :goto_3f

    :cond_37
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/BikeRunRecords$Entry;

    iget v2, v0, Le/e/a/BikeRunRecords$Entry;->score:I

    :goto_3f
    iput v2, p0, Le/e/a/BikeRun$Track;->best:I

    .line 298
    iget-object v0, p0, Le/e/a/BikeRun$Track;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Le/e/a/BikeRun$Track;->records:Le/e/a/BikeRunRecords;

    invoke-virtual {v1}, Le/e/a/BikeRunRecords;->encode()Ljava/lang/String;

    move-result-object v1

    const-string v2, "bike_run_records_v1"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_56
    :goto_56
    return-void
.end method

.method scenery(Landroid/graphics/Canvas;F)V
    .registers 27

    move-object/from16 v10, p0

    move-object/from16 v11, p1

    .line 338
    iget-object v0, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 339
    iget-object v0, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x3fc00000    # 1.5f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 340
    iget-object v0, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget v1, v10, Le/e/a/BikeRun$Track;->foreground:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 341
    iget-object v0, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    const v0, 0x3f051eb8    # 0.52f

    mul-float v12, p2, v0

    .line 343
    iget-object v0, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const v6, 0x44124000    # 585.0f

    const/high16 v7, 0x43110000    # 145.0f

    const/high16 v13, 0x41e80000    # 29.0f

    invoke-virtual {v11, v6, v7, v13, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/4 v8, 0x0

    :goto_32
    const/16 v0, 0x8

    if-lt v8, v0, :cond_257

    .line 350
    iget-object v0, v10, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v0, v0, Le/e/a/BikeRunModel;->distance:F

    const v1, 0x3dcccccd    # 0.1f

    mul-float v0, v0, v1

    const/high16 v1, 0x44610000    # 900.0f

    rem-float v15, v0, v1

    const/4 v9, 0x0

    :goto_44
    const/4 v0, 0x4

    const/high16 v16, 0x41700000    # 15.0f

    const/high16 v17, 0x41c00000    # 24.0f

    const/high16 v6, 0x42280000    # 42.0f

    const/high16 v7, 0x41f00000    # 30.0f

    if-lt v9, v0, :cond_1fb

    .line 361
    iget-object v0, v10, Le/e/a/BikeRun$Track;->game:Le/e/a/BikeRunModel;

    iget v0, v0, Le/e/a/BikeRunModel;->distance:F

    const v1, 0x3e6147ae    # 0.22f

    mul-float v8, v0, v1

    const/high16 v0, 0x43340000    # 180.0f

    div-float v0, v8, v0

    float-to-int v9, v0

    add-int/lit8 v0, v9, -0x1

    move v15, v0

    :goto_60
    add-int/lit8 v0, v9, 0x6

    if-lt v15, v0, :cond_6c

    .line 403
    iget-object v0, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void

    :cond_6c
    const v0, 0x41c64e6d

    mul-int v0, v0, v15

    add-int/lit16 v0, v0, 0x3039

    ushr-int/lit8 v1, v0, 0x10

    xor-int/2addr v0, v1

    const v1, 0x7fffffff

    and-int/2addr v1, v0

    .line 366
    rem-int/lit8 v1, v1, 0x5

    mul-int/lit16 v2, v15, 0xb4

    int-to-float v2, v2

    sub-float/2addr v2, v8

    ushr-int/lit8 v3, v0, 0x8

    and-int/lit8 v3, v3, 0x1f

    int-to-float v3, v3

    add-float v18, v2, v3

    ushr-int/lit8 v0, v0, 0xd

    and-int/lit8 v0, v0, 0x3f

    add-int/lit8 v0, v0, 0x37

    int-to-float v5, v0

    if-nez v1, :cond_d5

    const/high16 v0, 0x40000000    # 2.0f

    div-float v0, v5, v0

    add-float v19, v18, v0

    sub-float v20, v12, v5

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v18

    move v3, v12

    move/from16 v4, v19

    move/from16 v21, v5

    move/from16 v5, v20

    .line 370
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    add-float v4, v18, v21

    move/from16 v2, v19

    move/from16 v3, v20

    move v5, v12

    .line 371
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const v0, 0x3ea3d70a    # 0.32f

    mul-float v5, v21, v0

    add-float v2, v18, v5

    const v0, 0x3f23d70a    # 0.64f

    mul-float v5, v21, v0

    sub-float v3, v12, v5

    const v0, 0x3ef5c28f    # 0.48f

    mul-float v5, v21, v0

    add-float v4, v18, v5

    const v0, 0x3f07ae14    # 0.53f

    mul-float v5, v21, v0

    sub-float v5, v12, v5

    move-object/from16 v0, p0

    .line 372
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    goto/16 :goto_1bc

    :cond_d5
    move/from16 v21, v5

    const/high16 v19, 0x42820000    # 65.0f

    const/high16 v20, 0x42700000    # 60.0f

    const/high16 v5, 0x41a00000    # 20.0f

    const/4 v0, 0x1

    if-ne v1, v0, :cond_116

    const/high16 v0, 0x41d00000    # 26.0f

    add-float v4, v18, v0

    sub-float v20, v12, v20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v2, v4

    move v3, v12

    move/from16 p2, v4

    const/high16 v14, 0x41a00000    # 20.0f

    move/from16 v5, v20

    .line 374
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v0, 0x42a60000    # 83.0f

    sub-float v0, v12, v0

    .line 375
    iget-object v1, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    move/from16 v2, p2

    invoke-virtual {v11, v2, v0, v13, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v0, 0x40c00000    # 6.0f

    add-float v0, v18, v0

    sub-float v1, v12, v19

    .line 376
    iget-object v2, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v11, v0, v1, v14, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v0, 0x42380000    # 46.0f

    add-float v0, v18, v0

    .line 377
    iget-object v2, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v11, v0, v1, v14, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_1bc

    :cond_116
    const/high16 v14, 0x41a00000    # 20.0f

    const/high16 v22, 0x41200000    # 10.0f

    const/4 v0, 0x2

    if-ne v1, v0, :cond_15b

    add-float v14, v18, v7

    sub-float v0, v12, v21

    sub-float v19, v0, v19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v18

    move v3, v12

    move v4, v14

    move/from16 v5, v19

    .line 379
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    add-float v4, v18, v20

    move v2, v14

    move/from16 v3, v19

    move v5, v12

    .line 380
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    add-float v2, v18, v22

    const/high16 v0, 0x420c0000    # 35.0f

    sub-float v5, v12, v0

    const/high16 v0, 0x42480000    # 50.0f

    add-float v4, v18, v0

    move-object/from16 v0, p0

    move v3, v5

    .line 381
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v0, 0x41900000    # 18.0f

    add-float v2, v18, v0

    const/high16 v0, 0x42960000    # 75.0f

    sub-float v5, v12, v0

    add-float v4, v18, v6

    move-object/from16 v0, p0

    move v3, v5

    .line 382
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    goto/16 :goto_1bc

    :cond_15b
    const/high16 v19, 0x42900000    # 72.0f

    const/high16 v20, 0x42200000    # 40.0f

    const/4 v5, 0x3

    if-ne v1, v5, :cond_1a4

    sub-float v14, v12, v21

    const/high16 v0, 0x42800000    # 64.0f

    add-float v3, v18, v0

    .line 385
    iget-object v5, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move/from16 v1, v18

    move v2, v14

    move v4, v12

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    const/high16 v0, 0x41000000    # 8.0f

    sub-float v2, v18, v0

    const/high16 v0, 0x42000000    # 32.0f

    add-float v21, v18, v0

    const/high16 v0, 0x42080000    # 34.0f

    sub-float v22, v14, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v3, v14

    move/from16 v4, v21

    move/from16 v5, v22

    .line 386
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    add-float v4, v18, v19

    move/from16 v2, v21

    move/from16 v3, v22

    move v5, v14

    .line 387
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    add-float v1, v18, v17

    sub-float v2, v12, v7

    add-float v3, v18, v20

    .line 388
    iget-object v5, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move v4, v12

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_1bc

    :cond_1a4
    sub-float v21, v12, v21

    sub-float v2, v21, v20

    add-float v3, v18, v19

    .line 390
    iget-object v4, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move/from16 v1, v18

    move-object/from16 v19, v4

    move v4, v12

    const/4 v13, 0x3

    move-object/from16 v5, v19

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    const/4 v5, 0x0

    :goto_1ba
    if-lt v5, v13, :cond_1c2

    :goto_1bc
    add-int/lit8 v15, v15, 0x1

    const/high16 v13, 0x41e80000    # 29.0f

    goto/16 :goto_60

    :cond_1c2
    const/4 v4, 0x0

    :goto_1c3
    if-lt v4, v13, :cond_1c8

    add-int/lit8 v5, v5, 0x1

    goto :goto_1ba

    :cond_1c8
    add-float v0, v18, v22

    mul-int/lit8 v1, v4, 0x12

    int-to-float v1, v1

    add-float v2, v0, v1

    const/high16 v0, 0x41d80000    # 27.0f

    sub-float v0, v21, v0

    mul-int/lit8 v3, v5, 0x1b

    int-to-float v3, v3

    add-float v19, v0, v3

    add-float v0, v18, v14

    add-float v20, v0, v1

    sub-float v0, v21, v16

    add-float v23, v0, v3

    .line 395
    iget-object v3, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move v1, v2

    move/from16 v2, v19

    move-object/from16 v19, v3

    move/from16 v3, v20

    move/from16 v20, v4

    move/from16 v4, v23

    move/from16 v23, v5

    move-object/from16 v5, v19

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v4, v20, 0x1

    move/from16 v5, v23

    goto :goto_1c3

    :cond_1fb
    mul-int/lit16 v0, v9, 0x10e

    int-to-float v0, v0

    sub-float v13, v0, v15

    .line 354
    rem-int/lit8 v0, v9, 0x2

    mul-int/lit8 v0, v0, 0x4b

    add-int/lit16 v0, v0, 0x9b

    int-to-float v14, v0

    add-float v4, v13, v6

    add-float v18, v14, v7

    const/4 v8, 0x0

    .line 355
    iget-object v7, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v6, 0x43340000    # 180.0f

    const/high16 v19, 0x43340000    # 180.0f

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v2, v13

    move v3, v14

    move/from16 v5, v18

    move-object/from16 v20, v7

    move/from16 v7, v19

    move/from16 v19, v9

    move-object/from16 v9, v20

    invoke-virtual/range {v0 .. v9}, Le/e/a/BikeRun$Track;->arc(Landroid/graphics/Canvas;FFFFFFZLandroid/graphics/Paint;)V

    add-float v2, v13, v17

    const/high16 v0, 0x41800000    # 16.0f

    sub-float v3, v14, v0

    const/high16 v0, 0x42a00000    # 80.0f

    add-float v4, v13, v0

    .line 356
    iget-object v9, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v7, 0x43340000    # 180.0f

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v9}, Le/e/a/BikeRun$Track;->arc(Landroid/graphics/Canvas;FFFFFFZLandroid/graphics/Paint;)V

    const/high16 v0, 0x42780000    # 62.0f

    add-float v2, v13, v0

    const/high16 v0, 0x42d40000    # 106.0f

    add-float v17, v13, v0

    .line 357
    iget-object v9, v10, Le/e/a/BikeRun$Track;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    move v3, v14

    move/from16 v4, v17

    invoke-virtual/range {v0 .. v9}, Le/e/a/BikeRun$Track;->arc(Landroid/graphics/Canvas;FFFFFFZLandroid/graphics/Paint;)V

    add-float v5, v14, v16

    move v2, v13

    move v3, v5

    .line 358
    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    add-int/lit8 v9, v19, 0x1

    const/high16 v13, 0x41e80000    # 29.0f

    goto/16 :goto_44

    :cond_257
    int-to-double v0, v8

    const-wide v2, 0x400921fb54442d18L    # Math.PI

    mul-double v0, v0, v2

    const-wide/high16 v2, 0x4010000000000000L    # 4.0

    div-double/2addr v0, v2

    .line 347
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float v2, v2

    const/high16 v3, 0x42140000    # 37.0f

    mul-float v2, v2, v3

    add-float/2addr v2, v6

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v4, v4

    mul-float v4, v4, v3

    add-float v3, v4, v7

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    double-to-float v4, v4

    const/high16 v5, 0x423c0000    # 47.0f

    mul-float v4, v4, v5

    add-float/2addr v4, v6

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    mul-float v0, v0, v5

    add-float v5, v0, v7

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v5}, Le/e/a/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    add-int/lit8 v8, v8, 0x1

    const/high16 v13, 0x41e80000    # 29.0f

    goto/16 :goto_32
.end method

.method showRecords()V
    .registers 6

    .line 319
    iget-boolean v0, p0, Le/e/a/BikeRun$Track;->historyOpen:Z

    if-nez v0, :cond_56

    iget-boolean v0, p0, Le/e/a/BikeRun$Track;->active:Z

    if-nez v0, :cond_9

    goto :goto_56

    .line 320
    :cond_9
    invoke-virtual {p0}, Le/e/a/BikeRun$Track;->saveResult()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/BikeRun$Track;->paused:Z

    iput-boolean v0, p0, Le/e/a/BikeRun$Track;->historyOpen:Z

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Le/e/a/BikeRun$Track;->last:J

    .line 321
    invoke-virtual {p0}, Le/e/a/BikeRun$Track;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 322
    new-instance v1, Le/e/a/BikeRun$RecordsPane;

    invoke-direct {v1, p0}, Le/e/a/BikeRun$RecordsPane;-><init>(Le/e/a/BikeRun$Track;)V

    .line 323
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "Run records"

    const-string v3, "\u9a91\u884c\u8bb0\u5f55"

    const-string v4, "\u8d70\u884c\u8a18\u9332"

    invoke-virtual {p0, v4, v0, v3}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 324
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Close"

    const-string v2, "\u5173\u95ed"

    const-string v3, "\u9589\u3058\u308b"

    invoke-virtual {p0, v3, v1, v2}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 325
    new-instance v1, Le/e/a/BikeRun$Track$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Le/e/a/BikeRun$Track$$ExternalSyntheticLambda0;-><init>(Le/e/a/BikeRun$Track;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 326
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    invoke-virtual {p0}, Le/e/a/BikeRun$Track;->invalidate()V

    :cond_56
    :goto_56
    return-void
.end method

.method text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .line 284
    iget-object v0, p0, Le/e/a/BikeRun$Track;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "app_lang"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 285
    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_63

    const-string v1, "en"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21

    goto :goto_63

    .line 286
    :cond_21
    const-string v1, "2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_62

    const-string v1, "zh"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_62

    const-string v3, "chinese"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3a

    goto :goto_62

    .line 287
    :cond_3a
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_61

    const-string v2, "ja"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_49

    goto :goto_61

    .line 288
    :cond_49
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 289
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_59

    move-object p1, p3

    goto :goto_61

    :cond_59
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_60

    goto :goto_61

    :cond_60
    move-object p1, p2

    :cond_61
    :goto_61
    return-object p1

    :cond_62
    :goto_62
    return-object p3

    :cond_63
    :goto_63
    return-object p2
.end method
