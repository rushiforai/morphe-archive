.class public final Lflb;
.super Liph;
.source "SourceFile"

# interfaces
.implements Lmph;


# instance fields
.field public A:Landroid/view/View;

.field public B:Landroid/view/GestureDetector;

.field public final C:Lem3;

.field public D:Landroid/graphics/Rect;

.field public E:J

.field public F:Z

.field public G:Landroidx/recyclerview/widget/i;

.field public H:Landroidx/recyclerview/widget/i;

.field public I:I

.field public J:I

.field public final K:Landroid/os/Handler;

.field public final L:Lwkb;

.field public final M:[F

.field public final N:[I

.field public final a:Ljava/util/ArrayList;

.field public final b:[F

.field public c:Landroidx/recyclerview/widget/i;

.field public d:Z

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field public j:F

.field public k:F

.field public l:F

.field public m:F

.field public n:F

.field public o:F

.field public p:I

.field public final q:Lblb;

.field public r:B

.field public s:I

.field public final t:Ljava/util/ArrayList;

.field public u:I

.field public v:Landroidx/recyclerview/widget/RecyclerView;

.field public final w:Lwkb;

.field public x:Landroid/view/VelocityTracker;

.field public y:Ljava/util/ArrayList;

.field public z:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lblb;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lflb;->a:Ljava/util/ArrayList;

    const/4 v0, 0x2

    new-array v1, v0, [F

    iput-object v1, p0, Lflb;->b:[F

    const/4 v1, -0x1

    iput v1, p0, Lflb;->p:I

    const/4 v1, 0x0

    iput-byte v1, p0, Lflb;->r:B

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lflb;->t:Ljava/util/ArrayList;

    new-instance v2, Lwkb;

    invoke-direct {v2, p0, v1}, Lwkb;-><init>(Lflb;B)V

    iput-object v2, p0, Lflb;->w:Lwkb;

    new-instance v1, Lem3;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lem3;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lflb;->C:Lem3;

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lflb;->K:Landroid/os/Handler;

    new-instance v1, Lwkb;

    invoke-direct {v1, p0, v2}, Lwkb;-><init>(Lflb;B)V

    iput-object v1, p0, Lflb;->L:Lwkb;

    new-array v1, v0, [F

    iput-object v1, p0, Lflb;->M:[F

    new-array v0, v0, [I

    iput-object v0, p0, Lflb;->N:[I

    iput-object p1, p0, Lflb;->q:Lblb;

    return-void
.end method

.method public static n(Landroid/view/View;)Landroid/view/View;
    .registers 4

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/view/View;->canScrollHorizontally(I)Z

    move-result v1

    if-nez v1, :cond_2a

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/view/View;->canScrollHorizontally(I)Z

    move-result v2

    if-nez v2, :cond_2a

    invoke-virtual {p0, v0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    if-nez v0, :cond_2a

    invoke-virtual {p0, v1}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    if-nez v0, :cond_2a

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of v0, p0, Landroid/view/View;

    if-eqz v0, :cond_29

    check-cast p0, Landroid/view/View;

    invoke-static {p0}, Lflb;->n(Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_29
    const/4 p0, 0x0

    :cond_2a
    return-object p0
.end method

.method public static p(Landroid/view/View;FFFF)Z
    .registers 6

    cmpl-float v0, p1, p3

    if-ltz v0, :cond_1e

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr p3, v0

    cmpg-float p1, p1, p3

    if-gtz p1, :cond_1e

    cmpl-float p1, p2, p4

    if-ltz p1, :cond_1e

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    int-to-float p0, p0

    add-float/2addr p4, p0

    cmpg-float p0, p2, p4

    if-gtz p0, :cond_1e

    const/4 p0, 0x1

    return p0

    :cond_1e
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 4

    iget-object v0, p0, Lflb;->A:Landroid/view/View;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_7

    iput-object v1, p0, Lflb;->A:Landroid/view/View;

    :cond_7
    iget-object v0, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object p1

    if-eqz p1, :cond_22

    iget-object v0, p0, Lflb;->c:Landroidx/recyclerview/widget/i;

    if-eqz v0, :cond_23

    if-ne p1, v0, :cond_23

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->isRecyclable()Z

    move-result v0

    if-eqz v0, :cond_22

    const/4 v0, 0x0

    invoke-virtual {p0, v1, v0}, Lflb;->r(Landroidx/recyclerview/widget/i;I)V

    invoke-virtual {p0, p1}, Lflb;->l(Landroidx/recyclerview/widget/i;)V

    :cond_22
    return-void

    :cond_23
    invoke-virtual {p0, p1}, Lflb;->l(Landroidx/recyclerview/widget/i;)V

    return-void
.end method

.method public final e(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 6

    iget-object v0, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    if-eq v0, p1, :cond_ad

    iget-object v1, p0, Lflb;->q:Lblb;

    iget-object v2, p0, Lflb;->C:Lem3;

    if-eqz v0, :cond_42

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->q0(Liph;)V

    iget-object v0, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->s0(Lnph;)V

    iget-object v0, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->C:Ljava/util/ArrayList;

    if-eqz v0, :cond_1b

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_1b
    invoke-virtual {p0}, Lflb;->i()V

    const/4 v0, 0x0

    iput-object v0, p0, Lflb;->A:Landroid/view/View;

    iget-object v3, p0, Lflb;->x:Landroid/view/VelocityTracker;

    if-eqz v3, :cond_2a

    invoke-virtual {v3}, Landroid/view/VelocityTracker;->recycle()V

    iput-object v0, p0, Lflb;->x:Landroid/view/VelocityTracker;

    :cond_2a
    iget-object v0, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v3

    if-eqz v3, :cond_42

    const v3, 0x7f0a0c96

    invoke-virtual {v0, v3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lu8n;

    if-eqz v0, :cond_42

    iget-object v0, v0, Lu8n;->f:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_42
    iput-object p1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p1, :cond_ad

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Landroidx/recyclerview/R$dimen;->item_touch_helper_swipe_escape_velocity:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, p0, Lflb;->i:F

    sget v0, Landroidx/recyclerview/R$dimen;->item_touch_helper_swipe_escape_max_velocity:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, p0, Lflb;->j:F

    const/high16 v0, 0x42400000    # 48.0f

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v3, 0x1

    invoke-static {v3, v0, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    iput p1, p0, Lflb;->k:F

    iget-object p1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    iput p1, p0, Lflb;->u:I

    iget-object p1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    iget-object p1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/RecyclerView;->n(Lnph;)V

    iget-object p1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView;->C:Ljava/util/ArrayList;

    if-nez v0, :cond_8e

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p1, Landroidx/recyclerview/widget/RecyclerView;->C:Ljava/util/ArrayList;

    :cond_8e
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lflb;->B:Landroid/view/GestureDetector;

    if-nez p1, :cond_a8

    new-instance p1, Landroid/view/GestureDetector;

    iget-object v0, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v2, Lv35;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v3}, Lv35;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, v0, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p1, p0, Lflb;->B:Landroid/view/GestureDetector;

    :cond_a8
    iget-object p0, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {p0, v1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    :cond_ad
    return-void
.end method

.method public final f(Landroidx/recyclerview/widget/i;I)I
    .registers 11

    and-int/lit8 v0, p2, 0xc

    if-eqz v0, :cond_87

    iget v0, p0, Lflb;->l:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    const/4 v2, 0x4

    const/16 v3, 0x8

    if-lez v0, :cond_10

    move v0, v3

    goto :goto_11

    :cond_10
    move v0, v2

    :goto_11
    iget-object v4, p0, Lflb;->q:Lblb;

    invoke-virtual {v4, v0}, Lblb;->n(I)Z

    move-result v5

    if-nez v5, :cond_87

    iget-object v5, p0, Lflb;->x:Landroid/view/VelocityTracker;

    if-eqz v5, :cond_6d

    iget v6, p0, Lflb;->p:I

    const/4 v7, -0x1

    if-le v6, v7, :cond_6d

    const/16 v6, 0x3e8

    iget v7, p0, Lflb;->j:F

    invoke-virtual {v5, v6, v7}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    iget-object v5, p0, Lflb;->x:Landroid/view/VelocityTracker;

    iget v6, p0, Lflb;->p:I

    invoke-virtual {v5, v6}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v5

    iget-object v6, p0, Lflb;->x:Landroid/view/VelocityTracker;

    iget v7, p0, Lflb;->p:I

    invoke-virtual {v6, v7}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v6

    cmpl-float v1, v5, v1

    if-lez v1, :cond_3e

    move v2, v3

    :cond_3e
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget-object v3, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v4, p1}, Lblb;->i(Landroidx/recyclerview/widget/i;)F

    move-result v5

    mul-float/2addr v5, v3

    and-int v3, v2, p2

    if-eqz v3, :cond_6d

    if-ne v0, v2, :cond_6d

    iget v3, p0, Lflb;->i:F

    cmpl-float v3, v1, v3

    if-ltz v3, :cond_6d

    iget v3, p0, Lflb;->l:F

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v3, v3, v5

    if-lez v3, :cond_6d

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v1, v1, v3

    if-lez v1, :cond_6d

    return v2

    :cond_6d
    iget-object v1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v4, p1}, Lblb;->j(Landroidx/recyclerview/widget/i;)F

    move-result p1

    mul-float/2addr p1, v1

    and-int/2addr p2, v0

    if-eqz p2, :cond_87

    iget p0, p0, Lflb;->l:F

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    cmpl-float p0, p0, p1

    if-lez p0, :cond_87

    return v0

    :cond_87
    const/4 p0, 0x0

    return p0
.end method

.method public final g(IILandroid/view/MotionEvent;)V
    .registers 12

    iget-object v0, p0, Lflb;->c:Landroidx/recyclerview/widget/i;

    if-nez v0, :cond_d3

    const/4 v0, 0x2

    if-ne p1, v0, :cond_d3

    iget-byte p1, p0, Lflb;->r:B

    if-eq p1, v0, :cond_d3

    iget-object p1, p0, Lflb;->q:Lblb;

    invoke-virtual {p1}, Lblb;->l()Z

    move-result v1

    if-eqz v1, :cond_d3

    iget-object v1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-byte v2, v1, Landroidx/recyclerview/widget/RecyclerView;->N:B

    const/4 v3, 0x1

    if-eq v2, v3, :cond_d3

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    iget v2, p0, Lflb;->p:I

    const/4 v4, -0x1

    const/4 v5, 0x0

    if-eq v2, v4, :cond_67

    invoke-virtual {p3, v2}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v2

    invoke-virtual {p3, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    iget v6, p0, Lflb;->e:F

    sub-float/2addr v4, v6

    invoke-virtual {p3, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    iget v6, p0, Lflb;->f:F

    sub-float/2addr v2, v6

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v6, p0, Lflb;->u:I

    int-to-float v6, v6

    cmpg-float v7, v4, v6

    if-gez v7, :cond_47

    cmpg-float v6, v2, v6

    if-ltz v6, :cond_67

    :cond_47
    cmpl-float v6, v4, v2

    if-lez v6, :cond_51

    invoke-virtual {v1}, Landroidx/recyclerview/widget/f;->canScrollHorizontally()Z

    move-result v6

    if-nez v6, :cond_67

    :cond_51
    cmpl-float v2, v2, v4

    if-lez v2, :cond_5b

    invoke-virtual {v1}, Landroidx/recyclerview/widget/f;->canScrollVertically()Z

    move-result v1

    if-nez v1, :cond_67

    :cond_5b
    invoke-virtual {p0, p3}, Lflb;->m(Landroid/view/MotionEvent;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_67

    iget-object v2, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v5

    :cond_67
    if-eqz v5, :cond_d3

    iget-object v1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v1, v5}, Lblb;->h(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)I

    move-result p1

    invoke-virtual {v1}, Landroid/view/View;->getLayoutDirection()I

    move-result v1

    invoke-static {p1, v1}, Lblb;->e(II)I

    move-result p1

    const v1, 0xff00

    and-int/2addr p1, v1

    shr-int/lit8 p1, p1, 0x8

    if-eqz p1, :cond_d3

    invoke-virtual {p3, p2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p3, p2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p2

    iget v2, p0, Lflb;->e:F

    sub-float/2addr v1, v2

    iget v2, p0, Lflb;->f:F

    sub-float/2addr p2, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v6, p0, Lflb;->u:I

    int-to-float v6, v6

    cmpg-float v7, v2, v6

    if-gez v7, :cond_a0

    cmpg-float v6, v4, v6

    if-ltz v6, :cond_d3

    :cond_a0
    cmpl-float v2, v2, v4

    const/4 v4, 0x0

    if-lez v2, :cond_b6

    cmpg-float p2, v1, v4

    if-gez p2, :cond_ad

    and-int/lit8 p2, p1, 0x4

    if-eqz p2, :cond_d3

    :cond_ad
    cmpl-float p2, v1, v4

    if-lez p2, :cond_c5

    and-int/lit8 p1, p1, 0x8

    if-nez p1, :cond_c5

    goto :goto_d3

    :cond_b6
    cmpg-float v1, p2, v4

    if-gez v1, :cond_be

    and-int/lit8 v1, p1, 0x1

    if-eqz v1, :cond_d3

    :cond_be
    cmpl-float p2, p2, v4

    if-lez p2, :cond_c5

    and-int/2addr p1, v0

    if-eqz p1, :cond_d3

    :cond_c5
    iput v4, p0, Lflb;->m:F

    iput v4, p0, Lflb;->l:F

    const/4 p1, 0x0

    invoke-virtual {p3, p1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iput p1, p0, Lflb;->p:I

    invoke-virtual {p0, v5, v3}, Lflb;->r(Landroidx/recyclerview/widget/i;I)V

    :cond_d3
    :goto_d3
    return-void
.end method

.method public final getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 5

    invoke-virtual {p1}, Landroid/graphics/Rect;->setEmpty()V

    return-void
.end method

.method public final h(Landroidx/recyclerview/widget/i;I)I
    .registers 11

    and-int/lit8 v0, p2, 0x3

    if-eqz v0, :cond_86

    iget v0, p0, Lflb;->m:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-lez v0, :cond_f

    move v0, v3

    goto :goto_10

    :cond_f
    move v0, v2

    :goto_10
    iget-object v4, p0, Lflb;->x:Landroid/view/VelocityTracker;

    iget-object v5, p0, Lflb;->q:Lblb;

    if-eqz v4, :cond_6c

    iget v6, p0, Lflb;->p:I

    const/4 v7, -0x1

    if-le v6, v7, :cond_6c

    iget v6, p0, Lflb;->j:F

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v7, 0x3e8

    invoke-virtual {v4, v7, v6}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    iget-object v4, p0, Lflb;->x:Landroid/view/VelocityTracker;

    iget v6, p0, Lflb;->p:I

    invoke-virtual {v4, v6}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v4

    iget-object v6, p0, Lflb;->x:Landroid/view/VelocityTracker;

    iget v7, p0, Lflb;->p:I

    invoke-virtual {v6, v7}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v6

    cmpl-float v1, v6, v1

    if-lez v1, :cond_3a

    move v2, v3

    :cond_3a
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget-object v3, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v5, p1}, Lblb;->i(Landroidx/recyclerview/widget/i;)F

    move-result v6

    mul-float/2addr v6, v3

    and-int v3, v2, p2

    if-eqz v3, :cond_6c

    if-ne v2, v0, :cond_6c

    iget v3, p0, Lflb;->i:F

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    cmpl-float v3, v1, v3

    if-ltz v3, :cond_6c

    iget v3, p0, Lflb;->m:F

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v3, v3, v6

    if-lez v3, :cond_6c

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v1, v1, v3

    if-lez v1, :cond_6c

    return v2

    :cond_6c
    iget-object v1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v5, p1}, Lblb;->j(Landroidx/recyclerview/widget/i;)F

    move-result p1

    mul-float/2addr p1, v1

    and-int/2addr p2, v0

    if-eqz p2, :cond_86

    iget p0, p0, Lflb;->m:F

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    cmpl-float p0, p0, p1

    if-lez p0, :cond_86

    return v0

    :cond_86
    const/4 p0, 0x0

    return p0
.end method

.method public final i()V
    .registers 3

    :goto_0
    iget-object v0, p0, Lflb;->t:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_15

    const/4 v1, 0x1

    invoke-static {v1, v0}, Lam2;->k(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lelb;

    iget-object v0, v0, Lelb;->e:Landroidx/recyclerview/widget/i;

    invoke-virtual {p0, v0}, Lflb;->l(Landroidx/recyclerview/widget/i;)V

    goto :goto_0

    :cond_15
    return-void
.end method

.method public final j()V
    .registers 2

    iget-boolean v0, p0, Lflb;->F:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    iput-boolean v0, p0, Lflb;->F:Z

    iget-object v0, p0, Lflb;->K:Landroid/os/Handler;

    iget-object p0, p0, Lflb;->L:Lwkb;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/i;Z)I
    .registers 6

    iget-object p0, p0, Lflb;->t:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_8
    if-ltz v0, :cond_2b

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lelb;

    iget-object v2, v1, Lelb;->e:Landroidx/recyclerview/widget/i;

    if-ne v2, p1, :cond_28

    iget-boolean p1, v1, Lelb;->q:Z

    or-int/2addr p1, p2

    iput-boolean p1, v1, Lelb;->q:Z

    iget-boolean p1, v1, Lelb;->r:Z

    if-nez p1, :cond_22

    iget-object p1, v1, Lelb;->g:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_22
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget-byte p0, v1, Lelb;->h:B

    return p0

    :cond_28
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    :cond_2b
    const/4 p0, 0x0

    return p0
.end method

.method public final l(Landroidx/recyclerview/widget/i;)V
    .registers 4

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lflb;->k(Landroidx/recyclerview/widget/i;Z)I

    iget-object v0, p0, Lflb;->a:Ljava/util/ArrayList;

    iget-object v1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    iget-object v0, p0, Lflb;->q:Lblb;

    iget-object p0, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p0, p1}, Lblb;->d(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)V

    :cond_15
    return-void
.end method

.method public final m(Landroid/view/MotionEvent;)Landroid/view/View;
    .registers 8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget-object v1, p0, Lflb;->c:Landroidx/recyclerview/widget/i;

    if-eqz v1, :cond_1f

    iget-object v1, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget v2, p0, Lflb;->n:F

    iget v3, p0, Lflb;->l:F

    add-float/2addr v2, v3

    iget v3, p0, Lflb;->o:F

    iget v4, p0, Lflb;->m:F

    add-float/2addr v3, v4

    invoke-static {v1, v0, p1, v2, v3}, Lflb;->p(Landroid/view/View;FFFF)Z

    move-result v2

    if-eqz v2, :cond_1f

    return-object v1

    :cond_1f
    iget-object v1, p0, Lflb;->t:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :goto_27
    if-ltz v2, :cond_41

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lelb;

    iget-object v4, v3, Lelb;->e:Landroidx/recyclerview/widget/i;

    iget-object v4, v4, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget v5, v3, Lelb;->k:F

    iget v3, v3, Lelb;->l:F

    invoke-static {v4, v0, p1, v5, v3}, Lflb;->p(Landroid/view/View;FFFF)Z

    move-result v3

    if-eqz v3, :cond_3e

    return-object v4

    :cond_3e
    add-int/lit8 v2, v2, -0x1

    goto :goto_27

    :cond_41
    iget-object p0, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->H(FF)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public final o([F)V
    .registers 5

    iget v0, p0, Lflb;->s:I

    and-int/lit8 v0, v0, 0xc

    const/4 v1, 0x0

    if-eqz v0, :cond_19

    iget v0, p0, Lflb;->n:F

    iget v2, p0, Lflb;->l:F

    add-float/2addr v0, v2

    iget-object v2, p0, Lflb;->c:Landroidx/recyclerview/widget/i;

    iget-object v2, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v0, v2

    aput v0, p1, v1

    goto :goto_23

    :cond_19
    iget-object v0, p0, Lflb;->c:Landroidx/recyclerview/widget/i;

    iget-object v0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    move-result v0

    aput v0, p1, v1

    :goto_23
    iget v0, p0, Lflb;->s:I

    and-int/lit8 v0, v0, 0x3

    const/4 v1, 0x1

    if-eqz v0, :cond_3c

    iget v0, p0, Lflb;->o:F

    iget v2, p0, Lflb;->m:F

    add-float/2addr v0, v2

    iget-object p0, p0, Lflb;->c:Landroidx/recyclerview/widget/i;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result p0

    int-to-float p0, p0

    sub-float/2addr v0, p0

    aput v0, p1, v1

    return-void

    :cond_3c
    iget-object p0, p0, Lflb;->c:Landroidx/recyclerview/widget/i;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result p0

    aput p0, p1, v1

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lflb;->c:Landroidx/recyclerview/widget/i;

    const/4 v2, 0x0

    if-eqz v1, :cond_14

    iget-object v1, v0, Lflb;->b:[F

    invoke-virtual {v0, v1}, Lflb;->o([F)V

    aget v3, v1, v2

    const/4 v4, 0x1

    aget v1, v1, v4

    move v8, v1

    move v9, v3

    goto :goto_17

    :cond_14
    const/4 v3, 0x0

    move v8, v3

    move v9, v8

    :goto_17
    iget-object v10, v0, Lflb;->c:Landroidx/recyclerview/widget/i;

    iget-byte v11, v0, Lflb;->r:B

    iget-object v1, v0, Lflb;->q:Lblb;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v12, v0, Lflb;->t:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v13

    move v14, v2

    :goto_27
    if-ge v14, v13, :cond_91

    invoke-interface {v12, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lelb;

    iget-object v2, v0, Lelb;->e:Landroidx/recyclerview/widget/i;

    iget-boolean v3, v0, Lelb;->j:Z

    if-nez v3, :cond_46

    iget v3, v0, Lelb;->a:F

    iget v4, v0, Lelb;->c:F

    cmpl-float v5, v3, v4

    if-eqz v5, :cond_46

    iget v5, v0, Lelb;->t:F

    invoke-static {v4, v3, v5, v3}, Lv0g;->g(FFFF)F

    move-result v3

    iput v3, v0, Lelb;->k:F

    goto :goto_4e

    :cond_46
    iget-object v3, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTranslationX()F

    move-result v3

    iput v3, v0, Lelb;->k:F

    :goto_4e
    iget-boolean v3, v0, Lelb;->j:Z

    if-nez v3, :cond_63

    iget v3, v0, Lelb;->b:F

    iget v4, v0, Lelb;->d:F

    cmpl-float v5, v3, v4

    if-eqz v5, :cond_63

    iget v2, v0, Lelb;->t:F

    invoke-static {v4, v3, v2, v3}, Lv0g;->g(FFFF)F

    move-result v2

    iput v2, v0, Lelb;->l:F

    goto :goto_6b

    :cond_63
    iget-object v2, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    move-result v2

    iput v2, v0, Lelb;->l:F

    :goto_6b
    iget-boolean v3, v0, Lelb;->p:Z

    if-nez v3, :cond_75

    iget v3, v0, Lelb;->k:F

    iput v3, v0, Lelb;->m:F

    iput v2, v0, Lelb;->n:F

    :cond_75
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v15

    iget-object v3, v0, Lelb;->e:Landroidx/recyclerview/widget/i;

    iget v4, v0, Lelb;->k:F

    iget v5, v0, Lelb;->l:F

    iget-byte v6, v0, Lelb;->f:B

    const/4 v7, 0x0

    move-object/from16 v2, p2

    move-object v0, v1

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v7}, Lblb;->o(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V

    invoke-virtual {v1, v15}, Landroid/graphics/Canvas;->restoreToCount(I)V

    add-int/lit8 v14, v14, 0x1

    move-object v1, v0

    goto :goto_27

    :cond_91
    move-object v0, v1

    move-object/from16 v1, p1

    if-eqz v10, :cond_a7

    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    move-result v12

    const/4 v7, 0x1

    move-object/from16 v2, p2

    move v5, v8

    move v4, v9

    move-object v3, v10

    move v6, v11

    invoke-virtual/range {v0 .. v7}, Lblb;->o(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V

    invoke-virtual {v1, v12}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_a7
    return-void
.end method

.method public final onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 21

    move-object/from16 v0, p0

    iget-object v1, v0, Lflb;->c:Landroidx/recyclerview/widget/i;

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-eqz v1, :cond_14

    iget-object v1, v0, Lflb;->b:[F

    invoke-virtual {v0, v1}, Lflb;->o([F)V

    aget v2, v1, v9

    aget v1, v1, v8

    move v10, v1

    move v11, v2

    goto :goto_17

    :cond_14
    const/4 v2, 0x0

    move v10, v2

    move v11, v10

    :goto_17
    iget-object v12, v0, Lflb;->c:Landroidx/recyclerview/widget/i;

    iget-byte v13, v0, Lflb;->r:B

    iget-object v1, v0, Lflb;->q:Lblb;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v14, v0, Lflb;->t:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v15

    move v0, v9

    :goto_27
    if-ge v0, v15, :cond_5e

    invoke-interface {v14, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lelb;

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v3

    iget-object v4, v2, Lelb;->o:Ljava/lang/Float;

    iput-object v4, v1, Lblb;->b:Ljava/lang/Float;

    move v4, v3

    iget-object v3, v2, Lelb;->e:Landroidx/recyclerview/widget/i;

    move v5, v4

    iget v4, v2, Lelb;->m:F

    move v6, v5

    iget v5, v2, Lelb;->n:F

    iget-byte v2, v2, Lelb;->f:B

    const/4 v7, 0x0

    move/from16 v16, v0

    move-object v0, v1

    move/from16 p3, v8

    move-object/from16 v1, p1

    move v8, v6

    move v6, v2

    move-object/from16 v2, p2

    invoke-virtual/range {v0 .. v7}, Lblb;->p(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V

    const/4 v2, 0x0

    iput-object v2, v0, Lblb;->b:Ljava/lang/Float;

    invoke-virtual {v1, v8}, Landroid/graphics/Canvas;->restoreToCount(I)V

    add-int/lit8 v2, v16, 0x1

    move/from16 v8, p3

    move-object v1, v0

    move v0, v2

    goto :goto_27

    :cond_5e
    move-object v0, v1

    move/from16 p3, v8

    move-object/from16 v1, p1

    if-eqz v12, :cond_76

    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    move-result v8

    const/4 v7, 0x1

    move-object/from16 v2, p2

    move v5, v10

    move v4, v11

    move-object v3, v12

    move v6, v13

    invoke-virtual/range {v0 .. v7}, Lblb;->p(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V

    invoke-virtual {v1, v8}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_76
    add-int/lit8 v15, v15, -0x1

    :goto_78
    if-ltz v15, :cond_91

    invoke-interface {v14, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lelb;

    iget-boolean v1, v0, Lelb;->r:Z

    if-eqz v1, :cond_8c

    iget-boolean v0, v0, Lelb;->i:Z

    if-nez v0, :cond_8e

    invoke-interface {v14, v15}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_8e

    :cond_8c
    move/from16 v9, p3

    :cond_8e
    :goto_8e
    add-int/lit8 v15, v15, -0x1

    goto :goto_78

    :cond_91
    if-eqz v9, :cond_96

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->invalidate()V

    :cond_96
    return-void
.end method

.method public final q(Landroidx/recyclerview/widget/i;)V
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/view/View;->isLayoutRequested()Z

    move-result v2

    if-nez v2, :cond_165

    iget-byte v2, v0, Lflb;->r:B

    const/4 v3, 0x2

    if-eq v2, v3, :cond_15

    invoke-virtual {v0}, Lflb;->j()V

    return-void

    :cond_15
    iget v2, v0, Lflb;->n:F

    iget v4, v0, Lflb;->l:F

    add-float/2addr v2, v4

    float-to-int v2, v2

    iget v4, v0, Lflb;->o:F

    iget v5, v0, Lflb;->m:F

    add-float/2addr v4, v5

    float-to-int v4, v4

    iget-object v5, v0, Lflb;->y:Ljava/util/ArrayList;

    if-nez v5, :cond_34

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v0, Lflb;->y:Ljava/util/ArrayList;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v0, Lflb;->z:Ljava/util/ArrayList;

    goto :goto_3c

    :cond_34
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    iget-object v5, v0, Lflb;->z:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    :goto_3c
    iget-object v5, v0, Lflb;->q:Lblb;

    invoke-virtual {v5}, Lblb;->g()I

    move-result v6

    iget v7, v0, Lflb;->n:F

    iget v8, v0, Lflb;->l:F

    add-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    sub-int/2addr v7, v6

    iget v8, v0, Lflb;->o:F

    iget v9, v0, Lflb;->m:F

    add-float/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    sub-int/2addr v8, v6

    iget-object v9, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    move-result v9

    add-int/2addr v9, v7

    const/4 v10, 0x1

    shl-int/2addr v6, v10

    add-int/2addr v9, v6

    iget-object v11, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v11}, Landroid/view/View;->getHeight()I

    move-result v11

    add-int/2addr v11, v8

    add-int/2addr v11, v6

    add-int v6, v7, v9

    div-int/2addr v6, v3

    add-int v12, v8, v11

    div-int/2addr v12, v3

    iget-object v13, v0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v13, v13, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    invoke-virtual {v13}, Landroidx/recyclerview/widget/f;->getChildCount()I

    move-result v14

    move/from16 v16, v3

    const/4 v3, 0x0

    :goto_79
    if-ge v3, v14, :cond_114

    invoke-virtual {v13, v3}, Landroidx/recyclerview/widget/f;->getChildAt(I)Landroid/view/View;

    move-result-object v15

    iget-object v10, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-eq v15, v10, :cond_106

    invoke-virtual {v15}, Landroid/view/View;->getBottom()I

    move-result v10

    if-lt v10, v8, :cond_106

    invoke-virtual {v15}, Landroid/view/View;->getTop()I

    move-result v10

    if-gt v10, v11, :cond_106

    invoke-virtual {v15}, Landroid/view/View;->getRight()I

    move-result v10

    if-lt v10, v7, :cond_106

    invoke-virtual {v15}, Landroid/view/View;->getLeft()I

    move-result v10

    if-gt v10, v9, :cond_106

    iget-object v10, v0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v10, v15}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v10

    invoke-virtual {v5, v10}, Lblb;->b(Landroidx/recyclerview/widget/i;)Z

    move-result v17

    if-eqz v17, :cond_106

    invoke-virtual {v15}, Landroid/view/View;->getLeft()I

    move-result v17

    invoke-virtual {v15}, Landroid/view/View;->getRight()I

    move-result v18

    add-int v18, v18, v17

    div-int/lit8 v18, v18, 0x2

    sub-int v17, v6, v18

    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->abs(I)I

    move-result v17

    invoke-virtual {v15}, Landroid/view/View;->getTop()I

    move-result v18

    invoke-virtual {v15}, Landroid/view/View;->getBottom()I

    move-result v15

    add-int v15, v15, v18

    div-int/lit8 v15, v15, 0x2

    sub-int v15, v12, v15

    invoke-static {v15}, Ljava/lang/Math;->abs(I)I

    move-result v15

    mul-int v17, v17, v17

    mul-int/2addr v15, v15

    add-int v15, v15, v17

    move/from16 v17, v3

    iget-object v3, v0, Lflb;->y:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    move/from16 v18, v6

    move/from16 v19, v7

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_de
    if-ge v6, v3, :cond_f7

    move/from16 v20, v3

    iget-object v3, v0, Lflb;->z:Ljava/util/ArrayList;

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-le v15, v3, :cond_f7

    add-int/lit8 v7, v7, 0x1

    add-int/lit8 v6, v6, 0x1

    move/from16 v3, v20

    goto :goto_de

    :cond_f7
    iget-object v3, v0, Lflb;->y:Ljava/util/ArrayList;

    invoke-virtual {v3, v7, v10}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-object v3, v0, Lflb;->z:Ljava/util/ArrayList;

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_10c

    :cond_106
    move/from16 v17, v3

    move/from16 v18, v6

    move/from16 v19, v7

    :goto_10c
    add-int/lit8 v3, v17, 0x1

    move/from16 v6, v18

    move/from16 v7, v19

    goto/16 :goto_79

    :cond_114
    iget-object v3, v0, Lflb;->y:Ljava/util/ArrayList;

    invoke-virtual {v5, v1, v3, v2, v4}, Lblb;->c(Landroidx/recyclerview/widget/i;Ljava/util/ArrayList;II)Landroidx/recyclerview/widget/i;

    move-result-object v2

    if-nez v2, :cond_12a

    invoke-virtual {v0}, Lflb;->j()V

    iget-object v1, v0, Lflb;->y:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v0, v0, Lflb;->z:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void

    :cond_12a
    invoke-virtual {v2}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result v3

    invoke-virtual {v1}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result v4

    iget-object v6, v0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5, v6, v1, v2}, Lblb;->r(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;Landroidx/recyclerview/widget/i;)Z

    move-result v5

    if-eqz v5, :cond_165

    iget-boolean v5, v0, Lflb;->F:Z

    if-eqz v5, :cond_14e

    iget-object v5, v0, Lflb;->G:Landroidx/recyclerview/widget/i;

    if-ne v1, v5, :cond_14e

    iget v5, v0, Lflb;->I:I

    if-ne v4, v5, :cond_14e

    iget-object v5, v0, Lflb;->H:Landroidx/recyclerview/widget/i;

    if-ne v2, v5, :cond_14e

    iget v5, v0, Lflb;->J:I

    if-eq v3, v5, :cond_165

    :cond_14e
    invoke-virtual {v0}, Lflb;->j()V

    const/4 v5, 0x1

    iput-boolean v5, v0, Lflb;->F:Z

    iput-object v1, v0, Lflb;->G:Landroidx/recyclerview/widget/i;

    iput v4, v0, Lflb;->I:I

    iput-object v2, v0, Lflb;->H:Landroidx/recyclerview/widget/i;

    iput v3, v0, Lflb;->J:I

    iget-object v1, v0, Lflb;->L:Lwkb;

    const-wide/16 v2, 0xc8

    iget-object v0, v0, Lflb;->K:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_165
    return-void
.end method

.method public final r(Landroidx/recyclerview/widget/i;I)V
    .registers 21

    move-object/from16 v1, p0

    move-object/from16 v11, p1

    move/from16 v0, p2

    iget-object v2, v1, Lflb;->c:Landroidx/recyclerview/widget/i;

    if-ne v11, v2, :cond_f

    iget-byte v2, v1, Lflb;->r:B

    if-ne v0, v2, :cond_f

    return-void

    :cond_f
    const-wide/high16 v2, -0x8000000000000000L

    iput-wide v2, v1, Lflb;->E:J

    iget-byte v4, v1, Lflb;->r:B

    const/4 v12, 0x1

    invoke-virtual {v1, v11, v12}, Lflb;->k(Landroidx/recyclerview/widget/i;Z)I

    iput-byte v0, v1, Lflb;->r:B

    const/4 v2, 0x2

    if-ne v0, v2, :cond_22

    iget-object v3, v11, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iput-object v3, v1, Lflb;->A:Landroid/view/View;

    :cond_22
    shl-int/lit8 v0, v0, 0x3

    const/16 v13, 0x8

    add-int/2addr v0, v13

    shl-int v0, v12, v0

    add-int/lit8 v14, v0, -0x1

    iget-object v0, v1, Lflb;->c:Landroidx/recyclerview/widget/i;

    iget-object v15, v1, Lflb;->q:Lblb;

    const/16 v16, 0x0

    if-eqz v0, :cond_141

    iget-object v3, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    const/4 v5, 0x0

    if-eqz v3, :cond_12d

    if-ne v4, v2, :cond_41

    move/from16 v9, v16

    goto :goto_a6

    :cond_41
    iget-byte v3, v1, Lflb;->r:B

    if-eq v3, v2, :cond_a3

    iget-object v3, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v15, v3, v0}, Lblb;->h(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)I

    move-result v3

    iget-object v6, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v6}, Landroid/view/View;->getLayoutDirection()I

    move-result v6

    invoke-static {v3, v6}, Lblb;->e(II)I

    move-result v6

    const v7, 0xff00

    and-int/2addr v6, v7

    shr-int/2addr v6, v13

    if-eqz v6, :cond_a3

    and-int/2addr v3, v7

    shr-int/2addr v3, v13

    iget v7, v1, Lflb;->l:F

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    iget v8, v1, Lflb;->m:F

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    cmpl-float v7, v7, v8

    if-lez v7, :cond_89

    invoke-virtual {v1, v0, v6}, Lflb;->f(Landroidx/recyclerview/widget/i;I)I

    move-result v7

    if-lez v7, :cond_82

    and-int/2addr v3, v7

    if-nez v3, :cond_a5

    iget-object v3, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutDirection()I

    move-result v3

    invoke-static {v7, v3}, Lblb;->f(II)I

    move-result v7

    goto :goto_a5

    :cond_82
    invoke-virtual {v1, v0, v6}, Lflb;->h(Landroidx/recyclerview/widget/i;I)I

    move-result v7

    if-lez v7, :cond_a3

    goto :goto_a5

    :cond_89
    invoke-virtual {v1, v0, v6}, Lflb;->h(Landroidx/recyclerview/widget/i;I)I

    move-result v7

    if-gtz v7, :cond_a5

    invoke-virtual {v1, v0, v6}, Lflb;->f(Landroidx/recyclerview/widget/i;I)I

    move-result v7

    if-lez v7, :cond_a3

    and-int/2addr v3, v7

    if-nez v3, :cond_a5

    iget-object v3, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutDirection()I

    move-result v3

    invoke-static {v7, v3}, Lblb;->f(II)I

    move-result v7

    goto :goto_a5

    :cond_a3
    move/from16 v7, v16

    :cond_a5
    :goto_a5
    move v9, v7

    :goto_a6
    iget-object v3, v1, Lflb;->x:Landroid/view/VelocityTracker;

    if-eqz v3, :cond_af

    invoke-virtual {v3}, Landroid/view/VelocityTracker;->recycle()V

    iput-object v5, v1, Lflb;->x:Landroid/view/VelocityTracker;

    :cond_af
    const/4 v3, 0x4

    const/4 v6, 0x0

    if-eq v9, v12, :cond_d4

    if-eq v9, v2, :cond_d4

    if-eq v9, v3, :cond_c4

    if-eq v9, v13, :cond_c4

    const/16 v7, 0x10

    if-eq v9, v7, :cond_c4

    const/16 v7, 0x20

    if-eq v9, v7, :cond_c4

    move v7, v6

    move v8, v7

    goto :goto_e4

    :cond_c4
    iget v7, v1, Lflb;->l:F

    invoke-static {v7}, Ljava/lang/Math;->signum(F)F

    move-result v7

    iget-object v8, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v7, v8

    move v8, v6

    goto :goto_e4

    :cond_d4
    iget v7, v1, Lflb;->m:F

    invoke-static {v7}, Ljava/lang/Math;->signum(F)F

    move-result v7

    iget-object v8, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v8}, Landroid/view/View;->getHeight()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v7, v8

    move v8, v7

    move v7, v6

    :goto_e4
    if-ne v4, v2, :cond_e8

    move v3, v13

    goto :goto_eb

    :cond_e8
    if-lez v9, :cond_eb

    move v3, v2

    :cond_eb
    :goto_eb
    iget-object v2, v1, Lflb;->b:[F

    invoke-virtual {v1, v2}, Lflb;->o([F)V

    aget v5, v2, v16

    aget v2, v2, v12

    move v6, v2

    move-object v2, v0

    new-instance v0, Lzkb;

    move-object v10, v2

    invoke-direct/range {v0 .. v10}, Lzkb;-><init>(Lflb;Landroidx/recyclerview/widget/i;IIFFFFILandroidx/recyclerview/widget/i;)V

    iget-object v4, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v4, v4, Landroidx/recyclerview/widget/RecyclerView;->M:Landroidx/recyclerview/widget/e;

    if-nez v4, :cond_10d

    if-ne v3, v13, :cond_10a

    const-wide/16 v3, 0xc8

    goto :goto_116

    :cond_10a
    const-wide/16 v3, 0xfa

    goto :goto_116

    :cond_10d
    if-ne v3, v13, :cond_114

    invoke-virtual {v4}, Landroidx/recyclerview/widget/e;->g()J

    move-result-wide v3

    goto :goto_116

    :cond_114
    iget-wide v3, v4, Landroidx/recyclerview/widget/e;->d:J

    :goto_116
    iget-object v5, v0, Lelb;->g:Landroid/animation/ValueAnimator;

    invoke-virtual {v5, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v3, v1, Lflb;->t:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v12, v0, Lelb;->s:Z

    iget-object v0, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0, v12}, Landroid/view/View;->setHasTransientState(Z)V

    invoke-virtual {v5}, Landroid/animation/ValueAnimator;->start()V

    move v0, v12

    const/4 v6, 0x0

    goto :goto_13e

    :cond_12d
    move-object v2, v0

    iget-object v0, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object v3, v1, Lflb;->A:Landroid/view/View;

    const/4 v6, 0x0

    if-ne v0, v3, :cond_137

    iput-object v6, v1, Lflb;->A:Landroid/view/View;

    :cond_137
    iget-object v0, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v15, v0, v2}, Lblb;->d(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)V

    move/from16 v0, v16

    :goto_13e
    iput-object v6, v1, Lflb;->c:Landroidx/recyclerview/widget/i;

    goto :goto_143

    :cond_141
    move/from16 v0, v16

    :goto_143
    if-eqz v11, :cond_16f

    iget-object v2, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v15, v2, v11}, Lblb;->h(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getLayoutDirection()I

    move-result v2

    invoke-static {v3, v2}, Lblb;->e(II)I

    move-result v2

    and-int/2addr v2, v14

    iget-byte v3, v1, Lflb;->r:B

    shl-int/lit8 v3, v3, 0x3

    shr-int/2addr v2, v3

    iput v2, v1, Lflb;->s:I

    iget-object v2, v11, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v2

    int-to-float v2, v2

    iput v2, v1, Lflb;->n:F

    iget-object v2, v11, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v2

    int-to-float v2, v2

    iput v2, v1, Lflb;->o:F

    iput-object v11, v1, Lflb;->c:Landroidx/recyclerview/widget/i;

    :cond_16f
    iget-object v2, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-eqz v2, :cond_184

    iget-boolean v3, v1, Lflb;->d:Z

    if-nez v3, :cond_184

    iget-object v3, v1, Lflb;->c:Landroidx/recyclerview/widget/i;

    if-nez v3, :cond_181

    move/from16 v12, v16

    :cond_181
    invoke-interface {v2, v12}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_184
    if-nez v0, :cond_18d

    iget-object v0, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/f;->requestSimpleAnimationsInNextLayout()V

    :cond_18d
    iget-object v0, v1, Lflb;->c:Landroidx/recyclerview/widget/i;

    iget-byte v2, v1, Lflb;->r:B

    invoke-virtual {v15, v0, v2}, Lblb;->t(Landroidx/recyclerview/widget/i;I)V

    iget-object v0, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final s(Landroidx/recyclerview/widget/i;)V
    .registers 4

    iget-object v0, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lflb;->q:Lblb;

    invoke-virtual {v1, v0, p1}, Lblb;->h(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getLayoutDirection()I

    move-result v0

    invoke-static {v1, v0}, Lblb;->e(II)I

    move-result v0

    const/high16 v1, 0xff0000

    and-int/2addr v0, v1

    if-eqz v0, :cond_3e

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    if-eq v0, v1, :cond_20

    return-void

    :cond_20
    iget-object v0, p0, Lflb;->x:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_27

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    :cond_27
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lflb;->x:Landroid/view/VelocityTracker;

    iget v0, p0, Lflb;->g:F

    iput v0, p0, Lflb;->e:F

    iget v0, p0, Lflb;->h:F

    iput v0, p0, Lflb;->f:F

    const/4 v0, 0x0

    iput v0, p0, Lflb;->m:F

    iput v0, p0, Lflb;->l:F

    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lflb;->r(Landroidx/recyclerview/widget/i;I)V

    :cond_3e
    return-void
.end method

.method public final t(IFF)V
    .registers 8

    iget-object v0, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lflb;->N:[I

    invoke-virtual {v0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 v0, 0x0

    aget v2, v1, v0

    int-to-float v2, v2

    add-float/2addr v2, p2

    iget-object v3, p0, Lflb;->M:[F

    aput v2, v3, v0

    const/4 v0, 0x1

    aget v1, v1, v0

    int-to-float v1, v1

    add-float/2addr v1, p3

    aput v1, v3, v0

    invoke-virtual {p0, p1, p2, p3}, Lflb;->u(IFF)V

    return-void
.end method

.method public final u(IFF)V
    .registers 8

    iget v0, p0, Lflb;->e:F

    sub-float/2addr p2, v0

    iput p2, p0, Lflb;->l:F

    iget v0, p0, Lflb;->f:F

    sub-float/2addr p3, v0

    iput p3, p0, Lflb;->m:F

    iget-byte p3, p0, Lflb;->r:B

    const/4 v0, 0x1

    and-int/2addr p3, v0

    if-eq p3, v0, :cond_11

    const/4 v0, 0x0

    :cond_11
    and-int/lit8 p3, p1, 0x4

    const/high16 v1, 0x3e800000    # 0.25f

    iget-object v2, p0, Lflb;->q:Lblb;

    const/4 v3, 0x0

    if-nez p3, :cond_21

    invoke-static {v3, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    iput p2, p0, Lflb;->l:F

    goto :goto_3a

    :cond_21
    if-eqz v0, :cond_3a

    cmpg-float p2, p2, v3

    if-gez p2, :cond_3a

    const/4 p2, 0x4

    invoke-virtual {v2, p2}, Lblb;->n(I)Z

    move-result p2

    if-eqz p2, :cond_3a

    iget p2, p0, Lflb;->k:F

    neg-float p2, p2

    iget p3, p0, Lflb;->l:F

    mul-float/2addr p3, v1

    invoke-static {p2, p3}, Ljava/lang/Math;->max(FF)F

    move-result p2

    iput p2, p0, Lflb;->l:F

    :cond_3a
    :goto_3a
    and-int/lit8 p2, p1, 0x8

    if-nez p2, :cond_47

    iget p2, p0, Lflb;->l:F

    invoke-static {v3, p2}, Ljava/lang/Math;->min(FF)F

    move-result p2

    iput p2, p0, Lflb;->l:F

    goto :goto_62

    :cond_47
    if-eqz v0, :cond_62

    iget p2, p0, Lflb;->l:F

    cmpl-float p2, p2, v3

    if-lez p2, :cond_62

    const/16 p2, 0x8

    invoke-virtual {v2, p2}, Lblb;->n(I)Z

    move-result p2

    if-eqz p2, :cond_62

    iget p2, p0, Lflb;->k:F

    iget p3, p0, Lflb;->l:F

    mul-float/2addr p3, v1

    invoke-static {p2, p3}, Ljava/lang/Math;->min(FF)F

    move-result p2

    iput p2, p0, Lflb;->l:F

    :cond_62
    :goto_62
    and-int/lit8 p2, p1, 0x1

    if-nez p2, :cond_6e

    iget p2, p0, Lflb;->m:F

    invoke-static {v3, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    iput p2, p0, Lflb;->m:F

    :cond_6e
    and-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_7a

    iget p1, p0, Lflb;->m:F

    invoke-static {v3, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    iput p1, p0, Lflb;->m:F

    :cond_7a
    return-void
.end method
