.class public final Lwkb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lflb;


# direct methods
.method public synthetic constructor <init>(Lflb;B)V
    .registers 3

    iput-byte p2, p0, Lwkb;->a:B

    iput-object p1, p0, Lwkb;->b:Lflb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Lwkb;->a:B

    const/4 v2, 0x0

    iget-object v0, v0, Lwkb;->b:Lflb;

    packed-switch v1, :pswitch_data_172

    iget-boolean v1, v0, Lflb;->F:Z

    if-eqz v1, :cond_1b

    iput-boolean v2, v0, Lflb;->F:Z

    iget-object v1, v0, Lflb;->q:Lblb;

    iget-object v2, v0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v0, Lflb;->H:Landroidx/recyclerview/widget/i;

    iget v0, v0, Lflb;->J:I

    invoke-virtual {v1, v2, v3, v0}, Lblb;->s(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;I)V

    :cond_1b
    return-void

    :pswitch_1c
    iget-object v1, v0, Lflb;->c:Landroidx/recyclerview/widget/i;

    if-eqz v1, :cond_171

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, v0, Lflb;->E:J

    const-wide/high16 v7, -0x8000000000000000L

    cmp-long v1, v5, v7

    if-nez v1, :cond_30

    const-wide/16 v5, 0x0

    :goto_2e
    move-wide v13, v5

    goto :goto_33

    :cond_30
    sub-long v5, v3, v5

    goto :goto_2e

    :goto_33
    iget-object v1, v0, Lflb;->D:Landroid/graphics/Rect;

    if-nez v1, :cond_3e

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, v0, Lflb;->D:Landroid/graphics/Rect;

    :cond_3e
    iget-object v5, v0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v5, v5, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    iget-object v6, v0, Lflb;->c:Landroidx/recyclerview/widget/i;

    iget-object v6, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v5, v6, v1}, Landroidx/recyclerview/widget/f;->calculateItemDecorationsForChild(Landroid/view/View;Landroid/graphics/Rect;)V

    iget-object v1, v0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v1}, Lflb;->n(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_53

    iget-object v1, v0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    :cond_53
    iget-object v5, v0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    if-eq v5, v1, :cond_6a

    invoke-static {v5, v1}, Lq9n;->q(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Point;

    move-result-object v5

    iget v6, v5, Landroid/graphics/Point;->x:I

    invoke-virtual {v1}, Landroid/view/View;->getScrollX()I

    move-result v9

    sub-int/2addr v6, v9

    iget v5, v5, Landroid/graphics/Point;->y:I

    invoke-virtual {v1}, Landroid/view/View;->getScrollY()I

    move-result v9

    sub-int/2addr v5, v9

    goto :goto_6c

    :cond_6a
    move v5, v2

    move v6, v5

    :goto_6c
    const/4 v9, -0x1

    invoke-virtual {v1, v9}, Landroid/view/View;->canScrollHorizontally(I)Z

    move-result v10

    const/4 v15, 0x1

    const/4 v11, 0x0

    if-nez v10, :cond_7b

    invoke-virtual {v1, v15}, Landroid/view/View;->canScrollHorizontally(I)Z

    move-result v10

    if-eqz v10, :cond_b5

    :cond_7b
    iget v10, v0, Lflb;->n:F

    iget v12, v0, Lflb;->l:F

    add-float/2addr v10, v12

    float-to-int v10, v10

    add-int/2addr v10, v6

    iget-object v6, v0, Lflb;->D:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    sub-int v6, v10, v6

    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    move-result v12

    sub-int/2addr v6, v12

    iget v12, v0, Lflb;->l:F

    cmpg-float v16, v12, v11

    if-gez v16, :cond_95

    if-ltz v6, :cond_b3

    :cond_95
    cmpl-float v6, v12, v11

    if-lez v6, :cond_b5

    iget-object v6, v0, Lflb;->c:Landroidx/recyclerview/widget/i;

    iget-object v6, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v6

    add-int/2addr v6, v10

    iget-object v10, v0, Lflb;->D:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->right:I

    add-int/2addr v6, v10

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v10

    invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I

    move-result v12

    sub-int/2addr v10, v12

    sub-int/2addr v6, v10

    if-lez v6, :cond_b5

    :cond_b3
    move v12, v6

    goto :goto_b6

    :cond_b5
    move v12, v2

    :goto_b6
    invoke-virtual {v1, v9}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v6

    if-nez v6, :cond_c2

    invoke-virtual {v1, v15}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v6

    if-eqz v6, :cond_fa

    :cond_c2
    iget v6, v0, Lflb;->o:F

    iget v9, v0, Lflb;->m:F

    add-float/2addr v6, v9

    float-to-int v6, v6

    add-int/2addr v6, v5

    iget-object v5, v0, Lflb;->D:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    sub-int v5, v6, v5

    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    move-result v9

    sub-int/2addr v5, v9

    iget v9, v0, Lflb;->m:F

    cmpg-float v10, v9, v11

    if-gez v10, :cond_dc

    if-ltz v5, :cond_fb

    :cond_dc
    cmpl-float v5, v9, v11

    if-lez v5, :cond_fa

    iget-object v5, v0, Lflb;->c:Landroidx/recyclerview/widget/i;

    iget-object v5, v5, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    add-int/2addr v5, v6

    iget-object v6, v0, Lflb;->D:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v5, v6

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v6

    invoke-virtual {v1}, Landroid/view/View;->getPaddingBottom()I

    move-result v9

    sub-int/2addr v6, v9

    sub-int/2addr v5, v6

    if-gtz v5, :cond_fb

    :cond_fa
    move v5, v2

    :cond_fb
    if-eqz v12, :cond_112

    iget-object v9, v0, Lflb;->q:Lblb;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    iget-object v6, v0, Lflb;->c:Landroidx/recyclerview/widget/i;

    iget-object v6, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v11

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    invoke-virtual/range {v9 .. v14}, Lblb;->k(Landroid/content/res/Resources;IIJ)I

    move-result v12

    :cond_112
    move v6, v12

    if-eqz v5, :cond_12b

    iget-object v9, v0, Lflb;->q:Lblb;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    iget-object v11, v0, Lflb;->c:Landroidx/recyclerview/widget/i;

    iget-object v11, v11, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v11}, Landroid/view/View;->getHeight()I

    move-result v11

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move v12, v5

    invoke-virtual/range {v9 .. v14}, Lblb;->k(Landroid/content/res/Resources;IIJ)I

    move-result v5

    :cond_12b
    if-nez v6, :cond_132

    if-nez v5, :cond_132

    iput-wide v7, v0, Lflb;->E:J

    goto :goto_171

    :cond_132
    iget-wide v9, v0, Lflb;->E:J

    cmp-long v7, v9, v7

    if-nez v7, :cond_13a

    iput-wide v3, v0, Lflb;->E:J

    :cond_13a
    invoke-virtual {v1, v6, v5}, Landroid/view/View;->scrollBy(II)V

    iget-object v1, v0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v0, Lflb;->N:[I

    invoke-virtual {v1, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    iget-object v1, v0, Lflb;->M:[F

    aget v4, v1, v2

    aget v2, v3, v2

    int-to-float v2, v2

    sub-float/2addr v4, v2

    aget v1, v1, v15

    aget v2, v3, v15

    int-to-float v2, v2

    sub-float/2addr v1, v2

    iget v2, v0, Lflb;->s:I

    invoke-virtual {v0, v2, v4, v1}, Lflb;->u(IFF)V

    iget-object v1, v0, Lflb;->q:Lblb;

    iget-object v2, v0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v2}, Lblb;->q(Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object v1, v0, Lflb;->c:Landroidx/recyclerview/widget/i;

    if-eqz v1, :cond_165

    invoke-virtual {v0, v1}, Lflb;->q(Landroidx/recyclerview/widget/i;)V

    :cond_165
    iget-object v1, v0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v0, Lflb;->w:Lwkb;

    invoke-virtual {v1, v2}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, v0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :cond_171
    :goto_171
    return-void

    :pswitch_data_172
    .packed-switch 0x0
        :pswitch_1c
    .end packed-switch
.end method
