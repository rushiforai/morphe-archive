.class public final Lzc3;
.super Lqtj;
.source "SourceFile"


# instance fields
.field public a:Lgsf;

.field public b:Lgsf;

.field public c:Lqsh;

.field public d:F

.field public e:Lpn7;

.field public f:Lvc3;

.field public g:Lgsf;

.field public h:Lgsf;

.field public i:Landroidx/recyclerview/widget/RecyclerView;

.field public j:I

.field public final k:Lyc3;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lqtj;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lzc3;->d:F

    new-instance v0, Lqp2;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lqp2;-><init>(B)V

    iput-object v0, p0, Lzc3;->f:Lvc3;

    const/4 v0, -0x1

    iput v0, p0, Lzc3;->j:I

    new-instance v0, Lyc3;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lyc3;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lzc3;->k:Lyc3;

    return-void
.end method


# virtual methods
.method public final attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 4

    iget-object v0, p0, Lzc3;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    iget-object v0, p0, Lzc3;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lzc3;->k:Lyc3;

    if-eqz v0, :cond_11

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->t0(Loph;)V

    :cond_11
    iput-object p1, p0, Lzc3;->i:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p1, :cond_18

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    :cond_18
    invoke-super {p0, p1}, Lqtj;->attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public final calculateDistanceToFinalSnap(Landroidx/recyclerview/widget/f;Landroid/view/View;)[I
    .registers 9

    const/4 v0, 0x2

    new-array v1, v0, [I

    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->canScrollHorizontally()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_31

    iget-object v2, p0, Lzc3;->b:Lgsf;

    if-eqz v2, :cond_12

    iget-object v4, v2, Lhsf;->a:Landroidx/recyclerview/widget/f;

    if-eq v4, p1, :cond_19

    :cond_12
    new-instance v2, Lgsf;

    invoke-direct {v2, p1, v3}, Lgsf;-><init>(Landroidx/recyclerview/widget/f;B)V

    iput-object v2, p0, Lzc3;->b:Lgsf;

    :cond_19
    invoke-virtual {v2, p2}, Lgsf;->e(Landroid/view/View;)I

    move-result v4

    invoke-virtual {v2, p2}, Lgsf;->c(Landroid/view/View;)I

    move-result v5

    div-int/2addr v5, v0

    add-int/2addr v5, v4

    invoke-virtual {v2}, Lgsf;->k()I

    move-result v4

    invoke-virtual {v2}, Lgsf;->l()I

    move-result v2

    div-int/2addr v2, v0

    add-int/2addr v2, v4

    sub-int/2addr v5, v2

    aput v5, v1, v3

    goto :goto_33

    :cond_31
    aput v3, v1, v3

    :goto_33
    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->canScrollVertically()Z

    move-result v2

    const/4 v4, 0x1

    if-eqz v2, :cond_61

    iget-object v2, p0, Lzc3;->a:Lgsf;

    if-eqz v2, :cond_42

    iget-object v3, v2, Lhsf;->a:Landroidx/recyclerview/widget/f;

    if-eq v3, p1, :cond_49

    :cond_42
    new-instance v2, Lgsf;

    invoke-direct {v2, p1, v4}, Lgsf;-><init>(Landroidx/recyclerview/widget/f;B)V

    iput-object v2, p0, Lzc3;->a:Lgsf;

    :cond_49
    invoke-virtual {v2, p2}, Lgsf;->e(Landroid/view/View;)I

    move-result p0

    invoke-virtual {v2, p2}, Lgsf;->c(Landroid/view/View;)I

    move-result p1

    div-int/2addr p1, v0

    add-int/2addr p1, p0

    invoke-virtual {v2}, Lgsf;->k()I

    move-result p0

    invoke-virtual {v2}, Lgsf;->l()I

    move-result p2

    div-int/2addr p2, v0

    add-int/2addr p2, p0

    sub-int/2addr p1, p2

    aput p1, v1, v4

    return-object v1

    :cond_61
    aput v3, v1, v4

    return-object v1
.end method

.method public final createScroller(Landroidx/recyclerview/widget/f;)Luph;
    .registers 5

    iget-object v0, p0, Lzc3;->i:Landroidx/recyclerview/widget/RecyclerView;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    iget-object v1, p0, Lzc3;->c:Lqsh;

    if-eqz v1, :cond_14

    instance-of v2, p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v2, :cond_14

    new-instance v2, Lwc3;

    invoke-direct {v2, v0, p1, v1, p0}, Lwc3;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/f;Lqsh;Lzc3;)V

    return-object v2

    :cond_14
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lxc3;

    invoke-direct {v2, p0, v0, p1, v1}, Lxc3;-><init>(Lzc3;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/f;Landroid/content/Context;)V

    return-object v2
.end method

.method public final findSnapView(Landroidx/recyclerview/widget/f;)Landroid/view/View;
    .registers 4

    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->canScrollVertically()Z

    move-result v0

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lzc3;->g:Lgsf;

    if-eqz v0, :cond_e

    iget-object v1, v0, Lhsf;->a:Landroidx/recyclerview/widget/f;

    if-eq v1, p1, :cond_16

    :cond_e
    new-instance v0, Lgsf;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lgsf;-><init>(Landroidx/recyclerview/widget/f;B)V

    iput-object v0, p0, Lzc3;->g:Lgsf;

    :cond_16
    invoke-virtual {p0, p1, v0}, Lzc3;->x(Landroidx/recyclerview/widget/f;Lhsf;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_1b
    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->canScrollHorizontally()Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object v0, p0, Lzc3;->h:Lgsf;

    if-eqz v0, :cond_29

    iget-object v1, v0, Lhsf;->a:Landroidx/recyclerview/widget/f;

    if-eq v1, p1, :cond_31

    :cond_29
    new-instance v0, Lgsf;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lgsf;-><init>(Landroidx/recyclerview/widget/f;B)V

    iput-object v0, p0, Lzc3;->h:Lgsf;

    :cond_31
    invoke-virtual {p0, p1, v0}, Lzc3;->x(Landroidx/recyclerview/widget/f;Lhsf;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_36
    const/4 p0, 0x0

    return-object p0
.end method

.method public final findTargetSnapPosition(Landroidx/recyclerview/widget/f;II)I
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v10, v0, Lzc3;->i:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v10, :cond_c

    iget-object v2, v10, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    :goto_a
    move-object v11, v2

    goto :goto_e

    :cond_c
    const/4 v2, 0x0

    goto :goto_a

    :goto_e
    iget-object v12, v0, Lzc3;->c:Lqsh;

    invoke-virtual {v0}, Lzc3;->y()Landroid/view/View;

    move-result-object v2

    iget-object v3, v0, Lzc3;->i:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v4, -0x1

    if-eqz v3, :cond_1f

    invoke-virtual {v0}, Lzc3;->y()Landroid/view/View;

    move-result-object v3

    if-nez v3, :cond_21

    :cond_1f
    move v13, v4

    goto :goto_26

    :cond_21
    invoke-static {v3}, Landroidx/recyclerview/widget/RecyclerView;->S(Landroid/view/View;)I

    move-result v3

    move v13, v3

    :goto_26
    const/4 v14, 0x0

    const/4 v15, 0x1

    if-eqz v10, :cond_15c

    if-eqz v11, :cond_15c

    if-eqz v12, :cond_15c

    if-eqz v2, :cond_15c

    if-eq v13, v4, :cond_15c

    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v3

    int-to-float v3, v3

    const/high16 v5, 0x40800000    # 4.0f

    mul-float/2addr v3, v5

    invoke-virtual {v1}, Landroidx/recyclerview/widget/f;->canScrollHorizontally()Z

    move-result v16

    if-eqz v16, :cond_54

    invoke-virtual {v10}, Landroid/view/View;->getLayoutDirection()I

    move-result v1

    if-ne v1, v15, :cond_51

    if-gez p2, :cond_59

    goto :goto_56

    :cond_51
    if-lez p2, :cond_59

    goto :goto_56

    :cond_54
    if-lez p3, :cond_59

    :goto_56
    move/from16 v17, v15

    goto :goto_5b

    :cond_59
    move/from16 v17, v14

    :goto_5b
    if-eqz v16, :cond_67

    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->abs(I)I

    move-result v1

    int-to-float v1, v1

    cmpg-float v1, v1, v3

    if-gez v1, :cond_71

    goto :goto_70

    :cond_67
    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->abs(I)I

    move-result v1

    int-to-float v1, v1

    cmpg-float v1, v1, v3

    if-gez v1, :cond_71

    :goto_70
    return v13

    :cond_71
    iget v1, v0, Lzc3;->j:I

    invoke-virtual {v10, v1}, Landroidx/recyclerview/widget/RecyclerView;->M(I)Landroidx/recyclerview/widget/i;

    move-result-object v1

    iget v3, v0, Lzc3;->j:I

    if-eq v3, v4, :cond_c3

    if-eqz v1, :cond_c3

    sub-int v1, v13, v3

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-ne v1, v15, :cond_c3

    if-eqz v16, :cond_a4

    invoke-virtual {v10}, Landroid/view/View;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v3

    sub-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->signum(I)I

    move-result v1

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->signum(I)I

    move-result v2

    if-eq v1, v2, :cond_c3

    goto :goto_c0

    :cond_a4
    invoke-virtual {v10}, Landroid/view/View;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v3

    sub-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->signum(I)I

    move-result v1

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->signum(I)I

    move-result v2

    if-eq v1, v2, :cond_c3

    :goto_c0
    move/from16 v18, v15

    goto :goto_c5

    :cond_c3
    move/from16 v18, v14

    :goto_c5
    new-instance v1, Landroid/widget/Scroller;

    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v3}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-direct {v1, v2, v3}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    const/high16 v8, -0x80000000

    const v9, 0x7fffffff

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/high16 v6, -0x80000000

    const v7, 0x7fffffff

    move/from16 v4, p2

    move/from16 v5, p3

    invoke-virtual/range {v1 .. v9}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    if-eqz v16, :cond_f5

    invoke-virtual {v1}, Landroid/widget/Scroller;->getFinalX()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    int-to-float v1, v1

    iget v2, v0, Lzc3;->d:F

    :goto_f3
    mul-float/2addr v1, v2

    goto :goto_101

    :cond_f5
    invoke-virtual {v1}, Landroid/widget/Scroller;->getFinalY()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    int-to-float v1, v1

    iget v2, v0, Lzc3;->d:F

    goto :goto_f3

    :goto_101
    if-eqz v17, :cond_132

    :goto_103
    invoke-virtual {v11}, Landroidx/recyclerview/widget/d;->getItemCount()I

    move-result v2

    sub-int/2addr v2, v15

    if-ge v13, v2, :cond_131

    invoke-virtual {v12, v10, v13}, Lqsh;->b(Landroidx/recyclerview/widget/RecyclerView;I)Landroid/graphics/Point;

    move-result-object v2

    if-eqz v16, :cond_117

    iget v2, v2, Landroid/graphics/Point;->x:I

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    goto :goto_119

    :cond_117
    iget v2, v2, Landroid/graphics/Point;->y:I

    :goto_119
    add-int/2addr v14, v2

    iget-object v2, v0, Lzc3;->f:Lvc3;

    invoke-interface {v2, v13}, Lvc3;->d(I)Z

    move-result v2

    if-nez v2, :cond_125

    add-int/lit8 v13, v13, 0x1

    goto :goto_103

    :cond_125
    int-to-float v2, v14

    cmpl-float v2, v2, v1

    if-lez v2, :cond_12c

    if-nez v18, :cond_131

    :cond_12c
    add-int/lit8 v13, v13, 0x1

    move/from16 v18, v15

    goto :goto_103

    :cond_131
    return v13

    :cond_132
    :goto_132
    if-lez v13, :cond_15b

    invoke-virtual {v12, v10, v13}, Lqsh;->b(Landroidx/recyclerview/widget/RecyclerView;I)Landroid/graphics/Point;

    move-result-object v2

    if-eqz v16, :cond_141

    iget v2, v2, Landroid/graphics/Point;->x:I

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    goto :goto_143

    :cond_141
    iget v2, v2, Landroid/graphics/Point;->y:I

    :goto_143
    add-int/2addr v14, v2

    iget-object v2, v0, Lzc3;->f:Lvc3;

    invoke-interface {v2, v13}, Lvc3;->d(I)Z

    move-result v2

    if-nez v2, :cond_14f

    add-int/lit8 v13, v13, -0x1

    goto :goto_132

    :cond_14f
    int-to-float v2, v14

    cmpl-float v2, v2, v1

    if-lez v2, :cond_156

    if-nez v18, :cond_15b

    :cond_156
    add-int/lit8 v13, v13, -0x1

    move/from16 v18, v15

    goto :goto_132

    :cond_15b
    return v13

    :cond_15c
    move/from16 v2, p2

    move/from16 v5, p3

    instance-of v3, v1, Ltph;

    if-eqz v3, :cond_1cf

    invoke-virtual {v1}, Landroidx/recyclerview/widget/f;->getItemCount()I

    move-result v3

    if-eqz v3, :cond_1cf

    invoke-virtual/range {p0 .. p1}, Lzc3;->findSnapView(Landroidx/recyclerview/widget/f;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_1cf

    invoke-virtual {v1, v6}, Landroidx/recyclerview/widget/f;->getPosition(Landroid/view/View;)I

    move-result v6

    if-eq v6, v4, :cond_1cf

    move-object v7, v1

    check-cast v7, Ltph;

    add-int/lit8 v8, v3, -0x1

    invoke-interface {v7, v8}, Ltph;->computeScrollVectorForPosition(I)Landroid/graphics/PointF;

    move-result-object v7

    if-eqz v7, :cond_1cf

    invoke-virtual {v1}, Landroidx/recyclerview/widget/f;->canScrollHorizontally()Z

    move-result v9

    const/4 v10, 0x0

    if-eqz v9, :cond_1a3

    iget-object v9, v0, Lzc3;->b:Lgsf;

    if-eqz v9, :cond_190

    iget-object v11, v9, Lhsf;->a:Landroidx/recyclerview/widget/f;

    if-eq v11, v1, :cond_197

    :cond_190
    new-instance v9, Lgsf;

    invoke-direct {v9, v1, v14}, Lgsf;-><init>(Landroidx/recyclerview/widget/f;B)V

    iput-object v9, v0, Lzc3;->b:Lgsf;

    :cond_197
    invoke-virtual {v0, v1, v9, v2, v14}, Lzc3;->w(Landroidx/recyclerview/widget/f;Lhsf;II)I

    move-result v2

    iget v9, v7, Landroid/graphics/PointF;->x:F

    cmpg-float v9, v9, v10

    if-gez v9, :cond_1a4

    neg-int v2, v2

    goto :goto_1a4

    :cond_1a3
    move v2, v14

    :cond_1a4
    :goto_1a4
    invoke-virtual {v1}, Landroidx/recyclerview/widget/f;->canScrollVertically()Z

    move-result v9

    if-eqz v9, :cond_1c5

    iget-object v9, v0, Lzc3;->a:Lgsf;

    if-eqz v9, :cond_1b2

    iget-object v11, v9, Lhsf;->a:Landroidx/recyclerview/widget/f;

    if-eq v11, v1, :cond_1b9

    :cond_1b2
    new-instance v9, Lgsf;

    invoke-direct {v9, v1, v15}, Lgsf;-><init>(Landroidx/recyclerview/widget/f;B)V

    iput-object v9, v0, Lzc3;->a:Lgsf;

    :cond_1b9
    invoke-virtual {v0, v1, v9, v14, v5}, Lzc3;->w(Landroidx/recyclerview/widget/f;Lhsf;II)I

    move-result v0

    iget v5, v7, Landroid/graphics/PointF;->y:F

    cmpg-float v5, v5, v10

    if-gez v5, :cond_1c6

    neg-int v0, v0

    goto :goto_1c6

    :cond_1c5
    move v0, v14

    :cond_1c6
    :goto_1c6
    invoke-virtual {v1}, Landroidx/recyclerview/widget/f;->canScrollVertically()Z

    move-result v1

    if-eqz v1, :cond_1cd

    move v2, v0

    :cond_1cd
    if-nez v2, :cond_1d0

    :cond_1cf
    return v4

    :cond_1d0
    add-int/2addr v6, v2

    if-ltz v6, :cond_1d4

    move v14, v6

    :cond_1d4
    if-lt v14, v3, :cond_1d7

    return v8

    :cond_1d7
    return v14
.end method

.method public final w(Landroidx/recyclerview/widget/f;Lhsf;II)I
    .registers 15

    invoke-virtual {p0, p3, p4}, Lqtj;->calculateScrollDistance(II)[I

    move-result-object p0

    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->getChildCount()I

    move-result p3

    const/4 p4, 0x0

    const/4 v0, 0x1

    const/high16 v1, 0x3f800000    # 1.0f

    if-eqz p3, :cond_56

    const/4 v2, 0x0

    const v3, 0x7fffffff

    const/high16 v4, -0x80000000

    move v6, p4

    move v5, v4

    move v4, v3

    move-object v3, v2

    :goto_18
    if-ge v6, p3, :cond_30

    invoke-virtual {p1, v6}, Landroidx/recyclerview/widget/f;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {p1, v7}, Landroidx/recyclerview/widget/f;->getPosition(Landroid/view/View;)I

    move-result v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_2d

    if-ge v8, v4, :cond_29

    move-object v2, v7

    move v4, v8

    :cond_29
    if-le v8, v5, :cond_2d

    move-object v3, v7

    move v5, v8

    :cond_2d
    add-int/lit8 v6, v6, 0x1

    goto :goto_18

    :cond_30
    if-eqz v2, :cond_56

    if-eqz v3, :cond_56

    invoke-virtual {p2, v2}, Lhsf;->e(Landroid/view/View;)I

    move-result p1

    invoke-virtual {p2, v3}, Lhsf;->e(Landroid/view/View;)I

    move-result p3

    invoke-static {p1, p3}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {p2, v2}, Lhsf;->b(Landroid/view/View;)I

    move-result p3

    invoke-virtual {p2, v3}, Lhsf;->b(Landroid/view/View;)I

    move-result p2

    invoke-static {p3, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    sub-int/2addr p2, p1

    if-eqz p2, :cond_56

    int-to-float p1, p2

    mul-float/2addr p1, v1

    sub-int/2addr v5, v4

    add-int/2addr v5, v0

    int-to-float p2, v5

    div-float v1, p1, p2

    :cond_56
    const/4 p1, 0x0

    cmpg-float p1, v1, p1

    if-gtz p1, :cond_5c

    return p4

    :cond_5c
    aget p1, p0, p4

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    aget p2, p0, v0

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    if-le p1, p2, :cond_6d

    aget p0, p0, p4

    goto :goto_6f

    :cond_6d
    aget p0, p0, v0

    :goto_6f
    int-to-float p0, p0

    div-float/2addr p0, v1

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method public final x(Landroidx/recyclerview/widget/f;Lhsf;)Landroid/view/View;
    .registers 12

    iget-object v0, p0, Lzc3;->i:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    if-eqz v0, :cond_b

    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->getChildCount()I

    move-result v2

    if-nez v2, :cond_c

    :cond_b
    return-object v1

    :cond_c
    invoke-virtual {p2}, Lhsf;->k()I

    move-result v3

    invoke-virtual {p2}, Lhsf;->l()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v3

    const v3, 0x7fffffff

    const/4 v5, 0x0

    :goto_1b
    if-ge v5, v2, :cond_4e

    invoke-virtual {p1, v5}, Landroidx/recyclerview/widget/f;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_4b

    invoke-virtual {v0, v6}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v7

    if-eqz v7, :cond_4b

    invoke-virtual {v7}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v7

    iget-object v8, p0, Lzc3;->f:Lvc3;

    invoke-interface {v8, v7}, Lvc3;->d(I)Z

    move-result v7

    if-eqz v7, :cond_4b

    invoke-virtual {p2, v6}, Lhsf;->e(Landroid/view/View;)I

    move-result v7

    invoke-virtual {p2, v6}, Lhsf;->c(Landroid/view/View;)I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v7

    sub-int/2addr v8, v4

    int-to-double v7, v8

    invoke-static {v7, v8}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    double-to-int v7, v7

    if-ge v7, v3, :cond_4b

    move-object v1, v6

    move v3, v7

    :cond_4b
    add-int/lit8 v5, v5, 0x1

    goto :goto_1b

    :cond_4e
    return-object v1
.end method

.method public final y()Landroid/view/View;
    .registers 3

    iget-object v0, p0, Lzc3;->i:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return-object v1

    :cond_6
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    if-nez v0, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p0, v0}, Lzc3;->findSnapView(Landroidx/recyclerview/widget/f;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public final z(Landroid/view/View;Z)V
    .registers 7

    iget-object v0, p0, Lzc3;->i:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_16

    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    if-eqz v1, :cond_16

    invoke-virtual {p0, v1, p1}, Lzc3;->calculateDistanceToFinalSnap(Landroidx/recyclerview/widget/f;Landroid/view/View;)[I

    move-result-object p0

    const/4 p1, 0x0

    aget v1, p0, p1

    const/4 v2, 0x1

    if-nez v1, :cond_17

    aget v3, p0, v2

    if-nez v3, :cond_17

    :cond_16
    return-void

    :cond_17
    if-eqz p2, :cond_1f

    aget p0, p0, v2

    invoke-virtual {v0, v1, p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->G0(IIZ)V

    return-void

    :cond_1f
    aget p0, p0, v2

    invoke-virtual {v0, v1, p0}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    return-void
.end method
