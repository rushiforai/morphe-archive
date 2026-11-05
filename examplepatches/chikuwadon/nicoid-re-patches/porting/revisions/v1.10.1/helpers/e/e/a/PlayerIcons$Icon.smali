.class final Le/e/a/PlayerIcons$Icon;
.super Landroid/graphics/drawable/Drawable;
.source "PlayerIcons.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlayerIcons;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Icon"
.end annotation


# instance fields
.field alpha:I

.field ink:I

.field final name:Ljava/lang/String;

.field owner:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final paint:Landroid/graphics/Paint;

.field final surface:Z


# direct methods
.method constructor <init>(Ljava/lang/String;Z)V
    .registers 5

    .line 40
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 39
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/16 v0, 0xff

    iput v0, p0, Le/e/a/PlayerIcons$Icon;->alpha:I

    const/4 v0, -0x1

    iput v0, p0, Le/e/a/PlayerIcons$Icon;->ink:I

    .line 40
    iput-object p1, p0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    iput-boolean p2, p0, Le/e/a/PlayerIcons$Icon;->surface:Z

    return-void
.end method

.method private varargs line(Landroid/graphics/Canvas;[F)V
    .registers 7

    .line 43
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    const/4 v1, 0x0

    aget v1, p2, v1

    const/4 v2, 0x1

    aget v2, p2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const/4 v1, 0x2

    :goto_f
    array-length v2, p2

    if-lt v1, v2, :cond_18

    iget-object p2, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void

    :cond_18
    aget v2, p2, v1

    add-int/lit8 v3, v1, 0x1

    aget v3, p2, v3

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    add-int/lit8 v1, v1, 0x2

    goto :goto_f
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 14

    .line 44
    invoke-virtual {p0}, Le/e/a/PlayerIcons$Icon;->getBounds()Landroid/graphics/Rect;

    move-result-object v8

    iget-boolean v0, p0, Le/e/a/PlayerIcons$Icon;->surface:Z

    if-eqz v0, :cond_4f

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    const-string v1, "info"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    const-string v1, "commentpost"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4f

    :cond_1c
    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x77000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3e23d70a    # 0.16f

    mul-float v6, v0, v1

    iget v0, v8, Landroid/graphics/Rect;->left:I

    int-to-float v1, v0

    iget v0, v8, Landroid/graphics/Rect;->top:I

    int-to-float v2, v0

    iget v0, v8, Landroid/graphics/Rect;->right:I

    int-to-float v3, v0

    iget v0, v8, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v0

    iget-object v7, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    move v5, v6

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    :cond_4f
    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    const-string v1, "play"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_60

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    const-string v1, "pause"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    :cond_60
    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Le/e/a/PlayerIcons$Icon;->glyphScale()F

    move-result v1

    mul-float/2addr v0, v1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v9

    invoke-virtual {v8}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v0, v2

    sub-float/2addr v1, v2

    invoke-virtual {v8}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v3

    sub-float/2addr v3, v2

    invoke-virtual {p1, v1, v3}, Landroid/graphics/Canvas;->translate(FF)V

    const/high16 v1, 0x41c00000    # 24.0f

    div-float/2addr v0, v1

    invoke-virtual {p1, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    iget v1, p0, Le/e/a/PlayerIcons$Icon;->ink:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    iget v1, p0, Le/e/a/PlayerIcons$Icon;->alpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const v1, 0x3fe66666    # 1.8f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 45
    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x10

    const/16 v3, 0x8

    const/high16 v4, 0x40e00000    # 7.0f

    const/4 v5, 0x4

    const/high16 v6, 0x41400000    # 12.0f

    sparse-switch v1, :sswitch_data_424

    :goto_ca
    goto/16 :goto_3ff

    :sswitch_cc
    const-string v1, "commentpost"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d5

    goto :goto_ca

    .line 56
    :cond_d5
    new-array v0, v2, [F

    fill-array-data v0, :array_46e

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v0, v5, [F

    fill-array-data v0, :array_492

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v0, v5, [F

    fill-array-data v0, :array_49e

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    goto/16 :goto_420

    .line 45
    :sswitch_ef
    const-string v1, "commentoff"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3a1

    goto :goto_ca

    :sswitch_f8
    const-string v1, "brightness"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_101

    goto :goto_ca

    .line 49
    :cond_101
    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40800000    # 4.0f

    invoke-virtual {p1, v6, v6, v1, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/4 v0, 0x0

    :goto_109
    if-lt v0, v3, :cond_10d

    goto/16 :goto_420

    :cond_10d
    int-to-double v1, v0

    const-wide v7, 0x400921fb54442d18L    # Math.PI

    mul-double/2addr v1, v7

    const-wide/high16 v7, 0x4010000000000000L    # 4.0

    div-double/2addr v1, v7

    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    double-to-float v7, v7

    mul-float/2addr v7, v4

    add-float/2addr v7, v6

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v10

    double-to-float v8, v10

    mul-float/2addr v8, v4

    add-float/2addr v8, v6

    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v10

    double-to-float v10, v10

    const/high16 v11, 0x41200000    # 10.0f

    mul-float/2addr v10, v11

    add-float/2addr v10, v6

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v1

    double-to-float v1, v1

    mul-float/2addr v1, v11

    add-float/2addr v1, v6

    new-array v2, v5, [F

    const/4 v11, 0x0

    aput v7, v2, v11

    const/4 v7, 0x1

    aput v8, v2, v7

    const/4 v7, 0x2

    aput v10, v2, v7

    const/4 v7, 0x3

    aput v1, v2, v7

    invoke-direct {p0, p1, v2}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_109

    .line 45
    :sswitch_149
    const-string v1, "popup"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_153

    goto/16 :goto_ca

    .line 53
    :cond_153
    const/high16 v6, 0x40000000    # 2.0f

    iget-object v7, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40400000    # 3.0f

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x41a80000    # 21.0f

    const/high16 v4, 0x41a00000    # 20.0f

    const/high16 v5, 0x40000000    # 2.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v6, 0x3f800000    # 1.0f

    iget-object v7, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41400000    # 12.0f

    const/high16 v2, 0x41400000    # 12.0f

    const/high16 v3, 0x41980000    # 19.0f

    const/high16 v4, 0x41900000    # 18.0f

    const/high16 v5, 0x3f800000    # 1.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    goto/16 :goto_420

    .line 45
    :sswitch_180
    const-string v1, "pause"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18a

    goto/16 :goto_ca

    .line 51
    :cond_18a
    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, -0x56000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x3f400000    # 0.75f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/high16 v6, 0x3f800000    # 1.0f

    iget-object v7, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40c00000    # 6.0f

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v3, 0x41200000    # 10.0f

    const/high16 v4, 0x41a80000    # 21.0f

    const/high16 v5, 0x3f800000    # 1.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    iget-object v7, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41600000    # 14.0f

    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    iget v1, p0, Le/e/a/PlayerIcons$Icon;->ink:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    iget v1, p0, Le/e/a/PlayerIcons$Icon;->alpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v7, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40c00000    # 6.0f

    const/high16 v3, 0x41200000    # 10.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    iget-object v7, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41600000    # 14.0f

    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    goto/16 :goto_420

    .line 45
    :sswitch_1e4
    const-string v1, "muted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2d9

    goto/16 :goto_ca

    :sswitch_1ee
    const-string v1, "close"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1f8

    goto/16 :goto_ca

    .line 57
    :cond_1f8
    new-array v0, v5, [F

    fill-array-data v0, :array_4aa

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v0, v5, [F

    fill-array-data v0, :array_4b6

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    goto/16 :goto_420

    .line 45
    :sswitch_20a
    const-string v1, "prev"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_277

    goto/16 :goto_ca

    :sswitch_214
    const-string v1, "play"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21e

    goto/16 :goto_ca

    .line 50
    :cond_21e
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    const/high16 v1, 0x40c00000    # 6.0f

    const/high16 v2, 0x40400000    # 3.0f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-virtual {v0, v2, v6}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v2, 0x41a80000    # 21.0f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    iget-object v1, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, -0x56000000

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x3f400000    # 0.75f

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget-object v1, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    iget v2, p0, Le/e/a/PlayerIcons$Icon;->ink:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    iget v2, p0, Le/e/a/PlayerIcons$Icon;->alpha:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v1, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_420

    .line 45
    :sswitch_26d
    const-string v1, "next"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_277

    goto/16 :goto_ca

    .line 52
    :cond_277
    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    const-string v1, "next"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object v1, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    if-eqz v0, :cond_28f

    const/4 v4, 0x5

    goto :goto_291

    :cond_28f
    const/16 v4, 0x13

    :goto_291
    int-to-float v4, v4

    const/high16 v7, 0x40a00000    # 5.0f

    invoke-virtual {v1, v4, v7}, Landroid/graphics/Path;->moveTo(FF)V

    if-eqz v0, :cond_29a

    goto :goto_29b

    :cond_29a
    move v2, v3

    :goto_29b
    int-to-float v2, v2

    invoke-virtual {v1, v2, v6}, Landroid/graphics/Path;->lineTo(FF)V

    if-eqz v0, :cond_2a3

    const/4 v2, 0x5

    goto :goto_2a5

    :cond_2a3
    const/16 v2, 0x13

    :goto_2a5
    int-to-float v2, v2

    const/high16 v3, 0x41980000    # 19.0f

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    iget-object v2, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    if-eqz v0, :cond_2b7

    const/16 v5, 0x11

    :cond_2b7
    int-to-float v1, v5

    if-eqz v0, :cond_2bd

    const/16 v0, 0x14

    goto :goto_2be

    :cond_2bd
    const/4 v0, 0x7

    :goto_2be
    int-to-float v3, v0

    const/high16 v6, 0x3f800000    # 1.0f

    iget-object v7, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40a00000    # 5.0f

    const/high16 v4, 0x41980000    # 19.0f

    const/high16 v5, 0x3f800000    # 1.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    goto/16 :goto_420

    .line 45
    :sswitch_2cf
    const-string v1, "mute"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2d9

    goto/16 :goto_ca

    .line 46
    :cond_2d9
    const/16 v0, 0xe

    new-array v0, v0, [F

    fill-array-data v0, :array_4c2

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v0, v5, [F

    fill-array-data v0, :array_4e2

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v0, v5, [F

    fill-array-data v0, :array_4ee

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    goto/16 :goto_420

    .line 45
    :sswitch_2f5
    const-string v1, "info"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2ff

    goto/16 :goto_ca

    .line 58
    :cond_2ff
    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41100000    # 9.0f

    invoke-virtual {p1, v6, v6, v1, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    new-array v0, v5, [F

    fill-array-data v0, :array_4fa

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v0, 0x3f8ccccd    # 1.1f

    iget-object v1, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v4, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_420

    .line 45
    :sswitch_31f
    const-string v1, "repeaton"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_333

    goto/16 :goto_ca

    :sswitch_329
    const-string v1, "repeatoff"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_333

    goto/16 :goto_ca

    .line 54
    :cond_333
    new-array v0, v3, [F

    fill-array-data v0, :array_506

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v0, v3, [F

    fill-array-data v0, :array_51a

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    const-string v1, "off"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_420

    new-array v0, v5, [F

    fill-array-data v0, :array_52e

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    goto/16 :goto_420

    .line 45
    :sswitch_357
    const-string v1, "volume"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_361

    goto/16 :goto_ca

    .line 48
    :cond_361
    const/16 v0, 0xe

    new-array v0, v0, [F

    fill-array-data v0, :array_53a

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    const/4 v7, 0x0

    iget-object v8, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41100000    # 9.0f

    const/high16 v2, 0x40c00000    # 6.0f

    const/high16 v3, 0x41a80000    # 21.0f

    const/high16 v4, 0x41900000    # 18.0f

    const/high16 v5, -0x3da40000    # -55.0f

    const/high16 v6, 0x42dc0000    # 110.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v8}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    iget-object v8, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41400000    # 12.0f

    const/high16 v2, 0x41100000    # 9.0f

    const/high16 v3, 0x41900000    # 18.0f

    const/high16 v4, 0x41700000    # 15.0f

    invoke-virtual/range {v0 .. v8}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    goto/16 :goto_420

    .line 45
    :sswitch_38d
    const-string v1, "background"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3d7

    goto/16 :goto_ca

    :sswitch_397
    const-string v1, "commenton"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3a1

    goto/16 :goto_ca

    .line 55
    :cond_3a1
    new-array v0, v2, [F

    fill-array-data v0, :array_55a

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    const-string v1, "off"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3bc

    new-array v0, v5, [F

    fill-array-data v0, :array_57e

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    goto :goto_420

    :cond_3bc
    new-array v0, v5, [F

    fill-array-data v0, :array_58a

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v0, v5, [F

    fill-array-data v0, :array_596

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    goto :goto_420

    .line 45
    :sswitch_3cd
    const-string v1, "headphones"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3d7

    goto/16 :goto_ca

    .line 47
    :cond_3d7
    const/4 v7, 0x0

    iget-object v8, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40800000    # 4.0f

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v3, 0x41a00000    # 20.0f

    const/high16 v4, 0x41a80000    # 21.0f

    const/high16 v5, 0x43340000    # 180.0f

    const/high16 v6, 0x43340000    # 180.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v8}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    const/16 v0, 0xa

    new-array v0, v0, [F

    fill-array-data v0, :array_5a2

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    const/16 v0, 0xa

    new-array v0, v0, [F

    fill-array-data v0, :array_5ba

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    goto :goto_420

    .line 59
    :goto_3ff
    const/4 v0, 0x6

    new-array v1, v0, [F

    fill-array-data v1, :array_5d2

    invoke-direct {p0, p1, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v1, v0, [F

    fill-array-data v1, :array_5e2

    invoke-direct {p0, p1, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v1, v0, [F

    fill-array-data v1, :array_5f2

    invoke-direct {p0, p1, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v0, v0, [F

    fill-array-data v0, :array_602

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    .line 60
    :cond_420
    :goto_420
    invoke-virtual {p1, v9}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 61
    return-void

    :sswitch_data_424
    .sparse-switch
        -0x77dca95b -> :sswitch_3cd
        -0x591c1f82 -> :sswitch_397
        -0x4f67aad2 -> :sswitch_38d
        -0x305518e6 -> :sswitch_357
        -0x270f2a0c -> :sswitch_329
        -0x1a08bf46 -> :sswitch_31f
        0x3164ae -> :sswitch_2f5
        0x335219 -> :sswitch_2cf
        0x338af3 -> :sswitch_26d
        0x348b34 -> :sswitch_214
        0x34a233 -> :sswitch_20a
        0x5a5ddf8 -> :sswitch_1ee
        0x636f16b -> :sswitch_1e4
        0x65825f6 -> :sswitch_180
        0x65e70ac -> :sswitch_149
        0x26a22c51 -> :sswitch_f8
        0x35982eb0 -> :sswitch_ef
        0x7d6e3f7f -> :sswitch_cc
    .end sparse-switch

    :array_46e
    .array-data 4
        0x40800000    # 4.0f
        0x40a00000    # 5.0f
        0x41a00000    # 20.0f
        0x40a00000    # 5.0f
        0x41a00000    # 20.0f
        0x41800000    # 16.0f
        0x41300000    # 11.0f
        0x41800000    # 16.0f
        0x40c00000    # 6.0f
        0x41a80000    # 21.0f
        0x40c00000    # 6.0f
        0x41800000    # 16.0f
        0x40800000    # 4.0f
        0x41800000    # 16.0f
        0x40800000    # 4.0f
        0x40a00000    # 5.0f
    .end array-data

    :array_492
    .array-data 4
        0x41000000    # 8.0f
        0x41200000    # 10.0f
        0x41800000    # 16.0f
        0x41200000    # 10.0f
    .end array-data

    :array_49e
    .array-data 4
        0x41400000    # 12.0f
        0x40e00000    # 7.0f
        0x41400000    # 12.0f
        0x41500000    # 13.0f
    .end array-data

    :array_4aa
    .array-data 4
        0x40900000    # 4.5f
        0x40900000    # 4.5f
        0x419c0000    # 19.5f
        0x419c0000    # 19.5f
    .end array-data

    :array_4b6
    .array-data 4
        0x419c0000    # 19.5f
        0x40900000    # 4.5f
        0x40900000    # 4.5f
        0x419c0000    # 19.5f
    .end array-data

    :array_4c2
    .array-data 4
        0x40400000    # 3.0f
        0x41100000    # 9.0f
        0x40e00000    # 7.0f
        0x41100000    # 9.0f
        0x41400000    # 12.0f
        0x40a00000    # 5.0f
        0x41400000    # 12.0f
        0x41980000    # 19.0f
        0x40e00000    # 7.0f
        0x41700000    # 15.0f
        0x40400000    # 3.0f
        0x41700000    # 15.0f
        0x40400000    # 3.0f
        0x41100000    # 9.0f
    .end array-data

    :array_4e2
    .array-data 4
        0x41800000    # 16.0f
        0x41100000    # 9.0f
        0x41b00000    # 22.0f
        0x41700000    # 15.0f
    .end array-data

    :array_4ee
    .array-data 4
        0x41b00000    # 22.0f
        0x41100000    # 9.0f
        0x41800000    # 16.0f
        0x41700000    # 15.0f
    .end array-data

    :array_4fa
    .array-data 4
        0x41400000    # 12.0f
        0x41300000    # 11.0f
        0x41400000    # 12.0f
        0x41880000    # 17.0f
    .end array-data

    :array_506
    .array-data 4
        0x40800000    # 4.0f
        0x41100000    # 9.0f
        0x40800000    # 4.0f
        0x40c00000    # 6.0f
        0x41a00000    # 20.0f
        0x40c00000    # 6.0f
        0x41880000    # 17.0f
        0x40400000    # 3.0f
    .end array-data

    :array_51a
    .array-data 4
        0x41a00000    # 20.0f
        0x41700000    # 15.0f
        0x41a00000    # 20.0f
        0x41900000    # 18.0f
        0x40800000    # 4.0f
        0x41900000    # 18.0f
        0x40e00000    # 7.0f
        0x41a80000    # 21.0f
    .end array-data

    :array_52e
    .array-data 4
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x41a80000    # 21.0f
        0x41a80000    # 21.0f
    .end array-data

    :array_53a
    .array-data 4
        0x40400000    # 3.0f
        0x41100000    # 9.0f
        0x40e00000    # 7.0f
        0x41100000    # 9.0f
        0x41400000    # 12.0f
        0x40a00000    # 5.0f
        0x41400000    # 12.0f
        0x41980000    # 19.0f
        0x40e00000    # 7.0f
        0x41700000    # 15.0f
        0x40400000    # 3.0f
        0x41700000    # 15.0f
        0x40400000    # 3.0f
        0x41100000    # 9.0f
    .end array-data

    :array_55a
    .array-data 4
        0x40800000    # 4.0f
        0x40800000    # 4.0f
        0x41a00000    # 20.0f
        0x40800000    # 4.0f
        0x41a00000    # 20.0f
        0x41880000    # 17.0f
        0x41300000    # 11.0f
        0x41880000    # 17.0f
        0x40c00000    # 6.0f
        0x41a80000    # 21.0f
        0x40c00000    # 6.0f
        0x41880000    # 17.0f
        0x40800000    # 4.0f
        0x41880000    # 17.0f
        0x40800000    # 4.0f
        0x40800000    # 4.0f
    .end array-data

    :array_57e
    .array-data 4
        0x40400000    # 3.0f
        0x40000000    # 2.0f
        0x41b00000    # 22.0f
        0x41a80000    # 21.0f
    .end array-data

    :array_58a
    .array-data 4
        0x41000000    # 8.0f
        0x41100000    # 9.0f
        0x41800000    # 16.0f
        0x41100000    # 9.0f
    .end array-data

    :array_596
    .array-data 4
        0x41000000    # 8.0f
        0x41500000    # 13.0f
        0x41600000    # 14.0f
        0x41500000    # 13.0f
    .end array-data

    :array_5a2
    .array-data 4
        0x40800000    # 4.0f
        0x41400000    # 12.0f
        0x40800000    # 4.0f
        0x41a00000    # 20.0f
        0x41000000    # 8.0f
        0x41a00000    # 20.0f
        0x41000000    # 8.0f
        0x41400000    # 12.0f
        0x40800000    # 4.0f
        0x41400000    # 12.0f
    .end array-data

    :array_5ba
    .array-data 4
        0x41a00000    # 20.0f
        0x41400000    # 12.0f
        0x41a00000    # 20.0f
        0x41a00000    # 20.0f
        0x41800000    # 16.0f
        0x41a00000    # 20.0f
        0x41800000    # 16.0f
        0x41400000    # 12.0f
        0x41a00000    # 20.0f
        0x41400000    # 12.0f
    .end array-data

    :array_5d2
    .array-data 4
        0x41100000    # 9.0f
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x41100000    # 9.0f
    .end array-data

    :array_5e2
    .array-data 4
        0x41700000    # 15.0f
        0x40400000    # 3.0f
        0x41a80000    # 21.0f
        0x40400000    # 3.0f
        0x41a80000    # 21.0f
        0x41100000    # 9.0f
    .end array-data

    :array_5f2
    .array-data 4
        0x40400000    # 3.0f
        0x41700000    # 15.0f
        0x40400000    # 3.0f
        0x41a80000    # 21.0f
        0x41100000    # 9.0f
        0x41a80000    # 21.0f
    .end array-data

    :array_602
    .array-data 4
        0x41a80000    # 21.0f
        0x41700000    # 15.0f
        0x41a80000    # 21.0f
        0x41a80000    # 21.0f
        0x41700000    # 15.0f
        0x41a80000    # 21.0f
    .end array-data
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .registers 8

    .line 62
    iget-object v2, p0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    iget-boolean v3, p0, Le/e/a/PlayerIcons$Icon;->surface:Z

    iget v4, p0, Le/e/a/PlayerIcons$Icon;->ink:I

    iget v5, p0, Le/e/a/PlayerIcons$Icon;->alpha:I

    new-instance v6, Le/e/a/PlayerIcons$Icon$1;

    move-object v0, v6

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Le/e/a/PlayerIcons$Icon$1;-><init>(Le/e/a/PlayerIcons$Icon;Ljava/lang/String;ZII)V

    return-object v6
.end method

.method public getOpacity()I
    .registers 2

    .line 63
    const/4 v0, -0x3

    return v0
.end method

.method glyphScale()F
    .registers 2

    .line 42
    invoke-virtual {p0}, Le/e/a/PlayerIcons$Icon;->iconOwner()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlayerIcons;->fullscreenIcon(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_e

    const v0, 0x3f1eb852    # 0.62f

    goto :goto_11

    :cond_e
    const v0, 0x3f51eb85    # 0.82f

    :goto_11
    return v0
.end method

.method iconOwner()Landroid/view/View;
    .registers 4

    .line 41
    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->owner:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_d

    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    return-object v0

    :cond_d
    invoke-virtual {p0}, Le/e/a/PlayerIcons$Icon;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    const/4 v1, 0x0

    :goto_12
    const/16 v2, 0x8

    if-ge v1, v2, :cond_33

    if-nez v0, :cond_19

    goto :goto_33

    :cond_19
    instance-of v2, v0, Landroid/view/View;

    if-eqz v2, :cond_20

    check-cast v0, Landroid/view/View;

    return-object v0

    :cond_20
    instance-of v2, v0, Landroid/graphics/drawable/Drawable;

    if-nez v2, :cond_25

    goto :goto_33

    :cond_25
    move-object v2, v0

    check-cast v2, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v2

    if-ne v2, v0, :cond_2f

    goto :goto_33

    :cond_2f
    add-int/lit8 v1, v1, 0x1

    move-object v0, v2

    goto :goto_12

    :cond_33
    :goto_33
    const/4 v0, 0x0

    return-object v0
.end method

.method public setAlpha(I)V
    .registers 2

    .line 63
    iput p1, p0, Le/e/a/PlayerIcons$Icon;->alpha:I

    invoke-virtual {p0}, Le/e/a/PlayerIcons$Icon;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 63
    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Le/e/a/PlayerIcons$Icon;->invalidateSelf()V

    return-void
.end method
