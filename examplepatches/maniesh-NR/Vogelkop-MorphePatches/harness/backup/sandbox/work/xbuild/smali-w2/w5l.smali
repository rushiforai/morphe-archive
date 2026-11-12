.class public final synthetic Lw5l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lz5l;


# direct methods
.method public synthetic constructor <init>(Lz5l;B)V
    .registers 3

    iput-byte p2, p0, Lw5l;->a:B

    iput-object p1, p0, Lw5l;->b:Lz5l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 21

    move-object/from16 v0, p0

    iget-byte v1, v0, Lw5l;->a:B

    iget-object v2, v0, Lw5l;->b:Lz5l;

    packed-switch v1, :pswitch_data_25c

    move-object/from16 v0, p1

    check-cast v0, Lp6l;

    invoke-virtual {v2}, Lz5l;->a()V

    return-void

    :pswitch_11
    move-object/from16 v0, p1

    check-cast v0, Lesi;

    invoke-virtual {v2}, Lz5l;->a()V

    return-void

    :pswitch_19
    move-object/from16 v1, p1

    check-cast v1, Ly5l;

    iget-object v4, v0, Lw5l;->b:Lz5l;

    iget-object v0, v4, Lz5l;->z:Lzc3;

    iget-object v10, v4, Lz5l;->v:Lx2l;

    iget-object v11, v4, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v10, Lx2l;->o:Lo2l;

    iget-object v2, v2, Lo2l;->e:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb2l;

    new-instance v3, Lg6n;

    invoke-direct {v3, v11}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v3}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v12, -0x1

    const v5, 0x7f7fffff    # Float.MAX_VALUE

    move v6, v12

    move v7, v6

    :goto_3e
    move-object v8, v3

    check-cast v8, Lh6n;

    invoke-virtual {v8}, Lh6n;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_ff

    invoke-virtual {v8}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/View;

    invoke-virtual {v11, v8}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v8

    invoke-virtual {v8}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v9

    if-eq v9, v12, :cond_fc

    instance-of v9, v8, Lh5l;

    if-eqz v9, :cond_9a

    move-object v13, v8

    check-cast v13, Lh5l;

    invoke-virtual {v13}, Lh5l;->X()Ljava/util/List;

    move-result-object v14

    check-cast v14, Ljava/lang/Iterable;

    instance-of v15, v14, Ljava/util/Collection;

    if-eqz v15, :cond_71

    move-object v15, v14

    check-cast v15, Ljava/util/Collection;

    invoke-interface {v15}, Ljava/util/Collection;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_8e

    :cond_71
    invoke-interface {v14}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_75
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_8e

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lb2l;

    move-object/from16 v12, v16

    check-cast v12, Ld7l;

    iget-object v12, v12, Ld7l;->j:Le7l;

    invoke-interface {v12}, Lb9l;->isActive()Z

    move-result v12

    if-eqz v12, :cond_75

    goto :goto_94

    :cond_8e
    invoke-static {v14, v2}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_b1

    :goto_94
    invoke-virtual {v13}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v6

    :cond_98
    move v12, v6

    goto :goto_103

    :cond_9a
    instance-of v12, v8, Ljal;

    if-eqz v12, :cond_b1

    move-object v12, v8

    check-cast v12, Ljal;

    invoke-virtual {v12}, Ljal;->X()Ljava/util/List;

    move-result-object v13

    check-cast v13, Ljava/lang/Iterable;

    invoke-static {v13, v2}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_b1

    invoke-virtual {v12}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v6

    :cond_b1
    if-nez v9, :cond_b7

    instance-of v9, v8, Lh85;

    if-eqz v9, :cond_fc

    :cond_b7
    move-object v9, v8

    check-cast v9, Ljal;

    iget-object v12, v9, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getLeft()I

    move-result v12

    int-to-float v12, v12

    iget-object v13, v9, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->getWidth()I

    move-result v13

    int-to-float v13, v13

    const/high16 v14, 0x40000000    # 2.0f

    div-float/2addr v13, v14

    add-float/2addr v13, v12

    invoke-virtual {v11}, Landroid/view/View;->getWidth()I

    move-result v12

    int-to-float v12, v12

    div-float/2addr v12, v14

    sub-float/2addr v13, v12

    iget-object v12, v9, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getTop()I

    move-result v12

    int-to-float v12, v12

    iget-object v9, v9, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getHeight()I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v9, v14

    add-float/2addr v9, v12

    invoke-virtual {v11}, Landroid/view/View;->getHeight()I

    move-result v12

    int-to-float v12, v12

    div-float/2addr v12, v14

    sub-float/2addr v9, v12

    mul-float/2addr v13, v13

    mul-float/2addr v9, v9

    add-float/2addr v9, v13

    float-to-double v12, v9

    invoke-static {v12, v13}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v12

    double-to-float v9, v12

    cmpg-float v12, v9, v5

    if-gez v12, :cond_fc

    invoke-virtual {v8}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v7

    move v5, v9

    :cond_fc
    const/4 v12, -0x1

    goto/16 :goto_3e

    :cond_ff
    move v5, v12

    if-ne v6, v5, :cond_98

    move v12, v7

    :goto_103
    iget-object v13, v1, Ly5l;->a:Leyj;

    iget-object v1, v1, Ly5l;->b:Lb3c;

    iget v2, v13, Leyj;->c:I

    iget v14, v13, Leyj;->s:I

    invoke-virtual {v11}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    iget v5, v13, Leyj;->c:I

    invoke-virtual {v11}, Landroid/view/View;->getPaddingBottom()I

    move-result v6

    invoke-virtual {v11, v2, v3, v5, v6}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v15, 0x2

    const/4 v3, 0x3

    const/4 v5, 0x1

    if-eqz v2, :cond_1a5

    if-eq v2, v5, :cond_16f

    if-eq v2, v15, :cond_151

    if-ne v2, v3, :cond_14c

    new-instance v10, Lcom/opera/android/tabui2/TabBarLayoutManager;

    invoke-virtual {v11}, Landroid/view/View;->getContext()Landroid/content/Context;

    new-instance v2, Lj1k;

    const/4 v8, 0x0

    const/16 v9, 0xd

    const/4 v3, 0x0

    move v7, v5

    const-class v5, Lz5l;

    const-string v6, "onLayoutUpdated"

    move/from16 v17, v7

    const-string v7, "onLayoutUpdated()V"

    move/from16 v15, v17

    invoke-direct/range {v2 .. v9}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v3, Ls5l;

    invoke-direct {v3, v4, v15}, Ls5l;-><init>(Lz5l;B)V

    invoke-direct {v10, v14, v2, v3}, Lcom/opera/android/tabui2/TabBarLayoutManager;-><init>(ILj1k;Ls5l;)V

    :goto_148
    move-object/from16 v17, v1

    goto/16 :goto_1be

    :cond_14c
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_25a

    :cond_151
    new-instance v10, Lcom/opera/android/tabui2/TabListLayoutManager;

    invoke-virtual {v11}, Landroid/view/View;->getContext()Landroid/content/Context;

    new-instance v2, Lj1k;

    const/4 v8, 0x0

    const/16 v9, 0x10

    const/4 v3, 0x0

    const-class v5, Lz5l;

    const-string v6, "onLayoutUpdated"

    const-string v7, "onLayoutUpdated()V"

    invoke-direct/range {v2 .. v9}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v3, Ls5l;

    const/4 v6, 0x3

    invoke-direct {v3, v4, v6}, Ls5l;-><init>(Lz5l;B)V

    invoke-direct {v10, v14, v2, v3}, Lcom/opera/android/tabui2/TabListLayoutManager;-><init>(ILj1k;Ls5l;)V

    goto :goto_148

    :cond_16f
    iget-byte v2, v13, Leyj;->d:B

    new-instance v3, Lcom/opera/android/tabui2/TabGridLayoutManager;

    invoke-virtual {v11}, Landroid/view/View;->getContext()Landroid/content/Context;

    move v5, v2

    new-instance v2, Lj1k;

    const/4 v8, 0x0

    const/16 v9, 0xf

    move-object v6, v3

    const/4 v3, 0x0

    move v7, v5

    const-class v5, Lz5l;

    move-object/from16 v17, v6

    const-string v6, "onLayoutUpdated"

    move/from16 v18, v7

    const-string v7, "onLayoutUpdated()V"

    move-object/from16 v15, v17

    move-object/from16 v17, v1

    move-object v1, v15

    move/from16 v15, v18

    invoke-direct/range {v2 .. v9}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v3, Ls5l;

    const/4 v5, 0x2

    invoke-direct {v3, v4, v5}, Ls5l;-><init>(Lz5l;B)V

    invoke-direct {v1, v15, v14, v2, v3}, Lcom/opera/android/tabui2/TabGridLayoutManager;-><init>(IILj1k;Ls5l;)V

    new-instance v2, Lj4a;

    invoke-direct {v2, v1, v15, v10}, Lj4a;-><init>(Landroidx/recyclerview/widget/GridLayoutManager;ILd4a;)V

    iput-object v2, v1, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    move-object v10, v1

    goto :goto_1be

    :cond_1a5
    move-object/from16 v17, v1

    new-instance v10, Lcom/opera/android/tabui2/TabCarouselLayoutManager;

    invoke-virtual {v11}, Landroid/view/View;->getContext()Landroid/content/Context;

    new-instance v2, Lj1k;

    const/4 v8, 0x0

    const/16 v9, 0xe

    const/4 v3, 0x0

    const-class v5, Lz5l;

    const-string v6, "onLayoutUpdated"

    const-string v7, "onLayoutUpdated()V"

    invoke-direct/range {v2 .. v9}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {v10, v14, v2, v0}, Lcom/opera/android/tabui2/TabCarouselLayoutManager;-><init>(ILj1k;Lzc3;)V

    :goto_1be
    iget-object v1, v11, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    invoke-virtual {v10, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_204

    invoke-virtual {v11, v10}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object v1, v4, Lz5l;->y:Lpde;

    invoke-interface {v10}, Lq5l;->a()Ly2c;

    move-result-object v2

    invoke-virtual {v1, v2}, Lekc;->r(Ljava/lang/Object;)V

    const/4 v5, -0x1

    if-eq v12, v5, :cond_1f4

    iget-object v1, v4, Lz5l;->u:Lypd;

    iget v2, v13, Leyj;->E:I

    iget-object v1, v1, Lypd;->c:Ljava/lang/Object;

    check-cast v1, Lz5l;

    invoke-virtual {v1}, Lz5l;->b()V

    iget-object v1, v1, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v1, v12, v2}, Lexg;->z(Landroidx/recyclerview/widget/RecyclerView;II)V

    new-instance v1, Lv6c;

    const/4 v15, 0x1

    invoke-direct {v1, v15, v12}, Lv6c;-><init>(BI)V

    new-instance v2, Lt5l;

    invoke-direct {v2, v4, v15}, Lt5l;-><init>(Lz5l;B)V

    invoke-virtual {v4, v1, v2}, Lz5l;->e(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    goto :goto_21a

    :cond_1f4
    const/4 v15, 0x1

    new-instance v1, Ls5l;

    const/4 v2, 0x4

    invoke-direct {v1, v4, v2}, Ls5l;-><init>(Lz5l;B)V

    new-instance v2, Lt5l;

    invoke-direct {v2, v4, v15}, Lt5l;-><init>(Lz5l;B)V

    invoke-virtual {v4, v1, v2}, Lz5l;->e(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    goto :goto_21a

    :cond_204
    const/4 v15, 0x1

    iget-object v1, v4, Lz5l;->x:Liv;

    if-nez v1, :cond_21a

    const/4 v5, -0x1

    if-eq v12, v5, :cond_21a

    new-instance v1, Lv6c;

    invoke-direct {v1, v15, v12}, Lv6c;-><init>(BI)V

    new-instance v2, Lt5l;

    const/4 v3, 0x0

    invoke-direct {v2, v4, v3}, Lt5l;-><init>(Lz5l;B)V

    invoke-virtual {v4, v1, v2}, Lz5l;->e(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    :cond_21a
    :goto_21a
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_239

    const/4 v2, 0x0

    if-eq v1, v15, :cond_235

    const/4 v5, 0x2

    if-eq v1, v5, :cond_231

    const/4 v6, 0x3

    if-ne v1, v6, :cond_22d

    invoke-virtual {v0, v2}, Lzc3;->attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    goto :goto_25a

    :cond_22d
    invoke-static {}, Lh9o;->p()V

    goto :goto_25a

    :cond_231
    invoke-virtual {v0, v2}, Lzc3;->attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    goto :goto_25a

    :cond_235
    invoke-virtual {v0, v2}, Lzc3;->attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    goto :goto_25a

    :cond_239
    invoke-virtual {v0, v11}, Lzc3;->attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object v7, v0, Lzc3;->i:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v7, :cond_25a

    invoke-virtual {v0}, Lzc3;->y()Landroid/view/View;

    move-result-object v8

    if-eqz v8, :cond_25a

    new-instance v6, Lgyf;

    const-wide/16 v1, 0xc8

    invoke-direct {v6, v7, v1, v2}, Lgyf;-><init>(Landroid/view/View;J)V

    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    new-instance v5, Lws1;

    const/4 v10, 0x2

    move-object v9, v0

    invoke-direct/range {v5 .. v10}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v5, v7}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    :cond_25a
    :goto_25a
    return-void

    nop

    :pswitch_data_25c
    .packed-switch 0x0
        :pswitch_19
        :pswitch_11
    .end packed-switch
.end method
