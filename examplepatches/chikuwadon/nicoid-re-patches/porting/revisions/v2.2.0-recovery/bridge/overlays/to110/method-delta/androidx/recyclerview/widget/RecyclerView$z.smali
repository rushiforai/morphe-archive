.class public Landroidx/recyclerview/widget/RecyclerView$z;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "z"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:Landroid/widget/OverScroller;

.field public d:Landroid/view/animation/Interpolator;

.field public e:Z

.field public f:Z

.field public final synthetic g:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method private reportScrollVelocity230(Landroid/widget/OverScroller;)V
    .registers 5

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x23

    if-lt v0, v1, :cond_0

    :try_start_0
    invoke-virtual {p1}, Landroid/widget/OverScroller;->getCurrVelocity()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/view/View;->setFrameContentVelocity(F)V
    :try_end_0
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    return-void
.end method


# virtual methods
.method public run()V
    .registers 24

    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v1, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    if-nez v2, :cond_0

    .line 1
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView$z;->c:Landroid/widget/OverScroller;

    invoke-virtual {v1}, Landroid/widget/OverScroller;->abortAnimation()V

    return-void

    :cond_0
    const/4 v2, 0x0

    .line 2
    iput-boolean v2, v0, Landroidx/recyclerview/widget/RecyclerView$z;->f:Z

    const/4 v3, 0x1

    iput-boolean v3, v0, Landroidx/recyclerview/widget/RecyclerView$z;->e:Z

    .line 3
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->c()V

    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView$z;->c:Landroid/widget/OverScroller;

    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v4, v4, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    iget-object v4, v4, Landroidx/recyclerview/widget/RecyclerView$n;->g:Landroidx/recyclerview/widget/RecyclerView$w;

    invoke-virtual {v1}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_1c

    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$z;->reportScrollVelocity230(Landroid/widget/OverScroller;)V

    iget-object v5, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v5, v5, Landroidx/recyclerview/widget/RecyclerView;->r0:[I

    invoke-virtual {v1}, Landroid/widget/OverScroller;->getCurrX()I

    move-result v13

    invoke-virtual {v1}, Landroid/widget/OverScroller;->getCurrY()I

    move-result v14

    iget v7, v0, Landroidx/recyclerview/widget/RecyclerView$z;->a:I

    sub-int v15, v13, v7

    iget v7, v0, Landroidx/recyclerview/widget/RecyclerView$z;->b:I

    sub-int v16, v14, v7

    iput v13, v0, Landroidx/recyclerview/widget/RecyclerView$z;->a:I

    iput v14, v0, Landroidx/recyclerview/widget/RecyclerView$z;->b:I

    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v11, 0x0

    const/4 v12, 0x1

    move v8, v15

    move/from16 v9, v16

    move-object v10, v5

    invoke-virtual/range {v7 .. v12}, Landroidx/recyclerview/widget/RecyclerView;->a(II[I[II)Z

    move-result v7

    if-eqz v7, :cond_1

    aget v7, v5, v2

    sub-int/2addr v15, v7

    aget v5, v5, v3

    sub-int v16, v16, v5

    :cond_1
    move/from16 v5, v16

    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v8, v7, Landroidx/recyclerview/widget/RecyclerView;->l:Landroidx/recyclerview/widget/RecyclerView$f;

    if-eqz v8, :cond_3

    iget-object v8, v7, Landroidx/recyclerview/widget/RecyclerView;->t0:[I

    invoke-virtual {v7, v15, v5, v8}, Landroidx/recyclerview/widget/RecyclerView;->a(II[I)V

    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v7, v7, Landroidx/recyclerview/widget/RecyclerView;->t0:[I

    aget v8, v7, v2

    aget v7, v7, v3

    sub-int v9, v15, v8

    sub-int v10, v5, v7

    if-nez v4, :cond_2

    goto :goto_0

    :cond_2
    throw v6

    :cond_3
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    :goto_0
    iget-object v11, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v11, v11, Landroidx/recyclerview/widget/RecyclerView;->o:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_4

    iget-object v11, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v11}, Landroid/view/ViewGroup;->invalidate()V

    :cond_4
    iget-object v11, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v11}, Landroid/view/ViewGroup;->getOverScrollMode()I

    move-result v11

    const/4 v12, 0x2

    if-eq v11, v12, :cond_5

    iget-object v11, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v11, v15, v5}, Landroidx/recyclerview/widget/RecyclerView;->b(II)V

    :cond_5
    iget-object v11, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    const/16 v21, 0x0

    const/16 v22, 0x1

    move-object/from16 v16, v11

    move/from16 v17, v8

    move/from16 v18, v7

    move/from16 v19, v9

    move/from16 v20, v10

    invoke-virtual/range {v16 .. v22}, Landroidx/recyclerview/widget/RecyclerView;->a(IIII[II)Z

    move-result v11

    if-nez v11, :cond_e

    if-nez v9, :cond_6

    if-eqz v10, :cond_e

    :cond_6
    invoke-virtual {v1}, Landroid/widget/OverScroller;->getCurrVelocity()F

    move-result v11

    float-to-int v11, v11

    if-eq v9, v13, :cond_8

    if-gez v9, :cond_7

    neg-int v6, v11

    goto :goto_1

    :cond_7
    if-lez v9, :cond_8

    move v6, v11

    goto :goto_1

    :cond_8
    const/4 v6, 0x0

    :goto_1
    if-eq v10, v14, :cond_a

    if-gez v10, :cond_9

    neg-int v11, v11

    goto :goto_2

    :cond_9
    if-lez v10, :cond_a

    goto :goto_2

    :cond_a
    const/4 v11, 0x0

    :goto_2
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getOverScrollMode()I

    move-result v2

    if-eq v2, v12, :cond_b

    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2, v6, v11}, Landroidx/recyclerview/widget/RecyclerView;->a(II)V

    :cond_b
    if-nez v6, :cond_c

    if-eq v9, v13, :cond_c

    invoke-virtual {v1}, Landroid/widget/OverScroller;->getFinalX()I

    move-result v2

    if-nez v2, :cond_e

    :cond_c
    if-nez v11, :cond_d

    if-eq v10, v14, :cond_d

    invoke-virtual {v1}, Landroid/widget/OverScroller;->getFinalY()I

    move-result v2

    if-nez v2, :cond_e

    :cond_d
    invoke-virtual {v1}, Landroid/widget/OverScroller;->abortAnimation()V

    :cond_e
    if-nez v8, :cond_f

    if-eqz v7, :cond_10

    :cond_f
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2, v8, v7}, Landroidx/recyclerview/widget/RecyclerView;->d(II)V

    :cond_10
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v2}, Landroidx/recyclerview/widget/RecyclerView;->a(Landroidx/recyclerview/widget/RecyclerView;)Z

    move-result v2

    if-nez v2, :cond_11

    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->invalidate()V

    :cond_11
    if-eqz v5, :cond_12

    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v2, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$n;->b()Z

    move-result v2

    if-eqz v2, :cond_12

    if-ne v7, v5, :cond_12

    const/4 v2, 0x1

    goto :goto_3

    :cond_12
    const/4 v2, 0x0

    :goto_3
    if-eqz v15, :cond_13

    iget-object v6, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v6, v6, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    invoke-virtual {v6}, Landroidx/recyclerview/widget/RecyclerView$n;->a()Z

    move-result v6

    if-eqz v6, :cond_13

    if-ne v8, v15, :cond_13

    const/4 v6, 0x1

    goto :goto_4

    :cond_13
    const/4 v6, 0x0

    :goto_4
    if-nez v15, :cond_14

    if-eqz v5, :cond_16

    :cond_14
    if-nez v6, :cond_16

    if-eqz v2, :cond_15

    goto :goto_5

    :cond_15
    const/4 v2, 0x0

    goto :goto_6

    :cond_16
    :goto_5
    const/4 v2, 0x1

    :goto_6
    invoke-virtual {v1}, Landroid/widget/OverScroller;->isFinished()Z

    move-result v1

    if-nez v1, :cond_19

    if-nez v2, :cond_17

    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/RecyclerView;->c(I)Z

    move-result v1

    if-nez v1, :cond_17

    goto :goto_7

    :cond_17
    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/RecyclerView$z;->a()V

    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v1, Landroidx/recyclerview/widget/RecyclerView;->e0:Ld/s/c/i;

    if-eqz v2, :cond_18

    invoke-virtual {v2, v1, v15, v5}, Ld/s/c/i;->a(Landroidx/recyclerview/widget/RecyclerView;II)V

    :cond_18
    const/4 v2, 0x0

    goto :goto_9

    :cond_19
    :goto_7
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    sget-boolean v1, Landroidx/recyclerview/widget/RecyclerView;->B0:Z

    if-eqz v1, :cond_1b

    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->f0:Ld/s/c/i$b;

    .line 4
    iget-object v2, v1, Ld/s/c/i$b;->c:[I

    if-eqz v2, :cond_1a

    const/4 v5, -0x1

    invoke-static {v2, v5}, Ljava/util/Arrays;->fill([II)V

    :cond_1a
    const/4 v2, 0x0

    iput v2, v1, Ld/s/c/i$b;->d:I

    goto :goto_8

    :cond_1b
    const/4 v2, 0x0

    .line 5
    :goto_8
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView$z;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/RecyclerView;->f(I)V

    :cond_1c
    :goto_9
    if-nez v4, :cond_1e

    .line 6
    iput-boolean v2, v0, Landroidx/recyclerview/widget/RecyclerView$z;->e:Z

    iget-boolean v1, v0, Landroidx/recyclerview/widget/RecyclerView$z;->f:Z

    if-eqz v1, :cond_1d

    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/RecyclerView$z;->a()V

    :cond_1d
    return-void

    :cond_1e
    const/4 v1, 0x0

    .line 7
    throw v1
.end method
