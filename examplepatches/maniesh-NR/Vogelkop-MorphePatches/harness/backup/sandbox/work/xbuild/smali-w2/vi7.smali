.class public Lvi7;
.super Lblb;
.source "SourceFile"


# instance fields
.field public final e:Lumi;

.field public final f:Z

.field public final g:Lflb;

.field public final h:Lns8;

.field public i:Landroidx/recyclerview/widget/i;

.field public final j:I

.field public final k:Z

.field public l:Lac1;

.field public m:Lti7;

.field public n:Lo28;

.field public o:Lcom/opera/android/custom_views/OverlayView;

.field public p:Lfr8;

.field public q:Z

.field public final r:[I

.field public final s:S

.field public t:Z


# direct methods
.method public constructor <init>(Lumi;IZILns8;Z)V
    .registers 9

    invoke-direct {p0}, Lblb;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lvi7;->q:Z

    const/4 v1, 0x2

    new-array v1, v1, [I

    iput-object v1, p0, Lvi7;->r:[I

    iput-boolean v0, p0, Lvi7;->t:Z

    iput-object p1, p0, Lvi7;->e:Lumi;

    iput p2, p0, Lvi7;->j:I

    iput-boolean p3, p0, Lvi7;->k:Z

    iput-short p4, p0, Lvi7;->s:S

    iput-object p5, p0, Lvi7;->h:Lns8;

    iput-boolean p6, p0, Lvi7;->f:Z

    new-instance p1, Lflb;

    invoke-direct {p1, p0}, Lflb;-><init>(Lblb;)V

    iput-object p1, p0, Lvi7;->g:Lflb;

    return-void
.end method


# virtual methods
.method public final b(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    iget-boolean p0, p0, Lvi7;->q:Z

    if-eqz p0, :cond_a

    instance-of p0, p1, Lth7;

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final c(Landroidx/recyclerview/widget/i;Ljava/util/ArrayList;II)Landroidx/recyclerview/widget/i;
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    iget-object v5, v0, Lvi7;->h:Lns8;

    if-eqz v5, :cond_39

    iget-object v5, v5, Lns8;->p:Lgs8;

    iget-object v6, v5, Lgs8;->a:Llz3;

    if-eqz v6, :cond_39

    iget-object v6, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    move-result v6

    sub-int v6, v3, v6

    iget-object v7, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v7

    sub-int v7, v4, v7

    int-to-double v8, v6

    int-to-double v6, v7

    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v6

    double-to-float v6, v6

    iget v7, v5, Lgs8;->b:I

    int-to-float v7, v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_39

    iget-object v5, v5, Lgs8;->a:Llz3;

    sget-object v6, Lhjm;->b:Lhjm;

    invoke-virtual {v5, v6}, Llz3;->b(Lhjm;)Z

    :cond_39
    iget-object v5, v0, Lvi7;->l:Lac1;

    const/4 v6, 0x0

    if-eqz v5, :cond_4f

    iget-object v5, v5, Lac1;->c:Ljava/lang/Object;

    check-cast v5, Lui7;

    invoke-virtual {v5, v1, v3, v4}, Lui7;->b(Landroidx/recyclerview/widget/i;II)Z

    move-result v5

    if-eqz v5, :cond_4f

    iget-object v0, v0, Lvi7;->l:Lac1;

    iput v3, v0, Lac1;->a:I

    iput v4, v0, Lac1;->b:I

    return-object v6

    :cond_4f
    iget-object v5, v0, Lvi7;->m:Lti7;

    if-eqz v5, :cond_5f

    invoke-interface {v5, v1, v3, v4}, Lti7;->b(Landroidx/recyclerview/widget/i;II)Z

    move-result v5

    if-eqz v5, :cond_5f

    iget-object v0, v0, Lvi7;->m:Lti7;

    invoke-interface {v0, v1, v3, v4}, Lti7;->c(Landroidx/recyclerview/widget/i;II)V

    return-object v6

    :cond_5f
    const/4 v5, 0x0

    invoke-virtual {v0, v6, v5, v5}, Lvi7;->w(Lti7;II)V

    iget-boolean v7, v0, Lvi7;->k:Z

    if-eqz v7, :cond_c6

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    move v8, v5

    :cond_6c
    if-ge v8, v7, :cond_c6

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Landroidx/recyclerview/widget/i;

    check-cast v9, Lth7;

    invoke-interface {v9}, Lth7;->C()Z

    move-result v10

    if-eqz v10, :cond_6c

    iget-object v10, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-interface {v9}, Lth7;->e()Landroid/view/View;

    move-result-object v11

    invoke-static {v10, v11, v3, v4}, Lwi7;->a(Landroid/view/View;Landroid/view/View;II)Z

    move-result v10

    if-eqz v10, :cond_6c

    new-instance v1, Lac1;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v0, v1, Lac1;->e:Ljava/lang/Object;

    new-instance v2, Lui7;

    invoke-direct {v2, v9}, Lui7;-><init>(Lth7;)V

    iput-object v2, v1, Lac1;->c:Ljava/lang/Object;

    iput v3, v1, Lac1;->a:I

    iput v4, v1, Lac1;->b:I

    iput-object v1, v0, Lvi7;->l:Lac1;

    iget-object v2, v1, Lac1;->d:Ljava/lang/Object;

    check-cast v2, Loml;

    if-eqz v2, :cond_a7

    invoke-virtual {v2, v5}, Loml;->cancel(Z)Z

    :cond_a7
    new-instance v2, Lbl6;

    const/16 v3, 0x1c

    invoke-direct {v2, v1, v3}, Lbl6;-><init>(Ljava/lang/Object;B)V

    iget-object v3, v0, Lvi7;->e:Lumi;

    invoke-interface {v3, v2}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v2

    new-instance v7, Loml;

    invoke-direct {v7, v2}, Loml;-><init>(Lnml;)V

    iput-object v7, v1, Lac1;->d:Ljava/lang/Object;

    iget-short v0, v0, Lvi7;->s:S

    int-to-long v9, v0

    sget-object v11, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v12, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v7 .. v12}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    return-object v6

    :cond_c6
    iget-object v7, v0, Lvi7;->n:Lo28;

    if-eqz v7, :cond_e5

    iget-object v7, v7, Lo28;->a:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    move v9, v5

    :cond_d1
    if-ge v9, v8, :cond_e5

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    check-cast v10, Lti7;

    invoke-interface {v10, v1, v3, v4}, Lti7;->b(Landroidx/recyclerview/widget/i;II)Z

    move-result v11

    if-eqz v11, :cond_d1

    invoke-virtual {v0, v10, v3, v4}, Lvi7;->w(Lti7;II)V

    return-object v6

    :cond_e5
    iget-boolean v7, v0, Lvi7;->f:Z

    if-eqz v7, :cond_1ec

    iget-object v0, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_f2

    return-object v6

    :cond_f2
    iget-object v0, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v0, v3

    iget-object v7, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v7

    iget-object v8, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v7

    iget-object v7, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    invoke-static {v7}, Lcs5;->W(Landroid/view/View;)Z

    move-result v7

    iget-object v9, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    iget-object v10, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getHeight()I

    move-result v10

    div-int/lit8 v10, v10, 0x2

    iget-object v11, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v11}, Landroid/view/View;->getLeft()I

    move-result v11

    sub-int/2addr v3, v11

    iget-object v11, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v11}, Landroid/view/View;->getTop()I

    move-result v11

    sub-int v11, v4, v11

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v12

    const v13, 0x7fffffff

    move v14, v13

    move v15, v14

    move-object v13, v6

    :goto_13f
    if-ge v5, v12, :cond_1e8

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v2, v16

    check-cast v2, Landroidx/recyclerview/widget/i;

    move/from16 p0, v3

    iget-object v3, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    sub-int v3, v4, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    const/16 v16, 0x1

    if-ge v3, v10, :cond_16c

    iget-object v3, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    iget-object v4, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v4

    if-eq v3, v4, :cond_16c

    move/from16 v3, v16

    goto :goto_16d

    :cond_16c
    const/4 v3, 0x0

    :goto_16d
    invoke-static/range {p0 .. p0}, Ljava/lang/Math;->abs(I)I

    move-result v4

    if-le v4, v9, :cond_192

    iget-object v4, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v4

    sub-int v4, p4, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    if-ge v4, v10, :cond_192

    iget-object v4, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v4

    iget-object v1, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    if-ne v4, v1, :cond_192

    move/from16 v1, v16

    goto :goto_193

    :cond_192
    const/4 v1, 0x0

    :goto_193
    iget-object v4, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v4

    move/from16 p3, v1

    iget-object v1, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v4

    if-eqz v3, :cond_1be

    sub-int v3, v0, v1

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-eqz v7, :cond_1b1

    if-le v0, v1, :cond_1b3

    goto :goto_1b5

    :cond_1b1
    if-lt v0, v1, :cond_1b5

    :cond_1b3
    if-lez v11, :cond_1b9

    :cond_1b5
    :goto_1b5
    if-ge v3, v15, :cond_1b9

    move-object v6, v2

    move v15, v3

    :cond_1b9
    if-ge v3, v14, :cond_1dc

    move-object v13, v2

    move v14, v3

    goto :goto_1dc

    :cond_1be
    if-eqz p3, :cond_1dc

    if-le v8, v1, :cond_1c5

    move/from16 v3, v16

    goto :goto_1c6

    :cond_1c5
    const/4 v3, 0x0

    :goto_1c6
    if-lt v8, v1, :cond_1ca

    const/16 v16, 0x0

    :cond_1ca
    if-eqz v3, :cond_1ce

    if-lt v0, v1, :cond_1d2

    :cond_1ce
    if-eqz v16, :cond_1dc

    if-le v0, v1, :cond_1dc

    :cond_1d2
    sub-int v1, v0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-ge v1, v15, :cond_1dc

    move v15, v1

    move-object v6, v2

    :cond_1dc
    :goto_1dc
    add-int/lit8 v5, v5, 0x1

    move/from16 v3, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v4, p4

    goto/16 :goto_13f

    :cond_1e8
    if-eqz v6, :cond_1eb

    return-object v6

    :cond_1eb
    return-object v13

    :cond_1ec
    invoke-super/range {p0 .. p4}, Lblb;->c(Landroidx/recyclerview/widget/i;Ljava/util/ArrayList;II)Landroidx/recyclerview/widget/i;

    move-result-object v0

    return-object v0
.end method

.method public final d(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)V
    .registers 6

    invoke-super {p0, p1, p2}, Lblb;->d(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)V

    iget-object p1, p0, Lvi7;->p:Lfr8;

    if-nez p1, :cond_8

    return-void

    :cond_8
    iget-object p1, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lvi7;->o:Lcom/opera/android/custom_views/OverlayView;

    iget-object v0, p0, Lvi7;->p:Lfr8;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v1, 0x0

    iput-object v1, v0, Lfr8;->i:Lo8f;

    iget-object v2, p1, Lcom/opera/android/custom_views/OverlayView;->c:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2c

    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lfr8;

    iput-object p2, p1, Lcom/opera/android/custom_views/OverlayView;->d:Lfr8;

    goto :goto_33

    :cond_2c
    iput-object v1, p1, Lcom/opera/android/custom_views/OverlayView;->d:Lfr8;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    :goto_33
    iput-object v1, p0, Lvi7;->p:Lfr8;

    return-void
.end method

.method public final g()I
    .registers 1

    iget p0, p0, Lvi7;->j:I

    return p0
.end method

.method public final l()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final m()Z
    .registers 1

    iget-boolean p0, p0, Lvi7;->t:Z

    return p0
.end method

.method public final o(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V
    .registers 9

    iget-object v0, p0, Lvi7;->p:Lfr8;

    if-nez v0, :cond_7

    invoke-super/range {p0 .. p7}, Lblb;->o(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V

    :cond_7
    return-void
.end method

.method public final p(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V
    .registers 8

    iget-object p1, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object p6, p0, Lvi7;->p:Lfr8;

    if-eqz p6, :cond_55

    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p1

    if-eqz p1, :cond_24

    iget-object p0, p0, Lvi7;->p:Lfr8;

    float-to-int p1, p4

    float-to-int p2, p5

    iget-object p3, p0, Lfr8;->i:Lo8f;

    if-eqz p3, :cond_55

    iget p4, p0, Lfr8;->j:I

    if-ne p1, p4, :cond_1c

    iget p4, p0, Lfr8;->k:I

    if-eq p2, p4, :cond_55

    :cond_1c
    iput p1, p0, Lfr8;->j:I

    iput p2, p0, Lfr8;->k:I

    invoke-virtual {p3, p0}, Lo8f;->run(Ljava/lang/Object;)V

    return-void

    :cond_24
    iget-object p1, p0, Lvi7;->r:[I

    invoke-virtual {p2, p1}, Landroid/view/View;->getLocationInWindow([I)V

    const/4 p2, 0x0

    aget p6, p1, p2

    iget-object p7, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p7}, Landroid/view/View;->getLeft()I

    move-result p7

    add-int/2addr p7, p6

    aput p7, p1, p2

    const/4 p6, 0x1

    aget p7, p1, p6

    iget-object p3, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getTop()I

    move-result p3

    add-int/2addr p3, p7

    aput p3, p1, p6

    iget-object p0, p0, Lvi7;->p:Lfr8;

    float-to-int p4, p4

    aget p1, p1, p2

    add-int/2addr p4, p1

    float-to-int p1, p5

    add-int/2addr p1, p3

    iget-object p2, p0, Lfr8;->i:Lo8f;

    if-eqz p2, :cond_55

    iget p3, p0, Lfr8;->j:I

    if-ne p4, p3, :cond_56

    iget p3, p0, Lfr8;->k:I

    if-ne p1, p3, :cond_56

    :cond_55
    return-void

    :cond_56
    iput p4, p0, Lfr8;->j:I

    iput p1, p0, Lfr8;->k:I

    invoke-virtual {p2, p0}, Lo8f;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final q(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final r(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;Landroidx/recyclerview/widget/i;)Z
    .registers 4

    iget-boolean p0, p0, Lvi7;->q:Z

    if-eqz p0, :cond_12

    instance-of p0, p2, Lth7;

    if-eqz p0, :cond_12

    check-cast p2, Lth7;

    invoke-interface {p2, p3}, Lth7;->I(Landroidx/recyclerview/widget/i;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final s(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;I)V
    .registers 4

    iget-object p0, p0, Lvi7;->i:Landroidx/recyclerview/widget/i;

    if-eqz p0, :cond_9

    check-cast p0, Lth7;

    invoke-interface {p0, p2}, Lth7;->K(Landroidx/recyclerview/widget/i;)V

    :cond_9
    return-void
.end method

.method public final t(Landroidx/recyclerview/widget/i;I)V
    .registers 9

    const/4 v0, 0x0

    iget-object v1, p0, Lvi7;->h:Lns8;

    const/4 v2, 0x0

    if-eqz p2, :cond_7f

    const/4 v3, 0x2

    if-ne p2, v3, :cond_9b

    iget-object p2, p0, Lvi7;->i:Landroidx/recyclerview/widget/i;

    if-eq p2, p1, :cond_9b

    if-eqz p2, :cond_11

    const/4 v3, 0x1

    goto :goto_12

    :cond_11
    move v3, v2

    :goto_12
    if-eqz v3, :cond_27

    iget-object v4, p0, Lvi7;->m:Lti7;

    if-eqz v4, :cond_1b

    invoke-virtual {p0, p2, v4}, Lvi7;->v(Landroidx/recyclerview/widget/i;Lti7;)V

    :cond_1b
    invoke-virtual {p0, v0, v2, v2}, Lvi7;->w(Lti7;II)V

    iget-object p2, p0, Lvi7;->i:Landroidx/recyclerview/widget/i;

    check-cast p2, Lth7;

    invoke-interface {p2}, Lth7;->E()V

    iput-object v0, p0, Lvi7;->i:Landroidx/recyclerview/widget/i;

    :cond_27
    iput-object p1, p0, Lvi7;->i:Landroidx/recyclerview/widget/i;

    move-object p2, p1

    check-cast p2, Lth7;

    invoke-interface {p2}, Lth7;->B()V

    iget-object p2, p0, Lvi7;->p:Lfr8;

    if-nez p2, :cond_77

    iget-object p2, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    instance-of v0, p2, Lfr8;

    if-eqz v0, :cond_77

    iget-object v0, p0, Lvi7;->o:Lcom/opera/android/custom_views/OverlayView;

    if-nez v0, :cond_4d

    invoke-virtual {p2}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p2

    const v0, 0x7f0a0420

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Lcom/opera/android/custom_views/OverlayView;

    iput-object v0, p0, Lvi7;->o:Lcom/opera/android/custom_views/OverlayView;

    :cond_4d
    iget-object p2, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p2, Lfr8;

    iput-object p2, p0, Lvi7;->p:Lfr8;

    iget-object p0, v0, Lcom/opera/android/custom_views/OverlayView;->c:Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfr8;

    iput-object p0, v0, Lcom/opera/android/custom_views/OverlayView;->d:Lfr8;

    new-instance v4, Lo8f;

    const/4 v5, 0x5

    invoke-direct {v4, v0, v5}, Lo8f;-><init>(Ljava/lang/Object;B)V

    iput-object v4, p2, Lfr8;->i:Lo8f;

    if-ne p0, p2, :cond_6d

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    :cond_6d
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/16 p2, 0x8

    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    :cond_77
    if-nez v3, :cond_9b

    if-eqz v1, :cond_9b

    invoke-virtual {v1, p1}, Lns8;->c(Landroidx/recyclerview/widget/i;)V

    return-void

    :cond_7f
    if-nez p1, :cond_9b

    iget-object p1, p0, Lvi7;->i:Landroidx/recyclerview/widget/i;

    iget-object p2, p0, Lvi7;->m:Lti7;

    if-eqz p2, :cond_8a

    invoke-virtual {p0, p1, p2}, Lvi7;->v(Landroidx/recyclerview/widget/i;Lti7;)V

    :cond_8a
    invoke-virtual {p0, v0, v2, v2}, Lvi7;->w(Lti7;II)V

    iget-object p2, p0, Lvi7;->i:Landroidx/recyclerview/widget/i;

    check-cast p2, Lth7;

    invoke-interface {p2}, Lth7;->E()V

    iput-object v0, p0, Lvi7;->i:Landroidx/recyclerview/widget/i;

    if-eqz v1, :cond_9b

    invoke-virtual {v1, p1}, Lns8;->o(Landroidx/recyclerview/widget/i;)V

    :cond_9b
    return-void
.end method

.method public v(Landroidx/recyclerview/widget/i;Lti7;)V
    .registers 6

    invoke-interface {p2, p1}, Lti7;->a(Landroidx/recyclerview/widget/i;)V

    iget-object p0, p0, Lvi7;->g:Lflb;

    iget-object p0, p0, Lflb;->t:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 v0, 0x1

    sub-int/2addr p2, v0

    :goto_d
    if-ltz p2, :cond_30

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lelb;

    iget-object v2, v1, Lelb;->e:Landroidx/recyclerview/widget/i;

    if-ne v2, p1, :cond_2d

    iput-boolean v0, v1, Lelb;->j:Z

    const-wide/16 p0, 0x2710

    iget-object p2, v1, Lelb;->g:Landroid/animation/ValueAnimator;

    invoke-virtual {p2, p0, p1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    const/4 p0, 0x0

    iput-boolean p0, v1, Lelb;->s:Z

    iget-object p1, v1, Lelb;->e:Landroidx/recyclerview/widget/i;

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setHasTransientState(Z)V

    return-void

    :cond_2d
    add-int/lit8 p2, p2, -0x1

    goto :goto_d

    :cond_30
    return-void
.end method

.method public final w(Lti7;II)V
    .registers 7

    iget-object v0, p0, Lvi7;->m:Lti7;

    const/4 v1, 0x0

    if-nez v0, :cond_b

    if-nez p1, :cond_9

    const/4 v0, 0x1

    goto :goto_f

    :cond_9
    move v0, v1

    goto :goto_f

    :cond_b
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_f
    const/4 v2, 0x0

    if-eqz v0, :cond_2d

    iget-object p1, p0, Lvi7;->l:Lac1;

    if-eqz p1, :cond_23

    iget-object v0, p1, Lac1;->d:Ljava/lang/Object;

    check-cast v0, Loml;

    if-eqz v0, :cond_21

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    iput-object v2, p1, Lac1;->d:Ljava/lang/Object;

    :cond_21
    iput-object v2, p0, Lvi7;->l:Lac1;

    :cond_23
    iget-object p1, p0, Lvi7;->m:Lti7;

    if-eqz p1, :cond_41

    iget-object p0, p0, Lvi7;->i:Landroidx/recyclerview/widget/i;

    invoke-interface {p1, p0, p2, p3}, Lti7;->c(Landroidx/recyclerview/widget/i;II)V

    return-void

    :cond_2d
    iget-object v0, p0, Lvi7;->m:Lti7;

    if-eqz v0, :cond_34

    invoke-interface {v0, v2, v1, v1}, Lti7;->c(Landroidx/recyclerview/widget/i;II)V

    :cond_34
    iput-object p1, p0, Lvi7;->m:Lti7;

    if-eqz p1, :cond_3d

    iget-object v0, p0, Lvi7;->i:Landroidx/recyclerview/widget/i;

    invoke-interface {p1, v0, p2, p3}, Lti7;->c(Landroidx/recyclerview/widget/i;II)V

    :cond_3d
    iget-object p1, p0, Lvi7;->l:Lac1;

    if-nez p1, :cond_42

    :cond_41
    return-void

    :cond_42
    iget-object p2, p1, Lac1;->d:Ljava/lang/Object;

    check-cast p2, Loml;

    if-eqz p2, :cond_4d

    invoke-virtual {p2, v1}, Loml;->cancel(Z)Z

    iput-object v2, p1, Lac1;->d:Ljava/lang/Object;

    :cond_4d
    iput-object v2, p0, Lvi7;->l:Lac1;

    return-void
.end method
