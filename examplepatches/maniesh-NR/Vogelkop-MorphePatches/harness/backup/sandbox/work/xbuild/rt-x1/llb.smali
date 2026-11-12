.class public final Lllb;
.super Lglb;
.source "SourceFile"


# instance fields
.field public final C:Lilb;


# direct methods
.method public constructor <init>(Lilb;)V
    .registers 2

    invoke-direct {p0, p1}, Lglb;-><init>(Lclb;)V

    iput-object p1, p0, Lllb;->C:Lilb;

    return-void
.end method


# virtual methods
.method public final onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 22

    move-object/from16 v0, p2

    invoke-super/range {p0 .. p3}, Lglb;->onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V

    move-object/from16 v1, p0

    iget-object v1, v1, Lllb;->C:Lilb;

    iget-object v2, v1, Lilb;->e:Landroidx/recyclerview/widget/i;

    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    instance-of v4, v2, Ljal;

    const/4 v5, 0x0

    if-eqz v4, :cond_21

    move-object v4, v2

    check-cast v4, Ljal;

    new-instance v6, Lial;

    invoke-virtual {v4}, Ljal;->X()Ljava/util/List;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    invoke-direct {v6, v4}, Lial;-><init>(Ljava/lang/Iterable;)V

    goto :goto_22

    :cond_21
    move-object v6, v5

    :goto_22
    if-eqz v2, :cond_111

    if-eqz v3, :cond_111

    if-eqz v6, :cond_111

    iget-byte v4, v1, Lilb;->f:B

    const/4 v7, 0x2

    if-ne v4, v7, :cond_111

    invoke-virtual {v3}, Landroidx/recyclerview/widget/f;->getChildCount()I

    move-result v4

    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_33
    if-ge v8, v4, :cond_111

    invoke-virtual {v3, v8}, Landroidx/recyclerview/widget/f;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    if-eqz v10, :cond_ff

    iget-object v11, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-eq v10, v11, :cond_ff

    invoke-virtual {v0, v10}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v11

    if-eqz v11, :cond_ff

    instance-of v12, v11, Lklb;

    if-eqz v12, :cond_ff

    check-cast v11, Lklb;

    invoke-interface {v11, v6}, Lklb;->z(Lial;)Z

    move-result v12

    if-eqz v12, :cond_ff

    iget-object v12, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getLeft()I

    move-result v13

    iget-object v14, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v14}, Landroid/view/View;->getTranslationX()F

    move-result v14

    invoke-static {v14}, Lzed;->b(F)I

    move-result v14

    add-int/2addr v14, v13

    iget-object v13, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->getTop()I

    move-result v13

    iget-object v15, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v15}, Landroid/view/View;->getTranslationY()F

    move-result v15

    invoke-static {v15}, Lzed;->b(F)I

    move-result v15

    add-int/2addr v15, v13

    invoke-virtual {v10}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v13

    invoke-virtual {v12}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    invoke-static {v13, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_89

    move-object/from16 p1, v3

    move/from16 p3, v4

    move-object/from16 v17, v5

    :cond_87
    const/4 v4, 0x0

    goto :goto_f1

    :cond_89
    invoke-virtual {v12}, Landroid/view/View;->getWidth()I

    move-result v7

    add-int/2addr v7, v14

    invoke-virtual {v12}, Landroid/view/View;->getHeight()I

    move-result v13

    add-int/2addr v13, v15

    invoke-virtual {v10}, Landroid/view/View;->getLeft()I

    move-result v16

    invoke-virtual {v10}, Landroid/view/View;->getTranslationX()F

    move-result v17

    invoke-static/range {v17 .. v17}, Lzed;->b(F)I

    move-result v17

    add-int v0, v17, v16

    invoke-virtual {v10}, Landroid/view/View;->getTop()I

    move-result v16

    invoke-virtual {v10}, Landroid/view/View;->getTranslationY()F

    move-result v17

    invoke-static/range {v17 .. v17}, Lzed;->b(F)I

    move-result v17

    move-object/from16 p1, v3

    add-int v3, v17, v16

    invoke-virtual {v10}, Landroid/view/View;->getWidth()I

    move-result v16

    move/from16 p3, v4

    add-int v4, v16, v0

    invoke-virtual {v10}, Landroid/view/View;->getHeight()I

    move-result v16

    move-object/from16 v17, v5

    add-int v5, v16, v3

    invoke-static {v14, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {v15, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v7, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v13, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    sub-int/2addr v4, v0

    sub-int/2addr v5, v3

    if-lez v4, :cond_87

    if-lez v5, :cond_87

    invoke-virtual {v12}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {v12}, Landroid/view/View;->getHeight()I

    move-result v3

    mul-int/2addr v3, v0

    invoke-virtual {v10}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {v10}, Landroid/view/View;->getHeight()I

    move-result v7

    mul-int/2addr v7, v0

    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    move-result v0

    mul-int/2addr v4, v5

    mul-int/lit8 v4, v4, 0x64

    div-int/2addr v4, v0

    :goto_f1
    const/16 v0, 0x32

    if-le v4, v0, :cond_105

    if-le v4, v9, :cond_105

    new-instance v0, Ljlb;

    invoke-direct {v0, v6, v11, v10, v2}, Ljlb;-><init>(Lial;Lklb;Landroid/view/View;Landroidx/recyclerview/widget/i;)V

    move-object v5, v0

    move v9, v4

    goto :goto_107

    :cond_ff
    move-object/from16 p1, v3

    move/from16 p3, v4

    move-object/from16 v17, v5

    :cond_105
    move-object/from16 v5, v17

    :goto_107
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v3, p1

    move-object/from16 v0, p2

    move/from16 v4, p3

    goto/16 :goto_33

    :cond_111
    invoke-virtual {v1, v5}, Lilb;->o(Ljlb;)V

    return-void
.end method
