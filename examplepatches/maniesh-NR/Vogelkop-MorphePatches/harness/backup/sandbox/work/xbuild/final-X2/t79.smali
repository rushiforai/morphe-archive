.class public final Lt79;
.super Lk8;
.source "SourceFile"


# instance fields
.field public final synthetic o:B

.field public final p:I

.field public final q:I

.field public final r:I

.field public final s:I

.field public final t:I


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/GridLayoutManager;IIIIIB)V
    .registers 9

    iput-byte p8, p0, Lt79;->o:B

    packed-switch p8, :pswitch_data_24

    invoke-direct {p0, p1, p2}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput p3, p0, Lt79;->p:I

    iput p4, p0, Lt79;->q:I

    iput p5, p0, Lt79;->r:I

    iput p6, p0, Lt79;->s:I

    iput p7, p0, Lt79;->t:I

    return-void

    :pswitch_13
    invoke-direct {p0, p1, p2}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput p3, p0, Lt79;->p:I

    iput p4, p0, Lt79;->q:I

    iput p5, p0, Lt79;->r:I

    iput p6, p0, Lt79;->s:I

    iput p7, p0, Lt79;->t:I

    invoke-virtual {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I

    return-void

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_13
    .end packed-switch
.end method


# virtual methods
.method public final T(I)Landroid/graphics/Rect;
    .registers 13

    iget-byte v0, p0, Lt79;->o:B

    iget v1, p0, Lt79;->q:I

    iget v2, p0, Lt79;->s:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_f0

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget-object v5, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v5, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5}, Landroid/view/View;->getLayoutDirection()I

    move-result v6

    if-nez v6, :cond_1c

    move v6, v3

    goto :goto_1d

    :cond_1c
    move v6, v4

    :goto_1d
    xor-int/2addr v6, v3

    invoke-virtual {p0, p1, v6}, Lt79;->u0(IZ)I

    move-result v6

    iput v6, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {v5}, Landroid/view/View;->getLayoutDirection()I

    move-result v5

    if-eqz v5, :cond_2b

    move v3, v4

    :cond_2b
    invoke-virtual {p0, p1, v3}, Lt79;->u0(IZ)I

    move-result v3

    iput v3, v0, Landroid/graphics/Rect;->right:I

    iget-object v3, p0, Lk8;->b:Ljava/lang/Object;

    check-cast v3, Landroidx/recyclerview/widget/GridLayoutManager;

    iget-object v5, v3, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    iget v3, v3, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    invoke-virtual {v5, p1, v3}, Ltx7;->d(II)I

    move-result v3

    if-nez v3, :cond_40

    move v4, v2

    :cond_40
    iput v4, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0, p1}, Lk8;->Z(I)Z

    move-result p0

    if-eqz p0, :cond_49

    move v1, v2

    :cond_49
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    return-object v0

    :pswitch_4c
    iget-object v0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;

    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iget-object v6, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v6, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v6}, Landroid/view/View;->getLayoutDirection()I

    move-result v7

    iget v8, p0, Lt79;->p:I

    iget v9, p0, Lt79;->r:I

    if-nez v7, :cond_7a

    invoke-virtual {p0}, Lk8;->b0()Z

    move-result v7

    if-eqz v7, :cond_6e

    invoke-virtual {p0, p1, v4}, Lt79;->t0(IZ)I

    move-result v7

    goto :goto_8e

    :cond_6e
    iget-object v7, v0, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    iget v10, v0, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    invoke-virtual {v7, p1, v10}, Ltx7;->d(II)I

    move-result v7

    if-eqz v7, :cond_8b

    move v7, v8

    goto :goto_8e

    :cond_7a
    invoke-virtual {p0}, Lk8;->b0()Z

    move-result v7

    if-eqz v7, :cond_85

    invoke-virtual {p0, p1, v3}, Lt79;->t0(IZ)I

    move-result v7

    goto :goto_8e

    :cond_85
    invoke-virtual {p0, p1}, Lk8;->Z(I)Z

    move-result v7

    if-eqz v7, :cond_8d

    :cond_8b
    move v7, v9

    goto :goto_8e

    :cond_8d
    move v7, v4

    :goto_8e
    iput v7, v5, Landroid/graphics/Rect;->left:I

    invoke-virtual {v6}, Landroid/view/View;->getLayoutDirection()I

    move-result v6

    if-nez v6, :cond_a9

    invoke-virtual {p0}, Lk8;->b0()Z

    move-result v6

    if-eqz v6, :cond_a1

    invoke-virtual {p0, p1, v3}, Lt79;->t0(IZ)I

    move-result v9

    goto :goto_c0

    :cond_a1
    invoke-virtual {p0, p1}, Lk8;->Z(I)Z

    move-result v3

    if-nez v3, :cond_c0

    move v9, v4

    goto :goto_c0

    :cond_a9
    invoke-virtual {p0}, Lk8;->b0()Z

    move-result v3

    if-eqz v3, :cond_b4

    invoke-virtual {p0, p1, v4}, Lt79;->t0(IZ)I

    move-result v8

    goto :goto_bf

    :cond_b4
    iget-object v3, v0, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    iget v6, v0, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    invoke-virtual {v3, p1, v6}, Ltx7;->d(II)I

    move-result v3

    if-nez v3, :cond_bf

    move v8, v9

    :cond_bf
    :goto_bf
    move v9, v8

    :cond_c0
    :goto_c0
    iput v9, v5, Landroid/graphics/Rect;->right:I

    invoke-virtual {p0}, Lk8;->b0()Z

    move-result v3

    if-eqz v3, :cond_d4

    iget-object v3, v0, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    iget v0, v0, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    invoke-virtual {v3, p1, v0}, Ltx7;->d(II)I

    move-result v0

    if-nez v0, :cond_d8

    move v4, v2

    goto :goto_d8

    :cond_d4
    invoke-virtual {p0, p1}, Lt79;->v0(I)I

    move-result v4

    :cond_d8
    :goto_d8
    iput v4, v5, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0}, Lk8;->b0()Z

    move-result v0

    if-eqz v0, :cond_e8

    invoke-virtual {p0, p1}, Lk8;->Z(I)Z

    move-result p0

    if-eqz p0, :cond_ec

    move v1, v2

    goto :goto_ec

    :cond_e8
    invoke-virtual {p0, p1}, Lt79;->v0(I)I

    move-result v1

    :cond_ec
    :goto_ec
    iput v1, v5, Landroid/graphics/Rect;->bottom:I

    return-object v5

    nop

    :pswitch_data_f0
    .packed-switch 0x0
        :pswitch_4c
    .end packed-switch
.end method

.method public final s0()I
    .registers 5

    invoke-virtual {p0}, Lk8;->b0()Z

    move-result v0

    iget-object v1, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    iget v2, p0, Lt79;->t:I

    if-eqz v0, :cond_28

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v0, v3

    invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    div-int/2addr v0, v2

    iget v1, p0, Lt79;->r:I

    shl-int/lit8 v1, v1, 0x1

    add-int/lit8 v3, v2, -0x1

    iget p0, p0, Lt79;->p:I

    mul-int/2addr v3, p0

    add-int/2addr v3, v1

    div-int/2addr v3, v2

    :goto_26
    sub-int/2addr v0, v3

    return v0

    :cond_28
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    sub-int/2addr v0, v3

    invoke-virtual {v1}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    div-int/2addr v0, v2

    iget v1, p0, Lt79;->s:I

    shl-int/lit8 v1, v1, 0x1

    add-int/lit8 v3, v2, -0x1

    iget p0, p0, Lt79;->q:I

    mul-int/2addr v3, p0

    add-int/2addr v3, v1

    div-int/2addr v3, v2

    goto :goto_26
.end method

.method public final t0(IZ)I
    .registers 10

    iget-object v0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;

    iget v1, v0, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    iget v2, p0, Lt79;->t:I

    div-int/2addr v1, v2

    iget-object v3, v0, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    invoke-virtual {v3, p1}, Ltx7;->f(I)I

    move-result v3

    iget-object v4, v0, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    iget v5, v0, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    invoke-virtual {v4, p1, v5}, Ltx7;->e(II)I

    move-result p1

    iget v4, p0, Lt79;->r:I

    shl-int/lit8 v5, v4, 0x1

    add-int/lit8 v6, v2, -0x1

    iget p0, p0, Lt79;->p:I

    mul-int/2addr v6, p0

    add-int/2addr v6, v5

    div-int/2addr v6, v2

    sub-int/2addr p0, v6

    if-eqz p2, :cond_2a

    iget p2, v0, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    sub-int/2addr p2, p1

    sub-int p1, p2, v3

    :cond_2a
    invoke-static {p0, p1, v1, v4}, Lv0g;->h(IIII)I

    move-result p0

    return p0
.end method

.method public final u0(IZ)I
    .registers 10

    iget-object v0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;

    iget v1, v0, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    iget v2, p0, Lt79;->t:I

    div-int/2addr v1, v2

    iget-object v3, v0, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    invoke-virtual {v3, p1}, Ltx7;->f(I)I

    move-result v3

    iget-object v4, v0, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    iget v5, v0, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    invoke-virtual {v4, p1, v5}, Ltx7;->e(II)I

    move-result p1

    iget-object v4, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v4, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    invoke-virtual {v4}, Landroid/view/View;->getPaddingLeft()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {v4}, Landroid/view/View;->getPaddingRight()I

    move-result v4

    sub-int/2addr v5, v4

    iget v4, p0, Lt79;->r:I

    mul-int/lit8 v6, v4, -0x2

    div-int/2addr v5, v2

    add-int/2addr v5, v6

    iget p0, p0, Lt79;->p:I

    sub-int/2addr v5, p0

    add-int/lit8 v2, v2, -0x1

    div-int/2addr v5, v2

    if-eqz p2, :cond_3c

    iget p0, v0, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    sub-int/2addr p0, p1

    sub-int p1, p0, v3

    :cond_3c
    invoke-static {v5, p1, v1, v4}, Lv0g;->h(IIII)I

    move-result p0

    return p0
.end method

.method public final v0(I)I
    .registers 7

    iget-object v0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;

    iget v1, v0, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    iget v2, p0, Lt79;->t:I

    div-int v3, v1, v2

    iget-object v0, v0, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    invoke-virtual {v0, p1, v1}, Ltx7;->e(II)I

    move-result p1

    iget v0, p0, Lt79;->s:I

    shl-int/lit8 v1, v0, 0x1

    add-int/lit8 v4, v2, -0x1

    iget p0, p0, Lt79;->q:I

    mul-int/2addr v4, p0

    add-int/2addr v4, v1

    div-int/2addr v4, v2

    sub-int/2addr p0, v4

    mul-int/2addr p0, p1

    div-int/2addr p0, v3

    add-int/2addr p0, v0

    return p0
.end method
