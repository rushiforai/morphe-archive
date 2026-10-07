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

.field final paint:Landroid/graphics/Paint;

.field final surface:Z


# direct methods
.method constructor <init>(Ljava/lang/String;Z)V
    .registers 5

    .line 23
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 22
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/16 v0, 0xff

    iput v0, p0, Le/e/a/PlayerIcons$Icon;->alpha:I

    const/4 v0, -0x1

    iput v0, p0, Le/e/a/PlayerIcons$Icon;->ink:I

    .line 23
    iput-object p1, p0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    iput-boolean p2, p0, Le/e/a/PlayerIcons$Icon;->surface:Z

    return-void
.end method

.method private varargs line(Landroid/graphics/Canvas;[F)V
    .registers 7

    .line 24
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

    if-ge v1, v2, :cond_1e

    aget v2, p2, v1

    add-int/lit8 v3, v1, 0x1

    aget v3, p2, v3

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    add-int/lit8 v1, v1, 0x2

    goto :goto_f

    :cond_1e
    iget-object p2, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 17

    .line 25
    move-object v0, p0

    move-object/from16 v10, p1

    invoke-virtual {p0}, Le/e/a/PlayerIcons$Icon;->getBounds()Landroid/graphics/Rect;

    move-result-object v9

    iget-boolean v1, v0, Le/e/a/PlayerIcons$Icon;->surface:Z

    if-eqz v1, :cond_53

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    const-string v2, "info"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1f

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    const-string v2, "commentpost"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_53

    :cond_1f
    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x77000000

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    const v2, 0x3e23d70a    # 0.16f

    mul-float v7, v1, v2

    iget v1, v9, Landroid/graphics/Rect;->left:I

    int-to-float v2, v1

    iget v1, v9, Landroid/graphics/Rect;->top:I

    int-to-float v3, v1

    iget v1, v9, Landroid/graphics/Rect;->right:I

    int-to-float v4, v1

    iget v1, v9, Landroid/graphics/Rect;->bottom:I

    int-to-float v5, v1

    iget-object v8, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    move v6, v7

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    :cond_53
    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    const-string v2, "play"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_65

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    const-string v2, "pause"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    :cond_65
    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    const v2, 0x3f51eb85    # 0.82f

    mul-float v1, v1, v2

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v11

    invoke-virtual {v9}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float v3, v1, v3

    sub-float/2addr v2, v3

    invoke-virtual {v9}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v4

    sub-float/2addr v4, v3

    invoke-virtual {v10, v2, v4}, Landroid/graphics/Canvas;->translate(FF)V

    const/high16 v2, 0x41c00000    # 24.0f

    div-float/2addr v1, v2

    invoke-virtual {v10, v1, v1}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    iget v2, v0, Le/e/a/PlayerIcons$Icon;->ink:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    iget v2, v0, Le/e/a/PlayerIcons$Icon;->alpha:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const v2, 0x3fe66666    # 1.8f

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 26
    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v3, 0x0

    const/16 v4, 0x8

    const/4 v5, 0x6

    const/4 v6, 0x4

    sparse-switch v2, :sswitch_data_3e0

    :cond_cb
    goto/16 :goto_163

    :sswitch_cd
    const-string v2, "commentpost"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_cb

    const/16 v1, 0xc

    goto/16 :goto_164

    :sswitch_d9
    const-string v2, "commentoff"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_cb

    const/16 v1, 0xb

    goto/16 :goto_164

    :sswitch_e5
    const-string v2, "brightness"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_cb

    const/4 v1, 0x2

    goto/16 :goto_164

    :sswitch_f0
    const-string v2, "popup"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_cb

    const/4 v1, 0x7

    goto/16 :goto_164

    :sswitch_fb
    const-string v2, "pause"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_cb

    const/4 v1, 0x4

    goto :goto_164

    :sswitch_105
    const-string v2, "close"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_cb

    const/4 v1, 0x0

    goto :goto_164

    :sswitch_10f
    const-string v2, "prev"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_cb

    const/4 v1, 0x5

    goto :goto_164

    :sswitch_119
    const-string v2, "play"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_cb

    const/4 v1, 0x3

    goto :goto_164

    :sswitch_123
    const-string v2, "next"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_cb

    const/4 v1, 0x6

    goto :goto_164

    :sswitch_12d
    const-string v2, "info"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_cb

    const/16 v1, 0xd

    goto :goto_164

    :sswitch_138
    const-string v2, "repeaton"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_cb

    const/16 v1, 0x8

    goto :goto_164

    :sswitch_143
    const-string v2, "repeatoff"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_cb

    const/16 v1, 0x9

    goto :goto_164

    :sswitch_14e
    const-string v2, "volume"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_cb

    const/4 v1, 0x1

    goto :goto_164

    :sswitch_158
    const-string v2, "commenton"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_cb

    const/16 v1, 0xa

    goto :goto_164

    :goto_163
    const/4 v1, -0x1

    :goto_164
    const/high16 v2, 0x40e00000    # 7.0f

    const/high16 v7, 0x41a00000    # 20.0f

    const/high16 v8, 0x40800000    # 4.0f

    const/high16 v9, 0x41400000    # 12.0f

    packed-switch v1, :pswitch_data_41a

    .line 38
    new-array v1, v5, [F

    fill-array-data v1, :array_43a

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v1, v5, [F

    fill-array-data v1, :array_44a

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v1, v5, [F

    fill-array-data v1, :array_45a

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v1, v5, [F

    fill-array-data v1, :array_46a

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    goto/16 :goto_3dc

    .line 37
    :pswitch_191
    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41100000    # 9.0f

    invoke-virtual {v10, v9, v9, v3, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    new-array v1, v6, [F

    fill-array-data v1, :array_47a

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v1, 0x3f8ccccd    # 1.1f

    iget-object v3, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v10, v9, v2, v1, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_3dc

    .line 36
    :pswitch_1b1
    const/16 v1, 0x10

    new-array v1, v1, [F

    fill-array-data v1, :array_486

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v1, v6, [F

    fill-array-data v1, :array_4aa

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v1, v6, [F

    fill-array-data v1, :array_4b6

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    goto/16 :goto_3dc

    .line 35
    :pswitch_1cd
    const/16 v1, 0x10

    new-array v1, v1, [F

    fill-array-data v1, :array_4c2

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    const-string v2, "off"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1eb

    new-array v1, v6, [F

    fill-array-data v1, :array_4e6

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    goto/16 :goto_3dc

    :cond_1eb
    new-array v1, v6, [F

    fill-array-data v1, :array_4f2

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v1, v6, [F

    fill-array-data v1, :array_4fe

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    goto/16 :goto_3dc

    .line 34
    :pswitch_1fd
    new-array v1, v4, [F

    fill-array-data v1, :array_50a

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v1, v4, [F

    fill-array-data v1, :array_51e

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    const-string v2, "off"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3dc

    new-array v1, v6, [F

    fill-array-data v1, :array_532

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    goto/16 :goto_3dc

    .line 33
    :pswitch_221
    const/high16 v7, 0x40000000    # 2.0f

    iget-object v8, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v3, 0x40800000    # 4.0f

    const/high16 v4, 0x41a80000    # 21.0f

    const/high16 v5, 0x41a00000    # 20.0f

    const/high16 v6, 0x40000000    # 2.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v7, 0x3f800000    # 1.0f

    iget-object v8, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41400000    # 12.0f

    const/high16 v3, 0x41400000    # 12.0f

    const/high16 v4, 0x41980000    # 19.0f

    const/high16 v5, 0x41900000    # 18.0f

    const/high16 v6, 0x3f800000    # 1.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3dc

    .line 32
    :pswitch_250
    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->name:Ljava/lang/String;

    const-string v3, "next"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iget-object v3, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance v3, Landroid/graphics/Path;

    invoke-direct {v3}, Landroid/graphics/Path;-><init>()V

    const/high16 v4, 0x41980000    # 19.0f

    const/high16 v5, 0x40a00000    # 5.0f

    if-eqz v1, :cond_26d

    const/high16 v6, 0x40a00000    # 5.0f

    goto :goto_26f

    :cond_26d
    const/high16 v6, 0x41980000    # 19.0f

    :goto_26f
    invoke-virtual {v3, v6, v5}, Landroid/graphics/Path;->moveTo(FF)V

    if-eqz v1, :cond_277

    const/high16 v6, 0x41800000    # 16.0f

    goto :goto_279

    :cond_277
    const/high16 v6, 0x41000000    # 8.0f

    :goto_279
    invoke-virtual {v3, v6, v9}, Landroid/graphics/Path;->lineTo(FF)V

    if-eqz v1, :cond_27f

    goto :goto_281

    :cond_27f
    const/high16 v5, 0x41980000    # 19.0f

    :goto_281
    invoke-virtual {v3, v5, v4}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    iget-object v4, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v10, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    if-eqz v1, :cond_291

    const/high16 v3, 0x41880000    # 17.0f

    goto :goto_293

    :cond_291
    const/high16 v3, 0x40800000    # 4.0f

    :goto_293
    if-eqz v1, :cond_298

    const/high16 v4, 0x41a00000    # 20.0f

    goto :goto_29a

    :cond_298
    const/high16 v4, 0x40e00000    # 7.0f

    :goto_29a
    const/high16 v7, 0x3f800000    # 1.0f

    iget-object v8, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v5, 0x40a00000    # 5.0f

    const/high16 v6, 0x41980000    # 19.0f

    const/high16 v9, 0x3f800000    # 1.0f

    move-object/from16 v1, p1

    move v2, v3

    move v3, v5

    move v5, v6

    move v6, v9

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3dc

    .line 31
    :pswitch_2af
    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, -0x56000000

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/high16 v7, 0x3f800000    # 1.0f

    iget-object v8, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40c00000    # 6.0f

    const/high16 v3, 0x40400000    # 3.0f

    const/high16 v4, 0x41200000    # 10.0f

    const/high16 v5, 0x41a80000    # 21.0f

    const/high16 v6, 0x3f800000    # 1.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    iget-object v8, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41600000    # 14.0f

    const/high16 v4, 0x41900000    # 18.0f

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    iget v2, v0, Le/e/a/PlayerIcons$Icon;->ink:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    iget v2, v0, Le/e/a/PlayerIcons$Icon;->alpha:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v8, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40c00000    # 6.0f

    const/high16 v4, 0x41200000    # 10.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    iget-object v8, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41600000    # 14.0f

    const/high16 v4, 0x41900000    # 18.0f

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3dc

    .line 30
    :pswitch_30b
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    const/high16 v2, 0x40c00000    # 6.0f

    const/high16 v3, 0x40400000    # 3.0f

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v1, v7, v9}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v3, 0x41a80000    # 21.0f

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    iget-object v2, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v3, -0x56000000

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v2, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v10, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget-object v2, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    iget v3, v0, Le/e/a/PlayerIcons$Icon;->ink:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    iget v3, v0, Le/e/a/PlayerIcons$Icon;->alpha:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v2, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v10, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_3dc

    .line 29
    :pswitch_358
    iget-object v1, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v10, v9, v9, v8, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/4 v1, 0x0

    :goto_35e
    if-ge v1, v4, :cond_3dc

    int-to-double v7, v1

    const-wide v12, 0x400921fb54442d18L    # Math.PI

    mul-double v7, v7, v12

    const-wide/high16 v12, 0x4010000000000000L    # 4.0

    div-double/2addr v7, v12

    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    double-to-float v5, v12

    mul-float v5, v5, v2

    add-float/2addr v5, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    double-to-float v12, v12

    mul-float v12, v12, v2

    add-float/2addr v12, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    move-result-wide v13

    double-to-float v13, v13

    const/high16 v14, 0x41200000    # 10.0f

    mul-float v13, v13, v14

    add-float/2addr v13, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->sin(D)D

    move-result-wide v7

    double-to-float v7, v7

    mul-float v7, v7, v14

    add-float/2addr v7, v9

    new-array v8, v6, [F

    aput v5, v8, v3

    const/4 v5, 0x1

    aput v12, v8, v5

    const/4 v5, 0x2

    aput v13, v8, v5

    const/4 v5, 0x3

    aput v7, v8, v5

    invoke-direct {p0, v10, v8}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_35e

    .line 28
    :pswitch_3a0
    const/16 v1, 0xe

    new-array v1, v1, [F

    fill-array-data v1, :array_53e

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    const/4 v8, 0x0

    iget-object v9, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41100000    # 9.0f

    const/high16 v3, 0x40c00000    # 6.0f

    const/high16 v4, 0x41a80000    # 21.0f

    const/high16 v5, 0x41900000    # 18.0f

    const/high16 v6, -0x3da40000    # -55.0f

    const/high16 v7, 0x42dc0000    # 110.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v9}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    iget-object v9, v0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41400000    # 12.0f

    const/high16 v3, 0x41100000    # 9.0f

    const/high16 v4, 0x41900000    # 18.0f

    const/high16 v5, 0x41700000    # 15.0f

    invoke-virtual/range {v1 .. v9}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    goto :goto_3dc

    .line 27
    :pswitch_3cc
    new-array v1, v6, [F

    fill-array-data v1, :array_55e

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    new-array v1, v6, [F

    fill-array-data v1, :array_56a

    invoke-direct {p0, v10, v1}, Le/e/a/PlayerIcons$Icon;->line(Landroid/graphics/Canvas;[F)V

    .line 39
    :cond_3dc
    :goto_3dc
    invoke-virtual {v10, v11}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 40
    return-void

    :sswitch_data_3e0
    .sparse-switch
        -0x591c1f82 -> :sswitch_158
        -0x305518e6 -> :sswitch_14e
        -0x270f2a0c -> :sswitch_143
        -0x1a08bf46 -> :sswitch_138
        0x3164ae -> :sswitch_12d
        0x338af3 -> :sswitch_123
        0x348b34 -> :sswitch_119
        0x34a233 -> :sswitch_10f
        0x5a5ddf8 -> :sswitch_105
        0x65825f6 -> :sswitch_fb
        0x65e70ac -> :sswitch_f0
        0x26a22c51 -> :sswitch_e5
        0x35982eb0 -> :sswitch_d9
        0x7d6e3f7f -> :sswitch_cd
    .end sparse-switch

    :pswitch_data_41a
    .packed-switch 0x0
        :pswitch_3cc
        :pswitch_3a0
        :pswitch_358
        :pswitch_30b
        :pswitch_2af
        :pswitch_250
        :pswitch_250
        :pswitch_221
        :pswitch_1fd
        :pswitch_1fd
        :pswitch_1cd
        :pswitch_1cd
        :pswitch_1b1
        :pswitch_191
    .end packed-switch

    :array_43a
    .array-data 4
        0x41100000    # 9.0f
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x41100000    # 9.0f
    .end array-data

    :array_44a
    .array-data 4
        0x41700000    # 15.0f
        0x40400000    # 3.0f
        0x41a80000    # 21.0f
        0x40400000    # 3.0f
        0x41a80000    # 21.0f
        0x41100000    # 9.0f
    .end array-data

    :array_45a
    .array-data 4
        0x40400000    # 3.0f
        0x41700000    # 15.0f
        0x40400000    # 3.0f
        0x41a80000    # 21.0f
        0x41100000    # 9.0f
        0x41a80000    # 21.0f
    .end array-data

    :array_46a
    .array-data 4
        0x41a80000    # 21.0f
        0x41700000    # 15.0f
        0x41a80000    # 21.0f
        0x41a80000    # 21.0f
        0x41700000    # 15.0f
        0x41a80000    # 21.0f
    .end array-data

    :array_47a
    .array-data 4
        0x41400000    # 12.0f
        0x41300000    # 11.0f
        0x41400000    # 12.0f
        0x41880000    # 17.0f
    .end array-data

    :array_486
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

    :array_4aa
    .array-data 4
        0x41000000    # 8.0f
        0x41200000    # 10.0f
        0x41800000    # 16.0f
        0x41200000    # 10.0f
    .end array-data

    :array_4b6
    .array-data 4
        0x41400000    # 12.0f
        0x40e00000    # 7.0f
        0x41400000    # 12.0f
        0x41500000    # 13.0f
    .end array-data

    :array_4c2
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

    :array_4e6
    .array-data 4
        0x40400000    # 3.0f
        0x40000000    # 2.0f
        0x41b00000    # 22.0f
        0x41a80000    # 21.0f
    .end array-data

    :array_4f2
    .array-data 4
        0x41000000    # 8.0f
        0x41100000    # 9.0f
        0x41800000    # 16.0f
        0x41100000    # 9.0f
    .end array-data

    :array_4fe
    .array-data 4
        0x41000000    # 8.0f
        0x41500000    # 13.0f
        0x41600000    # 14.0f
        0x41500000    # 13.0f
    .end array-data

    :array_50a
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

    :array_51e
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

    :array_532
    .array-data 4
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x41a80000    # 21.0f
        0x41a80000    # 21.0f
    .end array-data

    :array_53e
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

    :array_55e
    .array-data 4
        0x40c00000    # 6.0f
        0x40c00000    # 6.0f
        0x41900000    # 18.0f
        0x41900000    # 18.0f
    .end array-data

    :array_56a
    .array-data 4
        0x41900000    # 18.0f
        0x40c00000    # 6.0f
        0x40c00000    # 6.0f
        0x41900000    # 18.0f
    .end array-data
.end method

.method public getOpacity()I
    .registers 2

    .line 41
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 2

    .line 41
    iput p1, p0, Le/e/a/PlayerIcons$Icon;->alpha:I

    invoke-virtual {p0}, Le/e/a/PlayerIcons$Icon;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 41
    iget-object v0, p0, Le/e/a/PlayerIcons$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Le/e/a/PlayerIcons$Icon;->invalidateSelf()V

    return-void
.end method
