.class public final Lywl;
.super Landroid/view/GestureDetector;
.source "SourceFile"


# static fields
.field public static final synthetic c:[Lxtb;


# instance fields
.field public final a:Lro9;

.field public final b:Lfz2;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lpee;

    const-class v1, Lywl;

    const-string v2, "enabled"

    const-string v3, "getEnabled()Z"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lywl;->c:[Lxtb;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lft7;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    new-instance p1, Lro9;

    invoke-direct {p1, p2}, Lro9;-><init>(Lft7;)V

    iput-object p1, p0, Lywl;->a:Lro9;

    new-instance p1, Lfz2;

    invoke-direct {p1, p2}, Lfz2;-><init>(Lft7;)V

    iput-object p1, p0, Lywl;->b:Lfz2;

    return-void
.end method


# virtual methods
.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    sget-object v2, Lywl;->c:[Lxtb;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    iget-object v2, v0, Lywl;->b:Lfz2;

    iget-object v2, v2, La7f;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_16

    return v3

    :cond_16
    iget-object v2, v0, Lywl;->a:Lro9;

    iget-object v4, v2, Lro9;->c:Ljava/lang/Object;

    move-object v9, v4

    check-cast v9, Lft7;

    iget-object v4, v9, Lft7;->g:Lcom/opera/hype/image/editor/EditImage;

    iget-object v5, v9, Lft7;->f:Let7;

    iget-object v6, v2, Lro9;->d:Ljava/lang/Object;

    move-object v13, v6

    check-cast v13, Landroid/graphics/PointF;

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v6

    if-eqz v6, :cond_21f

    const/4 v7, 0x3

    const/4 v8, 0x1

    const/4 v10, 0x2

    const/4 v11, -0x1

    const/4 v12, 0x0

    if-eq v6, v8, :cond_16e

    if-eq v6, v10, :cond_68

    if-eq v6, v7, :cond_16e

    const/4 v4, 0x6

    if-ne v6, v4, :cond_23a

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget v6, v2, Lro9;->b:I

    if-ne v4, v6, :cond_4b

    move-object v12, v5

    :cond_4b
    if-eqz v12, :cond_23a

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v4

    if-nez v4, :cond_54

    move v3, v8

    :cond_54
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    iput v4, v13, Landroid/graphics/PointF;->x:F

    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    iput v4, v13, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    iput v3, v2, Lro9;->b:I

    goto/16 :goto_23a

    :cond_68
    iget v2, v2, Lro9;->b:I

    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v2

    if-eq v2, v11, :cond_23a

    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v14

    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    iget v6, v13, Landroid/graphics/PointF;->x:F

    sub-float v6, v14, v6

    iget v7, v13, Landroid/graphics/PointF;->y:F

    sub-float v7, v2, v7

    sget-object v11, Lft7;->h:[Lxtb;

    aget-object v11, v11, v3

    iget-object v5, v5, La7f;->b:Ljava/lang/Object;

    move-object v11, v5

    check-cast v11, Lht7;

    if-eqz v11, :cond_168

    iget-object v5, v11, Lht7;->c:Lgt7;

    iget-object v12, v11, Lht7;->b:Landroid/view/View;

    iget-object v15, v11, Lht7;->a:Lbfl;

    iget-object v15, v15, Lbfl;->e:Lcom/opera/hype/image/editor/TextBoxFrame;

    move/from16 v16, v3

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_14f

    if-eq v3, v8, :cond_a3

    if-eq v3, v10, :cond_a3

    invoke-static {}, Lh9o;->p()V

    return v16

    :cond_a3
    invoke-virtual {v15}, Landroid/view/View;->getWidth()I

    move-result v3

    div-int/2addr v3, v10

    int-to-float v3, v3

    invoke-virtual {v15}, Landroid/view/View;->getTranslationX()F

    move-result v17

    sub-float v3, v3, v17

    invoke-virtual {v15}, Landroid/view/View;->getHeight()I

    move-result v17

    move/from16 v18, v10

    div-int/lit8 v10, v17, 0x2

    int-to-float v10, v10

    invoke-virtual {v15}, Landroid/view/View;->getTranslationY()F

    move-result v17

    sub-float v10, v10, v17

    invoke-virtual {v15}, Landroid/view/View;->getLeft()I

    move-result v8

    int-to-float v8, v8

    add-float/2addr v8, v3

    invoke-virtual {v15}, Landroid/view/View;->getTop()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v0, v10

    sub-float/2addr v8, v14

    move/from16 v19, v6

    move/from16 v20, v7

    float-to-double v6, v8

    sub-float/2addr v0, v2

    move-object/from16 v21, v9

    float-to-double v8, v0

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v6

    double-to-float v8, v6

    invoke-virtual {v12}, Landroid/view/View;->getX()F

    move-result v0

    invoke-virtual {v12}, Landroid/view/View;->getWidth()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    add-float/2addr v0, v6

    sub-float/2addr v0, v3

    invoke-virtual {v12}, Landroid/view/View;->getY()F

    move-result v3

    invoke-virtual {v12}, Landroid/view/View;->getHeight()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    add-float/2addr v3, v6

    sub-float/2addr v3, v10

    float-to-double v6, v0

    float-to-double v9, v3

    invoke-static {v6, v7, v9, v10}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v6

    double-to-float v7, v6

    invoke-virtual {v15}, Landroid/view/View;->getRotation()F

    move-result v6

    const/high16 v9, 0x43340000    # 180.0f

    div-float/2addr v6, v9

    float-to-double v9, v6

    const-wide v22, 0x400921fb54442d18L    # Math.PI

    mul-double v9, v9, v22

    double-to-float v6, v9

    float-to-double v9, v6

    move v12, v7

    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    double-to-float v6, v6

    mul-float/2addr v6, v0

    move v15, v6

    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    double-to-float v6, v6

    mul-float/2addr v6, v3

    sub-float v6, v15, v6

    div-float/2addr v6, v12

    move v15, v6

    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    double-to-float v6, v6

    mul-float/2addr v0, v6

    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    double-to-float v6, v6

    mul-float/2addr v3, v6

    add-float/2addr v3, v0

    div-float/2addr v3, v12

    mul-float v6, v19, v15

    mul-float v7, v20, v3

    add-float/2addr v7, v6

    neg-float v0, v3

    mul-float v6, v19, v0

    mul-float v0, v20, v15

    add-float v10, v0, v6

    sget-object v0, Lgt7;->b:Lgt7;

    if-ne v5, v0, :cond_13d

    const/4 v6, 0x1

    goto :goto_13f

    :cond_13d
    move/from16 v6, v16

    :goto_13f
    iget-object v0, v4, Lcom/opera/hype/image/editor/EditImage;->g:Lbpd;

    new-instance v5, Lct7;

    move v9, v12

    move v12, v7

    move v7, v9

    move-object/from16 v9, v21

    invoke-direct/range {v5 .. v12}, Lct7;-><init>(ZFFLft7;FLht7;F)V

    invoke-virtual {v0, v5}, Lbpd;->c0(Lkotlin/jvm/functions/Function1;)Z

    goto :goto_165

    :cond_14f
    move/from16 v19, v6

    move/from16 v20, v7

    invoke-virtual {v15}, Landroid/view/View;->getTranslationX()F

    move-result v0

    add-float v0, v0, v19

    invoke-virtual {v15, v0}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {v15}, Landroid/view/View;->getTranslationY()F

    move-result v0

    add-float v0, v0, v20

    invoke-virtual {v15, v0}, Landroid/view/View;->setTranslationY(F)V

    :goto_165
    invoke-virtual {v4}, Landroid/view/View;->invalidate()V

    :cond_168
    iput v14, v13, Landroid/graphics/PointF;->x:F

    iput v2, v13, Landroid/graphics/PointF;->y:F

    goto/16 :goto_23a

    :cond_16e
    move/from16 v16, v3

    move/from16 v18, v10

    iput v11, v2, Lro9;->b:I

    iget-object v0, v9, Lft7;->c:[F

    sget-object v2, Lft7;->h:[Lxtb;

    aget-object v2, v2, v16

    iget-object v3, v5, La7f;->b:Ljava/lang/Object;

    check-cast v3, Lht7;

    if-eqz v3, :cond_23a

    iget-object v6, v3, Lht7;->a:Lbfl;

    iget-object v8, v6, Lbfl;->b:Lba3;

    iget-object v9, v6, Lbfl;->e:Lcom/opera/hype/image/editor/TextBoxFrame;

    iget-object v10, v4, Lcom/opera/hype/image/editor/EditImage;->g:Lbpd;

    invoke-virtual {v5, v2, v12}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget-object v2, v3, Lht7;->c:Lgt7;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    if-eqz v2, :cond_1d9

    const/4 v5, 0x1

    if-eq v2, v5, :cond_19e

    move/from16 v5, v18

    if-eq v2, v5, :cond_1d9

    invoke-static {}, Lh9o;->p()V

    return v16

    :cond_19e
    iget-object v2, v10, Lbpd;->c:Ljava/lang/Object;

    check-cast v2, Li97;

    iget-object v3, v10, Lbpd;->b:Ljava/lang/Object;

    check-cast v3, Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {v2, v3}, Li97;->c(Lcom/opera/hype/image/editor/EditImage;)Z

    move-result v3

    if-eqz v3, :cond_1b8

    invoke-virtual {v9}, Landroid/view/View;->getScaleX()F

    move-result v3

    iget v2, v2, Li97;->c:F

    div-float/2addr v3, v2

    invoke-virtual {v9}, Landroid/view/View;->getScaleY()F

    aput v3, v0, v16

    :cond_1b8
    invoke-virtual {v9}, Landroid/view/View;->getRotation()F

    move-result v2

    aget v0, v0, v16

    iget-object v3, v8, Lba3;->g:Laa3;

    sget-object v5, Lba3;->j:[Lxtb;

    const/16 v18, 0x2

    aget-object v9, v5, v18

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v3, v9, v0}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget-object v0, v8, Lba3;->h:Laa3;

    aget-object v3, v5, v7

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    goto :goto_217

    :cond_1d9
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    new-instance v2, Lcv2;

    const/16 v5, 0x1c

    invoke-direct {v2, v0, v3, v5}, Lcv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v10, v2}, Lbpd;->c0(Lkotlin/jvm/functions/Function1;)Z

    iget-object v2, v8, Lba3;->f:Laa3;

    sget-object v3, Lba3;->j:[Lxtb;

    const/16 v17, 0x1

    aget-object v3, v3, v17

    invoke-virtual {v2, v3, v0}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v9}, Landroid/view/View;->isLaidOut()Z

    move-result v0

    if-eqz v0, :cond_20f

    invoke-virtual {v9}, Landroid/view/View;->isLayoutRequested()Z

    move-result v0

    if-nez v0, :cond_20f

    invoke-virtual {v9}, Landroid/view/View;->invalidate()V

    new-instance v0, Lwr9;

    const/16 v2, 0x8

    invoke-direct {v0, v9, v9, v2}, Lwr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v9, v0}, Lkff;->a(Landroid/view/View;Ljava/lang/Runnable;)Lkff;

    goto :goto_217

    :cond_20f
    new-instance v0, Ldt7;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v9, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :goto_217
    sget-object v0, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    move/from16 v0, v16

    invoke-virtual {v4, v6, v0}, Lcom/opera/hype/image/editor/EditImage;->a(Lbfl;Z)V

    goto :goto_23a

    :cond_21f
    move v0, v3

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    iput v3, v13, Landroid/graphics/PointF;->x:F

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    iput v3, v13, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, v2, Lro9;->b:I

    :cond_23a
    :goto_23a
    invoke-super/range {p0 .. p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
