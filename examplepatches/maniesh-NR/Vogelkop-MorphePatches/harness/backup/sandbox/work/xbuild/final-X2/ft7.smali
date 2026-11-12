.class public final Lft7;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# static fields
.field public static final synthetic h:[Lxtb;


# instance fields
.field public final a:Landroid/graphics/Rect;

.field public final b:Landroid/graphics/Matrix;

.field public final c:[F

.field public final d:F

.field public final e:I

.field public final f:Let7;

.field public final synthetic g:Lcom/opera/hype/image/editor/EditImage;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lpee;

    const-class v1, Lft7;

    const-string v2, "target"

    const-string v3, "getTarget()Lcom/opera/hype/image/editor/EditImage$TouchTarget;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lft7;->h:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lcom/opera/hype/image/editor/EditImage;)V
    .registers 6

    iput-object p1, p0, Lft7;->g:Lcom/opera/hype/image/editor/EditImage;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lft7;->a:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lft7;->b:Landroid/graphics/Matrix;

    const/4 v0, 0x1

    new-array v1, v0, [F

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput v2, v1, v3

    iput-object v1, p0, Lft7;->c:[F

    const/high16 v1, 0x3fc00000    # 1.5f

    iput v1, p0, Lft7;->d:F

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    const/high16 v2, 0x42a00000    # 80.0f

    invoke-static {v0, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lft7;->e:I

    new-instance v0, Let7;

    invoke-direct {v0, p1}, Let7;-><init>(Lcom/opera/hype/image/editor/EditImage;)V

    iput-object v0, p0, Lft7;->f:Let7;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/MotionEvent;Lgt7;Lkotlin/jvm/functions/Function1;)Lht7;
    .registers 6

    invoke-virtual {p0, p1, p3}, Lft7;->b(Landroid/view/MotionEvent;Lkotlin/jvm/functions/Function1;)Lbfl;

    move-result-object p1

    if-eqz p1, :cond_23

    iget-object p0, p0, Lft7;->g:Lcom/opera/hype/image/editor/EditImage;

    iget-object v0, p0, Lcom/opera/hype/image/editor/EditImage;->j:Lbfl;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/opera/hype/image/editor/EditImage;->c(ZZ)Z

    iget-object p0, p1, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    invoke-virtual {p0, v1}, Landroid/view/View;->performHapticFeedback(I)Z

    invoke-interface {p3, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    new-instance p3, Lht7;

    invoke-direct {p3, p1, p0, p2}, Lht7;-><init>(Lbfl;Landroid/view/View;Lgt7;)V

    return-object p3

    :cond_23
    const/4 p0, 0x0

    return-object p0
.end method

.method public final b(Landroid/view/MotionEvent;Lkotlin/jvm/functions/Function1;)Lbfl;
    .registers 21

    move-object/from16 v0, p0

    iget-object v1, v0, Lft7;->g:Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {v1}, Lcom/opera/hype/image/editor/EditImage;->f()Lv39;

    move-result-object v1

    new-instance v2, Lu39;

    invoke-direct {v2, v1}, Lu39;-><init>(Lv39;)V

    const/4 v1, 0x0

    :cond_e
    :goto_e
    invoke-virtual {v2}, Lu39;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9a

    invoke-virtual {v2}, Lu39;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lbfl;

    move-object/from16 v5, p2

    invoke-interface {v5, v4}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    if-nez v6, :cond_27

    const/4 v4, 0x0

    goto :goto_95

    :cond_27
    iget-object v7, v0, Lft7;->a:Landroid/graphics/Rect;

    invoke-virtual {v6, v7}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    iget-object v4, v4, Lbfl;->e:Lcom/opera/hype/image/editor/TextBoxFrame;

    invoke-static {v4, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_87

    invoke-virtual {v4}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v6

    iget-object v8, v0, Lft7;->b:Landroid/graphics/Matrix;

    invoke-virtual {v6, v8}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    move-result v6

    if-eqz v6, :cond_87

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    iget v9, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    int-to-float v9, v9

    sub-float v15, v6, v9

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    iget v4, v4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    int-to-float v4, v4

    sub-float v16, v6, v4

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v10

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v12

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v14

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getMetaState()I

    move-result v17

    invoke-static/range {v10 .. v17}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v4

    :try_start_6c
    invoke-virtual {v4, v8}, Landroid/view/MotionEvent;->transform(Landroid/graphics/Matrix;)V

    invoke-virtual {v4}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v4}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    float-to-int v8, v8

    invoke-virtual {v7, v6, v8}, Landroid/graphics/Rect;->contains(II)Z

    move-result v6
    :try_end_7d
    .catchall {:try_start_6c .. :try_end_7d} :catchall_82

    invoke-virtual {v4}, Landroid/view/MotionEvent;->recycle()V

    move v4, v6

    goto :goto_95

    :catchall_82
    move-exception v0

    invoke-virtual {v4}, Landroid/view/MotionEvent;->recycle()V

    throw v0

    :cond_87
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v7, v4, v6}, Landroid/graphics/Rect;->contains(II)Z

    move-result v4

    :goto_95
    if-eqz v4, :cond_e

    move-object v1, v3

    goto/16 :goto_e

    :cond_9a
    check-cast v1, Lbfl;

    return-object v1
.end method

.method public final onDown(Landroid/view/MotionEvent;)Z
    .registers 5

    sget-object v0, Lgt7;->c:Lgt7;

    new-instance v1, Lm57;

    const/16 v2, 0x14

    invoke-direct {v1, v2}, Lm57;-><init>(B)V

    invoke-virtual {p0, p1, v0, v1}, Lft7;->a(Landroid/view/MotionEvent;Lgt7;Lkotlin/jvm/functions/Function1;)Lht7;

    move-result-object v1

    if-nez v1, :cond_65

    new-instance v1, Lm57;

    const/16 v2, 0x15

    invoke-direct {v1, v2}, Lm57;-><init>(B)V

    invoke-virtual {p0, p1, v0, v1}, Lft7;->a(Landroid/view/MotionEvent;Lgt7;Lkotlin/jvm/functions/Function1;)Lht7;

    move-result-object v1

    if-nez v1, :cond_65

    new-instance v1, Lm57;

    const/16 v2, 0x16

    invoke-direct {v1, v2}, Lm57;-><init>(B)V

    invoke-virtual {p0, p1, v0, v1}, Lft7;->a(Landroid/view/MotionEvent;Lgt7;Lkotlin/jvm/functions/Function1;)Lht7;

    move-result-object v1

    if-nez v1, :cond_65

    new-instance v1, Lm57;

    const/16 v2, 0x17

    invoke-direct {v1, v2}, Lm57;-><init>(B)V

    invoke-virtual {p0, p1, v0, v1}, Lft7;->a(Landroid/view/MotionEvent;Lgt7;Lkotlin/jvm/functions/Function1;)Lht7;

    move-result-object v1

    if-nez v1, :cond_65

    new-instance v0, Lm57;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Lm57;-><init>(B)V

    sget-object v1, Lgt7;->b:Lgt7;

    invoke-virtual {p0, p1, v1, v0}, Lft7;->a(Landroid/view/MotionEvent;Lgt7;Lkotlin/jvm/functions/Function1;)Lht7;

    move-result-object v0

    if-nez v0, :cond_64

    new-instance v0, Lm57;

    const/16 v2, 0x19

    invoke-direct {v0, v2}, Lm57;-><init>(B)V

    invoke-virtual {p0, p1, v1, v0}, Lft7;->a(Landroid/view/MotionEvent;Lgt7;Lkotlin/jvm/functions/Function1;)Lht7;

    move-result-object v0

    if-nez v0, :cond_64

    new-instance v0, Lm57;

    const/16 v2, 0x1a

    invoke-direct {v0, v2}, Lm57;-><init>(B)V

    invoke-virtual {p0, p1, v1, v0}, Lft7;->a(Landroid/view/MotionEvent;Lgt7;Lkotlin/jvm/functions/Function1;)Lht7;

    move-result-object v1

    if-nez v1, :cond_65

    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDown(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    :cond_64
    move-object v1, v0

    :cond_65
    sget-object p1, Lft7;->h:[Lxtb;

    const/4 v0, 0x0

    aget-object p1, p1, v0

    iget-object p0, p0, Lft7;->f:Let7;

    invoke-virtual {p0, p1, v1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    return v0
.end method

.method public final onShowPress(Landroid/view/MotionEvent;)V
    .registers 7

    sget-object v0, Lft7;->h:[Lxtb;

    const/4 v1, 0x0

    aget-object v2, v0, v1

    iget-object v2, p0, Lft7;->f:Let7;

    iget-object v3, v2, La7f;->b:Ljava/lang/Object;

    check-cast v3, Lht7;

    if-eqz v3, :cond_e

    return-void

    :cond_e
    new-instance v3, Lm57;

    const/16 v4, 0x13

    invoke-direct {v3, v4}, Lm57;-><init>(B)V

    sget-object v4, Lgt7;->a:Lgt7;

    invoke-virtual {p0, p1, v4, v3}, Lft7;->a(Landroid/view/MotionEvent;Lgt7;Lkotlin/jvm/functions/Function1;)Lht7;

    move-result-object p0

    aget-object p1, v0, v1

    invoke-virtual {v2, p1, p0}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    return-void
.end method

.method public final onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 7

    new-instance v0, Lm57;

    const/16 v1, 0x12

    invoke-direct {v0, v1}, Lm57;-><init>(B)V

    invoke-virtual {p0, p1, v0}, Lft7;->b(Landroid/view/MotionEvent;Lkotlin/jvm/functions/Function1;)Lbfl;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Lft7;->g:Lcom/opera/hype/image/editor/EditImage;

    if-eqz v0, :cond_19

    iget-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->j:Lbfl;

    if-eq v0, p1, :cond_9c

    invoke-virtual {p0, v0, v2}, Lcom/opera/hype/image/editor/EditImage;->a(Lbfl;Z)V

    return v1

    :cond_19
    invoke-virtual {p0, v1, v2}, Lcom/opera/hype/image/editor/EditImage;->c(ZZ)Z

    move-result v0

    if-eqz v0, :cond_20

    return v1

    :cond_20
    sget-object v0, Lba3;->i:Ly55;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Landroid/graphics/PointF;

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-direct {v0, v3, v3}, Landroid/graphics/PointF;-><init>(FF)V

    iget-object v3, p0, Lcom/opera/hype/image/editor/EditImage;->g:Lbpd;

    iget-object v4, v3, Lbpd;->c:Ljava/lang/Object;

    check-cast v4, Li97;

    iget-object v3, v3, Lbpd;->b:Ljava/lang/Object;

    check-cast v3, Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {v4, v3}, Li97;->c(Lcom/opera/hype/image/editor/EditImage;)Z

    move-result v3

    if-eqz v3, :cond_4b

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v4, v3, p1}, Li97;->b(FF)Landroid/graphics/PointF;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    :cond_4b
    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->m:Lqq6;

    if-eqz p0, :cond_9c

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lywa;

    invoke-virtual {p0}, Lywa;->g0()Llxa;

    move-result-object p0

    iget-object p1, p0, Llxa;->f:Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    iget-object v3, p0, Llxa;->n:Lnak;

    invoke-virtual {v3}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-static {p1, v4}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9c

    invoke-virtual {v3}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnsl;

    if-nez p1, :cond_71

    const/4 p1, -0x1

    goto :goto_79

    :cond_71
    sget-object v3, Ljxa;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v3, p1

    :goto_79
    const/4 v3, 0x2

    if-eq p1, v1, :cond_93

    if-eq p1, v3, :cond_8a

    const/4 v3, 0x3

    if-ne p1, v3, :cond_9c

    new-instance p1, Ldxa;

    invoke-direct {p1, v0, v1}, Ldxa;-><init>(Landroid/graphics/PointF;Z)V

    invoke-virtual {p0, p1}, Lx7n;->f(Ljava/lang/Object;)V

    return v1

    :cond_8a
    new-instance p1, Lhxa;

    invoke-direct {p1, v0}, Lhxa;-><init>(Landroid/graphics/PointF;)V

    invoke-virtual {p0, p1}, Lx7n;->f(Ljava/lang/Object;)V

    return v1

    :cond_93
    new-instance p1, Ldxa;

    invoke-direct {p1, v0, v3}, Ldxa;-><init>(Landroid/graphics/PointF;I)V

    invoke-virtual {p0, p1}, Lx7n;->f(Ljava/lang/Object;)V

    return v1

    :cond_9c
    return v2
.end method
