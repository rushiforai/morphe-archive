.class public final Lakn;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:F

.field public final synthetic c:Lw6j;


# direct methods
.method public constructor <init>(Lw6j;)V
    .registers 2

    iput-object p1, p0, Lakn;->c:Lw6j;

    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public final onScale(Landroid/view/ScaleGestureDetector;)Z
    .registers 18

    move-object/from16 v0, p0

    iget-object v1, v0, Lakn;->c:Lw6j;

    invoke-virtual {v1}, Lw6j;->k()Z

    move-result v2

    iget-object v3, v1, Lw6j;->a:Ljava/lang/Object;

    move-object v4, v3

    check-cast v4, Lzjn;

    if-nez v2, :cond_11

    const/4 v0, 0x0

    return v0

    :cond_11
    invoke-virtual/range {p1 .. p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v3

    invoke-virtual/range {p1 .. p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v5

    iget v6, v0, Lakn;->a:F

    sub-float/2addr v5, v6

    neg-float v5, v5

    invoke-virtual/range {p1 .. p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v6

    iget v7, v0, Lakn;->b:F

    sub-float/2addr v6, v7

    neg-float v6, v6

    iget-object v7, v1, Lw6j;->e:Ljava/lang/Object;

    check-cast v7, Llkn;

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v7

    iget-object v8, v1, Lw6j;->e:Ljava/lang/Object;

    check-cast v8, Llkn;

    invoke-virtual {v8}, Llkn;->b()I

    move-result v8

    iget-object v9, v1, Lw6j;->e:Ljava/lang/Object;

    check-cast v9, Llkn;

    invoke-virtual {v9}, Llkn;->a()I

    move-result v9

    invoke-virtual {v4, v7, v8, v9}, Lzjn;->a(Landroid/graphics/Rect;II)F

    move-result v7

    invoke-virtual/range {p1 .. p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v8

    mul-float/2addr v8, v7

    const/high16 v7, 0x40400000    # 3.0f

    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    move-result v7

    iget-object v8, v1, Lw6j;->e:Ljava/lang/Object;

    check-cast v8, Llkn;

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v8

    iget-object v9, v1, Lw6j;->e:Ljava/lang/Object;

    check-cast v9, Llkn;

    invoke-virtual {v9}, Llkn;->b()I

    move-result v9

    iget-object v10, v1, Lw6j;->e:Ljava/lang/Object;

    check-cast v10, Llkn;

    invoke-virtual {v10}, Llkn;->a()I

    move-result v10

    invoke-virtual {v4, v8, v9, v10}, Lzjn;->a(Landroid/graphics/Rect;II)F

    move-result v11

    invoke-virtual {v4, v8, v9, v10}, Lzjn;->b(Landroid/graphics/Rect;II)Landroid/graphics/RectF;

    move-result-object v12

    iget v13, v12, Landroid/graphics/RectF;->left:F

    div-float/2addr v13, v11

    div-float v14, v2, v11

    add-float/2addr v14, v13

    iget v12, v12, Landroid/graphics/RectF;->top:F

    div-float/2addr v12, v11

    div-float v11, v3, v11

    add-float/2addr v11, v12

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v12

    int-to-float v12, v12

    div-float/2addr v2, v12

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v12

    int-to-float v12, v12

    div-float/2addr v3, v12

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v12

    int-to-float v12, v12

    int-to-float v13, v9

    div-float/2addr v12, v13

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v13

    int-to-float v13, v13

    int-to-float v15, v10

    div-float/2addr v13, v15

    invoke-static {v12, v13}, Ljava/lang/Math;->max(FF)F

    move-result v12

    div-float/2addr v7, v12

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-static {v12, v7}, Ljava/lang/Math;->max(FF)F

    move-result v7

    iput v7, v4, Lzjn;->a:F

    invoke-virtual {v4, v8, v9, v10}, Lzjn;->a(Landroid/graphics/Rect;II)F

    move-result v7

    mul-float/2addr v14, v7

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v12

    int-to-float v12, v12

    mul-float/2addr v2, v12

    sub-float/2addr v14, v2

    add-float/2addr v14, v5

    mul-float/2addr v11, v7

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v3, v2

    sub-float/2addr v11, v3

    add-float/2addr v11, v6

    move-object v5, v8

    move v6, v9

    move v7, v10

    move v9, v11

    move v8, v14

    invoke-virtual/range {v4 .. v9}, Lzjn;->c(Landroid/graphics/Rect;IIFF)V

    iget-object v2, v1, Lw6j;->e:Ljava/lang/Object;

    check-cast v2, Llkn;

    iget-object v3, v2, Llkn;->i:Lzjn;

    invoke-virtual {v4, v3}, Lzjn;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_df

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v5, v4, Lzjn;->a:F

    iput v5, v3, Lzjn;->a:F

    iget v5, v4, Lzjn;->b:F

    iput v5, v3, Lzjn;->b:F

    iget v4, v4, Lzjn;->c:F

    iput v4, v3, Lzjn;->c:F

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_df
    iget-object v1, v1, Lw6j;->b:Ljava/lang/Object;

    check-cast v1, Lemn;

    invoke-virtual {v1}, Lemn;->run()V

    invoke-virtual/range {p1 .. p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v1

    iput v1, v0, Lakn;->a:F

    invoke-virtual/range {p1 .. p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v1

    iput v1, v0, Lakn;->b:F

    const/4 v0, 0x1

    return v0
.end method

.method public final onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .registers 3

    iget-object v0, p0, Lakn;->c:Lw6j;

    invoke-virtual {v0}, Lw6j;->k()Z

    move-result v0

    if-nez v0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v0

    iput v0, p0, Lakn;->a:F

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result p1

    iput p1, p0, Lakn;->b:F

    const/4 p0, 0x1

    return p0
.end method
