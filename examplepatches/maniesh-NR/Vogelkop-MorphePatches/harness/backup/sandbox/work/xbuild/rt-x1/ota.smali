.class public final Lota;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Lwim;


# static fields
.field public static final synthetic A:I


# instance fields
.field public final a:Lqim;

.field public final b:Ljava/util/LinkedList;

.field public final c:Lmta;

.field public final d:Lb7f;

.field public final e:Lghf;

.field public final f:Landroid/graphics/drawable/BitmapDrawable;

.field public final g:F

.field public final h:Landroid/graphics/drawable/Drawable;

.field public final i:Landroid/graphics/RectF;

.field public final j:F

.field public final k:I

.field public final l:Landroid/graphics/Paint;

.field public m:Landroid/animation/ValueAnimator;

.field public n:I

.field public final o:Landroid/graphics/PointF;

.field public final p:Landroid/graphics/PointF;

.field public final q:Landroid/graphics/PointF;

.field public final r:Landroid/widget/ImageView;

.field public s:F

.field public final t:Landroid/graphics/PointF;

.field public u:Lz9h;

.field public final v:Landroid/view/WindowManager;

.field public final w:Landroid/view/WindowManager$LayoutParams;

.field public final x:Lz22;

.field public final y:Landroid/view/GestureDetector;

.field public final z:Lwa;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Landroid/graphics/drawable/Drawable;Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/widget/ImageView;FILqim;Lb7f;Lghf;)V
    .registers 39

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    move-object/from16 v4, p6

    move/from16 v5, p7

    move-object/from16 v6, p9

    move-object/from16 v7, p10

    invoke-direct/range {p0 .. p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v8, Lz22;

    const/16 v9, 0x8

    invoke-direct {v8, v0, v9}, Lz22;-><init>(Ljava/lang/Object;B)V

    iput-object v8, v0, Lota;->x:Lz22;

    new-instance v9, Lwa;

    const/16 v10, 0xf

    invoke-direct {v9, v0, v10}, Lwa;-><init>(Ljava/lang/Object;B)V

    iput-object v9, v0, Lota;->z:Lwa;

    new-instance v10, Lmta;

    invoke-direct {v10, v0}, Lmta;-><init>(Lota;)V

    iput-object v10, v0, Lota;->c:Lmta;

    iput-object v6, v0, Lota;->a:Lqim;

    iput-object v7, v0, Lota;->d:Lb7f;

    move-object/from16 v10, p11

    iput-object v10, v0, Lota;->e:Lghf;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    const-string v11, "window"

    invoke-virtual {v10, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/WindowManager;

    iput-object v10, v0, Lota;->v:Landroid/view/WindowManager;

    new-instance v10, Landroid/view/GestureDetector;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v11

    new-instance v12, Lv35;

    const/4 v13, 0x1

    invoke-direct {v12, v0, v13}, Lv35;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v10, v11, v12}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v10, v0, Lota;->y:Landroid/view/GestureDetector;

    new-instance v10, Ljava/util/LinkedList;

    invoke-direct {v10}, Ljava/util/LinkedList;-><init>()V

    iput-object v10, v0, Lota;->b:Ljava/util/LinkedList;

    sget-object v11, Lnta;->a:Lnta;

    invoke-virtual {v10, v11}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    sget-object v11, Lnta;->b:Lnta;

    invoke-virtual {v10, v11}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    sget-object v11, Lnta;->c:Lnta;

    invoke-virtual {v10, v11}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    sget-object v11, Lnta;->e:Lnta;

    invoke-virtual {v10, v11}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    sget-object v11, Lnta;->f:Lnta;

    invoke-virtual {v10, v11}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    const v11, 0x7f0600a8

    invoke-virtual {v10, v11}, Landroid/content/Context;->getColor(I)I

    move-result v10

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f07027d

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v11

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    add-float v14, v5, v11

    move-object v15, v8

    float-to-double v7, v14

    const-wide/high16 v16, 0x4000000000000000L    # 2.0

    mul-double v7, v7, v16

    invoke-static {v7, v8}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v7

    double-to-int v7, v7

    sget-object v8, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    invoke-static {v7, v7, v8}, Lz5i;->u(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v8

    const/high16 v16, 0x40000000    # 2.0f

    if-nez v8, :cond_aa

    const/4 v7, 0x0

    move/from16 v17, v14

    move-object/from16 v18, v15

    goto :goto_e1

    :cond_aa
    new-instance v13, Landroid/graphics/Canvas;

    invoke-direct {v13, v8}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    move/from16 v17, v14

    new-instance v14, Landroid/graphics/Paint;

    invoke-direct {v14}, Landroid/graphics/Paint;-><init>()V

    move-object/from16 v18, v15

    sget-object v15, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    invoke-virtual {v14, v10}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v10, Landroid/graphics/BlurMaskFilter;

    sget-object v15, Landroid/graphics/BlurMaskFilter$Blur;->NORMAL:Landroid/graphics/BlurMaskFilter$Blur;

    invoke-direct {v10, v11, v15}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    invoke-virtual {v14, v10}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    int-to-float v10, v7

    div-float v10, v10, v16

    invoke-virtual {v13, v10, v10, v5, v14}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    new-instance v10, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v10, v12, v8}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    div-int/lit8 v8, v7, 0x2

    neg-int v8, v8

    add-int/2addr v7, v8

    invoke-virtual {v10, v8, v8, v7, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    move-object v7, v10

    :goto_e1
    iput-object v7, v0, Lota;->f:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f07027e

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v7

    iput v7, v0, Lota;->g:F

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    iput-object v8, v0, Lota;->h:Landroid/graphics/drawable/Drawable;

    new-instance v8, Landroid/graphics/RectF;

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v10

    invoke-direct {v8, v10}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iput-object v8, v0, Lota;->i:Landroid/graphics/RectF;

    new-instance v8, Landroid/graphics/PointF;

    const/high16 v10, 0x3fc00000    # 1.5f

    mul-float v14, v17, v10

    invoke-direct {v8, v14, v14}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v8, v0, Lota;->t:Landroid/graphics/PointF;

    new-instance v11, Landroid/graphics/PointF;

    iget v12, v1, Landroid/graphics/PointF;->x:F

    iget v1, v1, Landroid/graphics/PointF;->y:F

    invoke-direct {v11, v12, v1}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v11, v0, Lota;->o:Landroid/graphics/PointF;

    new-instance v1, Landroid/graphics/PointF;

    iget v12, v2, Landroid/graphics/PointF;->x:F

    iget v2, v2, Landroid/graphics/PointF;->y:F

    invoke-direct {v1, v12, v2}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v1, v0, Lota;->p:Landroid/graphics/PointF;

    new-instance v2, Landroid/graphics/PointF;

    iget v12, v3, Landroid/graphics/PointF;->x:F

    iget v3, v3, Landroid/graphics/PointF;->y:F

    invoke-direct {v2, v12, v3}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v2, v0, Lota;->q:Landroid/graphics/PointF;

    iput-object v4, v0, Lota;->r:Landroid/widget/ImageView;

    iput v5, v0, Lota;->j:F

    move/from16 v3, p8

    iput v3, v0, Lota;->k:I

    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, v0, Lota;->l:Landroid/graphics/Paint;

    const/4 v15, 0x1

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    const/4 v3, 0x2

    new-array v3, v3, [I

    invoke-virtual {v4}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 v5, 0x0

    aget v12, v3, v5

    iget v13, v8, Landroid/graphics/PointF;->x:F

    float-to-int v13, v13

    add-int/2addr v12, v13

    aput v12, v3, v5

    aget v13, v3, v15

    iget v8, v8, Landroid/graphics/PointF;->y:F

    float-to-int v8, v8

    add-int/2addr v13, v8

    aput v13, v3, v15

    neg-int v8, v12

    int-to-float v8, v8

    neg-int v12, v13

    int-to-float v12, v12

    invoke-virtual {v11, v8, v12}, Landroid/graphics/PointF;->offset(FF)V

    aget v8, v3, v5

    neg-int v8, v8

    int-to-float v8, v8

    aget v12, v3, v15

    neg-int v12, v12

    int-to-float v12, v12

    invoke-virtual {v1, v8, v12}, Landroid/graphics/PointF;->offset(FF)V

    aget v1, v3, v5

    neg-int v1, v1

    int-to-float v1, v1

    aget v3, v3, v15

    neg-int v3, v3

    int-to-float v3, v3

    invoke-virtual {v2, v1, v3}, Landroid/graphics/PointF;->offset(FF)V

    const/high16 v1, 0x40400000    # 3.0f

    mul-float v14, v17, v1

    float-to-int v1, v14

    mul-float v14, v17, v16

    add-float/2addr v14, v7

    mul-float/2addr v14, v10

    float-to-int v2, v14

    new-instance v19, Landroid/view/WindowManager$LayoutParams;

    iget v3, v11, Landroid/graphics/PointF;->x:F

    float-to-int v3, v3

    iget v5, v11, Landroid/graphics/PointF;->y:F

    float-to-int v5, v5

    const/16 v25, 0x108

    const/16 v26, -0x3

    const/16 v24, 0x2

    move/from16 v20, v1

    move/from16 v21, v2

    move/from16 v22, v3

    move/from16 v23, v5

    invoke-direct/range {v19 .. v26}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIIIII)V

    move-object/from16 v1, v19

    iput-object v1, v0, Lota;->w:Landroid/view/WindowManager$LayoutParams;

    const v2, 0x800033

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    iget-object v1, v6, Lqim;->r:Lh7f;

    invoke-virtual {v1, v0}, Lh7f;->b(Ljava/lang/Object;)Z

    invoke-virtual/range {p10 .. p10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object/from16 v7, p10

    invoke-virtual {v7, v9}, Lb7f;->c(Lorg/chromium/base/Callback;)Ljava/lang/Object;

    move-object/from16 v15, v18

    invoke-virtual {v4, v15}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    new-instance v1, Lhs8;

    const/4 v15, 0x1

    invoke-direct {v1, v0, v15}, Lhs8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object v1

    invoke-virtual {v1, v0}, Lqwe;->b(Landroid/view/View;)V

    invoke-virtual {v0}, Lota;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 26

    move-object/from16 v0, p0

    iget-object v1, v0, Lota;->b:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnta;

    sget-object v3, Lnta;->c:Lnta;

    const/4 v4, 0x0

    if-ne v2, v3, :cond_11

    iput-object v4, v0, Lota;->u:Lz9h;

    :cond_11
    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnta;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string v3, "should never happen"

    if-eqz v1, :cond_2a6

    const/4 v5, 0x1

    iget-object v6, v0, Lota;->r:Landroid/widget/ImageView;

    const-string v7, "y"

    const-string v8, "x"

    const/16 v9, 0xff

    const-string v10, "alpha"

    const-string v11, "scale"

    iget-object v12, v0, Lota;->o:Landroid/graphics/PointF;

    if-eq v1, v5, :cond_1ca

    const/4 v13, 0x2

    const/4 v14, 0x0

    if-eq v1, v13, :cond_132

    const/4 v15, 0x3

    move/from16 v16, v5

    const-wide/16 v4, 0xfa

    if-eq v1, v15, :cond_d5

    const/4 v15, 0x4

    if-eq v1, v15, :cond_72

    const/4 v4, 0x5

    if-ne v1, v4, :cond_6e

    sget-object v1, Lnta;->e:Lnta;

    if-ne v2, v1, :cond_6b

    invoke-virtual {v6}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const/high16 v2, 0x3fa00000    # 1.25f

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0xc8

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    sget-object v2, Llf1;->g:Landroid/view/animation/PathInterpolator;

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Llta;

    invoke-direct {v2, v0, v14}, Llta;-><init>(Lota;B)V

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_6b
    const/4 v1, 0x0

    goto/16 :goto_258

    :cond_6e
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    return-void

    :cond_72
    new-array v1, v13, [F

    fill-array-data v1, :array_2aa

    invoke-static {v11, v1}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    sget-object v2, Llf1;->i:Landroid/view/animation/PathInterpolator;

    new-instance v3, Ljf1;

    invoke-direct {v3, v2}, Ljf1;-><init>(Landroid/view/animation/PathInterpolator;)V

    invoke-virtual {v1, v3}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    filled-new-array {v9, v14}, [I

    move-result-object v3

    invoke-static {v10, v3}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    new-instance v9, Lkf1;

    invoke-direct {v9, v2}, Lkf1;-><init>(Landroid/view/animation/PathInterpolator;)V

    invoke-virtual {v3, v9}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    iget v9, v12, Landroid/graphics/PointF;->x:F

    iget-object v10, v0, Lota;->q:Landroid/graphics/PointF;

    iget v11, v10, Landroid/graphics/PointF;->x:F

    new-array v15, v13, [F

    aput v9, v15, v14

    aput v11, v15, v16

    invoke-static {v8, v15}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    new-instance v9, Ljf1;

    invoke-direct {v9, v2}, Ljf1;-><init>(Landroid/view/animation/PathInterpolator;)V

    invoke-virtual {v8, v9}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    iget v9, v12, Landroid/graphics/PointF;->y:F

    iget v10, v10, Landroid/graphics/PointF;->y:F

    new-array v11, v13, [F

    aput v9, v11, v14

    aput v10, v11, v16

    invoke-static {v7, v11}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v7

    new-instance v9, Ljf1;

    invoke-direct {v9, v2}, Ljf1;-><init>(Landroid/view/animation/PathInterpolator;)V

    invoke-virtual {v7, v9}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    filled-new-array {v3, v1, v8, v7}, [Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofPropertyValuesHolder([Landroid/animation/PropertyValuesHolder;)Landroid/animation/ValueAnimator;

    move-result-object v1

    invoke-virtual {v1, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    sget-object v2, Llf1;->f:Landroid/view/animation/LinearInterpolator;

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    goto/16 :goto_258

    :cond_d5
    new-array v1, v13, [F

    fill-array-data v1, :array_2b2

    invoke-static {v11, v1}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    sget-object v2, Llf1;->i:Landroid/view/animation/PathInterpolator;

    new-instance v3, Ljf1;

    invoke-direct {v3, v2}, Ljf1;-><init>(Landroid/view/animation/PathInterpolator;)V

    invoke-virtual {v1, v3}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    filled-new-array {v9, v14}, [I

    move-result-object v3

    invoke-static {v10, v3}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    new-instance v9, Lkf1;

    invoke-direct {v9, v2}, Lkf1;-><init>(Landroid/view/animation/PathInterpolator;)V

    invoke-virtual {v3, v9}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    iget v9, v12, Landroid/graphics/PointF;->x:F

    new-array v10, v13, [F

    aput v9, v10, v14

    aput v9, v10, v16

    invoke-static {v8, v10}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    new-instance v9, Ljf1;

    invoke-direct {v9, v2}, Ljf1;-><init>(Landroid/view/animation/PathInterpolator;)V

    invoke-virtual {v8, v9}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    iget v9, v12, Landroid/graphics/PointF;->y:F

    new-array v10, v13, [F

    aput v9, v10, v14

    aput v9, v10, v16

    invoke-static {v7, v10}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v7

    new-instance v9, Ljf1;

    invoke-direct {v9, v2}, Ljf1;-><init>(Landroid/view/animation/PathInterpolator;)V

    invoke-virtual {v7, v9}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    filled-new-array {v3, v1, v8, v7}, [Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofPropertyValuesHolder([Landroid/animation/PropertyValuesHolder;)Landroid/animation/ValueAnimator;

    move-result-object v1

    invoke-virtual {v1, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    sget-object v2, Llf1;->f:Landroid/view/animation/LinearInterpolator;

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    goto/16 :goto_258

    :cond_132
    move/from16 v16, v5

    new-instance v1, Lz9h;

    invoke-direct {v1}, Lz9h;-><init>()V

    iput-object v1, v0, Lota;->u:Lz9h;

    iget v1, v0, Lota;->j:F

    const/high16 v2, 0x40000000    # 2.0f

    mul-float v22, v1, v2

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f07027f

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    iget-object v4, v0, Lota;->u:Lz9h;

    iget v5, v0, Lota;->k:I

    iput v5, v4, Lz9h;->b:I

    const/4 v5, -0x1

    iput v5, v4, Lz9h;->c:I

    iget v5, v0, Lota;->j:F

    neg-float v15, v5

    mul-float v23, v3, v2

    const/high16 v24, 0x3f800000    # 1.0f

    move/from16 v19, v15

    move/from16 v21, v5

    move-object/from16 v17, v4

    move/from16 v20, v5

    move/from16 v18, v15

    invoke-virtual/range {v17 .. v24}, Lz9h;->e(FFFFFFF)V

    add-float/2addr v3, v1

    div-float/2addr v3, v1

    new-array v1, v13, [F

    fill-array-data v1, :array_2ba

    invoke-static {v11, v1}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v18

    filled-new-array {v9, v9}, [I

    move-result-object v1

    invoke-static {v10, v1}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v17

    iget v1, v12, Landroid/graphics/PointF;->x:F

    new-array v2, v13, [F

    aput v1, v2, v14

    aput v1, v2, v16

    invoke-static {v8, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v19

    iget v1, v12, Landroid/graphics/PointF;->y:F

    new-array v2, v13, [F

    aput v1, v2, v14

    aput v1, v2, v16

    invoke-static {v7, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v20

    new-array v1, v13, [F

    fill-array-data v1, :array_2c2

    const-string v2, "angle"

    invoke-static {v2, v1}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v21

    new-array v1, v13, [F

    fill-array-data v1, :array_2ca

    const-string v2, "progress"

    invoke-static {v2, v1}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v22

    new-array v1, v13, [F

    aput v3, v1, v14

    aput v3, v1, v16

    const-string v2, "shadow_scale"

    invoke-static {v2, v1}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v23

    filled-new-array/range {v17 .. v23}, [Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofPropertyValuesHolder([Landroid/animation/PropertyValuesHolder;)Landroid/animation/ValueAnimator;

    move-result-object v1

    const-wide/16 v2, 0xdac

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    sget-object v2, Llf1;->f:Landroid/view/animation/LinearInterpolator;

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    goto/16 :goto_258

    :cond_1ca
    move/from16 v16, v5

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v1, v2}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v3

    const/high16 v4, 0x3e800000    # 0.25f

    const/high16 v5, 0x3fc00000    # 1.5f

    invoke-static {v4, v5}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v4

    const v5, 0x3f19999a    # 0.6f

    invoke-static {v5, v2}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v13

    filled-new-array {v3, v4, v13}, [Landroid/animation/Keyframe;

    move-result-object v3

    invoke-static {v11, v3}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    sget-object v4, Llf1;->g:Landroid/view/animation/PathInterpolator;

    new-instance v11, Ljf1;

    invoke-direct {v11, v4}, Ljf1;-><init>(Landroid/view/animation/PathInterpolator;)V

    invoke-virtual {v3, v11}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    filled-new-array {v9, v9}, [I

    move-result-object v4

    invoke-static {v10, v4}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v4

    iget v9, v12, Landroid/graphics/PointF;->x:F

    invoke-static {v1, v9}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v9

    iget v10, v12, Landroid/graphics/PointF;->x:F

    invoke-static {v5, v10}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v10

    iget-object v11, v0, Lota;->p:Landroid/graphics/PointF;

    iget v13, v11, Landroid/graphics/PointF;->x:F

    invoke-static {v2, v13}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v13

    filled-new-array {v9, v10, v13}, [Landroid/animation/Keyframe;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    sget-object v9, Llf1;->l:Landroid/view/animation/PathInterpolator;

    new-instance v10, Ljf1;

    invoke-direct {v10, v9}, Ljf1;-><init>(Landroid/view/animation/PathInterpolator;)V

    invoke-virtual {v8, v10}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    iget v9, v12, Landroid/graphics/PointF;->y:F

    invoke-static {v1, v9}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v1

    iget v9, v12, Landroid/graphics/PointF;->y:F

    invoke-static {v5, v9}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v5

    iget v9, v11, Landroid/graphics/PointF;->y:F

    invoke-static {v2, v9}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v2

    filled-new-array {v1, v5, v2}, [Landroid/animation/Keyframe;

    move-result-object v1

    invoke-static {v7, v1}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    sget-object v2, Llf1;->i:Landroid/view/animation/PathInterpolator;

    new-instance v5, Ljf1;

    invoke-direct {v5, v2}, Ljf1;-><init>(Landroid/view/animation/PathInterpolator;)V

    invoke-virtual {v1, v5}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    filled-new-array {v4, v3, v8, v1}, [Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofPropertyValuesHolder([Landroid/animation/PropertyValuesHolder;)Landroid/animation/ValueAnimator;

    move-result-object v1

    const-wide/16 v2, 0x3e8

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    sget-object v2, Llf1;->f:Landroid/view/animation/LinearInterpolator;

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    :goto_258
    iput-object v1, v0, Lota;->m:Landroid/animation/ValueAnimator;

    if-nez v1, :cond_29f

    iget-object v1, v0, Lota;->a:Lqim;

    iget-object v1, v1, Lqim;->r:Lh7f;

    invoke-virtual {v1, v0}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v1, v0, Lota;->d:Lb7f;

    iget-object v2, v0, Lota;->z:Lwa;

    invoke-virtual {v1, v2}, Lb7f;->a(Lorg/chromium/base/Callback;)V

    iget-object v1, v0, Lota;->x:Lz22;

    invoke-virtual {v6, v1}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v1, v0, Lota;->c:Lmta;

    iget-object v1, v1, Lmta;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->clear()V

    new-instance v1, Llta;

    move/from16 v2, v16

    invoke-direct {v1, v0, v2}, Llta;-><init>(Lota;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    iget-object v0, v0, Lota;->e:Lghf;

    if-eqz v0, :cond_29e

    iget-object v1, v0, Lghf;->d:Ljava/lang/Object;

    check-cast v1, Lwjh;

    iget-object v2, v0, Lghf;->b:Ljava/lang/Object;

    check-cast v2, Lfji;

    iget-object v1, v1, Lwjh;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Laji;

    invoke-virtual {v0}, Laji;->run()V

    :cond_29e
    return-void

    :cond_29f
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    return-void

    :cond_2a6
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    return-void

    :array_2aa
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_2b2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_2ba
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_2c2
    .array-data 4
        0x0
        0x4362ccce    # 226.80002f
    .end array-data

    :array_2ca
    .array-data 4
        0x0
        0x402147ae    # 2.52f
    .end array-data
.end method

.method public final b()V
    .registers 4

    iget-object v0, p0, Lota;->b:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lnta;->c:Lnta;

    if-ne v1, v2, :cond_12

    iget-object v1, p0, Lota;->m:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    invoke-virtual {p0}, Lota;->a()V

    :cond_12
    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c(Z)V
    .registers 2

    if-eqz p1, :cond_5

    invoke-virtual {p0}, Lota;->b()V

    :cond_5
    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 9

    iget-object v0, p0, Lota;->m:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_6f

    const-string v1, "alpha"

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->getAnimatedValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lota;->n:I

    iget-object v0, p0, Lota;->m:Landroid/animation/ValueAnimator;

    const-string v1, "scale"

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->getAnimatedValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lota;->s:F

    iget-object v0, p0, Lota;->m:Landroid/animation/ValueAnimator;

    const-string v1, "x"

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->getAnimatedValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget-object v1, p0, Lota;->o:Landroid/graphics/PointF;

    iput v0, v1, Landroid/graphics/PointF;->x:F

    iget-object v0, p0, Lota;->m:Landroid/animation/ValueAnimator;

    const-string v2, "y"

    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->getAnimatedValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, v1, Landroid/graphics/PointF;->y:F

    iget-object v2, p0, Lota;->w:Landroid/view/WindowManager$LayoutParams;

    iget v3, v2, Landroid/view/WindowManager$LayoutParams;->x:I

    iget v1, v1, Landroid/graphics/PointF;->x:F

    float-to-int v1, v1

    if-ne v3, v1, :cond_52

    iget v3, v2, Landroid/view/WindowManager$LayoutParams;->y:I

    float-to-int v4, v0

    if-eq v3, v4, :cond_5c

    :cond_52
    iput v1, v2, Landroid/view/WindowManager$LayoutParams;->x:I

    float-to-int v0, v0

    iput v0, v2, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object v0, p0, Lota;->v:Landroid/view/WindowManager;

    invoke-interface {v0, p0, v2}, Landroid/view/ViewManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_5c
    iget-object v0, p0, Lota;->m:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_68

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    goto :goto_6b

    :cond_68
    invoke-virtual {p0}, Lota;->a()V

    :goto_6b
    iget v0, p0, Lota;->n:I

    if-gtz v0, :cond_70

    :cond_6f
    return-void

    :cond_70
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    iget-object v1, p0, Lota;->t:Landroid/graphics/PointF;

    iget v2, v1, Landroid/graphics/PointF;->x:F

    iget v1, v1, Landroid/graphics/PointF;->y:F

    invoke-virtual {p1, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget v1, p0, Lota;->s:F

    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v1, p0, Lota;->f:Landroid/graphics/drawable/BitmapDrawable;

    const/4 v2, 0x0

    if-eqz v1, :cond_b2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v3

    iget v4, p0, Lota;->g:F

    invoke-virtual {p1, v2, v4}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v4, p0, Lota;->m:Landroid/animation/ValueAnimator;

    const-string v5, "shadow_scale"

    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->getAnimatedValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_a7

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual {p1, v5, v4}, Landroid/graphics/Canvas;->scale(FF)V

    :cond_a7
    iget v4, p0, Lota;->n:I

    invoke-virtual {v1, v4}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_b2
    iget-object v1, p0, Lota;->u:Lz9h;

    if-eqz v1, :cond_e2

    iget-object v1, p0, Lota;->m:Landroid/animation/ValueAnimator;

    const-string v3, "angle"

    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->getAnimatedValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    float-to-double v3, v1

    const-wide v5, 0x4076800000000000L    # 360.0

    rem-double/2addr v3, v5

    double-to-float v1, v3

    iget-object v3, p0, Lota;->m:Landroid/animation/ValueAnimator;

    const-string v4, "progress"

    invoke-virtual {v3, v4}, Landroid/animation/ValueAnimator;->getAnimatedValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/high16 v4, 0x3f800000    # 1.0f

    rem-float/2addr v3, v4

    iget-object v4, p0, Lota;->u:Lz9h;

    invoke-virtual {v4, p1, v1, v3}, Lz9h;->c(Landroid/graphics/Canvas;FF)V

    :cond_e2
    iget v1, p0, Lota;->j:F

    cmpl-float v3, v1, v2

    if-lez v3, :cond_f7

    iget v3, p0, Lota;->k:I

    iget-object v4, p0, Lota;->l:Landroid/graphics/Paint;

    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget v3, p0, Lota;->n:I

    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p1, v2, v2, v1, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_f7
    iget-object v1, p0, Lota;->i:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v2

    neg-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v4

    neg-float v4, v4

    div-float/2addr v4, v3

    invoke-virtual {p1, v2, v4}, Landroid/graphics/Canvas;->translate(FF)V

    iget v2, p0, Lota;->n:I

    const/16 v3, 0xff

    if-ge v2, v3, :cond_115

    const/16 v3, 0x1f

    invoke-virtual {p1, v1, v2, v3}, Landroid/graphics/Canvas;->saveLayerAlpha(Landroid/graphics/RectF;II)I

    :cond_115
    iget-object p0, p0, Lota;->h:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method
