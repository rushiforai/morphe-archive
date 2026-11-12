.class public final Lq8i;
.super Ls8i;
.source "SourceFile"


# instance fields
.field public f:I

.field public g:I

.field public h:[F

.field public final i:Landroid/graphics/RectF;

.field public j:Landroid/graphics/Path;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;II)V
    .registers 5

    const/4 v0, 0x0

    .line 21
    invoke-direct {p0, p1, v0}, Ls8i;-><init>(Landroid/graphics/Bitmap;I)V

    .line 22
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lq8i;->i:Landroid/graphics/RectF;

    .line 23
    invoke-virtual {p0, p2, p3}, Lq8i;->a(II)V

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;[F)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Ls8i;-><init>(Landroid/graphics/Bitmap;I)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lq8i;->i:Landroid/graphics/RectF;

    iput-object p2, p0, Lq8i;->h:[F

    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lq8i;->j:Landroid/graphics/Path;

    return-void
.end method


# virtual methods
.method public final a(II)V
    .registers 4

    iget v0, p0, Lq8i;->f:I

    if-ne v0, p1, :cond_d

    iget v0, p0, Lq8i;->g:I

    if-ne v0, p2, :cond_d

    iget-object v0, p0, Lq8i;->h:[F

    if-nez v0, :cond_d

    return-void

    :cond_d
    iput p1, p0, Lq8i;->f:I

    iput p2, p0, Lq8i;->g:I

    const/4 v0, 0x0

    iput-object v0, p0, Lq8i;->h:[F

    if-eq p1, p2, :cond_1b

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    :cond_1b
    iput-object v0, p0, Lq8i;->j:Landroid/graphics/Path;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    iget-object v3, v0, Lq8i;->i:Landroid/graphics/RectF;

    invoke-virtual {v3, v2}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    iget v2, v0, Lq8i;->f:I

    iget v4, v0, Lq8i;->g:I

    iget-object v5, v0, Lq8i;->j:Landroid/graphics/Path;

    iget-object v6, v0, Ls8i;->c:Landroid/graphics/Paint;

    if-nez v5, :cond_1c

    int-to-float v0, v2

    invoke-virtual {v1, v3, v0, v0, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    return-void

    :cond_1c
    iget-object v7, v0, Lq8i;->h:[F

    if-eqz v7, :cond_2d

    const/4 v2, 0x0

    aget v2, v7, v2

    const/4 v4, 0x1

    aget v4, v7, v4

    const/4 v8, 0x2

    aget v8, v7, v8

    const/4 v9, 0x3

    aget v7, v7, v9

    goto :goto_31

    :cond_2d
    int-to-float v2, v2

    int-to-float v4, v4

    move v7, v2

    move v8, v4

    :goto_31
    invoke-virtual {v5}, Landroid/graphics/Path;->rewind()V

    iget-object v5, v0, Lq8i;->j:Landroid/graphics/Path;

    iget v9, v3, Landroid/graphics/RectF;->right:F

    iget v10, v3, Landroid/graphics/RectF;->top:F

    add-float/2addr v10, v4

    invoke-virtual {v5, v9, v10}, Landroid/graphics/Path;->moveTo(FF)V

    iget-object v11, v0, Lq8i;->j:Landroid/graphics/Path;

    iget v12, v3, Landroid/graphics/RectF;->right:F

    iget v15, v3, Landroid/graphics/RectF;->top:F

    add-float v5, v15, v4

    sget v9, Ls8i;->e:F

    mul-float v10, v4, v9

    sub-float v13, v5, v10

    sub-float v5, v12, v4

    mul-float v10, v4, v9

    add-float v14, v10, v5

    sub-float v16, v12, v4

    move/from16 v17, v15

    invoke-virtual/range {v11 .. v17}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    iget-object v4, v0, Lq8i;->j:Landroid/graphics/Path;

    iget v5, v3, Landroid/graphics/RectF;->left:F

    add-float/2addr v5, v2

    iget v10, v3, Landroid/graphics/RectF;->top:F

    invoke-virtual {v4, v5, v10}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v11, v0, Lq8i;->j:Landroid/graphics/Path;

    iget v14, v3, Landroid/graphics/RectF;->left:F

    add-float v4, v14, v2

    mul-float v5, v2, v9

    sub-float v12, v4, v5

    iget v13, v3, Landroid/graphics/RectF;->top:F

    add-float v4, v13, v2

    mul-float v5, v2, v9

    sub-float v15, v4, v5

    add-float v17, v13, v2

    move/from16 v16, v14

    invoke-virtual/range {v11 .. v17}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    iget-object v2, v0, Lq8i;->j:Landroid/graphics/Path;

    iget v4, v3, Landroid/graphics/RectF;->left:F

    iget v5, v3, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v5, v7

    invoke-virtual {v2, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v10, v0, Lq8i;->j:Landroid/graphics/Path;

    iget v11, v3, Landroid/graphics/RectF;->left:F

    iget v14, v3, Landroid/graphics/RectF;->bottom:F

    sub-float v2, v14, v7

    mul-float v4, v7, v9

    add-float v12, v4, v2

    add-float v2, v11, v7

    mul-float v4, v7, v9

    sub-float v13, v2, v4

    add-float v15, v11, v7

    move/from16 v16, v14

    invoke-virtual/range {v10 .. v16}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    iget-object v2, v0, Lq8i;->j:Landroid/graphics/Path;

    iget v4, v3, Landroid/graphics/RectF;->right:F

    sub-float/2addr v4, v8

    iget v5, v3, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v2, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v10, v0, Lq8i;->j:Landroid/graphics/Path;

    iget v13, v3, Landroid/graphics/RectF;->right:F

    sub-float v2, v13, v8

    mul-float v4, v8, v9

    add-float v11, v4, v2

    iget v12, v3, Landroid/graphics/RectF;->bottom:F

    sub-float v2, v12, v8

    mul-float/2addr v9, v8

    add-float v14, v9, v2

    sub-float v16, v12, v8

    move v15, v13

    invoke-virtual/range {v10 .. v16}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    iget-object v2, v0, Lq8i;->j:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    iget-object v0, v0, Lq8i;->j:Landroid/graphics/Path;

    invoke-virtual {v1, v0, v6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method
