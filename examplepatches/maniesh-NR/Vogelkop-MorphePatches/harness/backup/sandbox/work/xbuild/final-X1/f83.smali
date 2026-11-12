.class public abstract Lf83;
.super Lfya;
.source "SourceFile"


# instance fields
.field public final e:Ljava/util/List;

.field public final f:Z

.field public final g:Ls9i;

.field public final h:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Ljava/util/List;Leya;)V
    .registers 30

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v2}, Lfya;-><init>(Leya;)V

    iput-object v1, v0, Lf83;->e:Ljava/util/List;

    sget-object v3, Leya;->f:Leya;

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v2, v3, :cond_13

    move v2, v5

    goto :goto_14

    :cond_13
    move v2, v4

    :goto_14
    iput-boolean v2, v0, Lf83;->f:Z

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_27

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    move/from16 v16, v4

    move/from16 v17, v5

    goto/16 :goto_222

    :cond_27
    new-instance v6, Landroid/graphics/Path;

    invoke-direct {v6}, Landroid/graphics/Path;-><init>()V

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->y:F

    invoke-virtual {v6, v2, v7}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-eq v2, v5, :cond_60

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v13, v2, -0x1

    if-ne v13, v5, :cond_67

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    invoke-virtual {v6, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    :cond_60
    move/from16 v16, v4

    move/from16 v17, v5

    :cond_64
    move-object v1, v6

    goto/16 :goto_222

    :cond_67
    shl-int/lit8 v7, v13, 0x1

    new-array v14, v7, [Landroid/graphics/PointF;

    move v8, v4

    :goto_6c
    if-ge v8, v7, :cond_78

    new-instance v9, Landroid/graphics/PointF;

    invoke-direct {v9}, Landroid/graphics/PointF;-><init>()V

    aput-object v9, v14, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_6c

    :cond_78
    new-array v8, v13, [Landroid/graphics/PointF;

    move v9, v4

    :goto_7b
    if-ge v9, v13, :cond_87

    new-instance v10, Landroid/graphics/PointF;

    invoke-direct {v10}, Landroid/graphics/PointF;-><init>()V

    aput-object v10, v8, v9

    add-int/lit8 v9, v9, 0x1

    goto :goto_7b

    :cond_87
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/graphics/PointF;

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/graphics/PointF;

    const/high16 v11, 0x40000000    # 2.0f

    invoke-static {v10, v11}, Lwyh;->Z(Landroid/graphics/PointF;F)Landroid/graphics/PointF;

    move-result-object v10

    invoke-static {v9, v10}, Lwyh;->O(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v9

    aput-object v9, v8, v4

    add-int/lit8 v9, v2, -0x2

    move v10, v5

    :goto_a2
    if-ge v10, v9, :cond_c8

    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/graphics/PointF;

    invoke-static {v12, v11}, Lwyh;->Z(Landroid/graphics/PointF;F)Landroid/graphics/PointF;

    move-result-object v12

    add-int/lit8 v15, v10, 0x1

    invoke-interface {v1, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    move/from16 v17, v5

    move-object/from16 v5, v16

    check-cast v5, Landroid/graphics/PointF;

    invoke-static {v12, v5}, Lwyh;->O(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v5

    invoke-static {v5, v11}, Lwyh;->Z(Landroid/graphics/PointF;F)Landroid/graphics/PointF;

    move-result-object v5

    aput-object v5, v8, v10

    move v10, v15

    move/from16 v5, v17

    goto :goto_a2

    :cond_c8
    move/from16 v17, v5

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/PointF;

    const/high16 v10, 0x41000000    # 8.0f

    invoke-static {v5, v10}, Lwyh;->Z(Landroid/graphics/PointF;F)Landroid/graphics/PointF;

    move-result-object v5

    invoke-interface {v1, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/graphics/PointF;

    invoke-static {v5, v10}, Lwyh;->O(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v5

    aput-object v5, v8, v9

    new-array v5, v13, [Landroid/graphics/PointF;

    move v10, v4

    :goto_e5
    if-ge v10, v13, :cond_f1

    new-instance v12, Landroid/graphics/PointF;

    invoke-direct {v12}, Landroid/graphics/PointF;-><init>()V

    aput-object v12, v5, v10

    add-int/lit8 v10, v10, 0x1

    goto :goto_e5

    :cond_f1
    new-array v10, v9, [F

    move v12, v4

    :goto_f4
    const/high16 v15, 0x3f800000    # 1.0f

    if-ge v12, v9, :cond_fd

    aput v15, v10, v12

    add-int/lit8 v12, v12, 0x1

    goto :goto_f4

    :cond_fd
    add-int/lit8 v2, v2, -0x3

    aput v11, v10, v2

    new-array v12, v13, [F

    move/from16 p2, v15

    move v15, v4

    :goto_106
    if-ge v15, v13, :cond_10f

    const/high16 v16, 0x40800000    # 4.0f

    aput v16, v12, v15

    add-int/lit8 v15, v15, 0x1

    goto :goto_106

    :cond_10f
    aput v11, v12, v4

    const/high16 v15, 0x40e00000    # 7.0f

    aput v15, v12, v9

    new-array v15, v9, [Ljava/lang/Float;

    move/from16 v16, v4

    :goto_119
    if-ge v4, v9, :cond_124

    invoke-static/range {p2 .. p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v18

    aput-object v18, v15, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_119

    :cond_124
    new-array v4, v9, [Ljava/lang/Float;

    move/from16 v11, v16

    :goto_128
    if-ge v11, v9, :cond_135

    const/16 v19, 0x0

    invoke-static/range {v19 .. v19}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v19

    aput-object v19, v4, v11

    add-int/lit8 v11, v11, 0x1

    goto :goto_128

    :cond_135
    aget-object v11, v15, v16

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    move-result v11

    aget v19, v12, v16

    div-float v11, v11, v19

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    aput-object v11, v4, v16

    aget v11, v12, v16

    div-float v11, p2, v11

    aget-object v3, v8, v16

    invoke-static {v3, v11}, Lwyh;->Z(Landroid/graphics/PointF;F)Landroid/graphics/PointF;

    move-result-object v3

    aput-object v3, v5, v16

    move/from16 v3, v17

    :goto_153
    if-ge v3, v9, :cond_176

    aget-object v11, v15, v3

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    move-result v11

    aget v20, v12, v3

    add-int/lit8 v21, v3, -0x1

    aget v22, v10, v21

    aget-object v21, v4, v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Float;->floatValue()F

    move-result v21

    mul-float v21, v21, v22

    sub-float v20, v20, v21

    div-float v11, v11, v20

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    aput-object v11, v4, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_153

    :cond_176
    move/from16 v3, v17

    :goto_178
    if-ge v3, v13, :cond_1a9

    aget v11, v12, v3

    add-int/lit8 v15, v3, -0x1

    aget v20, v10, v15

    aget-object v21, v4, v15

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Float;->floatValue()F

    move-result v21

    mul-float v21, v21, v20

    sub-float v11, v11, v21

    div-float v11, p2, v11

    move/from16 v20, v2

    aget-object v2, v8, v3

    move/from16 v21, v3

    aget-object v3, v5, v15

    aget v15, v10, v15

    invoke-static {v3, v15}, Lwyh;->Z(Landroid/graphics/PointF;F)Landroid/graphics/PointF;

    move-result-object v3

    invoke-static {v2, v3}, Lwyh;->M(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v2

    invoke-static {v2, v11}, Lwyh;->Z(Landroid/graphics/PointF;F)Landroid/graphics/PointF;

    move-result-object v2

    aput-object v2, v5, v21

    add-int/lit8 v3, v21, 0x1

    move/from16 v2, v20

    goto :goto_178

    :cond_1a9
    move/from16 v20, v2

    aget-object v2, v5, v9

    aput-object v2, v14, v9

    move/from16 v2, v20

    :goto_1b1
    const/4 v3, -0x1

    if-ge v3, v2, :cond_1cd

    aget-object v3, v5, v2

    aget-object v8, v4, v2

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    add-int/lit8 v10, v2, 0x1

    aget-object v10, v14, v10

    invoke-static {v10, v8}, Lwyh;->Z(Landroid/graphics/PointF;F)Landroid/graphics/PointF;

    move-result-object v8

    invoke-static {v3, v8}, Lwyh;->M(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v3

    aput-object v3, v14, v2

    add-int/lit8 v2, v2, -0x1

    goto :goto_1b1

    :cond_1cd
    move/from16 v2, v16

    :goto_1cf
    if-ge v2, v9, :cond_1ea

    add-int v3, v13, v2

    add-int/lit8 v2, v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/PointF;

    const/high16 v5, 0x40000000    # 2.0f

    invoke-static {v4, v5}, Lwyh;->Z(Landroid/graphics/PointF;F)Landroid/graphics/PointF;

    move-result-object v4

    aget-object v8, v14, v2

    invoke-static {v4, v8}, Lwyh;->M(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v4

    aput-object v4, v14, v3

    goto :goto_1cf

    :cond_1ea
    add-int/lit8 v7, v7, -0x1

    invoke-interface {v1, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/PointF;

    aget-object v3, v14, v9

    invoke-static {v2, v3}, Lwyh;->O(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v2

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-static {v2, v3}, Lwyh;->Z(Landroid/graphics/PointF;F)Landroid/graphics/PointF;

    move-result-object v2

    aput-object v2, v14, v7

    move/from16 v2, v16

    :goto_202
    if-ge v2, v13, :cond_64

    add-int/lit8 v3, v2, 0x1

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/PointF;

    aget-object v5, v14, v2

    add-int/2addr v2, v13

    aget-object v2, v14, v2

    iget v7, v5, Landroid/graphics/PointF;->x:F

    iget v8, v5, Landroid/graphics/PointF;->y:F

    iget v9, v2, Landroid/graphics/PointF;->x:F

    iget v10, v2, Landroid/graphics/PointF;->y:F

    iget v11, v4, Landroid/graphics/PointF;->x:F

    iget v12, v4, Landroid/graphics/PointF;->y:F

    invoke-virtual/range {v6 .. v12}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    move v2, v3

    goto :goto_202

    :goto_222
    iget-boolean v2, v0, Lf83;->f:Z

    if-eqz v2, :cond_30d

    iget-object v2, v0, Lf83;->e:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x4

    if-gt v3, v4, :cond_234

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    goto/16 :goto_30d

    :cond_234
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v4, v3, -0x1

    move/from16 v5, v16

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/graphics/PointF;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    move/from16 v7, v17

    :goto_248
    const/4 v8, 0x0

    const v9, 0x3d4ccccd    # 0.05f

    if-ge v7, v5, :cond_271

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/graphics/PointF;

    iget v11, v10, Landroid/graphics/PointF;->x:F

    iget v12, v6, Landroid/graphics/PointF;->x:F

    sub-float/2addr v11, v12

    float-to-double v11, v11

    iget v10, v10, Landroid/graphics/PointF;->y:F

    iget v13, v6, Landroid/graphics/PointF;->y:F

    sub-float/2addr v10, v13

    float-to-double v13, v10

    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v10

    double-to-float v10, v10

    cmpl-float v10, v10, v9

    if-lez v10, :cond_26e

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    goto :goto_272

    :cond_26e
    add-int/lit8 v7, v7, 0x1

    goto :goto_248

    :cond_271
    move-object v5, v8

    :goto_272
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/graphics/PointF;

    add-int/lit8 v3, v3, -0x2

    const/4 v7, -0x1

    :goto_27b
    if-ge v7, v3, :cond_2a0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/graphics/PointF;

    iget v11, v10, Landroid/graphics/PointF;->x:F

    iget v12, v6, Landroid/graphics/PointF;->x:F

    sub-float/2addr v11, v12

    float-to-double v11, v11

    iget v10, v10, Landroid/graphics/PointF;->y:F

    iget v13, v6, Landroid/graphics/PointF;->y:F

    sub-float/2addr v10, v13

    float-to-double v13, v10

    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v10

    double-to-float v10, v10

    cmpl-float v10, v10, v9

    if-lez v10, :cond_29d

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    goto :goto_2a0

    :cond_29d
    add-int/lit8 v3, v3, -0x1

    goto :goto_27b

    :cond_2a0
    :goto_2a0
    if-eqz v5, :cond_308

    if-eqz v8, :cond_308

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ge v3, v6, :cond_308

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/PointF;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/PointF;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/graphics/PointF;

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/PointF;

    iget v4, v2, Landroid/graphics/PointF;->x:F

    iget v7, v2, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v4, v7}, Landroid/graphics/Path;->setLastPoint(FF)V

    iget v4, v2, Landroid/graphics/PointF;->x:F

    iget v7, v6, Landroid/graphics/PointF;->x:F

    const v8, 0x3ecccccd    # 0.4f

    invoke-static {v4, v7, v8, v4}, Lv0g;->g(FFFF)F

    move-result v21

    iget v2, v2, Landroid/graphics/PointF;->y:F

    iget v4, v6, Landroid/graphics/PointF;->y:F

    invoke-static {v2, v4, v8, v2}, Lv0g;->g(FFFF)F

    move-result v22

    iget v2, v3, Landroid/graphics/PointF;->x:F

    iget v4, v5, Landroid/graphics/PointF;->x:F

    sub-float/2addr v4, v2

    mul-float/2addr v4, v8

    sub-float v23, v2, v4

    iget v3, v3, Landroid/graphics/PointF;->y:F

    iget v4, v5, Landroid/graphics/PointF;->y:F

    sub-float/2addr v4, v3

    mul-float/2addr v4, v8

    sub-float v24, v3, v4

    move-object/from16 v20, v1

    move/from16 v25, v2

    move/from16 v26, v3

    invoke-virtual/range {v20 .. v26}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    move-object/from16 v6, v20

    invoke-virtual {v6}, Landroid/graphics/Path;->close()V

    goto :goto_30e

    :cond_308
    move-object v6, v1

    invoke-virtual {v6}, Landroid/graphics/Path;->close()V

    goto :goto_30e

    :cond_30d
    :goto_30d
    move-object v6, v1

    :goto_30e
    new-instance v1, Ls9i;

    invoke-direct {v1, v6}, Ls9i;-><init>(Landroid/graphics/Path;)V

    iput-object v1, v0, Lf83;->g:Ls9i;

    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    move/from16 v2, v17

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    sget-object v2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iput-object v1, v0, Lf83;->h:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method public b(Landroid/graphics/Canvas;Lkk7;)V
    .registers 11

    iget-object v4, p2, Lkk7;->b:Li97;

    iget-object v5, p0, Lf83;->h:Landroid/graphics/Paint;

    iget-object p2, p0, Lf83;->g:Ls9i;

    if-eqz p2, :cond_12

    iget-object p0, v4, Li97;->b:Landroid/graphics/PointF;

    invoke-virtual {p2, p0}, Ls9i;->P(Landroid/graphics/PointF;)Landroid/graphics/Path;

    move-result-object p0

    invoke-virtual {p1, p0, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void

    :cond_12
    iget-object p2, p0, Lf83;->e:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v6

    const/4 v7, 0x1

    move v2, v7

    :goto_1a
    if-ge v2, v6, :cond_26

    add-int/lit8 v1, v2, -0x1

    move-object v0, p0

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Lf83;->e(IILandroid/graphics/Canvas;Li97;Landroid/graphics/Paint;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    :cond_26
    move-object v0, p0

    move-object v3, p1

    iget-boolean p0, v0, Lf83;->f:Z

    if-eqz p0, :cond_3e

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p0

    const/4 p1, 0x2

    if-lt p0, p1, :cond_3d

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p0

    add-int/lit8 v1, p0, -0x1

    const/4 v2, 0x0

    invoke-virtual/range {v0 .. v5}, Lf83;->e(IILandroid/graphics/Canvas;Li97;Landroid/graphics/Paint;)V

    :cond_3d
    return-void

    :cond_3e
    const/4 p0, 0x0

    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/PointF;

    iget-object p1, v4, Li97;->b:Landroid/graphics/PointF;

    iget v0, p1, Landroid/graphics/PointF;->x:F

    iget v1, p0, Landroid/graphics/PointF;->x:F

    mul-float/2addr v0, v1

    iget p1, p1, Landroid/graphics/PointF;->y:F

    iget p0, p0, Landroid/graphics/PointF;->y:F

    mul-float/2addr p1, p0

    invoke-virtual {v3, v0, p1, v5}, Landroid/graphics/Canvas;->drawPoint(FFLandroid/graphics/Paint;)V

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p0

    sub-int/2addr p0, v7

    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/PointF;

    iget-object p1, v4, Li97;->b:Landroid/graphics/PointF;

    iget p2, p1, Landroid/graphics/PointF;->x:F

    iget v0, p0, Landroid/graphics/PointF;->x:F

    mul-float/2addr p2, v0

    iget p1, p1, Landroid/graphics/PointF;->y:F

    iget p0, p0, Landroid/graphics/PointF;->y:F

    mul-float/2addr p1, p0

    invoke-virtual {v3, p2, p1, v5}, Landroid/graphics/Canvas;->drawPoint(FFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final e(IILandroid/graphics/Canvas;Li97;Landroid/graphics/Paint;)V
    .registers 13

    iget-object p0, p0, Lf83;->e:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/PointF;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/PointF;

    iget-object p2, p4, Li97;->b:Landroid/graphics/PointF;

    iget p4, p2, Landroid/graphics/PointF;->x:F

    iget v0, p1, Landroid/graphics/PointF;->x:F

    mul-float v2, p4, v0

    iget p2, p2, Landroid/graphics/PointF;->y:F

    iget p1, p1, Landroid/graphics/PointF;->y:F

    mul-float v3, p2, p1

    iget p1, p0, Landroid/graphics/PointF;->x:F

    mul-float v4, p4, p1

    iget p0, p0, Landroid/graphics/PointF;->y:F

    mul-float v5, p2, p0

    move-object v1, p3

    move-object v6, p5

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    invoke-super {p0, p1, p2}, Lfya;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object p0, p0, Lf83;->e:Ljava/util/List;

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    return-void
.end method
