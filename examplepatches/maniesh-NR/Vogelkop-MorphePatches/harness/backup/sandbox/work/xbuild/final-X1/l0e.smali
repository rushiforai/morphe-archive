.class public final Ll0e;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# instance fields
.field public final a:I

.field public b:Z

.field public c:F

.field public d:Z

.field public final synthetic e:Lm0e;


# direct methods
.method public constructor <init>(Lm0e;)V
    .registers 2

    iput-object p1, p0, Ll0e;->e:Lm0e;

    iget-object p1, p1, Lm0e;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    invoke-static {p1}, Lcom/opera/android/utilities/DisplayUtil;->f(Landroid/content/Context;)V

    sget p1, Lcom/opera/android/utilities/DisplayUtil;->d:I

    iput p1, p0, Ll0e;->a:I

    return-void
.end method


# virtual methods
.method public final onDown(Landroid/view/MotionEvent;)Z
    .registers 3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_9

    iput-boolean v0, p0, Ll0e;->b:Z

    :cond_9
    const/4 p0, 0x0

    return p0
.end method

.method public final onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 5

    iget-object p0, p0, Ll0e;->e:Lm0e;

    iget-object p0, p0, Lm0e;->d:Lyhe;

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lz5l;

    iget-object p1, p0, Lz5l;->z:Lzc3;

    const/high16 p2, 0x40400000    # 3.0f

    iput p2, p1, Lzc3;->d:F

    iget-object p0, p0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    neg-float p2, p3

    invoke-static {p2}, Lzed;->b(F)I

    move-result p2

    const/4 p3, 0x0

    invoke-virtual {p0, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->O(II)Z

    move-result p0

    const/high16 p2, 0x3f800000    # 1.0f

    iput p2, p1, Lzc3;->d:F

    return p0
.end method

.method public final onLongPress(Landroid/view/MotionEvent;)V
    .registers 2

    return-void
.end method

.method public final onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 10

    iget-boolean p4, p0, Ll0e;->b:Z

    const/4 v0, 0x0

    const/high16 v1, 0x40000000    # 2.0f

    const/4 v2, 0x0

    if-eqz p4, :cond_23

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    sub-float/2addr p4, v3

    add-float/2addr p3, p4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    iput v2, p0, Ll0e;->c:F

    iput-boolean v0, p0, Ll0e;->b:Z

    goto :goto_44

    :cond_23
    iget p1, p0, Ll0e;->a:I

    const/16 p2, 0xf0

    if-gt p1, p2, :cond_44

    iget p1, p0, Ll0e;->c:F

    cmpl-float p2, p1, v2

    if-eqz p2, :cond_3b

    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    move-result p1

    invoke-static {p3}, Ljava/lang/Math;->signum(F)F

    move-result p2

    cmpl-float p1, p1, p2

    if-nez p1, :cond_3c

    :cond_3b
    move v2, p3

    :cond_3c
    iget p1, p0, Ll0e;->c:F

    sub-float/2addr p3, p1

    div-float/2addr p3, v1

    add-float/2addr p3, p1

    iput p3, p0, Ll0e;->c:F

    move p3, v2

    :cond_44
    :goto_44
    iget-object p1, p0, Ll0e;->e:Lm0e;

    iget-object p1, p1, Lm0e;->c:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    iget-boolean p2, p0, Ll0e;->d:Z

    const/4 p4, 0x1

    if-nez p2, :cond_56

    iput-boolean p4, p0, Ll0e;->d:Z

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->Y()Ls14;

    move-result-object p0

    invoke-virtual {p0, p4, v0}, Ls14;->J(II)Z

    :cond_56
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    const/high16 p2, 0x40800000    # 4.0f

    mul-float/2addr p0, p2

    div-float p2, p3, p0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v2, v2, v3

    if-lez v2, :cond_77

    mul-float/2addr v1, p2

    invoke-static {p2}, Ljava/lang/Math;->signum(F)F

    move-result v2

    mul-float/2addr v2, v1

    sub-float/2addr v2, v3

    goto :goto_7f

    :cond_77
    float-to-double v1, p2

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    double-to-float v2, v1

    :goto_7f
    invoke-static {p2}, Ljava/lang/Math;->signum(F)F

    move-result p2

    mul-float/2addr p2, v2

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr p2, v1

    mul-float/2addr p2, p0

    const/high16 p0, 0x40400000    # 3.0f

    mul-float/2addr p2, p0

    add-float/2addr p2, p3

    invoke-static {p2}, Lzed;->b(F)I

    move-result p0

    const/4 p2, 0x0

    invoke-virtual {p1, p0, v0, p2}, Landroidx/recyclerview/widget/RecyclerView;->e0(IILandroid/view/MotionEvent;)V

    return p4
.end method

.method public final onShowPress(Landroid/view/MotionEvent;)V
    .registers 2

    return-void
.end method

.method public final onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 5

    iget-object p0, p0, Ll0e;->e:Lm0e;

    iget-object p0, p0, Lm0e;->g:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    new-instance v1, Luvc;

    const/16 v2, 0xe

    invoke-direct {v1, v2}, Luvc;-><init>(B)V

    invoke-static {p0, v0, p1, v1}, Lcqp;->Q(Landroid/view/View;FFLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    if-eqz p0, :cond_20

    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    move-result p0

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method
