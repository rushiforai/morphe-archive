.class final Le/e/a/internal/standard150/BikeRun$Track;
.super Landroid/view/View;
.source "BikeRun.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/internal/standard150/BikeRun;
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

.field private final enemyBounds:Landroid/graphics/RectF;

.field private final enemySilhouette:Landroid/graphics/Path;

.field final foreground:I

.field final game:Le/e/a/internal/standard150/BikeRunModel;

.field historyOpen:Z

.field last:J

.field final obstacle:Landroid/graphics/Path;

.field final paint:Landroid/graphics/Paint;

.field pauseGesture:Z

.field paused:Z

.field final prefs:Landroid/content/SharedPreferences;

.field recorded:Z

.field final records:Le/e/a/internal/standard150/BikeRunRecords;

.field recordsPage:I

.field final road:Landroid/graphics/Path;

.field runId:Ljava/lang/String;

.field titlePressed:Z

.field private final weatherClip:Landroid/graphics/Path;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 8

    .line 266
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 247
    new-instance v0, Le/e/a/internal/standard150/BikeRunModel;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Le/e/a/internal/standard150/BikeRunModel;-><init>(J)V

    iput-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    .line 248
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    .line 249
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->road:Landroid/graphics/Path;

    .line 250
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    .line 256
    iput-boolean v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->active:Z

    .line 259
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->runId:Ljava/lang/String;

    .line 263
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->arcBounds:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->enemyBounds:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->enemySilhouette:Landroid/graphics/Path;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->weatherClip:Landroid/graphics/Path;

    const v0, 0x7f03005e

    const v2, -0xad335d

    .line 267
    # invokes: Le/e/a/internal/standard150/BikeRun;->color(Landroid/content/Context;II)I
    invoke-static {p1, v0, v2}, Le/e/a/internal/standard150/BikeRun;->access$0(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->accent:I

    const v0, 0x1010031

    const v2, -0xe6e4e0

    .line 268
    # invokes: Le/e/a/internal/standard150/BikeRun;->color(Landroid/content/Context;II)I
    invoke-static {p1, v0, v2}, Le/e/a/internal/standard150/BikeRun;->access$0(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->background:I

    const v0, 0x1010036

    const v2, -0x111112

    .line 269
    # invokes: Le/e/a/internal/standard150/BikeRun;->color(Landroid/content/Context;II)I
    invoke-static {p1, v0, v2}, Le/e/a/internal/standard150/BikeRun;->access$0(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->foreground:I

    .line 270
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Le/e/a/internal/standard150/BikeRun$Track;->prefs:Landroid/content/SharedPreferences;

    .line 271
    new-instance v0, Le/e/a/internal/standard150/BikeRunRecords;

    const-string v2, ""

    const-string v3, "bike_run_records_v1"

    invoke-interface {p1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Le/e/a/internal/standard150/BikeRunRecords;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->records:Le/e/a/internal/standard150/BikeRunRecords;

    .line 272
    const-string v2, "bike_run_records_migrated_130"

    const/4 v4, 0x0

    invoke-interface {p1, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_0

    .line 273
    const-string v5, "bike_run_best"

    invoke-interface {p1, v5, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    invoke-virtual {v0, v5}, Le/e/a/internal/standard150/BikeRunRecords;->migrateBeforeRelease(I)V

    .line 274
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-virtual {v0}, Le/e/a/internal/standard150/BikeRunRecords;->encode()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1, v3, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 275
    invoke-interface {p1, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 277
    :cond_0
    sget-object p1, Le/e/a/internal/standard150/BikeRunModel;->VERSION:Ljava/lang/String;

    invoke-virtual {v0, p1}, Le/e/a/internal/standard150/BikeRunRecords;->best(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    .line 278
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    iget v4, p1, Le/e/a/internal/standard150/BikeRunRecords$Entry;->score:I

    :goto_0
    iput v4, p0, Le/e/a/internal/standard150/BikeRun$Track;->best:I

    .line 279
    const-string/jumbo p1, "\u81ea\u8ee2\u8eca\u30e9\u30f3\u3002\u30bf\u30c3\u30d7\u30672\u6bb5\u30b8\u30e3\u30f3\u30d7\u3002\u969c\u5bb3\u7269\u3068\u7a74\u3092\u907f\u3051\u307e\u3059\u3002\u7d42\u4e86\u5f8c\u306f\u30bf\u30c3\u30d7\u3067\u518d\u6311\u6226\u3002"

    invoke-virtual {p0, p1}, Le/e/a/internal/standard150/BikeRun$Track;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 280
    invoke-virtual {p0, v1}, Le/e/a/internal/standard150/BikeRun$Track;->setFocusable(Z)V

    return-void
.end method

.method private static blinkRider(Landroid/graphics/Canvas;Le/e/a/internal/standard150/BikeRunModel;)V
    .registers 8

    iget v0, p1, Le/e/a/internal/standard150/BikeRunModel;->damageCooldown:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x96

    div-long/2addr v0, v2

    const-wide/16 v2, 0x1

    and-long/2addr v0, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    :cond_0
    return-void
.end method

.method private drawEnemySpecies(Landroid/graphics/Canvas;Landroid/graphics/Path;Le/e/a/internal/standard150/BikeRunModel$Hazard;)V
    .registers 23

    move-object/from16 v0, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p0

    iget-boolean v11, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->gap:Z

    if-nez v11, :cond_17

    iget-boolean v11, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->spikes:Z

    if-nez v11, :cond_17

    iget v11, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->species:I

    if-ltz v11, :cond_17

    iget-object v9, v8, Le/e/a/internal/standard150/BikeRun$Track;->enemyBounds:Landroid/graphics/RectF;

    const/4 v14, 0x1

    invoke-virtual {v6, v9, v14}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    iget v1, v9, Landroid/graphics/RectF;->left:F

    iget v2, v9, Landroid/graphics/RectF;->top:F

    iget v3, v9, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v1

    iget v4, v9, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v4, v2

    const/high16 v14, 0x41800000    # 16.0f

    cmpg-float v15, v3, v14

    if-gez v15, :cond_0

    goto/16 :goto_12

    :cond_0
    const/high16 v14, 0x41600000    # 14.0f

    cmpg-float v15, v4, v14

    if-gez v15, :cond_1

    goto/16 :goto_12

    :cond_1
    iget-object v5, v8, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v5}, Landroid/graphics/Paint;->getColor()I

    move-result v16

    invoke-virtual {v5}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v17

    invoke-virtual {v5}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v18

    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {v0, v6}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    div-int/lit8 v14, v11, 0xf

    int-to-float v12, v14

    const v13, 0x3c75c28f    # 0.015f

    mul-float/2addr v12, v13

    mul-float v13, v12, v3

    add-float/2addr v1, v13

    add-float/2addr v13, v13

    sub-float/2addr v3, v13

    mul-float v13, v12, v4

    add-float/2addr v2, v13

    sub-float/2addr v4, v13

    sget-object v15, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v15}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v15, 0x0

    if-ne v14, v15, :cond_2

    const v15, -0xf04365

    invoke-virtual {v5, v15}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_0

    :cond_2
    const/4 v15, 0x1

    if-ne v14, v15, :cond_3

    const v15, -0xa64128

    invoke-virtual {v5, v15}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_0

    :cond_3
    const/4 v15, 0x2

    if-ne v14, v15, :cond_4

    const v15, -0x2a4f9c

    invoke-virtual {v5, v15}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_0

    :cond_4
    const/4 v15, 0x3

    if-ne v14, v15, :cond_5

    const v15, -0x7a3991

    invoke-virtual {v5, v15}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_0

    :cond_5
    const/4 v15, 0x4

    if-ne v14, v15, :cond_6

    const v15, -0x332a35

    invoke-virtual {v5, v15}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_0

    :cond_6
    :goto_0
    iget-object v10, v8, Le/e/a/internal/standard150/BikeRun$Track;->enemySilhouette:Landroid/graphics/Path;

    invoke-virtual {v10}, Landroid/graphics/Path;->rewind()V

    rem-int/lit8 v11, v11, 0xf

    const/16 v15, 0x0

    if-ne v11, v15, :cond_7

    goto/16 :goto_1

    :cond_7
    const/16 v15, 0x1

    if-ne v11, v15, :cond_8

    goto/16 :goto_2

    :cond_8
    const/16 v15, 0x2

    if-ne v11, v15, :cond_9

    goto/16 :goto_3

    :cond_9
    const/16 v15, 0x3

    if-ne v11, v15, :cond_a

    goto/16 :goto_4

    :cond_a
    const/16 v15, 0x4

    if-ne v11, v15, :cond_b

    goto/16 :goto_5

    :cond_b
    const/16 v15, 0x5

    if-ne v11, v15, :cond_c

    goto/16 :goto_6

    :cond_c
    const/16 v15, 0x6

    if-ne v11, v15, :cond_d

    goto/16 :goto_7

    :cond_d
    const/16 v15, 0x7

    if-ne v11, v15, :cond_e

    goto/16 :goto_8

    :cond_e
    const/16 v15, 0x8

    if-ne v11, v15, :cond_f

    goto/16 :goto_9

    :cond_f
    const/16 v15, 0x9

    if-ne v11, v15, :cond_10

    goto/16 :goto_a

    :cond_10
    const/16 v15, 0xa

    if-ne v11, v15, :cond_11

    goto/16 :goto_b

    :cond_11
    const/16 v15, 0xb

    if-ne v11, v15, :cond_12

    goto/16 :goto_c

    :cond_12
    const/16 v15, 0xc

    if-ne v11, v15, :cond_13

    goto/16 :goto_d

    :cond_13
    const/16 v15, 0xd

    if-ne v11, v15, :cond_14

    goto/16 :goto_e

    :cond_14
    const/16 v15, 0xe

    if-ne v11, v15, :cond_15

    goto/16 :goto_f

    :cond_15
    goto/16 :goto_1

    :goto_1
    const v12, 0x3d23d70a    # 0.04f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f800000    # 1.0f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const v12, 0x3f000000    # 0.5f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3d23d70a    # 0.04f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f75c28f    # 0.96f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f800000    # 1.0f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v10}, Landroid/graphics/Path;->close()V

    goto/16 :goto_10

    :goto_2
    const v12, 0x3ca3d70a    # 0.02f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f0ccccd    # 0.55f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const v12, 0x3f000000    # 0.5f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ca3d70a    # 0.02f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f7ae148    # 0.98f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f0ccccd    # 0.55f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f000000    # 0.5f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v10}, Landroid/graphics/Path;->close()V

    goto/16 :goto_10

    :goto_3
    const v12, 0x3ca3d70a    # 0.02f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e6147ae    # 0.22f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const v12, 0x3f000000    # 0.5f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ca3d70a    # 0.02f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f7ae148    # 0.98f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e6147ae    # 0.22f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f6b851f    # 0.92f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3da3d70a    # 0.08f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v10}, Landroid/graphics/Path;->close()V

    goto/16 :goto_10

    :goto_4
    const v12, 0x3da3d70a    # 0.08f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const v12, 0x3da3d70a    # 0.08f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ea8f5c3    # 0.33f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3e800000    # 0.25f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ea8f5c3    # 0.33f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3e800000    # 0.25f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3dcccccd    # 0.1f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f3851ec    # 0.72f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3dcccccd    # 0.1f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f3851ec    # 0.72f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ea8f5c3    # 0.33f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f6b851f    # 0.92f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ea8f5c3    # 0.33f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f6b851f    # 0.92f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v10}, Landroid/graphics/Path;->close()V

    goto/16 :goto_10

    :goto_5
    const v12, 0x3ca3d70a    # 0.02f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const v12, 0x3ca3d70a    # 0.02f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ec28f5c    # 0.38f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3e3851ec    # 0.18f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ec28f5c    # 0.38f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3e3851ec    # 0.18f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3df5c28f    # 0.12f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3ee147ae    # 0.44f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3df5c28f    # 0.12f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3ee147ae    # 0.44f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ec28f5c    # 0.38f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f2b851f    # 0.67f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ec28f5c    # 0.38f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f2b851f    # 0.67f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3df5c28f    # 0.12f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f666666    # 0.9f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3df5c28f    # 0.12f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f7ae148    # 0.98f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v10}, Landroid/graphics/Path;->close()V

    goto/16 :goto_10

    :goto_6
    const v12, 0x3ca3d70a    # 0.02f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const v12, 0x3e428f5c    # 0.19f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f147ae1    # 0.58f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3eae147b    # 0.34f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f266666    # 0.65f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f000000    # 0.5f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3da3d70a    # 0.08f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f2b851f    # 0.67f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f266666    # 0.65f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f4f5c29    # 0.81f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f147ae1    # 0.58f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f7ae148    # 0.98f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v10}, Landroid/graphics/Path;->close()V

    goto/16 :goto_10

    :goto_7
    const v12, 0x3da3d70a    # 0.08f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const v12, 0x3d23d70a    # 0.04f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f000000    # 0.5f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3eb33333    # 0.35f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f000000    # 0.5f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3eb33333    # 0.35f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e0f5c29    # 0.14f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f266666    # 0.65f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e0f5c29    # 0.14f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f266666    # 0.65f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f000000    # 0.5f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f75c28f    # 0.96f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f000000    # 0.5f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f6b851f    # 0.92f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v10}, Landroid/graphics/Path;->close()V

    goto/16 :goto_10

    :goto_8
    const v12, 0x3ca3d70a    # 0.02f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const v12, 0x3ca3d70a    # 0.02f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e6147ae    # 0.22f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3eb33333    # 0.35f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e6147ae    # 0.22f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3eb33333    # 0.35f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3d4ccccd    # 0.05f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f2b851f    # 0.67f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3d4ccccd    # 0.05f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f2b851f    # 0.67f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e6147ae    # 0.22f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f7ae148    # 0.98f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e6147ae    # 0.22f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f7ae148    # 0.98f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v10}, Landroid/graphics/Path;->close()V

    goto/16 :goto_10

    :goto_9
    const v12, 0x3ca3d70a    # 0.02f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const v12, 0x3d4ccccd    # 0.05f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f2e147b    # 0.68f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3e8f5c29    # 0.28f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f000000    # 0.5f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3d8f5c29    # 0.07f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e9eb852    # 0.31f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3e947ae1    # 0.29f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3da3d70a    # 0.08f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f3851ec    # 0.72f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3da3d70a    # 0.08f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f6e147b    # 0.93f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e9eb852    # 0.31f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f3851ec    # 0.72f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f000000    # 0.5f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f733333    # 0.95f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f2e147b    # 0.68f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f7ae148    # 0.98f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v10}, Landroid/graphics/Path;->close()V

    goto/16 :goto_10

    :goto_a
    const v12, 0x3d4ccccd    # 0.05f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const v12, 0x3d4ccccd    # 0.05f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f19999a    # 0.6f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3e99999a    # 0.3f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f19999a    # 0.6f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3e99999a    # 0.3f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e9eb852    # 0.31f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f0f5c29    # 0.56f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e9eb852    # 0.31f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f0f5c29    # 0.56f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3da3d70a    # 0.08f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f68f5c3    # 0.91f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3da3d70a    # 0.08f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f68f5c3    # 0.91f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v10}, Landroid/graphics/Path;->close()V

    goto/16 :goto_10

    :goto_b
    const v12, 0x3ca3d70a    # 0.02f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const v12, 0x3ca3d70a    # 0.02f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f11eb85    # 0.57f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3e3851ec    # 0.18f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ebd70a4    # 0.37f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3eb33333    # 0.35f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e2e147b    # 0.17f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f266666    # 0.65f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e2e147b    # 0.17f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f51eb85    # 0.82f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ebd70a4    # 0.37f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f7ae148    # 0.98f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f11eb85    # 0.57f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f7ae148    # 0.98f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v10}, Landroid/graphics/Path;->close()V

    goto/16 :goto_10

    :goto_c
    const v12, 0x3ef5c28f    # 0.48f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ca3d70a    # 0.02f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const v12, 0x3f6b851f    # 0.92f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e75c28f    # 0.24f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f666666    # 0.9f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f3ae148    # 0.73f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f000000    # 0.5f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3dcccccd    # 0.1f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f3ae148    # 0.73f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3da3d70a    # 0.08f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e75c28f    # 0.24f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v10}, Landroid/graphics/Path;->close()V

    goto/16 :goto_10

    :goto_d
    const v12, 0x3d23d70a    # 0.04f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ef5c28f    # 0.48f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const v12, 0x3e3851ec    # 0.18f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e428f5c    # 0.19f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3eb851ec    # 0.36f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3d8f5c29    # 0.07f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f23d70a    # 0.64f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3d8f5c29    # 0.07f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f51eb85    # 0.82f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e428f5c    # 0.19f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f75c28f    # 0.96f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ef5c28f    # 0.48f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f28f5c3    # 0.66f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f0f5c29    # 0.56f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f28f5c3    # 0.66f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3eae147b    # 0.34f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3eae147b    # 0.34f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f0f5c29    # 0.56f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v10}, Landroid/graphics/Path;->close()V

    goto/16 :goto_10

    :goto_e
    const v12, 0x3f000000    # 0.5f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3ca3d70a    # 0.02f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const v12, 0x3f4ccccd    # 0.8f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e23d70a    # 0.16f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f7ae148    # 0.98f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f051eb8    # 0.52f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f4ccccd    # 0.8f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f59999a    # 0.85f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f000000    # 0.5f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3e4ccccd    # 0.2f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f59999a    # 0.85f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3ca3d70a    # 0.02f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f051eb8    # 0.52f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3e4ccccd    # 0.2f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e23d70a    # 0.16f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v10}, Landroid/graphics/Path;->close()V

    goto/16 :goto_10

    :goto_f
    const v12, 0x3d75c28f    # 0.06f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    const v12, 0x3d75c28f    # 0.06f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f451eb8    # 0.77f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3e851eb8    # 0.26f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f451eb8    # 0.77f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3e851eb8    # 0.26f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3efae148    # 0.49f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3e0f5c29    # 0.14f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3efae148    # 0.49f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3e0f5c29    # 0.14f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e4ccccd    # 0.2f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3edc28f6    # 0.43f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e4ccccd    # 0.2f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3edc28f6    # 0.43f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3d23d70a    # 0.04f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f2147ae    # 0.63f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3d23d70a    # 0.04f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f2147ae    # 0.63f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e4ccccd    # 0.2f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f6147ae    # 0.88f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3e4ccccd    # 0.2f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f6147ae    # 0.88f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3efae148    # 0.49f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f3ae148    # 0.73f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3efae148    # 0.49f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f3ae148    # 0.73f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f451eb8    # 0.77f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f70a3d7    # 0.94f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f451eb8    # 0.77f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const v12, 0x3f70a3d7    # 0.94f

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    invoke-virtual {v10, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v10}, Landroid/graphics/Path;->close()V

    goto/16 :goto_10

    :goto_10
    invoke-virtual {v0, v10, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget v11, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->species:I

    div-int/lit8 v11, v11, 0xf

    const/4 v14, 0x0

    :goto_11
    if-ge v14, v11, :cond_16

    add-int/lit8 v15, v14, 0x1

    int-to-float v12, v15

    const/high16 v13, 0x40c00000    # 6.0f

    div-float/2addr v12, v13

    mul-float/2addr v12, v3

    add-float/2addr v12, v1

    const v13, 0x3f2e147b    # 0.68f

    mul-float/2addr v13, v4

    add-float/2addr v13, v2

    iget v15, v8, Le/e/a/internal/standard150/BikeRun$Track;->background:I

    invoke-virtual {v5, v15}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v15, 0x40000000    # 2.0f

    invoke-virtual {v0, v12, v13, v15, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    add-int/lit8 v14, v14, 0x1

    goto :goto_11

    :cond_16
    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    move/from16 v12, v16

    invoke-virtual {v5, v12}, Landroid/graphics/Paint;->setColor(I)V

    move-object/from16 v12, v17

    invoke-virtual {v5, v12}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    move/from16 v12, v18

    invoke-virtual {v5, v12}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    :cond_17
    :goto_12
    return-void
.end method

.method private drawFlyer(Landroid/graphics/Canvas;F)V
    .registers 14

    iget-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget v1, v0, Le/e/a/internal/standard150/BikeRunModel;->flyerDistance:F

    iget v2, v0, Le/e/a/internal/standard150/BikeRunModel;->distance:F

    sub-float/2addr v1, v2

    const/high16 v3, 0x42f00000    # 120.0f

    add-float/2addr v1, v3

    const/high16 v3, -0x3e100000    # -30.0f

    cmpg-float v4, v1, v3

    if-ltz v4, :cond_0

    const/high16 v3, 0x44380000    # 736.0f

    cmpl-float v4, v1, v3

    if-gtz v4, :cond_0

    invoke-virtual {v0, v1}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v2

    add-float/2addr v2, p2

    const/high16 v3, 0x42c80000    # 100.0f

    sub-float/2addr v2, v3

    iget-object v5, p0, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v5}, Landroid/graphics/Paint;->getColor()I

    move-result v6

    invoke-virtual {v5}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v7

    invoke-virtual {v5}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v8

    iget v9, p0, Le/e/a/internal/standard150/BikeRun$Track;->accent:I

    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v9, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v9, 0x40400000    # 3.0f

    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/high16 v3, 0x41200000    # 10.0f

    invoke-virtual {p1, v1, v2, v3, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    move v9, v1

    move v10, v2

    const/high16 v3, 0x41000000    # 8.0f

    sub-float/2addr v1, v3

    const/high16 v4, 0x41c80000    # 25.0f

    sub-float v3, v9, v4

    const/high16 v4, 0x41000000    # 8.0f

    sub-float v4, v10, v4

    move-object v0, p1

    move-object v5, v5

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v1, v9

    const/high16 v3, 0x41000000    # 8.0f

    add-float/2addr v1, v3

    move v2, v10

    const/high16 v4, 0x41c80000    # 25.0f

    add-float v3, v9, v4

    const/high16 v4, 0x41000000    # 8.0f

    sub-float v4, v10, v4

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v5, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v5, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    :cond_0
    return-void
.end method

.method private static drawLives(Landroid/graphics/Canvas;Landroid/graphics/Paint;Le/e/a/internal/standard150/BikeRunModel;)V
    .registers 12

    iget v8, p2, Le/e/a/internal/standard150/BikeRunModel;->lives:I

    sget-object v7, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v7, 0x41000000    # 8.0f

    invoke-virtual {p1, v7}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    move-object v0, p0

    const/high16 v2, -0x3d200000    # -112.0f

    move v4, v2

    move-object v5, p1

    const/16 v7, 0x50

    invoke-virtual {p1, v7}, Landroid/graphics/Paint;->setAlpha(I)V

    const v1, -0x3df40000    # -35.0f

    const/high16 v3, -0x3e900000    # -15.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v1, -0x3ee00000    # -10.0f

    const/high16 v3, 0x41200000    # 10.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x41700000    # 15.0f

    const v3, 0x420c0000    # 35.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/16 v7, 0xff

    invoke-virtual {p1, v7}, Landroid/graphics/Paint;->setAlpha(I)V

    if-lez v8, :cond_0

    const v1, -0x3df40000    # -35.0f

    const/high16 v3, -0x3e900000    # -15.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/4 v7, 0x1

    if-le v8, v7, :cond_0

    const/high16 v1, -0x3ee00000    # -10.0f

    const/high16 v3, 0x41200000    # 10.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/4 v7, 0x2

    if-le v8, v7, :cond_0

    const/high16 v1, 0x41700000    # 15.0f

    const v3, 0x420c0000    # 35.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_0
    const/high16 v7, 0x40800000    # 4.0f

    invoke-virtual {p1, v7}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method

.method private static drawRecovery(Landroid/graphics/Canvas;Le/e/a/internal/standard150/BikeRun$Track;F)V
    .registers 14

    iget-object v0, p1, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget v1, v0, Le/e/a/internal/standard150/BikeRunModel;->pickupDistance:F

    iget v2, v0, Le/e/a/internal/standard150/BikeRunModel;->distance:F

    sub-float/2addr v1, v2

    const/high16 v3, 0x42f00000    # 120.0f

    add-float/2addr v1, v3

    const/high16 v3, -0x3e800000    # -16.0f

    cmpg-float v4, v1, v3

    if-ltz v4, :cond_0

    const/high16 v3, 0x44380000    # 736.0f

    cmpl-float v4, v1, v3

    if-gtz v4, :cond_0

    invoke-virtual {v0, v1}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v2

    add-float/2addr v2, p2

    const/high16 v3, 0x42700000    # 60.0f

    sub-float/2addr v2, v3

    iget-object v5, p1, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v5}, Landroid/graphics/Paint;->getColor()I

    move-result v6

    invoke-virtual {v5}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v7

    invoke-virtual {v5}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v8

    const v9, -0x49c4

    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v9, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v3, 0x41300000    # 11.0f

    invoke-virtual {p0, v1, v2, v3, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const v9, -0xe9c5cf

    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v9, 0x40a00000    # 5.0f

    sub-float v10, v1, v9

    move v3, v1

    add-float/2addr v3, v9

    move-object v0, p0

    move v1, v10

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v1, v3

    sub-float/2addr v1, v9

    move v3, v1

    sub-float/2addr v2, v9

    move v4, v2

    add-float/2addr v4, v9

    add-float/2addr v4, v9

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v5, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v5, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    :cond_0
    return-void
.end method

.method private drawTerrainWithoutHoles(Landroid/graphics/Canvas;Landroid/graphics/Path;Landroid/graphics/Paint;Le/e/a/internal/standard150/BikeRunModel;)V
    .registers 23

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    const v12, -0x3a800000    # -4096.0f

    const v13, 0x45800000    # 4096.0f

    iget-object v5, v3, Le/e/a/internal/standard150/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;

    iget-boolean v8, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->gap:Z

    if-eqz v8, :cond_0

    iget v9, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    iget v10, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    add-float v11, v9, v10

    invoke-virtual {v0, v9, v12, v11, v13}, Landroid/graphics/Canvas;->clipOutRect(FFFF)Z

    goto :goto_0

    :cond_1
    iget v4, v3, Le/e/a/internal/standard150/BikeRunModel;->distance:F

    const/4 v15, 0x0

    const/4 v14, 0x0

    const/16 v17, 0x0

    :goto_1
    const/high16 v10, 0x44340000    # 720.0f

    cmpl-float v8, v15, v10

    if-lez v8, :cond_4

    add-float v9, v4, v15

    invoke-virtual {v3, v9}, Le/e/a/internal/standard150/BikeRunModel;->terrainGapAt(F)Z

    move-result v8

    if-eqz v8, :cond_2

    if-nez v14, :cond_3

    const/high16 v10, 0x41000000    # 8.0f

    sub-float v17, v15, v10

    const/4 v11, 0x0

    move/from16 v9, v17

    invoke-static {v9, v11}, Ljava/lang/Math;->max(FF)F

    move-result v17

    const/4 v14, 0x1

    goto :goto_2

    :cond_2
    if-eqz v14, :cond_3

    move/from16 v9, v17

    move v11, v15

    invoke-virtual {v0, v9, v12, v11, v13}, Landroid/graphics/Canvas;->clipOutRect(FFFF)Z

    const/4 v14, 0x0

    :cond_3
    :goto_2
    const/high16 v10, 0x41000000    # 8.0f

    add-float/2addr v15, v10

    goto :goto_1

    :cond_4
    if-eqz v14, :cond_5

    move/from16 v9, v17

    const/high16 v11, 0x44340000    # 720.0f

    invoke-virtual {v0, v9, v12, v11, v13}, Landroid/graphics/Canvas;->clipOutRect(FFFF)Z

    :cond_5
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method private drawWeather(Landroid/graphics/Canvas;F)V
    .registers 16

    iget-object v11, p0, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget v10, v11, Le/e/a/internal/standard150/BikeRunModel;->distance:F

    const v4, 0x463b8000    # 12000.0f

    add-float/2addr v10, v4

    const v4, 0x46cb2000    # 26000.0f

    rem-float v10, v10, v4

    const v4, 0x460ca000    # 9000.0f

    cmpl-float v4, v10, v4

    if-lez v4, :cond_0

    goto :goto_0

    :cond_0
    return-void

    :goto_0
    iget v9, v11, Le/e/a/internal/standard150/BikeRunModel;->distance:F

    const v4, 0x463b8000    # 12000.0f

    add-float/2addr v9, v4

    const v4, 0x46cb2000    # 26000.0f

    div-float/2addr v9, v4

    float-to-int v9, v9

    rem-int/lit8 v9, v9, 0x2

    if-nez v9, :cond_1

    const/4 v9, 0x2

    :cond_1
    iget-object v6, p0, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v6}, Landroid/graphics/Paint;->getColor()I

    move-result v8

    const v4, -0x5c4137

    invoke-virtual {v6, v4}, Landroid/graphics/Paint;->setColor(I)V

    const v4, 0x44960000    # 1200.0f

    div-float v3, v10, v4

    const v2, 0x460ca000    # 9000.0f

    sub-float/2addr v2, v10

    div-float/2addr v2, v4

    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v3

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v3

    const/high16 v2, 0x42a00000    # 80.0f

    mul-float/2addr v3, v2

    float-to-int v3, v3

    invoke-virtual {v6, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v12, p0, Le/e/a/internal/standard150/BikeRun$Track;->weatherClip:Landroid/graphics/Path;

    invoke-virtual {v12}, Landroid/graphics/Path;->rewind()V

    const/4 v0, 0x0

    const/high16 v1, 0x45fa0000    # 8000.0f

    invoke-virtual {v12, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V

    const/4 v7, 0x0

    :goto_1
    const/16 v4, 0x30

    if-le v7, v4, :cond_2

    goto :goto_2

    :cond_2
    mul-int/lit8 v4, v7, 0xf

    int-to-float v0, v4

    invoke-virtual {v11, v0}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v1

    add-float/2addr v1, p2

    invoke-virtual {v12, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :goto_2
    const/high16 v0, 0x44340000    # 720.0f

    const/high16 v1, 0x45fa0000    # 8000.0f

    invoke-virtual {v12, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v12}, Landroid/graphics/Path;->close()V

    invoke-virtual {p1, v12}, Landroid/graphics/Canvas;->clipOutPath(Landroid/graphics/Path;)Z

    const/4 v7, 0x0

    :goto_3
    const/16 v4, 0x30

    if-ge v7, v4, :cond_5

    const/16 v4, 0x4f

    mul-int v1, v7, v4

    int-to-float v1, v1

    iget v4, v11, Le/e/a/internal/standard150/BikeRunModel;->distance:F

    const/high16 v3, 0x41000000    # 8.0f

    div-float/2addr v4, v3

    sub-float/2addr v1, v4

    const/high16 v3, 0x44340000    # 720.0f

    rem-float/2addr v1, v3

    const/4 v4, 0x0

    cmpg-float v4, v1, v4

    if-gez v4, :cond_3

    add-float/2addr v1, v3

    :cond_3
    const/16 v4, 0x67

    mul-int v2, v7, v4

    int-to-float v2, v2

    iget v4, v11, Le/e/a/internal/standard150/BikeRunModel;->distance:F

    const/high16 v3, 0x41800000    # 16.0f

    div-float/2addr v4, v3

    add-float/2addr v2, v4

    const v3, 0x44b40000    # 1440.0f

    rem-float/2addr v2, v3

    const/4 v4, 0x2

    if-ne v9, v4, :cond_4

    move v3, v1

    const/high16 v4, 0x40800000    # 4.0f

    add-float v4, v2, v4

    goto :goto_4

    :cond_4
    const/high16 v4, 0x40c00000    # 6.0f

    sub-float v3, v1, v4

    const/high16 v4, 0x41500000    # 13.0f

    add-float v4, v2, v4

    :goto_4
    move-object v0, p1

    move-object v5, v6

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    :cond_5
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method

.method private handleTwoFingerPause(Landroid/view/MotionEvent;)Z
    .registers 5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_2

    iget-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->historyOpen:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-boolean v1, v0, Le/e/a/internal/standard150/BikeRunModel;->started:Z

    if-eqz v1, :cond_2

    iget-boolean v1, v0, Le/e/a/internal/standard150/BikeRunModel;->over:Z

    if-nez v1, :cond_2

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->paused:Z

    iput-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->pauseGesture:Z

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return v0

    :cond_0
    iget-boolean v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->pauseGesture:Z

    if-eqz v1, :cond_2

    const/4 v2, 0x1

    if-eq v0, v2, :cond_1

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->pauseGesture:Z

    const/4 v0, 0x1

    return v0

    :cond_2
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method arc(Landroid/graphics/Canvas;FFFFFFZLandroid/graphics/Paint;)V
    .registers 18

    move-object v0, p0

    .line 329
    iget-object v1, v0, Le/e/a/internal/standard150/BikeRun$Track;->arcBounds:Landroid/graphics/RectF;

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual {v1, p2, p3, p4, p5}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v3, v0, Le/e/a/internal/standard150/BikeRun$Track;->arcBounds:Landroid/graphics/RectF;

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
    iput-boolean p1, p0, Le/e/a/internal/standard150/BikeRun$Track;->historyOpen:Z

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->last:J

    invoke-virtual {p0}, Le/e/a/internal/standard150/BikeRun$Track;->invalidate()V

    return-void
.end method

.method line(Landroid/graphics/Canvas;FFFF)V
    .registers 12

    .line 333
    iget-object v5, p0, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

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
    iput-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->active:Z

    .line 588
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 23

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-boolean v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->active:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-boolean v2, v6, Le/e/a/internal/standard150/BikeRun$Track;->paused:Z

    const-wide/16 v3, 0x0

    if-nez v2, :cond_1

    invoke-virtual/range {p0 .. p0}, Le/e/a/internal/standard150/BikeRun$Track;->hasWindowFocus()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-wide v8, v6, Le/e/a/internal/standard150/BikeRun$Track;->last:J

    cmp-long v2, v8, v3

    if-eqz v2, :cond_1

    iget-object v2, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    sub-long v8, v0, v8

    long-to-float v5, v8

    const/high16 v8, 0x447a0000    # 1000.0f

    div-float/2addr v5, v8

    goto/32 :goto_17

    :cond_1
    :goto_0
    iget-boolean v2, v6, Le/e/a/internal/standard150/BikeRun$Track;->paused:Z

    if-nez v2, :cond_2

    invoke-virtual/range {p0 .. p0}, Le/e/a/internal/standard150/BikeRun$Track;->hasWindowFocus()Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    move-wide v0, v3

    :goto_1
    iput-wide v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->last:J

    invoke-virtual/range {p0 .. p0}, Le/e/a/internal/standard150/BikeRun$Track;->saveResult()V

    iget v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->background:I

    invoke-virtual {v7, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    invoke-virtual/range {p0 .. p0}, Le/e/a/internal/standard150/BikeRun$Track;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x44340000    # 720.0f

    div-float/2addr v0, v1

    const/4 v8, 0x0

    cmpg-float v1, v0, v8

    if-gtz v1, :cond_3

    return-void

    :cond_3
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {v7, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    invoke-virtual/range {p0 .. p0}, Le/e/a/internal/standard150/BikeRun$Track;->getHeight()I

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

    invoke-static {v11, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iget-object v2, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget v3, v6, Le/e/a/internal/standard150/BikeRun$Track;->foreground:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41c80000    # 25.0f

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    invoke-static {}, Le/e/a/internal/standard150/BikeRunModel;->title()Ljava/lang/String;

    move-result-object v2

    const/high16 v3, 0x42300000    # 44.0f

    iget-object v4, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v5, 0x41c00000    # 24.0f

    invoke-virtual {v7, v2, v5, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v2, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\u8ddd\u96e2 "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    invoke-virtual {v3}, Le/e/a/internal/standard150/BikeRunModel;->score()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " m   \u30d9\u30b9\u30c8 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v6, Le/e/a/internal/standard150/BikeRun$Track;->best:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, " m"

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/high16 v3, 0x429c0000    # 78.0f

    iget-object v4, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v2, v5, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/32 :goto_18

    :goto_2
    iget-object v2, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    const/high16 v13, 0x42f00000    # 120.0f

    invoke-virtual {v2, v13}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v2

    add-float/2addr v2, v0

    iget-object v3, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget v3, v3, Le/e/a/internal/standard150/BikeRunModel;->y:F

    add-float/2addr v2, v3

    const/high16 v3, 0x432a0000    # 170.0f

    sub-float/2addr v3, v2

    invoke-static {v8, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    add-float v14, v0, v2

    invoke-direct {v6, v7, v14}, Le/e/a/internal/standard150/BikeRun$Track;->drawFlyer(Landroid/graphics/Canvas;F)V

    invoke-direct {v6, v7, v14}, Le/e/a/internal/standard150/BikeRun$Track;->drawWeather(Landroid/graphics/Canvas;F)V

    invoke-static {v7, v6, v14}, Le/e/a/internal/standard150/BikeRun$Track;->drawRecovery(Landroid/graphics/Canvas;Le/e/a/internal/standard150/BikeRun$Track;F)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget v2, v6, Le/e/a/internal/standard150/BikeRun$Track;->accent:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->road:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_3
    const/16 v5, 0x2d0

    const/4 v4, 0x1

    if-le v0, v5, :cond_14

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->road:Landroid/graphics/Path;

    iget-object v1, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v0, 0x4

    const/4 v3, 0x4

    :goto_4
    const/high16 v2, 0x40800000    # 4.0f

    if-le v3, v5, :cond_12

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-object v0, v0, Le/e/a/internal/standard150/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_5
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_c

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget v1, v6, Le/e/a/internal/standard150/BikeRun$Track;->accent:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    invoke-virtual {v0, v13}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v0

    add-float/2addr v14, v0

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget v0, v0, Le/e/a/internal/standard150/BikeRunModel;->y:F

    add-float/2addr v14, v0

    invoke-virtual {v7, v13, v14}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget-object v1, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    invoke-static {v7, v0, v1}, Le/e/a/internal/standard150/BikeRun$Track;->drawLives(Landroid/graphics/Canvas;Landroid/graphics/Paint;Le/e/a/internal/standard150/BikeRunModel;)V

    invoke-static {v7, v1}, Le/e/a/internal/standard150/BikeRun$Track;->blinkRider(Landroid/graphics/Canvas;Le/e/a/internal/standard150/BikeRunModel;)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget v0, v0, Le/e/a/internal/standard150/BikeRunModel;->y:F

    cmpl-float v0, v0, v8

    if-nez v0, :cond_4

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    invoke-virtual {v0, v13}, Le/e/a/internal/standard150/BikeRunModel;->slopeAt(F)F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->atan(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v0

    double-to-float v8, v0

    :cond_4
    goto/32 :goto_15

    :goto_6
    const v0, 0x3f266666    # 0.65f

    invoke-virtual {v7, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v8, -0x3e400000    # -24.0f

    const/high16 v11, -0x3e780000    # -17.0f

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v7, v8, v11, v1, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

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

    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v16, 0x40a00000    # 5.0f

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    move v5, v11

    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    move/from16 v2, v16

    move v3, v11

    move v4, v8

    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v8, 0x41980000    # 19.0f

    const/high16 v18, -0x3dcc0000    # -45.0f

    move v4, v8

    move/from16 v5, v18

    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    move v2, v8

    move/from16 v3, v18

    move v4, v13

    move v5, v11

    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    move v2, v14

    move v3, v15

    move v4, v8

    move/from16 v5, v18

    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v13, 0x41700000    # 15.0f

    const/high16 v14, -0x3dac0000    # -53.0f

    move v2, v8

    move/from16 v3, v18

    move v4, v13

    move v5, v14

    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v4, 0x41d80000    # 27.0f

    move v2, v13

    move v3, v14

    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v0, 0x41100000    # 9.0f

    iget-object v1, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

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

    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v18, -0x3dfc0000    # -33.0f

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    move/from16 v5, v18

    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    move/from16 v2, v16

    move/from16 v3, v18

    move v4, v8

    move v5, v11

    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    const/high16 v4, 0x41800000    # 16.0f

    const/high16 v5, -0x3db00000    # -52.0f

    move v2, v8

    move v3, v13

    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget v1, v6, Le/e/a/internal/standard150/BikeRun$Track;->foreground:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41b00000    # 22.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/internal/standard150/BikeRunModel;->started:Z

    const/high16 v2, 0x43b40000    # 360.0f

    if-eqz v0, :cond_5

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/internal/standard150/BikeRunModel;->over:Z

    if-eqz v0, :cond_8

    :cond_5
    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x42000000    # 32.0f

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/internal/standard150/BikeRunModel;->over:Z

    if-eqz v0, :cond_6

    const-string v0, "\u30b2\u30fc\u30e0\u30aa\u30fc\u30d0\u30fc"

    goto :goto_7

    :cond_6
    const-string/jumbo v0, "\u969c\u5bb3\u7269\u3068\u7a74\u3092\u30b8\u30e3\u30f3\u30d7\u3067\u907f\u3051\u3088\u3046"

    :goto_7
    div-float v3, v9, v10

    iget-object v4, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/internal/standard150/BikeRunModel;->over:Z

    if-eqz v0, :cond_7

    const-string v0, "\u30bf\u30c3\u30d7\u3067\u518d\u6311\u6226"

    goto :goto_8

    :cond_7
    const-string v0, "\u30bf\u30c3\u30d7\u3057\u3066\u30b9\u30bf\u30fc\u30c8"

    :goto_8
    const/high16 v4, 0x42280000    # 42.0f

    add-float/2addr v3, v4

    iget-object v4, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :cond_8
    iget-boolean v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paused:Z

    if-eqz v0, :cond_9

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/internal/standard150/BikeRunModel;->started:Z

    if-eqz v0, :cond_9

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/internal/standard150/BikeRunModel;->over:Z

    if-nez v0, :cond_9

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    const-string v0, "PAUSE"

    const-string v1, "PAUSE"

    const-string v3, "PAUSE"

    invoke-virtual {v6, v3, v0, v1}, Le/e/a/internal/standard150/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    div-float v1, v9, v10

    iget-object v3, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :cond_9
    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/internal/standard150/BikeRunModel;->over:Z

    if-eqz v0, :cond_a

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->records:Le/e/a/internal/standard150/BikeRunRecords;

    sget-object v1, Le/e/a/internal/standard150/BikeRunModel;->VERSION:Ljava/lang/String;

    iget-object v3, v6, Le/e/a/internal/standard150/BikeRun$Track;->runId:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Le/e/a/internal/standard150/BikeRunRecords;->rank(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iget-object v1, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41880000    # 17.0f

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "This run "

    const-string/jumbo v4, "\u672c\u6b21 "

    const-string v5, "\u4eca\u56de "

    invoke-virtual {v6, v5, v3, v4}, Le/e/a/internal/standard150/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    invoke-virtual {v3}, Le/e/a/internal/standard150/BikeRunModel;->score()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " m  \u00b7  "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "Best "

    const-string/jumbo v4, "\u6700\u4f73 "

    const-string v5, "\u30d9\u30b9\u30c8 "

    invoke-virtual {v6, v5, v3, v4}, Le/e/a/internal/standard150/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v6, Le/e/a/internal/standard150/BikeRun$Track;->best:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    div-float/2addr v9, v10

    const/high16 v3, 0x42980000    # 76.0f

    add-float/2addr v3, v9

    iget-object v4, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    if-lez v0, :cond_a

    const/4 v5, 0x1

    if-ne v0, v5, :cond_a

    const-string v0, "Personal best!"

    const-string/jumbo v1, "\u6700\u4f73\u6210\u7ee9\uff01"

    const-string/jumbo v3, "\u81ea\u5df1\u30d9\u30b9\u30c8\uff01"

    invoke-virtual {v6, v3, v0, v1}, Le/e/a/internal/standard150/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_9

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Version rank "

    const-string/jumbo v4, "\u7248\u672c\u6392\u540d "

    const-string v5, "\u540c\u30d0\u30fc\u30b8\u30e7\u30f3 "

    invoke-virtual {v6, v5, v3, v4}, Le/e/a/internal/standard150/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_9
    const/high16 v1, 0x42cc0000    # 102.0f

    add-float/2addr v9, v1

    iget-object v1, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v0, v2, v9, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :cond_a
    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    iget-boolean v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->active:Z

    if-eqz v0, :cond_b

    iget-boolean v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paused:Z

    if-nez v0, :cond_b

    invoke-virtual/range {p0 .. p0}, Le/e/a/internal/standard150/BikeRun$Track;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/internal/standard150/BikeRunModel;->started:Z

    if-eqz v0, :cond_b

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/internal/standard150/BikeRunModel;->over:Z

    if-nez v0, :cond_b

    invoke-virtual/range {p0 .. p0}, Le/e/a/internal/standard150/BikeRun$Track;->postInvalidateOnAnimation()V

    :cond_b
    return-void

    :cond_c
    const/4 v5, 0x1

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Le/e/a/internal/standard150/BikeRunModel$Hazard;

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget v1, v4, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    invoke-virtual {v0, v1}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v0

    add-float v3, v14, v0

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget v1, v4, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    iget v2, v4, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    add-float/2addr v1, v2

    invoke-virtual {v0, v1}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v0

    add-float v2, v14, v0

    iget-boolean v0, v4, Le/e/a/internal/standard150/BikeRunModel$Hazard;->gap:Z

    if-eqz v0, :cond_d

    iget v1, v4, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    iget v0, v4, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

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

    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    iget v0, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    iget v1, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    add-float v2, v0, v1

    iget v0, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    iget v1, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    add-float v4, v0, v1

    add-float v5, v8, v11

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v3, v8

    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    :goto_a
    const/high16 v2, 0x40800000    # 4.0f

    const/4 v4, 0x1

    const/4 v8, 0x0

    const/high16 v13, 0x42f00000    # 120.0f

    goto/16 :goto_5

    :cond_d
    move v8, v2

    move-object v13, v4

    const/high16 v17, 0x40800000    # 4.0f

    const/16 v19, 0x1

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget v1, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->moveTo(FF)V

    iget-boolean v0, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->spikes:Z

    if-eqz v0, :cond_f

    iget v0, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    const/high16 v1, 0x41a00000    # 20.0f

    div-float/2addr v0, v1

    float-to-int v0, v0

    const/4 v1, 0x2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/4 v1, 0x0

    :goto_b
    if-lt v1, v0, :cond_e

    goto :goto_c

    :cond_e
    iget v2, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    iget v3, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    int-to-float v4, v1

    mul-float v3, v3, v4

    int-to-float v4, v0

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    iget-object v3, v6, Le/e/a/internal/standard150/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget v5, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    div-float/2addr v5, v4

    div-float/2addr v5, v10

    add-float/2addr v5, v2

    iget-object v8, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget v15, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    div-float/2addr v15, v4

    div-float/2addr v15, v10

    add-float/2addr v15, v2

    invoke-virtual {v8, v15}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v8

    add-float/2addr v8, v14

    iget v15, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->height:F

    sub-float/2addr v8, v15

    invoke-virtual {v3, v5, v8}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v3, v6, Le/e/a/internal/standard150/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget v5, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    div-float/2addr v5, v4

    add-float/2addr v5, v2

    iget-object v8, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget v15, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    div-float/2addr v15, v4

    add-float/2addr v2, v15

    invoke-virtual {v8, v2}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v2

    add-float/2addr v2, v14

    invoke-virtual {v3, v5, v2}, Landroid/graphics/Path;->lineTo(FF)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    :cond_f
    iget v1, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->height:F

    const/high16 v2, 0x42800000    # 64.0f

    cmpl-float v0, v1, v2

    if-gez v0, :cond_10

    iget v1, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    iget v2, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->height:F

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr v2, v0

    add-float/2addr v1, v2

    sub-float/2addr v3, v2

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v3, v2, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_c

    :cond_10
    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget v1, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    iget v2, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->height:F

    sub-float/2addr v3, v2

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_c
    iget-boolean v0, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->spikes:Z

    if-nez v0, :cond_11

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    :cond_11
    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->obstacle:Landroid/graphics/Path;

    iget-object v1, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-direct {v6, v7, v0, v13}, Le/e/a/internal/standard150/BikeRun$Track;->drawEnemySpecies(Landroid/graphics/Canvas;Landroid/graphics/Path;Le/e/a/internal/standard150/BikeRunModel$Hazard;)V

    :goto_d
    goto/16 :goto_a

    :cond_12
    const/high16 v17, 0x40800000    # 4.0f

    const/16 v19, 0x1

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget v1, v0, Le/e/a/internal/standard150/BikeRunModel;->distance:F

    int-to-float v4, v3

    add-float/2addr v1, v4

    sub-float v1, v1, v17

    invoke-virtual {v0, v1}, Le/e/a/internal/standard150/BikeRunModel;->terrainGapAt(F)Z

    move-result v0

    iget-object v1, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget v2, v1, Le/e/a/internal/standard150/BikeRunModel;->distance:F

    add-float/2addr v2, v4

    invoke-virtual {v1, v2}, Le/e/a/internal/standard150/BikeRunModel;->terrainGapAt(F)Z

    move-result v1

    if-eq v0, v1, :cond_13

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    invoke-virtual {v0, v4}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

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

    invoke-virtual/range {v0 .. v5}, Le/e/a/internal/standard150/BikeRun$Track;->line(Landroid/graphics/Canvas;FFFF)V

    goto :goto_e

    :cond_13
    move v15, v3

    const/16 v8, 0x2d0

    :goto_e
    add-int/lit8 v3, v15, 0x4

    const/4 v4, 0x1

    const/16 v5, 0x2d0

    const/4 v8, 0x0

    const/high16 v13, 0x42f00000    # 120.0f

    goto/16 :goto_4

    :cond_14
    const/16 v19, 0x1

    iget-object v2, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget v3, v2, Le/e/a/internal/standard150/BikeRunModel;->distance:F

    int-to-float v4, v0

    add-float/2addr v3, v4

    invoke-virtual {v2, v3}, Le/e/a/internal/standard150/BikeRunModel;->terrainGapAt(F)Z

    move-result v2

    iget-object v3, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-object v3, v3, Le/e/a/internal/standard150/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_15
    :goto_f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_16

    goto :goto_10

    :cond_16
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/internal/standard150/BikeRunModel$Hazard;

    iget-boolean v8, v5, Le/e/a/internal/standard150/BikeRunModel$Hazard;->gap:Z

    if-eqz v8, :cond_15

    iget v8, v5, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    cmpl-float v8, v4, v8

    if-lez v8, :cond_15

    iget v8, v5, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    iget v5, v5, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    add-float/2addr v8, v5

    cmpg-float v5, v4, v8

    if-ltz v5, :cond_17

    goto :goto_f

    :cond_17
    const/4 v2, 0x1

    :goto_10
    iget-object v3, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    invoke-virtual {v3, v4}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v3

    add-float/2addr v3, v14

    if-eqz v2, :cond_18

    const/4 v1, 0x0

    goto :goto_12

    :cond_18
    if-eqz v1, :cond_19

    iget-object v1, v6, Le/e/a/internal/standard150/BikeRun$Track;->road:Landroid/graphics/Path;

    invoke-virtual {v1, v4, v3}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_11

    :cond_19
    iget-object v1, v6, Le/e/a/internal/standard150/BikeRun$Track;->road:Landroid/graphics/Path;

    invoke-virtual {v1, v4, v3}, Landroid/graphics/Path;->moveTo(FF)V

    :goto_11
    const/4 v1, 0x1

    :goto_12
    add-int/lit8 v0, v0, 0x2

    const/4 v8, 0x0

    const/high16 v13, 0x42f00000    # 120.0f

    goto/16 :goto_3

    iget v2, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    float-to-int v2, v2

    rem-int/lit8 v2, v2, 0x6

    const/4 v4, 0x2

    if-lt v2, v4, :cond_1a

    const/4 v4, 0x4

    if-lt v2, v4, :cond_1b

    goto/16 :goto_13

    :cond_1a
    iget v2, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    iget v4, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    const/high16 v5, 0x3f000000    # 0.5f

    mul-float v4, v4, v5

    add-float v2, v2, v4

    iget v4, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->height:F

    const v5, 0x3f19999a    # 0.6f

    mul-float v4, v4, v5

    sub-float v4, v14, v4

    const/high16 v5, 0x40a00000    # 5.0f

    invoke-virtual {v7, v2, v4, v5, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x40200000    # 2.5f

    invoke-virtual {v7, v2, v4, v5, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_14

    :cond_1b
    iget v2, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    iget v4, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    const/high16 v5, 0x3f000000    # 0.5f

    mul-float v4, v4, v5

    add-float v2, v2, v4

    iget v4, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->height:F

    const v5, 0x3f266666    # 0.65f

    mul-float v4, v4, v5

    sub-float v4, v14, v4

    const/high16 v5, 0x40e00000    # 7.0f

    invoke-virtual {v7, v2, v4, v5, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_14

    :goto_13
    iget v2, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    iget v4, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    const v5, 0x3eb33333    # 0.35f

    mul-float v4, v4, v5

    add-float v2, v2, v4

    iget v4, v13, Le/e/a/internal/standard150/BikeRunModel$Hazard;->height:F

    const v5, 0x3ee66666    # 0.45f

    mul-float v4, v4, v5

    sub-float v4, v14, v4

    const/high16 v5, 0x41100000    # 9.0f

    invoke-virtual {v7, v2, v4, v5, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :goto_14
    invoke-virtual {v7, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/32 :goto_d

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\u901f\u5ea6"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v3, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    invoke-virtual {v3}, Le/e/a/internal/standard150/BikeRunModel;->speed()F

    move-result v3

    const v4, 0x3d666666    # 0.05625f

    mul-float v3, v3, v4

    float-to-int v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v3, 0x6b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v3, 0x6d

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v3, 0x68

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const v3, 0x42de0000    # 111.0f

    const v5, 0x41c00000    # 24.0f

    iget-object v4, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v2, v5, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    invoke-virtual {v6, v7, v9}, Le/e/a/internal/standard150/BikeRun$Track;->scenery(Landroid/graphics/Canvas;F)V

    goto/32 :goto_2

    :goto_15
    invoke-virtual {v7, v8}, Landroid/graphics/Canvas;->rotate(F)V

    iget-object v0, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget v1, v0, Le/e/a/internal/standard150/BikeRunModel;->waves:I

    const v2, 0x40000000    # 2.0f

    and-int v1, v1, v2

    if-eqz v1, :cond_1c

    const v8, -0x3e700000    # -18.0f

    goto/32 :goto_19

    :cond_1c
    :goto_16
    goto/32 :goto_6

    :goto_17
    const v8, 0x3d3c6a7f    # 0.046f

    cmpg-float v9, v5, v8

    if-lez v9, :cond_1e

    const v8, 0x3dbc6a7f    # 0.092f

    cmpg-float v9, v5, v8

    if-lez v9, :cond_1d

    const v8, 0x3eaaaaab

    mul-float v5, v5, v8

    invoke-virtual {v2, v5}, Le/e/a/internal/standard150/BikeRunModel;->step(F)V

    invoke-virtual {v2, v5}, Le/e/a/internal/standard150/BikeRunModel;->step(F)V

    invoke-virtual {v2, v5}, Le/e/a/internal/standard150/BikeRunModel;->step(F)V

    goto/32 :goto_0

    :cond_1d
    const v8, 0x3f000000    # 0.5f

    mul-float v5, v5, v8

    invoke-virtual {v2, v5}, Le/e/a/internal/standard150/BikeRunModel;->step(F)V

    invoke-virtual {v2, v5}, Le/e/a/internal/standard150/BikeRunModel;->step(F)V

    goto/32 :goto_0

    :cond_1e
    invoke-virtual {v2, v5}, Le/e/a/internal/standard150/BikeRunModel;->step(F)V

    goto/32 :goto_0

    :goto_18
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "\u901f\u5ea6"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v3, v6, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    invoke-virtual {v3}, Le/e/a/internal/standard150/BikeRunModel;->speed()F

    move-result v3

    const v4, 0x3f100000    # 0.5625f

    mul-float v3, v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    const/16 v4, 0xa

    div-int v5, v3, v4

    rem-int v4, v3, v4

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v3, 0x2e

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v3, 0x6b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v3, 0x6d

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v3, 0x68

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const v3, 0x42de0000    # 111.0f

    const v5, 0x41c00000    # 24.0f

    iget-object v4, v6, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v2, v5, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    invoke-virtual {v6, v7, v9}, Le/e/a/internal/standard150/BikeRun$Track;->scenery(Landroid/graphics/Canvas;F)V

    goto/32 :goto_2

    :goto_19
    invoke-virtual {v7, v8}, Landroid/graphics/Canvas;->rotate(F)V

    const/4 v0, 0x0

    const v8, -0x3ec00000    # -12.0f

    invoke-virtual {v7, v0, v8}, Landroid/graphics/Canvas;->translate(FF)V

    goto/32 :goto_16
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7

    invoke-direct {p0, p1}, Le/e/a/internal/standard150/BikeRun$Track;->handleTwoFingerPause(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v0

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0, p1}, Le/e/a/BikeRunSelector;->isTitleHit(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v1

    iput-boolean v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->titlePressed:Z

    if-eqz v1, :cond_4

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    iget-boolean v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->titlePressed:Z

    if-eqz v1, :cond_4

    const/4 v1, 0x0

    iput-boolean v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->titlePressed:Z

    invoke-static {p0, p1}, Le/e/a/BikeRunSelector;->isTitleHit(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Le/e/a/internal/standard150/BikeRun$Track;->performClick()Z

    invoke-static {p0}, Le/e/a/BikeRunSelector;->showFor(Landroid/view/View;)V

    :cond_2
    const/4 v0, 0x1

    return v0

    :cond_3
    const/4 v1, 0x3

    if-ne v0, v1, :cond_4

    const/4 v1, 0x0

    iput-boolean v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->titlePressed:Z

    :cond_4
    goto/32 :goto_4

    nop

    :goto_0
    const/4 v0, 0x1

    if-nez p1, :cond_9

    invoke-virtual {p0}, Le/e/a/internal/standard150/BikeRun$Track;->performClick()Z

    iget-boolean p1, p0, Le/e/a/internal/standard150/BikeRun$Track;->historyOpen:Z

    if-eqz p1, :cond_5

    return v0

    :cond_5
    iget-boolean p1, p0, Le/e/a/internal/standard150/BikeRun$Track;->paused:Z

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    if-eqz p1, :cond_6

    iput-boolean v3, p0, Le/e/a/internal/standard150/BikeRun$Track;->paused:Z

    iput-wide v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->last:J

    invoke-virtual {p0}, Le/e/a/internal/standard150/BikeRun$Track;->invalidate()V

    return v0

    :cond_6
    iget-object p1, p0, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-boolean p1, p1, Le/e/a/internal/standard150/BikeRunModel;->over:Z

    if-eqz p1, :cond_7

    iput-boolean v3, p0, Le/e/a/internal/standard150/BikeRun$Track;->recorded:Z

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/internal/standard150/BikeRun$Track;->runId:Ljava/lang/String;

    :cond_7
    iget-object p1, p0, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    goto/32 :goto_7

    iget-wide v3, p0, Le/e/a/internal/standard150/BikeRun$Track;->last:J

    cmp-long p1, v3, v1

    if-nez p1, :cond_8

    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->last:J

    :cond_8
    invoke-virtual {p0}, Le/e/a/internal/standard150/BikeRun$Track;->invalidate()V

    :cond_9
    return v0

    :cond_a
    :goto_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x1

    goto/16 :goto_3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v2

    sub-long v0, v0, v2

    const-wide/16 v2, 0xb4

    cmp-long v4, v0, v2

    if-gez v4, :cond_b

    goto/16 :goto_3

    :cond_b
    iget-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->historyOpen:Z

    if-nez v0, :cond_c

    iget-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->paused:Z

    if-nez v0, :cond_c

    iget-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-boolean v1, v0, Le/e/a/internal/standard150/BikeRunModel;->started:Z

    if-eqz v1, :cond_c

    iget-boolean v1, v0, Le/e/a/internal/standard150/BikeRunModel;->over:Z

    if-nez v1, :cond_c

    iget v1, v0, Le/e/a/internal/standard150/BikeRunModel;->y:F

    const/4 v2, 0x0

    cmpg-float v3, v1, v2

    if-gez v3, :cond_c

    iget v1, v0, Le/e/a/internal/standard150/BikeRunModel;->velocity:F

    cmpg-float v3, v1, v2

    if-gez v3, :cond_c

    const v1, -0x3bb58000    # -810.0f

    iput v1, v0, Le/e/a/internal/standard150/BikeRunModel;->velocity:F

    invoke-virtual {p0}, Le/e/a/internal/standard150/BikeRun$Track;->invalidate()V

    :cond_c
    :goto_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    goto/32 :goto_0

    :goto_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    if-eq v0, v1, :cond_d

    const/4 v1, 0x1

    if-eq v0, v1, :cond_f

    goto/32 :goto_2

    :cond_d
    iget-boolean v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->historyOpen:Z

    if-nez v1, :cond_a

    iget-boolean v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->paused:Z

    if-nez v1, :cond_e

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v0, v0

    iget v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    const/4 v2, 0x3

    and-int v1, v1, v2

    const/4 v2, 0x2

    shl-int v0, v0, v2

    or-int v0, v0, v1

    iput v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    const/4 v0, 0x1

    return v0

    :cond_e
    iget v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    neg-int v1, v1

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    goto/32 :goto_2

    :cond_f
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-boolean v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->historyOpen:Z

    if-nez v1, :cond_11

    iget v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    if-ltz v1, :cond_12

    iget-boolean v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->paused:Z

    if-nez v1, :cond_11

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    iget v2, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    const/4 v3, 0x2

    shr-int v2, v2, v3

    sub-int v2, v2, v1

    iget v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    const/4 v3, 0x3

    and-int v1, v1, v3

    iput v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    const/16 v3, 0x56

    if-ge v2, v3, :cond_10

    const/16 v3, -0x56

    if-gt v2, v3, :cond_13

    :cond_10
    iget-boolean v1, v0, Le/e/a/internal/standard150/BikeRunModel;->started:Z

    if-eqz v1, :cond_11

    iget-boolean v1, v0, Le/e/a/internal/standard150/BikeRunModel;->over:Z

    if-nez v1, :cond_11

    iget v1, v0, Le/e/a/internal/standard150/BikeRunModel;->y:F

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-nez v1, :cond_11

    iget v1, v0, Le/e/a/internal/standard150/BikeRunModel;->waves:I

    const v2, 0x40000000    # 2.0f

    xor-int v1, v1, v2

    iput v1, v0, Le/e/a/internal/standard150/BikeRunModel;->waves:I

    invoke-virtual {p0}, Le/e/a/internal/standard150/BikeRun$Track;->invalidate()V

    :cond_11
    :goto_5
    const/4 v0, 0x1

    return v0

    :cond_12
    neg-int v1, v1

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    goto/32 :goto_5

    :cond_13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v2

    sub-long v0, v0, v2

    const-wide/16 v2, 0xb4

    cmp-long v4, v0, v2

    if-ltz v4, :cond_14

    iget v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    const v1, 0x40000000    # 2.0f

    or-int v0, v0, v1

    iput v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    goto/32 :goto_6

    :cond_14
    :goto_6
    const/4 p1, 0x0

    goto/32 :goto_0

    :goto_7
    goto/32 :goto_b

    :goto_8
    iget v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    const v1, 0x40000000    # 2.0f

    and-int v0, v0, v1

    if-eqz v0, :cond_15

    iget-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    const v1, -0x3bb58000    # -810.0f

    goto/16 :goto_c

    :goto_9
    iget v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    const v1, 0x3fffffff    # 1.9999999f

    and-int v0, v0, v1

    iput v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    :cond_15
    :goto_a
    const/4 v0, 0x1

    goto/16 :goto_1

    :goto_b
    iget-boolean v0, p1, Le/e/a/internal/standard150/BikeRunModel;->over:Z

    if-nez v0, :cond_16

    iget v0, p1, Le/e/a/internal/standard150/BikeRunModel;->jumpsUsed:I

    const/4 v1, 0x2

    if-ge v0, v1, :cond_17

    :cond_16
    invoke-virtual {p1}, Le/e/a/internal/standard150/BikeRunModel;->tap()V

    goto/32 :goto_8

    :cond_17
    iget v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    const v1, 0x3fffffff    # 1.9999999f

    and-int v0, v0, v1

    iput v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->recordsPage:I

    goto/32 :goto_a

    :goto_c
    iget v2, v0, Le/e/a/internal/standard150/BikeRunModel;->waves:I

    const v3, 0x40000000    # 2.0f

    and-int v2, v2, v3

    if-eqz v2, :cond_18

    const v1, -0x3b9a0000    # -920.0f

    :cond_18
    iput v1, v0, Le/e/a/internal/standard150/BikeRunModel;->velocity:F

    goto/32 :goto_9
.end method

.method public onWindowFocusChanged(Z)V
    .registers 4

    .line 579
    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    const-wide/16 v0, 0x0

    .line 580
    iput-wide v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->last:J

    if-eqz p1, :cond_0

    .line 582
    invoke-virtual {p0}, Le/e/a/internal/standard150/BikeRun$Track;->invalidate()V

    :cond_0
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

    if-ne p1, v0, :cond_0

    .line 304
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->records:Le/e/a/internal/standard150/BikeRunRecords;

    invoke-virtual {v0}, Le/e/a/internal/standard150/BikeRunRecords;->highScores()Ljava/util/List;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->records:Le/e/a/internal/standard150/BikeRunRecords;

    if-ne p1, v1, :cond_1

    sget-object v2, Le/e/a/internal/standard150/BikeRunModel;->VERSION:Ljava/lang/String;

    invoke-virtual {v0, v2}, Le/e/a/internal/standard150/BikeRunRecords;->best(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Le/e/a/internal/standard150/BikeRunRecords;->recent()Ljava/util/List;

    move-result-object v0

    .line 305
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    const-string p1, "No records yet"

    const-string/jumbo v0, "\u6682\u65e0\u8bb0\u5f55"

    const-string/jumbo v1, "\u8a18\u9332\u306f\u307e\u3060\u3042\u308a\u307e\u305b\u3093"

    invoke-virtual {p0, v1, p1, v0}, Le/e/a/internal/standard150/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 306
    :cond_2
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

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_3

    .line 316
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 309
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    add-int/2addr v4, v1

    .line 311
    iget-object v6, v5, Le/e/a/internal/standard150/BikeRunRecords$Entry;->id:Ljava/lang/String;

    iget-object v7, p0, Le/e/a/internal/standard150/BikeRun$Track;->runId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    const-string v6, "\u25b6 "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    if-ne p1, v1, :cond_5

    .line 312
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ". "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    :cond_5
    iget v6, v5, Le/e/a/internal/standard150/BikeRunRecords$Entry;->score:I

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " m  \u00b7  v"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v5, Le/e/a/internal/standard150/BikeRunRecords$Entry;->version:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v6, 0xa

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 314
    iget-wide v6, v5, Le/e/a/internal/standard150/BikeRunRecords$Entry;->time:J

    const-wide/16 v8, 0x0

    cmp-long v10, v6, v8

    if-nez v10, :cond_6

    const-string v5, "Date unknown"

    const-string/jumbo v6, "\u65e5\u671f\u672a\u77e5"

    const-string/jumbo v7, "\u65e5\u6642\u4e0d\u660e"

    invoke-virtual {p0, v7, v5, v6}, Le/e/a/internal/standard150/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_2

    :cond_6
    new-instance v6, Ljava/util/Date;

    iget-wide v7, v5, Le/e/a/internal/standard150/BikeRunRecords$Entry;->time:J

    invoke-direct {v6, v7, v8}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, v6}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    :goto_2
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\n\n"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method recordsText(Z)Ljava/lang/String;
    .registers 2

    .line 301
    invoke-virtual {p0, p1}, Le/e/a/internal/standard150/BikeRun$Track;->recordsText(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method saveResult()V
    .registers 9

    .line 292
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget-boolean v0, v0, Le/e/a/internal/standard150/BikeRunModel;->over:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->recorded:Z

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x1

    .line 293
    iput-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->recorded:Z

    .line 294
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->records:Le/e/a/internal/standard150/BikeRunRecords;

    new-instance v7, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-object v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    invoke-virtual {v1}, Le/e/a/internal/standard150/BikeRunModel;->score()I

    move-result v5

    iget-object v6, p0, Le/e/a/internal/standard150/BikeRun$Track;->runId:Ljava/lang/String;

    sget-object v2, Le/e/a/internal/standard150/BikeRunModel;->VERSION:Ljava/lang/String;

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Le/e/a/internal/standard150/BikeRunRecords$Entry;-><init>(Ljava/lang/String;JILjava/lang/String;)V

    invoke-virtual {v0, v7}, Le/e/a/internal/standard150/BikeRunRecords;->add(Le/e/a/internal/standard150/BikeRunRecords$Entry;)Z

    .line 295
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->records:Le/e/a/internal/standard150/BikeRunRecords;

    sget-object v1, Le/e/a/internal/standard150/BikeRunModel;->VERSION:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le/e/a/internal/standard150/BikeRunRecords;->best(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 296
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    iget v2, v0, Le/e/a/internal/standard150/BikeRunRecords$Entry;->score:I

    :goto_0
    iput v2, p0, Le/e/a/internal/standard150/BikeRun$Track;->best:I

    .line 298
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Le/e/a/internal/standard150/BikeRun$Track;->records:Le/e/a/internal/standard150/BikeRunRecords;

    invoke-virtual {v1}, Le/e/a/internal/standard150/BikeRunRecords;->encode()Ljava/lang/String;

    move-result-object v1

    const-string v2, "bike_run_records_v1"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_2
    :goto_1
    return-void
.end method

.method scenery(Landroid/graphics/Canvas;F)V
    .registers 32

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    iget-object v3, v0, Le/e/a/internal/standard150/BikeRun$Track;->paint:Landroid/graphics/Paint;

    iget-object v4, v0, Le/e/a/internal/standard150/BikeRun$Track;->game:Le/e/a/internal/standard150/BikeRunModel;

    iget v5, v4, Le/e/a/internal/standard150/BikeRunModel;->distance:F

    iget v15, v0, Le/e/a/internal/standard150/BikeRun$Track;->foreground:I

    move/from16 v25, v15

    iget v15, v0, Le/e/a/internal/standard150/BikeRun$Track;->accent:I

    move/from16 v26, v15

    const v13, 0x3f2aaaab

    mul-float v22, v2, v13

    const/high16 v13, 0x422c0000    # 43.0f

    add-float v22, v22, v13

    const/high16 v13, 0x43660000    # 230.0f

    cmpg-float v15, v22, v13

    if-gez v15, :cond_0

    move/from16 v22, v13

    :cond_0
    move/from16 v15, v25

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v15, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/16 v15, 0xa0

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setAlpha(I)V

    const v15, 0x400ccccd    # 2.2f

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const v13, 0x3e8f5c29    # 0.28f

    mul-float v5, v5, v13

    const/high16 v13, 0x43520000    # 210.0f

    div-float v13, v5, v13

    float-to-int v6, v13

    int-to-float v13, v6

    const/high16 v14, 0x43520000    # 210.0f

    mul-float v13, v13, v14

    sub-float v24, v5, v13

    add-int/lit8 v7, v6, -0x2

    add-int/lit8 v8, v6, 0x6

    iget v15, v0, Le/e/a/internal/standard150/BikeRun$Track;->background:I

    const v14, 0x3f464f

    xor-int v15, v15, v14

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setColor(I)V

    const/16 v15, 0xff

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setAlpha(I)V

    const v10, 0x44148000    # 594.0f

    const v13, 0x3e2e147b    # 0.17f

    mul-float v11, v2, v13

    const/high16 v12, 0x42780000    # 62.0f

    const/high16 v13, 0x0

    mul-float v13, v12, v13

    add-float v13, v10, v13

    move/from16 v23, v13

    const/high16 v13, 0x0

    mul-float v14, v12, v13

    add-float v14, v11, v14

    const v15, 0x3f147ae1    # 0.58f

    mul-float v15, v12, v15

    move/from16 v13, v23

    move-object/from16 v16, v3

    sget-object v17, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v1, v13, v14, v15, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v17, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/16 v27, 0x0

    :goto_0
    move/from16 v14, v27

    const/16 v15, 0x8

    if-ge v14, v15, :cond_1

    int-to-float v10, v14

    const/high16 v13, 0x43750000    # 245.0f

    mul-float v10, v10, v13

    const v13, 0x3e947ae1    # 0.29f

    mul-float v13, v5, v13

    const/high16 v15, 0x44f50000    # 1960.0f

    rem-float v13, v13, v15

    sub-float v10, v10, v13

    add-float/2addr v10, v15

    rem-float/2addr v10, v15

    const/high16 v13, 0x43750000    # 245.0f

    sub-float/2addr v10, v13

    rem-int/lit8 v14, v27, 0x3

    int-to-float v14, v14

    const/high16 v15, 0x42800000    # 64.0f

    mul-float v14, v14, v15

    const v13, 0x3e75c28f    # 0.24f

    mul-float v11, v2, v13

    add-float v11, v11, v14

    and-int/lit8 v14, v27, 0x3

    int-to-float v14, v14

    const/high16 v13, 0x41100000    # 9.0f

    mul-float v14, v14, v13

    const/high16 v13, 0x42400000    # 48.0f

    add-float v12, v14, v13

    const/high16 v13, -0x41800000    # -0.25f

    mul-float v13, v12, v13

    add-float v13, v10, v13

    move/from16 v23, v13

    const v13, -0x43dc28f6    # -0.01f

    mul-float v14, v12, v13

    add-float v14, v11, v14

    const v15, 0x3e947ae1    # 0.29f

    mul-float v15, v12, v15

    move/from16 v13, v23

    move-object/from16 v16, v3

    sget-object v17, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v1, v13, v14, v15, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v17, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v13, 0x3e4ccccd    # 0.2f

    mul-float v13, v12, v13

    add-float v13, v10, v13

    move/from16 v23, v13

    const v13, -0x41dc28f6    # -0.16f

    mul-float v14, v12, v13

    add-float v14, v11, v14

    const v15, 0x3ed70a3d    # 0.42f

    mul-float v15, v12, v15

    move/from16 v13, v23

    move-object/from16 v16, v3

    sget-object v17, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v1, v13, v14, v15, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v17, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v13, 0x3f1eb852    # 0.62f

    mul-float v13, v12, v13

    add-float v13, v10, v13

    move/from16 v23, v13

    const v13, -0x435c28f6    # -0.02f

    mul-float v14, v12, v13

    add-float v14, v11, v14

    const v15, 0x3e947ae1    # 0.29f

    mul-float v15, v12, v15

    move/from16 v13, v23

    move-object/from16 v16, v3

    sget-object v17, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v1, v13, v14, v15, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v17, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    sget-object v15, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    move-object/from16 v16, v1

    const v13, -0x41147ae1    # -0.46f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3d8f5c29    # 0.07f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f570a3d    # 0.84f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3e6b851f    # 0.23f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    nop

    nop

    nop

    sget-object v15, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    add-int/lit8 v27, v27, 0x1

    goto/16 :goto_0

    :cond_1
    iget v15, v0, Le/e/a/internal/standard150/BikeRun$Track;->background:I

    const v14, 0x232e38

    xor-int v15, v15, v14

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setColor(I)V

    const/16 v15, 0xff

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setAlpha(I)V

    :goto_1
    if-ge v7, v8, :cond_19

    mul-int/lit8 v9, v7, 0x1d

    shr-int/lit8 v14, v7, 0x3

    xor-int v9, v9, v14

    and-int/lit8 v9, v9, 0x3

    div-int/lit8 v14, v7, 0x10

    rem-int/lit8 v14, v14, 0x6

    mul-int/lit8 v14, v14, 0x4

    add-int v9, v9, v14

    sub-int v10, v7, v6

    int-to-float v10, v10

    const/high16 v13, 0x43520000    # 210.0f

    mul-float v10, v10, v13

    sub-float v10, v10, v24

    mul-int/lit8 v14, v7, 0x25

    and-int/lit8 v14, v14, 0x3f

    int-to-float v12, v14

    const/high16 v13, 0x429c0000    # 78.0f

    add-float v12, v12, v13

    const/high16 v13, 0x40e00000    # 7.0f

    sub-float v11, v22, v13

    const/4 v14, 0x0

    if-eq v9, v14, :cond_2

    const/4 v14, 0x1

    if-eq v9, v14, :cond_3

    const/4 v14, 0x2

    if-eq v9, v14, :cond_4

    const/4 v14, 0x3

    if-eq v9, v14, :cond_5

    const/4 v14, 0x4

    if-eq v9, v14, :cond_6

    const/4 v14, 0x5

    if-eq v9, v14, :cond_7

    const/4 v14, 0x6

    if-eq v9, v14, :cond_8

    const/4 v14, 0x7

    if-eq v9, v14, :cond_9

    const/16 v14, 0x8

    if-eq v9, v14, :cond_a

    const/16 v14, 0x9

    if-eq v9, v14, :cond_b

    const/16 v14, 0xa

    if-eq v9, v14, :cond_c

    const/16 v14, 0xb

    if-eq v9, v14, :cond_d

    const/16 v14, 0xc

    if-eq v9, v14, :cond_e

    const/16 v14, 0xd

    if-eq v9, v14, :cond_f

    const/16 v14, 0xe

    if-eq v9, v14, :cond_10

    const/16 v14, 0xf

    if-eq v9, v14, :cond_11

    const/16 v14, 0x10

    if-eq v9, v14, :cond_12

    const/16 v14, 0x11

    if-eq v9, v14, :cond_13

    const/16 v14, 0x12

    if-eq v9, v14, :cond_14

    const/16 v14, 0x13

    if-eq v9, v14, :cond_15

    const/16 v14, 0x14

    if-eq v9, v14, :cond_16

    const/16 v14, 0x15

    if-eq v9, v14, :cond_17

    const/16 v14, 0x16

    if-eq v9, v14, :cond_18

    goto/16 :goto_2

    :cond_2
    move-object/from16 v16, v1

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40266666    # -1.7f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3d75c28f    # 0.06f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4119999a    # -0.45f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x400a3d71    # -1.92f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x400a3d71    # -1.92f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f70a3d7    # 0.94f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4119999a    # -0.45f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3df5c28f    # 0.12f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4079999a    # -1.05f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, -0x3ff00000    # -2.25f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, -0x3ff00000    # -2.25f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f6147ae    # 0.88f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4079999a    # -1.05f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e4ccccd    # 0.2f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x41b33333    # -0.2f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f51eb85    # 0.82f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x41b33333    # -0.2f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_3
    move-object/from16 v16, v1

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4063d70a    # -1.22f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const v13, 0x3e851eb8    # 0.26f

    mul-float v13, v12, v13

    add-float v13, v10, v13

    move/from16 v23, v13

    const v13, -0x40628f5c    # -1.23f

    mul-float v14, v12, v13

    add-float v14, v11, v14

    const v15, 0x3eb33333    # 0.35f

    mul-float v15, v12, v15

    move/from16 v13, v23

    move-object/from16 v16, v3

    sget-object v17, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v1, v13, v14, v15, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v17, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v13, 0x3f3851ec    # 0.72f

    mul-float v13, v12, v13

    add-float v13, v10, v13

    move/from16 v23, v13

    const v13, -0x405eb852    # -1.26f

    mul-float v14, v12, v13

    add-float v14, v11, v14

    const v15, 0x3eb33333    # 0.35f

    mul-float v15, v12, v15

    move/from16 v13, v23

    move-object/from16 v16, v3

    sget-object v17, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v1, v13, v14, v15, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v17, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v13, v12, v13

    add-float v13, v10, v13

    move/from16 v23, v13

    const v13, -0x4035c28f    # -1.58f

    mul-float v14, v12, v13

    add-float v14, v11, v14

    const v15, 0x3edc28f6    # 0.43f

    mul-float v15, v12, v15

    move/from16 v13, v23

    move-object/from16 v16, v3

    sget-object v17, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v1, v13, v14, v15, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v17, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    goto/16 :goto_3

    :cond_4
    move-object/from16 v16, v1

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, -0x41000000    # -0.5f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const v13, 0x3e75c28f    # 0.24f

    mul-float v13, v12, v13

    add-float v13, v10, v13

    move/from16 v23, v13

    const v13, -0x41051eb8    # -0.49f

    mul-float v14, v12, v13

    add-float v14, v11, v14

    const v15, 0x3e6b851f    # 0.23f

    mul-float v15, v12, v15

    move/from16 v13, v23

    move-object/from16 v16, v3

    sget-object v17, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v1, v13, v14, v15, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v17, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v13, 0x3f170a3d    # 0.59f

    mul-float v13, v12, v13

    add-float v13, v10, v13

    move/from16 v23, v13

    const v13, -0x40f33333    # -0.55f

    mul-float v14, v12, v13

    add-float v14, v11, v14

    const v15, 0x3e947ae1    # 0.29f

    mul-float v15, v12, v15

    move/from16 v13, v23

    move-object/from16 v16, v3

    sget-object v17, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v1, v13, v14, v15, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v17, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v13, 0x3f6e147b    # 0.93f

    mul-float v13, v12, v13

    add-float v13, v10, v13

    move/from16 v23, v13

    const v13, -0x411eb852    # -0.44f

    mul-float v14, v12, v13

    add-float v14, v11, v14

    const v15, 0x3e570a3d    # 0.21f

    mul-float v15, v12, v15

    move/from16 v13, v23

    move-object/from16 v16, v3

    sget-object v17, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v1, v13, v14, v15, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v17, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    goto/16 :goto_3

    :cond_5
    move-object/from16 v16, v1

    const v13, -0x41b33333    # -0.2f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3ecccccd    # 0.4f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40333333    # -1.6f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3ecccccd    # 0.4f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40333333    # -1.6f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f828f5c    # 1.02f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x3f400000    # 0.75f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f933333    # 1.15f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4079999a    # -1.05f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f933333    # 1.15f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4079999a    # -1.05f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3fc66666    # 1.55f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3dcccccd    # 0.1f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40b33333    # -0.8f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3ecccccd    # 0.4f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4079999a    # -1.05f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_6
    move-object/from16 v16, v1

    const/high16 v13, 0x0

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x407c28f6    # -1.03f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f933333    # 1.15f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, -0x420a3d71    # -0.12f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x407c28f6    # -1.03f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f07ae14    # 0.53f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x403d70a4    # -1.52f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f07ae14    # 0.53f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x403d70a4    # -1.52f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3fa00000    # 1.25f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x407c28f6    # -1.03f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e8f5c29    # 0.28f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40eb851f    # -0.58f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f07ae14    # 0.53f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x41666666    # -0.3f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f3ae148    # 0.73f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40fae148    # -0.52f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f733333    # 0.95f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_7
    move-object/from16 v16, v1

    const v13, 0x3e19999a    # 0.15f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4019999a    # -1.8f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f828f5c    # 1.02f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e8f5c29    # 0.28f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x403d70a4    # -1.52f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x405d70a4    # -1.27f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f333333    # 0.7f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x403d70a4    # -1.52f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f666666    # 0.9f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x405d70a4    # -1.27f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e8f5c29    # 0.28f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x407d70a4    # -1.02f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40b851ec    # -0.78f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f333333    # 0.7f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x407d70a4    # -1.02f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f666666    # 0.9f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40b851ec    # -0.78f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3efae148    # 0.49f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4119999a    # -0.45f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3f400000    # 0.75f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_8
    move-object/from16 v16, v1

    const v13, -0x420a3d71    # -0.12f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40c7ae14    # -0.72f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3fb0a3d7    # 1.38f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e3851ec    # 0.18f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40066666    # -1.95f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3edc28f6    # 0.43f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40c7ae14    # -0.72f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f4ccccd    # 0.8f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4035c28f    # -1.58f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f8147ae    # 1.01f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40c7ae14    # -0.72f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3da3d70a    # 0.08f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40f851ec    # -0.53f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3ec28f5c    # 0.38f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x41666666    # -0.3f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f2147ae    # 0.63f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40f851ec    # -0.53f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f70a3d7    # 0.94f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x41666666    # -0.3f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_9
    move-object/from16 v16, v1

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4048f5c3    # -1.43f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v13, v12, v13

    add-float v13, v10, v13

    move/from16 v23, v13

    const v13, -0x4048f5c3    # -1.43f

    mul-float v14, v12, v13

    add-float v14, v11, v14

    const v15, 0x3e2e147b    # 0.17f

    mul-float v15, v12, v15

    move/from16 v13, v23

    move-object/from16 v16, v3

    sget-object v17, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v1, v13, v14, v15, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v17, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    move-object/from16 v16, v1

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4048f5c3    # -1.43f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x3ff9999a    # -2.1f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4048f5c3    # -1.43f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, -0x41c7ae14    # -0.18f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4048f5c3    # -1.43f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4048f5c3    # -1.43f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f90a3d7    # 1.13f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4048f5c3    # -1.43f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_a
    move-object/from16 v16, v1

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x400ccccd    # -1.9f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x400ccccd    # -1.9f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f91eb85    # 1.14f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x400ccccd    # -1.9f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f91eb85    # 1.14f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x400ccccd    # -1.9f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f970a3d    # 1.18f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x402ccccd    # -1.65f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const v13, 0x3f95c28f    # 1.17f

    mul-float v13, v12, v13

    add-float v13, v10, v13

    move/from16 v23, v13

    const v13, -0x4030a3d7    # -1.62f

    mul-float v14, v12, v13

    add-float v14, v11, v14

    const v15, 0x3e0f5c29    # 0.14f

    mul-float v15, v12, v15

    move/from16 v13, v23

    move-object/from16 v16, v3

    sget-object v17, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v1, v13, v14, v15, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v17, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    goto/16 :goto_3

    :cond_b
    move-object/from16 v16, v1

    const/high16 v13, 0x0

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x0

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4059999a    # -1.3f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3fb33333    # 1.4f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3fb33333    # 1.4f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4059999a    # -1.3f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, -0x42333333    # -0.1f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4059999a    # -1.3f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3fc00000    # 1.5f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4059999a    # -1.3f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e99999a    # 0.3f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4059999a    # -1.3f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f333333    # 0.7f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40b33333    # -0.8f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f333333    # 0.7f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40b33333    # -0.8f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f8ccccd    # 1.1f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4059999a    # -1.3f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_c
    move-object/from16 v16, v1

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, -0x40200000    # -1.75f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, -0x40800000    # -1.0f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3d4ccccd    # 0.05f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, -0x40800000    # -1.0f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3d4ccccd    # 0.05f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, -0x40800000    # -1.0f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3d4ccccd    # 0.05f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, -0x40400000    # -1.5f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, -0x41000000    # -0.5f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f733333    # 0.95f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, -0x41000000    # -0.5f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f733333    # 0.95f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, -0x41000000    # -0.5f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f733333    # 0.95f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40733333    # -1.1f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_d
    move-object/from16 v16, v1

    const v13, -0x42333333    # -0.1f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e8a3d71    # 0.27f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, -0x41000000    # -0.5f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e8a3d71    # 0.27f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, -0x41000000    # -0.5f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f1c28f6    # 0.61f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f70a3d7    # 0.94f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40d9999a    # -0.65f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f70a3d7    # 0.94f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40d9999a    # -0.65f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3faa3d71    # 1.33f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x0

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x41b33333    # -0.2f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f07ae14    # 0.53f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x41b33333    # -0.2f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_e
    move-object/from16 v16, v1

    const v13, 0x3e4ccccd    # 0.2f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e4ccccd    # 0.2f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x3feccccd    # -2.3f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3da3d70a    # 0.08f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x3feccccd    # -2.3f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3fc7ae14    # 1.56f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x3feccccd    # -2.3f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x3f400000    # 0.75f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x3feccccd    # -2.3f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3f400000    # 0.75f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4039999a    # -1.55f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x3f400000    # 0.75f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4039999a    # -1.55f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3f800000    # 1.0f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4039999a    # -1.55f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e4ccccd    # 0.2f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x3feccccd    # -2.3f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3f800000    # 1.0f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40266666    # -1.7f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_f
    move-object/from16 v16, v1

    const/high16 v13, 0x0

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f051eb8    # 0.52f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x3fe9999a    # -2.35f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f051eb8    # 0.52f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x3fe9999a    # -2.35f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f851eb8    # 1.04f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e4ccccd    # 0.2f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40b33333    # -0.8f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f51eb85    # 0.82f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40b33333    # -0.8f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3dcccccd    # 0.1f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40466666    # -1.45f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f70a3d7    # 0.94f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40466666    # -1.45f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, -0x420a3d71    # -0.12f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x3ffb851f    # -2.07f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f8f5c29    # 1.12f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x3ffb851f    # -2.07f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_10
    move-object/from16 v16, v1

    const v13, 0x3e6b851f    # 0.23f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e6b851f    # 0.23f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, -0x40400000    # -1.5f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e6b851f    # 0.23f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, -0x40400000    # -1.5f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f2b851f    # 0.67f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, -0x40400000    # -1.5f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f2b851f    # 0.67f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, -0x40400000    # -1.5f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f2b851f    # 0.67f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40733333    # -1.1f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f63d70a    # 0.89f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f63d70a    # 0.89f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x408ccccd    # -0.95f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f63d70a    # 0.89f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x408ccccd    # -0.95f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3fa28f5c    # 1.27f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x408ccccd    # -0.95f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_11
    move-object/from16 v16, v1

    const v13, -0x42b33333    # -0.05f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4023d70a    # -1.72f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3fb33333    # 1.4f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4099999a    # -0.9f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e6147ae    # 0.22f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4099999a    # -0.9f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e6147ae    # 0.22f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f8f5c29    # 1.12f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4099999a    # -0.9f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f8f5c29    # 1.12f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e4ccccd    # 0.2f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40428f5c    # -1.48f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f91eb85    # 1.14f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40428f5c    # -1.48f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x3e800000    # 0.25f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4063d70a    # -1.22f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f3851ec    # 0.72f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4063d70a    # -1.22f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_12
    move-object/from16 v16, v1

    const v13, -0x41e66666    # -0.15f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e19999a    # 0.15f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40e66666    # -0.6f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e19999a    # 0.15f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40e66666    # -0.6f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e19999a    # 0.15f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, -0x40600000    # -1.25f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e19999a    # 0.15f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, -0x40600000    # -1.25f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f59999a    # 0.85f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, -0x40600000    # -1.25f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f59999a    # 0.85f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, -0x40600000    # -1.25f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f59999a    # 0.85f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4119999a    # -0.45f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f59999a    # 0.85f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4119999a    # -0.45f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3fa00000    # 1.25f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_13
    move-object/from16 v16, v1

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4039999a    # -1.55f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40a66666    # -0.85f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3da3d70a    # 0.08f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40a66666    # -0.85f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3da3d70a    # 0.08f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40a66666    # -0.85f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3da3d70a    # 0.08f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x405c28f6    # -1.28f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40fae148    # -0.52f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f570a3d    # 0.84f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40fae148    # -0.52f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f570a3d    # 0.84f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40fae148    # -0.52f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f570a3d    # 0.84f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4070a3d7    # -1.12f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3ee147ae    # 0.44f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4039999a    # -1.55f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f051eb8    # 0.52f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4039999a    # -1.55f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_14
    move-object/from16 v16, v1

    const v13, -0x425c28f6    # -0.08f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e051eb8    # 0.13f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, -0x40400000    # -1.5f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e051eb8    # 0.13f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, -0x40400000    # -1.5f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f8a3d71    # 1.08f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, -0x40400000    # -1.5f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f8a3d71    # 1.08f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, -0x40400000    # -1.5f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3fa66666    # 1.3f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e3851ec    # 0.18f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x41666666    # -0.3f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e3851ec    # 0.18f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x406a3d71    # -1.17f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f6b851f    # 0.92f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x41666666    # -0.3f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f6b851f    # 0.92f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x406a3d71    # -1.17f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e3851ec    # 0.18f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x406a3d71    # -1.17f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f6b851f    # 0.92f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x406a3d71    # -1.17f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_15
    move-object/from16 v16, v1

    const v13, -0x41e66666    # -0.15f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3ea3d70a    # 0.32f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x410a3d71    # -0.48f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3ea3d70a    # 0.32f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x410a3d71    # -0.48f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f3851ec    # 0.72f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4170a3d7    # -0.28f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f3851ec    # 0.72f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4170a3d7    # -0.28f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3fb33333    # 1.4f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3d4ccccd    # 0.05f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, -0x41800000    # -0.25f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f0a3d71    # 0.54f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40cf5c29    # -0.69f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f0a3d71    # 0.54f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40cf5c29    # -0.69f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f8a3d71    # 1.08f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x418a3d71    # -0.24f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_16
    move-object/from16 v16, v1

    const v13, 0x3dcccccd    # 0.1f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x400ccccd    # -1.9f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3f800000    # 1.0f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x0

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e75c28f    # 0.24f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x402b851f    # -1.66f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3edc28f6    # 0.43f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x404ccccd    # -1.4f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f19999a    # 0.6f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x402b851f    # -1.66f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f47ae14    # 0.78f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x404ccccd    # -1.4f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e75c28f    # 0.24f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x406e147b    # -1.14f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3edc28f6    # 0.43f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x409c28f6    # -0.89f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f19999a    # 0.6f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x406e147b    # -1.14f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f47ae14    # 0.78f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x409c28f6    # -0.89f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, -0x435c28f6    # -0.02f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x400147ae    # -1.99f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f8e147b    # 1.11f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x400147ae    # -1.99f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_17
    move-object/from16 v16, v1

    const v13, 0x3d75c28f    # 0.06f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3d75c28f    # 0.06f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40266666    # -1.7f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x3fa00000    # 1.25f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3fa00000    # 1.25f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40266666    # -1.7f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3d75c28f    # 0.06f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40266666    # -1.7f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3fa00000    # 1.25f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40266666    # -1.7f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e8f5c29    # 0.28f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, -0x40400000    # -1.5f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f866666    # 1.05f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x408a3d71    # -0.96f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3ef0a3d7    # 0.47f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x405eb852    # -1.26f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f59999a    # 0.85f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x405eb852    # -1.26f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_18
    move-object/from16 v16, v1

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x406ccccd    # -1.15f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x406ccccd    # -1.15f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e3851ec    # 0.18f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x400ccccd    # -1.9f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x406ccccd    # -1.15f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f5c28f6    # 0.86f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x400ccccd    # -1.9f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e19999a    # 0.15f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40066666    # -1.95f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f6b851f    # 0.92f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40066666    # -1.95f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const v13, 0x3f0a3d71    # 0.54f

    mul-float v13, v12, v13

    add-float v13, v10, v13

    move/from16 v23, v13

    const v13, -0x40428f5c    # -1.48f

    mul-float v14, v12, v13

    add-float v14, v11, v14

    const v15, 0x3e428f5c    # 0.19f

    mul-float v15, v12, v15

    move/from16 v13, v23

    move-object/from16 v16, v3

    sget-object v17, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v1, v13, v14, v15, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v17, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    goto/16 :goto_3

    :goto_2
    move-object/from16 v16, v1

    const/high16 v13, 0x0

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x0

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x404ccccd    # -1.4f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f47ae14    # 0.78f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f47ae14    # 0.78f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x404ccccd    # -1.4f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x3fc00000    # 1.5f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3fc00000    # 1.5f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x404ccccd    # -1.4f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, -0x420a3d71    # -0.12f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x404ccccd    # -1.4f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3fcccccd    # 1.6f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x404ccccd    # -1.4f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3dcccccd    # 0.1f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x404ccccd    # -1.4f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3ec7ae14    # 0.39f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x408ccccd    # -0.95f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3ec7ae14    # 0.39f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x408ccccd    # -0.95f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f30a3d7    # 0.69f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x404ccccd    # -1.4f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f63d70a    # 0.89f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x404ccccd    # -1.4f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f947ae1    # 1.16f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x408ccccd    # -0.95f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f947ae1    # 1.16f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x408ccccd    # -0.95f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3fb5c28f    # 1.42f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x404ccccd    # -1.4f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1

    :cond_19
    iget-object v9, v0, Le/e/a/internal/standard150/BikeRun$Track;->road:Landroid/graphics/Path;

    invoke-virtual {v9}, Landroid/graphics/Path;->reset()V

    const/high16 v10, 0x0

    invoke-virtual {v4, v10}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v11

    add-float v11, v11, v22

    invoke-virtual {v9, v10, v11}, Landroid/graphics/Path;->moveTo(FF)V

    const/16 v7, 0x8

    const/16 v8, 0x2d1

    :goto_4
    if-ge v7, v8, :cond_1a

    int-to-float v10, v7

    invoke-virtual {v4, v10}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v11

    add-float v11, v11, v22

    invoke-virtual {v9, v10, v11}, Landroid/graphics/Path;->lineTo(FF)V

    add-int/lit8 v7, v7, 0xc

    goto/16 :goto_4

    :cond_1a
    const/high16 v10, 0x44340000    # 720.0f

    move/from16 v11, v2

    invoke-virtual {v9, v10, v11}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v10, 0x0

    invoke-virtual {v9, v10, v11}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v9}, Landroid/graphics/Path;->close()V

    const v15, -0xe8d5db

    nop

    nop

    nop

    nop

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setColor(I)V

    const/16 v15, 0xff

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setAlpha(I)V

    sget-object v15, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-direct {v0, v1, v9, v3, v4}, Le/e/a/internal/standard150/BikeRun$Track;->drawTerrainWithoutHoles(Landroid/graphics/Canvas;Landroid/graphics/Path;Landroid/graphics/Paint;Le/e/a/internal/standard150/BikeRunModel;)V

    goto/16 :goto_d

    :goto_5
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v14

    const/4 v8, 0x0

    :goto_6
    if-ge v8, v14, :cond_1c

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;

    iget-boolean v9, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->gap:Z

    if-eqz v9, :cond_1b

    iget v10, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    iget v12, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    add-float v13, v10, v12

    invoke-virtual {v4, v10}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v11

    add-float v11, v11, v22

    iget v15, v0, Le/e/a/internal/standard150/BikeRun$Track;->background:I

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setColor(I)V

    const/16 v15, 0xff

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setAlpha(I)V

    move-object/from16 v16, v1

    move/from16 v17, v10

    move/from16 v18, v11

    move/from16 v19, v13

    move/from16 v20, v2

    move-object/from16 v21, v3

    nop

    move/from16 v15, v26

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v15, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v15, 0x40400000    # 3.0f

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    move-object/from16 v16, v1

    move/from16 v17, v10

    move/from16 v18, v11

    move/from16 v19, v10

    move/from16 v20, v2

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-float v10, v10, v12

    invoke-virtual {v4, v10}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v11

    add-float v11, v11, v22

    move-object/from16 v16, v1

    move/from16 v17, v10

    move/from16 v18, v11

    move/from16 v19, v10

    move/from16 v20, v2

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    sget-object v15, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    :cond_1b
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_6

    :cond_1c
    move/from16 v15, v26

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setColor(I)V

    const/16 v15, 0xff

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setAlpha(I)V

    sget-object v15, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v6, v4, Le/e/a/internal/standard150/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v27

    const/4 v8, 0x0

    :goto_7
    move/from16 v14, v27

    if-ge v8, v14, :cond_27

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;

    iget-boolean v9, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->gap:Z

    if-nez v9, :cond_26

    iget v10, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->x:F

    iget v12, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->width:F

    iget v14, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->height:F

    move/from16 v28, v14

    invoke-virtual {v4, v10}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v11

    add-float v11, v11, v22

    goto/32 :goto_c

    nop

    :goto_8
    const/high16 v14, 0x41900000    # 18.0f

    cmpg-float v9, v28, v14

    if-lez v9, :cond_25

    const/high16 v14, 0x42aa0000    # 85.0f

    cmpg-float v9, v28, v14

    if-gez v9, :cond_24

    float-to-int v9, v12

    and-int/lit8 v9, v9, 0x7

    const/4 v14, 0x0

    if-eq v9, v14, :cond_1d

    const/4 v14, 0x1

    if-eq v9, v14, :cond_1e

    const/4 v14, 0x2

    if-eq v9, v14, :cond_1f

    const/4 v14, 0x3

    if-eq v9, v14, :cond_20

    const/4 v14, 0x4

    if-eq v9, v14, :cond_21

    const/4 v14, 0x5

    if-eq v9, v14, :cond_22

    const/4 v14, 0x6

    if-eq v9, v14, :cond_23

    goto/16 :goto_9

    :cond_1d
    const v14, 0x3f19999a    # 0.6f

    mul-float v14, v28, v14

    sub-float v11, v11, v14

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v13, v12, v13

    add-float v13, v10, v13

    move/from16 v23, v13

    const/high16 v13, 0x0

    mul-float v14, v12, v13

    add-float v14, v11, v14

    const v15, 0x3e9eb852    # 0.31f

    mul-float v15, v12, v15

    move/from16 v13, v23

    move-object/from16 v16, v3

    sget-object v17, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v1, v13, v14, v15, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v17, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    move-object/from16 v16, v1

    const v13, 0x3e6147ae    # 0.22f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3e3851ec    # 0.18f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e0f5c29    # 0.14f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3eb33333    # 0.35f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f4ccccd    # 0.8f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3e3851ec    # 0.18f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f68f5c3    # 0.91f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3eb33333    # 0.35f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e8f5c29    # 0.28f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x420a3d71    # -0.12f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3dcccccd    # 0.1f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40f33333    # -0.55f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f3851ec    # 0.72f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x420a3d71    # -0.12f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f6b851f    # 0.92f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40f33333    # -0.55f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3eae147b    # 0.34f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x42b33333    # -0.05f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f266666    # 0.65f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x42b33333    # -0.05f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_b

    :cond_1e
    const/high16 v14, 0x3f800000    # 1.0f

    sub-float v11, v11, v28

    div-float v24, v28, v12

    move-object/from16 v16, v1

    const v13, 0x3ca3d70a    # 0.02f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f70a3d7    # 0.94f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f266666    # 0.65f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e19999a    # 0.15f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3e23d70a    # 0.16f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3eb33333    # 0.35f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3eae147b    # 0.34f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f23d70a    # 0.64f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3e23d70a    # 0.16f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f547ae1    # 0.83f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3eae147b    # 0.34f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e3851ec    # 0.18f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3f266666    # 0.65f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e3851ec    # 0.18f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f7ae148    # 0.98f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f547ae1    # 0.83f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3f266666    # 0.65f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f547ae1    # 0.83f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f7ae148    # 0.98f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_b

    :cond_1f
    const v14, 0x3ef5c28f    # 0.48f

    mul-float v14, v28, v14

    sub-float v11, v11, v14

    move-object/from16 v16, v1

    const v13, 0x3dcccccd    # 0.1f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x4147ae14    # -0.36f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f866666    # 1.05f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3e4ccccd    # 0.2f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e23d70a    # 0.16f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3e4ccccd    # 0.2f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e8a3d71    # 0.27f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3e8a3d71    # 0.27f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f5c28f6    # 0.86f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3e4ccccd    # 0.2f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f3d70a4    # 0.74f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3e8a3d71    # 0.27f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_b

    :cond_20
    sub-float v11, v11, v28

    div-float v24, v28, v12

    move-object/from16 v16, v1

    const/high16 v13, 0x0

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3f800000    # 1.0f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x3f800000    # 1.0f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3da3d70a    # 0.08f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3d8f5c29    # 0.07f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f666666    # 0.9f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f5c28f6    # 0.86f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f666666    # 0.9f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3d8f5c29    # 0.07f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3da3d70a    # 0.08f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f5c28f6    # 0.86f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_b

    :cond_21
    const v14, 0x3f266666    # 0.65f

    mul-float v14, v28, v14

    sub-float v11, v11, v14

    move-object/from16 v16, v1

    const v13, 0x3df5c28f    # 0.12f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x420a3d71    # -0.12f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f6147ae    # 0.88f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3e3851ec    # 0.18f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e6147ae    # 0.22f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x420a3d71    # -0.12f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3d75c28f    # 0.06f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4119999a    # -0.45f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f6147ae    # 0.88f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x420a3d71    # -0.12f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f851eb8    # 1.04f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x4119999a    # -0.45f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3eae147b    # 0.34f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x420a3d71    # -0.12f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3eae147b    # 0.34f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3e3851ec    # 0.18f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f266666    # 0.65f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x420a3d71    # -0.12f

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f266666    # 0.65f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3e3851ec    # 0.18f

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_b

    :cond_22
    const v14, 0x3f733333    # 0.95f

    mul-float v14, v28, v14

    sub-float v11, v11, v14

    div-float v24, v28, v12

    move-object/from16 v16, v1

    const v13, 0x3e99999a    # 0.3f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f3851ec    # 0.72f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f2b851f    # 0.67f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3ea3d70a    # 0.32f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3f2b851f    # 0.67f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e4ccccd    # 0.2f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f733333    # 0.95f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f30a3d7    # 0.69f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3f2b851f    # 0.67f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f51eb85    # 0.82f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f733333    # 0.95f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3ebd70a4    # 0.37f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x41fae148    # -0.13f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x415c28f6    # -0.32f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x415c28f6    # -0.32f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f266666    # 0.65f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x41fae148    # -0.13f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_b

    :cond_23
    sub-float v11, v11, v28

    div-float v24, v28, v12

    move-object/from16 v16, v1

    const v13, 0x3e0f5c29    # 0.14f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f570a3d    # 0.84f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f75c28f    # 0.96f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e0f5c29    # 0.14f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3e6b851f    # 0.23f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f570a3d    # 0.84f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3e6b851f    # 0.23f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e0f5c29    # 0.14f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3f3ae148    # 0.73f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f570a3d    # 0.84f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f3ae148    # 0.73f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e8f5c29    # 0.28f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3eeb851f    # 0.46f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f333333    # 0.7f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3eeb851f    # 0.46f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_b

    :goto_9
    const v14, 0x3f6147ae    # 0.88f

    mul-float v14, v28, v14

    sub-float v11, v11, v14

    div-float v24, v28, v12

    move-object/from16 v16, v1

    const v13, 0x3d23d70a    # 0.04f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f19999a    # 0.6f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f28f5c3    # 0.66f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f19999a    # 0.6f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x3e800000    # 0.25f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f733333    # 0.95f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f28f5c3    # 0.66f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3dcccccd    # 0.1f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3f2b851f    # 0.67f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e6b851f    # 0.23f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f6147ae    # 0.88f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x3f400000    # 0.75f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3f2b851f    # 0.67f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f666666    # 0.9f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f6147ae    # 0.88f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_b

    :cond_24
    sub-float v11, v11, v28

    div-float v24, v28, v12

    move-object/from16 v16, v1

    const v13, 0x3e2e147b    # 0.17f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const/high16 v13, 0x0

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f51eb85    # 0.82f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f333333    # 0.7f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e6147ae    # 0.22f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3e051eb8    # 0.13f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3ec28f5c    # 0.38f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3e99999a    # 0.3f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f1c28f6    # 0.61f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3e051eb8    # 0.13f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f47ae14    # 0.78f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3e99999a    # 0.3f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e99999a    # 0.3f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3f333333    # 0.7f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e6b851f    # 0.23f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x3f800000    # 1.0f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f3ae148    # 0.73f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3f333333    # 0.7f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f4ccccd    # 0.8f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const/high16 v13, 0x3f800000    # 1.0f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x42b33333    # -0.05f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x41947ae1    # -0.23f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_b

    :cond_25
    :goto_a
    const/high16 v14, 0x41400000    # 12.0f

    sub-float v11, v11, v14

    div-float v24, v28, v12

    move-object/from16 v16, v1

    const v13, 0x3ca3d70a    # 0.02f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3f7ae148    # 0.98f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3e4ccccd    # 0.2f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3e23d70a    # 0.16f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e4ccccd    # 0.2f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3e23d70a    # 0.16f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f547ae1    # 0.83f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3e23d70a    # 0.16f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3f547ae1    # 0.83f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3e23d70a    # 0.16f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f7ae148    # 0.98f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f7ae148    # 0.98f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3ca3d70a    # 0.02f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3f7ae148    # 0.98f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f7ae148    # 0.98f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3f7ae148    # 0.98f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3e99999a    # 0.3f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, 0x3e23d70a    # 0.16f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, -0x40f33333    # -0.55f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v16, v1

    const v13, 0x3ef5c28f    # 0.48f

    mul-float v17, v12, v13

    add-float v17, v10, v17

    const v13, -0x40f33333    # -0.55f

    mul-float v13, v13, v24

    mul-float v18, v12, v13

    add-float v18, v11, v18

    const v13, 0x3f28f5c3    # 0.66f

    mul-float v19, v12, v13

    add-float v19, v10, v19

    const v13, 0x3e23d70a    # 0.16f

    mul-float v13, v13, v24

    mul-float v20, v12, v13

    add-float v20, v11, v20

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_26
    :goto_b
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_7

    :cond_27
    const/16 v15, 0xff

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void

    :goto_c
    const/4 v9, 0x0

    cmpg-float v9, v28, v9

    if-gez v9, :cond_28

    const v13, 0x3f000000    # 0.5f

    mul-float v13, v12, v13

    add-float v25, v10, v13

    add-float v26, v11, v28

    float-to-int v9, v12

    rem-int/lit8 v9, v9, 0x6

    int-to-float v9, v9

    const v13, 0x41100000    # 9.0f

    add-float v13, v9, v13

    move-object/from16 v16, v1

    move/from16 v17, v25

    move/from16 v18, v26

    move/from16 v19, v13

    move-object/from16 v20, v3

    invoke-virtual/range {v16 .. v20}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const v13, 0x41c80000    # 25.0f

    sub-float v17, v25, v13

    const v13, 0x40e00000    # 7.0f

    add-float v18, v26, v13

    move/from16 v19, v25

    move/from16 v20, v26

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const v13, 0x41c80000    # 25.0f

    add-float v17, v25, v13

    const v13, 0x40e00000    # 7.0f

    add-float v18, v26, v13

    move/from16 v19, v25

    move/from16 v20, v26

    move-object/from16 v21, v3

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/32 :goto_b

    :cond_28
    iget-boolean v9, v7, Le/e/a/internal/standard150/BikeRunModel$Hazard;->spikes:Z

    if-nez v9, :cond_29

    goto/32 :goto_8

    :cond_29
    goto/32 :goto_a

    :goto_d
    const/4 v7, 0x0

    iget v10, v4, Le/e/a/internal/standard150/BikeRunModel;->distance:F

    const/high16 v27, 0x42400000    # 48.0f

    const/high16 v28, 0x44340000    # 720.0f

    :goto_e
    cmpl-float v8, v7, v28

    if-gtz v8, :cond_32

    if-eqz v8, :cond_31

    add-float v13, v10, v7

    invoke-virtual {v4, v13}, Le/e/a/internal/standard150/BikeRunModel;->terrainGapAt(F)Z

    move-result v9

    if-eqz v9, :cond_30

    sub-float v11, v7, v27

    const/4 v13, 0x0

    invoke-static {v11, v13}, Ljava/lang/Math;->max(FF)F

    move-result v11

    move v12, v7

    const/4 v15, 0x0

    :goto_f
    const/4 v8, 0x7

    if-ge v15, v8, :cond_2b

    add-float v13, v11, v12

    const/high16 v14, 0x3f000000    # 0.5f

    mul-float v13, v13, v14

    add-float v14, v10, v13

    invoke-virtual {v4, v14}, Le/e/a/internal/standard150/BikeRunModel;->terrainGapAt(F)Z

    move-result v9

    if-eqz v9, :cond_2a

    move v12, v13

    goto/32 :goto_10

    :cond_2a
    move v11, v13

    :goto_10
    add-int/lit8 v15, v15, 0x1

    goto/32 :goto_f

    :cond_2b
    move v11, v12

    :cond_2c
    add-float v7, v7, v27

    cmpl-float v8, v7, v28

    if-gtz v8, :cond_2f

    add-float v13, v10, v7

    invoke-virtual {v4, v13}, Le/e/a/internal/standard150/BikeRunModel;->terrainGapAt(F)Z

    move-result v9

    if-nez v9, :cond_2c

    sub-float v13, v7, v27

    move v12, v7

    const/4 v15, 0x0

    :goto_11
    const/4 v8, 0x7

    if-ge v15, v8, :cond_2e

    add-float v14, v13, v12

    const/high16 v9, 0x3f000000    # 0.5f

    mul-float v14, v14, v9

    add-float v9, v10, v14

    invoke-virtual {v4, v9}, Le/e/a/internal/standard150/BikeRunModel;->terrainGapAt(F)Z

    move-result v9

    if-eqz v9, :cond_2d

    move v13, v14

    goto/32 :goto_12

    :cond_2d
    move v12, v14

    :goto_12
    add-int/lit8 v15, v15, 0x1

    goto/32 :goto_11

    :cond_2e
    goto/32 :goto_13

    :cond_2f
    move/from16 v12, v28

    :goto_13
    invoke-virtual {v4, v11}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v14

    invoke-virtual {v4, v12}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v13

    invoke-static {v14, v13}, Ljava/lang/Math;->min(FF)F

    move-result v14

    add-float v13, v11, v12

    const/high16 v9, 0x3f000000    # 0.5f

    mul-float v13, v13, v9

    invoke-virtual {v4, v13}, Le/e/a/internal/standard150/BikeRunModel;->groundAt(F)F

    move-result v13

    invoke-static {v14, v13}, Ljava/lang/Math;->min(FF)F

    move-result v14

    add-float v14, v14, v22

    const/high16 v9, 0x40000000    # 2.0f

    sub-float v14, v14, v9

    iget v15, v0, Le/e/a/internal/standard150/BikeRun$Track;->background:I

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setColor(I)V

    move-object/from16 v16, v1

    move/from16 v17, v11

    move/from16 v18, v14

    move/from16 v19, v12

    move/from16 v20, v2

    move-object/from16 v21, v3

    nop

    goto/32 :goto_14

    :cond_30
    :goto_14
    add-float v7, v7, v27

    goto/32 :goto_e

    :cond_31
    const/high16 v9, 0x3c000000    # 0.0078125f

    sub-float v7, v28, v9

    goto/32 :goto_e

    :cond_32
    iget-object v6, v4, Le/e/a/internal/standard150/BikeRunModel;->hazards:Ljava/util/ArrayList;

    goto/32 :goto_15

    :goto_15
    goto/32 :goto_5
.end method

.method showRecords()V
    .registers 6

    .line 319
    iget-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->historyOpen:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->active:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 320
    :cond_0
    invoke-virtual {p0}, Le/e/a/internal/standard150/BikeRun$Track;->saveResult()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->paused:Z

    iput-boolean v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->historyOpen:Z

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->last:J

    .line 321
    invoke-virtual {p0}, Le/e/a/internal/standard150/BikeRun$Track;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 322
    new-instance v1, Le/e/a/internal/standard150/BikeRun$RecordsPane;

    invoke-direct {v1, p0}, Le/e/a/internal/standard150/BikeRun$RecordsPane;-><init>(Le/e/a/internal/standard150/BikeRun$Track;)V

    .line 323
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "Run records"

    const-string/jumbo v3, "\u9a91\u884c\u8bb0\u5f55"

    const-string/jumbo v4, "\u8d70\u884c\u8a18\u9332"

    invoke-virtual {p0, v4, v0, v3}, Le/e/a/internal/standard150/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 324
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Close"

    const-string v2, "\u5173\u95ed"

    const-string/jumbo v3, "\u9589\u3058\u308b"

    invoke-virtual {p0, v3, v1, v2}, Le/e/a/internal/standard150/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 325
    new-instance v1, Le/e/a/internal/standard150/BikeRun$Track$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Le/e/a/internal/standard150/BikeRun$Track$$ExternalSyntheticLambda0;-><init>(Le/e/a/internal/standard150/BikeRun$Track;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 326
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    invoke-virtual {p0}, Le/e/a/internal/standard150/BikeRun$Track;->invalidate()V

    :cond_1
    :goto_0
    return-void
.end method

.method text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .line 284
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRun$Track;->prefs:Landroid/content/SharedPreferences;

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

    if-nez v1, :cond_7

    const-string v1, "en"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_2

    .line 286
    :cond_0
    const-string v1, "2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "zh"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, "chinese"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    .line 287
    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "ja"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 288
    :cond_2
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 289
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    move-object p1, p3

    goto :goto_0

    :cond_3
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_4

    goto :goto_0

    :cond_4
    move-object p1, p2

    :cond_5
    :goto_0
    return-object p1

    :cond_6
    :goto_1
    return-object p3

    :cond_7
    :goto_2
    return-object p2
.end method
