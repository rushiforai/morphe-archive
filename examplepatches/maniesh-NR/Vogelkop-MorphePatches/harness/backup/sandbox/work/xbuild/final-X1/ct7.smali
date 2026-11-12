.class public final synthetic Lct7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:F

.field public final synthetic c:F

.field public final synthetic d:Lft7;

.field public final synthetic e:F

.field public final synthetic f:Lht7;

.field public final synthetic g:F


# direct methods
.method public synthetic constructor <init>(ZFFLft7;FLht7;F)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lct7;->a:Z

    iput p2, p0, Lct7;->b:F

    iput p3, p0, Lct7;->c:F

    iput-object p4, p0, Lct7;->d:Lft7;

    iput p5, p0, Lct7;->e:F

    iput-object p6, p0, Lct7;->f:Lht7;

    iput p7, p0, Lct7;->g:F

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lct7;->f:Lht7;

    iget-object v2, v1, Lht7;->a:Lbfl;

    move-object/from16 v3, p1

    check-cast v3, Li97;

    iget-boolean v4, v0, Lct7;->a:Z

    iget-object v5, v0, Lct7;->d:Lft7;

    if-eqz v4, :cond_33

    iget v6, v3, Li97;->c:F

    iget v7, v0, Lct7;->b:F

    mul-float/2addr v7, v6

    iget v6, v0, Lct7;->c:F

    sub-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    div-float/2addr v6, v7

    const/high16 v7, 0x3f800000    # 1.0f

    add-float/2addr v6, v7

    iget v7, v5, Lft7;->d:F

    iget v8, v3, Li97;->c:F

    mul-float/2addr v7, v8

    mul-float/2addr v7, v6

    iget v6, v0, Lct7;->e:F

    div-float/2addr v6, v7

    iget-object v7, v2, Lbfl;->e:Lcom/opera/hype/image/editor/TextBoxFrame;

    invoke-virtual {v7}, Landroid/view/View;->getRotation()F

    move-result v8

    add-float/2addr v8, v6

    invoke-virtual {v7, v8}, Landroid/view/View;->setRotation(F)V

    :cond_33
    iget v5, v5, Lft7;->e:I

    int-to-float v5, v5

    iget v0, v0, Lct7;->g:F

    div-float/2addr v0, v5

    iget-object v5, v2, Lbfl;->e:Lcom/opera/hype/image/editor/TextBoxFrame;

    iget-object v1, v1, Lht7;->b:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getScaleX()F

    move-result v6

    add-float/2addr v6, v0

    iget-object v7, v2, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    iget-object v8, v2, Lbfl;->d:Lrf2;

    iget-object v9, v2, Lbfl;->b:Lba3;

    invoke-virtual {v5}, Landroid/view/View;->getScaleY()F

    move-result v10

    add-float/2addr v10, v0

    iget-object v11, v3, Li97;->d:Landroid/graphics/PointF;

    iget v12, v3, Li97;->c:F

    div-float/2addr v6, v12

    iput v6, v11, Landroid/graphics/PointF;->x:F

    div-float/2addr v10, v12

    iput v10, v11, Landroid/graphics/PointF;->y:F

    if-eqz v4, :cond_91

    invoke-virtual {v9}, Lba3;->g()F

    move-result v1

    invoke-virtual {v2}, Lbfl;->b()Z

    move-result v3

    const/high16 v4, 0x3f000000    # 0.5f

    if-nez v3, :cond_77

    iget v3, v11, Landroid/graphics/PointF;->x:F

    cmpl-float v6, v3, v4

    if-ltz v6, :cond_77

    cmpg-float v3, v3, v1

    if-gtz v3, :cond_77

    invoke-virtual {v5}, Landroid/view/View;->getScaleX()F

    move-result v3

    add-float/2addr v3, v0

    invoke-virtual {v5, v3}, Landroid/view/View;->setScaleX(F)V

    :cond_77
    invoke-virtual {v2}, Lbfl;->b()Z

    move-result v2

    if-nez v2, :cond_13c

    iget v2, v11, Landroid/graphics/PointF;->y:F

    cmpl-float v3, v2, v4

    if-ltz v3, :cond_13c

    cmpg-float v1, v2, v1

    if-gtz v1, :cond_13c

    invoke-virtual {v5}, Landroid/view/View;->getScaleY()F

    move-result v1

    add-float/2addr v1, v0

    invoke-virtual {v5, v1}, Landroid/view/View;->setScaleY(F)V

    goto/16 :goto_13c

    :cond_91
    instance-of v4, v9, Loel;

    if-eqz v4, :cond_13c

    check-cast v9, Loel;

    iget-object v4, v9, Loel;->k:Landroid/graphics/PointF;

    if-eqz v4, :cond_13c

    iget-object v6, v8, Lrf2;->c:Landroid/view/View;

    iget-object v9, v8, Lrf2;->i:Ljava/lang/Object;

    check-cast v9, Landroid/view/View;

    iget-object v10, v8, Lrf2;->h:Landroid/view/View;

    iget-object v12, v8, Lrf2;->d:Landroid/view/View;

    invoke-static {v1, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    const/4 v14, 0x1

    if-nez v6, :cond_bf

    invoke-static {v1, v12}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    const/4 v15, -0x1

    if-nez v6, :cond_c2

    invoke-static {v1, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_c2

    invoke-static {v1, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c1

    :cond_bf
    move v15, v14

    goto :goto_c2

    :cond_c1
    const/4 v15, 0x0

    :cond_c2
    :goto_c2
    iget v6, v4, Landroid/graphics/PointF;->x:F

    iget v13, v11, Landroid/graphics/PointF;->x:F

    mul-float/2addr v6, v13

    iget v13, v4, Landroid/graphics/PointF;->y:F

    iget v11, v11, Landroid/graphics/PointF;->y:F

    mul-float/2addr v13, v11

    invoke-static {v1, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    const/high16 v11, 0x40000000    # 2.0f

    if-nez v10, :cond_da

    invoke-static {v1, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_101

    :cond_da
    float-to-double v9, v6

    const-wide v16, 0x3fc999999999999aL    # 0.2

    cmpl-double v16, v9, v16

    if-ltz v16, :cond_101

    const-wide v16, 0x3fee666666666666L    # 0.95

    cmpg-double v9, v9, v16

    if-gtz v9, :cond_101

    invoke-virtual {v5}, Landroid/view/View;->getTranslationX()F

    move-result v9

    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move-result v10

    mul-int/2addr v10, v15

    int-to-float v10, v10

    mul-float/2addr v10, v0

    div-float/2addr v10, v11

    add-float/2addr v10, v9

    invoke-virtual {v5, v10}, Landroid/view/View;->setTranslationX(F)V

    iput v6, v4, Landroid/graphics/PointF;->x:F

    move v6, v14

    goto :goto_102

    :cond_101
    const/4 v6, 0x0

    :goto_102
    invoke-static {v1, v12}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_110

    iget-object v8, v8, Lrf2;->c:Landroid/view/View;

    invoke-static {v1, v8}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_136

    :cond_110
    float-to-double v8, v13

    const-wide v16, 0x3fa999999999999aL    # 0.05

    cmpl-double v1, v8, v16

    if-ltz v1, :cond_136

    const-wide v16, 0x3fe3333333333333L    # 0.6

    cmpg-double v1, v8, v16

    if-gtz v1, :cond_136

    invoke-virtual {v5}, Landroid/view/View;->getTranslationY()F

    move-result v1

    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    move-result v6

    mul-int/2addr v6, v15

    int-to-float v6, v6

    mul-float/2addr v6, v0

    div-float/2addr v6, v11

    add-float/2addr v6, v1

    invoke-virtual {v5, v6}, Landroid/view/View;->setTranslationY(F)V

    iput v13, v4, Landroid/graphics/PointF;->y:F

    goto :goto_137

    :cond_136
    move v14, v6

    :goto_137
    if-eqz v14, :cond_13c

    invoke-virtual {v2, v3}, Lbfl;->d(Li97;)V

    :cond_13c
    :goto_13c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0
.end method
