.class public final Lqv8;
.super Lka2;
.source "SourceFile"


# instance fields
.field public final e:Ltx7;

.field public f:I

.field public g:Landroid/graphics/drawable/ShapeDrawable;

.field public final synthetic h:B


# direct methods
.method public constructor <init>(Landroid/graphics/Point;ILtx7;B)V
    .registers 5

    iput-byte p4, p0, Lqv8;->h:B

    invoke-direct {p0, p1, p2}, Lka2;-><init>(Landroid/graphics/Point;I)V

    iput-object p3, p0, Lqv8;->e:Ltx7;

    return-void
.end method


# virtual methods
.method public final e(I)I
    .registers 3

    iget-byte v0, p0, Lqv8;->h:B

    packed-switch v0, :pswitch_data_10

    const/4 p0, 0x0

    return p0

    :pswitch_7
    iget-object v0, p0, Lqv8;->e:Ltx7;

    iget-byte p0, p0, Lka2;->b:B

    invoke-virtual {v0, p1, p0}, Ltx7;->e(II)I

    move-result p0

    return p0

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_7
    .end packed-switch
.end method

.method public final g(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;Lwa2;)Z
    .registers 6

    iget-byte v0, p0, Lqv8;->h:B

    packed-switch v0, :pswitch_data_44

    invoke-virtual {p0, p1, p2, p3, p4}, Lqv8;->i(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;Lwa2;)Z

    move-result p0

    return p0

    :pswitch_a
    invoke-virtual {p0, p1, p2, p3, p4}, Lqv8;->i(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;Lwa2;)Z

    move-result p4

    const/4 v0, 0x0

    if-eqz p4, :cond_42

    invoke-virtual {p0, p1, p2, p3}, Lqv8;->h(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_42

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object p1

    instance-of p3, p1, Llx8;

    if-eqz p3, :cond_26

    check-cast p1, Llx8;

    invoke-virtual {p1}, Llx8;->b0()I

    move-result p1

    goto :goto_27

    :cond_26
    move p1, v0

    :goto_27
    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object p0

    instance-of p2, p0, Llx8;

    if-eqz p2, :cond_36

    check-cast p0, Llx8;

    invoke-virtual {p0}, Llx8;->b0()I

    move-result p0

    goto :goto_37

    :cond_36
    move p0, v0

    :goto_37
    const/4 p2, 0x2

    const/4 p3, 0x1

    if-eq p1, p2, :cond_41

    if-eq p0, p2, :cond_41

    if-eq p1, p3, :cond_42

    if-eq p0, p3, :cond_42

    :cond_41
    move v0, p3

    :cond_42
    return v0

    nop

    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final h(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)Landroid/view/View;
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v3

    const/4 v4, 0x0

    iget-byte v5, v0, Lka2;->b:B

    const/4 v6, 0x1

    move v9, v4

    move v8, v5

    move v7, v6

    :goto_11
    const/4 v10, 0x0

    if-gt v7, v8, :cond_8d

    add-int v11, v3, v7

    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    if-eqz v11, :cond_8a

    if-eq v5, v6, :cond_8e

    invoke-virtual {v2, v11}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v12

    instance-of v13, v12, Lab2;

    if-eqz v13, :cond_8a

    iget-object v13, v12, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    instance-of v14, v13, Ly2k;

    const/4 v15, -0x1

    if-eqz v14, :cond_3c

    check-cast v13, Ly2k;

    iget-object v13, v13, Ly2k;->e:Ldqj;

    if-nez v13, :cond_39

    move v13, v15

    goto :goto_46

    :cond_39
    iget v13, v13, Ldqj;->e:I

    goto :goto_46

    :cond_3c
    instance-of v14, v13, Lx4a;

    if-eqz v14, :cond_45

    check-cast v13, Lx4a;

    iget v13, v13, Lx4a;->e:I

    goto :goto_46

    :cond_45
    move v13, v4

    :goto_46
    if-ltz v13, :cond_8d

    if-nez v13, :cond_56

    iget-object v14, v12, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v14}, Landroid/view/View;->getHeight()I

    move-result v14

    if-nez v14, :cond_54

    add-int/2addr v8, v5

    goto :goto_8a

    :cond_54
    add-int/lit8 v9, v9, 0x1

    :cond_56
    if-eqz v9, :cond_8a

    if-gt v9, v6, :cond_8d

    check-cast v12, Lab2;

    invoke-virtual {v12}, Lab2;->U()I

    move-result v12

    if-ne v12, v15, :cond_63

    move v12, v5

    :cond_63
    if-ne v12, v6, :cond_8e

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v12

    iget-object v12, v12, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    instance-of v14, v12, Ly2k;

    if-eqz v14, :cond_7c

    check-cast v12, Ly2k;

    iget-object v12, v12, Ly2k;->e:Ldqj;

    if-eqz v12, :cond_86

    iget v15, v12, Ldqj;->e:I

    goto :goto_86

    :cond_7c
    instance-of v14, v12, Lx4a;

    if-eqz v14, :cond_85

    check-cast v12, Lx4a;

    iget v15, v12, Lx4a;->e:I

    goto :goto_86

    :cond_85
    move v15, v4

    :cond_86
    :goto_86
    if-ltz v15, :cond_8d

    if-eq v15, v13, :cond_8e

    :cond_8a
    :goto_8a
    add-int/lit8 v7, v7, 0x1

    goto :goto_11

    :cond_8d
    move-object v11, v10

    :cond_8e
    if-nez v11, :cond_91

    return-object v10

    :cond_91
    move-object/from16 v1, p3

    invoke-virtual {v0, v11, v2, v1}, Lka2;->f(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)Lwa2;

    move-result-object v1

    iget-boolean v2, v1, Lwa2;->d:Z

    iget-object v0, v0, Lka2;->d:Ljava/util/ArrayList;

    if-eqz v2, :cond_a1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v10

    :cond_a1
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v11
.end method

.method public final i(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;Lwa2;)Z
    .registers 5

    iget-boolean p4, p4, Lwa2;->c:Z

    if-eqz p4, :cond_c

    invoke-virtual {p0, p1, p2, p3}, Lqv8;->h(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public final onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 13

    iget-object v0, p2, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    if-eqz v0, :cond_a6

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lqv8;->g:Landroid/graphics/drawable/ShapeDrawable;

    if-nez v1, :cond_25

    new-instance v1, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v2, Landroid/graphics/drawable/shapes/RectShape;

    invoke-direct {v2}, Landroid/graphics/drawable/shapes/RectShape;-><init>()V

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v2, v3}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicHeight(I)V

    iput-object v1, p0, Lqv8;->g:Landroid/graphics/drawable/ShapeDrawable;

    :cond_25
    invoke-virtual {v1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v1

    const v2, 0x7f060123

    invoke-virtual {v0, v2}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lqv8;->g:Landroid/graphics/drawable/ShapeDrawable;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_3d
    if-ge v2, v1, :cond_a6

    invoke-virtual {p2, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v3, p2, p3}, Lka2;->f(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)Lwa2;

    move-result-object v4

    invoke-virtual {p0, v3, p2, p3, v4}, Lqv8;->g(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;Lwa2;)Z

    move-result v5

    iget-object v6, p0, Lka2;->d:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz v5, :cond_a3

    invoke-virtual {p0, v3, p2, p3}, Lqv8;->h(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_a3

    invoke-virtual {p0, v3, p2, p3}, Lka2;->f(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)Lwa2;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v5, p0, Lka2;->c:Landroid/graphics/Rect;

    invoke-static {v5, v3}, Landroidx/recyclerview/widget/RecyclerView;->V(Landroid/graphics/Rect;Landroid/view/View;)V

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v3}, Landroid/view/View;->getTranslationY()F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    add-int/2addr v6, v5

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    sub-int v5, v6, v5

    const/high16 v7, 0x437f0000    # 255.0f

    invoke-virtual {v3}, Landroid/view/View;->getAlpha()F

    move-result v8

    mul-float/2addr v8, v7

    float-to-int v7, v8

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v7

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    move-result v3

    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    if-nez v7, :cond_9d

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    :cond_9d
    invoke-virtual {v0, v7, v5, v3, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_a3
    add-int/lit8 v2, v2, 0x1

    goto :goto_3d

    :cond_a6
    return-void
.end method
