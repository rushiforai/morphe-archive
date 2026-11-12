.class public final Lzmj;
.super Lvmj;
.source "SourceFile"


# static fields
.field public static final synthetic i:I


# instance fields
.field public final h:Lymj;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lanj;Lumj;IILoa5;Z)V
    .registers 27

    if-nez p3, :cond_8

    invoke-static/range {p2 .. p2}, Lr9h;->t(Ljava/lang/String;)Lanj;

    move-result-object v0

    move-object v6, v0

    goto :goto_a

    :cond_8
    move-object/from16 v6, p3

    :goto_a
    iget-object v8, v6, Lanj;->c:Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v4, p4

    move/from16 v2, p5

    move/from16 v3, p6

    move-object/from16 v5, p7

    invoke-direct/range {v0 .. v5}, Lvmj;-><init>(Landroid/content/Context;IILumj;Loa5;)V

    move-object v9, v0

    new-instance v0, Lymj;

    iget-object v1, v9, Lvmj;->c:Loa5;

    iget v3, v1, Loa5;->a:I

    iget-object v4, v9, Lvmj;->d:Lnrl;

    move-object/from16 v1, p1

    move/from16 v5, p5

    move/from16 v7, p8

    move-object v2, v6

    move/from16 v6, p6

    invoke-direct/range {v0 .. v7}, Lymj;-><init>(Landroid/content/Context;Lanj;ILnrl;IIZ)V

    move-object v1, v0

    move-object v0, v2

    move v2, v5

    move v3, v6

    iput-object v1, v9, Lzmj;->h:Lymj;

    const/4 v6, 0x0

    iget v7, v1, Lymj;->e:F

    iget v9, v1, Lymj;->d:F

    const/high16 v10, 0x40000000    # 2.0f

    iget-object v11, v1, Lymj;->l:Landroid/text/TextPaint;

    if-nez p8, :cond_af

    iget-object v12, v0, Lanj;->a:Ljava/lang/String;

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v13

    const/4 v14, 0x3

    if-lt v13, v14, :cond_af

    iget-boolean v13, v1, Lymj;->c:Z

    if-nez v13, :cond_af

    iget-boolean v4, v4, Lnrl;->a:Z

    if-nez v4, :cond_af

    int-to-float v4, v2

    mul-float v13, v7, v10

    sub-float/2addr v4, v13

    iget v13, v1, Lymj;->g:F

    float-to-int v13, v13

    iget v14, v1, Lymj;->f:F

    float-to-int v14, v14

    move v15, v14

    move v14, v13

    :goto_5e
    if-gt v13, v15, :cond_7d

    add-int v16, v13, v15

    move/from16 p0, v10

    div-int/lit8 v10, v16, 0x2

    int-to-float v5, v10

    invoke-virtual {v11, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v5

    float-to-int v5, v5

    int-to-float v5, v5

    cmpl-float v5, v5, v4

    if-lez v5, :cond_79

    add-int/lit8 v15, v10, -0x1

    :goto_76
    move/from16 v10, p0

    goto :goto_5e

    :cond_79
    add-int/lit8 v13, v10, 0x1

    move v14, v10

    goto :goto_76

    :cond_7d
    move/from16 p0, v10

    int-to-float v5, v14

    invoke-virtual {v11, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v5

    float-to-int v10, v4

    invoke-static {v12, v6, v5, v11, v10}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object v5

    sget-object v10, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    invoke-virtual {v5, v10}, Landroid/text/StaticLayout$Builder;->setAlignment(Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    move-result-object v5

    invoke-virtual {v5}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v10

    const/4 v12, 0x1

    if-ne v10, v12, :cond_b1

    invoke-virtual {v5, v6}, Landroid/text/Layout;->getLineWidth(I)F

    move-result v5

    cmpl-float v4, v5, v4

    if-gtz v4, :cond_b1

    int-to-float v4, v3

    const/high16 v5, 0x420c0000    # 35.0f

    mul-float/2addr v5, v9

    cmpg-float v4, v4, v5

    if-ltz v4, :cond_b1

    move v12, v6

    goto :goto_b2

    :cond_af
    move/from16 p0, v10

    :cond_b1
    const/4 v12, 0x1

    :goto_b2
    iput-boolean v12, v1, Lymj;->b:Z

    if-eqz v12, :cond_ca

    int-to-float v4, v3

    const v5, 0x3f19999a    # 0.6f

    mul-float/2addr v4, v5

    invoke-virtual {v11, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    const-string v4, "sans-serif-condensed"

    :try_start_c0
    invoke-static {v4, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v4
    :try_end_c4
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_c0 .. :try_end_c4} :catch_c5

    goto :goto_c7

    :catch_c5
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    :goto_c7
    invoke-virtual {v11, v4}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    :cond_ca
    iget-boolean v4, v1, Lymj;->b:Z

    iget-object v5, v1, Lymj;->a:Lanj;

    if-eqz v4, :cond_d5

    invoke-virtual {v5}, Lanj;->a()Ljava/lang/String;

    move-result-object v4

    goto :goto_d7

    :cond_d5
    iget-object v4, v5, Lanj;->a:Ljava/lang/String;

    :goto_d7
    invoke-static {v4, v11}, Lymj;->a(Ljava/lang/String;Landroid/text/TextPaint;)Landroid/graphics/Rect;

    move-result-object v5

    iget-boolean v10, v1, Lymj;->b:Z

    if-eqz v10, :cond_fb

    new-instance v0, Landroid/graphics/PointF;

    int-to-float v2, v2

    div-float v2, v2, p0

    invoke-virtual {v5}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v4

    sub-float/2addr v2, v4

    int-to-float v3, v3

    div-float v3, v3, p0

    iget v4, v5, Landroid/graphics/Rect;->top:I

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v4, v5

    int-to-float v4, v4

    div-float v4, v4, p0

    sub-float/2addr v3, v4

    invoke-direct {v0, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v0, v1, Lymj;->i:Landroid/graphics/PointF;

    return-void

    :cond_fb
    const-string v10, "x"

    invoke-static {v10, v11}, Lymj;->a(Ljava/lang/String;Landroid/text/TextPaint;)Landroid/graphics/Rect;

    move-result-object v10

    new-instance v12, Landroid/graphics/PointF;

    int-to-float v2, v2

    div-float v13, v2, p0

    invoke-virtual {v5}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v14

    sub-float/2addr v13, v14

    int-to-float v3, v3

    div-float v14, v3, p0

    iget v15, v10, Landroid/graphics/Rect;->top:I

    iget v10, v10, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v15, v10

    int-to-float v10, v15

    div-float v10, v10, p0

    sub-float/2addr v14, v10

    invoke-direct {v12, v13, v14}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v12, v1, Lymj;->i:Landroid/graphics/PointF;

    iget-object v0, v0, Lanj;->b:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_126

    move-object v10, v8

    goto :goto_127

    :cond_126
    const/4 v10, 0x0

    :goto_127
    iget-object v13, v1, Lymj;->m:Landroid/text/TextPaint;

    if-eqz v10, :cond_130

    invoke-static {v10, v13}, Lymj;->a(Ljava/lang/String;Landroid/text/TextPaint;)Landroid/graphics/Rect;

    move-result-object v10

    goto :goto_131

    :cond_130
    const/4 v10, 0x0

    :goto_131
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_139

    move-object v14, v0

    goto :goto_13a

    :cond_139
    const/4 v14, 0x0

    :goto_13a
    if-eqz v14, :cond_141

    invoke-static {v14, v13}, Lymj;->a(Ljava/lang/String;Landroid/text/TextPaint;)Landroid/graphics/Rect;

    move-result-object v14

    goto :goto_142

    :cond_141
    const/4 v14, 0x0

    :goto_142
    iget v15, v1, Lymj;->h:F

    if-eqz v10, :cond_193

    const-string v12, "pgjyq"

    invoke-static {v4, v12}, Lymj;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Set;

    move-result-object v12

    if-eqz v12, :cond_193

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v13, v8}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v8

    add-float/2addr v8, v7

    sub-float/2addr v8, v15

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v16

    const/16 v17, 0x1

    add-int/lit8 v16, v16, -0x1

    move/from16 v17, v2

    move/from16 v2, v16

    move/from16 v16, v3

    :goto_167
    const/4 v3, -0x1

    if-ge v3, v2, :cond_197

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v12, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_197

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v11, v4, v2, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v3

    cmpl-float v3, v3, v8

    if-ltz v3, :cond_190

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v11, v4, v2, v3, v6}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    iget v2, v5, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v2

    iget v3, v6, Landroid/graphics/Rect;->bottom:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    sub-float/2addr v2, v9

    goto :goto_198

    :cond_190
    add-int/lit8 v2, v2, -0x1

    goto :goto_167

    :cond_193
    move/from16 v17, v2

    move/from16 v16, v3

    :cond_197
    const/4 v2, 0x0

    :goto_198
    if-eqz v14, :cond_1d7

    const-string v3, "dbhkfijlt0-9"

    invoke-static {v4, v3}, Lymj;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Set;

    move-result-object v3

    if-eqz v3, :cond_1d7

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v13, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v0

    add-float/2addr v0, v7

    sub-float/2addr v0, v15

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v8, 0x0

    :cond_1b2
    if-ge v8, v7, :cond_1d7

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v3, v12}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_1d7

    add-int/lit8 v8, v8, 0x1

    const/4 v12, 0x0

    invoke-virtual {v11, v4, v12, v8}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v13

    cmpl-float v13, v13, v0

    if-ltz v13, :cond_1b2

    invoke-virtual {v11, v4, v12, v8, v6}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    iget v0, v5, Landroid/graphics/Rect;->top:I

    neg-int v0, v0

    int-to-float v0, v0

    iget v3, v6, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    neg-float v3, v3

    sub-float/2addr v0, v3

    sub-float/2addr v0, v9

    goto :goto_1d8

    :cond_1d7
    const/4 v0, 0x0

    :goto_1d8
    if-eqz v10, :cond_1fa

    new-instance v3, Landroid/graphics/PointF;

    sub-float v4, v17, v15

    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr v4, v6

    iget-object v6, v1, Lymj;->i:Landroid/graphics/PointF;

    if-nez v6, :cond_1e9

    const/4 v6, 0x0

    :cond_1e9
    iget v6, v6, Landroid/graphics/PointF;->y:F

    iget v7, v5, Landroid/graphics/Rect;->bottom:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v7

    int-to-float v7, v7

    add-float/2addr v6, v7

    sub-float/2addr v6, v2

    invoke-direct {v3, v4, v6}, Landroid/graphics/PointF;-><init>(FF)V

    goto :goto_1fb

    :cond_1fa
    const/4 v3, 0x0

    :goto_1fb
    iput-object v3, v1, Lymj;->j:Landroid/graphics/PointF;

    if-eqz v14, :cond_216

    new-instance v2, Landroid/graphics/PointF;

    iget-object v3, v1, Lymj;->i:Landroid/graphics/PointF;

    if-nez v3, :cond_206

    const/4 v3, 0x0

    :cond_206
    iget v3, v3, Landroid/graphics/PointF;->y:F

    iget v4, v5, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    add-float/2addr v3, v4

    iget v4, v14, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    sub-float/2addr v3, v9

    add-float/2addr v3, v0

    invoke-direct {v2, v15, v3}, Landroid/graphics/PointF;-><init>(FF)V

    goto :goto_217

    :cond_216
    const/4 v2, 0x0

    :goto_217
    iput-object v2, v1, Lymj;->k:Landroid/graphics/PointF;

    if-nez v14, :cond_21d

    if-eqz v10, :cond_25e

    :cond_21d
    if-nez v2, :cond_225

    iget-object v0, v1, Lymj;->i:Landroid/graphics/PointF;

    if-nez v0, :cond_226

    const/4 v0, 0x0

    goto :goto_226

    :cond_225
    move-object v0, v2

    :cond_226
    :goto_226
    iget v0, v0, Landroid/graphics/PointF;->y:F

    if-nez v14, :cond_22b

    move-object v14, v5

    :cond_22b
    iget v3, v14, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    add-float/2addr v0, v3

    iget-object v3, v1, Lymj;->j:Landroid/graphics/PointF;

    if-nez v3, :cond_238

    iget-object v3, v1, Lymj;->i:Landroid/graphics/PointF;

    if-nez v3, :cond_238

    const/4 v3, 0x0

    :cond_238
    iget v3, v3, Landroid/graphics/PointF;->y:F

    if-eqz v10, :cond_23d

    move-object v5, v10

    :cond_23d
    iget v4, v5, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v4

    add-float/2addr v3, v4

    sub-float/2addr v3, v0

    sub-float v3, v16, v3

    div-float v3, v3, p0

    sub-float/2addr v3, v0

    const/4 v0, 0x0

    if-eqz v2, :cond_24d

    invoke-virtual {v2, v0, v3}, Landroid/graphics/PointF;->offset(FF)V

    :cond_24d
    iget-object v2, v1, Lymj;->i:Landroid/graphics/PointF;

    if-nez v2, :cond_253

    const/4 v12, 0x0

    goto :goto_254

    :cond_253
    move-object v12, v2

    :goto_254
    invoke-virtual {v12, v0, v3}, Landroid/graphics/PointF;->offset(FF)V

    iget-object v1, v1, Lymj;->j:Landroid/graphics/PointF;

    if-eqz v1, :cond_25e

    invoke-virtual {v1, v0, v3}, Landroid/graphics/PointF;->offset(FF)V

    :cond_25e
    return-void
.end method


# virtual methods
.method public final b(Landroid/graphics/Canvas;)V
    .registers 8

    iget-object p0, p0, Lzmj;->h:Lymj;

    iget-object v0, p0, Lymj;->m:Landroid/text/TextPaint;

    iget-object v1, p0, Lymj;->a:Lanj;

    iget-boolean v2, p0, Lymj;->b:Z

    if-eqz v2, :cond_f

    invoke-virtual {v1}, Lanj;->a()Ljava/lang/String;

    move-result-object v2

    goto :goto_11

    :cond_f
    iget-object v2, v1, Lanj;->a:Ljava/lang/String;

    :goto_11
    iget-object v3, p0, Lymj;->i:Landroid/graphics/PointF;

    const/4 v4, 0x0

    if-nez v3, :cond_18

    move-object v5, v4

    goto :goto_19

    :cond_18
    move-object v5, v3

    :goto_19
    iget v5, v5, Landroid/graphics/PointF;->x:F

    if-nez v3, :cond_1e

    move-object v3, v4

    :cond_1e
    iget v3, v3, Landroid/graphics/PointF;->y:F

    iget-object v4, p0, Lymj;->l:Landroid/text/TextPaint;

    invoke-virtual {p1, v2, v5, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-boolean v2, p0, Lymj;->b:Z

    if-nez v2, :cond_43

    iget-object v2, p0, Lymj;->j:Landroid/graphics/PointF;

    if-eqz v2, :cond_36

    iget-object v3, v1, Lanj;->c:Ljava/lang/String;

    iget v4, v2, Landroid/graphics/PointF;->x:F

    iget v2, v2, Landroid/graphics/PointF;->y:F

    invoke-virtual {p1, v3, v4, v2, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :cond_36
    iget-object p0, p0, Lymj;->k:Landroid/graphics/PointF;

    if-eqz p0, :cond_43

    iget-object v1, v1, Lanj;->b:Ljava/lang/String;

    iget v2, p0, Landroid/graphics/PointF;->x:F

    iget p0, p0, Landroid/graphics/PointF;->y:F

    invoke-virtual {p1, v1, v2, p0, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :cond_43
    return-void
.end method

.method public final setAlpha(I)V
    .registers 3

    invoke-super {p0, p1}, Lvmj;->setAlpha(I)V

    iget-object p0, p0, Lzmj;->h:Lymj;

    iget-object v0, p0, Lymj;->l:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object p0, p0, Lymj;->m:Landroid/text/TextPaint;

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method
