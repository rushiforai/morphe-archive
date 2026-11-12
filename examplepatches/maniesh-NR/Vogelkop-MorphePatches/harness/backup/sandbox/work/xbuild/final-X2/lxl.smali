.class public final Llxl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final a:Lqq6;

.field public final b:Lcom/opera/hype/image/editor/EditImage;

.field public final c:Landroid/graphics/Path;

.field public final d:Ljava/util/ArrayList;

.field public final e:Landroid/graphics/PointF;

.field public final f:Landroid/graphics/RectF;

.field public g:Z


# direct methods
.method public constructor <init>(Lqq6;Lcom/opera/hype/image/editor/EditImage;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llxl;->a:Lqq6;

    iput-object p2, p0, Llxl;->b:Lcom/opera/hype/image/editor/EditImage;

    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Llxl;->c:Landroid/graphics/Path;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Llxl;->d:Ljava/util/ArrayList;

    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    iput-object p1, p0, Llxl;->e:Landroid/graphics/PointF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Llxl;->f:Landroid/graphics/RectF;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/MotionEvent;)V
    .registers 26

    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p1}, Llxl;->c(Landroid/view/MotionEvent;)V

    iget-object v1, v0, Llxl;->d:Ljava/util/ArrayList;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-le v2, v3, :cond_f7

    new-instance v2, Ljava/util/BitSet;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/BitSet;-><init>(I)V

    invoke-virtual {v2, v5}, Ljava/util/BitSet;->set(I)V

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3}, Ljava/util/BitSet;->set(I)V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v6, Lx7g;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v7

    sub-int/2addr v7, v4

    invoke-direct {v6, v5, v7}, Lx7g;-><init>(II)V

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_3a
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_dc

    invoke-static {v4, v3}, Lvep;->r(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lx7g;

    iget v7, v6, Lx7g;->a:I

    iget v6, v6, Lx7g;->b:I

    add-int/lit8 v8, v7, 0x1

    const/4 v9, -0x1

    const/4 v10, 0x0

    :goto_4e
    if-ge v8, v6, :cond_c0

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/graphics/PointF;

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/graphics/PointF;

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/graphics/PointF;

    iget v14, v13, Landroid/graphics/PointF;->x:F

    iget v15, v12, Landroid/graphics/PointF;->x:F

    sub-float v4, v14, v15

    iget v13, v13, Landroid/graphics/PointF;->y:F

    iget v12, v12, Landroid/graphics/PointF;->y:F

    sub-float v5, v13, v12

    move/from16 v18, v13

    move/from16 v17, v14

    float-to-double v13, v4

    const-wide/16 v19, 0x0

    cmpg-double v13, v13, v19

    if-nez v13, :cond_7e

    float-to-double v13, v5

    cmpg-double v13, v13, v19

    if-eqz v13, :cond_ac

    :cond_7e
    iget v13, v11, Landroid/graphics/PointF;->x:F

    sub-float/2addr v13, v15

    mul-float/2addr v13, v4

    iget v14, v11, Landroid/graphics/PointF;->y:F

    invoke-static {v14, v12, v5, v13}, Lv0g;->g(FFFF)F

    move-result v13

    mul-float v14, v4, v4

    mul-float v21, v5, v5

    add-float v21, v21, v14

    div-float v13, v13, v21

    move v14, v4

    move/from16 v21, v5

    float-to-double v4, v13

    const-wide/high16 v22, 0x3ff0000000000000L    # 1.0

    cmpl-double v22, v4, v22

    if-lez v22, :cond_9f

    move/from16 v14, v17

    move/from16 v13, v18

    goto :goto_ae

    :cond_9f
    cmpl-double v4, v4, v19

    if-lez v4, :cond_ac

    mul-float v4, v14, v13

    add-float v14, v4, v15

    mul-float v5, v21, v13

    add-float v13, v5, v12

    goto :goto_ae

    :cond_ac
    move v13, v12

    move v14, v15

    :goto_ae
    iget v4, v11, Landroid/graphics/PointF;->x:F

    sub-float/2addr v4, v14

    iget v5, v11, Landroid/graphics/PointF;->y:F

    sub-float/2addr v5, v13

    mul-float/2addr v4, v4

    mul-float/2addr v5, v5

    add-float/2addr v5, v4

    cmpl-float v4, v5, v10

    if-lez v4, :cond_bd

    move v10, v5

    move v9, v8

    :cond_bd
    add-int/lit8 v8, v8, 0x1

    goto :goto_4e

    :cond_c0
    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v4, v10, v4

    if-lez v4, :cond_d9

    invoke-virtual {v2, v9}, Ljava/util/BitSet;->set(I)V

    new-instance v4, Lx7g;

    invoke-direct {v4, v7, v9}, Lx7g;-><init>(II)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v4, Lx7g;

    invoke-direct {v4, v9, v6}, Lx7g;-><init>(II)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_d9
    const/4 v4, 0x1

    goto/16 :goto_3a

    :cond_dc
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v5

    :goto_e6
    if-ltz v5, :cond_f6

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v2, v5}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v5

    goto :goto_e6

    :cond_f6
    move-object v1, v3

    :cond_f7
    iget-object v2, v0, Llxl;->b:Lcom/opera/hype/image/editor/EditImage;

    iget-object v3, v2, Lcom/opera/hype/image/editor/EditImage;->g:Lbpd;

    iget-object v4, v3, Lbpd;->c:Ljava/lang/Object;

    check-cast v4, Li97;

    iget-object v3, v3, Lbpd;->b:Ljava/lang/Object;

    check-cast v3, Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {v4, v3}, Li97;->c(Lcom/opera/hype/image/editor/EditImage;)Z

    move-result v3

    if-eqz v3, :cond_125

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_10d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_125

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/PointF;

    iget v6, v5, Landroid/graphics/PointF;->x:F

    iget v7, v5, Landroid/graphics/PointF;->y:F

    invoke-virtual {v4, v6, v7}, Li97;->b(FF)Landroid/graphics/PointF;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    goto :goto_10d

    :cond_125
    iget-object v3, v2, Lcom/opera/hype/image/editor/EditImage;->i:Lat7;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_166

    const/4 v4, 0x1

    if-eq v3, v4, :cond_14e

    const/4 v4, 0x4

    if-eq v3, v4, :cond_135

    const/4 v1, 0x0

    goto :goto_16c

    :cond_135
    new-instance v3, Lf76;

    iget-object v4, v2, Lcom/opera/hype/image/editor/EditImage;->q:Li76;

    iget-object v4, v4, Li76;->b:Lfz2;

    sget-object v5, Li76;->d:[Lxtb;

    const/16 v16, 0x0

    aget-object v5, v5, v16

    iget-object v4, v4, La7f;->b:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    invoke-direct {v3, v1, v4}, Lf76;-><init>(Ljava/util/List;I)V

    :goto_14c
    move-object v1, v3

    goto :goto_16c

    :cond_14e
    const/16 v16, 0x0

    new-instance v3, Lv6g;

    iget-object v4, v2, Lcom/opera/hype/image/editor/EditImage;->n:Lo8g;

    iget-object v4, v4, Lo8g;->b:Lfz2;

    sget-object v5, Lo8g;->d:[Lxtb;

    aget-object v5, v5, v16

    iget-object v4, v4, La7f;->b:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    invoke-direct {v3, v1, v4}, Lv6g;-><init>(Ljava/util/List;I)V

    goto :goto_14c

    :cond_166
    new-instance v3, Lok3;

    invoke-direct {v3, v1}, Lok3;-><init>(Ljava/util/List;)V

    goto :goto_14c

    :goto_16c
    if-eqz v1, :cond_173

    iget-object v2, v2, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    invoke-virtual {v2, v1}, Ldya;->b(Lfya;)V

    :cond_173
    invoke-virtual {v0}, Llxl;->b()V

    return-void
.end method

.method public final b()V
    .registers 5

    iget-boolean v0, p0, Llxl;->g:Z

    const/4 v1, 0x0

    iput-boolean v1, p0, Llxl;->g:Z

    iget-object v2, p0, Llxl;->c:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    iget-object v2, p0, Llxl;->e:Landroid/graphics/PointF;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v3}, Landroid/graphics/PointF;->set(FF)V

    iget-object v2, p0, Llxl;->f:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->setEmpty()V

    iget-object v2, p0, Llxl;->d:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    if-eqz v0, :cond_23

    iget-object p0, p0, Llxl;->b:Lcom/opera/hype/image/editor/EditImage;

    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->l:Lrdb;

    invoke-virtual {p0, v1}, Lrdb;->a(Z)V

    :cond_23
    return-void
.end method

.method public final c(Landroid/view/MotionEvent;)V
    .registers 13

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iget-object v2, p0, Llxl;->e:Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->x:F

    invoke-static {v3, v0}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iget-object v4, p0, Llxl;->f:Landroid/graphics/RectF;

    iput v3, v4, Landroid/graphics/RectF;->left:F

    iget v3, v2, Landroid/graphics/PointF;->x:F

    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    move-result v3

    iput v3, v4, Landroid/graphics/RectF;->right:F

    iget v3, v2, Landroid/graphics/PointF;->y:F

    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iput v3, v4, Landroid/graphics/RectF;->top:F

    iget v3, v2, Landroid/graphics/PointF;->y:F

    invoke-static {v3, v1}, Ljava/lang/Math;->max(FF)F

    move-result v3

    iput v3, v4, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getHistorySize()I

    move-result v3

    const/4 v5, 0x0

    :goto_31
    iget-object v6, p0, Llxl;->d:Ljava/util/ArrayList;

    iget-object v7, p0, Llxl;->c:Landroid/graphics/Path;

    if-ge v5, v3, :cond_6f

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getHistoricalX(I)F

    move-result v8

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getHistoricalY(I)F

    move-result v9

    iget v10, v4, Landroid/graphics/RectF;->left:F

    cmpg-float v10, v8, v10

    if-gez v10, :cond_48

    iput v8, v4, Landroid/graphics/RectF;->left:F

    goto :goto_50

    :cond_48
    iget v10, v4, Landroid/graphics/RectF;->right:F

    cmpl-float v10, v8, v10

    if-lez v10, :cond_50

    iput v8, v4, Landroid/graphics/RectF;->right:F

    :cond_50
    :goto_50
    iget v10, v4, Landroid/graphics/RectF;->top:F

    cmpg-float v10, v9, v10

    if-gez v10, :cond_59

    iput v9, v4, Landroid/graphics/RectF;->top:F

    goto :goto_61

    :cond_59
    iget v10, v4, Landroid/graphics/RectF;->bottom:F

    cmpl-float v10, v9, v10

    if-lez v10, :cond_61

    iput v9, v4, Landroid/graphics/RectF;->bottom:F

    :cond_61
    :goto_61
    invoke-virtual {v7, v8, v9}, Landroid/graphics/Path;->lineTo(FF)V

    new-instance v7, Landroid/graphics/PointF;

    invoke-direct {v7, v8, v9}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_31

    :cond_6f
    invoke-virtual {v7, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget p1, v4, Landroid/graphics/RectF;->left:F

    const/4 v3, 0x0

    sub-float/2addr p1, v3

    float-to-int p1, p1

    iget v5, v4, Landroid/graphics/RectF;->top:F

    sub-float/2addr v5, v3

    float-to-int v5, v5

    iget v6, v4, Landroid/graphics/RectF;->right:F

    add-float/2addr v6, v3

    float-to-int v6, v6

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v4, v3

    float-to-int v3, v4

    iget-object p0, p0, Llxl;->b:Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {p0, p1, v5, v6, v3}, Landroid/view/View;->invalidate(IIII)V

    invoke-virtual {v2, v0, v1}, Landroid/graphics/PointF;->set(FF)V

    return-void
.end method

.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 12

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    iget-object v0, p0, Llxl;->d:Ljava/util/ArrayList;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-gt p1, v2, :cond_b6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-eqz p1, :cond_2a

    if-eq p1, v2, :cond_22

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1a

    const/4 v0, 0x3

    if-eq p1, v0, :cond_22

    goto/16 :goto_ba

    :cond_1a
    iget-boolean p1, p0, Llxl;->g:Z

    if-eqz p1, :cond_ba

    invoke-virtual {p0, p2}, Llxl;->c(Landroid/view/MotionEvent;)V

    return v2

    :cond_22
    iget-boolean p1, p0, Llxl;->g:Z

    if-eqz p1, :cond_ba

    invoke-virtual {p0, p2}, Llxl;->a(Landroid/view/MotionEvent;)V

    return v2

    :cond_2a
    iget-object p1, p0, Llxl;->a:Lqq6;

    iget-object p1, p1, Lqq6;->b:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    sget-object p1, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    new-instance v5, Llqh;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    new-instance v7, Llqh;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    iget-object p1, v4, Lcom/opera/hype/image/editor/EditImage;->g:Lbpd;

    new-instance v3, Lxs7;

    invoke-direct/range {v3 .. v8}, Lxs7;-><init>(Lcom/opera/hype/image/editor/EditImage;Llqh;FLlqh;F)V

    invoke-virtual {p1, v3}, Lbpd;->c0(Lkotlin/jvm/functions/Function1;)Z

    move-result p1

    if-eqz p1, :cond_b5

    iget-boolean p1, v5, Llqh;->a:Z

    if-eqz p1, :cond_b5

    iget-boolean p1, v7, Llqh;->a:Z

    if-eqz p1, :cond_b5

    iput-boolean v2, p0, Llxl;->g:Z

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    iget-object v3, p0, Llxl;->c:Landroid/graphics/Path;

    invoke-virtual {v3, p1, p2}, Landroid/graphics/Path;->moveTo(FF)V

    new-instance v3, Landroid/graphics/PointF;

    invoke-direct {v3, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Llxl;->e:Landroid/graphics/PointF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    iget-object p0, p0, Llxl;->b:Lcom/opera/hype/image/editor/EditImage;

    iget-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->i:Lat7;

    sget-object p2, Lat7;->e:Lat7;

    if-ne p1, p2, :cond_b0

    iget-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iget-object p1, p1, Ldya;->d:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v3, v1

    :cond_8c
    :goto_8c
    if-ge v3, v0, :cond_9c

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    instance-of v5, v4, Lf76;

    if-eqz v5, :cond_8c

    invoke-virtual {p2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8c

    :cond_9c
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_a0
    if-ge v1, p1, :cond_b0

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    check-cast v0, Lf76;

    iget-object v3, p0, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    invoke-virtual {v3, v0}, Ldya;->c(Lfya;)V

    goto :goto_a0

    :cond_b0
    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->l:Lrdb;

    invoke-virtual {p0, v2}, Lrdb;->a(Z)V

    :cond_b5
    return v2

    :cond_b6
    iget-boolean p1, p0, Llxl;->g:Z

    if-nez p1, :cond_bb

    :cond_ba
    :goto_ba
    return v1

    :cond_bb
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/16 v0, 0xa

    if-ge p1, v0, :cond_c7

    invoke-virtual {p0}, Llxl;->b()V

    return v1

    :cond_c7
    invoke-virtual {p0, p2}, Llxl;->a(Landroid/view/MotionEvent;)V

    return v1
.end method
