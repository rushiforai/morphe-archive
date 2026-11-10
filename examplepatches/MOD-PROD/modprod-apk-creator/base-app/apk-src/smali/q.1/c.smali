.class public abstract Lq/c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/lang/ThreadLocal;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lq/c;->a:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public static a(Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;
    .locals 36

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static/range {p1 .. p1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v2

    :goto_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    const/4 v4, 0x2

    if-eq v3, v4, :cond_0

    const/4 v5, 0x1

    if-eq v3, v5, :cond_0

    goto :goto_0

    :cond_0
    if-ne v3, v4, :cond_27

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "selector"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_26

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v3

    const/4 v4, 0x1

    add-int/2addr v3, v4

    const/16 v5, 0x14

    new-array v6, v5, [[I

    new-array v5, v5, [I

    const/4 v7, 0x0

    move v8, v7

    :goto_1
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v9

    if-eq v9, v4, :cond_25

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v10

    const/4 v11, 0x3

    if-ge v10, v3, :cond_1

    if-eq v9, v11, :cond_25

    :cond_1
    const/4 v12, 0x2

    if-ne v9, v12, :cond_2

    if-gt v10, v3, :cond_2

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "item"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3

    :cond_2
    move-object/from16 v33, v2

    move/from16 v35, v3

    move/from16 v16, v4

    goto/16 :goto_1b

    :cond_3
    sget-object v9, Ln/a;->a:[I

    if-nez v1, :cond_4

    invoke-virtual {v0, v2, v9}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v9

    goto :goto_2

    :cond_4
    invoke-virtual {v1, v2, v9, v7, v7}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v9

    :goto_2
    const/4 v10, -0x1

    invoke-virtual {v9, v7, v10}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v13

    const v14, -0xff01

    const/16 v15, 0x1f

    if-eq v13, v10, :cond_7

    sget-object v10, Lq/c;->a:Ljava/lang/ThreadLocal;

    invoke-virtual {v10}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/util/TypedValue;

    if-nez v16, :cond_5

    new-instance v12, Landroid/util/TypedValue;

    invoke-direct {v12}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {v10, v12}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    goto :goto_3

    :cond_5
    move-object/from16 v12, v16

    :goto_3
    invoke-virtual {v0, v13, v12, v4}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    iget v10, v12, Landroid/util/TypedValue;->type:I

    const/16 v12, 0x1c

    if-lt v10, v12, :cond_6

    if-gt v10, v15, :cond_6

    goto :goto_4

    :cond_6
    :try_start_0
    invoke-virtual {v0, v13}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v10

    invoke-static {v0, v10, v1}, Lq/c;->a(Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v10
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_5

    :catch_0
    invoke-virtual {v9, v7, v14}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v10

    goto :goto_5

    :cond_7
    :goto_4
    invoke-virtual {v9, v7, v14}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v10

    :goto_5
    invoke-virtual {v9, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v12

    const/high16 v13, 0x3f800000    # 1.0f

    if-eqz v12, :cond_8

    invoke-virtual {v9, v4, v13}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v11

    goto :goto_6

    :cond_8
    invoke-virtual {v9, v11}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v12

    if-eqz v12, :cond_9

    invoke-virtual {v9, v11, v13}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v11

    goto :goto_6

    :cond_9
    move v11, v13

    :goto_6
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v14, 0x4

    move/from16 v16, v4

    const/high16 v4, -0x40800000    # -1.0f

    if-lt v12, v15, :cond_a

    const/4 v12, 0x2

    invoke-virtual {v9, v12}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v15

    if-eqz v15, :cond_a

    invoke-virtual {v9, v12, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    goto :goto_7

    :cond_a
    invoke-virtual {v9, v14, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    :goto_7
    invoke-virtual {v9}, Landroid/content/res/TypedArray;->recycle()V

    invoke-interface {v2}, Landroid/util/AttributeSet;->getAttributeCount()I

    move-result v9

    new-array v12, v9, [I

    move v15, v7

    move/from16 v18, v13

    move v13, v15

    :goto_8
    if-ge v15, v9, :cond_d

    invoke-interface {v2, v15}, Landroid/util/AttributeSet;->getAttributeNameResource(I)I

    move-result v14

    const v7, 0x10101a5

    if-eq v14, v7, :cond_c

    const v7, 0x101031f

    if-eq v14, v7, :cond_c

    const v7, 0x7f030029

    if-eq v14, v7, :cond_c

    const v7, 0x7f0300a8

    if-eq v14, v7, :cond_c

    add-int/lit8 v7, v13, 0x1

    const/4 v0, 0x0

    invoke-interface {v2, v15, v0}, Landroid/util/AttributeSet;->getAttributeBooleanValue(IZ)Z

    move-result v20

    if-eqz v20, :cond_b

    goto :goto_9

    :cond_b
    neg-int v14, v14

    :goto_9
    aput v14, v12, v13

    move v13, v7

    :cond_c
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, p0

    const/4 v7, 0x0

    const/4 v14, 0x4

    goto :goto_8

    :cond_d
    invoke-static {v12, v13}, Landroid/util/StateSet;->trimStateSet([II)[I

    move-result-object v0

    const/4 v7, 0x0

    cmpl-float v9, v4, v7

    const/high16 v12, 0x42c80000    # 100.0f

    if-ltz v9, :cond_e

    cmpg-float v9, v4, v12

    if-gtz v9, :cond_e

    move/from16 v9, v16

    goto :goto_a

    :cond_e
    const/4 v9, 0x0

    :goto_a
    cmpl-float v13, v11, v18

    if-nez v13, :cond_f

    if-nez v9, :cond_f

    move-object/from16 v31, v0

    move-object/from16 v33, v2

    move/from16 v35, v3

    goto/16 :goto_18

    :cond_f
    invoke-static {v10}, Landroid/graphics/Color;->alpha(I)I

    move-result v13

    int-to-float v13, v13

    mul-float/2addr v13, v11

    const/high16 v11, 0x3f000000    # 0.5f

    add-float/2addr v13, v11

    float-to-int v11, v13

    if-gez v11, :cond_10

    const/4 v13, 0x0

    goto :goto_b

    :cond_10
    const/16 v13, 0xff

    if-le v11, v13, :cond_11

    goto :goto_b

    :cond_11
    move v13, v11

    :goto_b
    if-eqz v9, :cond_20

    invoke-static {v10}, Lq/a;->a(I)Lq/a;

    move-result-object v9

    sget-object v10, Lq/n;->k:Lq/n;

    iget v11, v9, Lq/a;->b:F

    float-to-double v14, v11

    const-wide/high16 v20, 0x3ff0000000000000L    # 1.0

    cmpg-double v14, v14, v20

    if-ltz v14, :cond_12

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v14

    int-to-double v14, v14

    const-wide/16 v20, 0x0

    cmpg-double v14, v14, v20

    if-lez v14, :cond_12

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v14

    int-to-double v14, v14

    const-wide/high16 v20, 0x4059000000000000L    # 100.0

    cmpl-double v14, v14, v20

    if-ltz v14, :cond_13

    :cond_12
    move-object/from16 v31, v0

    move-object/from16 v33, v2

    move/from16 v35, v3

    goto/16 :goto_16

    :cond_13
    iget v9, v9, Lq/a;->a:F

    cmpg-float v14, v9, v7

    if-gez v14, :cond_14

    move v9, v7

    goto :goto_c

    :cond_14
    const/high16 v14, 0x43b40000    # 360.0f

    invoke-static {v14, v9}, Ljava/lang/Math;->min(FF)F

    move-result v9

    :goto_c
    move/from16 v21, v7

    move/from16 v22, v21

    move v15, v11

    move/from16 v20, v16

    const/4 v7, 0x0

    :goto_d
    sub-float v23, v21, v11

    invoke-static/range {v23 .. v23}, Ljava/lang/Math;->abs(F)F

    move-result v23

    const v24, 0x3ecccccd    # 0.4f

    cmpl-float v23, v23, v24

    if-ltz v23, :cond_1e

    const/high16 v23, 0x447a0000    # 1000.0f

    move/from16 v26, v12

    move/from16 v25, v22

    move/from16 v24, v23

    const/16 v27, 0x0

    :goto_e
    sub-float v28, v25, v26

    invoke-static/range {v28 .. v28}, Ljava/lang/Math;->abs(F)F

    move-result v28

    const v29, 0x3c23d70a    # 0.01f

    cmpl-float v28, v28, v29

    const/high16 v29, 0x40000000    # 2.0f

    if-lez v28, :cond_1a

    sub-float v28, v26, v25

    div-float v28, v28, v29

    move/from16 v30, v12

    add-float v12, v28, v25

    invoke-static {v12, v15, v9}, Lq/a;->b(FFF)Lq/a;

    move-result-object v14

    move-object/from16 v31, v0

    sget-object v0, Lq/n;->k:Lq/n;

    invoke-virtual {v14, v0}, Lq/a;->c(Lq/n;)I

    move-result v0

    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v14

    invoke-static {v14}, Lq/b;->b(I)F

    move-result v14

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v32

    invoke-static/range {v32 .. v32}, Lq/b;->b(I)F

    move-result v32

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v33

    invoke-static/range {v33 .. v33}, Lq/b;->b(I)F

    move-result v33

    sget-object v34, Lq/b;->d:[[F

    aget-object v34, v34, v16

    const/16 v19, 0x0

    aget v35, v34, v19

    mul-float v14, v14, v35

    aget v35, v34, v16

    mul-float v32, v32, v35

    add-float v32, v32, v14

    const/16 v17, 0x2

    aget v14, v34, v17

    mul-float v33, v33, v14

    add-float v33, v33, v32

    div-float v14, v33, v30

    const v32, 0x3c111aa7

    cmpg-float v32, v14, v32

    if-gtz v32, :cond_15

    const v32, 0x4461d2f7

    mul-float v14, v14, v32

    move/from16 v32, v0

    goto :goto_f

    :cond_15
    move/from16 v32, v0

    float-to-double v0, v14

    invoke-static {v0, v1}, Ljava/lang/Math;->cbrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    const/high16 v1, 0x42e80000    # 116.0f

    mul-float/2addr v0, v1

    const/high16 v1, 0x41800000    # 16.0f

    sub-float v14, v0, v1

    :goto_f
    sub-float v0, v4, v14

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x3e4ccccd    # 0.2f

    cmpg-float v1, v0, v1

    if-gez v1, :cond_16

    invoke-static/range {v32 .. v32}, Lq/a;->a(I)Lq/a;

    move-result-object v1

    move/from16 v32, v0

    iget v0, v1, Lq/a;->c:F

    move-object/from16 v33, v2

    iget v2, v1, Lq/a;->b:F

    invoke-static {v0, v2, v9}, Lq/a;->b(FFF)Lq/a;

    move-result-object v0

    iget v2, v1, Lq/a;->d:F

    move/from16 v34, v2

    iget v2, v0, Lq/a;->d:F

    sub-float v2, v34, v2

    move/from16 v34, v2

    iget v2, v1, Lq/a;->e:F

    move/from16 v35, v2

    iget v2, v0, Lq/a;->e:F

    sub-float v2, v35, v2

    move/from16 v35, v2

    iget v2, v1, Lq/a;->f:F

    iget v0, v0, Lq/a;->f:F

    sub-float/2addr v2, v0

    mul-float v0, v34, v34

    mul-float v34, v35, v35

    add-float v34, v34, v0

    mul-float/2addr v2, v2

    add-float v2, v2, v34

    move-object/from16 v34, v1

    float-to-double v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    move/from16 v35, v3

    const-wide v2, 0x3fe428f5c28f5c29L    # 0.63

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    const-wide v2, 0x3ff68f5c28f5c28fL    # 1.41

    mul-double/2addr v0, v2

    double-to-float v0, v0

    cmpg-float v1, v0, v18

    if-gtz v1, :cond_17

    move/from16 v24, v0

    move/from16 v23, v32

    move-object/from16 v27, v34

    goto :goto_10

    :cond_16
    move-object/from16 v33, v2

    move/from16 v35, v3

    :cond_17
    :goto_10
    cmpl-float v0, v23, v22

    if-nez v0, :cond_18

    cmpl-float v0, v24, v22

    if-nez v0, :cond_18

    :goto_11
    move-object/from16 v0, v27

    goto :goto_13

    :cond_18
    cmpg-float v0, v14, v4

    if-gez v0, :cond_19

    move/from16 v25, v12

    goto :goto_12

    :cond_19
    move/from16 v26, v12

    :goto_12
    move-object/from16 v1, p2

    move/from16 v12, v30

    move-object/from16 v0, v31

    move-object/from16 v2, v33

    move/from16 v3, v35

    goto/16 :goto_e

    :cond_1a
    move-object/from16 v31, v0

    move-object/from16 v33, v2

    move/from16 v35, v3

    move/from16 v30, v12

    const/16 v17, 0x2

    goto :goto_11

    :goto_13
    if-eqz v20, :cond_1c

    if-eqz v0, :cond_1b

    invoke-virtual {v0, v10}, Lq/a;->c(Lq/n;)I

    move-result v0

    :goto_14
    move v10, v0

    goto :goto_17

    :cond_1b
    sub-float v0, v11, v21

    div-float v0, v0, v29

    add-float v15, v0, v21

    move-object/from16 v1, p2

    move/from16 v12, v30

    move-object/from16 v0, v31

    move-object/from16 v2, v33

    move/from16 v3, v35

    const/16 v20, 0x0

    goto/16 :goto_d

    :cond_1c
    if-nez v0, :cond_1d

    move v11, v15

    goto :goto_15

    :cond_1d
    move-object v7, v0

    move/from16 v21, v15

    :goto_15
    sub-float v0, v11, v21

    div-float v0, v0, v29

    add-float v15, v0, v21

    move-object/from16 v1, p2

    move/from16 v12, v30

    move-object/from16 v0, v31

    move-object/from16 v2, v33

    move/from16 v3, v35

    goto/16 :goto_d

    :cond_1e
    move-object/from16 v31, v0

    move-object/from16 v33, v2

    move/from16 v35, v3

    if-nez v7, :cond_1f

    invoke-static {v4}, Lq/b;->a(F)I

    move-result v0

    goto :goto_14

    :cond_1f
    invoke-virtual {v7, v10}, Lq/a;->c(Lq/n;)I

    move-result v0

    goto :goto_14

    :goto_16
    invoke-static {v4}, Lq/b;->a(F)I

    move-result v0

    goto :goto_14

    :cond_20
    move-object/from16 v31, v0

    move-object/from16 v33, v2

    move/from16 v35, v3

    :goto_17
    const v0, 0xffffff

    and-int/2addr v0, v10

    shl-int/lit8 v1, v13, 0x18

    or-int v10, v0, v1

    :goto_18
    add-int/lit8 v0, v8, 0x1

    array-length v1, v5

    const/16 v2, 0x8

    if-le v0, v1, :cond_22

    const/4 v1, 0x4

    if-gt v8, v1, :cond_21

    move v1, v2

    goto :goto_19

    :cond_21
    mul-int/lit8 v1, v8, 0x2

    :goto_19
    new-array v1, v1, [I

    const/4 v3, 0x0

    invoke-static {v5, v3, v1, v3, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v5, v1

    :cond_22
    aput v10, v5, v8

    array-length v1, v6

    if-le v0, v1, :cond_24

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    const/4 v3, 0x4

    if-gt v8, v3, :cond_23

    goto :goto_1a

    :cond_23
    mul-int/lit8 v2, v8, 0x2

    :goto_1a
    invoke-static {v1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v6, v3, v1, v3, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v6, v1

    :cond_24
    aput-object v31, v6, v8

    check-cast v6, [[I

    move-object/from16 v1, p2

    move v8, v0

    move/from16 v4, v16

    move-object/from16 v2, v33

    move/from16 v3, v35

    const/4 v7, 0x0

    move-object/from16 v0, p0

    goto/16 :goto_1

    :goto_1b
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v4, v16

    move-object/from16 v2, v33

    move/from16 v3, v35

    const/4 v7, 0x0

    goto/16 :goto_1

    :cond_25
    new-array v0, v8, [I

    new-array v1, v8, [[I

    const/4 v3, 0x0

    invoke-static {v5, v3, v0, v3, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {v6, v3, v1, v3, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    new-instance v2, Landroid/content/res/ColorStateList;

    invoke-direct {v2, v1, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v2

    :cond_26
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": invalid color state list tag "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_27
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v1, "No start tag found"

    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
